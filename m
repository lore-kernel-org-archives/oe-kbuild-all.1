Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB403845CB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 08:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362895; cv=none; b=HlcyErGaE3ntYVefuYcaYL5MVI8pdhWfcYwW1468eF2LoaLGC6cZCwY1QZ5epJUYjzDFhGENcbFQWOwXGzm8s3An+lkolxj23P8e97mwcB23zzOBOP5NadrVSTVZKZe8KNP2VU1Si0/rIT5M6CILvXAn5Dt5qgsLwa4cFmV73hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362895; c=relaxed/simple;
	bh=vwgkp0BAGi2rU2CySE0XlxM2bfeBU0cFnsmXWldrLZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NJpr5RmKj3slUZcgZkKpb7j0xoF+if5ts+3tC/vpaEKozEYUrM48i5bLZhXyJveylAzxOz38cLYgodyPZGvH9dN+STmlsUv6YwGehDwpkDoD+mpAIr+6oTCP6VbkJJPYGJ5cWdDN7aUnYHFwTYjaq6Yh61BJqj3a1qDmcvQE7tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpPWOPfT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpPWOPfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7149E1F0089B;
	Wed,  7 Oct 2026 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791362893;
	bh=ew4ROGsSmGN40d6U3DttvWol3sxTtt7vx2wE42YNHBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KpPWOPfTnUcppRf7OVxsZSR66XZIFvIFvh3BWfHjrkBkNssIhFNOqK///j1oHkUdp
	 gAYqCh+pObiPILJBAMXR77ejQFVHnmoNwXUQOijwaxmdkIe24i3V9bmBxZ3Dp3yrfr
	 JBy3JMAoM38TEAYrtX0kcQz3yoPJtkk5Csmbr3uWmZDTr8OFckHgk10kqtuHxwhOuP
	 yxCGKJIyagcNdw1gbuowUb4F7aK4OqIQ0Iz+YeNNIDNKvEeI/FVSReMhcdfwV2HszW
	 kmOkG4uCk0500xLEetuQtf4yb3x6g9vXUYo0//CEaDDD3GzYqHMtMBLkt4Z2FWT7Dd
	 EXOAJH2MHEs0Q==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
In-Reply-To: <yq5abj963sk1.fsf@kernel.org>
References: <202610070641.B8hxBJcf-lkp@intel.com> <yq5abj963sk1.fsf@kernel.org>
Date: Wed, 07 Oct 2026 14:18:08 +0530
Message-ID: <yq5a8q49522f.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> kernel test robot <lkp@intel.com> writes:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
>> commit: d8263a131bb05398faa72ac32be54a03e48fa197 [8264/14724] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
>> config: arm-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/config)
>> compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    drivers/firmware/smccc/smccc.c: In function 'smccc_devices_init':
>>>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
>>     }
>>     ^
>>>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
>>
>>
>> vim +141 drivers/firmware/smccc/smccc.c
>>
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  122) 
>> b83c2d92be719bf Andre Przywara         2021-07-31  123  static int __init smccc_devices_init(void)
>> b83c2d92be719bf Andre Przywara         2021-07-31  124  {
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  125) 	struct arm_smccc_device *sdev;
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  126) 	const struct smccc_device_info *smccc_dev;
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  127) 
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  128) 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  129) 		smccc_dev = &smccc_devices[i];
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  130) 
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  131) 		if (!smccc_probe_smccc_device(smccc_dev))
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  132) 			continue;
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  133) 
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  134) 		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  135) 		if (IS_ERR(sdev))
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  136) 			pr_err("%s: could not register device: %pe\n",
>> d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  137) 			       smccc_dev->device_name, sdev);
>> b83c2d92be719bf Andre Przywara         2021-07-31  138  	}
>> b83c2d92be719bf Andre Przywara         2021-07-31  139  
>> b83c2d92be719bf Andre Przywara         2021-07-31  140  	return 0;
>> b83c2d92be719bf Andre Przywara         2021-07-31 @141  }
>>
>
>
> This is with:
>
> CONFIG_ARM_THUMB=y
> CONFIG_ARM_THUMBEE=y
>
> where there are restrictions on the use of r7. IMHO, this needs to be
> addressed in the implementation of arm_smccc_1_1_invoke(), rather than
> worked around in this patch?
>

Something like this? The -fno-omit-frame-pointer compiler option is
required to reproduce the build error.

firmware: smccc: Avoid inline r7 constraints for Thumb-2 calls

The SMCCC device probe passes eight register arguments to
arm_smccc_1_1_invoke(). With GCC 8.5 and CONFIG_THUMB2_KERNEL=y, the
kernel test robot reports "r7 cannot be used in asm here" while
compiling smccc_devices_init(). The eight-input inline helpers bind
the final argument to r7, which GCC cannot allocate in this function.

Use the existing out-of-line SMC and HVC helpers for eight-input calls
on ARM32 Thumb-2. The helpers load the stack arguments into r4-r7
before entering firmware and save and restore the caller's registers.
Preserve all input arguments and provide a temporary result buffer
when the caller supplies NULL.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

1 file changed, 70 insertions(+), 3 deletions(-)
include/linux/arm-smccc.h | 73 +++++++++++++++++++++++++++++++++++++++++++++--

