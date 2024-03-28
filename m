Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF08565D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638076; cv=none; b=YX0MzdmUDMboe5hngrvNOiQntNzDQqfBJBa0N3P02puhCIfAjQT/NZ4UyGh+8FSrg7YcPp5rc0arMhQ6IJct5Df9/YnCHywwc6/46hYxGCxauXI9RMxTAc5kBAQsD8OSzgCsDXFFEDjZt57sXd9mXU52ozc73V7KYhP7H4124n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638076; c=relaxed/simple;
	bh=YWsMq5qCbTSN10VSj3S38szpilVOqvfniOFct++Y/y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlroiFCzkzHd0lSu6eN/6fDETcrGUrwDCbAu/9GE2MgU3vor1GLHBNlKQXBAXZpN3J7Zvcd5UZWs5jDjWMSYrNB08FvTOTdVD0azbu53w6PvO/ErVKEcJYxBsyRPvIIchp8GAc/TTNdb+F3ozu+jvLcwAbmXSBkuxVrgM52A5Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAooDpDI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAooDpDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711638074; x=1743174074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YWsMq5qCbTSN10VSj3S38szpilVOqvfniOFct++Y/y4=;
  b=BAooDpDIhYANds44rNsPdICKptdaz5TOUOXMPMHdSfN6imD9siSPZ1QO
   NEDR2I0fixXVURlyYAWYQcOyhZ+4q+XMYN5Bknt5H7i8zYqyhmlsZWTb0
   awSbruP2gySrsQKzrXA5MAYrvzjm91oe1uRB5wCEKoN6GPJ6G/ohnE8gQ
   bk/RkzoSO1HZcO/qOD1dyXB6Qjb/eD72qZPb+G+oMVxCfDUzaPHyqxThS
   tfJiSOHfm8Rxikr6XhGnbVYI2I6xll30rLAY6u8Mxo/HjMuV3Y2zZBfn3
   gbNClb00ehwU5CLxAmN92wYqwWeKaM2k3l+kLV185eAKdG7ydFiEJya7r
   g==;
X-CSE-ConnectionGUID: TZnTsot9R3Cyxox8IGJY5A==
X-CSE-MsgGUID: Yrf1YcNmRMKzy3g/Ei2BIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6983865"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6983865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 08:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21320762"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Mar 2024 08:01:11 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rprFc-0002FK-36;
	Thu, 28 Mar 2024 15:01:08 +0000
Date: Thu, 28 Mar 2024 23:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gowthami Thiagarajan <gthiagarajan@marvell.com>, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sgoutham@marvell.com,
	bbhushan2@marvell.com, gcherian@marvell.com,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>
Subject: Re: [RESEND PATCH v4 3/3] perf/marvell : Odyssey LLC-TAD performance
 monitor
Message-ID: <202403282246.ybWRrXj7-lkp@intel.com>
References: <20240327071832.1556576-4-gthiagarajan@marvell.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327071832.1556576-4-gthiagarajan@marvell.com>

Hi Gowthami,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gowthami-Thiagarajan/perf-marvell-Refactor-to-extract-platform-data/20240327-152242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20240327071832.1556576-4-gthiagarajan%40marvell.com
patch subject: [RESEND PATCH v4 3/3] perf/marvell : Odyssey LLC-TAD performance monitor
config: alpha-randconfig-r071-20240328 (https://download.01.org/0day-ci/archive/20240328/202403282246.ybWRrXj7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282246.ybWRrXj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282246.ybWRrXj7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/marvell_cn10k_tad_pmu.c:416:34: warning: 'tad_pmu_v2_data' defined but not used [-Wunused-const-variable=]
     416 | static const struct tad_pmu_data tad_pmu_v2_data = {
         |                                  ^~~~~~~~~~~~~~~
>> drivers/perf/marvell_cn10k_tad_pmu.c:412:34: warning: 'tad_pmu_data' defined but not used [-Wunused-const-variable=]
     412 | static const struct tad_pmu_data tad_pmu_data = {
         |                                  ^~~~~~~~~~~~


vim +/tad_pmu_data +412 drivers/perf/marvell_cn10k_tad_pmu.c

   411	
 > 412	static const struct tad_pmu_data tad_pmu_data = {
   413		.id   = TAD_PMU_V1,
   414	};
   415	
 > 416	static const struct tad_pmu_data tad_pmu_v2_data = {
   417		.id   = TAD_PMU_V2,
   418	};
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
