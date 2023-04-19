Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F841C27
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 04:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681878994; x=1713414994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmFjvW4BgLI9sxmoKn9zmlqh1vLUvFIRcjtnapsVHNI=;
  b=MhsFOpPPHFh1e+T+KG+Zdw+GN39U3Koy+MNc5IporpzwSh9+Ia2aFnIY
   +zzu9EczE96yKsRdCONgxEKaJo9I/z/IIcGoKi2bwy92Pbjv0t3+DSstV
   eNAhO68bv5Q/KObiwYYN5YGHZ4yxFonC0ArQpnnOO8q02Ki40PHjqEFhb
   UFS6zdKSLGeiEsctpshGGNgLeTqKclyNqQMCf8a5qxlx3l5m3Qmg730na
   oNdr9wgfPM/Hn4WGtEXUNcArEcS63a9yXcrMA/qvGBUyOZXqPnV7Ik78n
   pxZHVaUWUsm+Nkxc8jLfFQAkS5966rUsyIRvirW3LScBYJCu6vnoN/XUu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344101382"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="344101382"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 21:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="691353474"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="691353474"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Apr 2023 21:36:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pozYT-000eVr-3B;
	Wed, 19 Apr 2023 04:36:29 +0000
Date: Wed, 19 Apr 2023 12:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 16/19] /tmp/ccWdEZVv.s:18837: Warning: setting
 incorrect section attributes for .rodata..c_jump_table
Message-ID: <202304191226.PzAl8uhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   01406d471d3e3718b3771fdabcfca8c505157404
commit: b1580354498f38290d1d5b94bd3f58562d6b8647 [16/19] x86: Use PIE codegen for the core kernel
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230419/202304191226.PzAl8uhA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=b1580354498f38290d1d5b94bd3f58562d6b8647
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout b1580354498f38290d1d5b94bd3f58562d6b8647
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191226.PzAl8uhA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:1632:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1632 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   /tmp/ccWdEZVv.s: Assembler messages:
>> /tmp/ccWdEZVv.s:18837: Warning: setting incorrect section attributes for .rodata..c_jump_table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
