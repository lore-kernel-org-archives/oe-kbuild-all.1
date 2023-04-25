Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F613C0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 16:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682441874; x=1713977874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8mIvyrIfk/76GDIhc9ngwdwvFqx2PziiB+73PN0s8c=;
  b=H0Yj5sXBFeNlzw+U9nhzfULhncGpe53qiOtm9ZGzBi6Rvn1UIL+KUyT/
   SNkFkH1us1Z8gvOI4FzQoxTw/MxvQjtMsfPtaEjhGE9rBpIjlhI6o3yBB
   LaZwvdHJzq5b3oCHj0qb0yxuOiaxq/2XLwu8AccB6Ox3xZHvQ3Q+LJ/em
   stVUS44KPG0qkVSS7mWH+WtH+sCT1qo0ZcH/Rkin8nP2mM5G73oYVuoSv
   cj5Zldmh1QjhIyCeO0np4ATI2gjzGvXsBArGCVXoHKpMEYY/WV0CRAbhk
   S8S8x0QHwFdcmlc1dxJqen6jq7VKtEw1+bj1uBVeyYOWtwzcfK9oG7ncF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="348755210"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="348755210"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 09:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="939833818"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="939833818"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2023 09:57:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prLzD-000jbE-1U;
	Tue, 25 Apr 2023 16:57:51 +0000
Date: Wed, 26 Apr 2023 00:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 296/338] vmlinux.o: warning:
 objtool: np_seamldr_launch+0x129: missing int3 after ret
Message-ID: <202304260022.A4v4PQZ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   abaa3072a8763b7a6276df61d205bf33eb2f31a5
commit: b4b4b9225a77bb402f0acfbef9d9ce5dab42c681 [296/338] [REVERTME] x86/virt/tdx: Boot-time tdx module loading
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230426/202304260022.A4v4PQZ4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/b4b4b9225a77bb402f0acfbef9d9ce5dab42c681
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b4b4b9225a77bb402f0acfbef9d9ce5dab42c681
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260022.A4v4PQZ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x1e4: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: tdx_vcpu_enter_exit+0x94: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x85: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xb2f: call to pentium_machine_check.constprop.0() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_stackleak_irqoff+0x2b: call to end_of_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: np_seamldr_launch+0x129: missing int3 after ret


