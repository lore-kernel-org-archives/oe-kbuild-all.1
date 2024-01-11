Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FE815AE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQq7gUSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704976209; x=1736512209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HqsafoHe8stdJb7C+7jPt/zj/1vmqS0g18EEjQ6+1Hw=;
  b=SQq7gUSApfEyAWaX60rEaivxKKbjkloOD+6WQlmgrWAP51aMM4ZEUK2r
   Yb8m+8+qPLP0z54ZIdQyhkTIFXvUkRBG+AyCSnus/UUB1bPkY0A78THA1
   2ymjw3RwQPiI+98wwE0wjpoq79uj0Vb/rBexEk8BvCfgLagBFTCw9klEV
   tHovvkAMLSOqjhE29bpZFZmmBtrSHcHYL5NeNvD4ydUdHpCkhRQTid54h
   1rVs490LmEqGQuFDOso8sRNLDKcwEMMVa1/o0rIiWbz0GzGSAMDQ6H5Rt
   WHpXbY7Tl0/391S6jFZ7oq/gWi+ro1J7t1i3N0z2YnDjqi9zJkGC0Voss
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5911821"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5911821"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 04:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="782626767"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="782626767"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Jan 2024 04:30:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNuCB-0008Fy-2l;
	Thu, 11 Jan 2024 12:30:04 +0000
Date: Thu, 11 Jan 2024 20:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>
Subject: [linux-next:master 12996/13245] WARNING: modpost: vmlinux: section
 mismatch in reference: vmap_init_free_space+0x2 (section: .text.unlikely) ->
 vmlist (section: .init.data)
Message-ID: <202401112056.I41bELL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: 86817057732a9ce9cefdb6f513b6554a55ebbbbb [12996/13245] mm: vmalloc: remove global vmap_area_root rb-tree
config: um-defconfig (https://download.01.org/0day-ci/archive/20240111/202401112056.I41bELL4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112056.I41bELL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112056.I41bELL4-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: vmap_init_free_space+0x2 (section: .text.unlikely) -> vmlist (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slhc.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
