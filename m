Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE71369B4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722691968; cv=none; b=sMPGWa0vZLdU0mXlPJvvSlf40US6WnIYlqvvYFe5drnZwBEXW2iuOEEP0bvYf4/+Hz3jRLoVc6OUIT0YXXY+J4eLEv65cvkvXCJnG0+7wq6yOxd4jVR8SgRbGBSo/cfTyXNYVDsBC/udhpA9Uae3N8nLf/1TkMHTzyyqwGQE9pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722691968; c=relaxed/simple;
	bh=ViFTdZkb/TqIBnmIhUYkmSC7PyEg7Oc6DtiB273/H18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eoLmgV0LnD4mY9+aHgW3Yf2lzOfqlLhXJEkU6wPnMWPL5i8tleHPtQO0AKR7SlCKgkByJXRnjutLuN1GNkaKJK0en7G8eheKvXxZSfxj1lkPPGlM+GlMTgwq8shRjS1XuSV7egKxMAuDagdjqDUlrqbcZs3pCwtpKin4q7yViXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtDh/iDQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtDh/iDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722691966; x=1754227966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ViFTdZkb/TqIBnmIhUYkmSC7PyEg7Oc6DtiB273/H18=;
  b=CtDh/iDQlaGav3dXuBfDpXKG3DiPM1Yw8aBgddKVeFNnXiFptxnsHRRm
   df9hrIpzD1SY2o1/13y7/3SwXKc35pbV40/6C+WRPc6rn2355HGFvwf+E
   WnTIfoQWBFZbZSy8bjBoPGNBE5vXs1W/bsDkvmc9U+XWjWONQBMZfUbV5
   qAcsIpH1jgvK6Fpoj4Xld0AtJtJRL33FjldietZNPmtd2AhcA3V5KdOZZ
   RAye7An7sGw50HDKZHn/OZ1eYy8rDgOPAohiCu3MkSizDNGSXSgYS1pT7
   FBHZLItmErXuVPTrG1TJj7/r4Fu7VCytv0DasD2WhFU6WmZsCY0AOawmW
   g==;
X-CSE-ConnectionGUID: 2VuOw5EDSsOoycV61v8RWw==
X-CSE-MsgGUID: wjGgsD6VTb6p7ic+US8MBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="38201374"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="38201374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 06:32:31 -0700
X-CSE-ConnectionGUID: 1X+RECx5TBmydxeJ65+kkw==
X-CSE-MsgGUID: IuIFjs1wRCOFEj0vQAz15g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="55360806"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Aug 2024 06:32:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saEs0-0000Tq-1h;
	Sat, 03 Aug 2024 13:32:28 +0000
Date: Sat, 3 Aug 2024 21:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.11-rc1 114/128]
 arch/x86/include/asm/resctrl.h:205:21: error: conflicting types for
 'resctrl_arch_mon_ctx_alloc'; have 'void *(struct rdt_resource *, int)'
