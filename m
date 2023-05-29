Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50382FB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 22:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685399985; x=1716935985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PgjqsFkrOJoxtq/7RBYeriY+uNZL9gkD2eUt00COexM=;
  b=MRZt8NVGykGvfUGUGeAgvGtUtMhIg+bui9Wn36CVkK/VPRq5masuKQx4
   i885jw7Z/hE7SeC7t4N/JYYXgw5BVYhHIs3lv86uAyHe4080gQaEVhPlF
   L5tn3LjoCdHryUisD3eDy+ypHBpp4ORJeoxW7+Z/x+jKcjGMHr4duSKA2
   s0N42IQFd2nrrjVhk3F3WNBqU4goFHvx80JyzolkSUQfoS/w4sIU+y9sj
   I20zPS76L/5A0VYQT7w7SYhqLKW5MFUNxgpeX9o69P2tYOtMaYb+ffP7h
   TkF2fqao2hOyWMC84g6+QWHor3GejQWNTcmtKDzzIWB3NiLEkZga5YaoX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352278625"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="352278625"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 15:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="952876342"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="952876342"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 May 2023 15:39:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3lWh-000L9s-1H;
	Mon, 29 May 2023 22:39:43 +0000
Date: Tue, 30 May 2023 06:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 188/327] vmlinux.o: warning:
 objtool: vmx_vcpu_enter_exit+0x334: call to kvm_vm_bugged() leaves
 .noinstr.text section
Message-ID: <202305300646.rzKSrCdr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   148ce77f987a3cf12193c1f81baa78f41cf13154
commit: b3f808b0c522b3a3ea9ac43c1b872d08922c217b [188/327] [REVERTME] KVM: TDX: add KVM_BUG_ON to to_kvm_vmx, to_vmx, to_kvm_tdx, to_tdx
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230530/202305300646.rzKSrCdr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/b3f808b0c522b3a3ea9ac43c1b872d08922c217b
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b3f808b0c522b3a3ea9ac43c1b872d08922c217b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300646.rzKSrCdr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x334: call to kvm_vm_bugged() leaves .noinstr.text section


