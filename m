Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9F46AA76
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366426; cv=none; b=YF8JoA7PE6IGZswjWcg4FHi+IwLL7avfjOtl5ayyG43F6InUak/4Js2NG26FEDNi3ANHEgWhu8VCgDjWQo+QI7WT/e93rX6RUFd55Hu5G/+YdYvUsTgOkF/MUc2VIDlIszmq5yJ5Fcwn/3Ar81zjqMfFrydKNOrB2ektp+tu6uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366426; c=relaxed/simple;
	bh=sq6MMuzthiVex60Oh7lgvrRXRkq4C3DfZdfyvfuUs8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xrb7yZG+5DROxTorZu41odlsitkFXDpnP74DaSTUtCZlw/uDdX7wlsbgMiPufbKqcvYo9BnbWucCYJrSbSXoVqMYfYL3cBvYFJfNrX/bLAX9KRx5JKFv3a3Tv/Jteulbaf62UYtjC8oKBQSy0wyjoZWVDFLiwf6hp9pfy2sL/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjFkzxpx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjFkzxpx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE1C1F0089B;
	Wed,  7 Oct 2026 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366416;
	bh=sFrhw8vlrPAeRHYBol7MtEs/j/W58qrPlH8FywK9TeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KjFkzxpxNYahJjh1Q4Ep0c6hZFDYzkmcHhXtqjJSgsVoon7YV46W7MfhBJ6fS9zw6
	 P79mGsGEVdXkrNmlIgQmyqaUWhio4IpujFuDK/kyop26w9unt833bfhK97mK8O0rTB
	 qKMSe5jyV2ghIwowUxIgEMvNosR+/H5Mxm0jFk5gCKf3nx2qZZ9xsGnmherydxiIO+
	 dMvMvK9INg1+5ec72NNZyLFL1MRmgo9Dw6fhmQyVEq0GCc2ifNW8vXiWV7RYh1ENXn
	 xAkEMSe47WjPqJB5P6eJIG1WMHqDzTz8GuIuYbbf28YsLfT8yyxC93rL6PYCnqZUgH
	 kZibAdXXQ7m3Q==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
In-Reply-To: <asYMkrV8lu-LtUUR@arm.com>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <20261007-predictable-interesting-mole-e02db7@sudeepholla>
 <asYMkrV8lu-LtUUR@arm.com>
Date: Wed, 07 Oct 2026 15:16:50 +0530
Message-ID: <yq5a33uh4zcl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Wed, Oct 07, 2026 at 09:44:29AM +0100, Sudeep Holla wrote:
>> On Wed, Oct 07, 2026 at 12:28:54PM +0530, Aneesh Kumar K.V wrote:
>> > kernel test robot <lkp@intel.com> writes:
>> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> > > head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
>> > > commit: d8263a131bb05398faa72ac32be54a03e48fa197 [8264/14724] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
>> > > config: arm-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/config)
>> > > compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
>> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/reproduce)
>> > >
>> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > > the same patch/commit), kindly add following tags
>> > > | Reported-by: kernel test robot <lkp@intel.com>
>> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
>> > >
>> > > All errors (new ones prefixed by >>):
>> > >
>> > >    drivers/firmware/smccc/smccc.c: In function 'smccc_devices_init':
>> > >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
>> > >     }
>> > >     ^
>> > >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
>> > >
>> > >
>> > > vim +141 drivers/firmware/smccc/smccc.c
>> > >
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  122) 
>> > > b83c2d92be719bf Andre Przywara         2021-07-31  123  static int __init smccc_devices_init(void)
>> > > b83c2d92be719bf Andre Przywara         2021-07-31  124  {
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  125) 	struct arm_smccc_device *sdev;
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  126) 	const struct smccc_device_info *smccc_dev;
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  127) 
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  128) 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  129) 		smccc_dev = &smccc_devices[i];
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  130) 
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  131) 		if (!smccc_probe_smccc_device(smccc_dev))
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  132) 			continue;
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  133) 
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  134) 		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  135) 		if (IS_ERR(sdev))
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  136) 			pr_err("%s: could not register device: %pe\n",
>> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  137) 			       smccc_dev->device_name, sdev);
>> > > b83c2d92be719bf Andre Przywara         2021-07-31  138  	}
>> > > b83c2d92be719bf Andre Przywara         2021-07-31  139  
>> > > b83c2d92be719bf Andre Przywara         2021-07-31  140  	return 0;
>> > > b83c2d92be719bf Andre Przywara         2021-07-31 @141  }
>> > 
>> > This is with:
>> > 
>> > CONFIG_ARM_THUMB=y
>> > CONFIG_ARM_THUMBEE=y
>> > 
>> > where there are restrictions on the use of r7. IMHO, this needs to be
>> > addressed in the implementation of arm_smccc_1_1_invoke(), rather than
>> 
>> We can even drop the extra arguments set 0 as it was original used in
>> TRNG or just use 4 arguments. That shouldn't impact <FEAT>_VERSION ABIs.
>> 
>> I think there is a precedent here with `SMCCC_ARCH_WORKAROUND_*` calls.
>> `__arm_smccc_1_1()` is deliberately variadic: it sets up only the input
>> registers supplied by the caller. Not sure if it is trivial to meddle with
>> the macro to handle this as workaround.
>> 
>> Regards,
>> Sudeep
>> 
>> -->8
>> 
>> diff --git i/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
>> index afc2e4d602ba..dfbd04c8eeac 100644
>> --- i/drivers/firmware/smccc/smccc.c
>> +++ w/drivers/firmware/smccc/smccc.c
>> @@ -116,8 +116,7 @@ static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smcc
>>         if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
>>                 return false;
>> 
>> -       arm_smccc_1_1_invoke(smccc_dev->func_id,
>> -                            0, 0, 0, 0, 0, 0, 0, &res);
>> +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>
> I think that's going in the right direction and works for TRNG. However,
> the RSI_ABI_VERSION func_id requires another argument (I think requested
> interface revision). We could pass (func_id, 0, &res) but I wonder
> whether this probe function is generic enough to always assume all
> arguments are 0.
>

We are only checking whether the result is SMCCC_RET_NOT_SUPPORTED. The
assumption was that the argument register values therefore did not
matter. If a function expects a value within a specific range, it may
return an error for an invalid value, but not SMCCC_RET_NOT_SUPPORTED.

We passed zeroes to avoid exposing stale register contents to components
that are not supposed to read them. In particular, if an SMC is
forwarded to a non-secure host, we do not want that host to see those
register contents. However, this concern does not apply to the two
version-query function IDs used here.

We could therefore use:

	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);

and note that this table must not contain function IDs that are
forwarded to another component. Alternatively, we can retain the
seven-argument form and fix the macro as proposed here?:

https://lore.kernel.org/all/yq5a8q49522f.fsf@kernel.org/

-aneesh
