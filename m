Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28B7C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 00:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683593808; x=1715129808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3joJZfi+qFzfTQXb1w9AaIb71oofe+6dj7y7zl1V7U=;
  b=FzzbsqeLYonz0G20nA4Oo/ZT/54eu1A/VKTFwm3dAUpxr0Mh+dwRoTb9
   oqH0dp+ZgJkx5p7r7TQ8BBkgR5TBtzyyJMD1WLYL4s3j+uzki1WQptZeG
   kE7ZHSx3nX/kcBe3m4EgJy1i6+NHbpLtsUf7DN6ZlSQX/agaWJkbT2/L8
   V3u4VvIW2L3+jbU8f1AMKhNDJ4dSK+LnNfr5KSy4dTEXMebij7dU6vao1
   fcIaEvOl2VAYwNf3+2znSFZMeTpEWwYRB53QXyv/+GuvlqSVyz2R79Ydk
   vXj0Hw16FT5eDmW3Ug7q6/jIpZxR5/oOjZN/nu5x53VF0n31mxquzB8pF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334232043"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="334232043"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649082803"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="649082803"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 May 2023 17:56:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwBeo-0001VV-0y;
	Tue, 09 May 2023 00:56:46 +0000
Date: Tue, 9 May 2023 08:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 4/4]
 arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype
 for 'has_apple_feature'
Message-ID: <202305090805.NRuC2z20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: 38015ad2af19088e66e0c81f7efd5a8b51814026 [4/4] arm64: Implement Apple IMPDEF TSO memory model control
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305090805.NRuC2z20-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/38015ad2af19088e66e0c81f7efd5a8b51814026
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout 38015ad2af19088e66e0c81f7efd5a8b51814026
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090805.NRuC2z20-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype for 'has_apple_feature' [-Wmissing-prototypes]
      12 | bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature_impdef.c:24:6: warning: no previous prototype for 'has_tso_fixed' [-Wmissing-prototypes]
      24 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature_impdef.c:59:13: warning: no previous prototype for 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
      59 | void __init init_cpu_hwcaps_indirect_list_impdef(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/has_apple_feature +12 arch/arm64/kernel/cpufeature_impdef.c

    11	
  > 12	bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
    13	{
    14		u64 val;
    15		WARN_ON(scope != SCOPE_SYSTEM);
    16	
    17		if (read_cpuid_implementor() != ARM_CPU_IMP_APPLE)
    18			return false;
    19	
    20		val = read_sysreg(aidr_el1);
    21		return feature_matches(val, entry);
    22	}
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
