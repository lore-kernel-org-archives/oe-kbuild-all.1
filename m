Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B96CDBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709127380; cv=none; b=DIumuYUwcZ84/yraOrG569MQLxR+I9KL+7IXhZq/iN9ckLcXAInc9MbeptfsKvuQ04dW7DhL1x77yuzbXNeu7nNwUiLHj6WRcCr+ZHsBdhEFnUr85vAqhFvJ89GKBI4RbrQ9QhbwDH6ySE3nOogwxG8Q7Hw1Vr6nnIbqgs9Q3DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709127380; c=relaxed/simple;
	bh=xy4FiSe+thO/0ABaGNfMHX1m869Hzy6rmQXMGdJPUEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KBUZ22UZzNLJGWvTKHWcMp5eL27HaRj3phPHrdlHtR5H4Ryo1CDEaLOUxvhqNdlwsw8qKRiyxgh4PRCFpLJ631BA+YMGQXZNmovpBS8G8RDaIgnurnzpG9IiNNImRaIIuRr5K/dd4Upedjpaivja4SJ5fWc/XrQRUhesHyvhyao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dos3WyA8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dos3WyA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709127378; x=1740663378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xy4FiSe+thO/0ABaGNfMHX1m869Hzy6rmQXMGdJPUEU=;
  b=Dos3WyA8X1Kww8kmON1j9qH7G6pFM26qO4Mv/x+ux9G2MUZDE1rhGCBs
   thWf2ySOVLfwZjlk7hZw+gHS6ctmWaUxxWpMHRZjnb3RgdOHv6PlvUCjg
   +yQn3bYFwmwpBdojSlmRnUnYr33xJCHPSfZA3kfLvM0bJYsVzqEuCTjTP
   XY9ButYq3Z2CDDXSD3keu2JWDunAiRP2hn04inJid92nZ0uJDUpIVBkRU
   cRQ0NJXNaiN0PQ5uBFnwFfwtYCeMSQgGgZ3J1XX2Vb7Kwv0emMAMGWVD5
   3NIFmPzLS5zMSHMpw9XlGziayBvLKJS3cMt3R9omIi16LYvxL/H2CSIWt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3399438"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3399438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 05:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="12103591"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Feb 2024 05:36:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfK5d-000C5n-1F;
	Wed, 28 Feb 2024 13:35:31 +0000
Date: Wed, 28 Feb 2024 21:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [linux-next:master 7237/10830] drivers/gpu/drm/xe/xe_mmio.c:109:23:
 error: result of comparison of constant 4294967296 with expression of type
 'resource_size_t' (aka 'unsigned int') is always false
Message-ID: <202402282106.ou7DStPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 237412e45390805e14a6936fb998d756c4eac9d8 [7237/10830] drm/xe: Enable 32bits build
config: i386-randconfig-r051-20240227 (https://download.01.org/0day-ci/archive/20240228/202402282106.ou7DStPq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282106.ou7DStPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282106.ou7DStPq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_mmio.c:109:23: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
     109 |                     root_res->start > 0x100000000ull)
         |                     ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   1 error generated.


vim +109 drivers/gpu/drm/xe/xe_mmio.c

