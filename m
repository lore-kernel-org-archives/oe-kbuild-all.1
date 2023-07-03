Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E546AC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688394556; x=1719930556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YO/s5fuRw43m0mOZ3YH14JbaM2xXN5nMuGHfZDhTHds=;
  b=SZ1PalKV+fyWtBs+J2dT2gWl7/ToNmvhTVoI2oJeti6MFNsX2V7LGf/f
   Ax+CbipVj/siCQ9KeRh1aJtzBodQPqz53ZwMWFQECH1I95/TmiWmS5Yr1
   oh2KaKYmiww2DTUwbBl75W3UEOx6X29DxGm7kqWxv8OebU+lEmogaJqGI
   ar8p78Oa4WugRStshFSGO/i+KmLBC3/m7yJBQbxxmXahwBbZtZ//bnsAu
   QG1SU4YRlliswyoixhV921tu5sQSRLHlot9WsuupauGzcnltMZjQMV6rM
   hWhi0M25jlLJYiG2hMG8URm6OyJLY4uUTVu8dzh0c1cd2E7RPlWhroj2L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="362932597"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="362932597"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 07:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="718618038"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="718618038"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2023 07:29:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGKYC-000HQ7-05;
	Mon, 03 Jul 2023 14:29:12 +0000
Date: Mon, 3 Jul 2023 22:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/urgent 5/6] vmlinux.o: warning: objtool:
 ret_from_fork+0xd: call to schedule_tail() leaves .noinstr.text section
Message-ID: <202307032223.Tm7TTR1m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   3c8ca29c93d9e9e436f1f7752c35527d2f5c1894
commit: 8301c8b22d90d9a142dd17750f1df9211d826b7a [5/6] x86: Rewrite ret_from_fork() in C
config: x86_64-buildonly-randconfig-r003-20230703 (https://download.01.org/0day-ci/archive/20230703/202307032223.Tm7TTR1m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307032223.Tm7TTR1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307032223.Tm7TTR1m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ret_from_fork+0xd: call to schedule_tail() leaves .noinstr.text section


objdump-func vmlinux.o ret_from_fork:
0000 0000000000000d00 <ret_from_fork_asm>:
0000      d00:	90                   	nop
0001      d01:	90                   	nop
0002      d02:	90                   	nop
0003      d03:	90                   	nop
0004      d04:	90                   	nop
0005      d05:	90                   	nop
0006      d06:	90                   	nop
0007      d07:	90                   	nop
0008      d08:	90                   	nop
0009      d09:	90                   	nop
000a      d0a:	48 89 c7             	mov    %rax,%rdi
000d      d0d:	48 89 e6             	mov    %rsp,%rsi
0010      d10:	48 89 da             	mov    %rbx,%rdx
0013      d13:	4c 89 e1             	mov    %r12,%rcx
0016      d16:	e8 00 00 00 00       	call   d1b <ret_from_fork_asm+0x1b>	d17: R_X86_64_PLT32	ret_from_fork-0x4
001b      d1b:	e9 00 00 00 00       	jmp    d20 <ret_from_fork_asm+0x20>	d1c: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0020      d20:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
002b      d2b:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0036      d36:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0040      d40:	90                   	nop
0041      d41:	90                   	nop
0042      d42:	90                   	nop
0043      d43:	90                   	nop
0044      d44:	90                   	nop
0045      d45:	90                   	nop
0046      d46:	90                   	nop
0047      d47:	90                   	nop
0048      d48:	90                   	nop
0049      d49:	90                   	nop
004a      d4a:	90                   	nop
004b      d4b:	90                   	nop
004c      d4c:	90                   	nop
004d      d4d:	90                   	nop
004e      d4e:	90                   	nop
004f      d4f:	90                   	nop
0050      d50:	90                   	nop
0051      d51:	90                   	nop
0052      d52:	90                   	nop
0053      d53:	90                   	nop
0054      d54:	90                   	nop
0055      d55:	90                   	nop
0056      d56:	90                   	nop
0057      d57:	90                   	nop
0058      d58:	90                   	nop
0059      d59:	90                   	nop
005a      d5a:	90                   	nop
005b      d5b:	90                   	nop
005c      d5c:	90                   	nop
005d      d5d:	90                   	nop
005e      d5e:	90                   	nop
005f      d5f:	90                   	nop
0060      d60:	90                   	nop
0061      d61:	90                   	nop
0062      d62:	90                   	nop
0063      d63:	90                   	nop
0064      d64:	90                   	nop
0065      d65:	90                   	nop
0066      d66:	90                   	nop
0067      d67:	90                   	nop
0068      d68:	90                   	nop
0069      d69:	90                   	nop
006a      d6a:	90                   	nop
006b      d6b:	90                   	nop
006c      d6c:	90                   	nop
006d      d6d:	90                   	nop
006e      d6e:	90                   	nop
006f      d6f:	90                   	nop
0070      d70:	90                   	nop
0071      d71:	90                   	nop
0072      d72:	90                   	nop
0073      d73:	90                   	nop
0074      d74:	90                   	nop
0075      d75:	90                   	nop
0076      d76:	90                   	nop
0077      d77:	90                   	nop
0078      d78:	90                   	nop
0079      d79:	90                   	nop
007a      d7a:	90                   	nop
007b      d7b:	90                   	nop
007c      d7c:	90                   	nop
007d      d7d:	90                   	nop
007e      d7e:	90                   	nop
007f      d7f:	90                   	nop
0000 0000000000002447 <ret_from_fork>:
0000     2447:	41 54                	push   %r12
0002     2449:	49 89 cc             	mov    %rcx,%r12
0005     244c:	55                   	push   %rbp
0006     244d:	48 89 d5             	mov    %rdx,%rbp
0009     2450:	53                   	push   %rbx
000a     2451:	48 89 f3             	mov    %rsi,%rbx
000d     2454:	e8 00 00 00 00       	call   2459 <ret_from_fork+0x12>	2455: R_X86_64_PLT32	schedule_tail-0x4
0012     2459:	48 85 ed             	test   %rbp,%rbp
0015     245c:	74 0e                	je     246c <ret_from_fork+0x25>
0017     245e:	4c 89 e7             	mov    %r12,%rdi
001a     2461:	e8 00 00 00 00       	call   2466 <ret_from_fork+0x1f>	2462: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
001f     2466:	31 c0                	xor    %eax,%eax
0021     2468:	48 89 43 50          	mov    %rax,0x50(%rbx)
0025     246c:	48 89 df             	mov    %rbx,%rdi
0028     246f:	5b                   	pop    %rbx
0029     2470:	5d                   	pop    %rbp
002a     2471:	41 5c                	pop    %r12
002c     2473:	e9 00 00 00 00       	jmp    2478 <__pfx_fpu_idle_fpregs>	2474: R_X86_64_PLT32	syscall_exit_to_user_mode-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