Message-ID: <202408032113.y76zoLS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   063bc546005302904092c158fe3228dc8af798a9
commit: f6cf53b477a878020ffbcbfcfc4bc520d6b5332a [114/128] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408032113.y76zoLS3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408032113.y76zoLS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408032113.y76zoLS3-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:92:20: note: previous definition of 'resctrl_arch_enable_alloc' with type 'void(void)'
      92 | static inline void resctrl_arch_enable_alloc(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:64:20: error: redefinition of 'resctrl_arch_disable_alloc'
      64 | static inline void resctrl_arch_disable_alloc(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:93:20: note: previous definition of 'resctrl_arch_disable_alloc' with type 'void(void)'
      93 | static inline void resctrl_arch_disable_alloc(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:70:20: error: static declaration of 'resctrl_arch_mon_capable' follows non-static declaration
      70 | static inline bool resctrl_arch_mon_capable(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:55:6: note: previous declaration of 'resctrl_arch_mon_capable' with type 'bool(void)' {aka '_Bool(void)'}
      55 | bool resctrl_arch_mon_capable(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:75:20: error: redefinition of 'resctrl_arch_enable_mon'
      75 | static inline void resctrl_arch_enable_mon(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:90:20: note: previous definition of 'resctrl_arch_enable_mon' with type 'void(void)'
      90 | static inline void resctrl_arch_enable_mon(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:81:20: error: redefinition of 'resctrl_arch_disable_mon'
      81 | static inline void resctrl_arch_disable_mon(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:91:20: note: previous definition of 'resctrl_arch_disable_mon' with type 'void(void)'
      91 | static inline void resctrl_arch_disable_mon(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:87:20: error: static declaration of 'resctrl_arch_is_llc_occupancy_enabled' follows non-static declaration
      87 | static inline bool resctrl_arch_is_llc_occupancy_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:56:6: note: previous declaration of 'resctrl_arch_is_llc_occupancy_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      56 | bool resctrl_arch_is_llc_occupancy_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:92:20: error: static declaration of 'resctrl_arch_is_mbm_total_enabled' follows non-static declaration
      92 | static inline bool resctrl_arch_is_mbm_total_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:58:6: note: previous declaration of 'resctrl_arch_is_mbm_total_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      58 | bool resctrl_arch_is_mbm_total_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:97:20: error: static declaration of 'resctrl_arch_is_mbm_local_enabled' follows non-static declaration
      97 | static inline bool resctrl_arch_is_mbm_local_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:57:6: note: previous declaration of 'resctrl_arch_is_mbm_local_enabled' with type 'bool(void)' {aka '_Bool(void)'}
      57 | bool resctrl_arch_is_mbm_local_enabled(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:146:28: error: redefinition of 'resctrl_arch_round_mon_val'
     146 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:43:28: note: previous definition of 'resctrl_arch_round_mon_val' with type 'unsigned int(unsigned int)'
      43 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:155:20: error: static declaration of 'resctrl_arch_set_cpu_default_closid_rmid' follows non-static declaration
     155 | static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:65:6: note: previous declaration of 'resctrl_arch_set_cpu_default_closid_rmid' with type 'void(int,  u32,  u32)' {aka 'void(int,  unsigned int,  unsigned int)'}
      65 | void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 pmg);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:162:20: error: static declaration of 'resctrl_arch_set_closid_rmid' follows non-static declaration
     162 | static inline void resctrl_arch_set_closid_rmid(struct task_struct *tsk,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:64:6: note: previous declaration of 'resctrl_arch_set_closid_rmid' with type 'void(struct task_struct *, u32,  u32)' {aka 'void(struct task_struct *, unsigned int,  unsigned int)'}
      64 | void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:169:20: error: static declaration of 'resctrl_arch_match_closid' follows non-static declaration
     169 | static inline bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:69:6: note: previous declaration of 'resctrl_arch_match_closid' with type 'bool(struct task_struct *, u32)' {aka '_Bool(struct task_struct *, unsigned int)'}
      69 | bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:174:20: error: static declaration of 'resctrl_arch_match_rmid' follows non-static declaration
     174 | static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:70:6: note: previous declaration of 'resctrl_arch_match_rmid' with type 'bool(struct task_struct *, u32,  u32)' {aka '_Bool(struct task_struct *, unsigned int,  unsigned int)'}
      70 | bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:180:20: error: static declaration of 'resctrl_arch_sched_in' follows non-static declaration
     180 | static inline void resctrl_arch_sched_in(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:66:6: note: previous declaration of 'resctrl_arch_sched_in' with type 'void(struct task_struct *)'
      66 | void resctrl_arch_sched_in(struct task_struct *tsk);
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:186:19: error: static declaration of 'resctrl_arch_system_num_rmid_idx' follows non-static declaration
     186 | static inline u32 resctrl_arch_system_num_rmid_idx(void)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:73:5: note: previous declaration of 'resctrl_arch_system_num_rmid_idx' with type 'u32(void)' {aka 'unsigned int(void)'}
      73 | u32 resctrl_arch_system_num_rmid_idx(void);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:192:20: error: static declaration of 'resctrl_arch_rmid_idx_decode' follows non-static declaration
     192 | static inline void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:72:6: note: previous declaration of 'resctrl_arch_rmid_idx_decode' with type 'void(u32,  u32 *, u32 *)' {aka 'void(unsigned int,  unsigned int *, unsigned int *)'}
      72 | void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:198:19: error: static declaration of 'resctrl_arch_rmid_idx_encode' follows non-static declaration
     198 | static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:71:5: note: previous declaration of 'resctrl_arch_rmid_idx_encode' with type 'u32(u32,  u32)' {aka 'unsigned int(unsigned int,  unsigned int)'}
      71 | u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:205:21: error: conflicting types for 'resctrl_arch_mon_ctx_alloc'; have 'void *(struct rdt_resource *, int)'
     205 | static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:76:7: note: previous declaration of 'resctrl_arch_mon_ctx_alloc' with type 'void *(struct rdt_resource *, enum resctrl_event_id)'
      76 | void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/resctrl.h:211:20: error: conflicting types for 'resctrl_arch_mon_ctx_free'; have 'void(struct rdt_resource *, int,  void *)'
     211 | static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_mpam.h:77:6: note: previous declaration of 'resctrl_arch_mon_ctx_free' with type 'void(struct rdt_resource *, enum resctrl_event_id,  void *)'
      77 | void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/arm64/mpam/mpam_resctrl.c:19:10: fatal error: asm/mpam.h: No such file or directory
      19 | #include <asm/mpam.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +205 arch/x86/include/asm/resctrl.h

6791e0ea30711b James Morse 2024-02-13  202  
e557999f80a5ee James Morse 2024-02-13  203  /* x86 can always read an rmid, nothing needs allocating */
e557999f80a5ee James Morse 2024-02-13  204  struct rdt_resource;
e557999f80a5ee James Morse 2024-02-13 @205  static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
e557999f80a5ee James Morse 2024-02-13  206  {
e557999f80a5ee James Morse 2024-02-13  207  	might_sleep();
e557999f80a5ee James Morse 2024-02-13  208  	return NULL;
e557999f80a5ee James Morse 2024-02-13  209  };
e557999f80a5ee James Morse 2024-02-13  210  
e557999f80a5ee James Morse 2024-02-13 @211  static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid,
e557999f80a5ee James Morse 2024-02-13  212  					     void *ctx) { };
e557999f80a5ee James Morse 2024-02-13  213  

:::::: The code at line 205 was first introduced by commit
:::::: e557999f80a5ee4ec812f594ab42bb76c3ec4eb2 x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
