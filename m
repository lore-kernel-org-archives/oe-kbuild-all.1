Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FD145D916
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368383; cv=none; b=LfaD0q3Y8keEh8CKYtdo7Z6cbCwdi8zKjiVVV4PKIlzMhykxIaJvluaEmoaplGg1qtrgSeAWX503gcH9rxplV1MxRshR6lRyf9mKFK9lhqVzbDRfqcpNr5TvErOA7vXUJH6kjjmgIFtIV2Oqm0FXj/k5vPCIeHNqIUD4WYdV7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368383; c=relaxed/simple;
	bh=RBaGZw/wgXQ5SGavoRR631FA32SWSjUKmO9/q0EAh9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CN6mgq4Xa2CH4N5KzTj5lB4SFpvGZzp44zct1KglQMeTkYW/n1qSxaE46IHcjk2fnB31uw6X97Ta7C2RMsVKrBoZp86G32X9gYKztvVMCs+wmf02UALrGUw873rNwUVJAsqPF0NKo8Qdypu3C5t5no46b3EFq5dwdQ38e2Xehs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hGISvrv+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hGISvrv+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04D3152B;
	Wed,  7 Oct 2026 03:19:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 387D33F86F;
	Wed,  7 Oct 2026 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791368371; bh=RBaGZw/wgXQ5SGavoRR631FA32SWSjUKmO9/q0EAh9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGISvrv+WcVgUP5cealYpnJ3wYk5z+ohW6j630kdZHJYg0ss0uxBLQIqHy2DgAopC
	 Mp/5r6vySJdj829MxIQhYTlvZwyaqiWDOPQj1cNS5wGark8NxAxVUxqWnb1C7jk6rU
	 JVL+eSyfzVz6fCeBeUTIcnfA3u0oCHIu2WKmjCp0=
Date: Wed, 7 Oct 2026 11:19:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
Message-ID: <asYcrh_nBx-3Veqk@arm.com>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <20261007-predictable-interesting-mole-e02db7@sudeepholla>
 <asYMkrV8lu-LtUUR@arm.com>
 <20261007-stalwart-umber-perch-1cf23a@sudeepholla>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-stalwart-umber-perch-1cf23a@sudeepholla>

On Wed, Oct 07, 2026 at 10:18:16AM +0100, Sudeep Holla wrote:
> On Wed, Oct 07, 2026 at 10:10:42AM +0100, Catalin Marinas wrote:
> > On Wed, Oct 07, 2026 at 09:44:29AM +0100, Sudeep Holla wrote:
> > > diff --git i/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
> > > index afc2e4d602ba..dfbd04c8eeac 100644
> > > --- i/drivers/firmware/smccc/smccc.c
> > > +++ w/drivers/firmware/smccc/smccc.c
> > > @@ -116,8 +116,7 @@ static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smcc
> > >         if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> > >                 return false;
> > > 
> > > -       arm_smccc_1_1_invoke(smccc_dev->func_id,
> > > -                            0, 0, 0, 0, 0, 0, 0, &res);
> > > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> > 
> > I think that's going in the right direction and works for TRNG. However,
> > the RSI_ABI_VERSION func_id requires another argument (I think requested
> > interface revision). We could pass (func_id, 0, &res) but I wonder
> > whether this probe function is generic enough to always assume all
> > arguments are 0.
> 
> Agreed, one other thought I had initially was to see if we can simply use
> SMCCC_ARCH_FEATURES(FID) but the spec states
> "Function ID of an Arm Architecture Service Function"
> which could soon become restrictive but IIUC it is not as per the uses
> today in this driver. We could move to that as it is purely SMCCC spec
> and doesn't rely on other SMCCC based specs.

The spec I have around (DEN0028 1.6 G) limits arch_func_id to:

- Arm Architecture Service range:
  0x80000000-0x8000FFFF and 0xC0000000-0xC000FFFF

- Standard Hypervisor Service range:
  0x85000000-0x8500FFFF and 0xC5000000-0xC500FFFF

Any arch_func_id values outside of these ranges are invalid. Both
TRNG_VERSION (0x84000050) and RSI_ABI_VERSION (0xC4000190) are Standard
Secure Service calls, so outside those ranges. So, if I got this
correctly, it wouldn't work in this case (or I need a newer spec).

-- 
Catalin
