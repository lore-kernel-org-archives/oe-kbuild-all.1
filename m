Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D401FA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677829753; x=1709365753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTe8tVmVfhI4vIR2PonlHMFEXN3pumTRKFTeh3bNUgQ=;
  b=AtP1BrvtBOy+yk+28LHcjmanex5vdxQkHxvQA0y6sHXQLxh0biOHzent
   aBsonQ5uxveagU7tD5kFQKZX28hnTaKoKSljISZ3AkynAjqLCpa+RVfQP
   JV8VvdU728ptDlXN46cy2PFwz1DGFXOEkfICj9qfIJYckzK9gCFBCouu6
   E3M1usoyj2Y+cyuUAdx1IviDGMyDGUV1f3debzjOJu4md3/Nva4SLq2tC
   thLVTjv/6SrMjWINmnyHO1uP1ZyMPTrew3OJoyxQdJznk1xkgSSnQic5O
   xiURtC96tkai+QUJKYcWpUxdlAPfgna522nmIIz1xNw3Iu0a+5JKbBTBS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314640926"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="314640926"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 23:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004497414"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="1004497414"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2023 23:49:03 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY0A3-0001Iw-0G;
	Fri, 03 Mar 2023 07:49:03 +0000
Date: Fri, 3 Mar 2023 15:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 126/455] arch/x86/kernel/smp.o: warning:
 objtool: sysvec_reboot()+0x45: unreachable instruction
Message-ID: <202303031508.91nWQ6eO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   aecdb3acbd5fa3ee9eb74bdcc86e6b00ab4c3dd4
commit: a2b29c103053ba3d4e6175d0c3cf6548589b43e6 [126/455] x86: Mark stop_this_cpu() __noreturn
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230303/202303031508.91nWQ6eO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=a2b29c103053ba3d4e6175d0c3cf6548589b43e6
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout a2b29c103053ba3d4e6175d0c3cf6548589b43e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031508.91nWQ6eO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x45: unreachable instruction


objdump-func vmlinux.o sysvec_reboot:
0000 00000000000028a0 <sysvec_reboot>:
0000     28a0:	41 54                	push   %r12
0002     28a2:	55                   	push   %rbp
0003     28a3:	48 89 fd             	mov    %rdi,%rbp
0006     28a6:	e8 00 00 00 00       	call   28ab <sysvec_reboot+0xb>	28a7: R_X86_64_PLT32	irqentry_enter-0x4
000b     28ab:	f6 85 88 00 00 00 03 	testb  $0x3,0x88(%rbp)
0012     28b2:	75 4d                	jne    2901 <sysvec_reboot+0x61>
0014     28b4:	41 89 c4             	mov    %eax,%r12d
0017     28b7:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 28be <sysvec_reboot+0x1e>	28ba: R_X86_64_PC32	hardirq_stack_inuse-0x4
001e     28be:	84 c0                	test   %al,%al
0020     28c0:	75 3f                	jne    2901 <sysvec_reboot+0x61>
0022     28c2:	65 c6 05 00 00 00 00 01 	movb   $0x1,%gs:0x0(%rip)        # 28ca <sysvec_reboot+0x2a>	28c5: R_X86_64_PC32	hardirq_stack_inuse-0x5
002a     28ca:	65 4c 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%r11        # 28d2 <sysvec_reboot+0x32>	28ce: R_X86_64_PC32	hardirq_stack_ptr-0x4
0032     28d2:	49 89 23             	mov    %rsp,(%r11)
0035     28d5:	4c 89 dc             	mov    %r11,%rsp
0038     28d8:	e8 00 00 00 00       	call   28dd <sysvec_reboot+0x3d>	28d9: R_X86_64_PLT32	irq_enter_rcu-0x4
003d     28dd:	48 89 ef             	mov    %rbp,%rdi
0040     28e0:	e8 00 00 00 00       	call   28e5 <sysvec_reboot+0x45>	28e1: R_X86_64_PC32	.text+0xbd71c
0045     28e5:	e8 00 00 00 00       	call   28ea <sysvec_reboot+0x4a>	28e6: R_X86_64_PLT32	irq_exit_rcu-0x4
004a     28ea:	5c                   	pop    %rsp
004b     28eb:	65 c6 05 00 00 00 00 00 	movb   $0x0,%gs:0x0(%rip)        # 28f3 <sysvec_reboot+0x53>	28ee: R_X86_64_PC32	hardirq_stack_inuse-0x5
0053     28f3:	44 89 e6             	mov    %r12d,%esi
0056     28f6:	48 89 ef             	mov    %rbp,%rdi
0059     28f9:	5d                   	pop    %rbp
005a     28fa:	41 5c                	pop    %r12
005c     28fc:	e9 00 00 00 00       	jmp    2901 <sysvec_reboot+0x61>	28fd: R_X86_64_PLT32	irqentry_exit-0x4
0061     2901:	e8 00 00 00 00       	call   2906 <sysvec_reboot+0x66>	2902: R_X86_64_PLT32	irq_enter_rcu-0x4
0066     2906:	48 89 ef             	mov    %rbp,%rdi
0069     2909:	e8 00 00 00 00       	call   290e <sysvec_reboot+0x6e>	290a: R_X86_64_PC32	.text+0xbd71c
006e     290e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
