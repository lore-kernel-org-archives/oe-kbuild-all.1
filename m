Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB223D84
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677602745; x=1709138745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ll+g8W+BPsRQwYjoOrbS9PwPYnVqpEtunNHrBOzRBd4=;
  b=TDNHtJPwSWgMcU0PZX/CH6dgZ3b8PVrICqusk23yO32PjQhtbPlJjaal
   qD3l71QokjMPoYlhzlVsZLGCtB3gQGJpfwWnvovN3N9X0YZgHTCAojtIr
   1OtQMMCmz2HWiwFpDiiEWQuZGXWIFedRYLhF08RW1nwOCNAUWDKjwUkpD
   FhNVvQS1v+MQ6U1+ZOcQ+fXqNLz9TQPZ/R4Irv73/XCygxVXjKxEYWmDG
   dYQwVXNPd4uFi2rSi23NKxqua64PjO8M4CE9I/1gJD/rmE2+337e8mOCO
   QFbO/yqE/DZNZgLcxDhPyP5tXoiy8rQWXhukTs1EWBePeFZN1mX/q/Kj4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="313857946"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="313857946"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 08:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="817138303"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="817138303"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2023 08:45:42 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX36j-0005X3-12;
	Tue, 28 Feb 2023 16:45:41 +0000
Date: Wed, 1 Mar 2023 00:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dakr@redhat.com,
	arunpravin.paneerselvam@amd.com
Subject: Re: [PATCH 7/9] drm/radeon: switch over to drm_exec
Message-ID: <202303010052.xJCf8UMu-lkp@intel.com>
References: <20230228083406.1720795-8-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228083406.1720795-8-christian.koenig@amd.com>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next linus/master next-20230228]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230228083406.1720795-8-christian.koenig%40amd.com
patch subject: [PATCH 7/9] drm/radeon: switch over to drm_exec
config: openrisc-randconfig-r016-20230226 (https://download.01.org/0day-ci/archive/20230301/202303010052.xJCf8UMu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93b3fd6c23deae79357cfb6bc0a7fcb07ed819f9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
        git checkout 93b3fd6c23deae79357cfb6bc0a7fcb07ed819f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010052.xJCf8UMu-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_object.o: in function `radeon_bo_list_validate':
>> radeon_object.c:(.text+0xf10): undefined reference to `drm_exec_cleanup'
   radeon_object.c:(.text+0xf10): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_cleanup'
>> or1k-linux-ld: radeon_object.c:(.text+0xf9c): undefined reference to `drm_exec_prepare_obj'
   radeon_object.c:(.text+0xf9c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_prepare_obj'
   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_gem.o: in function `radeon_gem_va_update_vm':
>> radeon_gem.c:(.text+0x218): undefined reference to `drm_exec_init'
   radeon_gem.c:(.text+0x218): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_init'
>> or1k-linux-ld: radeon_gem.c:(.text+0x228): undefined reference to `drm_exec_cleanup'
   radeon_gem.c:(.text+0x228): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_cleanup'
>> or1k-linux-ld: radeon_gem.c:(.text+0x27c): undefined reference to `drm_exec_fini'
   radeon_gem.c:(.text+0x27c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
>> or1k-linux-ld: radeon_gem.c:(.text+0x2b8): undefined reference to `drm_exec_prepare_obj'
   radeon_gem.c:(.text+0x2b8): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_prepare_obj'
   or1k-linux-ld: radeon_gem.c:(.text+0x360): undefined reference to `drm_exec_prepare_obj'
   radeon_gem.c:(.text+0x360): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_prepare_obj'
   or1k-linux-ld: radeon_gem.c:(.text+0x3bc): undefined reference to `drm_exec_fini'
   radeon_gem.c:(.text+0x3bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
   or1k-linux-ld: radeon_gem.c:(.text+0x41c): undefined reference to `drm_exec_fini'
   radeon_gem.c:(.text+0x41c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_cs.o: in function `radeon_cs_parser_fini':
>> radeon_cs.c:(.text+0xf98): undefined reference to `drm_exec_fini'
   radeon_cs.c:(.text+0xf98): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_cs.o: in function `radeon_cs_parser_init':
>> radeon_cs.c:(.text+0x119c): undefined reference to `drm_exec_init'
   radeon_cs.c:(.text+0x119c): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
