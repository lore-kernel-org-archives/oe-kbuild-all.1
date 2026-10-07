Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D180479885
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365984; cv=none; b=PbwIEiUbbBHY6Bki0BxRv3fHxHSLDQrLdjVsZM+bvjJKg7k1PsrpLveC1dtZEo8d7QdxfygwQiR4FHGahn+Pttz2PFTnXDwgWc9/lZhRbIWBhZbnTSUyBEi/tB+HkIBreTfu3jPy4zn657SI/hH8I8hx2nIXRznKvgZO6HeLZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365984; c=relaxed/simple;
	bh=E5UNKVtrsSjXxqkCsBcHYSIlhpR7+0Z5hpFKNTxdQaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dHud30DeiyL+gia7mn/BvYPpivpPeFvfYzFkNd7w84P3AeffOtE7bnFfkJ5wYNQeiyWl+MSVyWBlq8AzMyXeH9ukiUFpoYJk3PG2NZHwrQ61ZKeiLHGqARDAfCKKMsjoPl3ZVkr/m0PDsgZynw24sRqS4yC4mLA/vd00gbEcxWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WH+jwKMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WH+jwKMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6D41F0089B;
	Wed,  7 Oct 2026 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365973;
	bh=ln3yEfd78oG4GcOAzIkxO9fZy9yLCZNj6oKpJehJ2Wc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WH+jwKMxo3Wk5VpK8YkahaT8OWBB9du4iyFn5Bjjg85Gc5GUhxwmtbq+T+9sPF3Uf
	 DND81sj5+wli5uvVP80is9tDJeNvBKg8NstSII3OcKoZi/pHyvXcGe9+XFgA6jBpO3
	 +KO6yGe0qstcYKkHsVuPmG1JFflGGN6bNM7OYb06W3dU14PPNRVpU9ToZ/a0oYHIS0
	 xM/TgeZ2vNyY2lzfwcLdz6jTvZlTMmNVq8EaeTCikGLm09j3uszCAviH9JTncFiCHz
	 GVmY5yO1b4EkN3ts9rP7Ofgwk4RZ0j8Ob8plzTgVRd5dTVMoXoN7pFJGNVQaAHn+Oh
	 2tslvEAnnp7qg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
In-Reply-To: <20261007-predictable-interesting-mole-e02db7@sudeepholla>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <20261007-predictable-interesting-mole-e02db7@sudeepholla>
Date: Wed, 07 Oct 2026 15:09:27 +0530
Message-ID: <yq5a5wzd4zow.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Sudeep Holla <sudeep.holla@kernel.org> writes:

> (+ Marc, Mark)
>
> On Wed, Oct 07, 2026 at 12:28:54PM +0530, Aneesh Kumar K.V wrote:
>> kernel test robot <lkp@intel.com> writes:
>> 
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> > head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
>> > commit: d8263a131bb05398faa72ac32be54a03e48fa197 [8264/14724] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
>> > config: arm-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/config)
>> > compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
>> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/reproduce)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
>> >
>> > All errors (new ones prefixed by >>):
>> >
>> >    drivers/firmware/smccc/smccc.c: In function 'smccc_devices_init':
>> >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
>> >     }
>> >     ^
>> >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
>> >
>> >
>> > vim +141 drivers/firmware/smccc/smccc.c
>> >
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  122) 
>> > b83c2d92be719bf Andre Przywara         2021-07-31  123  static int __init smccc_devices_init(void)
>> > b83c2d92be719bf Andre Przywara         2021-07-31  124  {
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  125) 	struct arm_smccc_device *sdev;
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  126) 	const struct smccc_device_info *smccc_dev;
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  127) 
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  128) 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  129) 		smccc_dev = &smccc_devices[i];
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  130) 
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  131) 		if (!smccc_probe_smccc_device(smccc_dev))
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  132) 			continue;
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  133) 
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  134) 		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  135) 		if (IS_ERR(sdev))
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  136) 			pr_err("%s: could not register device: %pe\n",
>> > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  137) 			       smccc_dev->device_name, sdev);
>> > b83c2d92be719bf Andre Przywara         2021-07-31  138  	}
>> > b83c2d92be719bf Andre Przywara         2021-07-31  139  
>> > b83c2d92be719bf Andre Przywara         2021-07-31  140  	return 0;
>> > b83c2d92be719bf Andre Przywara         2021-07-31 @141  }
>> >
>> 
>> 
>> This is with:
>> 
>> CONFIG_ARM_THUMB=y
>> CONFIG_ARM_THUMBEE=y
>> 
>> where there are restrictions on the use of r7. IMHO, this needs to be
>> addressed in the implementation of arm_smccc_1_1_invoke(), rather than
>> worked around in this patch?
>>
>
> We can even drop the extra arguments set 0 as it was original used in
> TRNG or just use 4 arguments. That shouldn't impact <FEAT>_VERSION ABIs.
>
> I think there is a precedent here with `SMCCC_ARCH_WORKAROUND_*` calls.
> `__arm_smccc_1_1()` is deliberately variadic: it sets up only the input
> registers supplied by the caller. Not sure if it is trivial to meddle with
> the macro to handle this as workaround.
>
> Regards,
> Sudeep
>
> -->8
>
> diff --git i/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
> index afc2e4d602ba..dfbd04c8eeac 100644
> --- i/drivers/firmware/smccc/smccc.c
> +++ w/drivers/firmware/smccc/smccc.c
> @@ -116,8 +116,7 @@ static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smcc
>         if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
>                 return false;
>
> -       arm_smccc_1_1_invoke(smccc_dev->func_id,
> -                            0, 0, 0, 0, 0, 0, 0, &res);
> +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>         ret = res.a0;
>

However, we used the seven-argument form here because we do not know
which input registers a particular SMCCC function may use.

-aneesh
