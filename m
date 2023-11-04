Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70237E2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 00:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jo6IFrzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699059235; x=1730595235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3XnGmhF2l3iVri1r5mvrRws0lzwgJxgH9+gX16B78OA=;
  b=Jo6IFrzFMBZLyqmjg/d+n94rfWhYrGLSQtKuE2DxXxuwx4O4xbVvXlKl
   Uky9iPEkvbpXg7ggVoPLypMVCF3t51JKWduMSIEzy5RYKPViLK6qd6uGl
   ef3it4G6Fxe1Lf3wEJCGn3tM+voGr4XSln3gxqJxAi8EG/ubd5x2T96hk
   wbJNiyJs8uH+rx5kQC0bNRuOmrICZexbNyet5JCaDgwr9phfbRAXKp07g
   FeXveqJBlwLOPFK0zNwWs+O0PXRncUbzLDQGJmqrssED+MHVOaQ7p43wF
   W8GpssFmOCDKUvw+zpflYeDnVrp9FXIr0+y8pZJ36nADfQfyNdCFXOsEz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369253753"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="369253753"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 17:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="790923915"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="790923915"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2023 17:53:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz4v9-00039g-1Y;
	Sat, 04 Nov 2023 00:53:51 +0000
Date: Sat, 4 Nov 2023 08:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/2] net/netfilter/nft_immediate.o:
 warning: objtool: nft_immediate_destroy()+0x10e: unreachable instruction
Message-ID: <202311040830.vFyk3IjC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f40707abde2eb5cd21cf8848f33aefb7e394ad1a
commit: 6cd0cd38930f98a1e17626c47ca8a06ed9162ce4 [1/2] UPSTREAM: netfilter: nf_tables: report use refcount overflow
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311040830.vFyk3IjC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040830.vFyk3IjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040830.vFyk3IjC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_immediate.o: warning: objtool: nft_immediate_destroy()+0x10e: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
