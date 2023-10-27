Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50F1EB20
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c45ymi0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698417599; x=1729953599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uk9HkmAcm/KYYkJ+vFvshSoMM1+lECupnHKTi3FXuHw=;
  b=c45ymi0M1ccDhmRAEao48EL2ezbBaSKqZHaSa1V1HrJn0limYDgk5VZx
   P3asFKHlM2vjcuhLeR4RTtCkt5GgckSiCYOI5iFaYRrMdxCPjQXPqRDxj
   nb4JFAxzl0zPjCADHIAgnXSK5EA46RHt6rFXJkQnRfq5AjWXatAyIpETR
   dnlNQ0D9YUlINhU8LSUGR92T27TvsEdXmZJw4fQuTcDl+euynN7k13NU0
   mQ69vwqYvbf4yd4k/9JmWmdCcsfSPVRx/VzLkoWeht3BaZeAtTL5FbBNX
   Yf0ilnYzpt5s2f8UsSnFjw0DvdNo/+/b37ljJstIE+E19IkmD8o6JCOvf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="367994598"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="367994598"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 07:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763225538"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="763225538"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Oct 2023 07:39:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwO00-000Aw7-2E;
	Fri, 27 Oct 2023 14:39:44 +0000
Date: Fri, 27 Oct 2023 22:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof:large-block-minorder-for-next 8/8]
 "6.6.0-rc5-large-block-minorder-2023-10-26-multi-00023-g4c35c807b586"
 exceeds 64 characters
Message-ID: <202310272243.bLrBkNkN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git large-block-minorder-for-next
head:   4c35c807b5861286df7676b9995c0f58a727c104
commit: 4c35c807b5861286df7676b9995c0f58a727c104 [8/8] kdevops: add localversion-dev tag for kdevops and changelog
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20231027/202310272243.bLrBkNkN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310272243.bLrBkNkN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310272243.bLrBkNkN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> "6.6.0-rc5-large-block-minorder-2023-10-26-multi-00023-g4c35c807b586" exceeds 64 characters
   make[2]: *** [Makefile:1262: include/generated/utsrelease.h] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
