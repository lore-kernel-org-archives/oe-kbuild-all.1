Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEB73CE492
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 12:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924790; cv=none; b=RgRPsuqt8lAZ9U4FMvvgZ2o+aN9z0ujOAnbODvPo12GIfUc+1e7XJpdIBikYpxz8OOdLFkWj+BDKT5fQUE+ptvxwub5yjZ0te/5v1qgkQYuHiDx/DrAP8Z9bq4jjYHScjk4tlL1YZ2dHX3GufDFn713RerPK8oV/Gdv5pMwG/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924790; c=relaxed/simple;
	bh=Sydwc2FgFq75BFbs5/5H0c2TkUylRk/IV73W1jGH3fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtTpiLDhtJGbX+HVDsFN7/zbbr9kX893reWC0dxij/iHHgd3+L26WIyVbHdcZOmMKSho32gyN4QhzNZ0qBPxN9mv5OePMvTURL/PQNe5fyS8krvWY8jG5LrO9Y4JEQBkJVa2Dhxp+YKrXYkg6EZdoyGp8y+FQiL4J+bf508nYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F12FC1A25;
	Thu, 19 Mar 2026 05:53:01 -0700 (PDT)
Received: from [192.168.178.23] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50BEA3F778;
	Thu, 19 Mar 2026 05:52:39 -0700 (PDT)
Message-ID: <3645f5db-29dd-405e-82ef-643ec229879a@arm.com>
Date: Thu, 19 Mar 2026 13:52:31 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
To: kernel test robot <lkp@intel.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Salman Nabi <salman.nabi@arm.com>,
 Vedashree Vidwans <vvidwans@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com, vwadekar@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260317103336.1273582-8-andre.przywara@arm.com>
 <202603182202.gpyCz2RF-lkp@intel.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <202603182202.gpyCz2RF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/18/26 15:21, kernel test robot wrote:
> Hi Andre,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master nferre-at91/at91-next v7.0-rc4 next-20260317]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation-binding/20260318-082717
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260317103336.1273582-8-andre.przywara%40arm.com
> patch subject: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
> config: arm64-randconfig-004-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182202.gpyCz2RF-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182202.gpyCz2RF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603182202.gpyCz2RF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
>>> drivers/firmware/smccc/lfa_fw.c:878:16: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
>       878 |         return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
>           |                ^~~~~~~~~~~~~~~~~~~~~~~~~
>           |                devm_request_region
>>> drivers/firmware/smccc/lfa_fw.c:880:42: error: 'IRQF_COND_ONESHOT' undeclared (first use in this function)
>       880 |                                          IRQF_COND_ONESHOT, NULL, NULL);
>           |                                          ^~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:880:42: note: each undeclared identifier is reported only once for each function it appears in
>     drivers/firmware/smccc/lfa_fw.c:881:1: warning: control reaches end of non-void function [-Wreturn-type]
>       881 | }
>           | ^
>     cc1: some warnings being treated as errors

For the records: including <linux/interrupt.h> fixes this issue.

Thanks for the heads up, will add this in a follow-up post.

Cheers,
Andre

> 
> 
> vim +878 drivers/firmware/smccc/lfa_fw.c
> 
>     863	
>     864	static int lfa_register_dt(struct device *dev)
>     865	{
>     866		struct device_node *np;
>     867		unsigned int irq;
>     868	
>     869		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
>     870		if (!np)
>     871			return -ENODEV;
>     872	
>     873		irq = irq_of_parse_and_map(np, 0);
>     874		of_node_put(np);
>     875		if (!irq)
>     876			return -ENODEV;
>     877	
>   > 878		return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
>     879						 lfa_irq_handler_thread,
>   > 880						 IRQF_COND_ONESHOT, NULL, NULL);
>     881	}
>     882	
> 