objdump-func vmlinux.o np_seamldr_launch:
0000 00000000000d6f00 <np_seamldr_launch>:
0000    d6f00:	f3 0f 1e fa          	endbr64
0004    d6f04:	55                   	push   %rbp
0005    d6f05:	48 89 e5             	mov    %rsp,%rbp
0008    d6f08:	41 57                	push   %r15
000a    d6f0a:	41 56                	push   %r14
000c    d6f0c:	41 55                	push   %r13
000e    d6f0e:	41 54                	push   %r12
0010    d6f10:	53                   	push   %rbx
0011    d6f11:	9c                   	pushf
0012    d6f12:	f3 48 0f ae c8       	rdgsbase %rax
0017    d6f17:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # d6f1e <np_seamldr_launch+0x1e>	d6f1a: R_X86_64_PC32	np_seamldr_saved_gs_base-0x4
001e    d6f1e:	41 0f 20 db          	mov    %cr3,%r11
0022    d6f22:	41 53                	push   %r11
0024    d6f24:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
002b    d6f2b:	0f 20 e0             	mov    %cr4,%rax
002e    d6f2e:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # d6f35 <np_seamldr_launch+0x35>	d6f31: R_X86_64_PC32	np_seamldr_saved_cr4-0x4
0035    d6f35:	0f 20 c0             	mov    %cr0,%rax
0038    d6f38:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # d6f3f <np_seamldr_launch+0x3f>	d6f3b: R_X86_64_PC32	np_seamldr_saved_cr0-0x4
003f    d6f3f:	0f 20 e0             	mov    %cr4,%rax
0042    d6f42:	48 0d 00 40 00 00    	or     $0x4000,%rax
0048    d6f48:	0f 22 e0             	mov    %rax,%cr4
004b    d6f4b:	0f 01 05 00 00 00 00 	sgdt   0x0(%rip)        # d6f52 <np_seamldr_launch+0x52>	d6f4e: R_X86_64_PC32	.init.data+0x1080dc
0052    d6f52:	4c 8b 0d 00 00 00 00 	mov    0x0(%rip),%r9        # d6f59 <np_seamldr_launch+0x59>	d6f55: R_X86_64_PC32	.init.data+0x1080de
0059    d6f59:	4c 8d 15 27 00 00 00 	lea    0x27(%rip),%r10        # d6f87 <np_seamldr_launch+0x87>
0060    d6f60:	0f 01 0d 00 00 00 00 	sidt   0x0(%rip)        # d6f67 <np_seamldr_launch+0x67>	d6f63: R_X86_64_PC32	.init.data+0x1080ec
0067    d6f67:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # d6f6e <np_seamldr_launch+0x6e>	d6f6a: R_X86_64_PC32	.init.data+0x1080ee
006e    d6f6e:	48 89 25 00 00 00 00 	mov    %rsp,0x0(%rip)        # d6f75 <np_seamldr_launch+0x75>	d6f71: R_X86_64_PC32	.init.data+0x1080fc
0075    d6f75:	48 89 2d 00 00 00 00 	mov    %rbp,0x0(%rip)        # d6f7c <np_seamldr_launch+0x7c>	d6f78: R_X86_64_PC32	.init.data+0x108104
007c    d6f7c:	89 fb                	mov    %edi,%ebx
007e    d6f7e:	89 f1                	mov    %esi,%ecx
0080    d6f80:	b8 02 00 00 00       	mov    $0x2,%eax
0085    d6f85:	0f 37                	getsec
0087    d6f87:	48 c7 c0 00 04 00 00 	mov    $0x400,%rax
008e    d6f8e:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
0095    d6f95:	b9 30 08 00 00       	mov    $0x830,%ecx
009a    d6f9a:	0f 30                	wrmsr
009c    d6f9c:	48 c7 c0 02 00 00 00 	mov    $0x2,%rax
00a3    d6fa3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
00aa    d6faa:	b9 3f 08 00 00       	mov    $0x83f,%ecx
00af    d6faf:	0f 30                	wrmsr
00b1    d6fb1:	b8 18 00 00 00       	mov    $0x18,%eax
00b6    d6fb6:	8e d8                	mov    %eax,%ds
00b8    d6fb8:	8e c0                	mov    %eax,%es
00ba    d6fba:	8e d0                	mov    %eax,%ss
00bc    d6fbc:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # d6fc3 <np_seamldr_launch+0xc3>	d6fbf: R_X86_64_PC32	.init.data+0x108104
00c3    d6fc3:	48 8b 25 00 00 00 00 	mov    0x0(%rip),%rsp        # d6fca <np_seamldr_launch+0xca>	d6fc6: R_X86_64_PC32	.init.data+0x1080fc
00ca    d6fca:	6a 10                	push   $0x10
00cc    d6fcc:	48 8d 05 03 00 00 00 	lea    0x3(%rip),%rax        # d6fd6 <np_seamldr_launch+0xd6>
00d3    d6fd3:	50                   	push   %rax
00d4    d6fd4:	48 cb                	lretq
00d6    d6fd6:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # d6fdd <np_seamldr_launch+0xdd>	d6fd9: R_X86_64_PC32	np_seamldr_saved_cr0-0x4
00dd    d6fdd:	0f 22 c0             	mov    %rax,%cr0
00e0    d6fe0:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # d6feb <np_seamldr_launch+0xeb>	d6fe3: R_X86_64_PC32	np_seamldr_saved_cr0-0x8
00eb    d6feb:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # d6ff2 <np_seamldr_launch+0xf2>	d6fee: R_X86_64_PC32	np_seamldr_saved_cr4-0x4
00f2    d6ff2:	0f 22 e0             	mov    %rax,%cr4
00f5    d6ff5:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # d7000 <np_seamldr_launch+0x100>	d6ff8: R_X86_64_PC32	np_seamldr_saved_cr4-0x8
0100    d7000:	58                   	pop    %rax
0101    d7001:	0f 22 d8             	mov    %rax,%cr3
0104    d7004:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # d700b <np_seamldr_launch+0x10b>	d7007: R_X86_64_PC32	np_seamldr_saved_gs_base-0x4
010b    d700b:	f3 48 0f ae d8       	wrgsbase %rax
0110    d7010:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # d701b <np_seamldr_launch+0x11b>	d7013: R_X86_64_PC32	np_seamldr_saved_gs_base-0x8
011b    d701b:	9d                   	popf
011c    d701c:	4c 89 c8             	mov    %r9,%rax
011f    d701f:	5b                   	pop    %rbx
0120    d7020:	41 5c                	pop    %r12
0122    d7022:	41 5d                	pop    %r13
0124    d7024:	41 5e                	pop    %r14
0126    d7026:	41 5f                	pop    %r15
0128    d7028:	5d                   	pop    %rbp
0129    d7029:	c3                   	ret
012a    d702a:	49 c7 c1 f2 ff ff ff 	mov    $0xfffffffffffffff2,%r9
0131    d7031:	e9 7b ff ff ff       	jmp    d6fb1 <np_seamldr_launch+0xb1>
0136    d7036:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
