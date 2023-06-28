Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5AC10955
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 20:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687984795; x=1719520795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zT1XlabESgMiTiX+QeuC4USR+f6IySr8NAFaLZVPnww=;
  b=S08eZDuXO0M7Y3o075XkKTTItY8YgnnST00aHSHkgc1ksCTk/E/vAXhi
   54RaMDwe7fRZhuVtBDnIaZzXkOJBJ5NFQ0fil2Ej5bCslJECh4g9CGRCv
   9GS7PlVhxFD8MaMVf4Mc9QUKwdXCFSxN5Vs154OcNjLiIg1QQQ7pqrcEm
   n7Ps3l1DsKyOP7b1SPjQDXrMySnXwP93slaBWsF3FAJ+ZR+b0IaQLHX+4
   MaicY70R5deFPM54rr4yo7aswWAvKccGX4ST6vnnxT4NiVIr72dfdVhpq
   K7wnvM0sECizc/p9wYwLBd1eRxllm5KSndSHvbSfKO71lTJBtjFcxobgy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365419212"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="365419212"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 13:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="752399098"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="752399098"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jun 2023 13:39:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEbxB-000DUH-0o;
	Wed, 28 Jun 2023 20:39:53 +0000
Date: Thu, 29 Jun 2023 04:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 10/26]
 arch/parisc/kernel/drivers.c:745:19-20: Unneeded semicolon
Message-ID: <202306290402.UU593bc1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   a252a72d39e48b90bde2bfc56006a5e354eeaf10
commit: 070c120be10a084ad7496db96e26ad805076f737 [10/26] parisc: drivers.c: Various doc and warning fixes
config: parisc-randconfig-r054-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290402.UU593bc1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290402.UU593bc1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290402.UU593bc1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/parisc/kernel/drivers.c:745:19-20: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
