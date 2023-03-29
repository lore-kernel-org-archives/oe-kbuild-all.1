Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBC7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 00:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680049530; x=1711585530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqXNbFIgDHBzO7YvXHfKmSBfNCUr7s3+0I37+y3W0rM=;
  b=gt2m2ffc9z+EV6NoN9m8XiNp0Cjs7oWqaxtWP9w5I7QAx1ntQ0NCTB6T
   XGG+BamEJFN7ujSOAVH/4s4mLSZW6lHhvikh8orC4ayCCea1Hd6UmFI4M
   sC/OuY+x/k4BH53a6FX0YLYyNjk8IkRvbxM+OrrRH0OgkldnpoxRv4jRB
   5dGUO21XucPv/J8bbr8tzWVpUEYYgvUkJUwsGLQynWEz3V+VIj2gl3AQV
   wI0W+Cx+AcarTkFRMc8tgCJr9dzBAnmMrN9zb6fhE6Dk2m9IoYR4Aspu2
   aTstL4M2qn2Yx2nSeLflPnBn+JnORYUkyTZVWDiRNmnWG4m9o2pLqVihl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="321133386"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="321133386"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 17:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="714425476"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="714425476"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Mar 2023 17:25:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phJd0-000J0R-2p;
	Wed, 29 Mar 2023 00:25:26 +0000
Date: Wed, 29 Mar 2023 08:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.1.y 287/4294] drivers/gpu/drm/i915/i915.o: warning:
 objtool: __i915_gem_object_release_mmap_gtt.cold+0x97: relocation to !ENDBR:
 i915_gem_object_runtime_pm_release_mmap_offset.cold+0x0
Message-ID: <202303290823.cAu1wiLr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   e3a87a10f2591f296d1a50c5af6820e2181d564a
commit: bd449cadc8db481eeaa4fe2f051e30b288a34933 [287/4294] drm/i915/dgfx: Grab wakeref at i915_ttm_unmap_virtual
config: x86_64-randconfig-r035-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290823.cAu1wiLr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=bd449cadc8db481eeaa4fe2f051e30b288a34933
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-6.1.y
        git checkout bd449cadc8db481eeaa4fe2f051e30b288a34933
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290823.cAu1wiLr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915.o: warning: objtool: gen6_alloc_va_range.cold+0x153: relocation to !ENDBR: gen6_ppgtt_cleanup.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: eb_move_to_gpu.cold+0x39: relocation to !ENDBR: i915_reset_gen7_sol_offsets.cold+0x0
>> drivers/gpu/drm/i915/i915.o: warning: objtool: __i915_gem_object_release_mmap_gtt.cold+0x97: relocation to !ENDBR: i915_gem_object_runtime_pm_release_mmap_offset.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: __guc_context_destroy.cold+0x97: relocation to !ENDBR: guc_flush_destroyed_contexts.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: emit_bb_start_child_no_preempt_mid_batch.cold+0x2cb: relocation to !ENDBR: emit_fini_breadcrumb_child_no_preempt_mid_batch.cold+0x0


objdump-func vmlinux.o __i915_gem_object_release_mmap_gtt.cold:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
