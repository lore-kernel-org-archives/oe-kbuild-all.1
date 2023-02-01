Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223F7F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 06:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675232657; x=1706768657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzbRSt+glo82alC7y87qUNTiEwCLme/SskZHJAg+WjQ=;
  b=Gr6NfUhzAvCD2NYu/CtJP/hcyvzAQKKMKns2FEVM2VHcO5/SkyjUY7q2
   R8EBFrQda4DUvUGwujCyPkQ+/PXAVqhHK9c5YmyJTAcrMZMpVf7yek6cb
   rP08pdc+5+PC83luSAmz5YGPacXmszgWg4OHPQ+hXjwHnEckTWWSu3em5
   +vSjUnld/ebZ4OzRVCfR9g3HqTzzy7DVtfI4VN/taq7DMMN0sN645lYIi
   MDeIa390aNujF1kUqNJUhjaHQTCqicu1FWQHgBqnQ6/B33rzVISsxc6vE
   pvT9qJQQ9iQrYORgVbsiCt47vHXRPwAIh0+wHe66tQyeyVmHOQO1M1F3J
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311705335"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="311705335"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 22:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="728258478"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="728258478"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2023 22:24:08 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN6XP-00059W-1I;
	Wed, 01 Feb 2023 06:24:07 +0000
Date: Wed, 1 Feb 2023 14:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 330/371] vmlinux.o: warning:
 objtool: np_seamldr_launch+0x129: missing int3 after ret
Message-ID: <202302011410.Y6yWZSNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   236af3da84d067f3af446ccf2211937cd9ddc42f
commit: c4c248c2e35272ce99b6d6a4b1ed10c15e5b2031 [330/371] [REVERTME] x86/virt/tdx: Boot-time tdx module loading
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302011410.Y6yWZSNM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/c4c248c2e35272ce99b6d6a4b1ed10c15e5b2031
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout c4c248c2e35272ce99b6d6a4b1ed10c15e5b2031
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x164: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: tdx_vcpu_enter_exit+0x4a: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x85: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xb2f: call to pentium_machine_check.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_stackleak_irqoff+0x2b: call to end_of_stack.isra.0() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: np_seamldr_launch+0x129: missing int3 after ret


