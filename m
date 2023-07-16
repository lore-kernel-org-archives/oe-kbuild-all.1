Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F56BEA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689495864; x=1721031864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FIt7hO5coaxt28fH+Z8k76FacHRpkbH+o4gS23uf9CM=;
  b=cEiDgzBnhKVo2/2VhXp61XZSaPk4YZPyCLBDu4AnYv/5M+3I2RJIM9TT
   uOyxNqlpQ+o4oAA98ilXZ/vHFZB3veNuUh25ju8xWo+7sJJcpvYKg90HA
   2pE80QOoWJS6zI8BKhoco+K8TR5gQcMyA4JP1Lt9hLZt3Hj5RPWmfR3ZO
   MDnBs/0mFjWovMLAmiNkL6WUnFEuKoa1TxWcKutROz6gYBO9IJuKYd+he
   tyObqZWFYUTc7nIhhumKiMPH8f6kNSNYjBK0nQ4BEbC1Z7SeGhkPFbuRo
   sabrJmhjMu46pws3p3gEk+uRAL7Ah9S5abMqY48ivclk9k/dvmxbZsf8f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="345332625"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="345332625"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 01:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846931428"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="846931428"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jul 2023 01:24:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKx3E-0008jg-0z;
	Sun, 16 Jul 2023 08:24:20 +0000
Date: Sun, 16 Jul 2023 16:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 210/365] vmlinux.o: warning:
 objtool: vmx_vcpu_enter_exit+0x284: call to kvm_vm_bugged() leaves
 .noinstr.text section
Message-ID: <202307161606.iJ6OlOZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 752627eaee27b3ad04179f479662ace6f5a0e617 [210/365] [REVERTME] KVM: TDX: add KVM_BUG_ON to to_kvm_vmx, to_vmx, to_kvm_tdx, to_tdx
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230716/202307161606.iJ6OlOZN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161606.iJ6OlOZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161606.iJ6OlOZN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x284: call to kvm_vm_bugged() leaves .noinstr.text section


