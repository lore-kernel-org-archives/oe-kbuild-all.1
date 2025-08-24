Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7650276
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 03:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756005064; cv=none; b=OapYlzyfibLp4fzErZFt5QKjIxFtRI/VDhlEC/+6qB1HkrAn65Vc6Iei/6CN/lKB+CNs3nh1JPASSB+ZjN49kWFz5eCJsue1nNbabVekvf1uaP9ofOVU0ilTWTcizmQWVQNiiPnuOB/50Ll6orQ2epZnZSRfuaqcz0e+DWY2COc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756005064; c=relaxed/simple;
	bh=ZAWs3FB0G6VqhT7uIEgkL9hncvPxJ6BZkVJFOMc3fVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TY3C+5ChZ0RwSaUZzmoNdeGZ0M3+0D5CLNPWN7X0Q55OXO8G/UsFO0nI7+2219hxtty9+4vsOu9qu1wZysak+76d8CkfUeHVCWpOUEoXGuEvVW8YXfCO37HbOxSjP9KvR8GJujK7kjvx9x9LvjF2FR0Ma40D9BEo5txvoy5d3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVfv7onw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVfv7onw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756005062; x=1787541062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAWs3FB0G6VqhT7uIEgkL9hncvPxJ6BZkVJFOMc3fVs=;
  b=UVfv7onwn2juFpItzJ4vkmKxPc3ZHvECzRMrcv0GQEe7NvMIeEFjrZPo
   rHDnhoUh/SHKFLg5ZT+HnJ3mTvSTbJLrl5oUaSjBsqmFDKBG2EEEQ026N
   FWiabTwR0az6m/Ahra3DyfRFASvKHn+V8c4kRwhjtUUUYa0LaLpb7yzdB
   117NdqwE/vkpxuwfADTTG/UY/PQQ9iD/rgF6aLVJXL1o476Vmvk/pdn3U
   4RsMDOy5ZwtgiAYsCMyt3v5mdENK3/9TzdlwLXb7TW4x8lEtssYNNV9AO
   2P53sRfEUWTZTmW9IZ4wZxpiUtkRKYVapxy2niJYLPCQLp7fSKnzB0Tae
   g==;
X-CSE-ConnectionGUID: e0YCAGu2TiWGzkeCKvQZcw==
X-CSE-MsgGUID: J4PVBG8RQBiGgE6uLfZUpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68854434"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68854434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 20:11:01 -0700
X-CSE-ConnectionGUID: F4V/X/W/QEib19DqMfbJvA==
X-CSE-MsgGUID: YjO65RXsTFaU9l66x6rJYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169190652"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2025 20:11:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq17f-000MjC-2z;
	Sun, 24 Aug 2025 03:10:36 +0000
Date: Sun, 24 Aug 2025 11:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.17-rc2 71/89]
 arch/x86/include/asm/resctrl.h:53:20: error: static declaration of
 'resctrl_arch_alloc_capable' follows non-static declaration
Message-ID: <202508241123.a1Aun8L8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.17-rc2
head:   c0646bf01fb5098c7d6cbc44af567a8bb2ca82d6
commit: cc5c3a178290a55e8ebb9ea8c8df08bbd54951c3 [71/89] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250824/202508241123.a1Aun8L8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241123.a1Aun8L8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241123.a1Aun8L8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/resctrl.h:12,
                    from drivers/resctrl/mpam_internal.h:15,
                    from drivers/resctrl/mpam_devices.c:34:
