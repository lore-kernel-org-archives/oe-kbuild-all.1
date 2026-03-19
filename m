Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B013C3435
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917010; cv=none; b=EudukAXqjGCN5kaekg9iPVGrG51Cp7j+/C7ewXhJmvRUpoBG+kEK4SeFhu0vriJBuTnpyxjoAKmumosJZBcfBwA053ssyRSRziIVpFWeMMgbo6TcG6Z/3JlQKk+5/74sCgEqamhneT6w2I8LuUAEt5gYcetajKx94erWVR0UIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917010; c=relaxed/simple;
	bh=1mkrXC3RQ6SL23C6/feIRzIVGYkVFU3Pio4Lw1R1BOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrMmURHE84oOYg/3QnDH6G93tReF6VQyDntKF4xK5zp7ILianPTuxRKPZtBhGIn+X/MugefoTjXDzF0rtMcdfBBB47whNv5/LuwAEVB7v/0MssaNu5XmDjDZ4V32fvy6ppeYriIGA1Hn7+47gq7MTyOr8tMC9MvCpUXKG7dLkw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTQUYx2a; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTQUYx2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773917008; x=1805453008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1mkrXC3RQ6SL23C6/feIRzIVGYkVFU3Pio4Lw1R1BOU=;
  b=lTQUYx2a/lcFZ7jfPXuk+KPC7opJDqJ8K9B5pNjFm0FaWa1VtsglAl+0
   RlHTPk/qYq8LN9XIag1sDNX3S18wdB8gcIzDBE1bhXBR4qInRNWHc4NU3
   ebNKc8PFBaYqS1JRQ3t6l37NrOBPtjdwiFUkteruJMk9qdoOMqKC+OCHg
   ONJreqDNXPiCC/gBFG18uKohLmd2SChz8yN4anZZMshqHk9LeWhHN5hoj
   BNSZGh8FEukZ0kGjJCoks5sqX6rC3L95BGYtd6QY5FrKrYeqwdO5RC0ZZ
   8xGTTlh94e9iHRXDsNHnAyvp6N4N0gaAgFxwcwTnXjvFTJidlosGQiAv+
   g==;
X-CSE-ConnectionGUID: yog/0Y1QRjuM74oO+RalAg==
X-CSE-MsgGUID: eUTpDiH7SCC2pnCcMWL+Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86062384"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86062384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 03:43:27 -0700
X-CSE-ConnectionGUID: 6vuF5eRNRZWlpHYghl+ZMw==
X-CSE-MsgGUID: J0mrvFuhSGmhEDGiKLM8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="253401527"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Mar 2026 03:43:24 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3AqX-000000000mx-2GTd;
	Thu, 19 Mar 2026 10:43:21 +0000
Date: Thu, 19 Mar 2026 18:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Eckert <fe@dev.tdt.de>, Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>,
	Eckert.Florian@googlemail.com, ms@dev.tdt.de
