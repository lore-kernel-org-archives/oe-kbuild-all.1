Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C79C957
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 22:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678488213; x=1710024213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZcAkOvvCSTPLX/Y4PGQ3EBXBuwghLpNpIZI2io5JU4s=;
  b=bKry+k/MVY/v53Jt13pvMARn6VoKJ9CmNU7vjflD1Gy/DN5Csi5kqQfK
   KR5qszqGuoR3CDovTEOpnJSScAD4Lo2URsuaxmOaDkdJnJJwgzR/zi8A1
   39LxTdJYOmp9V6kVJCo4jSn/CCpj8PxftIzJrwf2z4uExF2xBljpppCeJ
   mHu1zF6DqOLeNrN0kiaSY95z179HlKVdnntbgyqeCQlSlPvI4JmIEo3lQ
   jqq2Ur6LJUhTIQ/Xys4eB+IzqBE0tNwJvANRd9v+EPy7jgd33Ld6VpJFw
   gPqQCz/Nqzwpejwnk7IcPKjhWl+4c66rblBtqCsWOpcqkNPOvddptHJ2I
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423110885"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="423110885"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 14:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="627973244"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="627973244"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 14:43:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1palSU-00048l-1L;
	Fri, 10 Mar 2023 22:43:30 +0000
Date: Sat, 11 Mar 2023 06:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-3 2/5] hppa-linux-ld:
 kernel/events/core.o:kernel/events/core.c:13769: undefined reference to
 `__static_call_return0'
Message-ID: <202303110621.0w96Tx6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-3
head:   432e4844ba65840af4a24f5e3f561aead867f6e7
commit: 999f0b7f8056dcb51476a6515a8601c9d6374aa2 [2/5] static_call: Make NULL static calls return 0
config: parisc-buildonly-randconfig-r001-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110621.0w96Tx6o-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=999f0b7f8056dcb51476a6515a8601c9d6374aa2
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-3
        git checkout 999f0b7f8056dcb51476a6515a8601c9d6374aa2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110621.0w96Tx6o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: kernel/events/core.o:kernel/events/core.c:13769: undefined reference to `__static_call_return0'
>> hppa-linux-ld: security/keys/trusted-keys/trusted_core.o:security/keys/trusted-keys/trusted_core.c:53: undefined reference to `__static_call_return0'
   hppa-linux-ld: security/keys/trusted-keys/trusted_core.o:security/keys/trusted-keys/trusted_core.c:51: undefined reference to `__static_call_return0'
   hppa-linux-ld: security/keys/trusted-keys/trusted_core.o:security/keys/trusted-keys/trusted_core.c:49: undefined reference to `__static_call_return0'
   hppa-linux-ld: security/keys/trusted-keys/trusted_core.o:security/keys/trusted-keys/trusted_core.c:48: undefined reference to `__static_call_return0'
   hppa-linux-ld: security/keys/trusted-keys/trusted_core.o:security/keys/trusted-keys/trusted_core.c:47: more undefined references to `__static_call_return0' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
