Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435A78474
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680014409; x=1711550409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6gBIqXPWX1iSN2TWu38Zxga/kLELfj5xm0VoahpXS8=;
  b=FhgNrEGL7ByhjPHx32glGML48frfRYhi30pZi+8+sHquIScERnRlZD9s
   /rOVqvFcoVIvwhbi9GUy+Gf0a7/h10iKhL5wY9izT7EqjRFSbEcZEAZyi
   6hPOT73810NsISfF41aIHJsvDAkGWGyFD8eTuVLTTuF5DpbnUmmZfBx6o
   uCfHo0kHc8tBdQdfFFUns8Ix58uM4KXCDgiZMbyE3fGoC8f5Uhh9lCNB6
   /qR3tzse0z9dtJ6FClZL5aNKKap1gqdFj581oBFzgW6C2aR2SRG4oY+98
   YSwoWbkfYZUO4rAk2xmmh5bTryM2b69gYIEK+j7ucrcptwVZc8tfoUSvv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320982167"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="320982167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 07:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748415800"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="748415800"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2023 07:40:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phAUY-000IcB-2G;
	Tue, 28 Mar 2023 14:40:06 +0000
Date: Tue, 28 Mar 2023 22:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-lts 877/1774] drivers/gpu/drm/i915/i915.o:
 warning: objtool: __i915_schedule.cold+0x153: relocation to !ENDBR:
 i915_sched_node_reinit.cold+0x0
Message-ID: <202303282232.0Rji6bjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-lts
head:   c1c1238e584a25aff184f9c4e37e9d8d4fcd45d2
commit: 4a501b4ef88170a860be55ad98efb4aab9e1bdfe [877/1774] rcu: Make RCU_LOCKDEP_WARN() avoid early lockdep checks
config: x86_64-randconfig-r035-20230327 (https://download.01.org/0day-ci/archive/20230328/202303282232.0Rji6bjf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=4a501b4ef88170a860be55ad98efb4aab9e1bdfe
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-lts
        git checkout 4a501b4ef88170a860be55ad98efb4aab9e1bdfe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282232.0Rji6bjf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915.o: warning: objtool: gen6_alloc_va_range.cold+0x153: relocation to !ENDBR: gen6_ppgtt_cleanup.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: eb_move_to_gpu.cold+0x39: relocation to !ENDBR: i915_reset_gen7_sol_offsets.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: __i915_gem_object_release_mmap_gtt.cold+0x97: relocation to !ENDBR: i915_gem_object_runtime_pm_release_mmap_offset.cold+0x0
>> drivers/gpu/drm/i915/i915.o: warning: objtool: __i915_schedule.cold+0x153: relocation to !ENDBR: i915_sched_node_reinit.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: __guc_context_destroy.cold+0x97: relocation to !ENDBR: guc_flush_destroyed_contexts.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: emit_bb_start_child_no_preempt_mid_batch.cold+0x2cb: relocation to !ENDBR: emit_fini_breadcrumb_child_no_preempt_mid_batch.cold+0x0


objdump-func vmlinux.o __i915_schedule.cold:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