>> arch/x86/include/asm/resctrl.h:53:20: error: static declaration of 'resctrl_arch_alloc_capable' follows non-static declaration
      53 | static inline bool resctrl_arch_alloc_capable(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/resctrl/mpam_devices.c:8:
   include/linux/arm_mpam.h:48:6: note: previous declaration of 'resctrl_arch_alloc_capable' with type 'bool(void)' {aka '_Bool(void)'}
      48 | bool resctrl_arch_alloc_capable(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:58:20: error: redefinition of 'resctrl_arch_enable_alloc'
      58 | static inline void resctrl_arch_enable_alloc(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:74:20: note: previous definition of 'resctrl_arch_enable_alloc' with type 'void(void)'
      74 | static inline void resctrl_arch_enable_alloc(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:64:20: error: redefinition of 'resctrl_arch_disable_alloc'
      64 | static inline void resctrl_arch_disable_alloc(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:75:20: note: previous definition of 'resctrl_arch_disable_alloc' with type 'void(void)'
      75 | static inline void resctrl_arch_disable_alloc(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:70:20: error: static declaration of 'resctrl_arch_mon_capable' follows non-static declaration
      70 | static inline bool resctrl_arch_mon_capable(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:49:6: note: previous declaration of 'resctrl_arch_mon_capable' with type 'bool(void)' {aka '_Bool(void)'}
      49 | bool resctrl_arch_mon_capable(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:75:20: error: redefinition of 'resctrl_arch_enable_mon'
      75 | static inline void resctrl_arch_enable_mon(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:72:20: note: previous definition of 'resctrl_arch_enable_mon' with type 'void(void)'
      72 | static inline void resctrl_arch_enable_mon(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:81:20: error: redefinition of 'resctrl_arch_disable_mon'
      81 | static inline void resctrl_arch_disable_mon(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:73:20: note: previous definition of 'resctrl_arch_disable_mon' with type 'void(void)'
      73 | static inline void resctrl_arch_disable_mon(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:87:20: error: static declaration of 'resctrl_arch_is_llc_occupancy_enabled' follows non-static declaration
      87 | static inline bool resctrl_arch_is_llc_occupancy_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:50:6: note: previous declaration of 'resctrl_arch_is_llc_occupancy_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      50 | bool resctrl_arch_is_llc_occupancy_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:92:20: error: static declaration of 'resctrl_arch_is_mbm_total_enabled' follows non-static declaration
      92 | static inline bool resctrl_arch_is_mbm_total_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:52:6: note: previous declaration of 'resctrl_arch_is_mbm_total_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      52 | bool resctrl_arch_is_mbm_total_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:97:20: error: static declaration of 'resctrl_arch_is_mbm_local_enabled' follows non-static declaration
      97 | static inline bool resctrl_arch_is_mbm_local_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:51:6: note: previous declaration of 'resctrl_arch_is_mbm_local_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      51 | bool resctrl_arch_is_mbm_local_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:146:28: error: redefinition of 'resctrl_arch_round_mon_val'
     146 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:43:28: note: previous definition of 'resctrl_arch_round_mon_val' with type 'unsigned int(unsigned int)'
      43 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:155:20: error: static declaration of 'resctrl_arch_set_cpu_default_closid_rmid' follows non-static declaration
     155 | static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:56:6: note: previous declaration of 'resctrl_arch_set_cpu_default_closid_rmid' with type 'void(int,  u32,  u32)' {aka 'void(int,  unsigned int,  unsigned int)'}
      56 | void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:162:20: error: static declaration of 'resctrl_arch_set_closid_rmid' follows non-static declaration
     162 | static inline void resctrl_arch_set_closid_rmid(struct task_struct *tsk,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:55:6: note: previous declaration of 'resctrl_arch_set_closid_rmid' with type 'void(struct task_struct *, u32,  u32)' {aka 'void(struct task_struct *, unsigned int,  unsigned int)'}
      55 | void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:169:20: error: static declaration of 'resctrl_arch_match_closid' follows non-static declaration
     169 | static inline bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:58:6: note: previous declaration of 'resctrl_arch_match_closid' with type 'bool(struct task_struct *, u32)' {aka '_Bool(struct task_struct *, unsigned int)'}
      58 | bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:174:20: error: static declaration of 'resctrl_arch_match_rmid' follows non-static declaration
     174 | static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:59:6: note: previous declaration of 'resctrl_arch_match_rmid' with type 'bool(struct task_struct *, u32,  u32)' {aka '_Bool(struct task_struct *, unsigned int,  unsigned int)'}
      59 | bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:180:20: error: static declaration of 'resctrl_arch_sched_in' follows non-static declaration
     180 | static inline void resctrl_arch_sched_in(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:57:6: note: previous declaration of 'resctrl_arch_sched_in' with type 'void(struct task_struct *)'
      57 | void resctrl_arch_sched_in(struct task_struct *tsk);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:186:20: error: static declaration of 'resctrl_arch_rmid_idx_decode' follows non-static declaration
     186 | static inline void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:61:6: note: previous declaration of 'resctrl_arch_rmid_idx_decode' with type 'void(u32,  u32 *, u32 *)' {aka 'void(unsigned int,  unsigned int *, unsigned int *)'}
      61 | void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:192:19: error: static declaration of 'resctrl_arch_rmid_idx_encode' follows non-static declaration
     192 | static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:60:5: note: previous declaration of 'resctrl_arch_rmid_idx_encode' with type 'u32(u32,  u32)' {aka 'unsigned int(unsigned int,  unsigned int)'}
      60 | u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:199:21: error: static declaration of 'resctrl_arch_mon_ctx_alloc' follows non-static declaration
     199 | static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:65:7: note: previous declaration of 'resctrl_arch_mon_ctx_alloc' with type 'void *(struct rdt_resource *, enum resctrl_event_id)'
      65 | void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:206:20: error: static declaration of 'resctrl_arch_mon_ctx_free' follows non-static declaration
     206 | static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:66:6: note: previous declaration of 'resctrl_arch_mon_ctx_free' with type 'void(struct rdt_resource *, enum resctrl_event_id,  void *)'
      66 | void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/resctrl/mpam_internal.h:19:10: fatal error: asm/mpam.h: No such file or directory
      19 | #include <asm/mpam.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
--
   In file included from include/linux/resctrl.h:12,
                    from drivers/resctrl/mpam_resctrl.c:16:
>> arch/x86/include/asm/resctrl.h:53:20: error: static declaration of 'resctrl_arch_alloc_capable' follows non-static declaration
      53 | static inline bool resctrl_arch_alloc_capable(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/resctrl/mpam_resctrl.c:6:
   include/linux/arm_mpam.h:48:6: note: previous declaration of 'resctrl_arch_alloc_capable' with type 'bool(void)' {aka '_Bool(void)'}
      48 | bool resctrl_arch_alloc_capable(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:58:20: error: redefinition of 'resctrl_arch_enable_alloc'
      58 | static inline void resctrl_arch_enable_alloc(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:74:20: note: previous definition of 'resctrl_arch_enable_alloc' with type 'void(void)'
      74 | static inline void resctrl_arch_enable_alloc(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:64:20: error: redefinition of 'resctrl_arch_disable_alloc'
      64 | static inline void resctrl_arch_disable_alloc(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:75:20: note: previous definition of 'resctrl_arch_disable_alloc' with type 'void(void)'
      75 | static inline void resctrl_arch_disable_alloc(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:70:20: error: static declaration of 'resctrl_arch_mon_capable' follows non-static declaration
      70 | static inline bool resctrl_arch_mon_capable(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:49:6: note: previous declaration of 'resctrl_arch_mon_capable' with type 'bool(void)' {aka '_Bool(void)'}
      49 | bool resctrl_arch_mon_capable(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:75:20: error: redefinition of 'resctrl_arch_enable_mon'
      75 | static inline void resctrl_arch_enable_mon(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:72:20: note: previous definition of 'resctrl_arch_enable_mon' with type 'void(void)'
      72 | static inline void resctrl_arch_enable_mon(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:81:20: error: redefinition of 'resctrl_arch_disable_mon'
      81 | static inline void resctrl_arch_disable_mon(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:73:20: note: previous definition of 'resctrl_arch_disable_mon' with type 'void(void)'
      73 | static inline void resctrl_arch_disable_mon(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:87:20: error: static declaration of 'resctrl_arch_is_llc_occupancy_enabled' follows non-static declaration
      87 | static inline bool resctrl_arch_is_llc_occupancy_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:50:6: note: previous declaration of 'resctrl_arch_is_llc_occupancy_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      50 | bool resctrl_arch_is_llc_occupancy_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:92:20: error: static declaration of 'resctrl_arch_is_mbm_total_enabled' follows non-static declaration
      92 | static inline bool resctrl_arch_is_mbm_total_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:52:6: note: previous declaration of 'resctrl_arch_is_mbm_total_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      52 | bool resctrl_arch_is_mbm_total_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:97:20: error: static declaration of 'resctrl_arch_is_mbm_local_enabled' follows non-static declaration
      97 | static inline bool resctrl_arch_is_mbm_local_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:51:6: note: previous declaration of 'resctrl_arch_is_mbm_local_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      51 | bool resctrl_arch_is_mbm_local_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:146:28: error: redefinition of 'resctrl_arch_round_mon_val'
     146 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:43:28: note: previous definition of 'resctrl_arch_round_mon_val' with type 'unsigned int(unsigned int)'
      43 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:155:20: error: static declaration of 'resctrl_arch_set_cpu_default_closid_rmid' follows non-static declaration
     155 | static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:56:6: note: previous declaration of 'resctrl_arch_set_cpu_default_closid_rmid' with type 'void(int,  u32,  u32)' {aka 'void(int,  unsigned int,  unsigned int)'}
      56 | void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:162:20: error: static declaration of 'resctrl_arch_set_closid_rmid' follows non-static declaration
     162 | static inline void resctrl_arch_set_closid_rmid(struct task_struct *tsk,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:55:6: note: previous declaration of 'resctrl_arch_set_closid_rmid' with type 'void(struct task_struct *, u32,  u32)' {aka 'void(struct task_struct *, unsigned int,  unsigned int)'}
      55 | void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:169:20: error: static declaration of 'resctrl_arch_match_closid' follows non-static declaration
     169 | static inline bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:58:6: note: previous declaration of 'resctrl_arch_match_closid' with type 'bool(struct task_struct *, u32)' {aka '_Bool(struct task_struct *, unsigned int)'}
      58 | bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:174:20: error: static declaration of 'resctrl_arch_match_rmid' follows non-static declaration
     174 | static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:59:6: note: previous declaration of 'resctrl_arch_match_rmid' with type 'bool(struct task_struct *, u32,  u32)' {aka '_Bool(struct task_struct *, unsigned int,  unsigned int)'}
      59 | bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:180:20: error: static declaration of 'resctrl_arch_sched_in' follows non-static declaration
     180 | static inline void resctrl_arch_sched_in(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:57:6: note: previous declaration of 'resctrl_arch_sched_in' with type 'void(struct task_struct *)'
      57 | void resctrl_arch_sched_in(struct task_struct *tsk);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:186:20: error: static declaration of 'resctrl_arch_rmid_idx_decode' follows non-static declaration
     186 | static inline void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:61:6: note: previous declaration of 'resctrl_arch_rmid_idx_decode' with type 'void(u32,  u32 *, u32 *)' {aka 'void(unsigned int,  unsigned int *, unsigned int *)'}
      61 | void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:192:19: error: static declaration of 'resctrl_arch_rmid_idx_encode' follows non-static declaration
     192 | static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:60:5: note: previous declaration of 'resctrl_arch_rmid_idx_encode' with type 'u32(u32,  u32)' {aka 'unsigned int(unsigned int,  unsigned int)'}
      60 | u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:199:21: error: static declaration of 'resctrl_arch_mon_ctx_alloc' follows non-static declaration
     199 | static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:65:7: note: previous declaration of 'resctrl_arch_mon_ctx_alloc' with type 'void *(struct rdt_resource *, enum resctrl_event_id)'
      65 | void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:206:20: error: static declaration of 'resctrl_arch_mon_ctx_free' follows non-static declaration
     206 | static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:66:6: note: previous declaration of 'resctrl_arch_mon_ctx_free' with type 'void(struct rdt_resource *, enum resctrl_event_id,  void *)'
      66 | void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/resctrl/mpam_resctrl.c:20:10: fatal error: asm/mpam.h: No such file or directory
      20 | #include <asm/mpam.h>
         |          ^~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_MPAM
   Depends on [n]: ACPI [=y] && ARM64
   Selected by [y]:
   - ARM64_MPAM_DRIVER [=y] && ACPI [=y]


vim +/resctrl_arch_alloc_capable +53 arch/x86/include/asm/resctrl.h

0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25   52  
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @53  static inline bool resctrl_arch_alloc_capable(void)
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   54  {
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   55  	return rdt_alloc_capable;
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   56  }
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   57  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @58  static inline void resctrl_arch_enable_alloc(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   59  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   60  	static_branch_enable_cpuslocked(&rdt_alloc_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   61  	static_branch_inc_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   62  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   63  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @64  static inline void resctrl_arch_disable_alloc(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   65  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   66  	static_branch_disable_cpuslocked(&rdt_alloc_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   67  	static_branch_dec_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   68  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   69  
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @70  static inline bool resctrl_arch_mon_capable(void)
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   71  {
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   72  	return rdt_mon_capable;
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   73  }
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   74  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @75  static inline void resctrl_arch_enable_mon(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   76  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   77  	static_branch_enable_cpuslocked(&rdt_mon_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   78  	static_branch_inc_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   79  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   80  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @81  static inline void resctrl_arch_disable_mon(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   82  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   83  	static_branch_disable_cpuslocked(&rdt_mon_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   84  	static_branch_dec_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   85  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   86  
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  @87  static inline bool resctrl_arch_is_llc_occupancy_enabled(void)
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   88  {
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   89  	return (rdt_mon_features & (1 << QOS_L3_OCCUP_EVENT_ID));
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   90  }
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   91  
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  @92  static inline bool resctrl_arch_is_mbm_total_enabled(void)
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   93  {
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   94  	return (rdt_mon_features & (1 << QOS_L3_MBM_TOTAL_EVENT_ID));
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   95  }
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   96  
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  @97  static inline bool resctrl_arch_is_mbm_local_enabled(void)
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   98  {
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11   99  	return (rdt_mon_features & (1 << QOS_L3_MBM_LOCAL_EVENT_ID));
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  100  }
d012b66a166185 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  101  
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  102  /*
352940ececaca5 arch/x86/include/asm/resctrl_sched.h   Babu Moger         2018-11-21  103   * __resctrl_sched_in() - Writes the task's CLOSid/RMID to IA32_PQR_MSR
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  104   *
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  105   * Following considerations are made so that this has minimal impact
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  106   * on scheduler hot path:
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  107   * - This will stay as no-op unless we are running on an Intel SKU
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  108   *   which supports resource control or monitoring and we enable by
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  109   *   mounting the resctrl file system.
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  110   * - Caches the per cpu CLOSid/RMID values and does the MSR write only
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  111   *   when a task with a different CLOSid/RMID is scheduled in.
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  112   * - We allocate RMIDs/CLOSids globally in order to keep this as
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  113   *   simple as possible.
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  114   * Must be called with preemption disabled.
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  115   */
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  116  static inline void __resctrl_sched_in(struct task_struct *tsk)
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  117  {
352940ececaca5 arch/x86/include/asm/resctrl_sched.h   Babu Moger         2018-11-21  118  	struct resctrl_pqr_state *state = this_cpu_ptr(&pqr_state);
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  119  	u32 closid = READ_ONCE(state->default_closid);
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  120  	u32 rmid = READ_ONCE(state->default_rmid);
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  121  	u32 tmp;
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  122  
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  123  	/*
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  124  	 * If this task has a closid/rmid assigned, use it.
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  125  	 * Else use the closid/rmid assigned to this cpu.
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  126  	 */
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  127  	if (static_branch_likely(&rdt_alloc_enable_key)) {
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  128  		tmp = READ_ONCE(tsk->closid);
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  129  		if (tmp)
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  130  			closid = tmp;
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  131  	}
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  132  
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  133  	if (static_branch_likely(&rdt_mon_enable_key)) {
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  134  		tmp = READ_ONCE(tsk->rmid);
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  135  		if (tmp)
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  136  			rmid = tmp;
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  137  	}
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  138  
a9110b552d44fe arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-08-09  139  	if (closid != state->cur_closid || rmid != state->cur_rmid) {
a9110b552d44fe arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-08-09  140  		state->cur_closid = closid;
a9110b552d44fe arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-08-09  141  		state->cur_rmid = rmid;
97fa21f65c3eb5 arch/x86/include/asm/resctrl.h         Borislav Petkov    2022-11-06  142  		wrmsr(MSR_IA32_PQR_ASSOC, rmid, closid);
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  143  	}
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  144  }
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  145  
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02 @146  static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  147  {
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  148  	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  149  
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  150  	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  151  	val /= scale;
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  152  	return val * scale;
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  153  }
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  154  
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11 @155  static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  156  							    u32 rmid)
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  157  {
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  158  	WRITE_ONCE(per_cpu(pqr_state.default_closid, cpu), closid);
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  159  	WRITE_ONCE(per_cpu(pqr_state.default_rmid, cpu), rmid);
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  160  }
aebd5354dd1918 arch/x86/include/asm/resctrl.h         James Morse        2025-03-11  161  
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @162  static inline void resctrl_arch_set_closid_rmid(struct task_struct *tsk,
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  163  						u32 closid, u32 rmid)
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  164  {
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  165  	WRITE_ONCE(tsk->closid, closid);
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  166  	WRITE_ONCE(tsk->rmid, rmid);
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  167  }
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  168  
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @169  static inline bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  170  {
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  171  	return READ_ONCE(tsk->closid) == closid;
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  172  }
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  173  
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @174  static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  175  					   u32 rmid)
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  176  {
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  177  	return READ_ONCE(tsk->rmid) == rmid;
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  178  }
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  179  
7704fb81bc8725 arch/x86/include/asm/resctrl.h         James Morse        2025-05-15 @180  static inline void resctrl_arch_sched_in(struct task_struct *tsk)
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  181  {
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  182  	if (static_branch_likely(&rdt_enable_key))
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  183  		__resctrl_sched_in(tsk);
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  184  }
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  185  
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @186  static inline void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  187  {
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  188  	*rmid = idx;
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  189  	*closid = X86_RESCTRL_EMPTY_CLOSID;
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  190  }
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  191  
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @192  static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  193  {
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  194  	return rmid;
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  195  }
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  196  
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  197  /* x86 can always read an rmid, nothing needs allocating */
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  198  struct rdt_resource;
272ed1c28c9db6 arch/x86/include/asm/resctrl.h         James Morse        2025-05-15 @199  static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
272ed1c28c9db6 arch/x86/include/asm/resctrl.h         James Morse        2025-05-15  200  					       enum resctrl_event_id evtid)
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  201  {
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  202  	might_sleep();
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  203  	return NULL;
272ed1c28c9db6 arch/x86/include/asm/resctrl.h         James Morse        2025-05-15  204  }
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  205  
272ed1c28c9db6 arch/x86/include/asm/resctrl.h         James Morse        2025-05-15 @206  static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
272ed1c28c9db6 arch/x86/include/asm/resctrl.h         James Morse        2025-05-15  207  					     enum resctrl_event_id evtid,
272ed1c28c9db6 arch/x86/include/asm/resctrl.h         James Morse        2025-05-15  208  					     void *ctx) { }
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  209  

:::::: The code at line 53 was first introduced by commit
:::::: 30017b60706c2ba72a0a4da7d5ef8f5fa95a2f01 x86/resctrl: Add helpers for system wide mon/alloc capable

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