modified   include/linux/arm-smccc.h
@@ -640,6 +640,39 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 			*___res = (typeof(*___res)){r0, r1, r2, r3};	\
 	} while (0)
 
+#if defined(CONFIG_ARM) && defined(CONFIG_THUMB2_KERNEL)
+/*
+ * GCC may reserve r7 in Thumb-2 functions. Calls with eight inputs must
+ * therefore use the assembly helpers, which save and restore r7 themselves.
+ */
+#define __arm_smccc_1_1_out_of_line(fn, inst, a0, a1, a2, a3, a4, a5, a6, a7, res) \
+	do {\
+		struct arm_smccc_res __res;\
+		struct arm_smccc_res *__res_ptr = (res);\
+\
+		fn((u32)(a0), a1, a2, a3, a4, a5, a6, a7,\
+		   __res_ptr ? __res_ptr : &__res);\
+	} while (0)
+
+#define __arm_smccc_1_1_inline(fn, inst, ...) \
+	__arm_smccc_1_1(inst, __VA_ARGS__)
+
+#define __arm_smccc_1_1_call_2 __arm_smccc_1_1_inline
+#define __arm_smccc_1_1_call_3 __arm_smccc_1_1_inline
+#define __arm_smccc_1_1_call_4 __arm_smccc_1_1_inline
+#define __arm_smccc_1_1_call_5 __arm_smccc_1_1_inline
+#define __arm_smccc_1_1_call_6 __arm_smccc_1_1_inline
+#define __arm_smccc_1_1_call_7 __arm_smccc_1_1_inline
+#define __arm_smccc_1_1_call_8 __arm_smccc_1_1_inline
+#define __arm_smccc_1_1_call_9 __arm_smccc_1_1_out_of_line
+
+#define __arm_smccc_1_1_call(fn, inst, ...) \
+	CONCATENATE(__arm_smccc_1_1_call_, COUNT_ARGS(__VA_ARGS__))(fn, inst, __VA_ARGS__)
+#else
+#define __arm_smccc_1_1_call(fn, inst, ...) \
+	__arm_smccc_1_1(inst, __VA_ARGS__)
+#endif
+
 /*
  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
  *
@@ -654,7 +687,8 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
  * to the SMC instruction. The return values are updated with the content
  * from register 0 to 3 on return from the SMC instruction if not NULL.
  */
-#define arm_smccc_1_1_smc(...)	__arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
+#define arm_smccc_1_1_smc(...) \
+	__arm_smccc_1_1_call(arm_smccc_smc, SMCCC_SMC_INST, __VA_ARGS__)
 
 /*
  * arm_smccc_1_1_hvc() - make an SMCCC v1.1 compliant HVC call
@@ -670,14 +704,15 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
  * to the HVC instruction. The return values are updated with the content
  * from register 0 to 3 on return from the HVC instruction if not NULL.
  */
-#define arm_smccc_1_1_hvc(...)	__arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
+#define arm_smccc_1_1_hvc(...) \
+	__arm_smccc_1_1_call(arm_smccc_hvc, SMCCC_HVC_INST, __VA_ARGS__)
 
 /*
  * Like arm_smccc_1_1* but always returns SMCCC_RET_NOT_SUPPORTED.
  * Used when the SMCCC conduit is not defined. The empty asm statement
  * avoids compiler warnings about unused variables.
  */
-#define __fail_smccc_1_1(...)						\
+#define __fail_smccc_1_1_inline(...)					\
 	do {								\
 		CONCATENATE(__declare_arg_,				\
 			    COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__);	\
@@ -689,6 +724,38 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 			___res->a0 = SMCCC_RET_NOT_SUPPORTED;		\
 	} while (0)
 
+#if defined(CONFIG_ARM) && defined(CONFIG_THUMB2_KERNEL)
+#define __fail_smccc_1_1_no_regs(_a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, res) \
+	do {\
+		struct arm_smccc_res *__res_ptr = (res);\
+\
+		(void)(_a0);\
+		(void)(_a1);\
+		(void)(_a2);\
+		(void)(_a3);\
+		(void)(_a4);\
+		(void)(_a5);\
+		(void)(_a6);\
+		(void)(_a7);\
+		if (__res_ptr)\
+			__res_ptr->a0 = SMCCC_RET_NOT_SUPPORTED;\
+	} while (0)
+
+#define __fail_smccc_1_1_2 __fail_smccc_1_1_inline
+#define __fail_smccc_1_1_3 __fail_smccc_1_1_inline
+#define __fail_smccc_1_1_4 __fail_smccc_1_1_inline
+#define __fail_smccc_1_1_5 __fail_smccc_1_1_inline
+#define __fail_smccc_1_1_6 __fail_smccc_1_1_inline
+#define __fail_smccc_1_1_7 __fail_smccc_1_1_inline
+#define __fail_smccc_1_1_8 __fail_smccc_1_1_inline
+#define __fail_smccc_1_1_9 __fail_smccc_1_1_no_regs
+
+#define __fail_smccc_1_1(...) \
+	CONCATENATE(__fail_smccc_1_1_, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
+#else
+#define __fail_smccc_1_1(...)	__fail_smccc_1_1_inline(__VA_ARGS__)
+#endif
+
 /*
  * arm_smccc_1_1_invoke() - make an SMCCC v1.1 compliant call
  *

