Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D869190
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 00:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693873054; x=1725409054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y5lsUseUCLuOMHdzKpPg5yl8DW0arGF75g8hyClk7/E=;
  b=Fk1R8GCYxIteM1HV+condeOfI65pw9umo6QZXwyRoAnwF3KaEBI23kc6
   GbxyzmiK57TA7HAVn7bcSa7gHbIVHzvdTQo0HobBBLWl8731+U+HA9b2L
   jHr8xB0A0KAh/GjhUMAfX75CSB2ElXEHNS8mvzh8t8MEE974qKZ34eo31
   M4jb2Ys28tqdr+yrL0pFcox8oV+nuEs03O+64PSksvyugV8zVTBHQJUBz
   pOLVK2uAP67TKi9Rafbl0dk/uJHERczj2r6KpKvli30hzQErxXnftlVQU
   uF/KwYoYjOXmNszbzA1u86AHMk8xmdw/JJPIbXn4ltk5wbjv8elhO8CnD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443066546"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="443066546"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 17:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071750594"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="1071750594"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Sep 2023 17:17:32 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdJky-0000wV-0M;
	Tue, 05 Sep 2023 00:17:26 +0000
Date: Tue, 5 Sep 2023 08:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 417/27491]
 block/keyslot-manager.o: warning: objtool: keyslot_manager_put_slot()+0x1ec:
 unreachable instruction
