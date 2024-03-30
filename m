Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF82B1C0DE5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711779685; cv=none; b=CPVVyN9q/VwDJ07zZZhWYg5mXw2jaRTEGuWErngrlC0q23NDav//SUlozxj5a8BsHEEBT3G4tUAqfPueQLPpQ9seEhZn6jGXzGND1n8n7HC5blmQJIg3mpR6dZKpCg9T6wgahILcJeJoQgQCY1QGwT0g/5jorESxrcTJ+pGCV5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711779685; c=relaxed/simple;
	bh=g5KGxZez6UEMPtcbXTzqDFuf9u7N5NEmWhkO3ToUTzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVBtp2Vg9I6+oVy5aM67jd3gyNmZQhMCQ1TiM/oqo/8gpcOvvuWXDPLi4YFkQKtH8+PMI02gJUkitwX+8qpuk7/voCx9yUIDPsOMlMayrjRJEjd5+1UtyTWbU8qeG1VMyHqSZnWssPGqvAnyexZEGWVz3BoMU8xHswa089fQgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQdRplXy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQdRplXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711779683; x=1743315683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5KGxZez6UEMPtcbXTzqDFuf9u7N5NEmWhkO3ToUTzA=;
  b=EQdRplXyMwsWQXbOtCytBZVa6RMCYpwaV7XPIrIF1Ui0IKIuXoqmaair
   gvBbKzn96UAJpD47rMTYR68S7pT7gyA+6mR/W3XYMvC3xtr9jRVTkee46
   sK/72CUbTU8971phnXc7KeD6j0mpTcX9VuPYVh2IgGjFBujr8AqZGzAzI
   R0OZYnvu8gyuZHJPipQmquMPWugWWcnrhFVhqyrNydD+fNzoRVYsm+bit
   BmlxkTmfp8uaDlDYW3uGVApUw97CS+BmQ6YSpsqaVpX+dCnH7XJK3hq4i
   JtbpvJtFTRfT76WvPtbyoayLad99TYfFMjvUj4/hTff1gw/f5QubkiIyR
   Q==;
X-CSE-ConnectionGUID: srbG7vzuTgiAPn2rpZ/47w==
X-CSE-MsgGUID: TlwevgNySFi91vUrmO1AHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7089642"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="7089642"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 23:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17215159"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Mar 2024 23:21:21 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqS5e-0003zU-1Q;
	Sat, 30 Mar 2024 06:21:18 +0000
Date: Sat, 30 Mar 2024 14:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 23/41]
 drivers/media/pci/intel/ipu6/../ipu-mmu.c:357:9: warning: variable
 'unmapped' set but not used
Message-ID: <202403301404.ToNsHibb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   1f54ce33a0c956409b727d5a4450e3dd2c206438
commit: fbf76a456b55f8c41bdf340bde2bc51a001f60ce [23/41] CHROMIUM: media/ipu6: Optimize the IPU MMU mapping and unmapping flow
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240330/202403301404.ToNsHibb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301404.ToNsHibb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301404.ToNsHibb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/../ipu-mmu.c:357:9: warning: variable 'unmapped' set but not used [-Wunused-but-set-variable]
     357 |         size_t unmapped = 0;
         |                ^
   1 warning generated.


vim +/unmapped +357 drivers/media/pci/intel/ipu6/../ipu-mmu.c

