Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F35E23A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676280555; x=1707816555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TdOSgvLJcyTlBWTlRdYX3yhpkZCpq+OTIJwnVn8UA9s=;
  b=fUDGi7Mb9Qa8zXSsa8bfp6s/mq8LUAnIOhPOgz8Ul8IZ+XYbmiXmzn+f
   or9femue8qysMnA2oFbyqcvZE/WtNPC3tSoDoHwFyEfLggH7TwGroo4cY
   f29gPpLSRvBI/xkV0M2qNYe/TtMQCRa+jhk307W/soor4t/UXSJPyUf1D
   fuLpnuHAxD1AhuIQIxmVlMxSp6gmSdy1jnGqhwNHj6bxICDlRgIIcTywd
   /s8pYHQG5rphs/EXqEyqqVhylwY3plLkT1Z/MNy6HTKYwdqhdC6xXi10D
   VDqaohctX+XNKH7njDP/Oj3QrUHnvr6vEJlbYM4+6mJh5a14Y1wXTLx1O
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="358258496"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="358258496"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 01:29:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="732433073"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="732433073"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2023 01:29:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRV96-0007eV-14;
	Mon, 13 Feb 2023 09:29:12 +0000
Date: Mon, 13 Feb 2023 17:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:arch-cpu-idle-dead-noreturn 22/23] vmlinux.o: warning:
 objtool: start_kernel+0x4a1: unreachable instruction
Message-ID: <202302131730.qqD7TUQE-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230213/202302131730.qqD7TUQE-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302131730.qqD7TUQE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: start_kernel+0x4a1: unreachable instruction


