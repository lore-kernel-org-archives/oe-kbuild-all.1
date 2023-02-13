Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398CA20
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676284276; x=1707820276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0zE+XTZyLUaBSNcDpKm4rEwN1LaTb2N0bfTNO/4xFw=;
  b=OF7TD/Iiyv0gE3N76Sp1Q8n1O+dZLoQCz8ZHp7p/kMBgzWRgIDHfq8Bu
   liwq61qytfVI1kxhAoR577BwsCvSEhUkcOgyFYJEdYeQSRra0DHxaE632
   c0iPm9ybUcnXKh5knOZK2CaJVxiPIuWKVbVTQ2+A3Z9SwoF0hlKveRxYW
   abHTz9gf4Bl2Si4unaiZngRtx5S1VJQhmg0pQSAts5hRwAII/LQTw+//f
   QNrMsRyrXU1PPB5RnxP9Uo4CPjiUSZcm0YtPQwdKcJKyTuprcizJk9PPl
   eoFzIuE/F9xP5rqCXiAL12ReidP+5Om502oNsH5t9pNsnOGF7CVbcTD4/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314502450"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="314502450"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="842719048"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="842719048"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Feb 2023 02:31:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRW77-0007gP-2v;
	Mon, 13 Feb 2023 10:31:13 +0000
Date: Mon, 13 Feb 2023 18:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:arch-cpu-idle-dead-noreturn 22/23] init/main.o: warning:
 objtool: start_kernel+0x4ad: unreachable instruction
