Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AF9485945
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364736; cv=none; b=ef5Y9gxQMcNNgQQ9QeZzOumg8X3BC+QXWIn4+TXIW2wXO9IjSKCkFmM+TZabSiJFeedwfEENjWS87cgCOwT4TZJ33hwYP/uYZ3UUM2foafCBWfjb7qtHCOMIkC/7I/TcNPkDoumFE7JZs8PwJbh6XNYjiVt1NZxFgT3bYyZEoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364736; c=relaxed/simple;
	bh=8uF0oiZtoRxKupFbE87XNeuXvHtj6SHN7Bup0BQJepI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/BLXpS/d3R0eB7d6jTiCPgb3qosxtFBDZ71C4TWx43WNIwAnyqoXQGyaLvUiXfW4zXB4lFeqpokRnOfpvQ5vqdKYGpK8Vx0GG/KKy2XbnBZY7hnHC7oLyy6zGcG1Ky4S9Axh05PB0/Vx0B8G/pdlhQ5IkoqPSnXKPYDyDqnJeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwDSLGIv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwDSLGIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E002E1F0089B;
	Wed,  7 Oct 2026 09:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791364700;
	bh=XY8cO0MSK4IDz6hj9mWoxJsvnsgOLic7QFYvimQ+WHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PwDSLGIvZjfx3gMAf/BVwDvjgJIyT/OV84ej05g9/olK7/EnYZFTFpOHtSNe0k3/w
	 HlXn6Hg5HPL05ypCh3wmE7YuI1MN+yNLuLToJ91S+q3P2XO7gbe47hA6dJtgo1xBo3
	 9stb7qN5OuuKYjRW88mnsWH2zIQ68JTlrxs1qEHL3MPespZVBgb47BIJF17y9+0GKn
	 FR/w0hvDJ7SUFZ2mEdsfl1AwJU+ewXsADGwP8ucMGnRb8drvYjjsJM0Bs+impzyUwk
	 KSVJ5fzUNRMtGxvhOrDU517NKTLwgUp47FxNEPITp1Dx4Kxq0sVtBtd2viT9fZ14P9
	 p/G2iG+HwiBaQ==
Date: Wed, 7 Oct 2026 10:18:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
Message-ID: <20261007-stalwart-umber-perch-1cf23a@sudeepholla>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <20261007-predictable-interesting-mole-e02db7@sudeepholla>
 <asYMkrV8lu-LtUUR@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asYMkrV8lu-LtUUR@arm.com>

On Wed, Oct 07, 2026 at 10:10:42AM +0100, Catalin Marinas wrote:
> On Wed, Oct 07, 2026 at 09:44:29AM +0100, Sudeep Holla wrote:
> > On Wed, Oct 07, 2026 at 12:28:54PM +0530, Aneesh Kumar K.V wrote:
> > > kernel test robot <lkp@intel.com> writes:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
> > > > commit: d8263a131bb05398faa72ac32be54a03e48fa197 [8264/14724] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
> > > > config: arm-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/config)
> > > > compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >    drivers/firmware/smccc/smccc.c: In function 'smccc_devices_init':
> > > >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
> > > >     }
> > > >     ^
> > > >>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
> > > >
> > > >
> > > > vim +141 drivers/firmware/smccc/smccc.c
> > > >
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  122) 
> > > > b83c2d92be719bf Andre Przywara         2021-07-31  123  static int __init smccc_devices_init(void)
> > > > b83c2d92be719bf Andre Przywara         2021-07-31  124  {
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  125) 	struct arm_smccc_device *sdev;
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  126) 	const struct smccc_device_info *smccc_dev;
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  127) 
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  128) 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  129) 		smccc_dev = &smccc_devices[i];
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  130) 
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  131) 		if (!smccc_probe_smccc_device(smccc_dev))
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  132) 			continue;
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  133) 
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  134) 		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  135) 		if (IS_ERR(sdev))
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  136) 			pr_err("%s: could not register device: %pe\n",
> > > > d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  137) 			       smccc_dev->device_name, sdev);
> > > > b83c2d92be719bf Andre Przywara         2021-07-31  138  	}
> > > > b83c2d92be719bf Andre Przywara         2021-07-31  139  
> > > > b83c2d92be719bf Andre Przywara         2021-07-31  140  	return 0;
> > > > b83c2d92be719bf Andre Przywara         2021-07-31 @141  }
> > > 
> > > This is with:
> > > 
> > > CONFIG_ARM_THUMB=y
> > > CONFIG_ARM_THUMBEE=y
> > > 
> > > where there are restrictions on the use of r7. IMHO, this needs to be
> > > addressed in the implementation of arm_smccc_1_1_invoke(), rather than
> > 
> > We can even drop the extra arguments set 0 as it was original used in
> > TRNG or just use 4 arguments. That shouldn't impact <FEAT>_VERSION ABIs.
> > 
> > I think there is a precedent here with `SMCCC_ARCH_WORKAROUND_*` calls.
> > `__arm_smccc_1_1()` is deliberately variadic: it sets up only the input
> > registers supplied by the caller. Not sure if it is trivial to meddle with
> > the macro to handle this as workaround.
> > 
> > Regards,
> > Sudeep
> > 
> > -->8
> > 
> > diff --git i/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
> > index afc2e4d602ba..dfbd04c8eeac 100644
> > --- i/drivers/firmware/smccc/smccc.c
> > +++ w/drivers/firmware/smccc/smccc.c
> > @@ -116,8 +116,7 @@ static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smcc
> >         if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> >                 return false;
> > 
> > -       arm_smccc_1_1_invoke(smccc_dev->func_id,
> > -                            0, 0, 0, 0, 0, 0, 0, &res);
> > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> 
> I think that's going in the right direction and works for TRNG. However,
> the RSI_ABI_VERSION func_id requires another argument (I think requested
> interface revision). We could pass (func_id, 0, &res) but I wonder
> whether this probe function is generic enough to always assume all
> arguments are 0.
> 

Agreed, one other thought I had initially was to see if we can simply use
SMCCC_ARCH_FEATURES(FID) but the spec states
"Function ID of an Arm Architecture Service Function"
which could soon become restrictive but IIUC it is not as per the uses
today in this driver. We could move to that as it is purely SMCCC spec
and doesn't rely on other SMCCC based specs.

I don't recall if we discussed this angle much or if I didn't even propose
it 😢.

-- 
Regards,
Sudeep
