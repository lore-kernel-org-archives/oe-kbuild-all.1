Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B9482D4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626258; cv=none; b=MzZIqiXF9cDhS8yB5EBC9eqv73Vplim2nUnDFAbFB5rQ3r60vbzICm24I1uqFWsaXfou7Rx1JeCgRubiIVlPZzX/jZWs5bDD76odjYZVDEv7GTRquCn6fPrUHx6lvtdmdyVsVmRciBeEtMgJBCZxcTx8jAVcxOHA2TYWqww7vMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626258; c=relaxed/simple;
	bh=OQu02S9aHjIygykILs5HWtEBL6n44HYxc51+/xykY84=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hoh1xWlKazA9iThBjfKn4IC5DwVSeARiesihb7+K2qvC4h4QTCHIommwDgWjiXfguEUqAHAH5yopLZ74VVojLbQddR24ejI99+YO1qX8RmlWppm1LSjOj+hpf0Io4PsBhUQFLwCNtklK5yRpJYMyEuC+CtjDytOSJNkNU7ztLh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCs3/yIu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCs3/yIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA3D1F000FF;
	Sat, 10 Oct 2026 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791626257;
	bh=3MvY1+3MhbNQNM07YfdSdXChGjsbZgSv3Sg4Cuz+7PE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kCs3/yIuPBNpHCu/eOlcWXEJzipcoSOQ460ld/5Aa2ruYFTF1Hh/bUwEl5pTQqs6U
	 zjq7FXBauaVHRwTbjnpjYU09qecGne/V/PTpn1XnEsylX6ObLM1tqtFLl+g+hwmOga
	 /5GT4OWpwyEL0ScdppQJhMstUjlshzbO7cIOax9t4NVHZnRD9G8mCQULnBwzXdlFAr
	 1UjpuzXW4IXiJ41Ss0Fnot9ncpXMv5Jm4CRn1v5vu2f3/8zKSztdJ7LSiuus++B89O
	 F+ZWjYLBBLJuSFrWoXKlmIUzuXf8XK6hSOtit6pOLb+zY71mzC65A3c2UzJXpdw+y2
	 WchLDYDUnj/Jg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
In-Reply-To: <20261009134207.GC13920@nvidia.com>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org> <yq5a8q49522f.fsf@kernel.org>
 <20261009134207.GC13920@nvidia.com>
Date: Sat, 10 Oct 2026 15:27:31 +0530
Message-ID: <yq5aik3998tw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Wed, Oct 07, 2026 at 02:18:08PM +0530, Aneesh Kumar K.V wrote:
>> @@ -640,6 +640,39 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
>>  			*___res = (typeof(*___res)){r0, r1, r2, r3};	\
>>  	} while (0)
>>  
>> +#if defined(CONFIG_ARM) && defined(CONFIG_THUMB2_KERNEL)
>> +/*
>> + * GCC may reserve r7 in Thumb-2 functions. Calls with eight inputs must
>> + * therefore use the assembly helpers, which save and restore r7 themselves.
>> + */
>> +#define __arm_smccc_1_1_out_of_line(fn, inst, a0, a1, a2, a3, a4, a5, a6, a7, res) \
>> +	do {\
>> +		struct arm_smccc_res __res;\
>> +		struct arm_smccc_res *__res_ptr = (res);\
>> +\
>> +		fn((u32)(a0), a1, a2, a3, a4, a5, a6, a7,\
>> +		   __res_ptr ? __res_ptr : &__res);\
>> +	} while (0)
>> +
>> +#define __arm_smccc_1_1_inline(fn, inst, ...) \
>> +	__arm_smccc_1_1(inst, __VA_ARGS__)
>> +
>> +#define __arm_smccc_1_1_call_2 __arm_smccc_1_1_inline
>> +#define __arm_smccc_1_1_call_3 __arm_smccc_1_1_inline
>> +#define __arm_smccc_1_1_call_4 __arm_smccc_1_1_inline
>> +#define __arm_smccc_1_1_call_5 __arm_smccc_1_1_inline
>> +#define __arm_smccc_1_1_call_6 __arm_smccc_1_1_inline
>> +#define __arm_smccc_1_1_call_7 __arm_smccc_1_1_inline
>> +#define __arm_smccc_1_1_call_8 __arm_smccc_1_1_inline
>> +#define __arm_smccc_1_1_call_9 __arm_smccc_1_1_out_of_line
>> +
>> +#define __arm_smccc_1_1_call(fn, inst, ...) \
>> +	CONCATENATE(__arm_smccc_1_1_call_, COUNT_ARGS(__VA_ARGS__))(fn, inst, __VA_ARGS__)
>> +#else
>> +#define __arm_smccc_1_1_call(fn, inst, ...) \
>> +	__arm_smccc_1_1(inst, __VA_ARGS__)
>> +#endif
>
> I wonder if this could just be something simpler like
>
> #define __arm_smccc_1_1_call(fn, inst, ...)                       \
> 	({                                                        \
> 		if (COUNT_ARGS(__VA_ARGS__) >= 7 &&               \
> 		    IS_ENABLED(CONFIG_THUMB2_KERNEL))             \
> 			__arm_smccc_1_1_call_(inst, __VA_ARGS__); \
> 		else                                              \
> 			__arm_smccc_1_1(inst, __VA_ARGS__);       \
> 	})
>
> ? (still needs to take care of the NULL res)
>

Sure with the change 
	__arm_smccc_1_1_call_(fn, __VA_ARGS__); \

But, as Catalin suggested, we can keep this simpler for this merge and
do the cleanup later.

-aneesh