objdump-func vmlinux.o vmx_vcpu_enter_exit:
0000 0000000000000f40 <vmx_vcpu_enter_exit>:
0000      f40:	41 54                	push   %r12
0002      f42:	55                   	push   %rbp
0003      f43:	89 f5                	mov    %esi,%ebp
0005      f45:	53                   	push   %rbx
0006      f46:	48 8b 07             	mov    (%rdi),%rax
0009      f49:	48 89 fb             	mov    %rdi,%rbx
000c      f4c:	48 83 b8 e8 15 00 00 01 	cmpq   $0x1,0x15e8(%rax)
0014      f54:	76 1c                	jbe    f72 <vmx_vcpu_enter_exit+0x32>
0016      f56:	44 0f b6 a0 c9 a3 00 00 	movzbl 0xa3c9(%rax),%r12d
001e      f5e:	41 80 fc 01          	cmp    $0x1,%r12b
0022      f62:	0f 87 34 04 00 00    	ja     139c <vmx_vcpu_enter_exit+0x45c>
0028      f68:	41 83 e4 01          	and    $0x1,%r12d
002c      f6c:	0f 84 68 01 00 00    	je     10da <vmx_vcpu_enter_exit+0x19a>
0032      f72:	90                   	nop
0033      f73:	e8 00 00 00 00       	call   f78 <vmx_vcpu_enter_exit+0x38>	f74: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0038      f78:	e8 00 00 00 00       	call   f7d <vmx_vcpu_enter_exit+0x3d>	f79: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
003d      f7d:	90                   	nop
003e      f7e:	90                   	nop
003f      f7f:	e8 00 00 00 00       	call   f84 <vmx_vcpu_enter_exit+0x44>	f80: R_X86_64_PC32	.text+0x1cee3c
0044      f84:	90                   	nop
0045      f85:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
004a      f8a:	e8 00 00 00 00       	call   f8f <vmx_vcpu_enter_exit+0x4f>	f8b: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
004f      f8f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0054      f94:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0059      f99:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
005e      f9e:	44 0f b6 a3 70 27 00 00 	movzbl 0x2770(%rbx),%r12d
0066      fa6:	41 80 fc 01          	cmp    $0x1,%r12b
006a      faa:	0f 87 d7 03 00 00    	ja     1387 <vmx_vcpu_enter_exit+0x447>
0070      fb0:	41 83 e4 01          	and    $0x1,%r12d
0074      fb4:	74 22                	je     fd8 <vmx_vcpu_enter_exit+0x98>
0076      fb6:	b9 23 01 00 00       	mov    $0x123,%ecx
007b      fbb:	0f 32                	rdmsr
007d      fbd:	48 c1 e2 20          	shl    $0x20,%rdx
0081      fc1:	48 09 c2             	or     %rax,%rdx
0084      fc4:	48 89 d0             	mov    %rdx,%rax
0087      fc7:	48 c1 ea 20          	shr    $0x20,%rdx
008b      fcb:	48 83 c8 08          	or     $0x8,%rax
008f      fcf:	0f 30                	wrmsr
0091      fd1:	48 89 83 68 27 00 00 	mov    %rax,0x2768(%rbx)
0098      fd8:	48 8b 83 78 02 00 00 	mov    0x278(%rbx),%rax
009f      fdf:	0f 20 d2             	mov    %cr2,%rdx
00a2      fe2:	48 39 d0             	cmp    %rdx,%rax
00a5      fe5:	74 03                	je     fea <vmx_vcpu_enter_exit+0xaa>
00a7      fe7:	0f 22 d0             	mov    %rax,%cr2
00aa      fea:	48 8d b3 d8 01 00 00 	lea    0x1d8(%rbx),%rsi
00b1      ff1:	89 ea                	mov    %ebp,%edx
00b3      ff3:	48 89 df             	mov    %rbx,%rdi
00b6      ff6:	e8 00 00 00 00       	call   ffb <vmx_vcpu_enter_exit+0xbb>	ff7: R_X86_64_PLT32	__vmx_vcpu_run-0x4
00bb      ffb:	88 83 50 1f 00 00    	mov    %al,0x1f50(%rbx)
00c1     1001:	0f 20 d0             	mov    %cr2,%rax
00c4     1004:	0f b6 ab 70 27 00 00 	movzbl 0x2770(%rbx),%ebp
00cb     100b:	48 89 83 78 02 00 00 	mov    %rax,0x278(%rbx)
00d2     1012:	40 80 fd 01          	cmp    $0x1,%bpl
00d6     1016:	0f 87 bf 03 00 00    	ja     13db <vmx_vcpu_enter_exit+0x49b>
00dc     101c:	83 e5 01             	and    $0x1,%ebp
00df     101f:	74 20                	je     1041 <vmx_vcpu_enter_exit+0x101>
00e1     1021:	48 8b 83 68 27 00 00 	mov    0x2768(%rbx),%rax
00e8     1028:	b9 23 01 00 00       	mov    $0x123,%ecx
00ed     102d:	48 83 e0 f7          	and    $0xfffffffffffffff7,%rax
00f1     1031:	48 89 c2             	mov    %rax,%rdx
00f4     1034:	48 89 83 68 27 00 00 	mov    %rax,0x2768(%rbx)
00fb     103b:	48 c1 ea 20          	shr    $0x20,%rdx
00ff     103f:	0f 30                	wrmsr
0101     1041:	80 bb 50 1f 00 00 00 	cmpb   $0x0,0x1f50(%rbx)
0108     1048:	0f 85 24 02 00 00    	jne    1272 <vmx_vcpu_enter_exit+0x332>
010e     104e:	66 90                	xchg   %ax,%ax
0110     1050:	b8 02 44 00 00       	mov    $0x4402,%eax
0115     1055:	0f 78 c0             	vmread %rax,%rax
0118     1058:	0f 86 fc 00 00 00    	jbe    115a <vmx_vcpu_enter_exit+0x21a>
011e     105e:	89 83 40 24 00 00    	mov    %eax,0x2440(%rbx)
0124     1064:	66 85 c0             	test   %ax,%ax
0127     1067:	0f 84 8d 00 00 00    	je     10fa <vmx_vcpu_enter_exit+0x1ba>
012d     106d:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0132     1072:	e8 00 00 00 00       	call   1077 <vmx_vcpu_enter_exit+0x137>	1073: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
0137     1077:	90                   	nop
0138     1078:	e8 00 00 00 00       	call   107d <vmx_vcpu_enter_exit+0x13d>	1079: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
013d     107d:	90                   	nop
013e     107e:	5b                   	pop    %rbx
013f     107f:	5d                   	pop    %rbp
0140     1080:	41 5c                	pop    %r12
0142     1082:	31 c0                	xor    %eax,%eax
0144     1084:	31 d2                	xor    %edx,%edx
0146     1086:	31 c9                	xor    %ecx,%ecx
0148     1088:	31 f6                	xor    %esi,%esi
014a     108a:	31 ff                	xor    %edi,%edi
014c     108c:	e9 00 00 00 00       	jmp    1091 <vmx_vcpu_enter_exit+0x151>	108d: R_X86_64_PLT32	__x86_return_thunk-0x4
0151     1091:	48 8b 3b             	mov    (%rbx),%rdi
0154     1094:	e8 00 00 00 00       	call   1099 <vmx_vcpu_enter_exit+0x159>	1095: R_X86_64_PLT32	kvm_arch_has_assigned_device-0x4
0159     1099:	84 c0                	test   %al,%al
015b     109b:	0f 84 fd fe ff ff    	je     f9e <vmx_vcpu_enter_exit+0x5e>
0161     10a1:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 10a8 <vmx_vcpu_enter_exit+0x168>	10a4: R_X86_64_PC32	.rodata+0x21688
0168     10a8:	e9 f1 fe ff ff       	jmp    f9e <vmx_vcpu_enter_exit+0x5e>
016d     10ad:	81 3d 00 00 00 00 91 00 00 00 	cmpl   $0x91,0x0(%rip)        # 10b7 <vmx_vcpu_enter_exit+0x177>	10af: R_X86_64_PC32	nr_evmcs_1_fields-0x8
0177     10b7:	0f 86 c4 01 00 00    	jbe    1281 <vmx_vcpu_enter_exit+0x341>
017d     10bd:	0f b7 05 00 00 00 00 	movzwl 0x0(%rip),%eax        # 10c4 <vmx_vcpu_enter_exit+0x184>	10c0: R_X86_64_PC32	vmcs_field_to_evmcs_1+0x240
0184     10c4:	66 85 c0             	test   %ax,%ax
0187     10c7:	0f 84 b4 01 00 00    	je     1281 <vmx_vcpu_enter_exit+0x341>
018d     10cd:	65 48 8b 15 00 00 00 00 	mov    %gs:0x0(%rip),%rdx        # 10d5 <vmx_vcpu_enter_exit+0x195>	10d1: R_X86_64_PC32	current_vmcs-0x4
0195     10d5:	8b 04 02             	mov    (%rdx,%rax,1),%eax
0198     10d8:	eb 84                	jmp    105e <vmx_vcpu_enter_exit+0x11e>
019a     10da:	90                   	nop
019b     10db:	0f 0b                	ud2
019d     10dd:	90                   	nop
019e     10de:	48 8b 3b             	mov    (%rbx),%rdi
01a1     10e1:	e8 00 00 00 00       	call   10e6 <vmx_vcpu_enter_exit+0x1a6>	10e2: R_X86_64_PC32	.text+0x1ce8bc
01a6     10e6:	e9 87 fe ff ff       	jmp    f72 <vmx_vcpu_enter_exit+0x32>
01ab     10eb:	e8 00 00 00 00       	call   10f0 <vmx_vcpu_enter_exit+0x1b0>	10ec: R_X86_64_PLT32	kvm_spurious_fault-0x4
01b0     10f0:	c7 83 40 24 00 00 00 00 00 00 	movl   $0x0,0x2440(%rbx)
01ba     10fa:	48 8b 03             	mov    (%rbx),%rax
01bd     10fd:	48 83 b8 e8 15 00 00 01 	cmpq   $0x1,0x15e8(%rax)
01c5     1105:	76 1a                	jbe    1121 <vmx_vcpu_enter_exit+0x1e1>
01c7     1107:	0f b6 a8 c9 a3 00 00 	movzbl 0xa3c9(%rax),%ebp
01ce     110e:	40 80 fd 01          	cmp    $0x1,%bpl
01d2     1112:	0f 87 d8 02 00 00    	ja     13f0 <vmx_vcpu_enter_exit+0x4b0>
01d8     1118:	83 e5 01             	and    $0x1,%ebp
01db     111b:	0f 84 9c 00 00 00    	je     11bd <vmx_vcpu_enter_exit+0x27d>
01e1     1121:	48 0f ba ab 60 02 00 00 18 	btsq   $0x18,0x260(%rbx)
01ea     112a:	73 73                	jae    119f <vmx_vcpu_enter_exit+0x25f>
01ec     112c:	8b 83 60 1f 00 00    	mov    0x1f60(%rbx),%eax
01f2     1132:	25 00 07 00 80       	and    $0x80000700,%eax
01f7     1137:	3d 00 02 00 80       	cmp    $0x80000200,%eax
01fc     113c:	0f 85 2b ff ff ff    	jne    106d <vmx_vcpu_enter_exit+0x12d>
0202     1142:	c6 83 ba 0b 00 00 02 	movb   $0x2,0xbba(%rbx)
0209     1149:	e8 00 00 00 00       	call   114e <vmx_vcpu_enter_exit+0x20e>	114a: R_X86_64_PLT32	vmx_do_nmi_irqoff-0x4
020e     114e:	c6 83 ba 0b 00 00 00 	movb   $0x0,0xbba(%rbx)
0215     1155:	e9 13 ff ff ff       	jmp    106d <vmx_vcpu_enter_exit+0x12d>
021a     115a:	90                   	nop
021b     115b:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 1162 <vmx_vcpu_enter_exit+0x222>	115e: R_X86_64_PC32	.data.once+0x36
0222     1162:	40 80 fd 01          	cmp    $0x1,%bpl
0226     1166:	0f 87 5a 02 00 00    	ja     13c6 <vmx_vcpu_enter_exit+0x486>
022c     116c:	83 e5 01             	and    $0x1,%ebp
022f     116f:	0f 84 8c 01 00 00    	je     1301 <vmx_vcpu_enter_exit+0x3c1>
0235     1175:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1178: R_X86_64_32S	.rodata+0x22b30
023c     117c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	117f: R_X86_64_32S	.data+0x51b60
0243     1183:	e8 00 00 00 00       	call   1188 <vmx_vcpu_enter_exit+0x248>	1184: R_X86_64_PLT32	___ratelimit-0x4
0248     1188:	85 c0                	test   %eax,%eax
024a     118a:	75 76                	jne    1202 <vmx_vcpu_enter_exit+0x2c2>
024c     118c:	90                   	nop
024d     118d:	e9 5e ff ff ff       	jmp    10f0 <vmx_vcpu_enter_exit+0x1b0>
0252     1192:	48 89 df             	mov    %rbx,%rdi
0255     1195:	e8 66 fc ff ff       	call   e00 <vmx_l1d_flush>
025a     119a:	e9 ff fd ff ff       	jmp    f9e <vmx_vcpu_enter_exit+0x5e>
025f     119f:	66 90                	xchg   %ax,%ax
0261     11a1:	b8 04 44 00 00       	mov    $0x4404,%eax
0266     11a6:	0f 78 c0             	vmread %rax,%rax
0269     11a9:	76 6d                	jbe    1218 <vmx_vcpu_enter_exit+0x2d8>
026b     11ab:	89 c2                	mov    %eax,%edx
026d     11ad:	25 00 07 00 80       	and    $0x80000700,%eax
0272     11b2:	89 93 60 1f 00 00    	mov    %edx,0x1f60(%rbx)
0278     11b8:	e9 7a ff ff ff       	jmp    1137 <vmx_vcpu_enter_exit+0x1f7>
027d     11bd:	90                   	nop
027e     11be:	0f 0b                	ud2
0280     11c0:	90                   	nop
0281     11c1:	48 8b 3b             	mov    (%rbx),%rdi
0284     11c4:	e8 00 00 00 00       	call   11c9 <vmx_vcpu_enter_exit+0x289>	11c5: R_X86_64_PC32	.text+0x1ce8bc
0289     11c9:	e9 53 ff ff ff       	jmp    1121 <vmx_vcpu_enter_exit+0x1e1>
028e     11ce:	81 3d 00 00 00 00 11 01 00 00 	cmpl   $0x111,0x0(%rip)        # 11d8 <vmx_vcpu_enter_exit+0x298>	11d0: R_X86_64_PC32	nr_evmcs_1_fields-0x8
0298     11d8:	0f 86 e0 00 00 00    	jbe    12be <vmx_vcpu_enter_exit+0x37e>
029e     11de:	0f b7 05 00 00 00 00 	movzwl 0x0(%rip),%eax        # 11e5 <vmx_vcpu_enter_exit+0x2a5>	11e1: R_X86_64_PC32	vmcs_field_to_evmcs_1+0x440
02a5     11e5:	66 85 c0             	test   %ax,%ax
02a8     11e8:	0f 84 d0 00 00 00    	je     12be <vmx_vcpu_enter_exit+0x37e>
02ae     11ee:	65 48 8b 15 00 00 00 00 	mov    %gs:0x0(%rip),%rdx        # 11f6 <vmx_vcpu_enter_exit+0x2b6>	11f2: R_X86_64_PC32	current_vmcs-0x4
02b6     11f6:	8b 14 02             	mov    (%rdx,%rax,1),%edx
02b9     11f9:	89 d0                	mov    %edx,%eax
02bb     11fb:	25 00 07 00 80       	and    $0x80000700,%eax
02c0     1200:	eb b0                	jmp    11b2 <vmx_vcpu_enter_exit+0x272>
02c2     1202:	be 02 44 00 00       	mov    $0x4402,%esi
02c7     1207:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	120a: R_X86_64_32S	.rodata.str1.8+0x7cf8
02ce     120e:	e8 00 00 00 00       	call   1213 <vmx_vcpu_enter_exit+0x2d3>	120f: R_X86_64_PLT32	_printk-0x4
02d3     1213:	e9 74 ff ff ff       	jmp    118c <vmx_vcpu_enter_exit+0x24c>
02d8     1218:	90                   	nop
02d9     1219:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 1220 <vmx_vcpu_enter_exit+0x2e0>	121c: R_X86_64_PC32	.data.once+0x36
02e0     1220:	40 80 fd 01          	cmp    $0x1,%bpl
02e4     1224:	0f 87 48 01 00 00    	ja     1372 <vmx_vcpu_enter_exit+0x432>
02ea     122a:	83 e5 01             	and    $0x1,%ebp
02ed     122d:	0f 84 07 01 00 00    	je     133a <vmx_vcpu_enter_exit+0x3fa>
02f3     1233:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1236: R_X86_64_32S	.rodata+0x22b30
02fa     123a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	123d: R_X86_64_32S	.data+0x51b60
0301     1241:	e8 00 00 00 00       	call   1246 <vmx_vcpu_enter_exit+0x306>	1242: R_X86_64_PLT32	___ratelimit-0x4
0306     1246:	85 c0                	test   %eax,%eax
0308     1248:	0f 85 d6 00 00 00    	jne    1324 <vmx_vcpu_enter_exit+0x3e4>
030e     124e:	90                   	nop
030f     124f:	c7 83 60 1f 00 00 00 00 00 00 	movl   $0x0,0x1f60(%rbx)
0319     1259:	e9 0f fe ff ff       	jmp    106d <vmx_vcpu_enter_exit+0x12d>
031e     125e:	e8 00 00 00 00       	call   1263 <vmx_vcpu_enter_exit+0x323>	125f: R_X86_64_PLT32	kvm_spurious_fault-0x4
0323     1263:	c7 83 60 1f 00 00 00 00 00 00 	movl   $0x0,0x1f60(%rbx)
032d     126d:	e9 fb fd ff ff       	jmp    106d <vmx_vcpu_enter_exit+0x12d>
0332     1272:	c7 83 40 24 00 00 ad de 00 00 	movl   $0xdead,0x2440(%rbx)
033c     127c:	e9 ec fd ff ff       	jmp    106d <vmx_vcpu_enter_exit+0x12d>
0341     1281:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 1288 <vmx_vcpu_enter_exit+0x348>	1284: R_X86_64_PC32	.data.once+0x37
0348     1288:	40 80 fd 01          	cmp    $0x1,%bpl
034c     128c:	0f 87 cb 00 00 00    	ja     135d <vmx_vcpu_enter_exit+0x41d>
0352     1292:	83 e5 01             	and    $0x1,%ebp
0355     1295:	0f 85 55 fe ff ff    	jne    10f0 <vmx_vcpu_enter_exit+0x1b0>
035b     129b:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 12a2 <vmx_vcpu_enter_exit+0x362>	129d: R_X86_64_PC32	.data.once+0x36
0362     12a2:	90                   	nop
0363     12a3:	be 02 44 00 00       	mov    $0x4402,%esi
0368     12a8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12ab: R_X86_64_32S	.rodata.str1.8+0x7ca8
036f     12af:	e8 00 00 00 00       	call   12b4 <vmx_vcpu_enter_exit+0x374>	12b0: R_X86_64_PLT32	__warn_printk-0x4
0374     12b4:	90                   	nop
0375     12b5:	0f 0b                	ud2
0377     12b7:	90                   	nop
0378     12b8:	90                   	nop
0379     12b9:	e9 32 fe ff ff       	jmp    10f0 <vmx_vcpu_enter_exit+0x1b0>
037e     12be:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 12c5 <vmx_vcpu_enter_exit+0x385>	12c1: R_X86_64_PC32	.data.once+0x37
0385     12c5:	40 80 fd 01          	cmp    $0x1,%bpl
0389     12c9:	0f 87 e2 00 00 00    	ja     13b1 <vmx_vcpu_enter_exit+0x471>
038f     12cf:	83 e5 01             	and    $0x1,%ebp
0392     12d2:	75 1e                	jne    12f2 <vmx_vcpu_enter_exit+0x3b2>
0394     12d4:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 12db <vmx_vcpu_enter_exit+0x39b>	12d6: R_X86_64_PC32	.data.once+0x36
039b     12db:	90                   	nop
039c     12dc:	be 04 44 00 00       	mov    $0x4404,%esi
03a1     12e1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12e4: R_X86_64_32S	.rodata.str1.8+0x7ca8
03a8     12e8:	e8 00 00 00 00       	call   12ed <vmx_vcpu_enter_exit+0x3ad>	12e9: R_X86_64_PLT32	__warn_printk-0x4
03ad     12ed:	90                   	nop
03ae     12ee:	0f 0b                	ud2
03b0     12f0:	90                   	nop
03b1     12f1:	90                   	nop
03b2     12f2:	c7 83 60 1f 00 00 00 00 00 00 	movl   $0x0,0x1f60(%rbx)
03bc     12fc:	e9 6c fd ff ff       	jmp    106d <vmx_vcpu_enter_exit+0x12d>
03c1     1301:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1308 <vmx_vcpu_enter_exit+0x3c8>	1303: R_X86_64_PC32	.data.once+0x35
03c8     1308:	90                   	nop
03c9     1309:	be 02 44 00 00       	mov    $0x4402,%esi
03ce     130e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1311: R_X86_64_32S	.rodata.str1.8+0x7cd0
03d5     1315:	e8 00 00 00 00       	call   131a <vmx_vcpu_enter_exit+0x3da>	1316: R_X86_64_PLT32	__warn_printk-0x4
03da     131a:	90                   	nop
03db     131b:	0f 0b                	ud2
03dd     131d:	90                   	nop
03de     131e:	90                   	nop
03df     131f:	e9 51 fe ff ff       	jmp    1175 <vmx_vcpu_enter_exit+0x235>
03e4     1324:	be 04 44 00 00       	mov    $0x4404,%esi
03e9     1329:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	132c: R_X86_64_32S	.rodata.str1.8+0x7cf8
03f0     1330:	e8 00 00 00 00       	call   1335 <vmx_vcpu_enter_exit+0x3f5>	1331: R_X86_64_PLT32	_printk-0x4
03f5     1335:	e9 14 ff ff ff       	jmp    124e <vmx_vcpu_enter_exit+0x30e>
03fa     133a:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1341 <vmx_vcpu_enter_exit+0x401>	133c: R_X86_64_PC32	.data.once+0x35
0401     1341:	90                   	nop
0402     1342:	be 04 44 00 00       	mov    $0x4404,%esi
0407     1347:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	134a: R_X86_64_32S	.rodata.str1.8+0x7cd0
040e     134e:	e8 00 00 00 00       	call   1353 <vmx_vcpu_enter_exit+0x413>	134f: R_X86_64_PLT32	__warn_printk-0x4
0413     1353:	90                   	nop
0414     1354:	0f 0b                	ud2
0416     1356:	90                   	nop
0417     1357:	90                   	nop
0418     1358:	e9 d6 fe ff ff       	jmp    1233 <vmx_vcpu_enter_exit+0x2f3>
041d     135d:	40 0f b6 f5          	movzbl %bpl,%esi
0421     1361:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1364: R_X86_64_32S	.data+0x51530
0428     1368:	e8 00 00 00 00       	call   136d <vmx_vcpu_enter_exit+0x42d>	1369: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
042d     136d:	e9 20 ff ff ff       	jmp    1292 <vmx_vcpu_enter_exit+0x352>
0432     1372:	40 0f b6 f5          	movzbl %bpl,%esi
0436     1376:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1379: R_X86_64_32S	.data+0x51510
043d     137d:	e8 00 00 00 00       	call   1382 <vmx_vcpu_enter_exit+0x442>	137e: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0442     1382:	e9 a3 fe ff ff       	jmp    122a <vmx_vcpu_enter_exit+0x2ea>
0447     1387:	41 0f b6 f4          	movzbl %r12b,%esi
044b     138b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	138e: R_X86_64_32S	.data+0x513f0
0452     1392:	e8 00 00 00 00       	call   1397 <vmx_vcpu_enter_exit+0x457>	1393: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0457     1397:	e9 14 fc ff ff       	jmp    fb0 <vmx_vcpu_enter_exit+0x70>
045c     139c:	41 0f b6 f4          	movzbl %r12b,%esi
0460     13a0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13a3: R_X86_64_32S	.data+0x514b0
0467     13a7:	e8 00 00 00 00       	call   13ac <vmx_vcpu_enter_exit+0x46c>	13a8: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
046c     13ac:	e9 b7 fb ff ff       	jmp    f68 <vmx_vcpu_enter_exit+0x28>
0471     13b1:	40 0f b6 f5          	movzbl %bpl,%esi
0475     13b5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13b8: R_X86_64_32S	.data+0x51530
047c     13bc:	e8 00 00 00 00       	call   13c1 <vmx_vcpu_enter_exit+0x481>	13bd: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0481     13c1:	e9 09 ff ff ff       	jmp    12cf <vmx_vcpu_enter_exit+0x38f>
0486     13c6:	40 0f b6 f5          	movzbl %bpl,%esi
048a     13ca:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13cd: R_X86_64_32S	.data+0x51510
0491     13d1:	e8 00 00 00 00       	call   13d6 <vmx_vcpu_enter_exit+0x496>	13d2: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0496     13d6:	e9 91 fd ff ff       	jmp    116c <vmx_vcpu_enter_exit+0x22c>
049b     13db:	40 0f b6 f5          	movzbl %bpl,%esi
049f     13df:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13e2: R_X86_64_32S	.data+0x513d0
04a6     13e6:	e8 00 00 00 00       	call   13eb <vmx_vcpu_enter_exit+0x4ab>	13e7: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
04ab     13eb:	e9 2c fc ff ff       	jmp    101c <vmx_vcpu_enter_exit+0xdc>
04b0     13f0:	40 0f b6 f5          	movzbl %bpl,%esi
04b4     13f4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13f7: R_X86_64_32S	.data+0x514b0
04bb     13fb:	e8 00 00 00 00       	call   1400 <vmx_vcpu_enter_exit+0x4c0>	13fc: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
04c0     1400:	e9 13 fd ff ff       	jmp    1118 <vmx_vcpu_enter_exit+0x1d8>
04c5     1405:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04d0     1410:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04db     141b:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04e6     1426:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04f1     1431:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
04fc     143c:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
