Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE423270054
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740685080; cv=none; b=cr+6greJqDcM05CL2pcVHKikhSLubZ+u1BH8m7Z6CQfQO0hai8LbmTEHf9ER2r8s/qxGoFnFhBHPWLl7uviJPrraPd4++6qchMSgtQTgvAL90kwlHOonQf9tdL0YZw3ys1eJSekUHXM47s8wxO+TVZRmP10VE1qZKIqLQ44a9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740685080; c=relaxed/simple;
	bh=3XxF+YeN4r7GdyiKKeQ0Myv++moEFUKwydWnk932MvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF62kMbq9z+bedJP8DXMDRtuVlGcB1iThQbQkuQpK7DN25lHkFuCedfjfs4y9YnoeR7HI7fbbHVMYkj5ZPIM74LqM5GHMhTxwnnkpJXfblq34SvsB1kT2/lOs/ZNsxF1gPQH1esdLuipLc65C5XtYQsIqpEz4lLTy9kbTfEmMV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EA2F1516;
	Thu, 27 Feb 2025 11:38:12 -0800 (PST)
Received: from bogus (unknown [10.57.37.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EC823F673;
	Thu, 27 Feb 2025 11:37:55 -0800 (PST)
Date: Thu, 27 Feb 2025 19:37:53 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [linux-next:master 6486/6931]
 arch/arm64/boot/dts/arm/morello-sdp.dtb: /pmu: failed to match any schema
 with compatible: ['arm,rainier-pmu']
Message-ID: <20250227193753.3we54uomemc2565a@bogus>
References: <202502280141.zjKqcKEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502280141.zjKqcKEd-lkp@intel.com>

On Fri, Feb 28, 2025 at 01:25:57AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> commit: c5e22e99383a9a26cdf42355f68ff3a0ff639a6a [6486/6931] arm64: dts: morello: Add support for soc dts
> config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280141.zjKqcKEd-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> dtschema version: 2025.3.dev3+gabf9328
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280141.zjKqcKEd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280141.zjKqcKEd-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/arm/morello.dtsi:227.38-272.5: Warning (simple_bus_reg): /soc/interrupt-controller@2c010000: simple-bus unit address format error, expected "30000000"
>    arch/arm64/boot/dts/arm/morello.dtsi:296.23-313.5: Warning (simple_bus_reg): /soc/sram@45200000: simple-bus unit address format error, expected "6000000"
> >> arch/arm64/boot/dts/arm/morello-sdp.dtb: /pmu: failed to match any schema with compatible: ['arm,rainier-pmu']
> 

Thanks for the report. I happened to stumble upon this earlier this morning
and already pushed/squashed the fix.

-- 
Regards,
Sudeep
