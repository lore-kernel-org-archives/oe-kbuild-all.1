Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1AA7F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 02:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692842511; x=1724378511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pff9P6omu0417kQSkauj3S5oSd2vWr3KFnDdP6Mlivc=;
  b=UQZP2UsBcvqIJYdj/YbnqkzmCcClU6HPuxVcKGdoajFEcpL7WINpqBFl
   pQ0M5nXMzUu2AwlI1aWuIF/7hS0Wtmy/HR643sbebKMoh+X/Mft1OtQeh
   Y/uM/ohnRYCwsTOCD3xC5JpSU4GzTH34hMagx1pE5FVhbGg6mwseq4Bmh
   nAZpJFLHUjDV1asG4WWaUyIBqlyiiWYugdAMq0Qe2hZ7bt/ixndnYAowt
   kARkpjqxez5W2oxFPXvjPfxm7BzYHvzymr3bIyMrFvPP7lp4DmC9CskyK
   zo+cJnWCSrYimGxrgfwF0MdOHkkP0LTuA+NFrmTWbbPpYbXYkOmEDe+k6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="371733419"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="371733419"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 19:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730419084"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730419084"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 19:01:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYzeo-0001fK-0L;
	Thu, 24 Aug 2023 02:01:10 +0000
Date: Thu, 24 Aug 2023 10:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 6360/9999] arch/x86/kernel/smp.o: warning:
 objtool: sysvec_reboot()+0x67: unreachable instruction
Message-ID: <202308240914.0a0NGKBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee [6360/9999] x86: Mark stop_this_cpu() __noreturn
config: x86_64-randconfig-101-20230824 (https://download.01.org/0day-ci/archive/20230824/202308240914.0a0NGKBw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240914.0a0NGKBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240914.0a0NGKBw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x67: unreachable instruction


objdump-func vmlinux.o sysvec_reboot:
0000 00000000000027c0 <sysvec_reboot>:
0000     27c0:	55                   	push   %rbp
0001     27c1:	53                   	push   %rbx
0002     27c2:	48 89 fb             	mov    %rdi,%rbx
0005     27c5:	e8 00 00 00 00       	call   27ca <sysvec_reboot+0xa>	27c6: R_X86_64_PLT32	irqentry_enter-0x4
000a     27ca:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0011     27d1:	75 7a                	jne    284d <sysvec_reboot+0x8d>
0013     27d3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	27d6: R_X86_64_32S	.rodata+0x47ac0
001a     27da:	89 c5                	mov    %eax,%ebp
001c     27dc:	e8 00 00 00 00       	call   27e1 <sysvec_reboot+0x21>	27dd: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
0021     27e1:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 27e8 <sysvec_reboot+0x28>	27e4: R_X86_64_PC32	hardirq_stack_inuse-0x4
0028     27e8:	84 c0                	test   %al,%al
002a     27ea:	75 61                	jne    284d <sysvec_reboot+0x8d>
002c     27ec:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	27ef: R_X86_64_32S	.rodata+0x47b00
0033     27f3:	e8 00 00 00 00       	call   27f8 <sysvec_reboot+0x38>	27f4: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
0038     27f8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	27fb: R_X86_64_32S	.rodata+0x47ac0
003f     27ff:	65 c6 05 00 00 00 00 01 	movb   $0x1,%gs:0x0(%rip)        # 2807 <sysvec_reboot+0x47>	2802: R_X86_64_PC32	hardirq_stack_inuse-0x5
0047     2807:	e8 00 00 00 00       	call   280c <sysvec_reboot+0x4c>	2808: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
004c     280c:	65 4c 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%r11        # 2814 <sysvec_reboot+0x54>	2810: R_X86_64_PC32	hardirq_stack_ptr-0x4
0054     2814:	49 89 23             	mov    %rsp,(%r11)
0057     2817:	4c 89 dc             	mov    %r11,%rsp
005a     281a:	e8 00 00 00 00       	call   281f <sysvec_reboot+0x5f>	281b: R_X86_64_PLT32	irq_enter_rcu-0x4
005f     281f:	48 89 df             	mov    %rbx,%rdi
0062     2822:	e8 00 00 00 00       	call   2827 <sysvec_reboot+0x67>	2823: R_X86_64_PC32	.text+0xf349c
0067     2827:	e8 00 00 00 00       	call   282c <sysvec_reboot+0x6c>	2828: R_X86_64_PLT32	irq_exit_rcu-0x4
006c     282c:	5c                   	pop    %rsp
006d     282d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2830: R_X86_64_32S	.rodata+0x47b00
0074     2834:	e8 00 00 00 00       	call   2839 <sysvec_reboot+0x79>	2835: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
0079     2839:	89 ee                	mov    %ebp,%esi
007b     283b:	48 89 df             	mov    %rbx,%rdi
007e     283e:	65 c6 05 00 00 00 00 00 	movb   $0x0,%gs:0x0(%rip)        # 2846 <sysvec_reboot+0x86>	2841: R_X86_64_PC32	hardirq_stack_inuse-0x5
0086     2846:	5b                   	pop    %rbx
0087     2847:	5d                   	pop    %rbp
0088     2848:	e9 00 00 00 00       	jmp    284d <sysvec_reboot+0x8d>	2849: R_X86_64_PLT32	irqentry_exit-0x4
008d     284d:	e8 00 00 00 00       	call   2852 <sysvec_reboot+0x92>	284e: R_X86_64_PLT32	irq_enter_rcu-0x4
0092     2852:	48 89 df             	mov    %rbx,%rdi
0095     2855:	e8 00 00 00 00       	call   285a <sysvec_reboot+0x9a>	2856: R_X86_64_PC32	.text+0xf349c
009a     285a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