Message-ID: <202302131842.P2HNCP7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git arch-cpu-idle-dead-noreturn
head:   873798e9a4f69d787222b5a98c69eb643b6ddfb6
commit: 0a55f2da6c442257d1514aa239b67ae919db8daa [22/23] objtool: Detect weak __noreturn functions
config: x86_64-randconfig-a015-20230213 (https://download.01.org/0day-ci/archive/20230213/202302131842.P2HNCP7C-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=0a55f2da6c442257d1514aa239b67ae919db8daa
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe arch-cpu-idle-dead-noreturn
        git checkout 0a55f2da6c442257d1514aa239b67ae919db8daa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131842.P2HNCP7C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> init/main.o: warning: objtool: start_kernel+0x4ad: unreachable instruction


objdump-func vmlinux.o start_kernel:
0000 0000000000000dcd <start_kernel>:
0000      dcd:	41 54                	push   %r12
0002      dcf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	dd2: R_X86_64_32S	init_task
0009      dd6:	55                   	push   %rbp
000a      dd7:	53                   	push   %rbx
000b      dd8:	41 50                	push   %r8
000d      dda:	e8 00 00 00 00       	call   ddf <start_kernel+0x12>	ddb: R_X86_64_PLT32	set_task_stack_end_magic-0x4
0012      ddf:	e8 00 00 00 00       	call   de4 <start_kernel+0x17>	de0: R_X86_64_PLT32	smp_setup_processor_id-0x4
0017      de4:	e8 00 00 00 00       	call   de9 <start_kernel+0x1c>	de5: R_X86_64_PLT32	debug_objects_early_init-0x4
001c      de9:	e8 00 00 00 00       	call   dee <start_kernel+0x21>	dea: R_X86_64_PLT32	cgroup_init_early-0x4
0021      dee:	9c                   	pushf
0022      def:	58                   	pop    %rax
0023      df0:	fa                   	cli
0024      df1:	0f ba e0 09          	bt     $0x9,%eax
0028      df5:	73 05                	jae    dfc <start_kernel+0x2f>
002a      df7:	e8 00 00 00 00       	call   dfc <start_kernel+0x2f>	df8: R_X86_64_PLT32	trace_hardirqs_off-0x4
002f      dfc:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # e03 <start_kernel+0x36>	dfe: R_X86_64_PC32	early_boot_irqs_disabled-0x5
0036      e03:	e8 00 00 00 00       	call   e08 <start_kernel+0x3b>	e04: R_X86_64_PLT32	boot_cpu_init-0x4
003b      e08:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e0b: R_X86_64_32S	linux_banner
0042      e0f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e12: R_X86_64_32S	.rodata.str1.1+0x152
0049      e16:	e8 00 00 00 00       	call   e1b <start_kernel+0x4e>	e17: R_X86_64_PLT32	_printk-0x4
004e      e1b:	e8 00 00 00 00       	call   e20 <start_kernel+0x53>	e1c: R_X86_64_PLT32	early_security_init-0x4
0053      e20:	48 89 e7             	mov    %rsp,%rdi
0056      e23:	e8 00 00 00 00       	call   e28 <start_kernel+0x5b>	e24: R_X86_64_PLT32	setup_arch-0x4
005b      e28:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # e2f <start_kernel+0x62>	e2b: R_X86_64_PC32	initrd_end-0x4
0062      e2f:	48 85 ed             	test   %rbp,%rbp
0065      e32:	0f 84 8b 00 00 00    	je     ec3 <start_kernel+0xf6>
006b      e38:	48 8d 5d f4          	lea    -0xc(%rbp),%rbx
006f      e3c:	4c 8d 65 f0          	lea    -0x10(%rbp),%r12
0073      e40:	ba 0c 00 00 00       	mov    $0xc,%edx
0078      e45:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e48: R_X86_64_32S	.rodata.str1.1+0x157
007f      e4c:	48 89 df             	mov    %rbx,%rdi
0082      e4f:	e8 00 00 00 00       	call   e54 <start_kernel+0x87>	e50: R_X86_64_PLT32	memcmp-0x4
0087      e54:	85 c0                	test   %eax,%eax
0089      e56:	75 23                	jne    e7b <start_kernel+0xae>
008b      e58:	8b 7b f8             	mov    -0x8(%rbx),%edi
008e      e5b:	44 8b 43 fc          	mov    -0x4(%rbx),%r8d
0092      e5f:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # e66 <start_kernel+0x99>	e62: R_X86_64_PC32	initrd_start-0x4
0099      e66:	48 29 fb             	sub    %rdi,%rbx
009c      e69:	48 89 fe             	mov    %rdi,%rsi
009f      e6c:	48 8d 53 f8          	lea    -0x8(%rbx),%rdx
00a3      e70:	48 39 c2             	cmp    %rax,%rdx
00a6      e73:	72 10                	jb     e85 <start_kernel+0xb8>
00a8      e75:	31 c0                	xor    %eax,%eax
00aa      e77:	31 c9                	xor    %ecx,%ecx
00ac      e79:	eb 1e                	jmp    e99 <start_kernel+0xcc>
00ae      e7b:	48 ff cb             	dec    %rbx
00b1      e7e:	49 39 dc             	cmp    %rbx,%r12
00b4      e81:	75 bd                	jne    e40 <start_kernel+0x73>
00b6      e83:	eb 3e                	jmp    ec3 <start_kernel+0xf6>
00b8      e85:	48 89 ea             	mov    %rbp,%rdx
00bb      e88:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e8b: R_X86_64_32S	.rodata.str1.8+0x308
00c2      e8f:	48 29 c2             	sub    %rax,%rdx
00c5      e92:	e8 00 00 00 00       	call   e97 <start_kernel+0xca>	e93: R_X86_64_PLT32	_printk-0x4
00ca      e97:	eb 2a                	jmp    ec3 <start_kernel+0xf6>
00cc      e99:	48 39 f8             	cmp    %rdi,%rax
00cf      e9c:	74 0b                	je     ea9 <start_kernel+0xdc>
00d1      e9e:	0f b6 34 02          	movzbl (%rdx,%rax,1),%esi
00d5      ea2:	48 ff c0             	inc    %rax
00d8      ea5:	01 f1                	add    %esi,%ecx
00da      ea7:	eb f0                	jmp    e99 <start_kernel+0xcc>
00dc      ea9:	41 39 c8             	cmp    %ecx,%r8d
00df      eac:	74 0e                	je     ebc <start_kernel+0xef>
00e1      eae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	eb1: R_X86_64_32S	.rodata.str1.1+0x164
00e8      eb5:	e8 00 00 00 00       	call   eba <start_kernel+0xed>	eb6: R_X86_64_PLT32	_printk-0x4
00ed      eba:	eb 07                	jmp    ec3 <start_kernel+0xf6>
00ef      ebc:	48 89 15 00 00 00 00 	mov    %rdx,0x0(%rip)        # ec3 <start_kernel+0xf6>	ebf: R_X86_64_PC32	initrd_end-0x4
00f6      ec3:	48 8b 3c 24          	mov    (%rsp),%rdi
00fa      ec7:	e8 23 fb ff ff       	call   9ef <setup_command_line>
00ff      ecc:	e8 00 00 00 00       	call   ed1 <start_kernel+0x104>	ecd: R_X86_64_PLT32	setup_nr_cpu_ids-0x4
0104      ed1:	e8 00 00 00 00       	call   ed6 <start_kernel+0x109>	ed2: R_X86_64_PLT32	setup_per_cpu_areas-0x4
0109      ed6:	ff 15 00 00 00 00    	call   *0x0(%rip)        # edc <start_kernel+0x10f>	ed8: R_X86_64_PC32	smp_ops-0x4
010f      edc:	e8 00 00 00 00       	call   ee1 <start_kernel+0x114>	edd: R_X86_64_PLT32	boot_cpu_hotplug_init-0x4
0114      ee1:	31 ff                	xor    %edi,%edi
0116      ee3:	e8 00 00 00 00       	call   ee8 <start_kernel+0x11b>	ee4: R_X86_64_PLT32	build_all_zonelists-0x4
011b      ee8:	e8 00 00 00 00       	call   eed <start_kernel+0x120>	ee9: R_X86_64_PLT32	page_alloc_init-0x4
0120      eed:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # ef4 <start_kernel+0x127>	ef0: R_X86_64_PC32	saved_command_line-0x4
0127      ef4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ef7: R_X86_64_32S	.rodata.str1.1+0x182
012e      efb:	e8 00 00 00 00       	call   f00 <start_kernel+0x133>	efc: R_X86_64_PLT32	_printk-0x4
0133      f00:	e8 00 00 00 00       	call   f05 <start_kernel+0x138>	f01: R_X86_64_PLT32	jump_label_init-0x4
0138      f05:	e8 00 00 00 00       	call   f0a <start_kernel+0x13d>	f06: R_X86_64_PLT32	parse_early_param-0x4
013d      f0a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	f0d: R_X86_64_32S	__stop___param
0144      f11:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # f18 <start_kernel+0x14b>	f14: R_X86_64_PC32	.bss+0x1024
014b      f18:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f1b: R_X86_64_32S	.rodata.str1.1+0x19d
0152      f1f:	48 81 e9 00 00 00 00 	sub    $0x0,%rcx	f22: R_X86_64_32S	__start___param
0159      f26:	68 00 00 00 00       	push   $0x0	f27: R_X86_64_32S	.init.text+0x810
015e      f2b:	41 83 c9 ff          	or     $0xffffffff,%r9d
0162      f2f:	41 83 c8 ff          	or     $0xffffffff,%r8d
0166      f33:	48 c1 f9 03          	sar    $0x3,%rcx
016a      f37:	6a 00                	push   $0x0
016c      f39:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	f3c: R_X86_64_32S	__start___param
0173      f40:	69 c9 cd cc cc cc    	imul   $0xcccccccd,%ecx,%ecx
0179      f46:	e8 00 00 00 00       	call   f4b <start_kernel+0x17e>	f47: R_X86_64_PLT32	parse_args-0x4
017e      f4b:	48 89 c5             	mov    %rax,%rbp
0181      f4e:	e8 8f fb ff ff       	call   ae2 <print_unknown_bootoptions>
0186      f53:	5e                   	pop    %rsi
0187      f54:	5f                   	pop    %rdi
0188      f55:	48 85 ed             	test   %rbp,%rbp
018b      f58:	74 2d                	je     f87 <start_kernel+0x1ba>
018d      f5a:	48 81 fd 00 f0 ff ff 	cmp    $0xfffffffffffff000,%rbp
0194      f61:	77 24                	ja     f87 <start_kernel+0x1ba>
0196      f63:	68 00 00 00 00       	push   $0x0	f64: R_X86_64_32S	.init.text+0x790
019b      f68:	31 c9                	xor    %ecx,%ecx
019d      f6a:	31 d2                	xor    %edx,%edx
019f      f6c:	41 83 c9 ff          	or     $0xffffffff,%r9d
01a3      f70:	6a 00                	push   $0x0
01a5      f72:	41 83 c8 ff          	or     $0xffffffff,%r8d
01a9      f76:	48 89 ee             	mov    %rbp,%rsi
01ac      f79:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f7c: R_X86_64_32S	.rodata.str1.1+0x1ac
01b3      f80:	e8 00 00 00 00       	call   f85 <start_kernel+0x1b8>	f81: R_X86_64_PLT32	parse_args-0x4
01b8      f85:	5a                   	pop    %rdx
01b9      f86:	59                   	pop    %rcx
01ba      f87:	48 8b 3c 24          	mov    (%rsp),%rdi
01be      f8b:	e8 00 00 00 00       	call   f90 <start_kernel+0x1c3>	f8c: R_X86_64_PLT32	random_init_early-0x4
01c3      f90:	31 ff                	xor    %edi,%edi
01c5      f92:	e8 00 00 00 00       	call   f97 <start_kernel+0x1ca>	f93: R_X86_64_PLT32	setup_log_buf-0x4
01ca      f97:	e8 00 00 00 00       	call   f9c <start_kernel+0x1cf>	f98: R_X86_64_PLT32	vfs_caches_init_early-0x4
01cf      f9c:	e8 00 00 00 00       	call   fa1 <start_kernel+0x1d4>	f9d: R_X86_64_PLT32	sort_main_extable-0x4
01d4      fa1:	e8 00 00 00 00       	call   fa6 <start_kernel+0x1d9>	fa2: R_X86_64_PLT32	trap_init-0x4
01d9      fa6:	e8 00 00 00 00       	call   fab <start_kernel+0x1de>	fa7: R_X86_64_PLT32	init_mem_debugging_and_hardening-0x4
01de      fab:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	fae: R_X86_64_32S	.rodata.str1.1+0x11
01e5      fb2:	e8 00 00 00 00       	call   fb7 <start_kernel+0x1ea>	fb3: R_X86_64_PC32	.text.unlikely+0x12a
01ea      fb7:	84 c0                	test   %al,%al
01ec      fb9:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	fbc: R_X86_64_32S	.rodata.str1.1+0x14
01f3      fc0:	48 0f 44 c8          	cmove  %rax,%rcx
01f7      fc4:	66 90                	xchg   %ax,%ax
01f9      fc6:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	fc9: R_X86_64_32S	.rodata.str1.1+0x14
0200      fcd:	eb 07                	jmp    fd6 <start_kernel+0x209>
0202      fcf:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	fd2: R_X86_64_32S	.rodata.str1.1+0x11
0209      fd6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	fd9: R_X86_64_32S	.rodata.str1.1+0x14
0210      fdd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	fe0: R_X86_64_32S	.rodata.str1.8+0x340
0217      fe4:	e8 00 00 00 00       	call   fe9 <start_kernel+0x21c>	fe5: R_X86_64_PLT32	_printk-0x4
021c      fe9:	e8 00 00 00 00       	call   fee <start_kernel+0x221>	fea: R_X86_64_PC32	.text.unlikely+0x12a
0221      fee:	84 c0                	test   %al,%al
0223      ff0:	74 0c                	je     ffe <start_kernel+0x231>
0225      ff2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ff5: R_X86_64_32S	.rodata.str1.8+0x378
022c      ff9:	e8 00 00 00 00       	call   ffe <start_kernel+0x231>	ffa: R_X86_64_PLT32	_printk-0x4
0231      ffe:	e8 00 00 00 00       	call   1003 <start_kernel+0x236>	fff: R_X86_64_PLT32	stack_depot_early_init-0x4
0236     1003:	e8 00 00 00 00       	call   1008 <start_kernel+0x23b>	1004: R_X86_64_PLT32	mem_init-0x4
023b     1008:	e8 00 00 00 00       	call   100d <start_kernel+0x240>	1009: R_X86_64_PLT32	mem_init_print_info-0x4
0240     100d:	e8 00 00 00 00       	call   1012 <start_kernel+0x245>	100e: R_X86_64_PLT32	kmem_cache_init-0x4
0245     1012:	e8 00 00 00 00       	call   1017 <start_kernel+0x24a>	1013: R_X86_64_PLT32	ptlock_cache_init-0x4
024a     1017:	e8 00 00 00 00       	call   101c <start_kernel+0x24f>	1018: R_X86_64_PLT32	pgtable_cache_init-0x4
024f     101c:	e8 00 00 00 00       	call   1021 <start_kernel+0x254>	101d: R_X86_64_PLT32	debug_objects_mem_init-0x4
0254     1021:	e8 00 00 00 00       	call   1026 <start_kernel+0x259>	1022: R_X86_64_PLT32	vmalloc_init-0x4
0259     1026:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 102d <start_kernel+0x260>	1028: R_X86_64_PC32	early_page_ext-0x5
0260     102d:	74 05                	je     1034 <start_kernel+0x267>
0262     102f:	e8 00 00 00 00       	call   1034 <start_kernel+0x267>	1030: R_X86_64_PLT32	page_ext_init-0x4
0267     1034:	e8 00 00 00 00       	call   1039 <start_kernel+0x26c>	1035: R_X86_64_PLT32	init_espfix_bsp-0x4
026c     1039:	e8 00 00 00 00       	call   103e <start_kernel+0x271>	103a: R_X86_64_PLT32	mm_cache_init-0x4
0271     103e:	e8 00 00 00 00       	call   1043 <start_kernel+0x276>	103f: R_X86_64_PLT32	poking_init-0x4
0276     1043:	e8 00 00 00 00       	call   1048 <start_kernel+0x27b>	1044: R_X86_64_PLT32	early_trace_init-0x4
027b     1048:	e8 00 00 00 00       	call   104d <start_kernel+0x280>	1049: R_X86_64_PLT32	sched_init-0x4
0280     104d:	9c                   	pushf
0281     104e:	58                   	pop    %rax
0282     104f:	0f ba e0 09          	bt     $0x9,%eax
0286     1053:	73 20                	jae    1075 <start_kernel+0x2a8>
0288     1055:	90                   	nop
0289     1056:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1059: R_X86_64_32S	.rodata.str1.8+0x3b8
0290     105d:	e8 00 00 00 00       	call   1062 <start_kernel+0x295>	105e: R_X86_64_PLT32	__warn_printk-0x4
0295     1062:	90                   	nop
0296     1063:	0f 0b                	ud2
0298     1065:	90                   	nop
0299     1066:	90                   	nop
029a     1067:	9c                   	pushf
029b     1068:	58                   	pop    %rax
029c     1069:	fa                   	cli
029d     106a:	0f ba e0 09          	bt     $0x9,%eax
02a1     106e:	73 05                	jae    1075 <start_kernel+0x2a8>
02a3     1070:	e8 00 00 00 00       	call   1075 <start_kernel+0x2a8>	1071: R_X86_64_PLT32	trace_hardirqs_off-0x4
02a8     1075:	e8 00 00 00 00       	call   107a <start_kernel+0x2ad>	1076: R_X86_64_PLT32	radix_tree_init-0x4
02ad     107a:	e8 00 00 00 00       	call   107f <start_kernel+0x2b2>	107b: R_X86_64_PLT32	maple_tree_init-0x4
02b2     107f:	e8 00 00 00 00       	call   1084 <start_kernel+0x2b7>	1080: R_X86_64_PLT32	workqueue_init_early-0x4
02b7     1084:	e8 00 00 00 00       	call   1089 <start_kernel+0x2bc>	1085: R_X86_64_PLT32	rcu_init-0x4
02bc     1089:	e8 00 00 00 00       	call   108e <start_kernel+0x2c1>	108a: R_X86_64_PLT32	trace_init-0x4
02c1     108e:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1095 <start_kernel+0x2c8>	1090: R_X86_64_PC32	initcall_debug-0x5
02c8     1095:	74 4c                	je     10e3 <start_kernel+0x316>
02ca     1097:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	109a: R_X86_64_32S	.bss+0x1008
02d1     109e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	10a1: R_X86_64_32S	.text.unlikely+0x13a
02d8     10a5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10a8: R_X86_64_32S	__tracepoint_initcall_start
02df     10ac:	e8 00 00 00 00       	call   10b1 <start_kernel+0x2e4>	10ad: R_X86_64_PLT32	tracepoint_probe_register-0x4
02e4     10b1:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	10b4: R_X86_64_32S	.bss+0x1008
02eb     10b8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	10bb: R_X86_64_32S	.text+0x5b0
02f2     10bf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10c2: R_X86_64_32S	__tracepoint_initcall_finish
02f9     10c6:	89 c3                	mov    %eax,%ebx
02fb     10c8:	e8 00 00 00 00       	call   10cd <start_kernel+0x300>	10c9: R_X86_64_PLT32	tracepoint_probe_register-0x4
0300     10cd:	09 c3                	or     %eax,%ebx
0302     10cf:	74 12                	je     10e3 <start_kernel+0x316>
0304     10d1:	90                   	nop
0305     10d2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10d5: R_X86_64_32S	.rodata.str1.8+0x3f0
030c     10d9:	e8 00 00 00 00       	call   10de <start_kernel+0x311>	10da: R_X86_64_PLT32	__warn_printk-0x4
0311     10de:	90                   	nop
0312     10df:	0f 0b                	ud2
0314     10e1:	90                   	nop
0315     10e2:	90                   	nop
0316     10e3:	e8 00 00 00 00       	call   10e8 <start_kernel+0x31b>	10e4: R_X86_64_PLT32	early_irq_init-0x4
031b     10e8:	e8 00 00 00 00       	call   10ed <start_kernel+0x320>	10e9: R_X86_64_PLT32	init_IRQ-0x4
0320     10ed:	e8 00 00 00 00       	call   10f2 <start_kernel+0x325>	10ee: R_X86_64_PLT32	tick_init-0x4
0325     10f2:	e8 00 00 00 00       	call   10f7 <start_kernel+0x32a>	10f3: R_X86_64_PLT32	init_timers-0x4
032a     10f7:	e8 00 00 00 00       	call   10fc <start_kernel+0x32f>	10f8: R_X86_64_PLT32	srcu_init-0x4
032f     10fc:	e8 00 00 00 00       	call   1101 <start_kernel+0x334>	10fd: R_X86_64_PLT32	hrtimers_init-0x4
0334     1101:	e8 00 00 00 00       	call   1106 <start_kernel+0x339>	1102: R_X86_64_PLT32	softirq_init-0x4
0339     1106:	e8 00 00 00 00       	call   110b <start_kernel+0x33e>	1107: R_X86_64_PLT32	timekeeping_init-0x4
033e     110b:	e8 00 00 00 00       	call   1110 <start_kernel+0x343>	110c: R_X86_64_PLT32	time_init-0x4
0343     1110:	e8 00 00 00 00       	call   1115 <start_kernel+0x348>	1111: R_X86_64_PLT32	random_init-0x4
0348     1115:	e8 00 00 00 00       	call   111a <start_kernel+0x34d>	1116: R_X86_64_PLT32	perf_event_init-0x4
034d     111a:	e8 00 00 00 00       	call   111f <start_kernel+0x352>	111b: R_X86_64_PLT32	call_function_init-0x4
0352     111f:	9c                   	pushf
0353     1120:	58                   	pop    %rax
0354     1121:	0f ba e0 09          	bt     $0x9,%eax
0358     1125:	73 12                	jae    1139 <start_kernel+0x36c>
035a     1127:	90                   	nop
035b     1128:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	112b: R_X86_64_32S	.rodata.str1.8+0x420
0362     112f:	e8 00 00 00 00       	call   1134 <start_kernel+0x367>	1130: R_X86_64_PLT32	__warn_printk-0x4
0367     1134:	90                   	nop
0368     1135:	0f 0b                	ud2
036a     1137:	90                   	nop
036b     1138:	90                   	nop
036c     1139:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 1140 <start_kernel+0x373>	113b: R_X86_64_PC32	early_boot_irqs_disabled-0x5
0373     1140:	e8 00 00 00 00       	call   1145 <start_kernel+0x378>	1141: R_X86_64_PLT32	trace_hardirqs_on-0x4
0378     1145:	fb                   	sti
0379     1146:	e8 00 00 00 00       	call   114b <start_kernel+0x37e>	1147: R_X86_64_PLT32	kmem_cache_init_late-0x4
037e     114b:	e8 00 00 00 00       	call   1150 <start_kernel+0x383>	114c: R_X86_64_PLT32	console_init-0x4
0383     1150:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1157 <start_kernel+0x38a>	1153: R_X86_64_PC32	.bss+0x1014
038a     1157:	48 85 f6             	test   %rsi,%rsi
038d     115a:	74 13                	je     116f <start_kernel+0x3a2>
038f     115c:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 1163 <start_kernel+0x396>	115f: R_X86_64_PC32	.bss+0x100c
0396     1163:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1166: R_X86_64_32S	.rodata.str1.1+0x1be
039d     116a:	e8 00 00 00 00       	call   116f <start_kernel+0x3a2>	116b: R_X86_64_PLT32	panic-0x4
03a2     116f:	e8 00 00 00 00       	call   1174 <start_kernel+0x3a7>	1170: R_X86_64_PLT32	lockdep_init-0x4
03a7     1174:	e8 00 00 00 00       	call   1179 <start_kernel+0x3ac>	1175: R_X86_64_PLT32	mem_encrypt_init-0x4
03ac     1179:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 1180 <start_kernel+0x3b3>	117c: R_X86_64_PC32	initrd_start-0x4
03b3     1180:	48 85 ff             	test   %rdi,%rdi
03b6     1183:	74 6a                	je     11ef <start_kernel+0x422>
03b8     1185:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 118c <start_kernel+0x3bf>	1187: R_X86_64_PC32	initrd_below_start_ok-0x5
03bf     118c:	75 61                	jne    11ef <start_kernel+0x422>
03c1     118e:	e8 00 00 00 00       	call   1193 <start_kernel+0x3c6>	118f: R_X86_64_PLT32	__phys_addr-0x4
03c6     1193:	48 bb b7 6d db b6 6d db b6 6d 	movabs $0x6db6db6db6db6db7,%rbx
03d0     119d:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 11a4 <start_kernel+0x3d7>	11a0: R_X86_64_PC32	min_low_pfn-0x4
03d7     11a4:	48 c1 e8 0c          	shr    $0xc,%rax
03db     11a8:	48 6b c0 38          	imul   $0x38,%rax,%rax
03df     11ac:	48 c1 f8 03          	sar    $0x3,%rax
03e3     11b0:	48 0f af c3          	imul   %rbx,%rax
03e7     11b4:	4c 39 e0             	cmp    %r12,%rax
03ea     11b7:	73 36                	jae    11ef <start_kernel+0x422>
03ec     11b9:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 11c0 <start_kernel+0x3f3>	11bc: R_X86_64_PC32	initrd_start-0x4
03f3     11c0:	e8 00 00 00 00       	call   11c5 <start_kernel+0x3f8>	11c1: R_X86_64_PLT32	__phys_addr-0x4
03f8     11c5:	4c 89 e2             	mov    %r12,%rdx
03fb     11c8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11cb: R_X86_64_32S	.rodata.str1.8+0x440
0402     11cf:	48 c1 e8 0c          	shr    $0xc,%rax
0406     11d3:	48 6b f0 38          	imul   $0x38,%rax,%rsi
040a     11d7:	48 c1 fe 03          	sar    $0x3,%rsi
040e     11db:	48 0f af f3          	imul   %rbx,%rsi
0412     11df:	e8 00 00 00 00       	call   11e4 <start_kernel+0x417>	11e0: R_X86_64_PLT32	_printk-0x4
0417     11e4:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # 11ef <start_kernel+0x422>	11e7: R_X86_64_PC32	initrd_start-0x8
0422     11ef:	e8 00 00 00 00       	call   11f4 <start_kernel+0x427>	11f0: R_X86_64_PLT32	setup_per_cpu_pageset-0x4
0427     11f4:	e8 00 00 00 00       	call   11f9 <start_kernel+0x42c>	11f5: R_X86_64_PLT32	acpi_early_init-0x4
042c     11f9:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1200 <start_kernel+0x433>	11fc: R_X86_64_PC32	late_time_init-0x4
0433     1200:	48 85 c0             	test   %rax,%rax
0436     1203:	74 02                	je     1207 <start_kernel+0x43a>
0438     1205:	ff d0                	call   *%rax
043a     1207:	e8 00 00 00 00       	call   120c <start_kernel+0x43f>	1208: R_X86_64_PLT32	sched_clock_init-0x4
043f     120c:	e8 00 00 00 00       	call   1211 <start_kernel+0x444>	120d: R_X86_64_PLT32	calibrate_delay-0x4
0444     1211:	e8 00 00 00 00       	call   1216 <start_kernel+0x449>	1212: R_X86_64_PLT32	pid_idr_init-0x4
0449     1216:	e8 00 00 00 00       	call   121b <start_kernel+0x44e>	1217: R_X86_64_PLT32	anon_vma_init-0x4
044e     121b:	e8 00 00 00 00       	call   1220 <start_kernel+0x453>	121c: R_X86_64_PLT32	thread_stack_cache_init-0x4
0453     1220:	e8 00 00 00 00       	call   1225 <start_kernel+0x458>	1221: R_X86_64_PLT32	cred_init-0x4
0458     1225:	e8 00 00 00 00       	call   122a <start_kernel+0x45d>	1226: R_X86_64_PLT32	fork_init-0x4
045d     122a:	e8 00 00 00 00       	call   122f <start_kernel+0x462>	122b: R_X86_64_PLT32	proc_caches_init-0x4
0462     122f:	e8 00 00 00 00       	call   1234 <start_kernel+0x467>	1230: R_X86_64_PLT32	key_init-0x4
0467     1234:	e8 00 00 00 00       	call   1239 <start_kernel+0x46c>	1235: R_X86_64_PLT32	security_init-0x4
046c     1239:	e8 00 00 00 00       	call   123e <start_kernel+0x471>	123a: R_X86_64_PLT32	net_ns_init-0x4
0471     123e:	e8 00 00 00 00       	call   1243 <start_kernel+0x476>	123f: R_X86_64_PLT32	vfs_caches_init-0x4
0476     1243:	e8 00 00 00 00       	call   1248 <start_kernel+0x47b>	1244: R_X86_64_PLT32	pagecache_init-0x4
047b     1248:	e8 00 00 00 00       	call   124d <start_kernel+0x480>	1249: R_X86_64_PLT32	signals_init-0x4
0480     124d:	e8 00 00 00 00       	call   1252 <start_kernel+0x485>	124e: R_X86_64_PLT32	seq_file_init-0x4
0485     1252:	e8 00 00 00 00       	call   1257 <start_kernel+0x48a>	1253: R_X86_64_PLT32	proc_root_init-0x4
048a     1257:	e8 00 00 00 00       	call   125c <start_kernel+0x48f>	1258: R_X86_64_PLT32	nsfs_init-0x4
048f     125c:	e8 00 00 00 00       	call   1261 <start_kernel+0x494>	125d: R_X86_64_PLT32	cpuset_init-0x4
0494     1261:	e8 00 00 00 00       	call   1266 <start_kernel+0x499>	1262: R_X86_64_PLT32	cgroup_init-0x4
0499     1266:	e8 00 00 00 00       	call   126b <start_kernel+0x49e>	1267: R_X86_64_PLT32	check_bugs-0x4
049e     126b:	e8 00 00 00 00       	call   1270 <start_kernel+0x4a3>	126c: R_X86_64_PLT32	acpi_subsystem_init-0x4
04a3     1270:	e8 00 00 00 00       	call   1275 <start_kernel+0x4a8>	1271: R_X86_64_PLT32	arch_post_acpi_subsys_init-0x4
04a8     1275:	e8 00 00 00 00       	call   127a <start_kernel+0x4ad>	1276: R_X86_64_PLT32	arch_call_rest_init-0x4
04ad     127a:	0f ae f0             	mfence
04b0     127d:	58                   	pop    %rax
04b1     127e:	5b                   	pop    %rbx
04b2     127f:	5d                   	pop    %rbp
04b3     1280:	41 5c                	pop    %r12
04b5     1282:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