Subject: Re: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
Message-ID: <202603191849.1i02oaur-lkp@intel.com>
References: <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Eckert/dt-bindings-Add-Lightning-Mountain-MSI-interrupt-controller-bindings/20260319-033849
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8%40dev.tdt.de
patch subject: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260319/202603191849.1i02oaur-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191849.1i02oaur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191849.1i02oaur-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-intel-soc-msi.c: In function 'nmi_msi_compose_msg':
   drivers/irqchip/irq-intel-soc-msi.c:138:18: error: 'apic' undeclared (first use in this function)
     138 |         destid = apic->calc_dest_apicid(cpuid);
         |                  ^~~~
   drivers/irqchip/irq-intel-soc-msi.c:138:18: note: each undeclared identifier is reported only once for each function it appears in
   drivers/irqchip/irq-intel-soc-msi.c:141:25: error: 'arch_msi_msg_addr_lo_t' {aka 'struct arch_msi_msg_addr_lo'} has no member named 'base_address'
     141 |         msg.arch_addr_lo.base_address = X86_MSI_BASE_ADDRESS_LOW;
         |                         ^
   drivers/irqchip/irq-intel-soc-msi.c:141:41: error: 'X86_MSI_BASE_ADDRESS_LOW' undeclared (first use in this function)
     141 |         msg.arch_addr_lo.base_address = X86_MSI_BASE_ADDRESS_LOW;
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-intel-soc-msi.c:142:25: error: 'arch_msi_msg_addr_lo_t' {aka 'struct arch_msi_msg_addr_lo'} has no member named 'dest_mode_logical'
     142 |         msg.arch_addr_lo.dest_mode_logical = apic->dest_mode_logical;
         |                         ^
   drivers/irqchip/irq-intel-soc-msi.c:143:25: error: 'arch_msi_msg_addr_lo_t' {aka 'struct arch_msi_msg_addr_lo'} has no member named 'redirect_hint'
     143 |         msg.arch_addr_lo.redirect_hint = 0;
         |                         ^
   drivers/irqchip/irq-intel-soc-msi.c:144:25: error: 'arch_msi_msg_addr_lo_t' {aka 'struct arch_msi_msg_addr_lo'} has no member named 'destid_0_7'
     144 |         msg.arch_addr_lo.destid_0_7 = destid & 0xFF;
         |                         ^
   drivers/irqchip/irq-intel-soc-msi.c:146:26: error: 'X86_MSI_BASE_ADDRESS_HIGH' undeclared (first use in this function)
     146 |         msg.address_hi = X86_MSI_BASE_ADDRESS_HIGH;
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-intel-soc-msi.c:152:22: error: 'arch_msi_msg_data_t' {aka 'struct arch_msi_msg_data'} has no member named 'is_level'
     152 |         msg.arch_data.is_level = 0;
         |                      ^
   drivers/irqchip/irq-intel-soc-msi.c:153:22: error: 'arch_msi_msg_data_t' {aka 'struct arch_msi_msg_data'} has no member named 'delivery_mode'
     153 |         msg.arch_data.delivery_mode = APIC_DELIVERY_MODE_NMI;
         |                      ^
   drivers/irqchip/irq-intel-soc-msi.c:153:39: error: 'APIC_DELIVERY_MODE_NMI' undeclared (first use in this function)
     153 |         msg.arch_data.delivery_mode = APIC_DELIVERY_MODE_NMI;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-intel-soc-msi.c: In function 'soc_msi_compose_msg':
   drivers/irqchip/irq-intel-soc-msi.c:164:9: error: implicit declaration of function '__irq_msi_compose_msg'; did you mean 'nmi_msi_compose_msg'? [-Wimplicit-function-declaration]
     164 |         __irq_msi_compose_msg(irqd_cfg(data), msg, false);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nmi_msi_compose_msg
   drivers/irqchip/irq-intel-soc-msi.c:164:31: error: implicit declaration of function 'irqd_cfg' [-Wimplicit-function-declaration]
     164 |         __irq_msi_compose_msg(irqd_cfg(data), msg, false);
         |                               ^~~~~~~~
   drivers/irqchip/irq-intel-soc-msi.c: In function 'soc_msi_domain_alloc':
   drivers/irqchip/irq-intel-soc-msi.c:198:31: error: storage size of 'info' isn't known
     198 |         struct irq_alloc_info info;
         |                               ^~~~
   drivers/irqchip/irq-intel-soc-msi.c:229:9: error: implicit declaration of function 'init_irq_alloc_info' [-Wimplicit-function-declaration]
     229 |         init_irq_alloc_info(&info, NULL);
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-intel-soc-msi.c:198:31: warning: unused variable 'info' [-Wunused-variable]
     198 |         struct irq_alloc_info info;
         |                               ^~~~
   drivers/irqchip/irq-intel-soc-msi.c: In function 'intel_soc_msi_probe':
   drivers/irqchip/irq-intel-soc-msi.c:304:46: error: 'x86_vector_domain' undeclared (first use in this function)
     304 |         domain = irq_domain_create_hierarchy(x86_vector_domain, 0,
         |                                              ^~~~~~~~~~~~~~~~~


vim +/info +198 drivers/irqchip/irq-intel-soc-msi.c

   192	
   193	static int soc_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
   194					unsigned int nr_irqs, void *arg)
   195	{
   196		struct msi_domain_info *msi_info = domain->host_data;
   197		struct irq_fwspec *fwspec = arg;
 > 198		struct irq_alloc_info info;
   199		irq_hw_number_t hwirq;
   200		unsigned int type;
   201		void *chip_data;
   202		int i, ret;
   203	
   204		if (!msi_info)
   205			return -EINVAL;
   206	
   207		chip_data = msi_info->chip_data;
   208	
   209		ret = soc_msi_domain_xlate(domain, fwspec, &hwirq, &type);
   210		if (ret)
   211			return ret;
   212	
   213		if (irq_find_mapping(domain, hwirq) > 0)
   214			return -EEXIST;
   215	
   216		/*
   217		 * All NMI interrupts go to vector 2, no irq mapping needed.
   218		 * What we want is to configure hardware once, don't do anything else.
   219		 * 0 means it will continue to initialize other stuff in the irqdomain.
   220		 * We can just return other value after hw initialized. In this case,
   221		 * irqdomain will release all resources.
   222		 */
   223		if (soc_nmi_msi(hwirq)) {
   224			nmi_msi_compose_msg((struct soc_msi_dev *)chip_data, hwirq);
   225			return -EINVAL;
   226		}
   227	
   228		/* Translate to X86 favorite arguments */
   229		init_irq_alloc_info(&info, NULL);
   230	
   231		/* Need to allocate from x86 vector domain */
   232		ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &info);
   233		if (ret < 0)
   234			return ret;
   235	
   236		for (i = 0; i < nr_irqs; i++) {
   237			irq_domain_set_info(domain, virq + i, hwirq + i,
   238					    &soc_msi_irq_chip, chip_data,
   239					    handle_edge_irq, chip_data, "edge");
   240		}
   241	
   242		return 0;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
