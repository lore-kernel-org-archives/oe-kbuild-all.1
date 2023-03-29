Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B687B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680087649; x=1711623649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFCbgH7IF2/EBklNJcqz1wio/RuVuWFzL9vxBAtBew0=;
  b=lRMaHqhL1Wy68D6wjI+LcfuEAEBOCZrEQguUQM62trtyMaflKDboHyXR
   WxzBa5BfiArQ3jQLnzG6Ds2r0SXdzNiLjkmftDCLqJsR677qCW5UmgDEE
   K/0X6bY7Gi2+vaBV3bXRtIqHOq1wHh9VxiMxeiq8T7gSBraPCt6LO4nd8
   CgbxNkbloiPLn12hCF84Gz+EH6eaHtqtwnUqE9OtlddbiUvIRliGpAG+N
   2dWGgTfH6WyGAfJZoz29em3Ag1qyxq0UkobmdvGjsNHmIEw2mZiaZAnlp
   xGJD7le44/3jLt8ple1wnK6Gv/3/iHqhGjWqfeyqIOq1x0nX52OcOKm/5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320497999"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="320497999"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 04:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="795190038"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="795190038"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2023 04:00:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phTXq-000JSQ-2U;
	Wed, 29 Mar 2023 11:00:46 +0000
Date: Wed, 29 Mar 2023 19:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-lts 872/1774] vmlinux.o: warning: objtool:
 relocate_restore_code+0x3c: relocation to !ENDBR: get_option+0x68
Message-ID: <202303291850.2n195cK1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-lts
head:   c1c1238e584a25aff184f9c4e37e9d8d4fcd45d2
commit: b78434f6eee0e6d7da3e301cfc33184a98edb08b [872/1774] cpuidle: lib/bug: Disable rcu_is_watching() during WARN/BUG
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230329/202303291850.2n195cK1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b78434f6eee0e6d7da3e301cfc33184a98edb08b
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-lts
        git checkout b78434f6eee0e6d7da3e301cfc33184a98edb08b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291850.2n195cK1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: relocate_restore_code+0x3c: relocation to !ENDBR: get_option+0x68


