Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8D168AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688143717; x=1719679717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0rzP1Sa+FSJuHSA5Aawh4UrIP4X7rMyPSRh3UeyVyw=;
  b=GYPS4K1JFCo5fJuUs0gI/Rm9rWJ82u/YZ5y0c0JcEqbyDVDc+YAwuYja
   r+WzSbYJmg99ldHB+jbrebNrcmlAoXvC1UawfEcDSpDB4Zadm4i1eJDiz
   IQbIPJZjQwDy7g/Mps9gW+MyoPZvt3KVT4+/sxNUDTKZZgglKy0kSrmu1
   HAphV6J29liEb+hRUvyinSuuv/sCyh8oBBq1/KjWkQmdaB3iW51SVuWsj
   +LJZDIgG3+HVPyDmTm4rsthvJQX4+ohEvstT5x8QgdStUQTOVmY/QxXnj
   se5+HZkv3ZsutDwkrZqgTxTfK/fQUS7sAUHSrejhEiDhzeiFqnvvAdjrb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="359915211"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="359915211"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 09:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="695068620"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="695068620"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jun 2023 09:48:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFHIQ-000F9x-2p;
	Fri, 30 Jun 2023 16:48:34 +0000
Date: Sat, 1 Jul 2023 00:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 16/22] mm/swapfile.c:102:26: warning:
 no previous prototype for function 'swap_type_to_swap_info'
Message-ID: <202307010027.WiHCbDXy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   540586cf5b23c020ae90952c1b9b8ceab26545e1
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [16/22] ANDROID: mm: export swap_type_to_swap_info
config: x86_64-randconfig-r026-20230629 (https://download.01.org/0day-ci/archive/20230701/202307010027.WiHCbDXy-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010027.WiHCbDXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307010027.WiHCbDXy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
   struct swap_info_struct *swap_type_to_swap_info(int type)
                            ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct swap_info_struct *swap_type_to_swap_info(int type)
   ^
   static 
   1 warning generated.


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
