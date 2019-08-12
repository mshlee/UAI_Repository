package www.uai.com.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;


@Service
@Aspect
public class ServiceLog {
	
	@Pointcut("execution(* www.uai.com.service..*Impl.*(..))")
	public void servletPointCut() {
		
	}
	
	@Around("servletPointCut()")
	public Object printLog(ProceedingJoinPoint pjp) {
		Object obj = null;
		System.out.println("==메소드명: "+pjp.getSignature().getName()+"시작==");
		
		try {
			//로그 출력 메소드
			obj=pjp.proceed();
		}catch(Throwable e) {
			e.printStackTrace();
		}
		
		System.out.println("==메소드명: "+pjp.getSignature().getName()+"종료==");
		
		return obj;
	}

}