objdump-func vmlinux.o relocate_restore_code:
0000 0000000000d2a340 <relocate_restore_code>:
0000   d2a340:	f3 0f 1e fa          	endbr64
0004   d2a344:	e8 00 00 00 00       	call   d2a349 <relocate_restore_code+0x9>	d2a345: R_X86_64_PLT32	__fentry__-0x4
0009   d2a349:	bf 20 0a 00 00       	mov    $0xa20,%edi
000e   d2a34e:	e8 00 00 00 00       	call   d2a353 <relocate_restore_code+0x13>	d2a34f: R_X86_64_PLT32	get_safe_page-0x4
0013   d2a353:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # d2a35a <relocate_restore_code+0x1a>	d2a356: R_X86_64_PC32	relocated_restore_code-0x4
001a   d2a35a:	48 85 c0             	test   %rax,%rax
001d   d2a35d:	0f 84 9e 01 00 00    	je     d2a501 <relocate_restore_code+0x1c1>
0023   d2a363:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # d2a36a <relocate_restore_code+0x2a>	d2a366: R_X86_64_PC32	core_restore_code-0x4
002a   d2a36a:	48 8d 78 08          	lea    0x8(%rax),%rdi
002e   d2a36e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	d2a371: R_X86_64_32S	core_restore_code
0035   d2a375:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
0039   d2a379:	48 89 10             	mov    %rdx,(%rax)
003c   d2a37c:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # d2a383 <relocate_restore_code+0x43>	d2a37f: R_X86_64_PC32	core_restore_code+0xff4
0043   d2a383:	48 89 90 f8 0f 00 00 	mov    %rdx,0xff8(%rax)
004a   d2a38a:	48 29 f8             	sub    %rdi,%rax
004d   d2a38d:	48 29 c6             	sub    %rax,%rsi
0050   d2a390:	05 00 10 00 00       	add    $0x1000,%eax
0055   d2a395:	c1 e8 03             	shr    $0x3,%eax
0058   d2a398:	89 c1                	mov    %eax,%ecx
005a   d2a39a:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
005d   d2a39d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # d2a3a4 <relocate_restore_code+0x64>	d2a3a0: R_X86_64_PC32	relocated_restore_code-0x4
0064   d2a3a4:	0f 20 df             	mov    %cr3,%rdi
0067   d2a3a7:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # d2a3ad <relocate_restore_code+0x6d>	d2a3a9: R_X86_64_PC32	pgdir_shift-0x4
006d   d2a3ad:	48 89 c2             	mov    %rax,%rdx
0070   d2a3b0:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # d2a3b7 <relocate_restore_code+0x77>	d2a3b3: R_X86_64_PC32	page_offset_base-0x4
0077   d2a3b7:	48 d3 ea             	shr    %cl,%rdx
007a   d2a3ba:	48 b9 00 f0 ff ff ff ff ff 7f 	movabs $0x7ffffffffffff000,%rcx
0084   d2a3c4:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
008a   d2a3ca:	48 21 cf             	and    %rcx,%rdi
008d   d2a3cd:	48 8d 14 d6          	lea    (%rsi,%rdx,8),%rdx
0091   d2a3d1:	48 01 fa             	add    %rdi,%rdx
0094   d2a3d4:	e9 00 00 00 00       	jmp    d2a3d9 <relocate_restore_code+0x99>	d2a3d5: R_X86_64_PC32	.altinstr_aux+0x2bca
0099   d2a3d9:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # d2a3df <relocate_restore_code+0x9f>	d2a3db: R_X86_64_PC32	ptrs_per_p4d-0x4
009f   d2a3df:	48 89 c7             	mov    %rax,%rdi
00a2   d2a3e2:	4c 8b 05 00 00 00 00 	mov    0x0(%rip),%r8        # d2a3e9 <relocate_restore_code+0xa9>	d2a3e5: R_X86_64_PC32	physical_mask-0x4
00a9   d2a3e9:	48 c1 ef 27          	shr    $0x27,%rdi
00ad   d2a3ed:	83 e9 01             	sub    $0x1,%ecx
00b0   d2a3f0:	48 21 f9             	and    %rdi,%rcx
00b3   d2a3f3:	48 8b 3a             	mov    (%rdx),%rdi
00b6   d2a3f6:	48 8d 0c ce          	lea    (%rsi,%rcx,8),%rcx
00ba   d2a3fa:	4c 21 c7             	and    %r8,%rdi
00bd   d2a3fd:	48 89 fa             	mov    %rdi,%rdx
00c0   d2a400:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
00c7   d2a407:	48 01 ca             	add    %rcx,%rdx
00ca   d2a40a:	eb 07                	jmp    d2a413 <relocate_restore_code+0xd3>
00cc   d2a40c:	4c 8b 05 00 00 00 00 	mov    0x0(%rip),%r8        # d2a413 <relocate_restore_code+0xd3>	d2a40f: R_X86_64_PC32	physical_mask-0x4
00d3   d2a413:	48 8b 0a             	mov    (%rdx),%rcx
00d6   d2a416:	4c 89 c7             	mov    %r8,%rdi
00d9   d2a419:	48 89 c2             	mov    %rax,%rdx
00dc   d2a41c:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
00e3   d2a423:	48 c1 ea 1b          	shr    $0x1b,%rdx
00e7   d2a427:	48 21 f9             	and    %rdi,%rcx
00ea   d2a42a:	81 e2 f8 0f 00 00    	and    $0xff8,%edx
00f0   d2a430:	48 01 f1             	add    %rsi,%rcx
00f3   d2a433:	48 01 d1             	add    %rdx,%rcx
00f6   d2a436:	48 8b 11             	mov    (%rcx),%rdx
00f9   d2a439:	49 89 d1             	mov    %rdx,%r9
00fc   d2a43c:	41 81 e1 81 00 00 00 	and    $0x81,%r9d
0103   d2a443:	49 81 f9 81 00 00 00 	cmp    $0x81,%r9
010a   d2a44a:	0f 84 9d 00 00 00    	je     d2a4ed <relocate_restore_code+0x1ad>
0110   d2a450:	4c 89 c1             	mov    %r8,%rcx
0113   d2a453:	48 81 e1 00 00 00 c0 	and    $0xffffffffc0000000,%rcx
011a   d2a45a:	f6 c2 80             	test   $0x80,%dl
011d   d2a45d:	48 0f 44 cf          	cmove  %rdi,%rcx
0121   d2a461:	48 21 ca             	and    %rcx,%rdx
0124   d2a464:	48 89 c1             	mov    %rax,%rcx
0127   d2a467:	48 c1 e9 12          	shr    $0x12,%rcx
012b   d2a46b:	48 01 f2             	add    %rsi,%rdx
012e   d2a46e:	81 e1 f8 0f 00 00    	and    $0xff8,%ecx
0134   d2a474:	48 01 ca             	add    %rcx,%rdx
0137   d2a477:	48 8b 0a             	mov    (%rdx),%rcx
013a   d2a47a:	f6 c1 80             	test   $0x80,%cl
013d   d2a47d:	74 3d                	je     d2a4bc <relocate_restore_code+0x17c>
013f   d2a47f:	4c 89 c7             	mov    %r8,%rdi
0142   d2a482:	48 c1 e8 09          	shr    $0x9,%rax
0146   d2a486:	48 81 e7 00 00 e0 ff 	and    $0xffffffffffe00000,%rdi
014d   d2a48d:	25 f8 0f 00 00       	and    $0xff8,%eax
0152   d2a492:	f6 c1 80             	test   $0x80,%cl
0155   d2a495:	75 42                	jne    d2a4d9 <relocate_restore_code+0x199>
0157   d2a497:	48 ba ff ff ff ff ff ff ff 7f 	movabs $0x7fffffffffffffff,%rdx
0161   d2a4a1:	48 01 f0             	add    %rsi,%rax
0164   d2a4a4:	48 21 f9             	and    %rdi,%rcx
0167   d2a4a7:	48 01 c8             	add    %rcx,%rax
016a   d2a4aa:	48 23 10             	and    (%rax),%rdx
016d   d2a4ad:	48 89 10             	mov    %rdx,(%rax)
0170   d2a4b0:	e8 00 00 00 00       	call   d2a4b5 <relocate_restore_code+0x175>	d2a4b1: R_X86_64_PLT32	__flush_tlb_all-0x4
0175   d2a4b5:	31 c0                	xor    %eax,%eax
0177   d2a4b7:	e9 00 00 00 00       	jmp    d2a4bc <relocate_restore_code+0x17c>	d2a4b8: R_X86_64_PLT32	__x86_return_thunk-0x4
017c   d2a4bc:	49 89 f8             	mov    %rdi,%r8
017f   d2a4bf:	49 f7 d0             	not    %r8
0182   d2a4c2:	49 21 c8             	and    %rcx,%r8
0185   d2a4c5:	41 81 e0 80 00 00 00 	and    $0x80,%r8d
018c   d2a4cc:	75 0b                	jne    d2a4d9 <relocate_restore_code+0x199>
018e   d2a4ce:	48 c1 e8 09          	shr    $0x9,%rax
0192   d2a4d2:	25 f8 0f 00 00       	and    $0xff8,%eax
0197   d2a4d7:	eb be                	jmp    d2a497 <relocate_restore_code+0x157>
0199   d2a4d9:	48 0f ba f1 3f       	btr    $0x3f,%rcx
019e   d2a4de:	48 89 0a             	mov    %rcx,(%rdx)
01a1   d2a4e1:	e8 00 00 00 00       	call   d2a4e6 <relocate_restore_code+0x1a6>	d2a4e2: R_X86_64_PLT32	__flush_tlb_all-0x4
01a6   d2a4e6:	31 c0                	xor    %eax,%eax
01a8   d2a4e8:	e9 00 00 00 00       	jmp    d2a4ed <relocate_restore_code+0x1ad>	d2a4e9: R_X86_64_PLT32	__x86_return_thunk-0x4
01ad   d2a4ed:	48 0f ba f2 3f       	btr    $0x3f,%rdx
01b2   d2a4f2:	48 89 11             	mov    %rdx,(%rcx)
01b5   d2a4f5:	e8 00 00 00 00       	call   d2a4fa <relocate_restore_code+0x1ba>	d2a4f6: R_X86_64_PLT32	__flush_tlb_all-0x4
01ba   d2a4fa:	31 c0                	xor    %eax,%eax
01bc   d2a4fc:	e9 00 00 00 00       	jmp    d2a501 <relocate_restore_code+0x1c1>	d2a4fd: R_X86_64_PLT32	__x86_return_thunk-0x4
01c1   d2a501:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
01c6   d2a506:	e9 00 00 00 00       	jmp    d2a50b <relocate_restore_code+0x1cb>	d2a507: R_X86_64_PLT32	__x86_return_thunk-0x4
01cb   d2a50b:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01d6   d2a516:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01e1   d2a521:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01ec   d2a52c:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01f7   d2a537:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
