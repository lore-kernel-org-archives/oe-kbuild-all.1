Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410A12DFA3C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877037; cv=none; b=EOtxAoXwqm7LgTLN+tDUFNjM9HFb+rVCARtwhKorD1cLXyyONZ8Hd9jdYe3cPVjkA0pmNOMF3lkh2n9vdE/wIqDhBtKWLB/NZWwD1niNM5vB984ebhPXraK4d8L+MocjowwSXA1JRaB9hgVjyUvbQ2D1wF+JiP80MV1wtR6Ifps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877037; c=relaxed/simple;
	bh=cj6xUwtwFf88UjaMkBgCp39LHPmhx4LfavYmuQkfCr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNvR3PTS9eU6Z9pGc+RXBxvVBT3tKmycfPetCdf5qVEU3MpGaUac51Glx6ytVSFBEMBcMVt/8LmQkinu9AmhK6EPFSVbLkhaOQx9R5uQnyNNtTa3XvY7YRgWefp3oqsHocvo6D6QHg9O2hEuuSiUsCclU0atQMSbfLYv0ui24LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhnWg0Mj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhnWg0Mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750877035; x=1782413035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cj6xUwtwFf88UjaMkBgCp39LHPmhx4LfavYmuQkfCr8=;
  b=DhnWg0Mjt+TsJOaGPxx9YK+Z0GNFO09sz6i/TNIimCnNRia29JBzV9ip
   XXK2L6g8svx+/aMCMR+ZYg4FXyzbxwd/Ys8/Fwv9yzEp9maFfQViYVERi
   95avDOTJL9D5gpBeZTkfH9jhR+zhEbOpjUCNB+sHyYQ5/pQXXp5Qe1oFX
   Ny9C1HML+XTo3tT7wkTbfrIL3Y8fj2J6n+IfbkKZAKP8TLxXXfpE3DSMr
   R4UZEHU2zjezR3vYN6duAmuJBO/AomF1Jh8tXocGRJMQWH5YzN+1inzQN
   P/xZf/Wh8eNlEGaYPC6UMSB/BxYG2ec3i7opCYW74OCMWkuoTS/Q7oQM6
   A==;
X-CSE-ConnectionGUID: 6GXvPZycS4S9rk7YJvODbg==
X-CSE-MsgGUID: zhMfwpuNSTirPOINpLJMxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70731458"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="70731458"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 11:43:55 -0700
X-CSE-ConnectionGUID: 2UVOkWt1SyiVDhl0GtawvQ==
X-CSE-MsgGUID: w2ZQq/U8SluNq3aRh8TXlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="158058558"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 25 Jun 2025 11:43:54 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUV67-00004F-0m;
	Wed, 25 Jun 2025 18:43:51 +0000
Date: Wed, 25 Jun 2025 20:43:23 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] arch/x86/kernel/early-quirks.c:727:34:
 warning: no previous prototype for 'kh40000_get_direct_dma_ops'
Message-ID: <202506260203.vSEOKong-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [2195/2195] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250626/202506260203.vSEOKong-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260203.vSEOKong-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260203.vSEOKong-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for 'kh40000_get_direct_dma_ops' [-Wmissing-prototypes]
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kh40000_get_direct_dma_ops +727 arch/x86/kernel/early-quirks.c

   726	
 > 727	__weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
   728	{
   729		return dma_ops;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