objdump-func vmlinux.o start_kernel:
0000 0000000000000fd3 <start_kernel>:
0000      fd3:	f3 0f 1e fa          	endbr64
0004      fd7:	e8 00 00 00 00       	call   fdc <start_kernel+0x9>	fd8: R_X86_64_PLT32	__fentry__-0x4
0009      fdc:	41 54                	push   %r12
000b      fde:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	fe1: R_X86_64_32S	init_task
0012      fe5:	55                   	push   %rbp
0013      fe6:	53                   	push   %rbx
0014      fe7:	48 83 ec 10          	sub    $0x10,%rsp
0018      feb:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0021      ff4:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0026      ff9:	31 c0                	xor    %eax,%eax
0028      ffb:	e8 00 00 00 00       	call   1000 <start_kernel+0x2d>	ffc: R_X86_64_PLT32	set_task_stack_end_magic-0x4
002d     1000:	e8 00 00 00 00       	call   1005 <start_kernel+0x32>	1001: R_X86_64_PLT32	smp_setup_processor_id-0x4
0032     1005:	e8 00 00 00 00       	call   100a <start_kernel+0x37>	1006: R_X86_64_PLT32	init_vmlinux_build_id-0x4
0037     100a:	e8 00 00 00 00       	call   100f <start_kernel+0x3c>	100b: R_X86_64_PLT32	cgroup_init_early-0x4
003c     100f:	fa                   	cli
003d     1010:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1017 <start_kernel+0x44>	1012: R_X86_64_PC32	early_boot_irqs_disabled-0x5
0044     1017:	e8 00 00 00 00       	call   101c <start_kernel+0x49>	1018: R_X86_64_PLT32	boot_cpu_init-0x4
0049     101c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	101f: R_X86_64_32S	linux_banner
0050     1023:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1026: R_X86_64_32S	.rodata.str1.1+0x345
0057     102a:	e8 00 00 00 00       	call   102f <start_kernel+0x5c>	102b: R_X86_64_PLT32	_printk-0x4
005c     102f:	48 89 e7             	mov    %rsp,%rdi
005f     1032:	e8 00 00 00 00       	call   1037 <start_kernel+0x64>	1033: R_X86_64_PLT32	setup_arch-0x4
0064     1037:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # 103e <start_kernel+0x6b>	103a: R_X86_64_PC32	initrd_end-0x4
006b     103e:	48 85 ed             	test   %rbp,%rbp
006e     1041:	0f 84 88 00 00 00    	je     10cf <start_kernel+0xfc>
0074     1047:	48 8d 5d f4          	lea    -0xc(%rbp),%rbx
0078     104b:	4c 8d 65 f0          	lea    -0x10(%rbp),%r12
007c     104f:	ba 0c 00 00 00       	mov    $0xc,%edx
0081     1054:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1057: R_X86_64_32S	.rodata.str1.1+0x34a
0088     105b:	48 89 df             	mov    %rbx,%rdi
008b     105e:	e8 00 00 00 00       	call   1063 <start_kernel+0x90>	105f: R_X86_64_PLT32	memcmp-0x4
0090     1063:	85 c0                	test   %eax,%eax
0092     1065:	75 1f                	jne    1086 <start_kernel+0xb3>
0094     1067:	8b 73 f8             	mov    -0x8(%rbx),%esi
0097     106a:	8b 7b fc             	mov    -0x4(%rbx),%edi
009a     106d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1074 <start_kernel+0xa1>	1070: R_X86_64_PC32	initrd_start-0x4
00a1     1074:	48 29 f3             	sub    %rsi,%rbx
00a4     1077:	48 8d 53 f8          	lea    -0x8(%rbx),%rdx
00a8     107b:	48 39 c2             	cmp    %rax,%rdx
00ab     107e:	72 10                	jb     1090 <start_kernel+0xbd>
00ad     1080:	31 c0                	xor    %eax,%eax
00af     1082:	31 c9                	xor    %ecx,%ecx
00b1     1084:	eb 1e                	jmp    10a4 <start_kernel+0xd1>
00b3     1086:	48 ff cb             	dec    %rbx
00b6     1089:	49 39 dc             	cmp    %rbx,%r12
00b9     108c:	75 c1                	jne    104f <start_kernel+0x7c>
00bb     108e:	eb 3f                	jmp    10cf <start_kernel+0xfc>
00bd     1090:	48 89 ea             	mov    %rbp,%rdx
00c0     1093:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1096: R_X86_64_32S	.rodata.str1.1+0x357
00c7     109a:	48 29 c2             	sub    %rax,%rdx
00ca     109d:	e8 00 00 00 00       	call   10a2 <start_kernel+0xcf>	109e: R_X86_64_PLT32	_printk-0x4
00cf     10a2:	eb 2b                	jmp    10cf <start_kernel+0xfc>
00d1     10a4:	48 39 c6             	cmp    %rax,%rsi
00d4     10a7:	74 0d                	je     10b6 <start_kernel+0xe3>
00d6     10a9:	44 0f b6 04 02       	movzbl (%rdx,%rax,1),%r8d
00db     10ae:	48 ff c0             	inc    %rax
00de     10b1:	44 01 c1             	add    %r8d,%ecx
00e1     10b4:	eb ee                	jmp    10a4 <start_kernel+0xd1>
00e3     10b6:	39 cf                	cmp    %ecx,%edi
00e5     10b8:	74 0e                	je     10c8 <start_kernel+0xf5>
00e7     10ba:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10bd: R_X86_64_32S	.rodata.str1.1+0x38d
00ee     10c1:	e8 00 00 00 00       	call   10c6 <start_kernel+0xf3>	10c2: R_X86_64_PLT32	_printk-0x4
00f3     10c6:	eb 07                	jmp    10cf <start_kernel+0xfc>
00f5     10c8:	48 89 15 00 00 00 00 	mov    %rdx,0x0(%rip)        # 10cf <start_kernel+0xfc>	10cb: R_X86_64_PC32	initrd_end-0x4
00fc     10cf:	48 8b 3c 24          	mov    (%rsp),%rdi
0100     10d3:	e8 c7 f9 ff ff       	call   a9f <setup_command_line>
0105     10d8:	e8 00 00 00 00       	call   10dd <start_kernel+0x10a>	10d9: R_X86_64_PLT32	setup_nr_cpu_ids-0x4
010a     10dd:	e8 00 00 00 00       	call   10e2 <start_kernel+0x10f>	10de: R_X86_64_PLT32	setup_per_cpu_areas-0x4
010f     10e2:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 10e8 <start_kernel+0x115>	10e4: R_X86_64_PC32	smp_ops-0x4
0115     10e8:	e8 00 00 00 00       	call   10ed <start_kernel+0x11a>	10e9: R_X86_64_PLT32	boot_cpu_hotplug_init-0x4
011a     10ed:	31 ff                	xor    %edi,%edi
011c     10ef:	e8 00 00 00 00       	call   10f4 <start_kernel+0x121>	10f0: R_X86_64_PLT32	build_all_zonelists-0x4
0121     10f4:	e8 00 00 00 00       	call   10f9 <start_kernel+0x126>	10f5: R_X86_64_PLT32	page_alloc_init-0x4
0126     10f9:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1100 <start_kernel+0x12d>	10fc: R_X86_64_PC32	saved_command_line-0x4
012d     1100:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1103: R_X86_64_32S	.rodata.str1.1+0x3ab
0134     1107:	e8 00 00 00 00       	call   110c <start_kernel+0x139>	1108: R_X86_64_PLT32	_printk-0x4
0139     110c:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1113 <start_kernel+0x140>	110e: R_X86_64_PC32	static_key_initialized-0x5
0140     1113:	e8 00 00 00 00       	call   1118 <start_kernel+0x145>	1114: R_X86_64_PLT32	parse_early_param-0x4
0145     1118:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	111b: R_X86_64_32S	__stop___param
014c     111f:	41 83 c8 ff          	or     $0xffffffff,%r8d
0150     1123:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 112a <start_kernel+0x157>	1126: R_X86_64_PC32	.bss+0x1024
0157     112a:	48 81 e9 00 00 00 00 	sub    $0x0,%rcx	112d: R_X86_64_32S	__start___param
015e     1131:	68 00 00 00 00       	push   $0x0	1132: R_X86_64_32S	.init.text+0x910
0163     1136:	41 83 c9 ff          	or     $0xffffffff,%r9d
0167     113a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	113d: R_X86_64_32S	.rodata.str1.1+0x3c6
016e     1141:	48 c1 f9 03          	sar    $0x3,%rcx
0172     1145:	6a 00                	push   $0x0
0174     1147:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	114a: R_X86_64_32S	__start___param
017b     114e:	69 c9 cd cc cc cc    	imul   $0xcccccccd,%ecx,%ecx
0181     1154:	e8 00 00 00 00       	call   1159 <start_kernel+0x186>	1155: R_X86_64_PLT32	parse_args-0x4
0186     1159:	48 89 c5             	mov    %rax,%rbp
0189     115c:	e8 33 fa ff ff       	call   b94 <print_unknown_bootoptions>
018e     1161:	5f                   	pop    %rdi
018f     1162:	41 58                	pop    %r8
0191     1164:	48 85 ed             	test   %rbp,%rbp
0194     1167:	74 2d                	je     1196 <start_kernel+0x1c3>
0196     1169:	48 81 fd 00 f0 ff ff 	cmp    $0xfffffffffffff000,%rbp
019d     1170:	77 24                	ja     1196 <start_kernel+0x1c3>
019f     1172:	68 00 00 00 00       	push   $0x0	1173: R_X86_64_32S	.init.text+0x8b9
01a4     1177:	31 c9                	xor    %ecx,%ecx
01a6     1179:	48 89 ee             	mov    %rbp,%rsi
01a9     117c:	41 83 c9 ff          	or     $0xffffffff,%r9d
01ad     1180:	6a 00                	push   $0x0
01af     1182:	41 83 c8 ff          	or     $0xffffffff,%r8d
01b3     1186:	31 d2                	xor    %edx,%edx
01b5     1188:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	118b: R_X86_64_32S	.rodata.str1.1+0x3d5
01bc     118f:	e8 00 00 00 00       	call   1194 <start_kernel+0x1c1>	1190: R_X86_64_PLT32	parse_args-0x4
01c1     1194:	59                   	pop    %rcx
01c2     1195:	5e                   	pop    %rsi
01c3     1196:	48 8b 3c 24          	mov    (%rsp),%rdi
01c7     119a:	e8 00 00 00 00       	call   119f <start_kernel+0x1cc>	119b: R_X86_64_PLT32	random_init_early-0x4
01cc     119f:	31 ff                	xor    %edi,%edi
01ce     11a1:	e8 00 00 00 00       	call   11a6 <start_kernel+0x1d3>	11a2: R_X86_64_PLT32	setup_log_buf-0x4
01d3     11a6:	e8 00 00 00 00       	call   11ab <start_kernel+0x1d8>	11a7: R_X86_64_PLT32	vfs_caches_init_early-0x4
01d8     11ab:	e8 00 00 00 00       	call   11b0 <start_kernel+0x1dd>	11ac: R_X86_64_PLT32	sort_main_extable-0x4
01dd     11b0:	e8 00 00 00 00       	call   11b5 <start_kernel+0x1e2>	11b1: R_X86_64_PLT32	trap_init-0x4
01e2     11b5:	e8 00 00 00 00       	call   11ba <start_kernel+0x1e7>	11b6: R_X86_64_PLT32	init_mem_debugging_and_hardening-0x4
01e7     11ba:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # 11c0 <start_kernel+0x1ed>	11bc: R_X86_64_PC32	init_on_free-0x4
01ed     11c0:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	11c3: R_X86_64_32S	.rodata.str1.1+0xb0
01f4     11c7:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 11cd <start_kernel+0x1fa>	11c9: R_X86_64_PC32	init_on_alloc-0x4
01fa     11cd:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	11d0: R_X86_64_32S	.rodata.str1.1+0xad
0201     11d4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11d7: R_X86_64_32S	.rodata.str1.1+0x3e7
0208     11db:	85 c9                	test   %ecx,%ecx
020a     11dd:	48 89 c1             	mov    %rax,%rcx
020d     11e0:	48 0f 4f ca          	cmovg  %rdx,%rcx
0211     11e4:	85 f6                	test   %esi,%esi
0213     11e6:	48 89 c6             	mov    %rax,%rsi
0216     11e9:	48 0f 4e d0          	cmovle %rax,%rdx
021a     11ed:	e8 00 00 00 00       	call   11f2 <start_kernel+0x21f>	11ee: R_X86_64_PLT32	_printk-0x4
021f     11f2:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 11f8 <start_kernel+0x225>	11f4: R_X86_64_PC32	init_on_free-0x4
0225     11f8:	85 c0                	test   %eax,%eax
0227     11fa:	7e 0c                	jle    1208 <start_kernel+0x235>
0229     11fc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11ff: R_X86_64_32S	.rodata.str1.1+0x41f
0230     1203:	e8 00 00 00 00       	call   1208 <start_kernel+0x235>	1204: R_X86_64_PLT32	_printk-0x4
0235     1208:	e8 00 00 00 00       	call   120d <start_kernel+0x23a>	1209: R_X86_64_PLT32	stack_depot_early_init-0x4
023a     120d:	e8 00 00 00 00       	call   1212 <start_kernel+0x23f>	120e: R_X86_64_PLT32	mem_init-0x4
023f     1212:	e8 00 00 00 00       	call   1217 <start_kernel+0x244>	1213: R_X86_64_PLT32	mem_init_print_info-0x4
0244     1217:	e8 00 00 00 00       	call   121c <start_kernel+0x249>	1218: R_X86_64_PLT32	kmem_cache_init-0x4
0249     121c:	e8 00 00 00 00       	call   1221 <start_kernel+0x24e>	121d: R_X86_64_PLT32	pgtable_cache_init-0x4
024e     1221:	e8 00 00 00 00       	call   1226 <start_kernel+0x253>	1222: R_X86_64_PLT32	vmalloc_init-0x4
0253     1226:	e8 00 00 00 00       	call   122b <start_kernel+0x258>	1227: R_X86_64_PLT32	pti_init-0x4
0258     122b:	e8 00 00 00 00       	call   1230 <start_kernel+0x25d>	122c: R_X86_64_PLT32	mm_cache_init-0x4
025d     1230:	e8 00 00 00 00       	call   1235 <start_kernel+0x262>	1231: R_X86_64_PLT32	poking_init-0x4
0262     1235:	e8 00 00 00 00       	call   123a <start_kernel+0x267>	1236: R_X86_64_PLT32	ftrace_init-0x4
0267     123a:	e8 00 00 00 00       	call   123f <start_kernel+0x26c>	123b: R_X86_64_PLT32	early_trace_init-0x4
026c     123f:	e8 00 00 00 00       	call   1244 <start_kernel+0x271>	1240: R_X86_64_PLT32	sched_init-0x4
0271     1244:	9c                   	pushf
0272     1245:	58                   	pop    %rax
0273     1246:	0f ba e0 09          	bt     $0x9,%eax
0277     124a:	73 0f                	jae    125b <start_kernel+0x288>
0279     124c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	124f: R_X86_64_32S	.rodata.str1.1+0x45e
0280     1253:	e8 00 00 00 00       	call   1258 <start_kernel+0x285>	1254: R_X86_64_PLT32	__warn_printk-0x4
0285     1258:	0f 0b                	ud2
0287     125a:	fa                   	cli
0288     125b:	e8 00 00 00 00       	call   1260 <start_kernel+0x28d>	125c: R_X86_64_PLT32	radix_tree_init-0x4
028d     1260:	e8 00 00 00 00       	call   1265 <start_kernel+0x292>	1261: R_X86_64_PLT32	maple_tree_init-0x4
0292     1265:	e8 00 00 00 00       	call   126a <start_kernel+0x297>	1266: R_X86_64_PLT32	housekeeping_init-0x4
0297     126a:	e8 00 00 00 00       	call   126f <start_kernel+0x29c>	126b: R_X86_64_PLT32	workqueue_init_early-0x4
029c     126f:	e8 00 00 00 00       	call   1274 <start_kernel+0x2a1>	1270: R_X86_64_PLT32	rcu_init-0x4
02a1     1274:	e8 00 00 00 00       	call   1279 <start_kernel+0x2a6>	1275: R_X86_64_PLT32	trace_init-0x4
02a6     1279:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1280 <start_kernel+0x2ad>	127b: R_X86_64_PC32	initcall_debug-0x5
02ad     1280:	74 48                	je     12ca <start_kernel+0x2f7>
02af     1282:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1285: R_X86_64_32S	.bss+0x1008
02b6     1289:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	128c: R_X86_64_32S	.text.unlikely+0xa6
02bd     1290:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1293: R_X86_64_32S	__tracepoint_initcall_start
02c4     1297:	e8 00 00 00 00       	call   129c <start_kernel+0x2c9>	1298: R_X86_64_PLT32	tracepoint_probe_register-0x4
02c9     129c:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	129f: R_X86_64_32S	.bss+0x1008
02d0     12a3:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	12a6: R_X86_64_32S	.text+0xf4
02d7     12aa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12ad: R_X86_64_32S	__tracepoint_initcall_finish
02de     12b1:	89 c3                	mov    %eax,%ebx
02e0     12b3:	e8 00 00 00 00       	call   12b8 <start_kernel+0x2e5>	12b4: R_X86_64_PLT32	tracepoint_probe_register-0x4
02e5     12b8:	09 d8                	or     %ebx,%eax
02e7     12ba:	74 0e                	je     12ca <start_kernel+0x2f7>
02e9     12bc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	12bf: R_X86_64_32S	.rodata.str1.1+0x48f
02f0     12c3:	e8 00 00 00 00       	call   12c8 <start_kernel+0x2f5>	12c4: R_X86_64_PLT32	__warn_printk-0x4
02f5     12c8:	0f 0b                	ud2
02f7     12ca:	e8 00 00 00 00       	call   12cf <start_kernel+0x2fc>	12cb: R_X86_64_PLT32	early_irq_init-0x4
02fc     12cf:	e8 00 00 00 00       	call   12d4 <start_kernel+0x301>	12d0: R_X86_64_PLT32	init_IRQ-0x4
0301     12d4:	e8 00 00 00 00       	call   12d9 <start_kernel+0x306>	12d5: R_X86_64_PLT32	tick_init-0x4
0306     12d9:	e8 00 00 00 00       	call   12de <start_kernel+0x30b>	12da: R_X86_64_PLT32	init_timers-0x4
030b     12de:	e8 00 00 00 00       	call   12e3 <start_kernel+0x310>	12df: R_X86_64_PLT32	srcu_init-0x4
0310     12e3:	e8 00 00 00 00       	call   12e8 <start_kernel+0x315>	12e4: R_X86_64_PLT32	hrtimers_init-0x4
0315     12e8:	e8 00 00 00 00       	call   12ed <start_kernel+0x31a>	12e9: R_X86_64_PLT32	softirq_init-0x4
031a     12ed:	e8 00 00 00 00       	call   12f2 <start_kernel+0x31f>	12ee: R_X86_64_PLT32	timekeeping_init-0x4
031f     12f2:	e8 00 00 00 00       	call   12f7 <start_kernel+0x324>	12f3: R_X86_64_PLT32	time_init-0x4
0324     12f7:	e8 00 00 00 00       	call   12fc <start_kernel+0x329>	12f8: R_X86_64_PLT32	random_init-0x4
0329     12fc:	e8 00 00 00 00       	call   1301 <start_kernel+0x32e>	12fd: R_X86_64_PLT32	get_random_u64-0x4
032e     1301:	30 c0                	xor    %al,%al
0330     1303:	65 48 8b 14 25 00 00 00 00 	mov    %gs:0x0,%rdx	1308: R_X86_64_32S	pcpu_hot
0339     130c:	48 89 82 50 05 00 00 	mov    %rax,0x550(%rdx)
0340     1313:	65 48 89 05 00 00 00 00 	mov    %rax,%gs:0x0(%rip)        # 131b <start_kernel+0x348>	1317: R_X86_64_PC32	fixed_percpu_data+0x24
0348     131b:	e8 00 00 00 00       	call   1320 <start_kernel+0x34d>	131c: R_X86_64_PLT32	perf_event_init-0x4
034d     1320:	e8 00 00 00 00       	call   1325 <start_kernel+0x352>	1321: R_X86_64_PLT32	call_function_init-0x4
0352     1325:	9c                   	pushf
0353     1326:	58                   	pop    %rax
0354     1327:	0f ba e0 09          	bt     $0x9,%eax
0358     132b:	73 0e                	jae    133b <start_kernel+0x368>
035a     132d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1330: R_X86_64_32S	.rodata.str1.1+0x4b8
0361     1334:	e8 00 00 00 00       	call   1339 <start_kernel+0x366>	1335: R_X86_64_PLT32	__warn_printk-0x4
0366     1339:	0f 0b                	ud2
0368     133b:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 1342 <start_kernel+0x36f>	133d: R_X86_64_PC32	early_boot_irqs_disabled-0x5
036f     1342:	fb                   	sti
0370     1343:	e8 00 00 00 00       	call   1348 <start_kernel+0x375>	1344: R_X86_64_PLT32	kmem_cache_init_late-0x4
0375     1348:	e8 00 00 00 00       	call   134d <start_kernel+0x37a>	1349: R_X86_64_PLT32	console_init-0x4
037a     134d:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1354 <start_kernel+0x381>	1350: R_X86_64_PC32	.bss+0x1014
0381     1354:	48 85 f6             	test   %rsi,%rsi
0384     1357:	74 13                	je     136c <start_kernel+0x399>
0386     1359:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 1360 <start_kernel+0x38d>	135c: R_X86_64_PC32	.bss+0x100c
038d     1360:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1363: R_X86_64_32S	.rodata.str1.1+0x4d7
0394     1367:	e8 00 00 00 00       	call   136c <start_kernel+0x399>	1368: R_X86_64_PLT32	panic-0x4
0399     136c:	e8 00 00 00 00       	call   1371 <start_kernel+0x39e>	136d: R_X86_64_PLT32	mem_encrypt_init-0x4
039e     1371:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1378 <start_kernel+0x3a5>	1374: R_X86_64_PC32	initrd_start-0x4
03a5     1378:	48 85 f6             	test   %rsi,%rsi
03a8     137b:	74 52                	je     13cf <start_kernel+0x3fc>
03aa     137d:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 1384 <start_kernel+0x3b1>	137f: R_X86_64_PC32	initrd_below_start_ok-0x5
03b1     1384:	75 49                	jne    13cf <start_kernel+0x3fc>
03b3     1386:	ba 00 00 00 80       	mov    $0x80000000,%edx
03b8     138b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1392 <start_kernel+0x3bf>	138e: R_X86_64_PC32	phys_base-0x4
03bf     1392:	48 01 d6             	add    %rdx,%rsi
03c2     1395:	72 0e                	jb     13a5 <start_kernel+0x3d2>
03c4     1397:	48 c7 c0 00 00 00 80 	mov    $0xffffffff80000000,%rax
03cb     139e:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 13a5 <start_kernel+0x3d2>	13a1: R_X86_64_PC32	page_offset_base-0x4
03d2     13a5:	48 01 c6             	add    %rax,%rsi
03d5     13a8:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 13af <start_kernel+0x3dc>	13ab: R_X86_64_PC32	min_low_pfn-0x4
03dc     13af:	48 c1 ee 0c          	shr    $0xc,%rsi
03e0     13b3:	48 39 d6             	cmp    %rdx,%rsi
03e3     13b6:	73 17                	jae    13cf <start_kernel+0x3fc>
03e5     13b8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13bb: R_X86_64_32S	.rodata.str1.1+0x4f5
03ec     13bf:	e8 00 00 00 00       	call   13c4 <start_kernel+0x3f1>	13c0: R_X86_64_PLT32	_printk-0x4
03f1     13c4:	48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,0x0(%rip)        # 13cf <start_kernel+0x3fc>	13c7: R_X86_64_PC32	initrd_start-0x8
03fc     13cf:	e8 00 00 00 00       	call   13d4 <start_kernel+0x401>	13d0: R_X86_64_PLT32	setup_per_cpu_pageset-0x4
0401     13d4:	e8 00 00 00 00       	call   13d9 <start_kernel+0x406>	13d5: R_X86_64_PLT32	numa_policy_init-0x4
0406     13d9:	e8 00 00 00 00       	call   13de <start_kernel+0x40b>	13da: R_X86_64_PLT32	acpi_early_init-0x4
040b     13de:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 13e5 <start_kernel+0x412>	13e1: R_X86_64_PC32	late_time_init-0x4
0412     13e5:	48 85 c0             	test   %rax,%rax
0415     13e8:	74 02                	je     13ec <start_kernel+0x419>
0417     13ea:	ff d0                	call   *%rax
0419     13ec:	e8 00 00 00 00       	call   13f1 <start_kernel+0x41e>	13ed: R_X86_64_PLT32	sched_clock_init-0x4
041e     13f1:	e8 00 00 00 00       	call   13f6 <start_kernel+0x423>	13f2: R_X86_64_PLT32	calibrate_delay-0x4
0423     13f6:	e8 00 00 00 00       	call   13fb <start_kernel+0x428>	13f7: R_X86_64_PLT32	pid_idr_init-0x4
0428     13fb:	e8 00 00 00 00       	call   1400 <start_kernel+0x42d>	13fc: R_X86_64_PLT32	anon_vma_init-0x4
042d     1400:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1407 <start_kernel+0x434>	1403: R_X86_64_PC32	efi+0xfc
0434     1407:	a8 08                	test   $0x8,%al
0436     1409:	74 05                	je     1410 <start_kernel+0x43d>
0438     140b:	e8 00 00 00 00       	call   1410 <start_kernel+0x43d>	140c: R_X86_64_PLT32	efi_enter_virtual_mode-0x4
043d     1410:	e8 00 00 00 00       	call   1415 <start_kernel+0x442>	1411: R_X86_64_PLT32	thread_stack_cache_init-0x4
0442     1415:	e8 00 00 00 00       	call   141a <start_kernel+0x447>	1416: R_X86_64_PLT32	cred_init-0x4
0447     141a:	e8 00 00 00 00       	call   141f <start_kernel+0x44c>	141b: R_X86_64_PLT32	fork_init-0x4
044c     141f:	e8 00 00 00 00       	call   1424 <start_kernel+0x451>	1420: R_X86_64_PLT32	proc_caches_init-0x4
0451     1424:	e8 00 00 00 00       	call   1429 <start_kernel+0x456>	1425: R_X86_64_PLT32	key_init-0x4
0456     1429:	e8 00 00 00 00       	call   142e <start_kernel+0x45b>	142a: R_X86_64_PLT32	net_ns_init-0x4
045b     142e:	e8 00 00 00 00       	call   1433 <start_kernel+0x460>	142f: R_X86_64_PLT32	vfs_caches_init-0x4
0460     1433:	e8 00 00 00 00       	call   1438 <start_kernel+0x465>	1434: R_X86_64_PLT32	pagecache_init-0x4
0465     1438:	e8 00 00 00 00       	call   143d <start_kernel+0x46a>	1439: R_X86_64_PLT32	signals_init-0x4
046a     143d:	e8 00 00 00 00       	call   1442 <start_kernel+0x46f>	143e: R_X86_64_PLT32	seq_file_init-0x4
046f     1442:	e8 00 00 00 00       	call   1447 <start_kernel+0x474>	1443: R_X86_64_PLT32	proc_root_init-0x4
0474     1447:	e8 00 00 00 00       	call   144c <start_kernel+0x479>	1448: R_X86_64_PLT32	nsfs_init-0x4
0479     144c:	e8 00 00 00 00       	call   1451 <start_kernel+0x47e>	144d: R_X86_64_PLT32	cpuset_init-0x4
047e     1451:	e8 00 00 00 00       	call   1456 <start_kernel+0x483>	1452: R_X86_64_PLT32	cgroup_init-0x4
0483     1456:	e8 00 00 00 00       	call   145b <start_kernel+0x488>	1457: R_X86_64_PLT32	taskstats_init_early-0x4
0488     145b:	e8 00 00 00 00       	call   1460 <start_kernel+0x48d>	145c: R_X86_64_PLT32	delayacct_init-0x4
048d     1460:	e8 00 00 00 00       	call   1465 <start_kernel+0x492>	1461: R_X86_64_PLT32	check_bugs-0x4
0492     1465:	e8 00 00 00 00       	call   146a <start_kernel+0x497>	1466: R_X86_64_PLT32	acpi_subsystem_init-0x4
0497     146a:	e8 00 00 00 00       	call   146f <start_kernel+0x49c>	146b: R_X86_64_PLT32	arch_post_acpi_subsys_init-0x4
049c     146f:	e8 00 00 00 00       	call   1474 <start_kernel+0x4a1>	1470: R_X86_64_PLT32	arch_call_rest_init-0x4
04a1     1474:	0f ae f0             	mfence
04a4     1477:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
04a9     147c:	65 48 2b 04 25 28 00 00 00 	sub    %gs:0x28,%rax
04b2     1485:	74 05                	je     148c <start_kernel+0x4b9>
04b4     1487:	e8 00 00 00 00       	call   148c <start_kernel+0x4b9>	1488: R_X86_64_PLT32	__stack_chk_fail-0x4
04b9     148c:	48 83 c4 10          	add    $0x10,%rsp
04bd     1490:	5b                   	pop    %rbx
04be     1491:	5d                   	pop    %rbp
04bf     1492:	41 5c                	pop    %r12
04c1     1494:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
