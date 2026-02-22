Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173B1E531
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771738115; cv=none; b=rducIxGb4CLRvHlpBdC01evBmDvwPncU8Rqo7U8wsQ2yJYf9UljIovDd6P++lAJeKoqPS71zeVtIRTzKnlVeCe+BeioWHtDGJ0zYGpCBSW9PIOrSqFHYofnNB2QvRJAy/ts6ivs62Ijdi7r7DLULQ7lgtU8IYPzWyObNprndhso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771738115; c=relaxed/simple;
	bh=JUd9k+HQX4LoIkNsJAXgJYlDWcHNmiuoljDyOXUnfms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CJK4I6ROqUgT3HTDFiF4PFEVeIICL4dLUEcGqYFnhIriHC7PgRN3U+flM1kgaWw7s42KrEgQYA43OrMFhTRGZ2pmlHXGMKEIigB6E8bZvI7T+1zLOxtJ1Z9WPCmD2GFAz8aT+Giktk49EmMfJOCl5ZNfn2P0O9GGJhv3Ix2wtRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECa1nZqm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECa1nZqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771738113; x=1803274113;
  h=date:from:to:cc:subject:message-id;
  bh=JUd9k+HQX4LoIkNsJAXgJYlDWcHNmiuoljDyOXUnfms=;
  b=ECa1nZqmqPDZlII1SOG6D0vUecewzqvb+gjUSuJfgUrHOOeMikkGbPjM
   pCFySb6TxfRwOW3T5YAI13cR5ihWJMmF8DgtFHG66Yq1b8owauBr7L5i3
   PlRU1ksCcWjWomKJbHRaVgtUYMzM53RcU3bUXUQwy0SkAVbS/mViSgd9s
   4vG+wUd8bJ9o48y45xmE75x1WXLO56E685JRfVmFYD4LIiq4S7DQzk6Ry
   bnO6moXyD2Z2T3MePd77t4JqMjfen2l1lVhxqBl7sLjHCUH3hmBs+czWM
   uGLz5jWY5tkEKlGRIzW2eV/SAEzsJIZ220jO2YNza7bp5Bkemy9snGbE9
   A==;
X-CSE-ConnectionGUID: ykr0ggsaTiGnNvJXq3e/kA==
X-CSE-MsgGUID: V/r3UIDYT6S2yjxvNWbaJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72950654"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72950654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 21:28:33 -0800
X-CSE-ConnectionGUID: WNsGLocORGKrvcfUOHjntA==
X-CSE-MsgGUID: HPrPFnTFRYKDIZvT4mZ22g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="243529914"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Feb 2026 21:28:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu216-000000015LI-3WMm;
	Sun, 22 Feb 2026 05:28:28 +0000
Date: Sun, 22 Feb 2026 13:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
Subject: io_pagetable.c:undefined reference to `dma_buf_put'
Message-ID: <202602221305.sabKvAHs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa5c82f4d2bbde10e9fd3a32aecacfe3813919ba
commit: 69dc538a4f5a57dcc5ea4893c769d567f539a1b1 iommufd: Fix building without dmabuf
date:   10 weeks ago
config: openrisc-randconfig-r064-20260222 (https://download.01.org/0day-ci/archive/20260222/202602221305.sabKvAHs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221305.sabKvAHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221305.sabKvAHs-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_map_file_pages':
>> io_pagetable.c:(.text+0x208c): undefined reference to `dma_buf_put'
   io_pagetable.c:(.text+0x208c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `dma_buf_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
