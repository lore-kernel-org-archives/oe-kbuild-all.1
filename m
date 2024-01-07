Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA15611701
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XY1UJUQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704657831; x=1736193831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/wIk1KmFKl/yM/d27sbXZfzaXO/Q+V18y0IjRHAJ60=;
  b=XY1UJUQUdFfTUjY4hVQqc/5ECDA8z/WPbfQKI8sKdk6VsHmExbpcNLXK
   M2XWL3VdYuRVMRptA+K2oMefOfeGlnbO2P3k/nYgrUWsiFBpxze/1XPSB
   KSTblyHmd14RQfLk2xP3x1usIX3WB60Y1gqs3oo4ZNJ5YdzJMZPIFlfzn
   Twg0bQty8wslirrqEhmrPy4o1mRnf66gXeEvGRbtrdZkhGIWEkmDtFxdL
   pVNPLc80GVeCZCkIip7alTZaId9HkWM03Q9Y5YbWF5f4l7TVDgNJVSUOa
   JOTgxLA9wZXdWf/6lA4rXTq+Pa037sGdyIURdQb9SSz5GBNcK+utT8MK/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="377238334"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="377238334"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 12:03:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="924673745"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="924673745"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2024 12:03:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMZN5-00046G-2k;
	Sun, 07 Jan 2024 20:03:47 +0000
Date: Mon, 8 Jan 2024 04:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v0 7/14] arch/parisc/mm/execmem.c:7:7: error:
 conflicting types for 'execmem_alloc'; have 'void *(long unsigned int)'
Message-ID: <202401080329.9vQykQCG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v0
head:   7b112b930be7b0627fa65c6f8a2b64cd325c0ea9
commit: 701b6cd4f36f02872b28bdd4c2018d2720236b0b [7/14] dev: parisc: s/module_alloc/execmem_text_alloc/
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240108/202401080329.9vQykQCG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080329.9vQykQCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401080329.9vQykQCG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/parisc/mm/execmem.c:7:7: error: conflicting types for 'execmem_alloc'; have 'void *(long unsigned int)'
       7 | void *execmem_alloc(unsigned long size)
         |       ^~~~~~~~~~~~~
   In file included from arch/parisc/mm/execmem.c:4:
   include/linux/execmem.h:16:7: note: previous declaration of 'execmem_alloc' with type 'void *(size_t)' {aka 'void *(unsigned int)'}
      16 | void *execmem_alloc(size_t size);
         |       ^~~~~~~~~~~~~


vim +7 arch/parisc/mm/execmem.c

     6	
   > 7	void *execmem_alloc(unsigned long size)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
