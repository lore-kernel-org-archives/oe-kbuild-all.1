Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5D339BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695225476; x=1726761476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V0F4i1Ael87UuweAhhBb3DSz+9zE7lwSz416g8O4JHU=;
  b=jPcHguegXZsKQ6iE+kRgP9TmhMuU3aqbszj2fMztIYSQUuUqm7Ki7CP/
   xsb3q/TmdMphTU8MNjbs10wBXAbjKo7oVOo0VAJtjyoHgWUVrzPcOIPGv
   k3SE8lHtw22vUztcChXt+HdjvoC9vXdgUXgolWuPtayJmI2qM4nlwFWi2
   8bkr1rQRGnHZqUiKj98e78vuBlPwOc0HeciuQBK9fcYTth6BNSxlhLAiJ
   K2qY8ZdCXtg5MDFawkK+Ufotpa/f3yE0NieINi0nNDfkzLjEeSO+QFRul
   FA2UfQfq+trKTkzveAZHnCjUVuAys4xxRRm+CYZ0m/iBHETK9YHQVUME6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466571395"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="466571395"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 08:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816960206"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816960206"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2023 08:57:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qizaK-0008uE-0q;
	Wed, 20 Sep 2023 15:57:52 +0000
Date: Wed, 20 Sep 2023 23:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 24/39]
 include/uapi/asm-generic/unistd.h:826:31: error: array index in initializer
 exceeds array bounds
Message-ID: <202309202357.8TIXNviC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   4cccfa6e5811f220b75536df86fd0bb8e1ec8986
commit: b73e8db824ea0afa19dc23495d39cba0c8e25b04 [24/39] arm64/mm: Implement map_shadow_stack()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20230920/202309202357.8TIXNviC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202357.8TIXNviC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202357.8TIXNviC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> include/uapi/asm-generic/unistd.h:826:31: error: array index in initializer exceeds array bounds
     826 | #define __NR_map_shadow_stack 453
         |                               ^~~
   arch/openrisc/kernel/sys_call_table.c:20:30: note: in definition of macro '__SYSCALL'
      20 | #define __SYSCALL(nr, call) [nr] = (call),
         |                              ^~
   include/uapi/asm-generic/unistd.h:827:11: note: in expansion of macro '__NR_map_shadow_stack'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         |           ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/unistd.h:826:31: note: (near initialization for 'sys_call_table')
     826 | #define __NR_map_shadow_stack 453
         |                               ^~~
   arch/openrisc/kernel/sys_call_table.c:20:30: note: in definition of macro '__SYSCALL'
      20 | #define __SYSCALL(nr, call) [nr] = (call),
         |                              ^~
   include/uapi/asm-generic/unistd.h:827:11: note: in expansion of macro '__NR_map_shadow_stack'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         |           ^~~~~~~~~~~~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:20:36: warning: excess elements in array initializer
      20 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:827:1: note: in expansion of macro '__SYSCALL'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         | ^~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:20:36: note: (near initialization for 'sys_call_table')
      20 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:827:1: note: in expansion of macro '__SYSCALL'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         | ^~~~~~~~~


vim +826 include/uapi/asm-generic/unistd.h

   825	
 > 826	#define __NR_map_shadow_stack 453
   827	__SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
   828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
