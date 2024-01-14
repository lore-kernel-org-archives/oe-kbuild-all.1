Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177E023BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIRGFopI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705242517; x=1736778517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91psHIAhOtArm3ChaQJ62Qjzm4uKuBJMM0ZNh2Nx0tQ=;
  b=GIRGFopINwoPME9txn5SVZuXqG9Cgd2mZKZikZyugHunaVQp2B0ViwU/
   nRj3o+cl2LZtyqGGMEWzbbUQx3tpFCZp+uU+fU0WVHI/UfYLON8T9CZ50
   +heorJm+sf4TM5UpMqCIdw09zwGecQMaZ4F9beIGcN0ZN7UE04HUckIai
   ZE5+lqw4eEsSvciXli3UqR/djp8qvjusyoeRNAGziBO69hMNMSe2j8ebx
   6CXXmgzkFgAGsoo4e9NeCRRm+Mwmu7yOA4/3+Wu/v6yU2uB+btmcN4v2x
   lcBOsDqK4/fR8DtTnrUTETWgRMnnyZs4I3+hrF0Fgz0mojoc7tzBtewxm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6185235"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="6185235"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 06:28:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="25221295"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Jan 2024 06:28:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP1TV-000BZ2-0W;
	Sun, 14 Jan 2024 14:28:33 +0000
Date: Sun, 14 Jan 2024 22:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18172/21544] mm/ioremap.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202401142228.dPtxo24z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 004cface9c1c0b6351473934a4ce452193e05b07 [18172/21544] mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240114/202401142228.dPtxo24z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401142228.dPtxo24z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401142228.dPtxo24z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ioremap.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
