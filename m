Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C27E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676854135; x=1708390135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uGFhoAHp4bpjaWcIfWdgGu88h+N13xAJQDxfIS8X998=;
  b=BeEeTxLv/6o5cFkJwp0JhNYI/iYwN7B6rnxdCCwVfF7bUxuYD5Ldj64l
   m4RkN++uyBgAXarYcLcqduWyci96o90EpQMxFIHlERndIFedh6pz/T1yF
   dMX7hcXbyh8X8PkNIj4HvBDcNueOYcuLcSW4DnDACbWrvHbB5MGRnyM47
   bHb9nl4u3iIxBf9KPpbh/DL89ZVmTToYrVuLqByeUFn+t11cSuG4SEvie
   odKBC6KFhqhLXIbp+twvDbC5qeOhMmoEumPi/SMA7sMMLi22YcqO9/615
   G3cDoiJ5zcUG+h75Z+09en1Oe3Wf8Se9u5nMJhvkO5+03gmajmFlv6CaJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394781422"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="394781422"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 16:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701509734"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="701509734"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Feb 2023 16:48:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTuMN-000DWC-0B;
	Mon, 20 Feb 2023 00:48:51 +0000
Date: Mon, 20 Feb 2023 08:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: vmlinux.o: warning: objtool: ct_irq_enter+0x38: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202302200852.lvnSFWXv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frederic,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
commit: 3864caafe7c66f01b188ffccb6a4215f3bf56292 rcu/context-tracking: Remove rcu_irq_enter/exit()
date:   8 months ago
config: x86_64-randconfig-a001-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200852.lvnSFWXv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3864caafe7c66f01b188ffccb6a4215f3bf56292
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3864caafe7c66f01b188ffccb6a4215f3bf56292
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200852.lvnSFWXv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x89: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x1a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit.constprop.0+0x1b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter.constprop.0+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x60: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_exit+0x38: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o ct_irq_enter:
0000 00000000000034ca <ct_irq_enter>:
0000     34ca:	f3 0f 1e fa          	endbr64
0004     34ce:	55                   	push   %rbp
0005     34cf:	8b 2d 00 00 00 00    	mov    0x0(%rip),%ebp        # 34d5 <ct_irq_enter+0xb>	34d1: R_X86_64_PC32	debug_locks-0x4
000b     34d5:	85 ed                	test   %ebp,%ebp
000d     34d7:	74 1c                	je     34f5 <ct_irq_enter+0x2b>
000f     34d9:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 34e0 <ct_irq_enter+0x16>	34dc: R_X86_64_PC32	lockdep_recursion-0x4
0016     34e0:	31 ed                	xor    %ebp,%ebp
0018     34e2:	85 c0                	test   %eax,%eax
001a     34e4:	75 0f                	jne    34f5 <ct_irq_enter+0x2b>
001c     34e6:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 34ed <ct_irq_enter+0x23>	34e9: R_X86_64_PC32	hardirqs_enabled-0x4
0023     34ed:	31 ed                	xor    %ebp,%ebp
0025     34ef:	85 c0                	test   %eax,%eax
0027     34f1:	40 0f 95 c5          	setne  %bpl
002b     34f5:	31 c9                	xor    %ecx,%ecx
002d     34f7:	31 d2                	xor    %edx,%edx
002f     34f9:	89 ee                	mov    %ebp,%esi
0031     34fb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	34fe: R_X86_64_32S	_ftrace_annotated_branch+0x545d0
0038     3502:	e8 00 00 00 00       	call   3507 <ct_irq_enter+0x3d>	3503: R_X86_64_PLT32	ftrace_likely_update-0x4
003d     3507:	85 ed                	test   %ebp,%ebp
003f     3509:	74 04                	je     350f <ct_irq_enter+0x45>
0041     350b:	90                   	nop
0042     350c:	0f 0b                	ud2
0044     350e:	90                   	nop
0045     350f:	89 ee                	mov    %ebp,%esi
0047     3511:	31 c9                	xor    %ecx,%ecx
0049     3513:	31 d2                	xor    %edx,%edx
004b     3515:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3518: R_X86_64_32S	_ftrace_annotated_branch+0x545a0
0052     351c:	e8 00 00 00 00       	call   3521 <ct_irq_enter+0x57>	351d: R_X86_64_PLT32	ftrace_likely_update-0x4
0057     3521:	5d                   	pop    %rbp
0058     3522:	eb 9d                	jmp    34c1 <ct_nmi_enter>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
