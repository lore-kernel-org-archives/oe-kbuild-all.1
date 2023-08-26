Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC037D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 04:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693025617; x=1724561617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVMOXbo/kaG6rthb+aRRLbglhSyvRmw8/a9a8aWs5Xc=;
  b=GJcEBkB33wj2EeDsH6JG7ypBk/ynTjWX2SbqeEd5B2e6ubM0xO+yPYqP
   Dy0j9UBb3tBzzUQztLZNQS7srd2muwmlt7htHe39KCV1ktHXiBNAHFGQJ
   otrn8TQf+UzwbEJQ6WOJIwqeYBdbmPF9Ld4GtEcsNkCRKD9jYNHMY7koz
   6xa8vYTeAsqzhgDIz8+lzOjxyMyKY00dc3G9K1mJX9xzTAEr8P2qiF90b
   gmS35iM9Y7pELCmPZAgL28S+ml2QQbqEepJF2xevCxJJuH/axWkiRu6vr
   FhrsOqvV8IWtR73DIr0U5G7NSFsRo7y1TTBqYP/2Jph4uDOs8qb8FpMsI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373721649"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="373721649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 21:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731258568"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="731258568"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 21:53:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZlIj-0004MZ-1d;
	Sat, 26 Aug 2023 04:53:33 +0000
Date: Sat, 26 Aug 2023 12:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Borislav Petkov <bp@suse.de>,
	Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
	Ben Hutchings <bwh@kernel.org>
Subject: [stable:linux-5.4.y 5560/9456] arch/x86/kvm/vmx/vmenter.o: warning:
 objtool: __vmx_vcpu_run()+0xb5: unsupported intra-function call
Message-ID: <202308261259.uYJOa5NK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   fd2a1d1f32ea37c57a8b46a0857f06fd7274dd2c
commit: 5895a9297e609363ba4003c9d5839c967b237389 [5560/9456] KVM: VMX: Flatten __vmx_vcpu_run()
config: x86_64-randconfig-005-20230823 (https://download.01.org/0day-ci/archive/20230826/202308261259.uYJOa5NK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261259.uYJOa5NK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261259.uYJOa5NK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmenter.o: warning: objtool: __vmx_vcpu_run()+0xb5: unsupported intra-function call
   arch/x86/kvm/vmx/vmenter.o: warning: objtool: If this is a retpoline, please patch it in with alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.


objdump-func vmlinux.o __vmx_vcpu_run:
0000 0000000000141270 <__vmx_vcpu_run>:
0000   141270:	55                   	push   %rbp
0001   141271:	48 89 e5             	mov    %rsp,%rbp
0004   141274:	41 57                	push   %r15
0006   141276:	41 56                	push   %r14
0008   141278:	41 55                	push   %r13
000a   14127a:	41 54                	push   %r12
000c   14127c:	53                   	push   %rbx
000d   14127d:	56                   	push   %rsi
000e   14127e:	88 d3                	mov    %dl,%bl
0010   141280:	48 8d 34 24          	lea    (%rsp),%rsi
0014   141284:	e8 00 00 00 00       	call   141289 <__vmx_vcpu_run+0x19>	141285: R_X86_64_PLT32	vmx_update_host_rsp-0x4
0019   141289:	48 8b 04 24          	mov    (%rsp),%rax
001d   14128d:	84 db                	test   %bl,%bl
001f   14128f:	48 8b 58 18          	mov    0x18(%rax),%rbx
0023   141293:	48 8b 48 08          	mov    0x8(%rax),%rcx
0027   141297:	48 8b 50 10          	mov    0x10(%rax),%rdx
002b   14129b:	48 8b 70 30          	mov    0x30(%rax),%rsi
002f   14129f:	48 8b 78 38          	mov    0x38(%rax),%rdi
0033   1412a3:	48 8b 68 28          	mov    0x28(%rax),%rbp
0037   1412a7:	4c 8b 40 40          	mov    0x40(%rax),%r8
003b   1412ab:	4c 8b 48 48          	mov    0x48(%rax),%r9
003f   1412af:	4c 8b 50 50          	mov    0x50(%rax),%r10
0043   1412b3:	4c 8b 58 58          	mov    0x58(%rax),%r11
0047   1412b7:	4c 8b 60 60          	mov    0x60(%rax),%r12
004b   1412bb:	4c 8b 68 68          	mov    0x68(%rax),%r13
004f   1412bf:	4c 8b 70 70          	mov    0x70(%rax),%r14
0053   1412c3:	4c 8b 78 78          	mov    0x78(%rax),%r15
0057   1412c7:	48 8b 00             	mov    (%rax),%rax
005a   1412ca:	74 08                	je     1412d4 <__vmx_vcpu_run+0x64>
005c   1412cc:	0f 01 c3             	vmresume
005f   1412cf:	e9 b6 00 00 00       	jmp    14138a <vmx_vmexit+0xae>
0064   1412d4:	0f 01 c2             	vmlaunch
0067   1412d7:	e9 ae 00 00 00       	jmp    14138a <vmx_vmexit+0xae>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