83d148360cd5f0 Tianshu Qiu 2020-04-15  349  
fbf76a456b55f8 Jianhui Dai 2024-01-02  350  static void l2_unmap(struct ipu_mmu_info *mmu_info, unsigned long iova,
83d148360cd5f0 Tianshu Qiu 2020-04-15  351  		     phys_addr_t dummy, size_t size)
83d148360cd5f0 Tianshu Qiu 2020-04-15  352  {
fbf76a456b55f8 Jianhui Dai 2024-01-02  353  	u32 l1_idx;
63f5dd5d46796e Tianshu Qiu 2021-07-16  354  	u32 *l2_pt;
83d148360cd5f0 Tianshu Qiu 2020-04-15  355  	unsigned int l2_idx;
fbf76a456b55f8 Jianhui Dai 2024-01-02  356  	unsigned int l2_entries;
83d148360cd5f0 Tianshu Qiu 2020-04-15 @357  	size_t unmapped = 0;
63f5dd5d46796e Tianshu Qiu 2021-07-16  358  	unsigned long flags;
83d148360cd5f0 Tianshu Qiu 2020-04-15  359  
fbf76a456b55f8 Jianhui Dai 2024-01-02  360  	spin_lock_irqsave(&mmu_info->lock, flags);
fbf76a456b55f8 Jianhui Dai 2024-01-02  361  	for (l1_idx = iova >> ISP_L1PT_SHIFT;
fbf76a456b55f8 Jianhui Dai 2024-01-02  362  	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
fbf76a456b55f8 Jianhui Dai 2024-01-02  363  		dev_dbg(mmu_info->dev,
fbf76a456b55f8 Jianhui Dai 2024-01-02  364  			"unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
83d148360cd5f0 Tianshu Qiu 2020-04-15  365  			l1_idx, iova);
83d148360cd5f0 Tianshu Qiu 2020-04-15  366  
63f5dd5d46796e Tianshu Qiu 2021-07-16  367  		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
63f5dd5d46796e Tianshu Qiu 2021-07-16  368  			dev_err(mmu_info->dev,
63f5dd5d46796e Tianshu Qiu 2021-07-16  369  				"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
63f5dd5d46796e Tianshu Qiu 2021-07-16  370  				iova, l1_idx);
fbf76a456b55f8 Jianhui Dai 2024-01-02  371  			continue;
63f5dd5d46796e Tianshu Qiu 2021-07-16  372  		}
63f5dd5d46796e Tianshu Qiu 2021-07-16  373  		l2_pt = mmu_info->l2_pts[l1_idx];
fbf76a456b55f8 Jianhui Dai 2024-01-02  374  
fbf76a456b55f8 Jianhui Dai 2024-01-02  375  		l2_entries = 0;
fbf76a456b55f8 Jianhui Dai 2024-01-02  376  		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
fbf76a456b55f8 Jianhui Dai 2024-01-02  377  		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
63f5dd5d46796e Tianshu Qiu 2021-07-16  378  			dev_dbg(mmu_info->dev,
63f5dd5d46796e Tianshu Qiu 2021-07-16  379  				"unmap l2 index %u with pteval 0x%10.10llx\n",
83d148360cd5f0 Tianshu Qiu 2020-04-15  380  				l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
63f5dd5d46796e Tianshu Qiu 2021-07-16  381  			l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
63f5dd5d46796e Tianshu Qiu 2021-07-16  382  
fbf76a456b55f8 Jianhui Dai 2024-01-02  383  			iova += ISP_PAGE_SIZE;
fbf76a456b55f8 Jianhui Dai 2024-01-02  384  			unmapped += ISP_PAGE_SIZE;
fbf76a456b55f8 Jianhui Dai 2024-01-02  385  			size -= ISP_PAGE_SIZE;
fbf76a456b55f8 Jianhui Dai 2024-01-02  386  
fbf76a456b55f8 Jianhui Dai 2024-01-02  387  			l2_entries++;
83d148360cd5f0 Tianshu Qiu 2020-04-15  388  		}
83d148360cd5f0 Tianshu Qiu 2020-04-15  389  
fbf76a456b55f8 Jianhui Dai 2024-01-02  390  		WARN_ON_ONCE(!l2_entries);
fbf76a456b55f8 Jianhui Dai 2024-01-02  391  		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
fbf76a456b55f8 Jianhui Dai 2024-01-02  392  				    sizeof(l2_pt[0]) * l2_entries);
83d148360cd5f0 Tianshu Qiu 2020-04-15  393  	}
83d148360cd5f0 Tianshu Qiu 2020-04-15  394  
fbf76a456b55f8 Jianhui Dai 2024-01-02  395  	WARN_ON_ONCE(size);
fbf76a456b55f8 Jianhui Dai 2024-01-02  396  	spin_unlock_irqrestore(&mmu_info->lock, flags);
fbf76a456b55f8 Jianhui Dai 2024-01-02  397  }
fbf76a456b55f8 Jianhui Dai 2024-01-02  398  

:::::: The code at line 357 was first introduced by commit
:::::: 83d148360cd5f0b1f82fcf95471ac063acd06fcb CHROMIUM: media: intel-ipu6: Add IPU6 and IPU6SE drivers

:::::: TO: Tianshu Qiu <tian.shu.qiu@intel.com>
:::::: CC: Commit Bot <commit-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
