Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202C5275AFE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753739087; cv=none; b=iGbDbnHvpY98GllAxch0mf/iBqID46mKgW8NEafQioOIpQCtIv8qOjKrKlistaaz+v81AWyWjiE/wpNQqWX+eI6TeqrDLOgqkGzdOnSu+T2c1T8jGWJCTJPKTezbn82UmQ2nehBe9mcj8prVHjGkqVOx99pmp9fR7ISxp7njhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753739087; c=relaxed/simple;
	bh=WN3uvnea7ZaaLkDX28pyP0p2WnR6mJn3sGPyBFs0uMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYRJKWjPzURzxAsMahio3C0nbzIlGL8ij6hYicDoWntuVy/RogECKKJ+5ukW0b6b7YWwWTXfRUhi73Ldti+FN2cZ+E6YOa1thJ3UtyA/EzygMOhn9cFRRO4AVC3fRPJpvXBAlrMI9I+fGsUyXXMQXdEg2eJZHyy7zE0irDZmSiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOwF4+A0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOwF4+A0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753739085; x=1785275085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WN3uvnea7ZaaLkDX28pyP0p2WnR6mJn3sGPyBFs0uMc=;
  b=FOwF4+A0n9fmEBnGBfWg9RYVLMRbAqbki+mKkrPy1T0D+JcqXk6HJ3WN
   9J3kYGzBOKq3asxOKYzWLQlll0+9L6XXvCqLIlM1z5X9iuQo5mLUVdMeX
   T4G5C7GMib37Fa0S1EJl3k6ZwILCofNUb0BI0clLQIqnXz6h2PBZwNddC
   sQFINelvX0ccf7XWv101lXWDr22m7rWj36k+03qvAfaZH+D3iDquMkgQK
   xlpGp8/67h4qneG6bEUcyFKipuI71UlNtYPslbFRp6XY5aeAf4/51zLfP
   S7hFtiQnPdmsRuSlbxL8bxUddmRenXfY6aeZh/05OO+Fxrk1CvxIDFe7v
   g==;
X-CSE-ConnectionGUID: YTqJhAXSSeaoc+IknJhhiA==
X-CSE-MsgGUID: CxG4cDHHQLSv99jPP0AipA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="43606620"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="43606620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 14:44:44 -0700
X-CSE-ConnectionGUID: yAQoMyCuQoufhvNdGfN16Q==
X-CSE-MsgGUID: onuewYHaRPy5O4UlYgaZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="186170376"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2025 14:44:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugVeC-0000mT-1V;
	Mon, 28 Jul 2025 21:44:40 +0000
Date: Tue, 29 Jul 2025 05:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Erick Shepherd <erick.shepherd@ni.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mmc: sdhci: Disable SD card clock before changing
 parameters
Message-ID: <202507290504.uMxk3qF7-lkp@intel.com>
References: <20250723214216.3259-1-erick.shepherd@ni.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723214216.3259-1-erick.shepherd@ni.com>

Hi Erick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on ulf-hansson-mmc-mirror/next v6.16 next-20250728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Erick-Shepherd/mmc-sdhci-Disable-SD-card-clock-before-changing-parameters/20250724-054337
base:   linus/master
patch link:    https://lore.kernel.org/r/20250723214216.3259-1-erick.shepherd%40ni.com
patch subject: [PATCH] mmc: sdhci: Disable SD card clock before changing parameters
config: i386-randconfig-141-20250728 (https://download.01.org/0day-ci/archive/20250729/202507290504.uMxk3qF7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290504.uMxk3qF7-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-pci-core.c:701 sdhci_intel_set_clock() warn: inconsistent indenting

vim +701 drivers/mmc/host/sdhci-pci-core.c

   692	
   693	static void sdhci_intel_set_clock(struct sdhci_host *host, unsigned int clock)
   694	{
   695		u16 clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
   696	
   697		/* Stop card clock separately to avoid glitches on clock line */
   698		if (clk & SDHCI_CLOCK_CARD_EN)
   699			sdhci_writew(host, clk & ~SDHCI_CLOCK_CARD_EN, SDHCI_CLOCK_CONTROL);
   700	
 > 701	 sdhci_set_clock(host, clock);
   702	}
   703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