objdump-func vmlinux.o np_seamldr_launch:
0000 00000000000ad880 <np_seamldr_launch>:
0000    ad880:	f3 0f 1e fa          	endbr64
0004    ad884:	55                   	push   %rbp
0005    ad885:	48 89 e5             	mov    %rsp,%rbp
0008    ad888:	41 57                	push   %r15
000a    ad88a:	41 56                	push   %r14
000c    ad88c:	41 55                	push   %r13
000e    ad88e:	41 54                	push   %r12
0010    ad890:	53                   	push   %rbx
0011    ad891:	9c                   	pushf
0012    ad892:	f3 48 0f ae c8       	rdgsbase %rax
0017    ad897:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # ad89e <np_seamldr_launch+0x1e>	ad89a: R_X86_64_PC32	np_seamldr_saved_gs_base-0x4
001e    ad89e:	41 0f 20 db          	mov    %cr3,%r11
0022    ad8a2:	41 53                	push   %r11
0024    ad8a4:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
002b    ad8ab:	0f 20 e0             	mov    %cr4,%rax
002e    ad8ae:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # ad8b5 <np_seamldr_launch+0x35>	ad8b1: R_X86_64_PC32	np_seamldr_saved_cr4-0x4
0035    ad8b5:	0f 20 c0             	mov    %cr0,%rax
0038    ad8b8:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # ad8bf <np_seamldr_launch+0x3f>	ad8bb: R_X86_64_PC32	np_seamldr_saved_cr0-0x4
003f    ad8bf:	0f 20 e0             	mov    %cr4,%rax
0042    ad8c2:	48 0d 00 40 00 00    	or     $0x4000,%rax
0048    ad8c8:	0f 22 e0             	mov    %rax,%cr4
004b    ad8cb:	0f 01 05 00 00 00 00 	sgdt   0x0(%rip)        # ad8d2 <np_seamldr_launch+0x52>	ad8ce: R_X86_64_PC32	.init.data+0x1070dc
0052    ad8d2:	4c 8b 0d 00 00 00 00 	mov    0x0(%rip),%r9        # ad8d9 <np_seamldr_launch+0x59>	ad8d5: R_X86_64_PC32	.init.data+0x1070de
0059    ad8d9:	4c 8d 15 27 00 00 00 	lea    0x27(%rip),%r10        # ad907 <np_seamldr_launch+0x87>
0060    ad8e0:	0f 01 0d 00 00 00 00 	sidt   0x0(%rip)        # ad8e7 <np_seamldr_launch+0x67>	ad8e3: R_X86_64_PC32	.init.data+0x1070ec
0067    ad8e7:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # ad8ee <np_seamldr_launch+0x6e>	ad8ea: R_X86_64_PC32	.init.data+0x1070ee
006e    ad8ee:	48 89 25 00 00 00 00 	mov    %rsp,0x0(%rip)        # ad8f5 <np_seamldr_launch+0x75>	ad8f1: R_X86_64_PC32	.init.data+0x1070fc
0075    ad8f5:	48 89 2d 00 00 00 00 	mov    %rbp,0x0(%rip)        # ad8fc <np_seamldr_launch+0x7c>	ad8f8: R_X86_64_PC32	.init.data+0x107104
007c    ad8fc:	89 fb                	mov    %edi,%ebx
007e    ad8fe:	89 f1                	mov    %esi,%ecx
0080    ad900:	b8 02 00 00 00       	mov    $0x2,%eax
0085    ad905:	0f 37                	getsec
0087    ad907:	48 c7 c0 00 04 00 00 	mov    $0x400,%rax
008e    ad90e:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
0095    ad915:	b9 30 08 00 00       	mov    $0x830,%ecx
009a    ad91a:	0f 30                	wrmsr
009c    ad91c:	48 c7 c0 02 00 00 00 	mov    $0x2,%rax
00a3    ad923:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
00aa    ad92a:	b9 3f 08 00 00       	mov    $0x83f,%ecx
00af    ad92f:	0f 30                	wrmsr
00b1    ad931:	b8 18 00 00 00       	mov    $0x18,%eax
00b6    ad936:	8e d8                	mov    %eax,%ds
00b8    ad938:	8e c0                	mov    %eax,%es
00ba    ad93a:	8e d0                	mov    %eax,%ss
00bc    ad93c:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # ad943 <np_seamldr_launch+0xc3>	ad93f: R_X86_64_PC32	.init.data+0x107104
00c3    ad943:	48 8b 25 00 00 00 00 	mov    0x0(%rip),%rsp        # ad94a <np_seamldr_launch+0xca>	ad946: R_X86_64_PC32	.init.data+0x1070fc
00ca    ad94a:	6a 10                	push   $0x10
00cc    ad94c:	48 8d 05 03 00 00 00 	lea    0x3(%rip),%rax        # ad956 <np_seamldr_launch+0xd6>
00d3    ad953:	50                   	push   %rax
00d4    ad954:	48 cb                	lretq
00d6    ad956:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # ad95d <np_seamldr_launch+0xdd>	ad959: R_X86_64_PC32	np_seamldr_saved_cr0-0x4
00dd    ad95d:	0f 22 c0             	mov    %rax,%cr0
00e0    ad960:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # ad96b <np_seamldr_launch+0xeb>	ad963: R_X86_64_PC32	np_seamldr_saved_cr0-0x8
00eb    ad96b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # ad972 <np_seamldr_launch+0xf2>	ad96e: R_X86_64_PC32	np_seamldr_saved_cr4-0x4
00f2    ad972:	0f 22 e0             	mov    %rax,%cr4
00f5    ad975:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # ad980 <np_seamldr_launch+0x100>	ad978: R_X86_64_PC32	np_seamldr_saved_cr4-0x8
0100    ad980:	58                   	pop    %rax
0101    ad981:	0f 22 d8             	mov    %rax,%cr3
0104    ad984:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # ad98b <np_seamldr_launch+0x10b>	ad987: R_X86_64_PC32	np_seamldr_saved_gs_base-0x4
010b    ad98b:	f3 48 0f ae d8       	wrgsbase %rax
0110    ad990:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # ad99b <np_seamldr_launch+0x11b>	ad993: R_X86_64_PC32	np_seamldr_saved_gs_base-0x8
011b    ad99b:	9d                   	popf
011c    ad99c:	4c 89 c8             	mov    %r9,%rax
011f    ad99f:	5b                   	pop    %rbx
0120    ad9a0:	41 5c                	pop    %r12
0122    ad9a2:	41 5d                	pop    %r13
0124    ad9a4:	41 5e                	pop    %r14
0126    ad9a6:	41 5f                	pop    %r15
0128    ad9a8:	5d                   	pop    %rbp
0129    ad9a9:	c3                   	ret
012a    ad9aa:	49 c7 c1 f2 ff ff ff 	mov    $0xfffffffffffffff2,%r9
0131    ad9b1:	e9 7b ff ff ff       	jmp    ad931 <np_seamldr_launch+0xb1>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