objdump-func vmlinux.o vmx_vcpu_enter_exit:
0000 0000000000000d40 <vmx_vcpu_enter_exit>:
0000      d40:	41 54                	push   %r12
0002      d42:	55                   	push   %rbp
0003      d43:	89 f5                	mov    %esi,%ebp
0005      d45:	53                   	push   %rbx
0006      d46:	48 8b 07             	mov    (%rdi),%rax
0009      d49:	48 89 fb             	mov    %rdi,%rbx
000c      d4c:	48 83 b8 e8 15 00 00 01 	cmpq   $0x1,0x15e8(%rax)
0014      d54:	0f 84 0a 02 00 00    	je     f64 <vmx_vcpu_enter_exit+0x224>
001a      d5a:	90                   	nop
001b      d5b:	e8 00 00 00 00       	call   d60 <vmx_vcpu_enter_exit+0x20>	d5c: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0020      d60:	e8 00 00 00 00       	call   d65 <vmx_vcpu_enter_exit+0x25>	d61: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
0025      d65:	90                   	nop
0026      d66:	90                   	nop
0027      d67:	e8 00 00 00 00       	call   d6c <vmx_vcpu_enter_exit+0x2c>	d68: R_X86_64_PC32	.text+0x1ca37c
002c      d6c:	90                   	nop
002d      d6d:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0032      d72:	e8 00 00 00 00       	call   d77 <vmx_vcpu_enter_exit+0x37>	d73: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
0037      d77:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
003c      d7c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0041      d81:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0046      d86:	44 0f b6 a3 70 27 00 00 	movzbl 0x2770(%rbx),%r12d
004e      d8e:	41 80 fc 01          	cmp    $0x1,%r12b
0052      d92:	0f 87 64 04 00 00    	ja     11fc <vmx_vcpu_enter_exit+0x4bc>
0058      d98:	41 83 e4 01          	and    $0x1,%r12d
005c      d9c:	74 22                	je     dc0 <vmx_vcpu_enter_exit+0x80>
005e      d9e:	b9 23 01 00 00       	mov    $0x123,%ecx
0063      da3:	0f 32                	rdmsr
0065      da5:	48 c1 e2 20          	shl    $0x20,%rdx
0069      da9:	48 09 c2             	or     %rax,%rdx
006c      dac:	48 89 d0             	mov    %rdx,%rax
006f      daf:	48 c1 ea 20          	shr    $0x20,%rdx
0073      db3:	48 83 c8 08          	or     $0x8,%rax
0077      db7:	0f 30                	wrmsr
0079      db9:	48 89 83 68 27 00 00 	mov    %rax,0x2768(%rbx)
0080      dc0:	48 8b 83 78 02 00 00 	mov    0x278(%rbx),%rax
0087      dc7:	0f 20 d2             	mov    %cr2,%rdx
008a      dca:	48 39 d0             	cmp    %rdx,%rax
008d      dcd:	74 03                	je     dd2 <vmx_vcpu_enter_exit+0x92>
008f      dcf:	0f 22 d0             	mov    %rax,%cr2
0092      dd2:	48 8d b3 d8 01 00 00 	lea    0x1d8(%rbx),%rsi
0099      dd9:	89 ea                	mov    %ebp,%edx
009b      ddb:	48 89 df             	mov    %rbx,%rdi
009e      dde:	e8 00 00 00 00       	call   de3 <vmx_vcpu_enter_exit+0xa3>	ddf: R_X86_64_PLT32	__vmx_vcpu_run-0x4
00a3      de3:	88 83 50 1f 00 00    	mov    %al,0x1f50(%rbx)
00a9      de9:	0f 20 d0             	mov    %cr2,%rax
00ac      dec:	0f b6 ab 70 27 00 00 	movzbl 0x2770(%rbx),%ebp
00b3      df3:	48 89 83 78 02 00 00 	mov    %rax,0x278(%rbx)
00ba      dfa:	40 80 fd 01          	cmp    $0x1,%bpl
00be      dfe:	0f 87 a4 03 00 00    	ja     11a8 <vmx_vcpu_enter_exit+0x468>
00c4      e04:	83 e5 01             	and    $0x1,%ebp
00c7      e07:	74 20                	je     e29 <vmx_vcpu_enter_exit+0xe9>
00c9      e09:	48 8b 83 68 27 00 00 	mov    0x2768(%rbx),%rax
00d0      e10:	b9 23 01 00 00       	mov    $0x123,%ecx
00d5      e15:	48 83 e0 f7          	and    $0xfffffffffffffff7,%rax
00d9      e19:	48 89 c2             	mov    %rax,%rdx
00dc      e1c:	48 89 83 68 27 00 00 	mov    %rax,0x2768(%rbx)
00e3      e23:	48 c1 ea 20          	shr    $0x20,%rdx
00e7      e27:	0f 30                	wrmsr
00e9      e29:	80 bb 50 1f 00 00 00 	cmpb   $0x0,0x1f50(%rbx)
00f0      e30:	0f 85 48 02 00 00    	jne    107e <vmx_vcpu_enter_exit+0x33e>
00f6      e36:	66 90                	xchg   %ax,%ax
00f8      e38:	b8 02 44 00 00       	mov    $0x4402,%eax
00fd      e3d:	0f 78 c0             	vmread %rax,%rax
0100      e40:	0f 86 d5 00 00 00    	jbe    f1b <vmx_vcpu_enter_exit+0x1db>
0106      e46:	89 83 40 24 00 00    	mov    %eax,0x2440(%rbx)
010c      e4c:	66 85 c0             	test   %ax,%ax
010f      e4f:	74 7c                	je     ecd <vmx_vcpu_enter_exit+0x18d>
0111      e51:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0116      e56:	e8 00 00 00 00       	call   e5b <vmx_vcpu_enter_exit+0x11b>	e57: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
011b      e5b:	90                   	nop
011c      e5c:	e8 00 00 00 00       	call   e61 <vmx_vcpu_enter_exit+0x121>	e5d: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
0121      e61:	90                   	nop
0122      e62:	5b                   	pop    %rbx
0123      e63:	5d                   	pop    %rbp
0124      e64:	41 5c                	pop    %r12
0126      e66:	31 c0                	xor    %eax,%eax
0128      e68:	31 d2                	xor    %edx,%edx
012a      e6a:	31 c9                	xor    %ecx,%ecx
012c      e6c:	31 f6                	xor    %esi,%esi
012e      e6e:	31 ff                	xor    %edi,%edi
0130      e70:	e9 00 00 00 00       	jmp    e75 <vmx_vcpu_enter_exit+0x135>	e71: R_X86_64_PLT32	__x86_return_thunk-0x4
0135      e75:	48 8b 3b             	mov    (%rbx),%rdi
0138      e78:	e8 00 00 00 00       	call   e7d <vmx_vcpu_enter_exit+0x13d>	e79: R_X86_64_PLT32	kvm_arch_has_assigned_device-0x4
013d      e7d:	84 c0                	test   %al,%al
013f      e7f:	0f 84 01 ff ff ff    	je     d86 <vmx_vcpu_enter_exit+0x46>
0145      e85:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # e8c <vmx_vcpu_enter_exit+0x14c>	e88: R_X86_64_PC32	.rodata+0x21568
014c      e8c:	e9 f5 fe ff ff       	jmp    d86 <vmx_vcpu_enter_exit+0x46>
0151      e91:	81 3d 00 00 00 00 91 00 00 00 	cmpl   $0x91,0x0(%rip)        # e9b <vmx_vcpu_enter_exit+0x15b>	e93: R_X86_64_PC32	nr_evmcs_1_fields-0x8
015b      e9b:	0f 86 ec 01 00 00    	jbe    108d <vmx_vcpu_enter_exit+0x34d>
0161      ea1:	0f b7 05 00 00 00 00 	movzwl 0x0(%rip),%eax        # ea8 <vmx_vcpu_enter_exit+0x168>	ea4: R_X86_64_PC32	vmcs_field_to_evmcs_1+0x240
0168      ea8:	66 85 c0             	test   %ax,%ax
016b      eab:	0f 84 dc 01 00 00    	je     108d <vmx_vcpu_enter_exit+0x34d>
0171      eb1:	65 48 8b 15 00 00 00 00 	mov    %gs:0x0(%rip),%rdx        # eb9 <vmx_vcpu_enter_exit+0x179>	eb5: R_X86_64_PC32	current_vmcs-0x4
0179      eb9:	8b 04 02             	mov    (%rdx,%rax,1),%eax
017c      ebc:	eb 88                	jmp    e46 <vmx_vcpu_enter_exit+0x106>
017e      ebe:	e8 00 00 00 00       	call   ec3 <vmx_vcpu_enter_exit+0x183>	ebf: R_X86_64_PLT32	kvm_spurious_fault-0x4
0183      ec3:	c7 83 40 24 00 00 00 00 00 00 	movl   $0x0,0x2440(%rbx)
018d      ecd:	48 8b 03             	mov    (%rbx),%rax
0190      ed0:	48 83 b8 e8 15 00 00 01 	cmpq   $0x1,0x15e8(%rax)
0198      ed8:	0f 84 75 01 00 00    	je     1053 <vmx_vcpu_enter_exit+0x313>
019e      ede:	48 0f ba ab 60 02 00 00 18 	btsq   $0x18,0x260(%rbx)
01a7      ee7:	0f 83 a4 00 00 00    	jae    f91 <vmx_vcpu_enter_exit+0x251>
01ad      eed:	8b 83 60 1f 00 00    	mov    0x1f60(%rbx),%eax
01b3      ef3:	25 00 07 00 80       	and    $0x80000700,%eax
01b8      ef8:	3d 00 02 00 80       	cmp    $0x80000200,%eax
01bd      efd:	0f 85 4e ff ff ff    	jne    e51 <vmx_vcpu_enter_exit+0x111>
01c3      f03:	c6 83 ba 0b 00 00 02 	movb   $0x2,0xbba(%rbx)
01ca      f0a:	e8 00 00 00 00       	call   f0f <vmx_vcpu_enter_exit+0x1cf>	f0b: R_X86_64_PLT32	vmx_do_nmi_irqoff-0x4
01cf      f0f:	c6 83 ba 0b 00 00 00 	movb   $0x0,0xbba(%rbx)
01d6      f16:	e9 36 ff ff ff       	jmp    e51 <vmx_vcpu_enter_exit+0x111>
01db      f1b:	90                   	nop
01dc      f1c:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # f23 <vmx_vcpu_enter_exit+0x1e3>	f1f: R_X86_64_PC32	.data.once+0x36
01e3      f23:	40 80 fd 01          	cmp    $0x1,%bpl
01e7      f27:	0f 87 ba 02 00 00    	ja     11e7 <vmx_vcpu_enter_exit+0x4a7>
01ed      f2d:	83 e5 01             	and    $0x1,%ebp
01f0      f30:	0f 84 d7 01 00 00    	je     110d <vmx_vcpu_enter_exit+0x3cd>
01f6      f36:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	f39: R_X86_64_32S	.rodata+0x22a10
01fd      f3d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f40: R_X86_64_32S	.data+0x50a20
0204      f44:	e8 00 00 00 00       	call   f49 <vmx_vcpu_enter_exit+0x209>	f45: R_X86_64_PLT32	___ratelimit-0x4
0209      f49:	85 c0                	test   %eax,%eax
020b      f4b:	0f 85 92 00 00 00    	jne    fe3 <vmx_vcpu_enter_exit+0x2a3>
0211      f51:	90                   	nop
0212      f52:	e9 6c ff ff ff       	jmp    ec3 <vmx_vcpu_enter_exit+0x183>
0217      f57:	48 89 df             	mov    %rbx,%rdi
021a      f5a:	e8 a1 fc ff ff       	call   c00 <vmx_l1d_flush>
021f      f5f:	e9 22 fe ff ff       	jmp    d86 <vmx_vcpu_enter_exit+0x46>
0224      f64:	44 0f b6 a0 c9 a3 00 00 	movzbl 0xa3c9(%rax),%r12d
022c      f6c:	41 80 fc 01          	cmp    $0x1,%r12b
0230      f70:	0f 87 1d 02 00 00    	ja     1193 <vmx_vcpu_enter_exit+0x453>
0236      f76:	41 83 e4 01          	and    $0x1,%r12d
023a      f7a:	0f 85 da fd ff ff    	jne    d5a <vmx_vcpu_enter_exit+0x1a>
0240      f80:	90                   	nop
0241      f81:	0f 0b                	ud2
0243      f83:	90                   	nop
0244      f84:	48 8b 3b             	mov    (%rbx),%rdi
0247      f87:	e8 00 00 00 00       	call   f8c <vmx_vcpu_enter_exit+0x24c>	f88: R_X86_64_PC32	.text+0x1c9d3c
024c      f8c:	e9 c9 fd ff ff       	jmp    d5a <vmx_vcpu_enter_exit+0x1a>
0251      f91:	66 90                	xchg   %ax,%ax
0253      f93:	b8 04 44 00 00       	mov    $0x4404,%eax
0258      f98:	0f 78 c0             	vmread %rax,%rax
025b      f9b:	76 5c                	jbe    ff9 <vmx_vcpu_enter_exit+0x2b9>
025d      f9d:	89 c2                	mov    %eax,%edx
025f      f9f:	25 00 07 00 80       	and    $0x80000700,%eax
0264      fa4:	89 93 60 1f 00 00    	mov    %edx,0x1f60(%rbx)
026a      faa:	e9 49 ff ff ff       	jmp    ef8 <vmx_vcpu_enter_exit+0x1b8>
026f      faf:	81 3d 00 00 00 00 11 01 00 00 	cmpl   $0x111,0x0(%rip)        # fb9 <vmx_vcpu_enter_exit+0x279>	fb1: R_X86_64_PC32	nr_evmcs_1_fields-0x8
0279      fb9:	0f 86 0b 01 00 00    	jbe    10ca <vmx_vcpu_enter_exit+0x38a>
027f      fbf:	0f b7 05 00 00 00 00 	movzwl 0x0(%rip),%eax        # fc6 <vmx_vcpu_enter_exit+0x286>	fc2: R_X86_64_PC32	vmcs_field_to_evmcs_1+0x440
0286      fc6:	66 85 c0             	test   %ax,%ax
0289      fc9:	0f 84 fb 00 00 00    	je     10ca <vmx_vcpu_enter_exit+0x38a>
028f      fcf:	65 48 8b 15 00 00 00 00 	mov    %gs:0x0(%rip),%rdx        # fd7 <vmx_vcpu_enter_exit+0x297>	fd3: R_X86_64_PC32	current_vmcs-0x4
0297      fd7:	8b 14 02             	mov    (%rdx,%rax,1),%edx
029a      fda:	89 d0                	mov    %edx,%eax
029c      fdc:	25 00 07 00 80       	and    $0x80000700,%eax
02a1      fe1:	eb c1                	jmp    fa4 <vmx_vcpu_enter_exit+0x264>
02a3      fe3:	be 02 44 00 00       	mov    $0x4402,%esi
02a8      fe8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	feb: R_X86_64_32S	.rodata.str1.8+0x7c78
02af      fef:	e8 00 00 00 00       	call   ff4 <vmx_vcpu_enter_exit+0x2b4>	ff0: R_X86_64_PLT32	_printk-0x4
02b4      ff4:	e9 58 ff ff ff       	jmp    f51 <vmx_vcpu_enter_exit+0x211>
02b9      ff9:	90                   	nop
02ba      ffa:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 1001 <vmx_vcpu_enter_exit+0x2c1>	ffd: R_X86_64_PC32	.data.once+0x36
02c1     1001:	40 80 fd 01          	cmp    $0x1,%bpl
02c5     1005:	0f 87 73 01 00 00    	ja     117e <vmx_vcpu_enter_exit+0x43e>
02cb     100b:	83 e5 01             	and    $0x1,%ebp
02ce     100e:	0f 84 32 01 00 00    	je     1146 <vmx_vcpu_enter_exit+0x406>
02d4     1014:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1017: R_X86_64_32S	.rodata+0x22a10
02db     101b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	101e: R_X86_64_32S	.data+0x50a20
02e2     1022:	e8 00 00 00 00       	call   1027 <vmx_vcpu_enter_exit+0x2e7>	1023: R_X86_64_PLT32	___ratelimit-0x4
02e7     1027:	85 c0                	test   %eax,%eax
02e9     1029:	0f 85 01 01 00 00    	jne    1130 <vmx_vcpu_enter_exit+0x3f0>
02ef     102f:	90                   	nop
02f0     1030:	c7 83 60 1f 00 00 00 00 00 00 	movl   $0x0,0x1f60(%rbx)
02fa     103a:	e9 12 fe ff ff       	jmp    e51 <vmx_vcpu_enter_exit+0x111>
02ff     103f:	e8 00 00 00 00       	call   1044 <vmx_vcpu_enter_exit+0x304>	1040: R_X86_64_PLT32	kvm_spurious_fault-0x4
0304     1044:	c7 83 60 1f 00 00 00 00 00 00 	movl   $0x0,0x1f60(%rbx)
030e     104e:	e9 fe fd ff ff       	jmp    e51 <vmx_vcpu_enter_exit+0x111>
0313     1053:	0f b6 a8 c9 a3 00 00 	movzbl 0xa3c9(%rax),%ebp
031a     105a:	40 80 fd 01          	cmp    $0x1,%bpl
031e     105e:	0f 87 6e 01 00 00    	ja     11d2 <vmx_vcpu_enter_exit+0x492>
0324     1064:	83 e5 01             	and    $0x1,%ebp
0327     1067:	0f 85 71 fe ff ff    	jne    ede <vmx_vcpu_enter_exit+0x19e>
032d     106d:	90                   	nop
032e     106e:	0f 0b                	ud2
0330     1070:	90                   	nop
0331     1071:	48 8b 3b             	mov    (%rbx),%rdi
0334     1074:	e8 00 00 00 00       	call   1079 <vmx_vcpu_enter_exit+0x339>	1075: R_X86_64_PC32	.text+0x1c9d3c
0339     1079:	e9 60 fe ff ff       	jmp    ede <vmx_vcpu_enter_exit+0x19e>
033e     107e:	c7 83 40 24 00 00 ad de 00 00 	movl   $0xdead,0x2440(%rbx)
0348     1088:	e9 c4 fd ff ff       	jmp    e51 <vmx_vcpu_enter_exit+0x111>
034d     108d:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 1094 <vmx_vcpu_enter_exit+0x354>	1090: R_X86_64_PC32	.data.once+0x37
0354     1094:	40 80 fd 01          	cmp    $0x1,%bpl
0358     1098:	0f 87 cb 00 00 00    	ja     1169 <vmx_vcpu_enter_exit+0x429>
035e     109e:	83 e5 01             	and    $0x1,%ebp
0361     10a1:	0f 85 1c fe ff ff    	jne    ec3 <vmx_vcpu_enter_exit+0x183>
0367     10a7:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 10ae <vmx_vcpu_enter_exit+0x36e>	10a9: R_X86_64_PC32	.data.once+0x36
036e     10ae:	90                   	nop
036f     10af:	be 02 44 00 00       	mov    $0x4402,%esi
0374     10b4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10b7: R_X86_64_32S	.rodata.str1.8+0x7c28
037b     10bb:	e8 00 00 00 00       	call   10c0 <vmx_vcpu_enter_exit+0x380>	10bc: R_X86_64_PLT32	__warn_printk-0x4
0380     10c0:	90                   	nop
0381     10c1:	0f 0b                	ud2
0383     10c3:	90                   	nop
0384     10c4:	90                   	nop
0385     10c5:	e9 f9 fd ff ff       	jmp    ec3 <vmx_vcpu_enter_exit+0x183>
038a     10ca:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 10d1 <vmx_vcpu_enter_exit+0x391>	10cd: R_X86_64_PC32	.data.once+0x37
0391     10d1:	40 80 fd 01          	cmp    $0x1,%bpl
0395     10d5:	0f 87 e2 00 00 00    	ja     11bd <vmx_vcpu_enter_exit+0x47d>
039b     10db:	83 e5 01             	and    $0x1,%ebp
039e     10de:	75 1e                	jne    10fe <vmx_vcpu_enter_exit+0x3be>
03a0     10e0:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 10e7 <vmx_vcpu_enter_exit+0x3a7>	10e2: R_X86_64_PC32	.data.once+0x36
03a7     10e7:	90                   	nop
03a8     10e8:	be 04 44 00 00       	mov    $0x4404,%esi
03ad     10ed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10f0: R_X86_64_32S	.rodata.str1.8+0x7c28
03b4     10f4:	e8 00 00 00 00       	call   10f9 <vmx_vcpu_enter_exit+0x3b9>	10f5: R_X86_64_PLT32	__warn_printk-0x4
03b9     10f9:	90                   	nop
03ba     10fa:	0f 0b                	ud2
03bc     10fc:	90                   	nop
03bd     10fd:	90                   	nop
03be     10fe:	c7 83 60 1f 00 00 00 00 00 00 	movl   $0x0,0x1f60(%rbx)
03c8     1108:	e9 44 fd ff ff       	jmp    e51 <vmx_vcpu_enter_exit+0x111>
03cd     110d:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1114 <vmx_vcpu_enter_exit+0x3d4>	110f: R_X86_64_PC32	.data.once+0x35
03d4     1114:	90                   	nop
03d5     1115:	be 02 44 00 00       	mov    $0x4402,%esi
03da     111a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	111d: R_X86_64_32S	.rodata.str1.8+0x7c50
03e1     1121:	e8 00 00 00 00       	call   1126 <vmx_vcpu_enter_exit+0x3e6>	1122: R_X86_64_PLT32	__warn_printk-0x4
03e6     1126:	90                   	nop
03e7     1127:	0f 0b                	ud2
03e9     1129:	90                   	nop
03ea     112a:	90                   	nop
03eb     112b:	e9 06 fe ff ff       	jmp    f36 <vmx_vcpu_enter_exit+0x1f6>
03f0     1130:	be 04 44 00 00       	mov    $0x4404,%esi
03f5     1135:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1138: R_X86_64_32S	.rodata.str1.8+0x7c78
03fc     113c:	e8 00 00 00 00       	call   1141 <vmx_vcpu_enter_exit+0x401>	113d: R_X86_64_PLT32	_printk-0x4
0401     1141:	e9 e9 fe ff ff       	jmp    102f <vmx_vcpu_enter_exit+0x2ef>
0406     1146:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 114d <vmx_vcpu_enter_exit+0x40d>	1148: R_X86_64_PC32	.data.once+0x35
040d     114d:	90                   	nop
040e     114e:	be 04 44 00 00       	mov    $0x4404,%esi
0413     1153:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1156: R_X86_64_32S	.rodata.str1.8+0x7c50
041a     115a:	e8 00 00 00 00       	call   115f <vmx_vcpu_enter_exit+0x41f>	115b: R_X86_64_PLT32	__warn_printk-0x4
041f     115f:	90                   	nop
0420     1160:	0f 0b                	ud2
0422     1162:	90                   	nop
0423     1163:	90                   	nop
0424     1164:	e9 ab fe ff ff       	jmp    1014 <vmx_vcpu_enter_exit+0x2d4>
0429     1169:	40 0f b6 f5          	movzbl %bpl,%esi
042d     116d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1170: R_X86_64_32S	.data+0x503f0
0434     1174:	e8 00 00 00 00       	call   1179 <vmx_vcpu_enter_exit+0x439>	1175: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0439     1179:	e9 20 ff ff ff       	jmp    109e <vmx_vcpu_enter_exit+0x35e>
043e     117e:	40 0f b6 f5          	movzbl %bpl,%esi
0442     1182:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1185: R_X86_64_32S	.data+0x503d0
0449     1189:	e8 00 00 00 00       	call   118e <vmx_vcpu_enter_exit+0x44e>	118a: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
044e     118e:	e9 78 fe ff ff       	jmp    100b <vmx_vcpu_enter_exit+0x2cb>
0453     1193:	41 0f b6 f4          	movzbl %r12b,%esi
0457     1197:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	119a: R_X86_64_32S	.data+0x50370
045e     119e:	e8 00 00 00 00       	call   11a3 <vmx_vcpu_enter_exit+0x463>	119f: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0463     11a3:	e9 ce fd ff ff       	jmp    f76 <vmx_vcpu_enter_exit+0x236>
0468     11a8:	40 0f b6 f5          	movzbl %bpl,%esi
046c     11ac:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11af: R_X86_64_32S	.data+0x50290
0473     11b3:	e8 00 00 00 00       	call   11b8 <vmx_vcpu_enter_exit+0x478>	11b4: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0478     11b8:	e9 47 fc ff ff       	jmp    e04 <vmx_vcpu_enter_exit+0xc4>
047d     11bd:	40 0f b6 f5          	movzbl %bpl,%esi
0481     11c1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11c4: R_X86_64_32S	.data+0x503f0
0488     11c8:	e8 00 00 00 00       	call   11cd <vmx_vcpu_enter_exit+0x48d>	11c9: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
048d     11cd:	e9 09 ff ff ff       	jmp    10db <vmx_vcpu_enter_exit+0x39b>
0492     11d2:	40 0f b6 f5          	movzbl %bpl,%esi
0496     11d6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11d9: R_X86_64_32S	.data+0x50370
049d     11dd:	e8 00 00 00 00       	call   11e2 <vmx_vcpu_enter_exit+0x4a2>	11de: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
04a2     11e2:	e9 7d fe ff ff       	jmp    1064 <vmx_vcpu_enter_exit+0x324>
04a7     11e7:	40 0f b6 f5          	movzbl %bpl,%esi
04ab     11eb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11ee: R_X86_64_32S	.data+0x503d0
04b2     11f2:	e8 00 00 00 00       	call   11f7 <vmx_vcpu_enter_exit+0x4b7>	11f3: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
04b7     11f7:	e9 31 fd ff ff       	jmp    f2d <vmx_vcpu_enter_exit+0x1ed>
04bc     11fc:	41 0f b6 f4          	movzbl %r12b,%esi
04c0     1200:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1203: R_X86_64_32S	.data+0x502b0
04c7     1207:	e8 00 00 00 00       	call   120c <vmx_vcpu_enter_exit+0x4cc>	1208: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
04cc     120c:	e9 87 fb ff ff       	jmp    d98 <vmx_vcpu_enter_exit+0x58>
04d1     1211:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04dc     121c:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04e7     1227:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04f2     1232:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04fd     123d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
