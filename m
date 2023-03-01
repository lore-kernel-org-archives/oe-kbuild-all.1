Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D8BEC8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677656952; x=1709192952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sD6IHdCGnoRBgLaX18KcZ8CrCRTIldoIcUOknMyG2R0=;
  b=WnRqVaLGql/fye07GCJfsiAOe9K8pqZZvbGWtWPmCgCxl0YgIfA8hVXZ
   Yxm2mcpAGPD6/ZYegd/MzDCR+zLF93fgSa+dS4sIjP5k1faC6wiKxWy1o
   Hny2L6A7GVDbfsP7GIsql+719KK+/rdG545gnPv5R+AXYAtxwRkI9bo7D
   swaS6ToJRY//l2r8EhsK/Iy/eOrccgtuAtSUAxSLTZkyUy5F1gEPvP5NH
   Fy02VAH5LwnYwE0R+sE/GJGbq6mF7kzkOaAc6kkKiw2ifdG9y44en/Nh4
   LXFT4qBWnTaaHCRbo5q83CBxEPTy6QkZt1GWz7pNGCREBHHfCM0CoGhOr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="335834757"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="335834757"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 23:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="848551774"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="848551774"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Feb 2023 23:49:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXHD3-0005zz-1r;
	Wed, 01 Mar 2023 07:49:09 +0000
Date: Wed, 1 Mar 2023 15:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:tglx/devel/rcuref 2/3]
 arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates
 bits from constant value (ffffffffe0000000 becomes 0)
Message-ID: <202303011547.O2cOhQQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/rcuref
head:   9dcf0830de36103b3a5ed2bdd1bfa5cbcc1032d8
commit: 212b3a6f7d18535cb6b745193608bf2ffaf111b9 [2/3] atomics: Provide rcuref - scalable reference counting
config: sparc64-randconfig-s051-20230226 (https://download.01.org/0day-ci/archive/20230301/202303011547.O2cOhQQe-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/212b3a6f7d18535cb6b745193608bf2ffaf111b9
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tglx/devel/rcuref
        git checkout 212b3a6f7d18535cb6b745193608bf2ffaf111b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303011547.O2cOhQQe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/rcuref.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
>> arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffe0000000 becomes 0)

vim +161 arch/sparc/include/asm/cmpxchg_64.h

d550bbd40c0e10 David Howells 2012-03-28  155  
d550bbd40c0e10 David Howells 2012-03-28  156  static inline unsigned long
d550bbd40c0e10 David Howells 2012-03-28  157  __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
d550bbd40c0e10 David Howells 2012-03-28  158  {
d550bbd40c0e10 David Howells 2012-03-28  159  	switch (size) {
a12ee2349312d7 Babu Moger    2017-05-24  160  		case 1:
a12ee2349312d7 Babu Moger    2017-05-24 @161  			return __cmpxchg_u8(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  162  		case 4:
d550bbd40c0e10 David Howells 2012-03-28  163  			return __cmpxchg_u32(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  164  		case 8:
d550bbd40c0e10 David Howells 2012-03-28  165  			return __cmpxchg_u64(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  166  	}
d550bbd40c0e10 David Howells 2012-03-28  167  	__cmpxchg_called_with_bad_pointer();
d550bbd40c0e10 David Howells 2012-03-28  168  	return old;
d550bbd40c0e10 David Howells 2012-03-28  169  }
d550bbd40c0e10 David Howells 2012-03-28  170  

:::::: The code at line 161 was first introduced by commit
:::::: a12ee2349312d7112b9b7c6ac2e70c5ec2ca334e arch/sparc: Introduce cmpxchg_u8 SPARC

:::::: TO: Babu Moger <babu.moger@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
