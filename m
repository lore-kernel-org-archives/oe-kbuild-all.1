Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A9B388369
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364305; cv=none; b=reAuW4s4DjcuOdfES2fS0fmXr8faZSRY1lPMkjSk3LaQXtvTG37HQO3+j+6z9RBthU5NTtlJe2zdelqjtkEo1m7fuHHDS5lwclKrfXmwdmP7OQotcyPUlpKOYSUbUd8IWzLPLkj2aBUuCZRSyYLJVNlnRmNLthTGZCMCaWc3ZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364305; c=relaxed/simple;
	bh=Ma/eGhLHKPw2aRVBf3m7aFXUtYb+WZk3FHeLSCsDvfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0erNRGChdZQ4OgLFk1vzUA1rfiYMFah+VDs9KKPs3Xv8UGlAnhmcVgeuDadB6Pxf4hWPkBszqkh5QfGMFCMQgXVwLAawbet8f8BHJ8TwBF7dpa5BjqUzGdGI/gaMEbdQaR/3xHojKXerjhcWiC37Se+eY7ICQrmGLF4fxaWT9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GU7xappG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GU7xappG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7DB152B;
	Wed,  7 Oct 2026 02:10:42 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B8243F763;
	Wed,  7 Oct 2026 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791364246; bh=Ma/eGhLHKPw2aRVBf3m7aFXUtYb+WZk3FHeLSCsDvfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GU7xappGDc73UC9baEbOXWGtK6eqEepqd8QCDu542kYrSgRHHQqgDE7HB8U1ah6C8
	 WsNvyytBZ8Iy4GG639RKmdjmUTzdsbuyBdjNaWUWqTbLd0V10mPaGizW6JNQswtOcs
	 MFIYAw9mGnGbKK+QEQfkCqmtFsBXiUn7owwbPL5E=
Date: Wed, 7 Oct 2026 10:10:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
Message-ID: <asYMkrV8lu-LtUUR@arm.com>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <20261007-predictable-interesting-mole-e02db7@sudeepholla>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-predictable-interesting-mole-e02db7@sudeepholla>

On Wed, Oct 07, 2026 at 09:44:29AM +0100, Sudeep Holla wrote:
> On Wed, Oct 07, 2026 at 12:28:54PM +0530, Aneesh Kumar K.V wrote:
> > kernel test robot <lkp@intel.com> writes:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
> > > commit: d8263a131bb05398faa72ac32be54a03e48fa197 [8264/14724] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
> > > config: arm-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/config)
> > > compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    drivers/firmware/smccc/smccc.c: In function 'smccc_devices_init':
> > >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
> > >     }
> > >     ^
> > >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
> > >
> > >
> > > vim +141 drivers/firmware/smccc/smccc.c
> > >
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  122) 
> > > b83c2d92be719bf Andre Przywara         2021-07-31  123  static int __init smccc_devices_init(void)
> > > b83c2d92be719bf Andre Przywara         2021-07-31  124  {
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  125) 	struct arm_smccc_device *sdev;
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  126) 	const struct smccc_device_info *smccc_dev;
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  127) 
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  128) 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  129) 		smccc_dev = &smccc_devices[i];
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  130) 
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  131) 		if (!smccc_probe_smccc_device(smccc_dev))
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  132) 			continue;
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  133) 
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  134) 		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  135) 		if (IS_ERR(sdev))
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  136) 			pr_err("%s: could not register device: %pe\n",
> > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  137) 			       smccc_dev->device_name, sdev);
> > > b83c2d92be719bf Andre Przywara         2021-07-31  138  	}
> > > b83c2d92be719bf Andre Przywara         2021-07-31  139  
> > > b83c2d92be719bf Andre Przywara         2021-07-31  140  	return 0;
> > > b83c2d92be719bf Andre Przywara         2021-07-31 @141  }
> > 
> > This is with:
> > 
> > CONFIG_ARM_THUMB=y
> > CONFIG_ARM_THUMBEE=y
> > 
> > where there are restrictions on the use of r7. IMHO, this needs to be
> > addressed in the implementation of arm_smccc_1_1_invoke(), rather than
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

I think that's going in the right direction and works for TRNG. However,
the RSI_ABI_VERSION func_id requires another argument (I think requested
interface revision). We could pass (func_id, 0, &res) but I wonder
whether this probe function is generic enough to always assume all
arguments are 0.

-- 
Catalin
