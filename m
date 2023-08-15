Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDAD1426C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692127423; x=1723663423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gp2+KzE50abHY1M7P/w5vM5Xmdfds0OaRWKBdWmizP0=;
  b=Tgu1MgbfQBJ+7qI5MsqPMokJvoamaoUxKpNhZkkrNFZJ02mpv83/Se62
   AA3qFqySdJr4q+JJV2LQTShvD7PArFF+HhwVWjf2+GsRD57Nf0p7XOrh3
   dFAyp6V6TdtKqJlJmOOV9VVDoPYI6CY8RLw4tyNkmcoqTobOEsLoDsacT
   wIeVKf8qlmWQOPW2K8rR8ty+9FKg8QPO52LekFbM8MIZj/voelX0wvGe+
   2CiLjLTKwWnPPgMDhhiv0zOJczlm0wslbrTdXtBA4y4h3OHOWYENtz0rQ
   9y/xQ6DdXEpkRQ+O9tBzwUPsbfSbz55u4VmLaTRH5HZ5A5oojgRehV9C4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436254305"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="436254305"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 12:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683761491"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="683761491"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 12:23:41 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVzdk-0001BP-1j;
	Tue, 15 Aug 2023 19:23:40 +0000
Date: Wed, 16 Aug 2023 03:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: vmlinux.o: warning: objtool: cw1200_handle_pspoll.isra.0.cold+0x19:
 relocation to !ENDBR: cw1200_handle_pspoll.isra.0+0x172
Message-ID: <202308160300.zefdv91N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   91aa6c412d7f85e48aead7b00a7d9e91f5cf5863
commit: 0cae5ded535c3a80aed94f119bbd4ee3ae284a65 rcu: Make RCU_LOCKDEP_WARN() avoid early lockdep checks
date:   7 months ago
config: x86_64-randconfig-r011-20230815 (https://download.01.org/0day-ci/archive/20230816/202308160300.zefdv91N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160300.zefdv91N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160300.zefdv91N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __ct_user_exit+0x3f: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x5d: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: bnx2fc_interface_setup+0x100: relocation to !ENDBR: bnx2fc_interface_setup.cold+0x231
>> vmlinux.o: warning: objtool: cw1200_handle_pspoll.isra.0.cold+0x19: relocation to !ENDBR: cw1200_handle_pspoll.isra.0+0x172


objdump-func vmlinux.o cw1200_handle_pspoll.isra.0.cold:
0000 00000000003fef70 <cw1200_handle_pspoll.isra.0.cold>:
0000   3fef70:	49 63 d5             	movslq %r13d,%rdx
0003   3fef73:	be 01 00 00 00       	mov    $0x1,%esi
0008   3fef78:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3fef7b: R_X86_64_32S	.data+0x17d7a20
000f   3fef7f:	e8 00 00 00 00       	call   3fef84 <cw1200_handle_pspoll.isra.0.cold+0x14>	3fef80: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0014   3fef84:	e8 00 00 00 00       	call   3fef89 <cw1200_handle_pspoll.isra.0.cold+0x19>	3fef85: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0019   3fef89:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	3fef8c: R_X86_64_32S	.text+0x46ee322
0020   3fef90:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3fef93: R_X86_64_32S	rcu_lock_map
0027   3fef97:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 3fef9d <cw1200_handle_pspoll.isra.0.cold+0x2d>	3fef99: R_X86_64_PC32	pcpu_hot+0x4
002d   3fef9d:	e8 00 00 00 00       	call   3fefa2 <cw1200_handle_pspoll.isra.0.cold+0x32>	3fef9e: R_X86_64_PLT32	lock_release-0x4
0032   3fefa2:	e9 00 00 00 00       	jmp    3fefa7 <tx_policy_get.constprop.0.cold>	3fefa3: R_X86_64_PC32	.text+0x46ee345

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