Message-ID: <202309050828.1y11cJeZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   801e39db3fa9d7c57c56bc388e1a801200f38b54
commit: aac6c3decdf94fb2236fff884a69797855317d04 [417/27491] FROMLIST: block: Keyslot Manager for Inline Encryption
config: x86_64-randconfig-076-20230905 (https://download.01.org/0day-ci/archive/20230905/202309050828.1y11cJeZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050828.1y11cJeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050828.1y11cJeZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/keyslot-manager.o: warning: objtool: keyslot_manager_put_slot()+0x1ec: unreachable instruction


objdump-func vmlinux.o keyslot_manager_put_slot:
0000 0000000000cd7047 <keyslot_manager_put_slot>:
0000   cd7047:	55                   	push   %rbp
0001   cd7048:	41 57                	push   %r15
0003   cd704a:	41 56                	push   %r14
0005   cd704c:	41 55                	push   %r13
0007   cd704e:	41 54                	push   %r12
0009   cd7050:	53                   	push   %rbx
000a   cd7051:	48 83 ec 28          	sub    $0x28,%rsp
000e   cd7055:	89 f5                	mov    %esi,%ebp
0010   cd7057:	48 89 fb             	mov    %rdi,%rbx
0013   cd705a:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001c   cd7063:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0021   cd7068:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
002b   cd7072:	48 89 f8             	mov    %rdi,%rax
002e   cd7075:	48 c1 e8 03          	shr    $0x3,%rax
0032   cd7079:	8a 04 08             	mov    (%rax,%rcx,1),%al
0035   cd707c:	84 c0                	test   %al,%al
0037   cd707e:	0f 85 c1 01 00 00    	jne    cd7245 <keyslot_manager_put_slot+0x1fe>
003d   cd7084:	39 2b                	cmp    %ebp,(%rbx)
003f   cd7086:	0f 86 a5 01 00 00    	jbe    cd7231 <keyslot_manager_put_slot+0x1ea>
0045   cd708c:	89 e8                	mov    %ebp,%eax
0047   cd708e:	48 8d 2c 40          	lea    (%rax,%rax,2),%rbp
004b   cd7092:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
004f   cd7096:	48 81 c7 40 01 00 00 	add    $0x140,%rdi
0056   cd709d:	4c 8d b3 08 01 00 00 	lea    0x108(%rbx),%r14
005d   cd70a4:	4c 8d 7c 24 18       	lea    0x18(%rsp),%r15
0062   cd70a9:	4c 89 f6             	mov    %r14,%rsi
0065   cd70ac:	4c 89 fa             	mov    %r15,%rdx
0068   cd70af:	e8 00 00 00 00       	call   cd70b4 <keyslot_manager_put_slot+0x6d>	cd70b0: R_X86_64_PLT32	_atomic_dec_and_lock_irqsave-0x4
006d   cd70b4:	85 c0                	test   %eax,%eax
006f   cd70b6:	0f 84 56 01 00 00    	je     cd7212 <keyslot_manager_put_slot+0x1cb>
0075   cd70bc:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
007a   cd70c1:	48 8d 04 eb          	lea    (%rbx,%rbp,8),%rax
007e   cd70c5:	48 05 48 01 00 00    	add    $0x148,%rax
0084   cd70cb:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0089   cd70d0:	48 8d 83 f8 00 00 00 	lea    0xf8(%rbx),%rax
0090   cd70d7:	48 89 04 24          	mov    %rax,(%rsp)
0094   cd70db:	4c 8d a3 00 01 00 00 	lea    0x100(%rbx),%r12
009b   cd70e2:	4d 89 e6             	mov    %r12,%r14
009e   cd70e5:	49 c1 ee 03          	shr    $0x3,%r14
00a2   cd70e9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00ac   cd70f3:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
00b1   cd70f8:	74 08                	je     cd7102 <keyslot_manager_put_slot+0xbb>
00b3   cd70fa:	4c 89 e7             	mov    %r12,%rdi
00b6   cd70fd:	e8 00 00 00 00       	call   cd7102 <keyslot_manager_put_slot+0xbb>	cd70fe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00bb   cd7102:	4d 8b 2c 24          	mov    (%r12),%r13
00bf   cd7106:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
00c4   cd710b:	4c 89 ee             	mov    %r13,%rsi
00c7   cd710e:	48 8b 14 24          	mov    (%rsp),%rdx
00cb   cd7112:	e8 00 00 00 00       	call   cd7117 <keyslot_manager_put_slot+0xd0>	cd7113: R_X86_64_PLT32	__list_add_valid-0x4
00d0   cd7117:	84 c0                	test   %al,%al
00d2   cd7119:	0f 84 99 00 00 00    	je     cd71b8 <keyslot_manager_put_slot+0x171>
00d8   cd711f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00e2   cd7129:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
00e7   cd712e:	74 08                	je     cd7138 <keyslot_manager_put_slot+0xf1>
00e9   cd7130:	4c 89 e7             	mov    %r12,%rdi
00ec   cd7133:	e8 00 00 00 00       	call   cd7138 <keyslot_manager_put_slot+0xf1>	cd7134: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
00f1   cd7138:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
00f6   cd713d:	49 89 04 24          	mov    %rax,(%r12)
00fa   cd7141:	49 89 c4             	mov    %rax,%r12
00fd   cd7144:	48 c1 e8 03          	shr    $0x3,%rax
0101   cd7148:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
010b   cd7152:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
010f   cd7156:	74 08                	je     cd7160 <keyslot_manager_put_slot+0x119>
0111   cd7158:	4c 89 e7             	mov    %r12,%rdi
0114   cd715b:	e8 00 00 00 00       	call   cd7160 <keyslot_manager_put_slot+0x119>	cd715c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0119   cd7160:	48 8b 04 24          	mov    (%rsp),%rax
011d   cd7164:	49 89 04 24          	mov    %rax,(%r12)
0121   cd7168:	4c 8d 34 eb          	lea    (%rbx,%rbp,8),%r14
0125   cd716c:	49 81 c6 50 01 00 00 	add    $0x150,%r14
012c   cd7173:	4c 89 f0             	mov    %r14,%rax
012f   cd7176:	48 c1 e8 03          	shr    $0x3,%rax
0133   cd717a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
013d   cd7184:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0141   cd7188:	74 08                	je     cd7192 <keyslot_manager_put_slot+0x14b>
0143   cd718a:	4c 89 f7             	mov    %r14,%rdi
0146   cd718d:	e8 00 00 00 00       	call   cd7192 <keyslot_manager_put_slot+0x14b>	cd718e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
014b   cd7192:	4d 89 2e             	mov    %r13,(%r14)
014e   cd7195:	4c 89 e8             	mov    %r13,%rax
0151   cd7198:	48 c1 e8 03          	shr    $0x3,%rax
0155   cd719c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
015f   cd71a6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0163   cd71aa:	74 08                	je     cd71b4 <keyslot_manager_put_slot+0x16d>
0165   cd71ac:	4c 89 ef             	mov    %r13,%rdi
0168   cd71af:	e8 00 00 00 00       	call   cd71b4 <keyslot_manager_put_slot+0x16d>	cd71b0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
016d   cd71b4:	4d 89 65 00          	mov    %r12,0x0(%r13)
0171   cd71b8:	49 c1 ef 03          	shr    $0x3,%r15
0175   cd71bc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
017f   cd71c6:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
0184   cd71cb:	74 0a                	je     cd71d7 <keyslot_manager_put_slot+0x190>
0186   cd71cd:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
018b   cd71d2:	e8 00 00 00 00       	call   cd71d7 <keyslot_manager_put_slot+0x190>	cd71d3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0190   cd71d7:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
0195   cd71dc:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
019a   cd71e1:	e8 00 00 00 00       	call   cd71e6 <keyslot_manager_put_slot+0x19f>	cd71e2: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
019f   cd71e6:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
01a3   cd71ea:	be 04 00 00 00       	mov    $0x4,%esi
01a8   cd71ef:	e8 00 00 00 00       	call   cd71f4 <keyslot_manager_put_slot+0x1ad>	cd71f0: R_X86_64_PLT32	__kasan_check_write-0x4
01ad   cd71f4:	ff 43 04             	incl   0x4(%rbx)
01b0   cd71f7:	48 81 c3 b0 00 00 00 	add    $0xb0,%rbx
01b7   cd71fe:	48 89 df             	mov    %rbx,%rdi
01ba   cd7201:	be 03 00 00 00       	mov    $0x3,%esi
01bf   cd7206:	ba 01 00 00 00       	mov    $0x1,%edx
01c4   cd720b:	31 c9                	xor    %ecx,%ecx
01c6   cd720d:	e8 00 00 00 00       	call   cd7212 <keyslot_manager_put_slot+0x1cb>	cd720e: R_X86_64_PLT32	__wake_up-0x4
01cb   cd7212:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
01d4   cd721b:	48 3b 44 24 20       	cmp    0x20(%rsp),%rax
01d9   cd7220:	75 40                	jne    cd7262 <keyslot_manager_put_slot+0x21b>
01db   cd7222:	48 83 c4 28          	add    $0x28,%rsp
01df   cd7226:	5b                   	pop    %rbx
01e0   cd7227:	41 5c                	pop    %r12
01e2   cd7229:	41 5d                	pop    %r13
01e4   cd722b:	41 5e                	pop    %r14
01e6   cd722d:	41 5f                	pop    %r15
01e8   cd722f:	5d                   	pop    %rbp
01e9   cd7230:	c3                   	ret
01ea   cd7231:	0f 0b                	ud2
01ec   cd7233:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
01f5   cd723c:	48 3b 44 24 20       	cmp    0x20(%rsp),%rax
01fa   cd7241:	75 1f                	jne    cd7262 <keyslot_manager_put_slot+0x21b>
01fc   cd7243:	eb dd                	jmp    cd7222 <keyslot_manager_put_slot+0x1db>
01fe   cd7245:	89 d9                	mov    %ebx,%ecx
0200   cd7247:	80 e1 07             	and    $0x7,%cl
0203   cd724a:	80 c1 03             	add    $0x3,%cl
0206   cd724d:	38 c1                	cmp    %al,%cl
0208   cd724f:	0f 8c 2f fe ff ff    	jl     cd7084 <keyslot_manager_put_slot+0x3d>
020e   cd7255:	48 89 df             	mov    %rbx,%rdi
0211   cd7258:	e8 00 00 00 00       	call   cd725d <keyslot_manager_put_slot+0x216>	cd7259: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0216   cd725d:	e9 22 fe ff ff       	jmp    cd7084 <keyslot_manager_put_slot+0x3d>
021b   cd7262:	e8 00 00 00 00       	call   cd7267 <keyslot_manager_crypto_mode_supported>	cd7263: R_X86_64_PLT32	__stack_chk_fail-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
