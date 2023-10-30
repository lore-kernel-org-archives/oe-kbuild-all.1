Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFE423C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOUpIKDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698704136; x=1730240136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9w8xJecpoH2IwaAPYxzSsK0ti7SF4yRAnJehfCtS10=;
  b=XOUpIKDhnzgw2bJyTcgdq5yDcFvOZ2jiN751kjKtZu//1MkuEuaGrBQw
   Cnjj1aug3rciPKg1MdUGKV9Kzy4qv0iASXfXrK9Suvz3KoNbXEyUOUvXb
   e1TCiuN4um//BXCuk3W6vhi0995AjnJ15YjRsR9DZSyyFhsffNuPz6ZHY
   myjNSe6L5Jcraw/EymE/xJrSGXYjqExqyIIyo6sepo/75n2ErZFqc5z+O
   FzZM5yj7BScFIJXjUe9urCzNBpEyicKEVHE/N4jisuTq1rbU9kVczB6vg
   J6KEzaBa+PviRYmrqrV1WgIRg5+K8FPU7VK86gMgocw7oI8udcElgH9Is
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1049377"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1049377"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 15:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764052546"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="764052546"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Oct 2023 15:15:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxaXi-000Db5-2L;
	Mon, 30 Oct 2023 22:15:30 +0000
Date: Tue, 31 Oct 2023 06:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/sh/boot/compressed/misc.c:118:6: warning: no previous prototype
 for 'arch_ftrace_ops_list_func'
Message-ID: <202310310611.5RteDpO7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   14ab6d425e80674b6a0145f05719b11e82e64824
commit: 17b251a290ba84a0c2c5c82df9596cb2e7207ca6 ftrace/sh: Add arch_ftrace_ops_list_func stub to have compressed image still link
date:   2 years ago
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231031/202310310611.5RteDpO7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310611.5RteDpO7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310611.5RteDpO7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/boot/compressed/misc.c:109:6: warning: no previous prototype for '__stack_chk_fail' [-Wmissing-prototypes]
     109 | void __stack_chk_fail(void)
         |      ^~~~~~~~~~~~~~~~
   arch/sh/boot/compressed/misc.c:115:6: warning: no previous prototype for 'ftrace_stub' [-Wmissing-prototypes]
     115 | void ftrace_stub(void)
         |      ^~~~~~~~~~~
>> arch/sh/boot/compressed/misc.c:118:6: warning: no previous prototype for 'arch_ftrace_ops_list_func' [-Wmissing-prototypes]
     118 | void arch_ftrace_ops_list_func(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sh/boot/compressed/misc.c:128:6: warning: no previous prototype for 'decompress_kernel' [-Wmissing-prototypes]
     128 | void decompress_kernel(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/arch_ftrace_ops_list_func +118 arch/sh/boot/compressed/misc.c

   113	
   114	/* Needed because vmlinux.lds.h references this */
   115	void ftrace_stub(void)
   116	{
   117	}
 > 118	void arch_ftrace_ops_list_func(void)
   119	{
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
