Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBE3128396
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713266622; cv=none; b=NgbazTUDv549VfJQPvnOvvaWE19CDXffAiQf5usixY2fLcFLMfbiOHh0nncJMoJARE2jjhduydCxyWZrt4nhUqQJfoy1RnqnV+jSkzeE71NLxlnWKlSWtKoihaPkywLIdyGZ8+9WayHR+oHF7KwFGecCTUck1iG20Z7R95lK6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713266622; c=relaxed/simple;
	bh=oYlsXR4CNbi19YfgTPgojJ7yoC8mKeXxMHQ20jWQss4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mS226kZ5uwHW84faxNP2yw8naAAciX8rCxJzAAn9g9oj+JZ6RNg2LSnQhhLCq3f3NYzXyv3j7+TZCarcxvpsTH84OkX8pd80FRixg/6ZsISQkjXVM+2ve+URMTrTz/0axrlOcGS3blD0Y0kRKHfo+BlfxX0vRrJy23LNl6AJvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2Kyl4ep; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2Kyl4ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713266620; x=1744802620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYlsXR4CNbi19YfgTPgojJ7yoC8mKeXxMHQ20jWQss4=;
  b=I2Kyl4epzId5FUUzMSGGcsBgHlJ3Y3ujfKB8jRKLoDm01N8ZAeUkwEwD
   FdX0gbJwpX2HqueoEu6K9t40Qv8FDv2o52KAbidOjGDzq2jrGOmrW2ndc
   5RAdiXrY3KAM87OVm4TC5eA34OkTx03syicmO8BFDJ070MFhmGsYtM3oX
   2vq0/T9ZtaXgU1u/VjbZnJUxI4eKYLGBHQtqA1aXsmroV/hHdl/b8Slp7
   F1C3PIO9H/poKTkk0Mwxlz/ZUyjxx8YR+hHi4dfM/aVEkcArPc3PUt9Op
   Ozve5TsaCNkp4PMjRTLq/4pZrbuPmM0U/JA0YmrGqoccG9SVuLwy8wHMv
   Q==;
X-CSE-ConnectionGUID: qXK0LU2LRHC+21CEiTHlEA==
X-CSE-MsgGUID: R7O06uxGQYGIDHLY17NBng==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8861113"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8861113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 04:23:39 -0700
X-CSE-ConnectionGUID: uYa7elT3RoW4AlW+TriQig==
X-CSE-MsgGUID: raFQwrdNS/ibfLcPgvIv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22823721"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2024 04:23:38 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwguD-0005BG-24;
	Tue, 16 Apr 2024 11:23:19 +0000
Date: Tue, 16 Apr 2024 19:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 5544/6520] arch/mips/sgi-ip27/ip27-irq.c:280:13:
 warning: unused variable 'i'
Message-ID: <202404161933.izfqZ32k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66e4190e92ce0e4a50b2f6be0e5f5b2e47e072f4
commit: 40e20fbccfb722f219ab8d3ff1edde99e4a7c46c [5544/6520] MIPS: SGI-IP27: micro-optimize arch_init_irq()
config: mips-ip27_defconfig (https://download.01.org/0day-ci/archive/20240416/202404161933.izfqZ32k-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161933.izfqZ32k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161933.izfqZ32k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/sgi-ip27/ip27-irq.c: In function 'arch_init_irq':
>> arch/mips/sgi-ip27/ip27-irq.c:280:13: warning: unused variable 'i' [-Wunused-variable]
     280 |         int i;
         |             ^


vim +/i +280 arch/mips/sgi-ip27/ip27-irq.c

69a07a41d908f9 Thomas Bogendoerfer 2019-02-19  275  
69a07a41d908f9 Thomas Bogendoerfer 2019-02-19  276  void __init arch_init_irq(void)
69a07a41d908f9 Thomas Bogendoerfer 2019-02-19  277  {
e6308b6d35ea70 Thomas Bogendoerfer 2019-05-07  278  	struct irq_domain *domain;
e6308b6d35ea70 Thomas Bogendoerfer 2019-05-07  279  	struct fwnode_handle *fn;
e6308b6d35ea70 Thomas Bogendoerfer 2019-05-07 @280  	int i;

:::::: The code at line 280 was first introduced by commit
:::::: e6308b6d35ea706c23a589a8c709fa444ff13e17 MIPS: SGI-IP27: abstract chipset irq from bridge

:::::: TO: Thomas Bogendoerfer <tbogendoerfer@suse.de>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
