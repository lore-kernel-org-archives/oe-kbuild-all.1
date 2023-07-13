Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D7211A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 07:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689232587; x=1720768587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGSmS/H6DFVhj6LlnNRRz2gGkoKz2di/p/j4elkxvYw=;
  b=ljhMxwjLolJajLc7VXYK2S49FK9q842ZNgdsBBrbPhvP+t8zMIT5M1T7
   MSu24u+JB89+iyYSr58ZTyFEnn4c7W9kPDbFX8Bbq5/pblJqwJ4Y+j8p8
   lJlkOu8Oiil6QUyszQe8fqNRfRM2pS1PjDNzgbiRtuHVUhUIzFP4Z84T+
   o4nW2j5tfxpI3VWxj60CJugHaAr2uOjaqZl2EmYNyY3XP+zKSY/Oyzv05
   H6frAmLsgxWg9TJj+QK1Y2ZNaMMlcISdknZ6mvK8nf/qvdOF6YN84of8f
   ycnibk1/rf7TPtOraq4koDI2bpQhh0NgAKq0PwoyYsz/liy33ksSX7cXr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="451473113"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="451473113"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 00:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="699151189"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="699151189"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 00:15:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJqY7-0006Lx-2k;
	Thu, 13 Jul 2023 07:15:39 +0000
Date: Thu, 13 Jul 2023 15:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:seamcall_test 8/30] vmlinux.o: warning: objtool:
 __halt+0x3a: call to __tdx_hypercall() leaves .noinstr.text section
Message-ID: <202307131526.27fHCYHt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git seamcall_test
head:   28194aca34f016f46489a4e019c045c8680aba4a
commit: 5f3cac9378000121ecf882a364de3827102e8ae2 [8/30] x86/tdx: Unify TDX_HYPERCALL and TDX_MODULE_CALL assembly
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307131526.27fHCYHt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131526.27fHCYHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131526.27fHCYHt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __halt+0x3a: call to __tdx_hypercall() leaves .noinstr.text section


objdump-func vmlinux.o __halt:
0000 0000000000000040 <__halt>:
0000       40:	48 83 ec 70          	sub    $0x70,%rsp
0004       44:	89 fa                	mov    %edi,%edx
0006       46:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
000f       4f:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
0014       54:	31 c0                	xor    %eax,%eax
0016       56:	e8 00 00 00 00       	call   5b <__halt+0x1b>	57: R_X86_64_PLT32	stackleak_track_stack-0x4
001b       5b:	b9 0d 00 00 00       	mov    $0xd,%ecx
0020       60:	48 89 e7             	mov    %rsp,%rdi
0023       63:	0f b6 d2             	movzbl %dl,%edx
0026       66:	f3 48 ab             	rep stos %rax,%es:(%rdi)
0029       69:	48 89 e7             	mov    %rsp,%rdi
002c       6c:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
0031       71:	48 c7 44 24 28 0c 00 00 00 	movq   $0xc,0x28(%rsp)
003a       7a:	e8 00 00 00 00       	call   7f <__halt+0x3f>	7b: R_X86_64_PC32	.text+0x51fc
003f       7f:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
0044       84:	65 48 2b 14 25 28 00 00 00 	sub    %gs:0x28,%rdx
004d       8d:	75 0f                	jne    9e <__halt+0x5e>
004f       8f:	48 83 c4 70          	add    $0x70,%rsp
0053       93:	31 d2                	xor    %edx,%edx
0055       95:	31 c9                	xor    %ecx,%ecx
0057       97:	31 ff                	xor    %edi,%edi
0059       99:	e9 00 00 00 00       	jmp    9e <__halt+0x5e>	9a: R_X86_64_PLT32	__x86_return_thunk-0x4
005e       9e:	e8 00 00 00 00       	call   a3 <__halt+0x63>	9f: R_X86_64_PLT32	__stack_chk_fail-0x4
0063       a3:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
006e       ae:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0079       b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
