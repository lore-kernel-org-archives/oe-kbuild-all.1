Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1087B7262F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765573582; cv=none; b=Gmi9lOTfuMPLsoCfU+pnfL+QUk8TUESPi9uM9k9Z8xmoXleVr52lhekrgckU6KvPevwhpw1lDaK3sj1Vn8eR22REL+4lohWfwHXJcynWMa+vuNr1qL8mnaA7kGMl4buFn0Ayg+kr+HefUg9xvmRAUiswhYyHhDt4tprkByurKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765573582; c=relaxed/simple;
	bh=1TczCspl1WtKFFnyZb3Ax4NxCeyTvxSRAfZaggVSgdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mb7XkCAjrc7BQbIcYsJL7gAutgSKM4Cm+hslcFjj2TOnYDdQu3SkINRPd+CNKD4tZy0tVg8kzPRFpT7wQqsGyvr74zGPNGmIBpDsVJYWA2/CrTlMlgwX8p7zxNLFle3NYDampSESbvLryAC39CTf+1qfohz5Jl+hc2FtZNTE96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLUk89Cj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLUk89Cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765573581; x=1797109581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1TczCspl1WtKFFnyZb3Ax4NxCeyTvxSRAfZaggVSgdE=;
  b=KLUk89CjaKpfFW9noPpBC5L2C2VFVN7W0KiKMbi1NfXHHCjXFR85sAKf
   TBU4/zEn6rcKDx6An0NU2YKaSJCj+z4yJI+6dXfDImD528QDsZww/RLGo
   o6IRNtDsETpTVTuDokF9/r9agLZx1ARbJ3jSpiaBWq0/uEWfxaKhUJHuQ
   zbjO6UDjsLDdIFg7GwvcV5xyHVrGc9Ilhg+P663LZ98Cn6cXP/sCNNgeU
   Nt3d6hsiSv4C/D/u3Y4IFHhr2tOp00/+6ZFC6bQrzgvfHzBJQUIIq1urs
   /MoCZpUR0CO5mOdalU18DvQYyqTLi4sj+/usuTlInJoNkfGm66uAKSdjJ
   g==;
X-CSE-ConnectionGUID: JpR8/eSvStWapKF4qt7mUQ==
X-CSE-MsgGUID: rJZFhLF9SG26w7eHEg90ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67464918"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67464918"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:06:20 -0800
X-CSE-ConnectionGUID: /w7/6AnKRCGoFG6lLrhbVg==
X-CSE-MsgGUID: +aPteOm2S3uiV7V7N3Ds9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201597130"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 13:06:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUALB-000000001qG-1lm1;
	Fri, 12 Dec 2025 21:06:17 +0000
Date: Fri, 12 Dec 2025 22:05:26 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] mm/vmalloc.c:217:23:
 warning: variable 'start' set but not used
Message-ID: <202512122201.xknqnJbC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 3eb01faed2ebb254019a3bb72ce3bdf4d0a9be74 [1941/1941] mm/vmalloc: add vmap_range_noflush variant
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512122201.xknqnJbC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122201.xknqnJbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122201.xknqnJbC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmalloc.c: In function 'vmap_range_noflush':
>> mm/vmalloc.c:217:23: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     217 |         unsigned long start;
         |                       ^~~~~
   mm/vmalloc.c: At top level:
   mm/vmalloc.c:1417:6: warning: no previous prototype for 'set_iounmap_nonlazy' [-Wmissing-prototypes]
    1417 | void set_iounmap_nonlazy(void)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:3188: warning: Function parameter or member 'align' not described in 'pvm_determine_end_from_reverse'


vim +/start +217 mm/vmalloc.c

004cface9c1c0b Nicholas Piggin 2021-10-29  211  
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  212  static int vmap_range_noflush(unsigned long addr, unsigned long end,
004cface9c1c0b Nicholas Piggin 2021-10-29  213  			phys_addr_t phys_addr, pgprot_t prot,
004cface9c1c0b Nicholas Piggin 2021-10-29  214  			unsigned int max_page_shift)
004cface9c1c0b Nicholas Piggin 2021-10-29  215  {
004cface9c1c0b Nicholas Piggin 2021-10-29  216  	pgd_t *pgd;
004cface9c1c0b Nicholas Piggin 2021-10-29 @217  	unsigned long start;
004cface9c1c0b Nicholas Piggin 2021-10-29  218  	unsigned long next;
004cface9c1c0b Nicholas Piggin 2021-10-29  219  	int err;
004cface9c1c0b Nicholas Piggin 2021-10-29  220  
004cface9c1c0b Nicholas Piggin 2021-10-29  221  	might_sleep();
004cface9c1c0b Nicholas Piggin 2021-10-29  222  	BUG_ON(addr >= end);
004cface9c1c0b Nicholas Piggin 2021-10-29  223  
004cface9c1c0b Nicholas Piggin 2021-10-29  224  	start = addr;
004cface9c1c0b Nicholas Piggin 2021-10-29  225  	pgd = pgd_offset_k(addr);
004cface9c1c0b Nicholas Piggin 2021-10-29  226  	do {
004cface9c1c0b Nicholas Piggin 2021-10-29  227  		next = pgd_addr_end(addr, end);
004cface9c1c0b Nicholas Piggin 2021-10-29  228  		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, max_page_shift);
004cface9c1c0b Nicholas Piggin 2021-10-29  229  		if (err)
004cface9c1c0b Nicholas Piggin 2021-10-29  230  			break;
004cface9c1c0b Nicholas Piggin 2021-10-29  231  	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
004cface9c1c0b Nicholas Piggin 2021-10-29  232  
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  233  	return err;
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  234  }
3eb01faed2ebb2 Nicholas Piggin 2021-10-29  235  

:::::: The code at line 217 was first introduced by commit
:::::: 004cface9c1c0b6351473934a4ce452193e05b07 mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
