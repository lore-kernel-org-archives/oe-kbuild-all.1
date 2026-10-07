Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7E47276E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368744; cv=none; b=mgRO5SKhewARkSN/Pv6gcOV98GPtu3/j15ybJgXhK1LmujZL28QWoFFOZbw7kGzG3FN8kGoO18/1lLoQrAl+aJyvJAqc1kNcIik4sNB5qsGD2QzqSab8dy57nmmsFRasQLnZfeOywwVafOg6Xq3FcSsHaW+vMy3LRVt9fojMysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368744; c=relaxed/simple;
	bh=JiVuJSR/cZwAKkfK30n4gpcU4ZK1vmbudrXMMkw5dTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFNvU+OSryXVHpYVC47aYlysXBI0z5Gj6RwODMzIOzYySn3v48mhkTahCCPUqtL9L7HLkb51SnMEJJuevRX/56gIsHgzEZy3g2eqatcjVCued64RcXSF2r6zqipNTBC47Q48CLH8A6zsKcZGmmwmhAwlg9vuwgFPI2B+KyNn+fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnTe93Ro; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnTe93Ro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B281F0089B;
	Wed,  7 Oct 2026 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368735;
	bh=mKHud5iipmQD5HCF8K2fphoEinYzPs4lQcVulsh2bqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BnTe93Ro7+KMf7+6DCq3jostavjALmpF5MR7waaCqZPcpEnPHxCZKIO4eWm93VToo
	 UaBbm7INvsTLTiWFDhQmNGVvHDifer2IvVEsuwUVVhIA/hUCfbooQEpz+0WoojB6Md
	 OIADwkk07STFdu3CrY8J7QaQVBgTH3JvaiBnnwlTmr2uBz8hX5Tj11LT6eXIMXyHIH
	 17cfXZ0hUghnymMGBfaX+ObRgDV6C8sec+pZnTWXbSjSrnKQ46L8RwezrSiFpTa4/9
	 FFS+8TsyCIfku4XatZIAHKMDrc7giiB3VAlAiMFZPODXWDoUO8M99QZ0cSrPBdo3sQ
	 OwP2DLVes9+7Q==
Date: Wed, 7 Oct 2026 11:25:32 +0100
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
Message-ID: <20261007-quick-hungry-meerkat-ddca36@sudeepholla>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <20261007-predictable-interesting-mole-e02db7@sudeepholla>
 <asYMkrV8lu-LtUUR@arm.com>
 <20261007-stalwart-umber-perch-1cf23a@sudeepholla>
 <asYcrh_nBx-3Veqk@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asYcrh_nBx-3Veqk@arm.com>

On Wed, Oct 07, 2026 at 11:19:26AM +0100, Catalin Marinas wrote:
> On Wed, Oct 07, 2026 at 10:18:16AM +0100, Sudeep Holla wrote:
> > On Wed, Oct 07, 2026 at 10:10:42AM +0100, Catalin Marinas wrote:
> > > On Wed, Oct 07, 2026 at 09:44:29AM +0100, Sudeep Holla wrote:
> > > > diff --git i/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
> > > > index afc2e4d602ba..dfbd04c8eeac 100644
> > > > --- i/drivers/firmware/smccc/smccc.c
> > > > +++ w/drivers/firmware/smccc/smccc.c
> > > > @@ -116,8 +116,7 @@ static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smcc
> > > >         if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> > > >                 return false;
> > > > 
> > > > -       arm_smccc_1_1_invoke(smccc_dev->func_id,
> > > > -                            0, 0, 0, 0, 0, 0, 0, &res);
> > > > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> > > 
> > > I think that's going in the right direction and works for TRNG. However,
> > > the RSI_ABI_VERSION func_id requires another argument (I think requested
> > > interface revision). We could pass (func_id, 0, &res) but I wonder
> > > whether this probe function is generic enough to always assume all
> > > arguments are 0.
> > 
> > Agreed, one other thought I had initially was to see if we can simply use
> > SMCCC_ARCH_FEATURES(FID) but the spec states
> > "Function ID of an Arm Architecture Service Function"
> > which could soon become restrictive but IIUC it is not as per the uses
> > today in this driver. We could move to that as it is purely SMCCC spec
> > and doesn't rely on other SMCCC based specs.
> 
> The spec I have around (DEN0028 1.6 G) limits arch_func_id to:
> 
> - Arm Architecture Service range:
>   0x80000000-0x8000FFFF and 0xC0000000-0xC000FFFF
> 
> - Standard Hypervisor Service range:
>   0x85000000-0x8500FFFF and 0xC5000000-0xC500FFFF
> 
> Any arch_func_id values outside of these ranges are invalid. Both
> TRNG_VERSION (0x84000050) and RSI_ABI_VERSION (0xC4000190) are Standard
> Secure Service calls, so outside those ranges. So, if I got this
> correctly, it wouldn't work in this case (or I need a newer spec).
> 

No, you are right. My bad, I assumed "Standard Secure Service" is part
of "Arm Architecture Service". I should have looked at the table. So yes,
that can't be used. That could be the reason I didn't make that suggestion
and completely forgot about the ranges. Sorry for the noise.

-- 
Regards,
Sudeep