dd08ebf6c3525a Matthew Brost              2023-03-30   50  
7f075300a31829 Michael J. Ruhl            2023-05-25   51  /*
7f075300a31829 Michael J. Ruhl            2023-05-25   52   * if force_vram_bar_size is set, attempt to set to the requested size
7f075300a31829 Michael J. Ruhl            2023-05-25   53   * else set to maximum possible size
7f075300a31829 Michael J. Ruhl            2023-05-25   54   */
433002ca367076 Michael J. Ruhl            2023-06-05   55  static void xe_resize_vram_bar(struct xe_device *xe)
dd08ebf6c3525a Matthew Brost              2023-03-30   56  {
adce1b393f90c3 Bommithi Sakeena           2023-11-17   57  	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
dd08ebf6c3525a Matthew Brost              2023-03-30   58  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
dd08ebf6c3525a Matthew Brost              2023-03-30   59  	struct pci_bus *root = pdev->bus;
dd08ebf6c3525a Matthew Brost              2023-03-30   60  	resource_size_t current_size;
7f075300a31829 Michael J. Ruhl            2023-05-25   61  	resource_size_t rebar_size;
7f075300a31829 Michael J. Ruhl            2023-05-25   62  	struct resource *root_res;
7f075300a31829 Michael J. Ruhl            2023-05-25   63  	u32 bar_size_mask;
dd08ebf6c3525a Matthew Brost              2023-03-30   64  	u32 pci_cmd;
dd08ebf6c3525a Matthew Brost              2023-03-30   65  	int i;
dd08ebf6c3525a Matthew Brost              2023-03-30   66  
7f075300a31829 Michael J. Ruhl            2023-05-25   67  	/* gather some relevant info */
0bc519d20ffa7a Lucas De Marchi            2023-11-17   68  	current_size = pci_resource_len(pdev, LMEM_BAR);
0bc519d20ffa7a Lucas De Marchi            2023-11-17   69  	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
7f075300a31829 Michael J. Ruhl            2023-05-25   70  
7f075300a31829 Michael J. Ruhl            2023-05-25   71  	if (!bar_size_mask)
433002ca367076 Michael J. Ruhl            2023-06-05   72  		return;
dd08ebf6c3525a Matthew Brost              2023-03-30   73  
7f075300a31829 Michael J. Ruhl            2023-05-25   74  	/* set to a specific size? */
2a8477f7614a62 Matthew Auld               2023-03-08   75  	if (force_vram_bar_size) {
7f075300a31829 Michael J. Ruhl            2023-05-25   76  		u32 bar_size_bit;
dd08ebf6c3525a Matthew Brost              2023-03-30   77  
2a8477f7614a62 Matthew Auld               2023-03-08   78  		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
dd08ebf6c3525a Matthew Brost              2023-03-30   79  
7f075300a31829 Michael J. Ruhl            2023-05-25   80  		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
dd08ebf6c3525a Matthew Brost              2023-03-30   81  
7f075300a31829 Michael J. Ruhl            2023-05-25   82  		if (!bar_size_bit) {
dd08ebf6c3525a Matthew Brost              2023-03-30   83  			drm_info(&xe->drm,
7f075300a31829 Michael J. Ruhl            2023-05-25   84  				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
7f075300a31829 Michael J. Ruhl            2023-05-25   85  				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
433002ca367076 Michael J. Ruhl            2023-06-05   86  			return;
dd08ebf6c3525a Matthew Brost              2023-03-30   87  		}
7f075300a31829 Michael J. Ruhl            2023-05-25   88  
7f075300a31829 Michael J. Ruhl            2023-05-25   89  		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
7f075300a31829 Michael J. Ruhl            2023-05-25   90  
7f075300a31829 Michael J. Ruhl            2023-05-25   91  		if (rebar_size == current_size)
433002ca367076 Michael J. Ruhl            2023-06-05   92  			return;
dd08ebf6c3525a Matthew Brost              2023-03-30   93  	} else {
7f075300a31829 Michael J. Ruhl            2023-05-25   94  		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
dd08ebf6c3525a Matthew Brost              2023-03-30   95  
7f075300a31829 Michael J. Ruhl            2023-05-25   96  		/* only resize if larger than current */
7f075300a31829 Michael J. Ruhl            2023-05-25   97  		if (rebar_size <= current_size)
433002ca367076 Michael J. Ruhl            2023-06-05   98  			return;
dd08ebf6c3525a Matthew Brost              2023-03-30   99  	}
dd08ebf6c3525a Matthew Brost              2023-03-30  100  
433002ca367076 Michael J. Ruhl            2023-06-05  101  	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  102  		 (u64)current_size >> 20, (u64)rebar_size >> 20);
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  103  
dd08ebf6c3525a Matthew Brost              2023-03-30  104  	while (root->parent)
dd08ebf6c3525a Matthew Brost              2023-03-30  105  		root = root->parent;
dd08ebf6c3525a Matthew Brost              2023-03-30  106  
dd08ebf6c3525a Matthew Brost              2023-03-30  107  	pci_bus_for_each_resource(root, root_res, i) {
dd08ebf6c3525a Matthew Brost              2023-03-30  108  		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
dd08ebf6c3525a Matthew Brost              2023-03-30 @109  		    root_res->start > 0x100000000ull)
dd08ebf6c3525a Matthew Brost              2023-03-30  110  			break;
dd08ebf6c3525a Matthew Brost              2023-03-30  111  	}
dd08ebf6c3525a Matthew Brost              2023-03-30  112  
dd08ebf6c3525a Matthew Brost              2023-03-30  113  	if (!root_res) {
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  114  		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
433002ca367076 Michael J. Ruhl            2023-06-05  115  		return;
dd08ebf6c3525a Matthew Brost              2023-03-30  116  	}
dd08ebf6c3525a Matthew Brost              2023-03-30  117  
dd08ebf6c3525a Matthew Brost              2023-03-30  118  	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
dd08ebf6c3525a Matthew Brost              2023-03-30  119  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
dd08ebf6c3525a Matthew Brost              2023-03-30  120  
0bc519d20ffa7a Lucas De Marchi            2023-11-17  121  	_resize_bar(xe, LMEM_BAR, rebar_size);
dd08ebf6c3525a Matthew Brost              2023-03-30  122  
dd08ebf6c3525a Matthew Brost              2023-03-30  123  	pci_assign_unassigned_bus_resources(pdev->bus);
dd08ebf6c3525a Matthew Brost              2023-03-30  124  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
dd08ebf6c3525a Matthew Brost              2023-03-30  125  }
dd08ebf6c3525a Matthew Brost              2023-03-30  126  

:::::: The code at line 109 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
