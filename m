Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0394FA490
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Nov 2022 22:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667945468; x=1699481468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ile0QqYTTCSjlFCuGGMnNSvEbjU2ommuRYiKjRIfnMM=;
  b=kvdaZIfPILiKmAKUA7/h8qqum5sQBvpleiqv8TJmbVJgZ03p4Nv/3qkN
   XThcMnl+s2VqxPM5UrAmn1W6HNzISg6gggSFvhOgjXx9wr52tNm1YCNbO
   NkIkp1RCNJPrzwHIitrdVJU9BOoC/prqL3LBuQU7Xld217z8EdWQikNdg
   ICjNtVnug5Z3H8PAgkBN8vdcDxvfXVzLYt/sHc1cs+4eniG7vja1FCDQH
   qCvOosuP6/xjwMKz9yHMlj0wNXJFBTu7O6AxWB4kakUuhd6iYJSQNn2do
   HFDB7uHymd7EixkL5rdgczXJj3gOEw2rsYU48wrGBYxAA6V1Jd4JlPFd/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="291209819"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="291209819"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 14:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="705458934"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="705458934"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Nov 2022 14:11:03 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osWoA-0000fI-1P;
	Tue, 08 Nov 2022 22:11:02 +0000
Date: Wed, 9 Nov 2022 06:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Anand Jain <anand.jain@oracle.com>
Subject: [linux-next:master 4575/6121] vmlinux.o: warning: objtool:
 __btrfs_map_block+0x1e1f: unreachable instruction
Message-ID: <202211090634.RyFKK0WS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5vXlhXreqN7gDr/c"
Content-Disposition: inline


--5vXlhXreqN7gDr/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6fc3fddade7a194bd141a49f2689e50f796ef46
commit: cd75249f58b88a927bc2f9d5135393961af4777c [4575/6121] btrfs: move assert helpers out of ctree.h
config: x86_64-randconfig-a006
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cd75249f58b88a927bc2f9d5135393961af4777c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cd75249f58b88a927bc2f9d5135393961af4777c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __btrfs_map_block+0x1e1f: unreachable instruction


objdump-func vmlinux.o __btrfs_map_block:
0000 0000000000e43f93 <__btrfs_map_block>:
0000   e43f93:	e8 00 00 00 00       	call   e43f98 <__btrfs_map_block+0x5>	e43f94: R_X86_64_PLT32	__fentry__-0x4
0005   e43f98:	55                   	push   %rbp
0006   e43f99:	48 89 e5             	mov    %rsp,%rbp
0009   e43f9c:	41 57                	push   %r15
000b   e43f9e:	41 56                	push   %r14
000d   e43fa0:	41 55                	push   %r13
000f   e43fa2:	41 54                	push   %r12
0011   e43fa4:	53                   	push   %rbx
0012   e43fa5:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0016   e43fa9:	48 81 ec 10 02 00 00 	sub    $0x210,%rsp
001d   e43fb0:	48 89 bc 24 e8 00 00 00 	mov    %rdi,0xe8(%rsp)
0025   e43fb8:	89 b4 24 e0 00 00 00 	mov    %esi,0xe0(%rsp)
002c   e43fbf:	48 89 94 24 b8 00 00 00 	mov    %rdx,0xb8(%rsp)
0034   e43fc7:	48 89 cb             	mov    %rcx,%rbx
0037   e43fca:	4c 89 84 24 b0 00 00 00 	mov    %r8,0xb0(%rsp)
003f   e43fd2:	4d 89 ce             	mov    %r9,%r14
0042   e43fd5:	4c 8b 6d 10          	mov    0x10(%rbp),%r13
0046   e43fd9:	48 8d 84 24 f0 00 00 00 	lea    0xf0(%rsp),%rax
004e   e43fe1:	48 c7 84 24 f0 00 00 00 b3 8a b5 41 	movq   $0x41b58ab3,0xf0(%rsp)
005a   e43fed:	48 c7 84 24 f8 00 00 00 00 00 00 00 	movq   $0x0,0xf8(%rsp)	e43ff5: R_X86_64_32S	.rodata.str1.8+0x346b8
0066   e43ff9:	48 c7 84 24 00 01 00 00 00 00 00 00 	movq   $0x0,0x100(%rsp)	e44001: R_X86_64_32S	.text+0xe43f93
0072   e44005:	48 c1 e8 03          	shr    $0x3,%rax
0076   e44009:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
007e   e44011:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0088   e4401b:	48 01 d0             	add    %rdx,%rax
008b   e4401e:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
0091   e44024:	c7 40 04 f1 f1 04 f2 	movl   $0xf204f1f1,0x4(%rax)
0098   e4402b:	c7 40 08 04 f2 00 f2 	movl   $0xf200f204,0x8(%rax)
009f   e44032:	c7 40 0c f2 f2 00 f2 	movl   $0xf200f2f2,0xc(%rax)
00a6   e44039:	c7 40 10 f2 f2 00 f2 	movl   $0xf200f2f2,0x10(%rax)
00ad   e44040:	c7 40 14 f2 f2 00 00 	movl   $0xf2f2,0x14(%rax)
00b4   e44047:	c7 40 18 00 00 00 f3 	movl   $0xf3000000,0x18(%rax)
00bb   e4404e:	c7 40 1c f3 f3 f3 f3 	movl   $0xf3f3f3f3,0x1c(%rax)
00c2   e44055:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
00cb   e4405e:	48 89 84 24 08 02 00 00 	mov    %rax,0x208(%rsp)
00d3   e44066:	31 c0                	xor    %eax,%eax
00d5   e44068:	4d 85 ed             	test   %r13,%r13
00d8   e4406b:	0f 84 78 09 00 00    	je     e449e9 <__btrfs_map_block+0xa56>
00de   e44071:	4c 89 e8             	mov    %r13,%rax
00e1   e44074:	48 c1 e8 03          	shr    $0x3,%rax
00e5   e44078:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
00e9   e4407c:	4c 89 e8             	mov    %r13,%rax
00ec   e4407f:	83 e0 07             	and    $0x7,%eax
00ef   e44082:	83 c0 03             	add    $0x3,%eax
00f2   e44085:	38 d0                	cmp    %dl,%al
00f4   e44087:	7c 08                	jl     e44091 <__btrfs_map_block+0xfe>
00f6   e44089:	84 d2                	test   %dl,%dl
00f8   e4408b:	0f 85 fc 19 00 00    	jne    e45a8d <__btrfs_map_block+0x1afa>
00fe   e44091:	41 8b 45 00          	mov    0x0(%r13),%eax
0102   e44095:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
0109   e4409c:	c7 84 24 30 01 00 00 00 00 00 00 	movl   $0x0,0x130(%rsp)
0114   e440a7:	48 c7 84 24 40 01 00 00 00 00 00 00 	movq   $0x0,0x140(%rsp)
0120   e440b3:	48 83 bc 24 b0 00 00 00 00 	cmpq   $0x0,0xb0(%rsp)
0129   e440bc:	0f 84 00 00 00 00    	je     e440c2 <__btrfs_map_block+0x12f>	e440be: R_X86_64_PC32	.text.unlikely+0x80325
012f   e440c2:	83 bc 24 e0 00 00 00 02 	cmpl   $0x2,0xe0(%rsp)
0137   e440ca:	0f 84 00 00 00 00    	je     e440d0 <__btrfs_map_block+0x13d>	e440cc: R_X86_64_PC32	.text.unlikely+0x80342
013d   e440d0:	48 89 da             	mov    %rbx,%rdx
0140   e440d3:	48 c1 ea 03          	shr    $0x3,%rdx
0144   e440d7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
014e   e440e1:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0152   e440e5:	0f 85 e2 1f 00 00    	jne    e460cd <__btrfs_map_block+0x213a>
0158   e440eb:	48 8b 13             	mov    (%rbx),%rdx
015b   e440ee:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
0163   e440f6:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
016b   e440fe:	e8 00 00 00 00       	call   e44103 <__btrfs_map_block+0x170>	e440ff: R_X86_64_PLT32	btrfs_get_chunk_map-0x4
0170   e44103:	48 89 84 24 c8 00 00 00 	mov    %rax,0xc8(%rsp)
0178   e4410b:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
017e   e44111:	0f 87 00 00 00 00    	ja     e44117 <__btrfs_map_block+0x184>	e44113: R_X86_64_PC32	.text.unlikely+0x8035f
0184   e44117:	4c 8d 84 24 a0 01 00 00 	lea    0x1a0(%rsp),%r8
018c   e4411f:	48 8b 8c 24 b8 00 00 00 	mov    0xb8(%rsp),%rcx
0194   e44127:	8b 94 24 e0 00 00 00 	mov    0xe0(%rsp),%edx
019b   e4412e:	4c 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%r15
01a3   e44136:	4c 89 fe             	mov    %r15,%rsi
01a6   e44139:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
01ae   e44141:	e8 00 00 00 00       	call   e44146 <__btrfs_map_block+0x1b3>	e44142: R_X86_64_PLT32	btrfs_get_io_geometry-0x4
01b3   e44146:	89 84 24 a0 00 00 00 	mov    %eax,0xa0(%rsp)
01ba   e4414d:	85 c0                	test   %eax,%eax
01bc   e4414f:	0f 88 36 08 00 00    	js     e4498b <__btrfs_map_block+0x9f8>
01c2   e44155:	49 8d 7f 70          	lea    0x70(%r15),%rdi
01c6   e44159:	48 89 fa             	mov    %rdi,%rdx
01c9   e4415c:	48 c1 ea 03          	shr    $0x3,%rdx
01cd   e44160:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01d7   e4416a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
01db   e4416e:	0f 85 99 25 00 00    	jne    e4670d <__btrfs_map_block+0x277a>
01e1   e44174:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
01e9   e4417c:	4c 8b 60 70          	mov    0x70(%rax),%r12
01ed   e44180:	4c 8b bc 24 a0 01 00 00 	mov    0x1a0(%rsp),%r15
01f5   e44188:	48 89 da             	mov    %rbx,%rdx
01f8   e4418b:	48 c1 ea 03          	shr    $0x3,%rdx
01fc   e4418f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0206   e44199:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
020a   e4419d:	0f 85 30 25 00 00    	jne    e466d3 <__btrfs_map_block+0x2740>
0210   e441a3:	4c 89 3b             	mov    %r15,(%rbx)
0213   e441a6:	8b 84 24 b0 01 00 00 	mov    0x1b0(%rsp),%eax
021a   e441ad:	89 44 24 58          	mov    %eax,0x58(%rsp)
021e   e441b1:	4c 8b 9c 24 b8 01 00 00 	mov    0x1b8(%rsp),%r11
0226   e441b9:	44 8b 94 24 b4 01 00 00 	mov    0x1b4(%rsp),%r10d
022e   e441c1:	48 8b 84 24 c0 01 00 00 	mov    0x1c0(%rsp),%rax
0236   e441c9:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
023b   e441ce:	49 8d 4c 24 14       	lea    0x14(%r12),%rcx
0240   e441d3:	48 89 8c 24 88 00 00 00 	mov    %rcx,0x88(%rsp)
0248   e441db:	48 89 ca             	mov    %rcx,%rdx
024b   e441de:	48 c1 ea 03          	shr    $0x3,%rdx
024f   e441e2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0259   e441ec:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
025d   e441f0:	48 89 c8             	mov    %rcx,%rax
0260   e441f3:	83 e0 07             	and    $0x7,%eax
0263   e441f6:	83 c0 03             	add    $0x3,%eax
0266   e441f9:	38 d0                	cmp    %dl,%al
0268   e441fb:	7c 08                	jl     e44205 <__btrfs_map_block+0x272>
026a   e441fd:	84 d2                	test   %dl,%dl
026c   e441ff:	0f 85 d7 23 00 00    	jne    e465dc <__btrfs_map_block+0x2649>
0272   e44205:	45 8b 7c 24 14       	mov    0x14(%r12),%r15d
0277   e4420a:	4c 89 e2             	mov    %r12,%rdx
027a   e4420d:	48 c1 ea 03          	shr    $0x3,%rdx
027e   e44211:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0288   e4421b:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
028c   e4421f:	0f 85 bb 24 00 00    	jne    e466e0 <__btrfs_map_block+0x274d>
0292   e44225:	49 8b 04 24          	mov    (%r12),%rax
0296   e44229:	25 f8 07 00 00       	and    $0x7f8,%eax
029b   e4422e:	0f 84 13 0a 00 00    	je     e44c47 <__btrfs_map_block+0xcb4>
02a1   e44234:	48 c1 e8 02          	shr    $0x2,%rax
02a5   e44238:	ba ff ff ff ff       	mov    $0xffffffff,%edx
02aa   e4423d:	48 0f bd d0          	bsr    %rax,%rdx
02ae   e44241:	89 d0                	mov    %edx,%eax
02b0   e44243:	48 8b b4 24 e8 00 00 00 	mov    0xe8(%rsp),%rsi
02b8   e4424b:	48 81 c6 c0 1a 00 00 	add    $0x1ac0,%rsi
02bf   e44252:	48 89 b4 24 80 00 00 00 	mov    %rsi,0x80(%rsp)
02c7   e4425a:	89 c2                	mov    %eax,%edx
02c9   e4425c:	83 f8 08             	cmp    $0x8,%eax
02cc   e4425f:	0f 87 f0 23 00 00    	ja     e46655 <__btrfs_map_block+0x26c2>
02d2   e44265:	48 89 d7             	mov    %rdx,%rdi
02d5   e44268:	48 c1 e7 05          	shl    $0x5,%rdi
02d9   e4426c:	48 81 c7 00 00 00 00 	add    $0x0,%rdi	e4426f: R_X86_64_32S	btrfs_raid_array+0x7
02e0   e44273:	48 89 f9             	mov    %rdi,%rcx
02e3   e44276:	48 c1 e9 03          	shr    $0x3,%rcx
02e7   e4427a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02f1   e44284:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
02f5   e44288:	48 89 f9             	mov    %rdi,%rcx
02f8   e4428b:	83 e1 07             	and    $0x7,%ecx
02fb   e4428e:	38 c8                	cmp    %cl,%al
02fd   e44290:	7f 08                	jg     e4429a <__btrfs_map_block+0x307>
02ff   e44292:	84 c0                	test   %al,%al
0301   e44294:	0f 85 ff 23 00 00    	jne    e46699 <__btrfs_map_block+0x2706>
0307   e4429a:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
030f   e442a2:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
0317   e442aa:	48 c1 e2 05          	shl    $0x5,%rdx
031b   e442ae:	0f b6 82 00 00 00 00 	movzbl 0x0(%rdx),%eax	e442b1: R_X86_64_32S	btrfs_raid_array+0x7
0322   e442b5:	41 29 c7             	sub    %eax,%r15d
0325   e442b8:	44 89 7c 24 50       	mov    %r15d,0x50(%rsp)
032a   e442bd:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0332   e442c5:	48 05 b8 1b 00 00    	add    $0x1bb8,%rax
0338   e442cb:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
033d   e442d0:	48 89 c7             	mov    %rax,%rdi
0340   e442d3:	e8 00 00 00 00       	call   e442d8 <__btrfs_map_block+0x345>	e442d4: R_X86_64_PLT32	down_read-0x4
0345   e442d8:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
034d   e442e0:	e8 00 00 00 00       	call   e442e5 <__btrfs_map_block+0x352>	e442e1: R_X86_64_PLT32	btrfs_dev_replace_is_ongoing-0x4
0352   e442e5:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
0359   e442ec:	85 c0                	test   %eax,%eax
035b   e442ee:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
0363   e442f6:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
036b   e442fe:	0f 84 11 10 00 00    	je     e45315 <__btrfs_map_block+0x1382>
0371   e44304:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
0379   e4430c:	48 89 ca             	mov    %rcx,%rdx
037c   e4430f:	48 c1 ea 03          	shr    $0x3,%rdx
0380   e44313:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
038a   e4431d:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
038e   e44321:	48 89 c8             	mov    %rcx,%rax
0391   e44324:	83 e0 07             	and    $0x7,%eax
0394   e44327:	83 c0 03             	add    $0x3,%eax
0397   e4432a:	38 d0                	cmp    %dl,%al
0399   e4432c:	7c 08                	jl     e44336 <__btrfs_map_block+0x3a3>
039b   e4432e:	84 d2                	test   %dl,%dl
039d   e44330:	0f 85 a3 26 00 00    	jne    e469d9 <__btrfs_map_block+0x2a46>
03a3   e44336:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
03a8   e4433b:	41 8d 40 01          	lea    0x1(%r8),%eax
03ac   e4433f:	3b 84 24 c0 00 00 00 	cmp    0xc0(%rsp),%eax
03b3   e44346:	0f 84 2d 0c 00 00    	je     e44f79 <__btrfs_map_block+0xfe6>
03b9   e4434c:	44 39 84 24 c0 00 00 00 	cmp    %r8d,0xc0(%rsp)
03c1   e44354:	7e 0b                	jle    e44361 <__btrfs_map_block+0x3ce>
03c3   e44356:	c7 84 24 c0 00 00 00 00 00 00 00 	movl   $0x0,0xc0(%rsp)
03ce   e44361:	c7 84 24 20 01 00 00 01 00 00 00 	movl   $0x1,0x120(%rsp)
03d9   e4436c:	4c 89 e2             	mov    %r12,%rdx
03dc   e4436f:	48 c1 ea 03          	shr    $0x3,%rdx
03e0   e44373:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03ea   e4437d:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
03ee   e44381:	0f 85 d5 1f 00 00    	jne    e4635c <__btrfs_map_block+0x23c9>
03f4   e44387:	49 8b 04 24          	mov    (%r12),%rax
03f8   e4438b:	48 89 c1             	mov    %rax,%rcx
03fb   e4438e:	83 e1 08             	and    $0x8,%ecx
03fe   e44391:	0f 84 62 06 00 00    	je     e449f9 <__btrfs_map_block+0xa66>
0404   e44397:	44 89 c1             	mov    %r8d,%ecx
0407   e4439a:	4c 89 d8             	mov    %r11,%rax
040a   e4439d:	31 d2                	xor    %edx,%edx
040c   e4439f:	48 f7 f1             	div    %rcx
040f   e443a2:	49 89 c3             	mov    %rax,%r11
0412   e443a5:	8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%eax
0419   e443ac:	83 e0 fd             	and    $0xfffffffd,%eax
041c   e443af:	48 c7 44 24 60 00 00 00 00 	movq   $0x0,0x60(%rsp)
0425   e443b8:	c7 44 24 68 00 00 00 00 	movl   $0x0,0x68(%rsp)
042d   e443c0:	83 f8 01             	cmp    $0x1,%eax
0430   e443c3:	b8 01 00 00 00       	mov    $0x1,%eax
0435   e443c8:	0f 44 84 24 c0 00 00 00 	cmove  0xc0(%rsp),%eax
043d   e443d0:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
0444   e443d7:	41 39 d0             	cmp    %edx,%r8d
0447   e443da:	0f 86 00 00 00 00    	jbe    e443e0 <__btrfs_map_block+0x44d>	e443dc: R_X86_64_PC32	.text.unlikely+0x8037c
044d   e443e0:	8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%ebx
0454   e443e7:	8b 84 24 90 00 00 00 	mov    0x90(%rsp),%eax
045b   e443ee:	85 c0                	test   %eax,%eax
045d   e443f0:	74 62                	je     e44454 <__btrfs_map_block+0x4c1>
045f   e443f2:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0467   e443fa:	4c 8d b8 20 1b 00 00 	lea    0x1b20(%rax),%r15
046e   e44401:	4c 89 f9             	mov    %r15,%rcx
0471   e44404:	48 c1 e9 03          	shr    $0x3,%rcx
0475   e44408:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
047f   e44412:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0483   e44416:	0f 85 8b 21 00 00    	jne    e465a7 <__btrfs_map_block+0x2614>
0489   e4441c:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0491   e44424:	48 83 b8 20 1b 00 00 00 	cmpq   $0x0,0x1b20(%rax)
0499   e4442c:	74 26                	je     e44454 <__btrfs_map_block+0x4c1>
049b   e4442e:	83 bc 24 e0 00 00 00 01 	cmpl   $0x1,0xe0(%rsp)
04a3   e44436:	0f 84 a5 13 00 00    	je     e457e1 <__btrfs_map_block+0x184e>
04a9   e4443c:	83 bc 24 e0 00 00 00 03 	cmpl   $0x3,0xe0(%rsp)
04b1   e44444:	89 9c 24 a8 00 00 00 	mov    %ebx,0xa8(%rsp)
04b8   e4444b:	89 d8                	mov    %ebx,%eax
04ba   e4444d:	75 0e                	jne    e4445d <__btrfs_map_block+0x4ca>
04bc   e4444f:	83 c3 01             	add    $0x1,%ebx
04bf   e44452:	eb 09                	jmp    e4445d <__btrfs_map_block+0x4ca>
04c1   e44454:	89 9c 24 a8 00 00 00 	mov    %ebx,0xa8(%rsp)
04c8   e4445b:	31 c0                	xor    %eax,%eax
04ca   e4445d:	4d 85 f6             	test   %r14,%r14
04cd   e44460:	74 09                	je     e4446b <__btrfs_map_block+0x4d8>
04cf   e44462:	83 fb 01             	cmp    $0x1,%ebx
04d2   e44465:	0f 84 00 0f 00 00    	je     e4536b <__btrfs_map_block+0x13d8>
04d8   e4446b:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
04dd   e44470:	89 54 24 78          	mov    %edx,0x78(%rsp)
04e1   e44474:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
04e9   e4447c:	4c 63 eb             	movslq %ebx,%r13
04ec   e4447f:	4c 63 f0             	movslq %eax,%r14
04ef   e44482:	4b 8d 44 6d 00       	lea    0x0(%r13,%r13,2),%rax
04f4   e44487:	49 8d 7c 46 12       	lea    0x12(%r14,%rax,2),%rdi
04f9   e4448c:	48 c1 e7 02          	shl    $0x2,%rdi
04fd   e44490:	be 40 8d 00 00       	mov    $0x8d40,%esi
0502   e44495:	e8 00 00 00 00       	call   e4449a <__btrfs_map_block+0x507>	e44496: R_X86_64_PLT32	__kmalloc-0x4
0507   e4449a:	48 89 c3             	mov    %rax,%rbx
050a   e4449d:	be 04 00 00 00       	mov    $0x4,%esi
050f   e444a2:	48 89 c7             	mov    %rax,%rdi
0512   e444a5:	e8 00 00 00 00       	call   e444aa <__btrfs_map_block+0x517>	e444a6: R_X86_64_PLT32	__kasan_check_write-0x4
0517   e444aa:	48 89 d9             	mov    %rbx,%rcx
051a   e444ad:	48 c1 e9 03          	shr    $0x3,%rcx
051e   e444b1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0528   e444bb:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
052c   e444bf:	84 c0                	test   %al,%al
052e   e444c1:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
0536   e444c9:	8b 54 24 78          	mov    0x78(%rsp),%edx
053a   e444cd:	4c 8b 5c 24 58       	mov    0x58(%rsp),%r11
053f   e444d2:	74 08                	je     e444dc <__btrfs_map_block+0x549>
0541   e444d4:	3c 03                	cmp    $0x3,%al
0543   e444d6:	0f 8e ad 20 00 00    	jle    e46589 <__btrfs_map_block+0x25f6>
0549   e444dc:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
054f   e444e2:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
0553   e444e6:	48 89 f9             	mov    %rdi,%rcx
0556   e444e9:	48 c1 e9 03          	shr    $0x3,%rcx
055a   e444ed:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0564   e444f7:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0568   e444fb:	0f 85 30 20 00 00    	jne    e46531 <__btrfs_map_block+0x259e>
056e   e44501:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0576   e44509:	48 89 43 08          	mov    %rax,0x8(%rbx)
057a   e4450d:	48 8d 43 48          	lea    0x48(%rbx),%rax
057e   e44511:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
0583   e44516:	49 c1 e5 04          	shl    $0x4,%r13
0587   e4451a:	4e 8d 6c 2b 48       	lea    0x48(%rbx,%r13,1),%r13
058c   e4451f:	48 8d 7b 38          	lea    0x38(%rbx),%rdi
0590   e44523:	48 89 f9             	mov    %rdi,%rcx
0593   e44526:	48 c1 e9 03          	shr    $0x3,%rcx
0597   e4452a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05a1   e44534:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
05a5   e44538:	0f 85 1f 20 00 00    	jne    e4655d <__btrfs_map_block+0x25ca>
05ab   e4453e:	4c 89 6b 38          	mov    %r13,0x38(%rbx)
05af   e44542:	4f 8d 74 b5 00       	lea    0x0(%r13,%r14,4),%r14
05b4   e44547:	48 8d 7b 40          	lea    0x40(%rbx),%rdi
05b8   e4454b:	48 89 f9             	mov    %rdi,%rcx
05bb   e4454e:	48 c1 e9 03          	shr    $0x3,%rcx
05bf   e44552:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05c9   e4455c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
05cd   e44560:	0f 85 a3 20 00 00    	jne    e46609 <__btrfs_map_block+0x2676>
05d3   e44566:	4c 89 73 40          	mov    %r14,0x40(%rbx)
05d7   e4456a:	48 89 9c 24 40 01 00 00 	mov    %rbx,0x140(%rsp)
05df   e44572:	48 85 db             	test   %rbx,%rbx
05e2   e44575:	0f 84 8e 0f 00 00    	je     e45509 <__btrfs_map_block+0x1576>
05e8   e4457b:	44 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%r9d
05f0   e44583:	45 85 c9             	test   %r9d,%r9d
05f3   e44586:	0f 8e de 00 00 00    	jle    e4466a <__btrfs_map_block+0x6d7>
05f9   e4458c:	4c 8d 7b 48          	lea    0x48(%rbx),%r15
05fd   e44590:	8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%eax
0604   e44597:	44 8d 0c 10          	lea    (%rax,%rdx,1),%r9d
0608   e4459b:	49 8d 44 24 10       	lea    0x10(%r12),%rax
060d   e445a0:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
0615   e445a8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
061f   e445b2:	49 89 c0             	mov    %rax,%r8
0622   e445b5:	49 c1 e8 03          	shr    $0x3,%r8
0626   e445b9:	49 01 c8             	add    %rcx,%r8
0629   e445bc:	41 89 d5             	mov    %edx,%r13d
062c   e445bf:	49 8d 7d 02          	lea    0x2(%r13),%rdi
0630   e445c3:	48 c1 e7 04          	shl    $0x4,%rdi
0634   e445c7:	4c 01 e7             	add    %r12,%rdi
0637   e445ca:	48 89 f8             	mov    %rdi,%rax
063a   e445cd:	48 c1 e8 03          	shr    $0x3,%rax
063e   e445d1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0642   e445d5:	0f 85 cf 18 00 00    	jne    e45eaa <__btrfs_map_block+0x1f17>
0648   e445db:	4c 89 e8             	mov    %r13,%rax
064b   e445de:	48 c1 e0 04          	shl    $0x4,%rax
064f   e445e2:	4c 01 e0             	add    %r12,%rax
0652   e445e5:	48 8b 70 20          	mov    0x20(%rax),%rsi
0656   e445e9:	4c 89 ff             	mov    %r15,%rdi
0659   e445ec:	48 c1 ef 03          	shr    $0x3,%rdi
065d   e445f0:	80 3c 0f 00          	cmpb   $0x0,(%rdi,%rcx,1)
0661   e445f4:	0f 85 38 17 00 00    	jne    e45d32 <__btrfs_map_block+0x1d9f>
0667   e445fa:	49 89 37             	mov    %rsi,(%r15)
066a   e445fd:	49 83 c5 02          	add    $0x2,%r13
066e   e44601:	49 c1 e5 04          	shl    $0x4,%r13
0672   e44605:	4b 8d 7c 2c 08       	lea    0x8(%r12,%r13,1),%rdi
0677   e4460a:	48 89 fe             	mov    %rdi,%rsi
067a   e4460d:	48 c1 ee 03          	shr    $0x3,%rsi
067e   e44611:	80 3c 0e 00          	cmpb   $0x0,(%rsi,%rcx,1)
0682   e44615:	0f 85 a7 17 00 00    	jne    e45dc2 <__btrfs_map_block+0x1e2f>
0688   e4461b:	48 8b 40 28          	mov    0x28(%rax),%rax
068c   e4461f:	41 0f b6 30          	movzbl (%r8),%esi
0690   e44623:	40 84 f6             	test   %sil,%sil
0693   e44626:	74 0a                	je     e44632 <__btrfs_map_block+0x69f>
0695   e44628:	40 80 fe 03          	cmp    $0x3,%sil
0699   e4462c:	0f 8e de 17 00 00    	jle    e45e10 <__btrfs_map_block+0x1e7d>
069f   e44632:	45 8b 6c 24 10       	mov    0x10(%r12),%r13d
06a4   e44637:	4d 0f af eb          	imul   %r11,%r13
06a8   e4463b:	4d 01 d5             	add    %r10,%r13
06ab   e4463e:	49 01 c5             	add    %rax,%r13
06ae   e44641:	49 8d 7f 08          	lea    0x8(%r15),%rdi
06b2   e44645:	48 89 f8             	mov    %rdi,%rax
06b5   e44648:	48 c1 e8 03          	shr    $0x3,%rax
06b9   e4464c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
06bd   e44650:	0f 85 10 18 00 00    	jne    e45e66 <__btrfs_map_block+0x1ed3>
06c3   e44656:	4d 89 6f 08          	mov    %r13,0x8(%r15)
06c7   e4465a:	83 c2 01             	add    $0x1,%edx
06ca   e4465d:	49 83 c7 10          	add    $0x10,%r15
06ce   e44661:	44 39 ca             	cmp    %r9d,%edx
06d1   e44664:	0f 85 52 ff ff ff    	jne    e445bc <__btrfs_map_block+0x629>
06d7   e4466a:	4c 89 e2             	mov    %r12,%rdx
06da   e4466d:	48 c1 ea 03          	shr    $0x3,%rdx
06de   e44671:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06e8   e4467b:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
06ec   e4467f:	0f 85 0e 1d 00 00    	jne    e46393 <__btrfs_map_block+0x2400>
06f2   e44685:	8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%eax
06f9   e4468c:	83 e0 fd             	and    $0xfffffffd,%eax
06fc   e4468f:	89 44 24 78          	mov    %eax,0x78(%rsp)
0700   e44693:	49 f7 04 24 80 01 00 00 	testq  $0x180,(%r12)
0708   e4469b:	74 0d                	je     e446aa <__btrfs_map_block+0x717>
070a   e4469d:	44 8b 7d 18          	mov    0x18(%rbp),%r15d
070e   e446a1:	45 85 ff             	test   %r15d,%r15d
0711   e446a4:	0f 85 1b 06 00 00    	jne    e44cc5 <__btrfs_map_block+0xd32>
0717   e446aa:	83 7c 24 78 01       	cmpl   $0x1,0x78(%rsp)
071c   e446af:	0f 84 1b 05 00 00    	je     e44bd0 <__btrfs_map_block+0xc3d>
0722   e446b5:	44 8b ac 24 90 00 00 00 	mov    0x90(%rsp),%r13d
072a   e446bd:	45 85 ed             	test   %r13d,%r13d
072d   e446c0:	0f 84 e6 03 00 00    	je     e44aac <__btrfs_map_block+0xb19>
0733   e446c6:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
073b   e446ce:	4c 8d b8 20 1b 00 00 	lea    0x1b20(%rax),%r15
0742   e446d5:	4c 89 fa             	mov    %r15,%rdx
0745   e446d8:	48 c1 ea 03          	shr    $0x3,%rdx
0749   e446dc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0753   e446e6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0757   e446ea:	0f 85 ec 1c 00 00    	jne    e463dc <__btrfs_map_block+0x2449>
075d   e446f0:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0765   e446f8:	48 83 b8 20 1b 00 00 00 	cmpq   $0x0,0x1b20(%rax)
076d   e44700:	74 0b                	je     e4470d <__btrfs_map_block+0x77a>
076f   e44702:	83 7c 24 78 01       	cmpl   $0x1,0x78(%rsp)
0774   e44707:	0f 84 e4 10 00 00    	je     e457f1 <__btrfs_map_block+0x185e>
077a   e4470d:	48 8b 94 24 b0 00 00 00 	mov    0xb0(%rsp),%rdx
0782   e44715:	48 c1 ea 03          	shr    $0x3,%rdx
0786   e44719:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0790   e44723:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0794   e44727:	0f 85 9d 1c 00 00    	jne    e463ca <__btrfs_map_block+0x2437>
079a   e4472d:	48 8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%rax
07a2   e44735:	48 89 18             	mov    %rbx,(%rax)
07a5   e44738:	4c 89 e2             	mov    %r12,%rdx
07a8   e4473b:	48 c1 ea 03          	shr    $0x3,%rdx
07ac   e4473f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
07b6   e44749:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
07ba   e4474d:	0f 85 5d 1c 00 00    	jne    e463b0 <__btrfs_map_block+0x241d>
07c0   e44753:	4d 8b 2c 24          	mov    (%r12),%r13
07c4   e44757:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
07c8   e4475b:	48 89 fa             	mov    %rdi,%rdx
07cb   e4475e:	48 c1 ea 03          	shr    $0x3,%rdx
07cf   e44762:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
07d9   e4476c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
07dd   e44770:	0f 85 47 1c 00 00    	jne    e463bd <__btrfs_map_block+0x242a>
07e3   e44776:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
07e7   e4477a:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
07eb   e4477e:	48 89 fa             	mov    %rdi,%rdx
07ee   e44781:	48 c1 ea 03          	shr    $0x3,%rdx
07f2   e44785:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
07fc   e4478f:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0800   e44793:	84 c0                	test   %al,%al
0802   e44795:	74 08                	je     e4479f <__btrfs_map_block+0x80c>
0804   e44797:	3c 03                	cmp    $0x3,%al
0806   e44799:	0f 8e bc 20 00 00    	jle    e4685b <__btrfs_map_block+0x28c8>
080c   e4479f:	8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%eax
0813   e447a6:	89 43 28             	mov    %eax,0x28(%rbx)
0816   e447a9:	44 8b ac 24 30 01 00 00 	mov    0x130(%rsp),%r13d
081e   e447b1:	48 8d 7b 24          	lea    0x24(%rbx),%rdi
0822   e447b5:	48 89 fa             	mov    %rdi,%rdx
0825   e447b8:	48 c1 ea 03          	shr    $0x3,%rdx
0829   e447bc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0833   e447c6:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0837   e447ca:	48 89 f8             	mov    %rdi,%rax
083a   e447cd:	83 e0 07             	and    $0x7,%eax
083d   e447d0:	83 c0 03             	add    $0x3,%eax
0840   e447d3:	38 d0                	cmp    %dl,%al
0842   e447d5:	7c 08                	jl     e447df <__btrfs_map_block+0x84c>
0844   e447d7:	84 d2                	test   %dl,%dl
0846   e447d9:	0f 85 bd 20 00 00    	jne    e4689c <__btrfs_map_block+0x2909>
084c   e447df:	44 89 6b 24          	mov    %r13d,0x24(%rbx)
0850   e447e3:	4c 8d 6b 2c          	lea    0x2c(%rbx),%r13
0854   e447e7:	4c 89 ea             	mov    %r13,%rdx
0857   e447ea:	48 c1 ea 03          	shr    $0x3,%rdx
085b   e447ee:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0865   e447f8:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0869   e447fc:	4c 89 e8             	mov    %r13,%rax
086c   e447ff:	83 e0 07             	and    $0x7,%eax
086f   e44802:	83 c0 03             	add    $0x3,%eax
0872   e44805:	38 d0                	cmp    %dl,%al
0874   e44807:	7c 08                	jl     e44811 <__btrfs_map_block+0x87e>
0876   e44809:	84 d2                	test   %dl,%dl
0878   e4480b:	0f 85 44 21 00 00    	jne    e46955 <__btrfs_map_block+0x29c2>
087e   e44811:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
0885   e44818:	89 43 2c             	mov    %eax,0x2c(%rbx)
0888   e4481b:	44 8b 54 24 68       	mov    0x68(%rsp),%r10d
088d   e44820:	45 85 d2             	test   %r10d,%r10d
0890   e44823:	0f 84 0f 01 00 00    	je     e44938 <__btrfs_map_block+0x9a5>
0896   e44829:	8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%edx
089d   e44830:	85 d2                	test   %edx,%edx
089f   e44832:	0f 8e 00 01 00 00    	jle    e44938 <__btrfs_map_block+0x9a5>
08a5   e44838:	48 8d 43 48          	lea    0x48(%rbx),%rax
08a9   e4483c:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
08ae   e44841:	83 bc 24 a8 00 00 00 01 	cmpl   $0x1,0xa8(%rsp)
08b6   e44849:	0f 85 ba 12 00 00    	jne    e45b09 <__btrfs_map_block+0x1b76>
08bc   e4484f:	4c 89 fa             	mov    %r15,%rdx
08bf   e44852:	48 c1 ea 03          	shr    $0x3,%rdx
08c3   e44856:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
08cd   e44860:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
08d1   e44864:	0f 85 db 20 00 00    	jne    e46945 <__btrfs_map_block+0x29b2>
08d7   e4486a:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
08df   e44872:	4c 8b b0 20 1b 00 00 	mov    0x1b20(%rax),%r14
08e6   e44879:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
08eb   e4487e:	48 c1 ea 03          	shr    $0x3,%rdx
08ef   e44882:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
08f9   e4488c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
08fd   e44890:	0f 85 a0 20 00 00    	jne    e46936 <__btrfs_map_block+0x29a3>
0903   e44896:	4c 89 73 48          	mov    %r14,0x48(%rbx)
0907   e4489a:	48 8d 7b 50          	lea    0x50(%rbx),%rdi
090b   e4489e:	48 89 fa             	mov    %rdi,%rdx
090e   e448a1:	48 c1 ea 03          	shr    $0x3,%rdx
0912   e448a5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
091c   e448af:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0920   e448b3:	0f 85 cc 20 00 00    	jne    e46985 <__btrfs_map_block+0x29f2>
0926   e448b9:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
092b   e448be:	48 89 43 50          	mov    %rax,0x50(%rbx)
092f   e448c2:	48 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%rsi
0937   e448ca:	48 89 f2             	mov    %rsi,%rdx
093a   e448cd:	48 c1 ea 03          	shr    $0x3,%rdx
093e   e448d1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0948   e448db:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
094c   e448df:	48 89 f0             	mov    %rsi,%rax
094f   e448e2:	83 e0 07             	and    $0x7,%eax
0952   e448e5:	83 c0 03             	add    $0x3,%eax
0955   e448e8:	38 d0                	cmp    %dl,%al
0957   e448ea:	7c 08                	jl     e448f4 <__btrfs_map_block+0x961>
0959   e448ec:	84 d2                	test   %dl,%dl
095b   e448ee:	0f 85 81 20 00 00    	jne    e46975 <__btrfs_map_block+0x29e2>
0961   e448f4:	45 8b 64 24 14       	mov    0x14(%r12),%r12d
0966   e448f9:	41 83 c4 01          	add    $0x1,%r12d
096a   e448fd:	4c 89 ea             	mov    %r13,%rdx
096d   e44900:	48 c1 ea 03          	shr    $0x3,%rdx
0971   e44904:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
097b   e4490e:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
097f   e44912:	4c 89 e8             	mov    %r13,%rax
0982   e44915:	83 e0 07             	and    $0x7,%eax
0985   e44918:	83 c0 03             	add    $0x3,%eax
0988   e4491b:	38 d0                	cmp    %dl,%al
098a   e4491d:	7c 08                	jl     e44927 <__btrfs_map_block+0x994>
098c   e4491f:	84 d2                	test   %dl,%dl
098e   e44921:	0f 85 3e 20 00 00    	jne    e46965 <__btrfs_map_block+0x29d2>
0994   e44927:	44 89 63 2c          	mov    %r12d,0x2c(%rbx)
0998   e4492b:	44 8b a4 24 90 00 00 00 	mov    0x90(%rsp),%r12d
09a0   e44933:	45 85 e4             	test   %r12d,%r12d
09a3   e44936:	74 46                	je     e4497e <__btrfs_map_block+0x9eb>
09a5   e44938:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e4493b: R_X86_64_32S	debug_locks
09ac   e4493f:	48 89 c1             	mov    %rax,%rcx
09af   e44942:	48 c1 e9 03          	shr    $0x3,%rcx
09b3   e44946:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
09bd   e44950:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
09c1   e44954:	83 e0 07             	and    $0x7,%eax
09c4   e44957:	83 c0 03             	add    $0x3,%eax
09c7   e4495a:	38 d0                	cmp    %dl,%al
09c9   e4495c:	7c 08                	jl     e44966 <__btrfs_map_block+0x9d3>
09cb   e4495e:	84 d2                	test   %dl,%dl
09cd   e44960:	0f 85 62 20 00 00    	jne    e469c8 <__btrfs_map_block+0x2a35>
09d3   e44966:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # e4496c <__btrfs_map_block+0x9d9>	e44968: R_X86_64_PC32	debug_locks-0x4
09d9   e4496c:	85 db                	test   %ebx,%ebx
09db   e4496e:	0f 85 46 09 00 00    	jne    e452ba <__btrfs_map_block+0x1327>
09e1   e44974:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
09e6   e44979:	e8 00 00 00 00       	call   e4497e <__btrfs_map_block+0x9eb>	e4497a: R_X86_64_PLT32	up_read-0x4
09eb   e4497e:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
09f3   e44986:	e8 00 00 00 00       	call   e4498b <__btrfs_map_block+0x9f8>	e44987: R_X86_64_PLT32	free_extent_map-0x4
09f8   e4498b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0a02   e44995:	48 03 84 24 98 00 00 00 	add    0x98(%rsp),%rax
0a0a   e4499d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
0a11   e449a4:	48 c7 40 08 00 00 00 00 	movq   $0x0,0x8(%rax)
0a19   e449ac:	48 c7 40 10 00 00 00 00 	movq   $0x0,0x10(%rax)
0a21   e449b4:	48 c7 40 18 00 00 00 00 	movq   $0x0,0x18(%rax)
0a29   e449bc:	48 8b 84 24 08 02 00 00 	mov    0x208(%rsp),%rax
0a31   e449c4:	65 48 2b 04 25 28 00 00 00 	sub    %gs:0x28,%rax
0a3a   e449cd:	0f 85 f5 16 00 00    	jne    e460c8 <__btrfs_map_block+0x2135>
0a40   e449d3:	8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%eax
0a47   e449da:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
0a4b   e449de:	5b                   	pop    %rbx
0a4c   e449df:	41 5c                	pop    %r12
0a4e   e449e1:	41 5d                	pop    %r13
0a50   e449e3:	41 5e                	pop    %r14
0a52   e449e5:	41 5f                	pop    %r15
0a54   e449e7:	5d                   	pop    %rbp
0a55   e449e8:	c3                   	ret
0a56   e449e9:	c7 84 24 c0 00 00 00 00 00 00 00 	movl   $0x0,0xc0(%rsp)
0a61   e449f4:	e9 a3 f6 ff ff       	jmp    e4409c <__btrfs_map_block+0x109>
0a66   e449f9:	48 89 c6             	mov    %rax,%rsi
0a69   e449fc:	81 e6 10 06 00 00    	and    $0x610,%esi
0a6f   e44a02:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
0a74   e44a07:	0f 85 41 02 00 00    	jne    e44c4e <__btrfs_map_block+0xcbb>
0a7a   e44a0d:	c7 44 24 68 00 00 00 00 	movl   $0x0,0x68(%rsp)
0a82   e44a15:	a8 20                	test   $0x20,%al
0a84   e44a17:	0f 84 cd 0b 00 00    	je     e455ea <__btrfs_map_block+0x1657>
0a8a   e44a1d:	8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%ebx
0a91   e44a24:	83 e3 fd             	and    $0xfffffffd,%ebx
0a94   e44a27:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
0a9c   e44a2f:	48 89 ca             	mov    %rcx,%rdx
0a9f   e44a32:	48 c1 ea 03          	shr    $0x3,%rdx
0aa3   e44a36:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0aad   e44a40:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0ab1   e44a44:	48 89 c8             	mov    %rcx,%rax
0ab4   e44a47:	83 e0 07             	and    $0x7,%eax
0ab7   e44a4a:	83 c0 03             	add    $0x3,%eax
0aba   e44a4d:	38 d0                	cmp    %dl,%al
0abc   e44a4f:	7c 2c                	jl     e44a7d <__btrfs_map_block+0xaea>
0abe   e44a51:	84 d2                	test   %dl,%dl
0ac0   e44a53:	74 28                	je     e44a7d <__btrfs_map_block+0xaea>
0ac2   e44a55:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
0aca   e44a5d:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
0ad2   e44a65:	48 89 cf             	mov    %rcx,%rdi
0ad5   e44a68:	e8 00 00 00 00       	call   e44a6d <__btrfs_map_block+0xada>	e44a69: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ada   e44a6d:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
0ae2   e44a75:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
0aea   e44a7d:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
0aef   e44a82:	83 fb 01             	cmp    $0x1,%ebx
0af2   e44a85:	0f 84 61 0f 00 00    	je     e459ec <__btrfs_map_block+0x1a59>
0af8   e44a8b:	8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%esi
0aff   e44a92:	85 f6                	test   %esi,%esi
0b01   e44a94:	0f 85 60 10 00 00    	jne    e45afa <__btrfs_map_block+0x1b67>
0b07   e44a9a:	c7 84 24 c0 00 00 00 01 00 00 00 	movl   $0x1,0xc0(%rsp)
0b12   e44aa5:	31 d2                	xor    %edx,%edx
0b14   e44aa7:	e9 2b f9 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
0b19   e44aac:	48 8b 94 24 b0 00 00 00 	mov    0xb0(%rsp),%rdx
0b21   e44ab4:	48 c1 ea 03          	shr    $0x3,%rdx
0b25   e44ab8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b2f   e44ac2:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0b33   e44ac6:	0f 85 69 1b 00 00    	jne    e46635 <__btrfs_map_block+0x26a2>
0b39   e44acc:	48 8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%rax
0b41   e44ad4:	48 89 18             	mov    %rbx,(%rax)
0b44   e44ad7:	4d 8b 2c 24          	mov    (%r12),%r13
0b48   e44adb:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
0b4c   e44adf:	48 89 fa             	mov    %rdi,%rdx
0b4f   e44ae2:	48 c1 ea 03          	shr    $0x3,%rdx
0b53   e44ae6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b5d   e44af0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0b61   e44af4:	0f 85 4d 1b 00 00    	jne    e46647 <__btrfs_map_block+0x26b4>
0b67   e44afa:	4c 89 6b 10          	mov    %r13,0x10(%rbx)
0b6b   e44afe:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
0b6f   e44b02:	48 89 fa             	mov    %rdi,%rdx
0b72   e44b05:	48 c1 ea 03          	shr    $0x3,%rdx
0b76   e44b09:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b80   e44b13:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0b84   e44b17:	84 c0                	test   %al,%al
0b86   e44b19:	74 08                	je     e44b23 <__btrfs_map_block+0xb90>
0b88   e44b1b:	3c 03                	cmp    $0x3,%al
0b8a   e44b1d:	0f 8e 83 1d 00 00    	jle    e468a6 <__btrfs_map_block+0x2913>
0b90   e44b23:	8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%eax
0b97   e44b2a:	89 43 28             	mov    %eax,0x28(%rbx)
0b9a   e44b2d:	44 8b ac 24 30 01 00 00 	mov    0x130(%rsp),%r13d
0ba2   e44b35:	48 8d 7b 24          	lea    0x24(%rbx),%rdi
0ba6   e44b39:	48 89 fa             	mov    %rdi,%rdx
0ba9   e44b3c:	48 c1 ea 03          	shr    $0x3,%rdx
0bad   e44b40:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0bb7   e44b4a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0bbb   e44b4e:	48 89 f8             	mov    %rdi,%rax
0bbe   e44b51:	83 e0 07             	and    $0x7,%eax
0bc1   e44b54:	83 c0 03             	add    $0x3,%eax
0bc4   e44b57:	38 d0                	cmp    %dl,%al
0bc6   e44b59:	7c 08                	jl     e44b63 <__btrfs_map_block+0xbd0>
0bc8   e44b5b:	84 d2                	test   %dl,%dl
0bca   e44b5d:	0f 85 52 1d 00 00    	jne    e468b5 <__btrfs_map_block+0x2922>
0bd0   e44b63:	44 89 6b 24          	mov    %r13d,0x24(%rbx)
0bd4   e44b67:	4c 8d 6b 2c          	lea    0x2c(%rbx),%r13
0bd8   e44b6b:	4c 89 ea             	mov    %r13,%rdx
0bdb   e44b6e:	48 c1 ea 03          	shr    $0x3,%rdx
0bdf   e44b72:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0be9   e44b7c:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0bed   e44b80:	4c 89 e8             	mov    %r13,%rax
0bf0   e44b83:	83 e0 07             	and    $0x7,%eax
0bf3   e44b86:	83 c0 03             	add    $0x3,%eax
0bf6   e44b89:	38 d0                	cmp    %dl,%al
0bf8   e44b8b:	7c 08                	jl     e44b95 <__btrfs_map_block+0xc02>
0bfa   e44b8d:	84 d2                	test   %dl,%dl
0bfc   e44b8f:	0f 85 30 1d 00 00    	jne    e468c5 <__btrfs_map_block+0x2932>
0c02   e44b95:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
0c09   e44b9c:	89 43 2c             	mov    %eax,0x2c(%rbx)
0c0c   e44b9f:	44 8b 5c 24 68       	mov    0x68(%rsp),%r11d
0c11   e44ba4:	45 85 db             	test   %r11d,%r11d
0c14   e44ba7:	0f 84 d1 fd ff ff    	je     e4497e <__btrfs_map_block+0x9eb>
0c1a   e44bad:	8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%eax
0c21   e44bb4:	85 c0                	test   %eax,%eax
0c23   e44bb6:	0f 8e c2 fd ff ff    	jle    e4497e <__btrfs_map_block+0x9eb>
0c29   e44bbc:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0c31   e44bc4:	4c 8d b8 20 1b 00 00 	lea    0x1b20(%rax),%r15
0c38   e44bcb:	e9 71 fc ff ff       	jmp    e44841 <__btrfs_map_block+0x8ae>
0c3d   e44bd0:	49 8b 04 24          	mov    (%r12),%rax
0c41   e44bd4:	25 f8 07 00 00       	and    $0x7f8,%eax
0c46   e44bd9:	0f 84 05 07 00 00    	je     e452e4 <__btrfs_map_block+0x1351>
0c4c   e44bdf:	48 c1 e8 02          	shr    $0x2,%rax
0c50   e44be3:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
0c56   e44be9:	4c 0f bd e8          	bsr    %rax,%r13
0c5a   e44bed:	4d 63 ed             	movslq %r13d,%r13
0c5d   e44bf0:	49 83 fd 08          	cmp    $0x8,%r13
0c61   e44bf4:	0f 87 a6 1b 00 00    	ja     e467a0 <__btrfs_map_block+0x280d>
0c67   e44bfa:	4c 89 ef             	mov    %r13,%rdi
0c6a   e44bfd:	48 c1 e7 05          	shl    $0x5,%rdi
0c6e   e44c01:	48 81 c7 00 00 00 00 	add    $0x0,%rdi	e44c04: R_X86_64_32S	btrfs_raid_array+0x4
0c75   e44c08:	48 89 fa             	mov    %rdi,%rdx
0c78   e44c0b:	48 c1 ea 03          	shr    $0x3,%rdx
0c7c   e44c0f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0c86   e44c19:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0c8a   e44c1d:	48 89 fa             	mov    %rdi,%rdx
0c8d   e44c20:	83 e2 07             	and    $0x7,%edx
0c90   e44c23:	38 d0                	cmp    %dl,%al
0c92   e44c25:	7f 08                	jg     e44c2f <__btrfs_map_block+0xc9c>
0c94   e44c27:	84 c0                	test   %al,%al
0c96   e44c29:	0f 85 cc 15 00 00    	jne    e461fb <__btrfs_map_block+0x2268>
0c9c   e44c2f:	49 c1 e5 05          	shl    $0x5,%r13
0ca0   e44c33:	41 0f b6 85 00 00 00 00 	movzbl 0x0(%r13),%eax	e44c37: R_X86_64_32S	btrfs_raid_array+0x4
0ca8   e44c3b:	89 84 24 30 01 00 00 	mov    %eax,0x130(%rsp)
0caf   e44c42:	e9 6e fa ff ff       	jmp    e446b5 <__btrfs_map_block+0x722>
0cb4   e44c47:	31 c0                	xor    %eax,%eax
0cb6   e44c49:	e9 f5 f5 ff ff       	jmp    e44243 <__btrfs_map_block+0x2b0>
0cbb   e44c4e:	8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%eax
0cc2   e44c55:	83 e0 fd             	and    $0xfffffffd,%eax
0cc5   e44c58:	83 f8 01             	cmp    $0x1,%eax
0cc8   e44c5b:	0f 84 0e 09 00 00    	je     e4556f <__btrfs_map_block+0x15dc>
0cce   e44c61:	8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%edi
0cd5   e44c68:	85 ff                	test   %edi,%edi
0cd7   e44c6a:	0f 84 8b 0d 00 00    	je     e459fb <__btrfs_map_block+0x1a68>
0cdd   e44c70:	c7 44 24 68 00 00 00 00 	movl   $0x0,0x68(%rsp)
0ce5   e44c78:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
0cec   e44c7f:	8d 50 ff             	lea    -0x1(%rax),%edx
0cef   e44c82:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
0cf7   e44c8a:	48 89 de             	mov    %rbx,%rsi
0cfa   e44c8d:	48 c1 ee 03          	shr    $0x3,%rsi
0cfe   e44c91:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0d08   e44c9b:	0f b6 34 06          	movzbl (%rsi,%rax,1),%esi
0d0c   e44c9f:	48 89 d8             	mov    %rbx,%rax
0d0f   e44ca2:	83 e0 07             	and    $0x7,%eax
0d12   e44ca5:	83 c0 03             	add    $0x3,%eax
0d15   e44ca8:	40 38 f0             	cmp    %sil,%al
0d18   e44cab:	7c 09                	jl     e44cb6 <__btrfs_map_block+0xd23>
0d1a   e44cad:	40 84 f6             	test   %sil,%sil
0d1d   e44cb0:	0f 85 ab 1a 00 00    	jne    e46761 <__btrfs_map_block+0x27ce>
0d23   e44cb6:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
0d28   e44cbb:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
0d2d   e44cc0:	e9 12 f7 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
0d32   e44cc5:	83 7c 24 78 01       	cmpl   $0x1,0x78(%rsp)
0d37   e44cca:	74 0e                	je     e44cda <__btrfs_map_block+0xd47>
0d39   e44ccc:	83 bc 24 c0 00 00 00 01 	cmpl   $0x1,0xc0(%rsp)
0d41   e44cd4:	0f 8e db f9 ff ff    	jle    e446b5 <__btrfs_map_block+0x722>
0d47   e44cda:	8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%ecx
0d4e   e44ce1:	4c 89 d8             	mov    %r11,%rax
0d51   e44ce4:	31 d2                	xor    %edx,%edx
0d53   e44ce6:	48 f7 f1             	div    %rcx
0d56   e44ce9:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
0d5b   e44cee:	89 d1                	mov    %edx,%ecx
0d5d   e44cf0:	48 63 74 24 50       	movslq 0x50(%rsp),%rsi
0d62   e44cf5:	48 89 f0             	mov    %rsi,%rax
0d65   e44cf8:	49 0f af f3          	imul   %r11,%rsi
0d69   e44cfc:	85 c0                	test   %eax,%eax
0d6b   e44cfe:	0f 8e b8 00 00 00    	jle    e44dbc <__btrfs_map_block+0xe29>
0d71   e44d04:	44 8d 58 ff          	lea    -0x1(%rax),%r11d
0d75   e44d08:	49 01 f3             	add    %rsi,%r11
0d78   e44d0b:	49 89 f5             	mov    %rsi,%r13
0d7b   e44d0e:	49 8d 44 24 10       	lea    0x10(%r12),%rax
0d80   e44d13:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
0d88   e44d1b:	48 8b 94 24 c8 00 00 00 	mov    0xc8(%rsp),%rdx
0d90   e44d23:	48 83 c2 18          	add    $0x18,%rdx
0d94   e44d27:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
0d99   e44d2c:	49 89 d2             	mov    %rdx,%r10
0d9c   e44d2f:	49 c1 ea 03          	shr    $0x3,%r10
0da0   e44d33:	49 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r9
0daa   e44d3d:	4d 01 ca             	add    %r9,%r10
0dad   e44d40:	48 c1 e8 03          	shr    $0x3,%rax
0db1   e44d44:	49 89 c0             	mov    %rax,%r8
0db4   e44d47:	4d 01 c8             	add    %r9,%r8
0db7   e44d4a:	eb 04                	jmp    e44d50 <__btrfs_map_block+0xdbd>
0db9   e44d4c:	49 83 c5 01          	add    $0x1,%r13
0dbd   e44d50:	41 80 3a 00          	cmpb   $0x0,(%r10)
0dc1   e44d54:	0f 85 d4 12 00 00    	jne    e4602e <__btrfs_map_block+0x209b>
0dc7   e44d5a:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
0dcf   e44d62:	4c 8b 78 18          	mov    0x18(%rax),%r15
0dd3   e44d66:	41 0f b6 00          	movzbl (%r8),%eax
0dd7   e44d6a:	84 c0                	test   %al,%al
0dd9   e44d6c:	74 08                	je     e44d76 <__btrfs_map_block+0xde3>
0ddb   e44d6e:	3c 03                	cmp    $0x3,%al
0ddd   e44d70:	0f 8e 6c 12 00 00    	jle    e45fe2 <__btrfs_map_block+0x204f>
0de3   e44d76:	89 c8                	mov    %ecx,%eax
0de5   e44d78:	29 f0                	sub    %esi,%eax
0de7   e44d7a:	44 01 e8             	add    %r13d,%eax
0dea   e44d7d:	31 d2                	xor    %edx,%edx
0dec   e44d7f:	f7 b4 24 a8 00 00 00 	divl   0xa8(%rsp)
0df3   e44d86:	49 8d 04 d6          	lea    (%r14,%rdx,8),%rax
0df7   e44d8a:	45 8b 74 24 10       	mov    0x10(%r12),%r14d
0dfc   e44d8f:	4d 0f af f5          	imul   %r13,%r14
0e00   e44d93:	4d 01 fe             	add    %r15,%r14
0e03   e44d96:	48 89 c2             	mov    %rax,%rdx
0e06   e44d99:	48 c1 ea 03          	shr    $0x3,%rdx
0e0a   e44d9d:	42 80 3c 0a 00       	cmpb   $0x0,(%rdx,%r9,1)
0e0f   e44da2:	0f 85 cf 12 00 00    	jne    e46077 <__btrfs_map_block+0x20e4>
0e15   e44da8:	4c 89 30             	mov    %r14,(%rax)
0e18   e44dab:	4c 8b 73 40          	mov    0x40(%rbx),%r14
0e1c   e44daf:	4d 39 eb             	cmp    %r13,%r11
0e1f   e44db2:	75 98                	jne    e44d4c <__btrfs_map_block+0xdb9>
0e21   e44db4:	8b 4c 24 50          	mov    0x50(%rsp),%ecx
0e25   e44db8:	03 4c 24 48          	add    0x48(%rsp),%ecx
0e29   e44dbc:	48 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%rsi
0e31   e44dc4:	48 89 f2             	mov    %rsi,%rdx
0e34   e44dc7:	48 c1 ea 03          	shr    $0x3,%rdx
0e38   e44dcb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0e42   e44dd5:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0e46   e44dd9:	48 89 f0             	mov    %rsi,%rax
0e49   e44ddc:	83 e0 07             	and    $0x7,%eax
0e4c   e44ddf:	83 c0 03             	add    $0x3,%eax
0e4f   e44de2:	38 d0                	cmp    %dl,%al
0e51   e44de4:	7c 1a                	jl     e44e00 <__btrfs_map_block+0xe6d>
0e53   e44de6:	84 d2                	test   %dl,%dl
0e55   e44de8:	74 16                	je     e44e00 <__btrfs_map_block+0xe6d>
0e57   e44dea:	89 8c 24 d0 00 00 00 	mov    %ecx,0xd0(%rsp)
0e5e   e44df1:	48 89 f7             	mov    %rsi,%rdi
0e61   e44df4:	e8 00 00 00 00       	call   e44df9 <__btrfs_map_block+0xe66>	e44df5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e66   e44df9:	8b 8c 24 d0 00 00 00 	mov    0xd0(%rsp),%ecx
0e6d   e44e00:	89 c8                	mov    %ecx,%eax
0e6f   e44e02:	31 d2                	xor    %edx,%edx
0e71   e44e04:	41 f7 74 24 14       	divl   0x14(%r12)
0e76   e44e09:	4d 8d 2c d6          	lea    (%r14,%rdx,8),%r13
0e7a   e44e0d:	4c 89 ea             	mov    %r13,%rdx
0e7d   e44e10:	48 c1 ea 03          	shr    $0x3,%rdx
0e81   e44e14:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0e8b   e44e1e:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0e8f   e44e22:	0f 85 b3 14 00 00    	jne    e462db <__btrfs_map_block+0x2348>
0e95   e44e28:	49 c7 45 00 fe ff ff ff 	movq   $0xfffffffffffffffe,0x0(%r13)
0e9d   e44e30:	49 f7 04 24 00 01 00 00 	testq  $0x100,(%r12)
0ea5   e44e38:	0f 85 02 0a 00 00    	jne    e45840 <__btrfs_map_block+0x18ad>
0eab   e44e3e:	8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%eax
0eb2   e44e45:	44 8d 58 ff          	lea    -0x1(%rax),%r11d
0eb6   e44e49:	45 31 c9             	xor    %r9d,%r9d
0eb9   e44e4c:	45 31 ff             	xor    %r15d,%r15d
0ebc   e44e4f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0ec6   e44e59:	45 39 fb             	cmp    %r15d,%r11d
0ec9   e44e5c:	0f 8e 8a 04 00 00    	jle    e452ec <__btrfs_map_block+0x1359>
0ecf   e44e62:	41 8d 47 01          	lea    0x1(%r15),%eax
0ed3   e44e66:	48 63 d0             	movslq %eax,%rdx
0ed6   e44e69:	48 8d 34 d5 00 00 00 00 	lea    0x0(,%rdx,8),%rsi
0ede   e44e71:	48 c1 e2 04          	shl    $0x4,%rdx
0ee2   e44e75:	48 8d 54 13 48       	lea    0x48(%rbx,%rdx,1),%rdx
0ee7   e44e7a:	4d 63 c7             	movslq %r15d,%r8
0eea   e44e7d:	4c 8b 6b 40          	mov    0x40(%rbx),%r13
0eee   e44e81:	4f 8d 74 fd 00       	lea    0x0(%r13,%r15,8),%r14
0ef3   e44e86:	4c 89 f7             	mov    %r14,%rdi
0ef6   e44e89:	48 c1 ef 03          	shr    $0x3,%rdi
0efa   e44e8d:	80 3c 0f 00          	cmpb   $0x0,(%rdi,%rcx,1)
0efe   e44e91:	0f 85 44 0e 00 00    	jne    e45cdb <__btrfs_map_block+0x1d48>
0f04   e44e97:	4d 8b 16             	mov    (%r14),%r10
0f07   e44e9a:	4c 63 f8             	movslq %eax,%r15
0f0a   e44e9d:	49 01 f5             	add    %rsi,%r13
0f0d   e44ea0:	4c 89 ef             	mov    %r13,%rdi
0f10   e44ea3:	48 c1 ef 03          	shr    $0x3,%rdi
0f14   e44ea7:	80 3c 0f 00          	cmpb   $0x0,(%rdi,%rcx,1)
0f18   e44eab:	0f 85 c9 0d 00 00    	jne    e45c7a <__btrfs_map_block+0x1ce7>
0f1e   e44eb1:	4d 3b 55 00          	cmp    0x0(%r13),%r10
0f22   e44eb5:	76 a2                	jbe    e44e59 <__btrfs_map_block+0xec6>
0f24   e44eb7:	49 8d 78 04          	lea    0x4(%r8),%rdi
0f28   e44ebb:	48 c1 e7 04          	shl    $0x4,%rdi
0f2c   e44ebf:	48 8d 7c 3b 08       	lea    0x8(%rbx,%rdi,1),%rdi
0f31   e44ec4:	49 89 f9             	mov    %rdi,%r9
0f34   e44ec7:	49 c1 e9 03          	shr    $0x3,%r9
0f38   e44ecb:	66 41 83 3c 09 00    	cmpw   $0x0,(%r9,%rcx,1)
0f3e   e44ed1:	0f 85 74 10 00 00    	jne    e45f4b <__btrfs_map_block+0x1fb8>
0f44   e44ed7:	49 83 c0 04          	add    $0x4,%r8
0f48   e44edb:	49 c1 e0 04          	shl    $0x4,%r8
0f4c   e44edf:	4a 8d 3c 03          	lea    (%rbx,%r8,1),%rdi
0f50   e44ee3:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
0f54   e44ee7:	4c 8b 57 10          	mov    0x10(%rdi),%r10
0f58   e44eeb:	4c 89 8c 24 d0 00 00 00 	mov    %r9,0xd0(%rsp)
0f60   e44ef3:	4c 89 94 24 d8 00 00 00 	mov    %r10,0xd8(%rsp)
0f68   e44efb:	4c 8b 0a             	mov    (%rdx),%r9
0f6b   e44efe:	4c 8b 52 08          	mov    0x8(%rdx),%r10
0f6f   e44f02:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
0f73   e44f06:	4c 89 57 10          	mov    %r10,0x10(%rdi)
0f77   e44f0a:	48 89 d7             	mov    %rdx,%rdi
0f7a   e44f0d:	48 c1 ef 03          	shr    $0x3,%rdi
0f7e   e44f11:	66 83 3c 0f 00       	cmpw   $0x0,(%rdi,%rcx,1)
0f83   e44f16:	0f 85 f2 0f 00 00    	jne    e45f0e <__btrfs_map_block+0x1f7b>
0f89   e44f1c:	4c 8b 8c 24 d0 00 00 00 	mov    0xd0(%rsp),%r9
0f91   e44f24:	4c 8b 94 24 d8 00 00 00 	mov    0xd8(%rsp),%r10
0f99   e44f2c:	4c 89 0a             	mov    %r9,(%rdx)
0f9c   e44f2f:	4c 89 52 08          	mov    %r10,0x8(%rdx)
0fa0   e44f33:	4d 8b 06             	mov    (%r14),%r8
0fa3   e44f36:	49 8b 7d 00          	mov    0x0(%r13),%rdi
0fa7   e44f3a:	49 89 3e             	mov    %rdi,(%r14)
0faa   e44f3d:	4c 8b 6b 40          	mov    0x40(%rbx),%r13
0fae   e44f41:	49 01 f5             	add    %rsi,%r13
0fb1   e44f44:	4c 89 ef             	mov    %r13,%rdi
0fb4   e44f47:	48 c1 ef 03          	shr    $0x3,%rdi
0fb8   e44f4b:	80 3c 0f 00          	cmpb   $0x0,(%rdi,%rcx,1)
0fbc   e44f4f:	0f 85 40 10 00 00    	jne    e45f95 <__btrfs_map_block+0x2002>
0fc2   e44f55:	4d 89 45 00          	mov    %r8,0x0(%r13)
0fc6   e44f59:	48 83 c6 08          	add    $0x8,%rsi
0fca   e44f5d:	48 83 c2 10          	add    $0x10,%rdx
0fce   e44f61:	41 39 c3             	cmp    %eax,%r11d
0fd1   e44f64:	0f 8e a0 03 00 00    	jle    e4530a <__btrfs_map_block+0x1377>
0fd7   e44f6a:	44 8b 4d 18          	mov    0x18(%rbp),%r9d
0fdb   e44f6e:	4c 63 c0             	movslq %eax,%r8
0fde   e44f71:	83 c0 01             	add    $0x1,%eax
0fe1   e44f74:	e9 04 ff ff ff       	jmp    e44e7d <__btrfs_map_block+0xeea>
0fe6   e44f79:	8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%eax
0fed   e44f80:	83 e0 fd             	and    $0xfffffffd,%eax
0ff0   e44f83:	83 f8 01             	cmp    $0x1,%eax
0ff3   e44f86:	0f 84 c0 f3 ff ff    	je     e4434c <__btrfs_map_block+0x3b9>
0ff9   e44f8c:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
1001   e44f94:	4c 8d b8 20 1b 00 00 	lea    0x1b20(%rax),%r15
1008   e44f9b:	4c 89 fa             	mov    %r15,%rdx
100b   e44f9e:	48 c1 ea 03          	shr    $0x3,%rdx
100f   e44fa2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1019   e44fac:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
101d   e44fb0:	0f 85 6e 18 00 00    	jne    e46824 <__btrfs_map_block+0x2891>
1023   e44fb6:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
102b   e44fbe:	48 83 b8 20 1b 00 00 00 	cmpq   $0x0,0x1b20(%rax)
1033   e44fc6:	0f 84 80 f3 ff ff    	je     e4434c <__btrfs_map_block+0x3b9>
1039   e44fcc:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
1041   e44fd4:	48 8d b8 18 1b 00 00 	lea    0x1b18(%rax),%rdi
1048   e44fdb:	48 89 fa             	mov    %rdi,%rdx
104b   e44fde:	48 c1 ea 03          	shr    $0x3,%rdx
104f   e44fe2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1059   e44fec:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
105d   e44ff0:	0f 85 97 12 00 00    	jne    e4628d <__btrfs_map_block+0x22fa>
1063   e44ff6:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
106b   e44ffe:	48 8b 80 18 1b 00 00 	mov    0x1b18(%rax),%rax
1072   e45005:	48 8d 78 78          	lea    0x78(%rax),%rdi
1076   e45009:	48 89 f9             	mov    %rdi,%rcx
1079   e4500c:	48 c1 e9 03          	shr    $0x3,%rcx
107d   e45010:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1087   e4501a:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
108b   e4501e:	0f 85 2f 12 00 00    	jne    e46253 <__btrfs_map_block+0x22c0>
1091   e45024:	48 8b 40 78          	mov    0x78(%rax),%rax
1095   e45028:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
109a   e4502d:	48 89 da             	mov    %rbx,%rdx
109d   e45030:	48 c1 ea 03          	shr    $0x3,%rdx
10a1   e45034:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
10ab   e4503e:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
10af   e45042:	0f 85 de 11 00 00    	jne    e46226 <__btrfs_map_block+0x2293>
10b5   e45048:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
10bd   e45050:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
10c5   e45058:	48 8b 03             	mov    (%rbx),%rax
10c8   e4505b:	48 89 84 24 60 01 00 00 	mov    %rax,0x160(%rsp)
10d0   e45063:	48 c7 84 24 80 01 00 00 00 00 00 00 	movq   $0x0,0x180(%rsp)
10dc   e4506f:	48 8d 8c 24 60 01 00 00 	lea    0x160(%rsp),%rcx
10e4   e45077:	c7 44 24 08 00 00 00 00 	movl   $0x0,0x8(%rsp)
10ec   e4507f:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
10f4   e45087:	45 31 c9             	xor    %r9d,%r9d
10f7   e4508a:	4c 8d 84 24 80 01 00 00 	lea    0x180(%rsp),%r8
10ff   e45092:	48 8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%rdx
1107   e4509a:	be 03 00 00 00       	mov    $0x3,%esi
110c   e4509f:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
1114   e450a7:	e8 e7 ee ff ff       	call   e43f93 <__btrfs_map_block>
1119   e450ac:	89 84 24 a0 00 00 00 	mov    %eax,0xa0(%rsp)
1120   e450b3:	85 c0                	test   %eax,%eax
1122   e450b5:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
112a   e450bd:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
1132   e450c5:	0f 85 47 0a 00 00    	jne    e45b12 <__btrfs_map_block+0x1b7f>
1138   e450cb:	48 8b 84 24 80 01 00 00 	mov    0x180(%rsp),%rax
1140   e450d3:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
1148   e450db:	48 8d 78 28          	lea    0x28(%rax),%rdi
114c   e450df:	48 89 fa             	mov    %rdi,%rdx
114f   e450e2:	48 c1 ea 03          	shr    $0x3,%rdx
1153   e450e6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
115d   e450f0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
1161   e450f4:	84 c0                	test   %al,%al
1163   e450f6:	74 08                	je     e45100 <__btrfs_map_block+0x116d>
1165   e450f8:	3c 03                	cmp    $0x3,%al
1167   e450fa:	0f 8e b7 11 00 00    	jle    e462b7 <__btrfs_map_block+0x2324>
116d   e45100:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
1175   e45108:	8b 40 28             	mov    0x28(%rax),%eax
1178   e4510b:	89 c7                	mov    %eax,%edi
117a   e4510d:	39 84 24 c0 00 00 00 	cmp    %eax,0xc0(%rsp)
1181   e45114:	0f 8f fd 15 00 00    	jg     e46717 <__btrfs_map_block+0x2784>
1187   e4511a:	85 c0                	test   %eax,%eax
1189   e4511c:	0f 8e 6b 0c 00 00    	jle    e45d8d <__btrfs_map_block+0x1dfa>
118f   e45122:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
1197   e4512a:	48 83 c0 50          	add    $0x50,%rax
119b   e4512e:	c7 84 24 d0 00 00 00 00 00 00 00 	movl   $0x0,0xd0(%rsp)
11a6   e45139:	31 f6                	xor    %esi,%esi
11a8   e4513b:	31 d2                	xor    %edx,%edx
11aa   e4513d:	31 c9                	xor    %ecx,%ecx
11ac   e4513f:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
11b6   e45149:	4c 89 94 24 c0 00 00 00 	mov    %r10,0xc0(%rsp)
11be   e45151:	4c 89 64 24 60       	mov    %r12,0x60(%rsp)
11c3   e45156:	49 89 c4             	mov    %rax,%r12
11c6   e45159:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
11cb   e4515e:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
11d0   e45163:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
11d5   e45168:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
11da   e4516d:	41 89 d6             	mov    %edx,%r14d
11dd   e45170:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
11e2   e45175:	41 89 f5             	mov    %esi,%r13d
11e5   e45178:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
11ea   e4517d:	41 89 ff             	mov    %edi,%r15d
11ed   e45180:	49 8d 7c 24 f8       	lea    -0x8(%r12),%rdi
11f2   e45185:	48 89 f8             	mov    %rdi,%rax
11f5   e45188:	48 c1 e8 03          	shr    $0x3,%rax
11f9   e4518c:	42 80 3c 00 00       	cmpb   $0x0,(%rax,%r8,1)
11fe   e45191:	0f 85 78 0f 00 00    	jne    e4610f <__btrfs_map_block+0x217c>
1204   e45197:	49 8b 44 24 f8       	mov    -0x8(%r12),%rax
1209   e4519c:	48 8d 78 78          	lea    0x78(%rax),%rdi
120d   e451a0:	49 89 fb             	mov    %rdi,%r11
1210   e451a3:	49 c1 eb 03          	shr    $0x3,%r11
1214   e451a7:	43 80 3c 03 00       	cmpb   $0x0,(%r11,%r8,1)
1219   e451ac:	0f 85 35 0f 00 00    	jne    e460e7 <__btrfs_map_block+0x2154>
121f   e451b2:	48 3b 58 78          	cmp    0x78(%rax),%rbx
1223   e451b6:	75 41                	jne    e451f9 <__btrfs_map_block+0x1266>
1225   e451b8:	45 85 ed             	test   %r13d,%r13d
1228   e451bb:	74 18                	je     e451d5 <__btrfs_map_block+0x1242>
122a   e451bd:	4c 89 e0             	mov    %r12,%rax
122d   e451c0:	48 c1 e8 03          	shr    $0x3,%rax
1231   e451c4:	42 80 3c 00 00       	cmpb   $0x0,(%rax,%r8,1)
1236   e451c9:	0f 85 36 10 00 00    	jne    e46205 <__btrfs_map_block+0x2272>
123c   e451cf:	49 39 0c 24          	cmp    %rcx,(%r12)
1240   e451d3:	73 24                	jae    e451f9 <__btrfs_map_block+0x1266>
1242   e451d5:	4c 89 e0             	mov    %r12,%rax
1245   e451d8:	48 c1 e8 03          	shr    $0x3,%rax
1249   e451dc:	42 80 3c 00 00       	cmpb   $0x0,(%rax,%r8,1)
124e   e451e1:	0f 85 26 16 00 00    	jne    e4680d <__btrfs_map_block+0x287a>
1254   e451e7:	49 8b 0c 24          	mov    (%r12),%rcx
1258   e451eb:	44 89 b4 24 d0 00 00 00 	mov    %r14d,0xd0(%rsp)
1260   e451f3:	41 bd 01 00 00 00    	mov    $0x1,%r13d
1266   e451f9:	41 83 c6 01          	add    $0x1,%r14d
126a   e451fd:	49 83 c4 10          	add    $0x10,%r12
126e   e45201:	45 39 f7             	cmp    %r14d,%r15d
1271   e45204:	0f 85 76 ff ff ff    	jne    e45180 <__btrfs_map_block+0x11ed>
1277   e4520a:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
127c   e4520f:	44 89 6c 24 68       	mov    %r13d,0x68(%rsp)
1281   e45214:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
1286   e45219:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
128b   e4521e:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
1290   e45223:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
1295   e45228:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
129a   e4522d:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
129f   e45232:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
12a4   e45237:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
12ac   e4523f:	e8 00 00 00 00       	call   e45244 <__btrfs_map_block+0x12b1>	e45240: R_X86_64_PLT32	btrfs_put_bioc-0x4
12b1   e45244:	8b 44 24 68          	mov    0x68(%rsp),%eax
12b5   e45248:	85 c0                	test   %eax,%eax
12b7   e4524a:	4c 8b 94 24 c0 00 00 00 	mov    0xc0(%rsp),%r10
12bf   e45252:	4c 8b 5c 24 60       	mov    0x60(%rsp),%r11
12c4   e45257:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
12c9   e4525c:	0f 84 38 0b 00 00    	je     e45d9a <__btrfs_map_block+0x1e07>
12cf   e45262:	c7 84 24 20 01 00 00 01 00 00 00 	movl   $0x1,0x120(%rsp)
12da   e4526d:	4c 89 e2             	mov    %r12,%rdx
12dd   e45270:	48 c1 ea 03          	shr    $0x3,%rdx
12e1   e45274:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
12eb   e4527e:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
12ef   e45282:	0f 85 61 11 00 00    	jne    e463e9 <__btrfs_map_block+0x2456>
12f5   e45288:	49 8b 04 24          	mov    (%r12),%rax
12f9   e4528c:	a8 08                	test   $0x8,%al
12fb   e4528e:	0f 85 eb 08 00 00    	jne    e45b7f <__btrfs_map_block+0x1bec>
1301   e45294:	8b b4 24 d0 00 00 00 	mov    0xd0(%rsp),%esi
1308   e4529b:	83 c6 01             	add    $0x1,%esi
130b   e4529e:	89 b4 24 c0 00 00 00 	mov    %esi,0xc0(%rsp)
1312   e452a5:	a9 10 06 00 00       	test   $0x610,%eax
1317   e452aa:	0f 85 c8 f9 ff ff    	jne    e44c78 <__btrfs_map_block+0xce5>
131d   e452b0:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
1322   e452b5:	e9 5b f7 ff ff       	jmp    e44a15 <__btrfs_map_block+0xa82>
1327   e452ba:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
132f   e452c2:	48 81 c7 28 1c 00 00 	add    $0x1c28,%rdi
1336   e452c9:	be ff ff ff ff       	mov    $0xffffffff,%esi
133b   e452ce:	e8 00 00 00 00       	call   e452d3 <__btrfs_map_block+0x1340>	e452cf: R_X86_64_PLT32	lock_is_held_type-0x4
1340   e452d3:	85 c0                	test   %eax,%eax
1342   e452d5:	0f 85 99 f6 ff ff    	jne    e44974 <__btrfs_map_block+0x9e1>
1348   e452db:	90                   	nop
1349   e452dc:	0f 0b                	ud2
134b   e452de:	90                   	nop
134c   e452df:	e9 90 f6 ff ff       	jmp    e44974 <__btrfs_map_block+0x9e1>
1351   e452e4:	45 31 ed             	xor    %r13d,%r13d
1354   e452e7:	e9 01 f9 ff ff       	jmp    e44bed <__btrfs_map_block+0xc5a>
1359   e452ec:	45 85 c9             	test   %r9d,%r9d
135c   e452ef:	90                   	nop
135d   e452f0:	0f 84 b4 f3 ff ff    	je     e446aa <__btrfs_map_block+0x717>
1363   e452f6:	45 85 db             	test   %r11d,%r11d
1366   e452f9:	0f 8e ab f3 ff ff    	jle    e446aa <__btrfs_map_block+0x717>
136c   e452ff:	45 31 c9             	xor    %r9d,%r9d
136f   e45302:	45 31 ff             	xor    %r15d,%r15d
1372   e45305:	e9 58 fb ff ff       	jmp    e44e62 <__btrfs_map_block+0xecf>
1377   e4530a:	45 31 c9             	xor    %r9d,%r9d
137a   e4530d:	45 31 ff             	xor    %r15d,%r15d
137d   e45310:	e9 44 fb ff ff       	jmp    e44e59 <__btrfs_map_block+0xec6>
1382   e45315:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
1387   e4531a:	e8 00 00 00 00       	call   e4531f <__btrfs_map_block+0x138c>	e4531b: R_X86_64_PLT32	up_read-0x4
138c   e4531f:	48 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%rsi
1394   e45327:	48 89 f2             	mov    %rsi,%rdx
1397   e4532a:	48 c1 ea 03          	shr    $0x3,%rdx
139b   e4532e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
13a5   e45338:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
13a9   e4533c:	48 89 f0             	mov    %rsi,%rax
13ac   e4533f:	83 e0 07             	and    $0x7,%eax
13af   e45342:	83 c0 03             	add    $0x3,%eax
13b2   e45345:	38 d0                	cmp    %dl,%al
13b4   e45347:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
13bc   e4534f:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
13c4   e45357:	7c 08                	jl     e45361 <__btrfs_map_block+0x13ce>
13c6   e45359:	84 d2                	test   %dl,%dl
13c8   e4535b:	0f 85 33 11 00 00    	jne    e46494 <__btrfs_map_block+0x2501>
13ce   e45361:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
13d3   e45366:	e9 e1 ef ff ff       	jmp    e4434c <__btrfs_map_block+0x3b9>
13d8   e4536b:	4c 89 e6             	mov    %r12,%rsi
13db   e4536e:	48 c1 ee 03          	shr    $0x3,%rsi
13df   e45372:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
13e9   e4537c:	80 3c 0e 00          	cmpb   $0x0,(%rsi,%rcx,1)
13ed   e45380:	0f 85 d7 10 00 00    	jne    e4645d <__btrfs_map_block+0x24ca>
13f3   e45386:	49 f7 04 24 80 01 00 00 	testq  $0x180,(%r12)
13fb   e4538e:	74 0e                	je     e4539e <__btrfs_map_block+0x140b>
13fd   e45390:	83 bc 24 c0 00 00 00 01 	cmpl   $0x1,0xc0(%rsp)
1405   e45398:	0f 8f cd f0 ff ff    	jg     e4446b <__btrfs_map_block+0x4d8>
140b   e4539e:	8b 8c 24 e0 00 00 00 	mov    0xe0(%rsp),%ecx
1412   e453a5:	83 e1 fd             	and    $0xfffffffd,%ecx
1415   e453a8:	83 f9 01             	cmp    $0x1,%ecx
1418   e453ab:	0f 84 68 01 00 00    	je     e45519 <__btrfs_map_block+0x1586>
141e   e453b1:	8b 44 24 68          	mov    0x68(%rsp),%eax
1422   e453b5:	85 c0                	test   %eax,%eax
1424   e453b7:	0f 85 bf 04 00 00    	jne    e4587c <__btrfs_map_block+0x18e9>
142a   e453bd:	89 d3                	mov    %edx,%ebx
142c   e453bf:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1430   e453c3:	48 c1 e7 04          	shl    $0x4,%rdi
1434   e453c7:	4c 01 e7             	add    %r12,%rdi
1437   e453ca:	48 89 fa             	mov    %rdi,%rdx
143a   e453cd:	48 c1 ea 03          	shr    $0x3,%rdx
143e   e453d1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1448   e453db:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
144c   e453df:	0f 85 23 0f 00 00    	jne    e46308 <__btrfs_map_block+0x2375>
1452   e453e5:	49 89 df             	mov    %rbx,%r15
1455   e453e8:	49 c1 e7 04          	shl    $0x4,%r15
1459   e453ec:	4d 01 e7             	add    %r12,%r15
145c   e453ef:	49 8b 47 20          	mov    0x20(%r15),%rax
1460   e453f3:	4c 89 f1             	mov    %r14,%rcx
1463   e453f6:	48 c1 e9 03          	shr    $0x3,%rcx
1467   e453fa:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1471   e45404:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
1475   e45408:	0f 85 e6 10 00 00    	jne    e464f4 <__btrfs_map_block+0x2561>
147b   e4540e:	49 89 06             	mov    %rax,(%r14)
147e   e45411:	48 8d 53 02          	lea    0x2(%rbx),%rdx
1482   e45415:	48 c1 e2 04          	shl    $0x4,%rdx
1486   e45419:	49 8d 7c 14 08       	lea    0x8(%r12,%rdx,1),%rdi
148b   e4541e:	48 89 fa             	mov    %rdi,%rdx
148e   e45421:	48 c1 ea 03          	shr    $0x3,%rdx
1492   e45425:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
149c   e4542f:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
14a0   e45433:	0f 85 91 10 00 00    	jne    e464ca <__btrfs_map_block+0x2537>
14a6   e45439:	4d 8b 7f 28          	mov    0x28(%r15),%r15
14aa   e4543d:	49 8d 7c 24 10       	lea    0x10(%r12),%rdi
14af   e45442:	48 89 fa             	mov    %rdi,%rdx
14b2   e45445:	48 c1 ea 03          	shr    $0x3,%rdx
14b6   e45449:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
14c0   e45453:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
14c4   e45457:	84 c0                	test   %al,%al
14c6   e45459:	74 08                	je     e45463 <__btrfs_map_block+0x14d0>
14c8   e4545b:	3c 03                	cmp    $0x3,%al
14ca   e4545d:	0f 8e cf 0e 00 00    	jle    e46332 <__btrfs_map_block+0x239f>
14d0   e45463:	41 8b 5c 24 10       	mov    0x10(%r12),%ebx
14d5   e45468:	49 0f af db          	imul   %r11,%rbx
14d9   e4546c:	4c 01 fb             	add    %r15,%rbx
14dc   e4546f:	4c 01 d3             	add    %r10,%rbx
14df   e45472:	49 8d 7e 08          	lea    0x8(%r14),%rdi
14e3   e45476:	48 89 fa             	mov    %rdi,%rdx
14e6   e45479:	48 c1 ea 03          	shr    $0x3,%rdx
14ea   e4547d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
14f4   e45487:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
14f8   e4548b:	0f 85 20 10 00 00    	jne    e464b1 <__btrfs_map_block+0x251e>
14fe   e45491:	49 89 5e 08          	mov    %rbx,0x8(%r14)
1502   e45495:	4c 89 ea             	mov    %r13,%rdx
1505   e45498:	48 c1 ea 03          	shr    $0x3,%rdx
1509   e4549c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1513   e454a6:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
1517   e454aa:	4c 89 e8             	mov    %r13,%rax
151a   e454ad:	83 e0 07             	and    $0x7,%eax
151d   e454b0:	83 c0 03             	add    $0x3,%eax
1520   e454b3:	38 d0                	cmp    %dl,%al
1522   e454b5:	7c 08                	jl     e454bf <__btrfs_map_block+0x152c>
1524   e454b7:	84 d2                	test   %dl,%dl
1526   e454b9:	0f 85 fc 0f 00 00    	jne    e464bb <__btrfs_map_block+0x2528>
152c   e454bf:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
1533   e454c6:	41 89 45 00          	mov    %eax,0x0(%r13)
1537   e454ca:	48 8b 94 24 b0 00 00 00 	mov    0xb0(%rsp),%rdx
153f   e454d2:	48 c1 ea 03          	shr    $0x3,%rdx
1543   e454d6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
154d   e454e0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
1551   e454e4:	0f 85 0c 0e 00 00    	jne    e462f6 <__btrfs_map_block+0x2363>
1557   e454ea:	48 8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%rax
155f   e454f2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
1566   e454f9:	c7 84 24 a0 00 00 00 00 00 00 00 	movl   $0x0,0xa0(%rsp)
1571   e45504:	e9 22 f4 ff ff       	jmp    e4492b <__btrfs_map_block+0x998>
1576   e45509:	c7 84 24 a0 00 00 00 f4 ff ff ff 	movl   $0xfffffff4,0xa0(%rsp)
1581   e45514:	e9 12 f4 ff ff       	jmp    e4492b <__btrfs_map_block+0x998>
1586   e45519:	44 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%r8d
158e   e45521:	45 85 c0             	test   %r8d,%r8d
1591   e45524:	0f 84 87 fe ff ff    	je     e453b1 <__btrfs_map_block+0x141e>
1597   e4552a:	48 8b 8c 24 e8 00 00 00 	mov    0xe8(%rsp),%rcx
159f   e45532:	4c 8d b9 20 1b 00 00 	lea    0x1b20(%rcx),%r15
15a6   e45539:	4c 89 fe             	mov    %r15,%rsi
15a9   e4553c:	48 c1 ee 03          	shr    $0x3,%rsi
15ad   e45540:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
15b7   e4554a:	80 3c 0e 00          	cmpb   $0x0,(%rsi,%rcx,1)
15bb   e4554e:	0f 85 11 13 00 00    	jne    e46865 <__btrfs_map_block+0x28d2>
15c1   e45554:	48 8b b4 24 e8 00 00 00 	mov    0xe8(%rsp),%rsi
15c9   e4555c:	48 83 be 20 1b 00 00 00 	cmpq   $0x0,0x1b20(%rsi)
15d1   e45564:	0f 85 01 ef ff ff    	jne    e4446b <__btrfs_map_block+0x4d8>
15d7   e4556a:	e9 42 fe ff ff       	jmp    e453b1 <__btrfs_map_block+0x141e>
15dc   e4556f:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
15e4   e45577:	48 89 da             	mov    %rbx,%rdx
15e7   e4557a:	48 c1 ea 03          	shr    $0x3,%rdx
15eb   e4557e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
15f5   e45588:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
15f9   e4558c:	48 89 d8             	mov    %rbx,%rax
15fc   e4558f:	83 e0 07             	and    $0x7,%eax
15ff   e45592:	83 c0 03             	add    $0x3,%eax
1602   e45595:	38 d0                	cmp    %dl,%al
1604   e45597:	7c 2c                	jl     e455c5 <__btrfs_map_block+0x1632>
1606   e45599:	84 d2                	test   %dl,%dl
1608   e4559b:	74 28                	je     e455c5 <__btrfs_map_block+0x1632>
160a   e4559d:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
1612   e455a5:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
161a   e455ad:	48 89 df             	mov    %rbx,%rdi
161d   e455b0:	e8 00 00 00 00       	call   e455b5 <__btrfs_map_block+0x1622>	e455b1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1622   e455b5:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
162a   e455bd:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
1632   e455c5:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
1637   e455ca:	44 89 84 24 20 01 00 00 	mov    %r8d,0x120(%rsp)
163f   e455d2:	48 c7 44 24 60 00 00 00 00 	movq   $0x0,0x60(%rsp)
1648   e455db:	c7 44 24 68 00 00 00 00 	movl   $0x0,0x68(%rsp)
1650   e455e3:	31 d2                	xor    %edx,%edx
1652   e455e5:	e9 ed ed ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1657   e455ea:	a8 40                	test   $0x40,%al
1659   e455ec:	0f 85 4f 03 00 00    	jne    e45941 <__btrfs_map_block+0x19ae>
165f   e455f2:	a9 80 01 00 00       	test   $0x180,%eax
1664   e455f7:	0f 84 9d 04 00 00    	je     e45a9a <__btrfs_map_block+0x1b07>
166a   e455fd:	49 8d 44 24 10       	lea    0x10(%r12),%rax
166f   e45602:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
1677   e4560a:	48 89 c2             	mov    %rax,%rdx
167a   e4560d:	48 c1 ea 03          	shr    $0x3,%rdx
167e   e45611:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1688   e4561b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
168c   e4561f:	84 c0                	test   %al,%al
168e   e45621:	74 08                	je     e4562b <__btrfs_map_block+0x1698>
1690   e45623:	3c 03                	cmp    $0x3,%al
1692   e45625:	0f 8e 89 11 00 00    	jle    e467b4 <__btrfs_map_block+0x2821>
1698   e4562b:	41 81 7c 24 10 00 00 01 00 	cmpl   $0x10000,0x10(%r12)
16a1   e45634:	0f 85 00 00 00 00    	jne    e4563a <__btrfs_map_block+0x16a7>	e45636: R_X86_64_PC32	.text.unlikely+0x802e8
16a7   e4563a:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
16af   e45642:	48 89 ca             	mov    %rcx,%rdx
16b2   e45645:	48 c1 ea 03          	shr    $0x3,%rdx
16b6   e45649:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
16c0   e45653:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
16c4   e45657:	48 89 c8             	mov    %rcx,%rax
16c7   e4565a:	83 e0 07             	and    $0x7,%eax
16ca   e4565d:	83 c0 03             	add    $0x3,%eax
16cd   e45660:	38 d0                	cmp    %dl,%al
16cf   e45662:	7c 08                	jl     e4566c <__btrfs_map_block+0x16d9>
16d1   e45664:	84 d2                	test   %dl,%dl
16d3   e45666:	0f 85 c8 10 00 00    	jne    e46734 <__btrfs_map_block+0x27a1>
16d9   e4566c:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
16de   e45671:	8b 8c 24 e0 00 00 00 	mov    0xe0(%rsp),%ecx
16e5   e45678:	83 e1 fd             	and    $0xfffffffd,%ecx
16e8   e4567b:	8b 45 18             	mov    0x18(%rbp),%eax
16eb   e4567e:	85 c0                	test   %eax,%eax
16ed   e45680:	0f 84 a0 04 00 00    	je     e45b26 <__btrfs_map_block+0x1b93>
16f3   e45686:	83 f9 01             	cmp    $0x1,%ecx
16f6   e45689:	74 0e                	je     e45699 <__btrfs_map_block+0x1706>
16f8   e4568b:	83 bc 24 c0 00 00 00 01 	cmpl   $0x1,0xc0(%rsp)
1700   e45693:	0f 8e 55 08 00 00    	jle    e45eee <__btrfs_map_block+0x1f5b>
1706   e45699:	48 63 44 24 50       	movslq 0x50(%rsp),%rax
170b   e4569e:	8b 54 24 58          	mov    0x58(%rsp),%edx
170f   e456a2:	48 0f af c2          	imul   %rdx,%rax
1713   e456a6:	48 89 c6             	mov    %rax,%rsi
1716   e456a9:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
171e   e456b1:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
1723   e456b6:	31 d2                	xor    %edx,%edx
1725   e456b8:	48 f7 f6             	div    %rsi
1728   e456bb:	49 89 c3             	mov    %rax,%r11
172b   e456be:	44 89 84 24 20 01 00 00 	mov    %r8d,0x120(%rsp)
1733   e456c6:	4c 89 e2             	mov    %r12,%rdx
1736   e456c9:	48 c1 ea 03          	shr    $0x3,%rdx
173a   e456cd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1744   e456d7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
1748   e456db:	0f 85 4c 0a 00 00    	jne    e4612d <__btrfs_map_block+0x219a>
174e   e456e1:	49 8b 14 24          	mov    (%r12),%rdx
1752   e456e5:	81 e2 f8 07 00 00    	and    $0x7f8,%edx
1758   e456eb:	0f 84 82 05 00 00    	je     e45c73 <__btrfs_map_block+0x1ce0>
175e   e456f1:	48 c1 ea 02          	shr    $0x2,%rdx
1762   e456f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
1767   e456fa:	48 0f bd c2          	bsr    %rdx,%rax
176b   e456fe:	4c 63 f8             	movslq %eax,%r15
176e   e45701:	49 83 ff 08          	cmp    $0x8,%r15
1772   e45705:	0f 87 59 0a 00 00    	ja     e46164 <__btrfs_map_block+0x21d1>
1778   e4570b:	4c 89 ff             	mov    %r15,%rdi
177b   e4570e:	48 c1 e7 05          	shl    $0x5,%rdi
177f   e45712:	48 81 c7 00 00 00 00 	add    $0x0,%rdi	e45715: R_X86_64_32S	btrfs_raid_array+0x4
1786   e45719:	48 89 f9             	mov    %rdi,%rcx
1789   e4571c:	48 c1 e9 03          	shr    $0x3,%rcx
178d   e45720:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1797   e4572a:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
179b   e4572e:	48 89 f9             	mov    %rdi,%rcx
179e   e45731:	83 e1 07             	and    $0x7,%ecx
17a1   e45734:	38 ca                	cmp    %cl,%dl
17a3   e45736:	7f 08                	jg     e45740 <__btrfs_map_block+0x17ad>
17a5   e45738:	84 d2                	test   %dl,%dl
17a7   e4573a:	0f 85 0a 0a 00 00    	jne    e4614a <__btrfs_map_block+0x21b7>
17ad   e45740:	4c 89 f8             	mov    %r15,%rax
17b0   e45743:	48 c1 e0 05          	shl    $0x5,%rax
17b4   e45747:	0f b6 80 00 00 00 00 	movzbl 0x0(%rax),%eax	e4574a: R_X86_64_32S	btrfs_raid_array+0x4
17bb   e4574e:	89 84 24 30 01 00 00 	mov    %eax,0x130(%rsp)
17c2   e45755:	48 89 da             	mov    %rbx,%rdx
17c5   e45758:	48 c1 ea 03          	shr    $0x3,%rdx
17c9   e4575c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
17d3   e45766:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
17d7   e4576a:	0f 85 6e 0a 00 00    	jne    e461de <__btrfs_map_block+0x224b>
17dd   e45770:	48 8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%rdx
17e5   e45778:	48 03 13             	add    (%rbx),%rdx
17e8   e4577b:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
17f0   e45783:	48 83 c0 18          	add    $0x18,%rax
17f4   e45787:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
17f9   e4578c:	48 c1 e8 03          	shr    $0x3,%rax
17fd   e45790:	48 89 c1             	mov    %rax,%rcx
1800   e45793:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
180a   e4579d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
180e   e457a1:	0f 85 0e 0a 00 00    	jne    e461b5 <__btrfs_map_block+0x2222>
1814   e457a7:	48 8b b4 24 c8 00 00 00 	mov    0xc8(%rsp),%rsi
181c   e457af:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
1821   e457b4:	48 03 46 18          	add    0x18(%rsi),%rax
1825   e457b8:	48 03 84 24 d0 00 00 00 	add    0xd0(%rsp),%rax
182d   e457c0:	48 39 d0             	cmp    %rdx,%rax
1830   e457c3:	48 0f 47 c2          	cmova  %rdx,%rax
1834   e457c7:	48 2b 84 24 b8 00 00 00 	sub    0xb8(%rsp),%rax
183c   e457cf:	48 89 03             	mov    %rax,(%rbx)
183f   e457d2:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
1844   e457d7:	45 31 d2             	xor    %r10d,%r10d
1847   e457da:	31 d2                	xor    %edx,%edx
1849   e457dc:	e9 f6 eb ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
184e   e457e1:	89 9c 24 a8 00 00 00 	mov    %ebx,0xa8(%rsp)
1855   e457e8:	89 d8                	mov    %ebx,%eax
1857   e457ea:	01 db                	add    %ebx,%ebx
1859   e457ec:	e9 7a ec ff ff       	jmp    e4446b <__btrfs_map_block+0x4d8>
185e   e457f1:	48 8d b4 24 40 01 00 00 	lea    0x140(%rsp),%rsi
1866   e457f9:	4c 8d 8c 24 30 01 00 00 	lea    0x130(%rsp),%r9
186e   e45801:	4c 8d 84 24 20 01 00 00 	lea    0x120(%rsp),%r8
1876   e45809:	48 8b 8c 24 b8 00 00 00 	mov    0xb8(%rsp),%rcx
187e   e45811:	48 8b 94 24 80 00 00 00 	mov    0x80(%rsp),%rdx
1886   e45819:	8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%edi
188d   e45820:	e8 14 63 fe ff       	call   e2bb39 <handle_ops_on_dev_replace>
1892   e45825:	48 8b 9c 24 40 01 00 00 	mov    0x140(%rsp),%rbx
189a   e4582d:	8b 84 24 20 01 00 00 	mov    0x120(%rsp),%eax
18a1   e45834:	89 84 24 a8 00 00 00 	mov    %eax,0xa8(%rsp)
18a8   e4583b:	e9 cd ee ff ff       	jmp    e4470d <__btrfs_map_block+0x77a>
18ad   e45840:	8d 41 01             	lea    0x1(%rcx),%eax
18b0   e45843:	31 d2                	xor    %edx,%edx
18b2   e45845:	f7 b4 24 a8 00 00 00 	divl   0xa8(%rsp)
18b9   e4584c:	48 8b 43 40          	mov    0x40(%rbx),%rax
18bd   e45850:	4c 8d 2c d0          	lea    (%rax,%rdx,8),%r13
18c1   e45854:	4c 89 ea             	mov    %r13,%rdx
18c4   e45857:	48 c1 ea 03          	shr    $0x3,%rdx
18c8   e4585b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
18d2   e45865:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
18d6   e45869:	0f 85 6b 08 00 00    	jne    e460da <__btrfs_map_block+0x2147>
18dc   e4586f:	49 c7 45 00 ff ff ff ff 	movq   $0xffffffffffffffff,0x0(%r13)
18e4   e45877:	e9 c2 f5 ff ff       	jmp    e44e3e <__btrfs_map_block+0xeab>
18e9   e4587c:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
18f1   e45884:	48 8d b8 20 1b 00 00 	lea    0x1b20(%rax),%rdi
18f8   e4588b:	48 89 fa             	mov    %rdi,%rdx
18fb   e4588e:	48 c1 ea 03          	shr    $0x3,%rdx
18ff   e45892:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1909   e4589c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
190d   e458a0:	0f 85 77 11 00 00    	jne    e46a1d <__btrfs_map_block+0x2a8a>
1913   e458a6:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
191b   e458ae:	48 8b 98 20 1b 00 00 	mov    0x1b20(%rax),%rbx
1922   e458b5:	4c 89 f2             	mov    %r14,%rdx
1925   e458b8:	48 c1 ea 03          	shr    $0x3,%rdx
1929   e458bc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1933   e458c6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
1937   e458ca:	0f 85 40 11 00 00    	jne    e46a10 <__btrfs_map_block+0x2a7d>
193d   e458d0:	49 89 1e             	mov    %rbx,(%r14)
1940   e458d3:	49 8d 7e 08          	lea    0x8(%r14),%rdi
1944   e458d7:	48 89 fa             	mov    %rdi,%rdx
1947   e458da:	48 c1 ea 03          	shr    $0x3,%rdx
194b   e458de:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1955   e458e8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
1959   e458ec:	0f 85 14 11 00 00    	jne    e46a06 <__btrfs_map_block+0x2a73>
195f   e458f2:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
1964   e458f7:	49 89 46 08          	mov    %rax,0x8(%r14)
1968   e458fb:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1970   e45903:	48 89 da             	mov    %rbx,%rdx
1973   e45906:	48 c1 ea 03          	shr    $0x3,%rdx
1977   e4590a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1981   e45914:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
1985   e45918:	48 89 d8             	mov    %rbx,%rax
1988   e4591b:	83 e0 07             	and    $0x7,%eax
198b   e4591e:	83 c0 03             	add    $0x3,%eax
198e   e45921:	38 d0                	cmp    %dl,%al
1990   e45923:	7c 08                	jl     e4592d <__btrfs_map_block+0x199a>
1992   e45925:	84 d2                	test   %dl,%dl
1994   e45927:	0f 85 fd 10 00 00    	jne    e46a2a <__btrfs_map_block+0x2a97>
199a   e4592d:	41 8b 44 24 14       	mov    0x14(%r12),%eax
199f   e45932:	83 c0 01             	add    $0x1,%eax
19a2   e45935:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
19a9   e4593c:	e9 54 fb ff ff       	jmp    e45495 <__btrfs_map_block+0x1502>
19ae   e45941:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
19b6   e45949:	48 89 da             	mov    %rbx,%rdx
19b9   e4594c:	48 c1 ea 03          	shr    $0x3,%rdx
19bd   e45950:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
19c7   e4595a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
19cb   e4595e:	48 89 d8             	mov    %rbx,%rax
19ce   e45961:	83 e0 07             	and    $0x7,%eax
19d1   e45964:	83 c0 03             	add    $0x3,%eax
19d4   e45967:	38 d0                	cmp    %dl,%al
19d6   e45969:	7c 08                	jl     e45973 <__btrfs_map_block+0x19e0>
19d8   e4596b:	84 d2                	test   %dl,%dl
19da   e4596d:	0f 85 96 0f 00 00    	jne    e46909 <__btrfs_map_block+0x2976>
19e0   e45973:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
19e5   e45978:	49 8d 7c 24 18       	lea    0x18(%r12),%rdi
19ea   e4597d:	48 89 fa             	mov    %rdi,%rdx
19ed   e45980:	48 c1 ea 03          	shr    $0x3,%rdx
19f1   e45984:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
19fb   e4598e:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
19ff   e45992:	84 c0                	test   %al,%al
1a01   e45994:	74 08                	je     e4599e <__btrfs_map_block+0x1a0b>
1a03   e45996:	3c 03                	cmp    $0x3,%al
1a05   e45998:	0f 8e 37 0f 00 00    	jle    e468d5 <__btrfs_map_block+0x2942>
1a0b   e4599e:	41 8b 4c 24 18       	mov    0x18(%r12),%ecx
1a10   e459a3:	44 89 c0             	mov    %r8d,%eax
1a13   e459a6:	99                   	cltd
1a14   e459a7:	f7 f9                	idiv   %ecx
1a16   e459a9:	48 89 c6             	mov    %rax,%rsi
1a19   e459ac:	4c 89 d8             	mov    %r11,%rax
1a1c   e459af:	31 d2                	xor    %edx,%edx
1a1e   e459b1:	48 f7 f6             	div    %rsi
1a21   e459b4:	49 89 c3             	mov    %rax,%r11
1a24   e459b7:	0f af d1             	imul   %ecx,%edx
1a27   e459ba:	8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%eax
1a2e   e459c1:	83 e0 fd             	and    $0xfffffffd,%eax
1a31   e459c4:	83 f8 01             	cmp    $0x1,%eax
1a34   e459c7:	0f 84 21 01 00 00    	je     e45aee <__btrfs_map_block+0x1b5b>
1a3a   e459cd:	8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%ecx
1a41   e459d4:	85 c9                	test   %ecx,%ecx
1a43   e459d6:	0f 84 0c 02 00 00    	je     e45be8 <__btrfs_map_block+0x1c55>
1a49   e459dc:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
1a50   e459e3:	8d 54 10 ff          	lea    -0x1(%rax,%rdx,1),%edx
1a54   e459e7:	e9 eb e9 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1a59   e459ec:	44 89 84 24 20 01 00 00 	mov    %r8d,0x120(%rsp)
1a61   e459f4:	31 d2                	xor    %edx,%edx
1a63   e459f6:	e9 dc e9 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1a68   e459fb:	4c 89 9c 24 c0 00 00 00 	mov    %r11,0xc0(%rsp)
1a70   e45a03:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
1a78   e45a0b:	8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%ecx
1a7f   e45a12:	31 d2                	xor    %edx,%edx
1a81   e45a14:	4c 89 e6             	mov    %r12,%rsi
1a84   e45a17:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
1a8c   e45a1f:	e8 71 6d fe ff       	call   e2c795 <find_live_mirror>
1a91   e45a24:	89 c2                	mov    %eax,%edx
1a93   e45a26:	8d 58 01             	lea    0x1(%rax),%ebx
1a96   e45a29:	48 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%rsi
1a9e   e45a31:	48 89 f1             	mov    %rsi,%rcx
1aa1   e45a34:	48 c1 e9 03          	shr    $0x3,%rcx
1aa5   e45a38:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1aaf   e45a42:	0f b6 0c 01          	movzbl (%rcx,%rax,1),%ecx
1ab3   e45a46:	48 89 f0             	mov    %rsi,%rax
1ab6   e45a49:	83 e0 07             	and    $0x7,%eax
1ab9   e45a4c:	83 c0 03             	add    $0x3,%eax
1abc   e45a4f:	38 c8                	cmp    %cl,%al
1abe   e45a51:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
1ac6   e45a59:	4c 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%r11
1ace   e45a61:	7c 08                	jl     e45a6b <__btrfs_map_block+0x1ad8>
1ad0   e45a63:	84 c9                	test   %cl,%cl
1ad2   e45a65:	0f 85 2a 0f 00 00    	jne    e46995 <__btrfs_map_block+0x2a02>
1ad8   e45a6b:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
1add   e45a70:	48 c7 44 24 60 00 00 00 00 	movq   $0x0,0x60(%rsp)
1ae6   e45a79:	c7 44 24 68 00 00 00 00 	movl   $0x0,0x68(%rsp)
1aee   e45a81:	89 9c 24 c0 00 00 00 	mov    %ebx,0xc0(%rsp)
1af5   e45a88:	e9 4a e9 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1afa   e45a8d:	4c 89 ef             	mov    %r13,%rdi
1afd   e45a90:	e8 00 00 00 00       	call   e45a95 <__btrfs_map_block+0x1b02>	e45a91: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1b02   e45a95:	e9 f7 e5 ff ff       	jmp    e44091 <__btrfs_map_block+0xfe>
1b07   e45a9a:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1b0f   e45aa2:	48 89 da             	mov    %rbx,%rdx
1b12   e45aa5:	48 c1 ea 03          	shr    $0x3,%rdx
1b16   e45aa9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1b20   e45ab3:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
1b24   e45ab7:	48 89 d8             	mov    %rbx,%rax
1b27   e45aba:	83 e0 07             	and    $0x7,%eax
1b2a   e45abd:	83 c0 03             	add    $0x3,%eax
1b2d   e45ac0:	38 d0                	cmp    %dl,%al
1b2f   e45ac2:	7c 08                	jl     e45acc <__btrfs_map_block+0x1b39>
1b31   e45ac4:	84 d2                	test   %dl,%dl
1b33   e45ac6:	0f 85 14 0d 00 00    	jne    e467e0 <__btrfs_map_block+0x284d>
1b39   e45acc:	41 8b 5c 24 14       	mov    0x14(%r12),%ebx
1b3e   e45ad1:	49 89 d8             	mov    %rbx,%r8
1b41   e45ad4:	4c 89 d8             	mov    %r11,%rax
1b44   e45ad7:	31 d2                	xor    %edx,%edx
1b46   e45ad9:	48 f7 f3             	div    %rbx
1b49   e45adc:	49 89 c3             	mov    %rax,%r11
1b4c   e45adf:	8d 42 01             	lea    0x1(%rdx),%eax
1b4f   e45ae2:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
1b56   e45ae9:	e9 e9 e8 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1b5b   e45aee:	89 8c 24 20 01 00 00 	mov    %ecx,0x120(%rsp)
1b62   e45af5:	e9 dd e8 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1b67   e45afa:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
1b6e   e45b01:	8d 50 ff             	lea    -0x1(%rax),%edx
1b71   e45b04:	e9 ce e8 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1b76   e45b09:	90                   	nop
1b77   e45b0a:	0f 0b                	ud2
1b79   e45b0c:	90                   	nop
1b7a   e45b0d:	e9 3d ed ff ff       	jmp    e4484f <__btrfs_map_block+0x8bc>
1b7f   e45b12:	48 83 bc 24 80 01 00 00 00 	cmpq   $0x0,0x180(%rsp)
1b88   e45b1b:	0f 84 17 ee ff ff    	je     e44938 <__btrfs_map_block+0x9a5>
1b8e   e45b21:	e9 00 00 00 00       	jmp    e45b26 <__btrfs_map_block+0x1b93>	e45b22: R_X86_64_PC32	.text.unlikely+0x803a3
1b93   e45b26:	8b 74 24 50          	mov    0x50(%rsp),%esi
1b97   e45b2a:	4c 89 d8             	mov    %r11,%rax
1b9a   e45b2d:	31 d2                	xor    %edx,%edx
1b9c   e45b2f:	48 f7 f6             	div    %rsi
1b9f   e45b32:	49 89 c3             	mov    %rax,%r11
1ba2   e45b35:	83 bc 24 c0 00 00 00 01 	cmpl   $0x1,0xc0(%rsp)
1baa   e45b3d:	7e 0f                	jle    e45b4e <__btrfs_map_block+0x1bbb>
1bac   e45b3f:	8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%ebx
1bb3   e45b46:	8b 74 24 50          	mov    0x50(%rsp),%esi
1bb7   e45b4a:	8d 54 33 fe          	lea    -0x2(%rbx,%rsi,1),%edx
1bbb   e45b4e:	48 01 d0             	add    %rdx,%rax
1bbe   e45b51:	44 89 c6             	mov    %r8d,%esi
1bc1   e45b54:	31 d2                	xor    %edx,%edx
1bc3   e45b56:	48 f7 f6             	div    %rsi
1bc6   e45b59:	83 f9 01             	cmp    $0x1,%ecx
1bc9   e45b5c:	0f 84 75 e8 ff ff    	je     e443d7 <__btrfs_map_block+0x444>
1bcf   e45b62:	8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%ebx
1bd6   e45b69:	85 db                	test   %ebx,%ebx
1bd8   e45b6b:	b8 01 00 00 00       	mov    $0x1,%eax
1bdd   e45b70:	0f 4f c3             	cmovg  %ebx,%eax
1be0   e45b73:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
1be7   e45b7a:	e9 58 e8 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1bec   e45b7f:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1bf4   e45b87:	48 89 da             	mov    %rbx,%rdx
1bf7   e45b8a:	48 c1 ea 03          	shr    $0x3,%rdx
1bfb   e45b8e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1c05   e45b98:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
1c09   e45b9c:	48 89 d8             	mov    %rbx,%rax
1c0c   e45b9f:	83 e0 07             	and    $0x7,%eax
1c0f   e45ba2:	83 c0 03             	add    $0x3,%eax
1c12   e45ba5:	38 d0                	cmp    %dl,%al
1c14   e45ba7:	7c 08                	jl     e45bb1 <__btrfs_map_block+0x1c1e>
1c16   e45ba9:	84 d2                	test   %dl,%dl
1c18   e45bab:	0f 85 6f 08 00 00    	jne    e46420 <__btrfs_map_block+0x248d>
1c1e   e45bb1:	41 8b 5c 24 14       	mov    0x14(%r12),%ebx
1c23   e45bb6:	49 89 d8             	mov    %rbx,%r8
1c26   e45bb9:	4c 89 d8             	mov    %r11,%rax
1c29   e45bbc:	31 d2                	xor    %edx,%edx
1c2b   e45bbe:	48 f7 f3             	div    %rbx
1c2e   e45bc1:	49 89 c3             	mov    %rax,%r11
1c31   e45bc4:	39 d3                	cmp    %edx,%ebx
1c33   e45bc6:	0f 86 00 00 00 00    	jbe    e45bcc <__btrfs_map_block+0x1c39>	e45bc8: R_X86_64_PC32	.text.unlikely+0x8037c
1c39   e45bcc:	8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%ebx
1c40   e45bd3:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
1c45   e45bd8:	8b 44 24 68          	mov    0x68(%rsp),%eax
1c49   e45bdc:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
1c50   e45be3:	e9 19 e8 ff ff       	jmp    e44401 <__btrfs_map_block+0x46e>
1c55   e45be8:	4c 89 5c 24 78       	mov    %r11,0x78(%rsp)
1c5a   e45bed:	4c 89 94 24 a8 00 00 00 	mov    %r10,0xa8(%rsp)
1c62   e45bf5:	8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%ecx
1c69   e45bfc:	89 94 24 d0 00 00 00 	mov    %edx,0xd0(%rsp)
1c70   e45c03:	4c 89 e6             	mov    %r12,%rsi
1c73   e45c06:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
1c7b   e45c0e:	e8 82 6b fe ff       	call   e2c795 <find_live_mirror>
1c80   e45c13:	89 c3                	mov    %eax,%ebx
1c82   e45c15:	8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%edx
1c89   e45c1c:	29 d0                	sub    %edx,%eax
1c8b   e45c1e:	83 c0 01             	add    $0x1,%eax
1c8e   e45c21:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
1c95   e45c28:	48 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%rsi
1c9d   e45c30:	48 89 f2             	mov    %rsi,%rdx
1ca0   e45c33:	48 c1 ea 03          	shr    $0x3,%rdx
1ca4   e45c37:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1cae   e45c41:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
1cb2   e45c45:	48 89 f0             	mov    %rsi,%rax
1cb5   e45c48:	83 e0 07             	and    $0x7,%eax
1cb8   e45c4b:	83 c0 03             	add    $0x3,%eax
1cbb   e45c4e:	38 d0                	cmp    %dl,%al
1cbd   e45c50:	4c 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%r10
1cc5   e45c58:	4c 8b 5c 24 78       	mov    0x78(%rsp),%r11
1cca   e45c5d:	7c 08                	jl     e45c67 <__btrfs_map_block+0x1cd4>
1ccc   e45c5f:	84 d2                	test   %dl,%dl
1cce   e45c61:	0f 85 21 05 00 00    	jne    e46188 <__btrfs_map_block+0x21f5>
1cd4   e45c67:	45 8b 44 24 14       	mov    0x14(%r12),%r8d
1cd9   e45c6c:	89 da                	mov    %ebx,%edx
1cdb   e45c6e:	e9 64 e7 ff ff       	jmp    e443d7 <__btrfs_map_block+0x444>
1ce0   e45c73:	31 c0                	xor    %eax,%eax
1ce2   e45c75:	e9 84 fa ff ff       	jmp    e456fe <__btrfs_map_block+0x176b>
1ce7   e45c7a:	89 44 24 28          	mov    %eax,0x28(%rsp)
1ceb   e45c7e:	44 89 44 24 30       	mov    %r8d,0x30(%rsp)
1cf0   e45c83:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
1cf5   e45c88:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
1cfa   e45c8d:	44 89 5c 24 48       	mov    %r11d,0x48(%rsp)
1cff   e45c92:	44 89 4c 24 50       	mov    %r9d,0x50(%rsp)
1d04   e45c97:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
1d0c   e45c9f:	4c 89 ef             	mov    %r13,%rdi
1d0f   e45ca2:	e8 00 00 00 00       	call   e45ca7 <__btrfs_map_block+0x1d14>	e45ca3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d14   e45ca7:	8b 44 24 28          	mov    0x28(%rsp),%eax
1d18   e45cab:	4c 63 44 24 30       	movslq 0x30(%rsp),%r8
1d1d   e45cb0:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
1d22   e45cb5:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
1d27   e45cba:	44 8b 5c 24 48       	mov    0x48(%rsp),%r11d
1d2c   e45cbf:	44 8b 4c 24 50       	mov    0x50(%rsp),%r9d
1d31   e45cc4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d3b   e45cce:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
1d43   e45cd6:	e9 d6 f1 ff ff       	jmp    e44eb1 <__btrfs_map_block+0xf1e>
1d48   e45cdb:	89 44 24 30          	mov    %eax,0x30(%rsp)
1d4c   e45cdf:	44 89 44 24 38       	mov    %r8d,0x38(%rsp)
1d51   e45ce4:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
1d56   e45ce9:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
1d5b   e45cee:	44 89 5c 24 50       	mov    %r11d,0x50(%rsp)
1d60   e45cf3:	44 89 8c 24 d0 00 00 00 	mov    %r9d,0xd0(%rsp)
1d68   e45cfb:	4c 89 f7             	mov    %r14,%rdi
1d6b   e45cfe:	e8 00 00 00 00       	call   e45d03 <__btrfs_map_block+0x1d70>	e45cff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d70   e45d03:	8b 44 24 30          	mov    0x30(%rsp),%eax
1d74   e45d07:	4c 63 44 24 38       	movslq 0x38(%rsp),%r8
1d79   e45d0c:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
1d7e   e45d11:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
1d83   e45d16:	44 8b 5c 24 50       	mov    0x50(%rsp),%r11d
1d88   e45d1b:	44 8b 8c 24 d0 00 00 00 	mov    0xd0(%rsp),%r9d
1d90   e45d23:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d9a   e45d2d:	e9 65 f1 ff ff       	jmp    e44e97 <__btrfs_map_block+0xf04>
1d9f   e45d32:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
1da4   e45d37:	44 89 4c 24 28       	mov    %r9d,0x28(%rsp)
1da9   e45d3c:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
1dae   e45d41:	89 54 24 38          	mov    %edx,0x38(%rsp)
1db2   e45d45:	4c 89 54 24 40       	mov    %r10,0x40(%rsp)
1db7   e45d4a:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
1dbc   e45d4f:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
1dc1   e45d54:	4c 89 ff             	mov    %r15,%rdi
1dc4   e45d57:	e8 00 00 00 00       	call   e45d5c <__btrfs_map_block+0x1dc9>	e45d58: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1dc9   e45d5c:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
1dce   e45d61:	44 8b 4c 24 28       	mov    0x28(%rsp),%r9d
1dd3   e45d66:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
1dd8   e45d6b:	8b 54 24 38          	mov    0x38(%rsp),%edx
1ddc   e45d6f:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
1de1   e45d74:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1deb   e45d7e:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
1df0   e45d83:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
1df5   e45d88:	e9 6d e8 ff ff       	jmp    e445fa <__btrfs_map_block+0x667>
1dfa   e45d8d:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
1e02   e45d95:	e8 00 00 00 00       	call   e45d9a <__btrfs_map_block+0x1e07>	e45d96: R_X86_64_PLT32	btrfs_put_bioc-0x4
1e07   e45d9a:	ba fd 17 00 00       	mov    $0x17fd,%edx
1e0c   e45d9f:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	e45da2: R_X86_64_32S	.rodata+0x2300a0
1e13   e45da6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e45da9: R_X86_64_32S	.rodata+0x232220
1e1a   e45dad:	e8 00 00 00 00       	call   e45db2 <__btrfs_map_block+0x1e1f>	e45dae: R_X86_64_PLT32	btrfs_assertfail-0x4
1e1f   e45db2:	c7 84 24 a0 00 00 00 fb ff ff ff 	movl   $0xfffffffb,0xa0(%rsp)
1e2a   e45dbd:	e9 76 eb ff ff       	jmp    e44938 <__btrfs_map_block+0x9a5>
1e2f   e45dc2:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
1e34   e45dc7:	44 89 4c 24 30       	mov    %r9d,0x30(%rsp)
1e39   e45dcc:	4c 89 5c 24 38       	mov    %r11,0x38(%rsp)
1e3e   e45dd1:	89 54 24 40          	mov    %edx,0x40(%rsp)
1e42   e45dd5:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
1e47   e45dda:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
1e4c   e45ddf:	e8 00 00 00 00       	call   e45de4 <__btrfs_map_block+0x1e51>	e45de0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e51   e45de4:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
1e56   e45de9:	44 8b 4c 24 30       	mov    0x30(%rsp),%r9d
1e5b   e45dee:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
1e60   e45df3:	8b 54 24 40          	mov    0x40(%rsp),%edx
1e64   e45df7:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
1e69   e45dfc:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1e73   e45e06:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
1e78   e45e0b:	e9 0b e8 ff ff       	jmp    e4461b <__btrfs_map_block+0x688>
1e7d   e45e10:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
1e82   e45e15:	44 89 4c 24 30       	mov    %r9d,0x30(%rsp)
1e87   e45e1a:	4c 89 5c 24 38       	mov    %r11,0x38(%rsp)
1e8c   e45e1f:	89 54 24 40          	mov    %edx,0x40(%rsp)
1e90   e45e23:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
1e95   e45e28:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
1e9a   e45e2d:	48 8b bc 24 d0 00 00 00 	mov    0xd0(%rsp),%rdi
1ea2   e45e35:	e8 00 00 00 00       	call   e45e3a <__btrfs_map_block+0x1ea7>	e45e36: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1ea7   e45e3a:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
1eac   e45e3f:	44 8b 4c 24 30       	mov    0x30(%rsp),%r9d
1eb1   e45e44:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
1eb6   e45e49:	8b 54 24 40          	mov    0x40(%rsp),%edx
1eba   e45e4d:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
1ebf   e45e52:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1ec9   e45e5c:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
1ece   e45e61:	e9 cc e7 ff ff       	jmp    e44632 <__btrfs_map_block+0x69f>
1ed3   e45e66:	4c 89 44 24 30       	mov    %r8,0x30(%rsp)
1ed8   e45e6b:	44 89 4c 24 38       	mov    %r9d,0x38(%rsp)
1edd   e45e70:	4c 89 5c 24 40       	mov    %r11,0x40(%rsp)
1ee2   e45e75:	89 54 24 48          	mov    %edx,0x48(%rsp)
1ee6   e45e79:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
1eeb   e45e7e:	e8 00 00 00 00       	call   e45e83 <__btrfs_map_block+0x1ef0>	e45e7f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1ef0   e45e83:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
1ef5   e45e88:	44 8b 4c 24 38       	mov    0x38(%rsp),%r9d
1efa   e45e8d:	4c 8b 5c 24 40       	mov    0x40(%rsp),%r11
1eff   e45e92:	8b 54 24 48          	mov    0x48(%rsp),%edx
1f03   e45e96:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
1f08   e45e9b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1f12   e45ea5:	e9 ac e7 ff ff       	jmp    e44656 <__btrfs_map_block+0x6c3>
1f17   e45eaa:	4c 89 44 24 30       	mov    %r8,0x30(%rsp)
1f1c   e45eaf:	44 89 4c 24 38       	mov    %r9d,0x38(%rsp)
1f21   e45eb4:	4c 89 5c 24 40       	mov    %r11,0x40(%rsp)
1f26   e45eb9:	89 54 24 48          	mov    %edx,0x48(%rsp)
1f2a   e45ebd:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
1f2f   e45ec2:	e8 00 00 00 00       	call   e45ec7 <__btrfs_map_block+0x1f34>	e45ec3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f34   e45ec7:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
1f39   e45ecc:	44 8b 4c 24 38       	mov    0x38(%rsp),%r9d
1f3e   e45ed1:	4c 8b 5c 24 40       	mov    0x40(%rsp),%r11
1f43   e45ed6:	8b 54 24 48          	mov    0x48(%rsp),%edx
1f47   e45eda:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
1f4c   e45edf:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1f56   e45ee9:	e9 ed e6 ff ff       	jmp    e445db <__btrfs_map_block+0x648>
1f5b   e45eee:	8b 4c 24 50          	mov    0x50(%rsp),%ecx
1f5f   e45ef2:	4c 89 d8             	mov    %r11,%rax
1f62   e45ef5:	31 d2                	xor    %edx,%edx
1f64   e45ef7:	48 f7 f1             	div    %rcx
1f67   e45efa:	49 89 c3             	mov    %rax,%r11
1f6a   e45efd:	48 8d 04 02          	lea    (%rdx,%rax,1),%rax
1f6e   e45f01:	44 89 c1             	mov    %r8d,%ecx
1f71   e45f04:	31 d2                	xor    %edx,%edx
1f73   e45f06:	48 f7 f1             	div    %rcx
1f76   e45f09:	e9 54 fc ff ff       	jmp    e45b62 <__btrfs_map_block+0x1bcf>
1f7b   e45f0e:	89 44 24 38          	mov    %eax,0x38(%rsp)
1f7f   e45f12:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
1f84   e45f17:	44 89 5c 24 48       	mov    %r11d,0x48(%rsp)
1f89   e45f1c:	48 89 d7             	mov    %rdx,%rdi
1f8c   e45f1f:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
1f91   e45f24:	e8 00 00 00 00       	call   e45f29 <__btrfs_map_block+0x1f96>	e45f25: R_X86_64_PLT32	__asan_report_store16_noabort-0x4
1f96   e45f29:	8b 44 24 38          	mov    0x38(%rsp),%eax
1f9a   e45f2d:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
1f9f   e45f32:	44 8b 5c 24 48       	mov    0x48(%rsp),%r11d
1fa4   e45f37:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1fae   e45f41:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
1fb3   e45f46:	e9 d1 ef ff ff       	jmp    e44f1c <__btrfs_map_block+0xf89>
1fb8   e45f4b:	89 44 24 38          	mov    %eax,0x38(%rsp)
1fbc   e45f4f:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
1fc1   e45f54:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
1fc6   e45f59:	44 89 5c 24 50       	mov    %r11d,0x50(%rsp)
1fcb   e45f5e:	4c 89 84 24 d0 00 00 00 	mov    %r8,0xd0(%rsp)
1fd3   e45f66:	e8 00 00 00 00       	call   e45f6b <__btrfs_map_block+0x1fd8>	e45f67: R_X86_64_PLT32	__asan_report_load16_noabort-0x4
1fd8   e45f6b:	8b 44 24 38          	mov    0x38(%rsp),%eax
1fdc   e45f6f:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
1fe1   e45f74:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
1fe6   e45f79:	44 8b 5c 24 50       	mov    0x50(%rsp),%r11d
1feb   e45f7e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1ff5   e45f88:	4c 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%r8
1ffd   e45f90:	e9 42 ef ff ff       	jmp    e44ed7 <__btrfs_map_block+0xf44>
2002   e45f95:	89 44 24 38          	mov    %eax,0x38(%rsp)
2006   e45f99:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
200b   e45f9e:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
2010   e45fa3:	44 89 5c 24 50       	mov    %r11d,0x50(%rsp)
2015   e45fa8:	4c 89 84 24 d0 00 00 00 	mov    %r8,0xd0(%rsp)
201d   e45fb0:	4c 89 ef             	mov    %r13,%rdi
2020   e45fb3:	e8 00 00 00 00       	call   e45fb8 <__btrfs_map_block+0x2025>	e45fb4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2025   e45fb8:	8b 44 24 38          	mov    0x38(%rsp),%eax
2029   e45fbc:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
202e   e45fc1:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
2033   e45fc6:	44 8b 5c 24 50       	mov    0x50(%rsp),%r11d
2038   e45fcb:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2042   e45fd5:	4c 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%r8
204a   e45fdd:	e9 73 ef ff ff       	jmp    e44f55 <__btrfs_map_block+0xfc2>
204f   e45fe2:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
2054   e45fe7:	4c 89 54 24 20       	mov    %r10,0x20(%rsp)
2059   e45fec:	4c 89 5c 24 28       	mov    %r11,0x28(%rsp)
205e   e45ff1:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
2063   e45ff6:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
2067   e45ffa:	48 8b bc 24 d0 00 00 00 	mov    0xd0(%rsp),%rdi
206f   e46002:	e8 00 00 00 00       	call   e46007 <__btrfs_map_block+0x2074>	e46003: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2074   e46007:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
2079   e4600c:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
207e   e46011:	4c 8b 5c 24 28       	mov    0x28(%rsp),%r11
2083   e46016:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
2088   e4601b:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
208c   e4601f:	49 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r9
2096   e46029:	e9 48 ed ff ff       	jmp    e44d76 <__btrfs_map_block+0xde3>
209b   e4602e:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
20a0   e46033:	4c 89 54 24 20       	mov    %r10,0x20(%rsp)
20a5   e46038:	4c 89 5c 24 28       	mov    %r11,0x28(%rsp)
20aa   e4603d:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
20af   e46042:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
20b3   e46046:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
20b8   e4604b:	e8 00 00 00 00       	call   e46050 <__btrfs_map_block+0x20bd>	e4604c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
20bd   e46050:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
20c2   e46055:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
20c7   e4605a:	4c 8b 5c 24 28       	mov    0x28(%rsp),%r11
20cc   e4605f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
20d1   e46064:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
20d5   e46068:	49 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r9
20df   e46072:	e9 e3 ec ff ff       	jmp    e44d5a <__btrfs_map_block+0xdc7>
20e4   e46077:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
20e9   e4607c:	4c 89 54 24 18       	mov    %r10,0x18(%rsp)
20ee   e46081:	4c 89 5c 24 20       	mov    %r11,0x20(%rsp)
20f3   e46086:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
20f8   e4608b:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
20fc   e4608f:	48 89 c7             	mov    %rax,%rdi
20ff   e46092:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
2104   e46097:	e8 00 00 00 00       	call   e4609c <__btrfs_map_block+0x2109>	e46098: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2109   e4609c:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
210e   e460a1:	4c 8b 54 24 18       	mov    0x18(%rsp),%r10
2113   e460a6:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
2118   e460ab:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
211d   e460b0:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
2121   e460b4:	49 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r9
212b   e460be:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
2130   e460c3:	e9 e0 ec ff ff       	jmp    e44da8 <__btrfs_map_block+0xe15>
2135   e460c8:	e8 00 00 00 00       	call   e460cd <__btrfs_map_block+0x213a>	e460c9: R_X86_64_PLT32	__stack_chk_fail-0x4
213a   e460cd:	48 89 df             	mov    %rbx,%rdi
213d   e460d0:	e8 00 00 00 00       	call   e460d5 <__btrfs_map_block+0x2142>	e460d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2142   e460d5:	e9 11 e0 ff ff       	jmp    e440eb <__btrfs_map_block+0x158>
2147   e460da:	4c 89 ef             	mov    %r13,%rdi
214a   e460dd:	e8 00 00 00 00       	call   e460e2 <__btrfs_map_block+0x214f>	e460de: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
214f   e460e2:	e9 88 f7 ff ff       	jmp    e4586f <__btrfs_map_block+0x18dc>
2154   e460e7:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
2159   e460ec:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
215e   e460f1:	e8 00 00 00 00       	call   e460f6 <__btrfs_map_block+0x2163>	e460f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2163   e460f6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
2168   e460fb:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
2172   e46105:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
2177   e4610a:	e9 a3 f0 ff ff       	jmp    e451b2 <__btrfs_map_block+0x121f>
217c   e4610f:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
2181   e46114:	e8 00 00 00 00       	call   e46119 <__btrfs_map_block+0x2186>	e46115: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2186   e46119:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
218b   e4611e:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
2195   e46128:	e9 6a f0 ff ff       	jmp    e45197 <__btrfs_map_block+0x1204>
219a   e4612d:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
21a2   e46135:	4c 89 e7             	mov    %r12,%rdi
21a5   e46138:	e8 00 00 00 00       	call   e4613d <__btrfs_map_block+0x21aa>	e46139: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
21aa   e4613d:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
21b2   e46145:	e9 97 f5 ff ff       	jmp    e456e1 <__btrfs_map_block+0x174e>
21b7   e4614a:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
21bf   e46152:	e8 00 00 00 00       	call   e46157 <__btrfs_map_block+0x21c4>	e46153: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
21c4   e46157:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
21cc   e4615f:	e9 dc f5 ff ff       	jmp    e45740 <__btrfs_map_block+0x17ad>
21d1   e46164:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
21d9   e4616c:	4c 89 fe             	mov    %r15,%rsi
21dc   e4616f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e46172: R_X86_64_32S	.data+0x7f5cc0
21e3   e46176:	e8 00 00 00 00       	call   e4617b <__btrfs_map_block+0x21e8>	e46177: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
21e8   e4617b:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
21f0   e46183:	e9 83 f5 ff ff       	jmp    e4570b <__btrfs_map_block+0x1778>
21f5   e46188:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
21fd   e46190:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2205   e46198:	48 89 f7             	mov    %rsi,%rdi
2208   e4619b:	e8 00 00 00 00       	call   e461a0 <__btrfs_map_block+0x220d>	e4619c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
220d   e461a0:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2215   e461a8:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
221d   e461b0:	e9 b2 fa ff ff       	jmp    e45c67 <__btrfs_map_block+0x1cd4>
2222   e461b5:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
2227   e461ba:	48 89 94 24 a8 00 00 00 	mov    %rdx,0xa8(%rsp)
222f   e461c2:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
2234   e461c7:	e8 00 00 00 00       	call   e461cc <__btrfs_map_block+0x2239>	e461c8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2239   e461cc:	4c 8b 5c 24 58       	mov    0x58(%rsp),%r11
223e   e461d1:	48 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%rdx
2246   e461d9:	e9 c9 f5 ff ff       	jmp    e457a7 <__btrfs_map_block+0x1814>
224b   e461de:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2253   e461e6:	48 89 df             	mov    %rbx,%rdi
2256   e461e9:	e8 00 00 00 00       	call   e461ee <__btrfs_map_block+0x225b>	e461ea: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
225b   e461ee:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2263   e461f6:	e9 75 f5 ff ff       	jmp    e45770 <__btrfs_map_block+0x17dd>
2268   e461fb:	e8 00 00 00 00       	call   e46200 <__btrfs_map_block+0x226d>	e461fc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
226d   e46200:	e9 2a ea ff ff       	jmp    e44c2f <__btrfs_map_block+0xc9c>
2272   e46205:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
2277   e4620a:	4c 89 e7             	mov    %r12,%rdi
227a   e4620d:	e8 00 00 00 00       	call   e46212 <__btrfs_map_block+0x227f>	e4620e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
227f   e46212:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
2284   e46217:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
228e   e46221:	e9 a9 ef ff ff       	jmp    e451cf <__btrfs_map_block+0x123c>
2293   e46226:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
229b   e4622e:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
22a3   e46236:	48 89 df             	mov    %rbx,%rdi
22a6   e46239:	e8 00 00 00 00       	call   e4623e <__btrfs_map_block+0x22ab>	e4623a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
22ab   e4623e:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
22b3   e46246:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
22bb   e4624e:	e9 f5 ed ff ff       	jmp    e45048 <__btrfs_map_block+0x10b5>
22c0   e46253:	4c 89 9c 24 a0 00 00 00 	mov    %r11,0xa0(%rsp)
22c8   e4625b:	4c 89 94 24 a8 00 00 00 	mov    %r10,0xa8(%rsp)
22d0   e46263:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
22d8   e4626b:	e8 00 00 00 00       	call   e46270 <__btrfs_map_block+0x22dd>	e4626c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
22dd   e46270:	4c 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%r11
22e5   e46278:	4c 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%r10
22ed   e46280:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
22f5   e46288:	e9 97 ed ff ff       	jmp    e45024 <__btrfs_map_block+0x1091>
22fa   e4628d:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2302   e46295:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
230a   e4629d:	e8 00 00 00 00       	call   e462a2 <__btrfs_map_block+0x230f>	e4629e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
230f   e462a2:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2317   e462aa:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
231f   e462b2:	e9 3f ed ff ff       	jmp    e44ff6 <__btrfs_map_block+0x1063>
2324   e462b7:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
2329   e462bc:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2331   e462c4:	e8 00 00 00 00       	call   e462c9 <__btrfs_map_block+0x2336>	e462c5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2336   e462c9:	4c 8b 5c 24 60       	mov    0x60(%rsp),%r11
233b   e462ce:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2343   e462d6:	e9 25 ee ff ff       	jmp    e45100 <__btrfs_map_block+0x116d>
2348   e462db:	89 8c 24 d0 00 00 00 	mov    %ecx,0xd0(%rsp)
234f   e462e2:	4c 89 ef             	mov    %r13,%rdi
2352   e462e5:	e8 00 00 00 00       	call   e462ea <__btrfs_map_block+0x2357>	e462e6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2357   e462ea:	8b 8c 24 d0 00 00 00 	mov    0xd0(%rsp),%ecx
235e   e462f1:	e9 32 eb ff ff       	jmp    e44e28 <__btrfs_map_block+0xe95>
2363   e462f6:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
236b   e462fe:	e8 00 00 00 00       	call   e46303 <__btrfs_map_block+0x2370>	e462ff: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2370   e46303:	e9 e2 f1 ff ff       	jmp    e454ea <__btrfs_map_block+0x1557>
2375   e46308:	4c 89 9c 24 e0 00 00 00 	mov    %r11,0xe0(%rsp)
237d   e46310:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2385   e46318:	e8 00 00 00 00       	call   e4631d <__btrfs_map_block+0x238a>	e46319: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
238a   e4631d:	4c 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%r11
2392   e46325:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
239a   e4632d:	e9 b3 f0 ff ff       	jmp    e453e5 <__btrfs_map_block+0x1452>
239f   e46332:	4c 89 9c 24 e0 00 00 00 	mov    %r11,0xe0(%rsp)
23a7   e4633a:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
23af   e46342:	e8 00 00 00 00       	call   e46347 <__btrfs_map_block+0x23b4>	e46343: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
23b4   e46347:	4c 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%r11
23bc   e4634f:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
23c4   e46357:	e9 07 f1 ff ff       	jmp    e45463 <__btrfs_map_block+0x14d0>
23c9   e4635c:	4c 89 5c 24 68       	mov    %r11,0x68(%rsp)
23ce   e46361:	4c 89 94 24 a8 00 00 00 	mov    %r10,0xa8(%rsp)
23d6   e46369:	44 89 84 24 d0 00 00 00 	mov    %r8d,0xd0(%rsp)
23de   e46371:	4c 89 e7             	mov    %r12,%rdi
23e1   e46374:	e8 00 00 00 00       	call   e46379 <__btrfs_map_block+0x23e6>	e46375: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
23e6   e46379:	4c 8b 5c 24 68       	mov    0x68(%rsp),%r11
23eb   e4637e:	4c 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%r10
23f3   e46386:	44 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%r8d
23fb   e4638e:	e9 f4 df ff ff       	jmp    e44387 <__btrfs_map_block+0x3f4>
2400   e46393:	4c 89 9c 24 d0 00 00 00 	mov    %r11,0xd0(%rsp)
2408   e4639b:	4c 89 e7             	mov    %r12,%rdi
240b   e4639e:	e8 00 00 00 00       	call   e463a3 <__btrfs_map_block+0x2410>	e4639f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2410   e463a3:	4c 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%r11
2418   e463ab:	e9 d5 e2 ff ff       	jmp    e44685 <__btrfs_map_block+0x6f2>
241d   e463b0:	4c 89 e7             	mov    %r12,%rdi
2420   e463b3:	e8 00 00 00 00       	call   e463b8 <__btrfs_map_block+0x2425>	e463b4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2425   e463b8:	e9 96 e3 ff ff       	jmp    e44753 <__btrfs_map_block+0x7c0>
242a   e463bd:	0f 1f 00             	nopl   (%rax)
242d   e463c0:	e8 00 00 00 00       	call   e463c5 <__btrfs_map_block+0x2432>	e463c1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2432   e463c5:	e9 ac e3 ff ff       	jmp    e44776 <__btrfs_map_block+0x7e3>
2437   e463ca:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
243f   e463d2:	e8 00 00 00 00       	call   e463d7 <__btrfs_map_block+0x2444>	e463d3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2444   e463d7:	e9 51 e3 ff ff       	jmp    e4472d <__btrfs_map_block+0x79a>
2449   e463dc:	4c 89 ff             	mov    %r15,%rdi
244c   e463df:	e8 00 00 00 00       	call   e463e4 <__btrfs_map_block+0x2451>	e463e0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2451   e463e4:	e9 07 e3 ff ff       	jmp    e446f0 <__btrfs_map_block+0x75d>
2456   e463e9:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
245b   e463ee:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2463   e463f6:	4c 89 94 24 c0 00 00 00 	mov    %r10,0xc0(%rsp)
246b   e463fe:	4c 89 e7             	mov    %r12,%rdi
246e   e46401:	e8 00 00 00 00       	call   e46406 <__btrfs_map_block+0x2473>	e46402: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2473   e46406:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
2478   e4640b:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2480   e46413:	4c 8b 94 24 c0 00 00 00 	mov    0xc0(%rsp),%r10
2488   e4641b:	e9 68 ee ff ff       	jmp    e45288 <__btrfs_map_block+0x12f5>
248d   e46420:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
2495   e46428:	4c 89 9c 24 c0 00 00 00 	mov    %r11,0xc0(%rsp)
249d   e46430:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
24a5   e46438:	48 89 df             	mov    %rbx,%rdi
24a8   e4643b:	e8 00 00 00 00       	call   e46440 <__btrfs_map_block+0x24ad>	e4643c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
24ad   e46440:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
24b5   e46448:	4c 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%r11
24bd   e46450:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
24c5   e46458:	e9 54 f7 ff ff       	jmp    e45bb1 <__btrfs_map_block+0x1c1e>
24ca   e4645d:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
24cf   e46462:	89 54 24 58          	mov    %edx,0x58(%rsp)
24d3   e46466:	89 44 24 78          	mov    %eax,0x78(%rsp)
24d7   e4646a:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
24df   e46472:	4c 89 e7             	mov    %r12,%rdi
24e2   e46475:	e8 00 00 00 00       	call   e4647a <__btrfs_map_block+0x24e7>	e46476: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
24e7   e4647a:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
24ec   e4647f:	8b 54 24 58          	mov    0x58(%rsp),%edx
24f0   e46483:	8b 44 24 78          	mov    0x78(%rsp),%eax
24f4   e46487:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
24fc   e4648f:	e9 f2 ee ff ff       	jmp    e45386 <__btrfs_map_block+0x13f3>
2501   e46494:	48 89 f7             	mov    %rsi,%rdi
2504   e46497:	e8 00 00 00 00       	call   e4649c <__btrfs_map_block+0x2509>	e46498: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2509   e4649c:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2511   e464a4:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2519   e464ac:	e9 b0 ee ff ff       	jmp    e45361 <__btrfs_map_block+0x13ce>
251e   e464b1:	e8 00 00 00 00       	call   e464b6 <__btrfs_map_block+0x2523>	e464b2: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2523   e464b6:	e9 d6 ef ff ff       	jmp    e45491 <__btrfs_map_block+0x14fe>
2528   e464bb:	4c 89 ef             	mov    %r13,%rdi
252b   e464be:	66 90                	xchg   %ax,%ax
252d   e464c0:	e8 00 00 00 00       	call   e464c5 <__btrfs_map_block+0x2532>	e464c1: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2532   e464c5:	e9 f5 ef ff ff       	jmp    e454bf <__btrfs_map_block+0x152c>
2537   e464ca:	4c 89 9c 24 e0 00 00 00 	mov    %r11,0xe0(%rsp)
253f   e464d2:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2547   e464da:	e8 00 00 00 00       	call   e464df <__btrfs_map_block+0x254c>	e464db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
254c   e464df:	4c 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%r11
2554   e464e7:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
255c   e464ef:	e9 45 ef ff ff       	jmp    e45439 <__btrfs_map_block+0x14a6>
2561   e464f4:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
2569   e464fc:	4c 89 9c 24 e0 00 00 00 	mov    %r11,0xe0(%rsp)
2571   e46504:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2579   e4650c:	4c 89 f7             	mov    %r14,%rdi
257c   e4650f:	e8 00 00 00 00       	call   e46514 <__btrfs_map_block+0x2581>	e46510: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2581   e46514:	48 8b 84 24 b8 00 00 00 	mov    0xb8(%rsp),%rax
2589   e4651c:	4c 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%r11
2591   e46524:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2599   e4652c:	e9 dd ee ff ff       	jmp    e4540e <__btrfs_map_block+0x147b>
259e   e46531:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
25a3   e46536:	89 54 24 78          	mov    %edx,0x78(%rsp)
25a7   e4653a:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
25af   e46542:	e8 00 00 00 00       	call   e46547 <__btrfs_map_block+0x25b4>	e46543: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
25b4   e46547:	4c 8b 5c 24 58       	mov    0x58(%rsp),%r11
25b9   e4654c:	8b 54 24 78          	mov    0x78(%rsp),%edx
25bd   e46550:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
25c5   e46558:	e9 a4 df ff ff       	jmp    e44501 <__btrfs_map_block+0x56e>
25ca   e4655d:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
25cf   e46562:	89 54 24 78          	mov    %edx,0x78(%rsp)
25d3   e46566:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
25db   e4656e:	e8 00 00 00 00       	call   e46573 <__btrfs_map_block+0x25e0>	e4656f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
25e0   e46573:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
25e5   e46578:	8b 54 24 78          	mov    0x78(%rsp),%edx
25e9   e4657c:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
25f1   e46584:	e9 b5 df ff ff       	jmp    e4453e <__btrfs_map_block+0x5ab>
25f6   e46589:	48 89 df             	mov    %rbx,%rdi
25f9   e4658c:	e8 00 00 00 00       	call   e46591 <__btrfs_map_block+0x25fe>	e4658d: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
25fe   e46591:	4c 8b 5c 24 58       	mov    0x58(%rsp),%r11
2603   e46596:	8b 54 24 78          	mov    0x78(%rsp),%edx
2607   e4659a:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
260f   e465a2:	e9 35 df ff ff       	jmp    e444dc <__btrfs_map_block+0x549>
2614   e465a7:	4c 89 5c 24 78       	mov    %r11,0x78(%rsp)
2619   e465ac:	89 94 24 a8 00 00 00 	mov    %edx,0xa8(%rsp)
2620   e465b3:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2628   e465bb:	4c 89 ff             	mov    %r15,%rdi
262b   e465be:	e8 00 00 00 00       	call   e465c3 <__btrfs_map_block+0x2630>	e465bf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2630   e465c3:	4c 8b 5c 24 78       	mov    0x78(%rsp),%r11
2635   e465c8:	8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%edx
263c   e465cf:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2644   e465d7:	e9 40 de ff ff       	jmp    e4441c <__btrfs_map_block+0x489>
2649   e465dc:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2651   e465e4:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2659   e465ec:	48 89 cf             	mov    %rcx,%rdi
265c   e465ef:	e8 00 00 00 00       	call   e465f4 <__btrfs_map_block+0x2661>	e465f0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2661   e465f4:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2669   e465fc:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2671   e46604:	e9 fc db ff ff       	jmp    e44205 <__btrfs_map_block+0x272>
2676   e46609:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
267b   e4660e:	89 54 24 78          	mov    %edx,0x78(%rsp)
267f   e46612:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2687   e4661a:	e8 00 00 00 00       	call   e4661f <__btrfs_map_block+0x268c>	e4661b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
268c   e4661f:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
2691   e46624:	8b 54 24 78          	mov    0x78(%rsp),%edx
2695   e46628:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
269d   e46630:	e9 31 df ff ff       	jmp    e44566 <__btrfs_map_block+0x5d3>
26a2   e46635:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
26aa   e4663d:	e8 00 00 00 00       	call   e46642 <__btrfs_map_block+0x26af>	e4663e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
26af   e46642:	e9 85 e4 ff ff       	jmp    e44acc <__btrfs_map_block+0xb39>
26b4   e46647:	e8 00 00 00 00       	call   e4664c <__btrfs_map_block+0x26b9>	e46648: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
26b9   e4664c:	0f 1f 40 00          	nopl   0x0(%rax)
26bd   e46650:	e9 a5 e4 ff ff       	jmp    e44afa <__btrfs_map_block+0xb67>
26c2   e46655:	4c 89 9c 24 90 00 00 00 	mov    %r11,0x90(%rsp)
26ca   e4665d:	4c 89 94 24 a8 00 00 00 	mov    %r10,0xa8(%rsp)
26d2   e46665:	48 89 d6             	mov    %rdx,%rsi
26d5   e46668:	48 89 94 24 d0 00 00 00 	mov    %rdx,0xd0(%rsp)
26dd   e46670:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e46673: R_X86_64_32S	.data+0x7f5d00
26e4   e46677:	e8 00 00 00 00       	call   e4667c <__btrfs_map_block+0x26e9>	e46678: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
26e9   e4667c:	4c 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%r11
26f1   e46684:	4c 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%r10
26f9   e4668c:	48 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%rdx
2701   e46694:	e9 cc db ff ff       	jmp    e44265 <__btrfs_map_block+0x2d2>
2706   e46699:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
270e   e466a1:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2716   e466a9:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
271e   e466b1:	e8 00 00 00 00       	call   e466b6 <__btrfs_map_block+0x2723>	e466b2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2723   e466b6:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
272b   e466be:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2733   e466c6:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
273b   e466ce:	e9 c7 db ff ff       	jmp    e4429a <__btrfs_map_block+0x307>
2740   e466d3:	48 89 df             	mov    %rbx,%rdi
2743   e466d6:	e8 00 00 00 00       	call   e466db <__btrfs_map_block+0x2748>	e466d7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2748   e466db:	e9 c3 da ff ff       	jmp    e441a3 <__btrfs_map_block+0x210>
274d   e466e0:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2755   e466e8:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
275d   e466f0:	4c 89 e7             	mov    %r12,%rdi
2760   e466f3:	e8 00 00 00 00       	call   e466f8 <__btrfs_map_block+0x2765>	e466f4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2765   e466f8:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
276d   e46700:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2775   e46708:	e9 18 db ff ff       	jmp    e44225 <__btrfs_map_block+0x292>
277a   e4670d:	e8 00 00 00 00       	call   e46712 <__btrfs_map_block+0x277f>	e4670e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
277f   e46712:	e9 5d da ff ff       	jmp    e44174 <__btrfs_map_block+0x1e1>
2784   e46717:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
278c   e4671f:	e8 00 00 00 00       	call   e46724 <__btrfs_map_block+0x2791>	e46720: R_X86_64_PLT32	btrfs_put_bioc-0x4
2791   e46724:	c7 84 24 a0 00 00 00 fb ff ff ff 	movl   $0xfffffffb,0xa0(%rsp)
279c   e4672f:	e9 04 e2 ff ff       	jmp    e44938 <__btrfs_map_block+0x9a5>
27a1   e46734:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
27a9   e4673c:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
27b1   e46744:	48 89 cf             	mov    %rcx,%rdi
27b4   e46747:	e8 00 00 00 00       	call   e4674c <__btrfs_map_block+0x27b9>	e46748: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
27b9   e4674c:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
27c1   e46754:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
27c9   e4675c:	e9 0b ef ff ff       	jmp    e4566c <__btrfs_map_block+0x16d9>
27ce   e46761:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
27d3   e46766:	4c 89 5c 24 78       	mov    %r11,0x78(%rsp)
27d8   e4676b:	89 94 24 a8 00 00 00 	mov    %edx,0xa8(%rsp)
27df   e46772:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
27e7   e4677a:	48 89 df             	mov    %rbx,%rdi
27ea   e4677d:	e8 00 00 00 00       	call   e46782 <__btrfs_map_block+0x27ef>	e4677e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
27ef   e46782:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
27f4   e46787:	4c 8b 5c 24 78       	mov    0x78(%rsp),%r11
27f9   e4678c:	8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%edx
2800   e46793:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2808   e4679b:	e9 16 e5 ff ff       	jmp    e44cb6 <__btrfs_map_block+0xd23>
280d   e467a0:	4c 89 ee             	mov    %r13,%rsi
2810   e467a3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e467a6: R_X86_64_32S	.data+0x7f5c80
2817   e467aa:	e8 00 00 00 00       	call   e467af <__btrfs_map_block+0x281c>	e467ab: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
281c   e467af:	e9 46 e4 ff ff       	jmp    e44bfa <__btrfs_map_block+0xc67>
2821   e467b4:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
2826   e467b9:	4c 89 94 24 a8 00 00 00 	mov    %r10,0xa8(%rsp)
282e   e467c1:	48 8b bc 24 d0 00 00 00 	mov    0xd0(%rsp),%rdi
2836   e467c9:	e8 00 00 00 00       	call   e467ce <__btrfs_map_block+0x283b>	e467ca: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
283b   e467ce:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
2840   e467d3:	4c 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%r10
2848   e467db:	e9 4b ee ff ff       	jmp    e4562b <__btrfs_map_block+0x1698>
284d   e467e0:	4c 89 9c 24 c0 00 00 00 	mov    %r11,0xc0(%rsp)
2855   e467e8:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
285d   e467f0:	48 89 df             	mov    %rbx,%rdi
2860   e467f3:	e8 00 00 00 00       	call   e467f8 <__btrfs_map_block+0x2865>	e467f4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2865   e467f8:	4c 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%r11
286d   e46800:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2875   e46808:	e9 bf f2 ff ff       	jmp    e45acc <__btrfs_map_block+0x1b39>
287a   e4680d:	4c 89 e7             	mov    %r12,%rdi
287d   e46810:	e8 00 00 00 00       	call   e46815 <__btrfs_map_block+0x2882>	e46811: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2882   e46815:	49 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r8
288c   e4681f:	e9 c3 e9 ff ff       	jmp    e451e7 <__btrfs_map_block+0x1254>
2891   e46824:	4c 89 5c 24 68       	mov    %r11,0x68(%rsp)
2896   e46829:	4c 89 94 24 a8 00 00 00 	mov    %r10,0xa8(%rsp)
289e   e46831:	44 89 84 24 d0 00 00 00 	mov    %r8d,0xd0(%rsp)
28a6   e46839:	4c 89 ff             	mov    %r15,%rdi
28a9   e4683c:	e8 00 00 00 00       	call   e46841 <__btrfs_map_block+0x28ae>	e4683d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
28ae   e46841:	4c 8b 5c 24 68       	mov    0x68(%rsp),%r11
28b3   e46846:	4c 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%r10
28bb   e4684e:	44 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%r8d
28c3   e46856:	e9 5b e7 ff ff       	jmp    e44fb6 <__btrfs_map_block+0x1023>
28c8   e4685b:	e8 00 00 00 00       	call   e46860 <__btrfs_map_block+0x28cd>	e4685c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
28cd   e46860:	e9 3a df ff ff       	jmp    e4479f <__btrfs_map_block+0x80c>
28d2   e46865:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
28d7   e4686a:	89 54 24 58          	mov    %edx,0x58(%rsp)
28db   e4686e:	89 44 24 78          	mov    %eax,0x78(%rsp)
28df   e46872:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
28e7   e4687a:	4c 89 ff             	mov    %r15,%rdi
28ea   e4687d:	e8 00 00 00 00       	call   e46882 <__btrfs_map_block+0x28ef>	e4687e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
28ef   e46882:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
28f4   e46887:	8b 54 24 58          	mov    0x58(%rsp),%edx
28f8   e4688b:	8b 44 24 78          	mov    0x78(%rsp),%eax
28fc   e4688f:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2904   e46897:	e9 b8 ec ff ff       	jmp    e45554 <__btrfs_map_block+0x15c1>
2909   e4689c:	e8 00 00 00 00       	call   e468a1 <__btrfs_map_block+0x290e>	e4689d: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
290e   e468a1:	e9 39 df ff ff       	jmp    e447df <__btrfs_map_block+0x84c>
2913   e468a6:	e8 00 00 00 00       	call   e468ab <__btrfs_map_block+0x2918>	e468a7: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2918   e468ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
291d   e468b0:	e9 6e e2 ff ff       	jmp    e44b23 <__btrfs_map_block+0xb90>
2922   e468b5:	e8 00 00 00 00       	call   e468ba <__btrfs_map_block+0x2927>	e468b6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2927   e468ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
292d   e468c0:	e9 9e e2 ff ff       	jmp    e44b63 <__btrfs_map_block+0xbd0>
2932   e468c5:	4c 89 ef             	mov    %r13,%rdi
2935   e468c8:	e8 00 00 00 00       	call   e468cd <__btrfs_map_block+0x293a>	e468c9: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
293a   e468cd:	0f 1f 00             	nopl   (%rax)
293d   e468d0:	e9 c0 e2 ff ff       	jmp    e44b95 <__btrfs_map_block+0xc02>
2942   e468d5:	4c 89 5c 24 78       	mov    %r11,0x78(%rsp)
2947   e468da:	4c 89 94 24 a8 00 00 00 	mov    %r10,0xa8(%rsp)
294f   e468e2:	44 89 84 24 d0 00 00 00 	mov    %r8d,0xd0(%rsp)
2957   e468ea:	e8 00 00 00 00       	call   e468ef <__btrfs_map_block+0x295c>	e468eb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
295c   e468ef:	4c 8b 5c 24 78       	mov    0x78(%rsp),%r11
2961   e468f4:	4c 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%r10
2969   e468fc:	44 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%r8d
2971   e46904:	e9 95 f0 ff ff       	jmp    e4599e <__btrfs_map_block+0x1a0b>
2976   e46909:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
297e   e46911:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2986   e46919:	48 89 df             	mov    %rbx,%rdi
2989   e4691c:	e8 00 00 00 00       	call   e46921 <__btrfs_map_block+0x298e>	e4691d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
298e   e46921:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2996   e46929:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
299e   e46931:	e9 3d f0 ff ff       	jmp    e45973 <__btrfs_map_block+0x19e0>
29a3   e46936:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
29a8   e4693b:	e8 00 00 00 00       	call   e46940 <__btrfs_map_block+0x29ad>	e4693c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
29ad   e46940:	e9 51 df ff ff       	jmp    e44896 <__btrfs_map_block+0x903>
29b2   e46945:	4c 89 ff             	mov    %r15,%rdi
29b5   e46948:	e8 00 00 00 00       	call   e4694d <__btrfs_map_block+0x29ba>	e46949: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
29ba   e4694d:	0f 1f 00             	nopl   (%rax)
29bd   e46950:	e9 15 df ff ff       	jmp    e4486a <__btrfs_map_block+0x8d7>
29c2   e46955:	4c 89 ef             	mov    %r13,%rdi
29c5   e46958:	e8 00 00 00 00       	call   e4695d <__btrfs_map_block+0x29ca>	e46959: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
29ca   e4695d:	0f 1f 00             	nopl   (%rax)
29cd   e46960:	e9 ac de ff ff       	jmp    e44811 <__btrfs_map_block+0x87e>
29d2   e46965:	4c 89 ef             	mov    %r13,%rdi
29d5   e46968:	e8 00 00 00 00       	call   e4696d <__btrfs_map_block+0x29da>	e46969: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
29da   e4696d:	0f 1f 00             	nopl   (%rax)
29dd   e46970:	e9 b2 df ff ff       	jmp    e44927 <__btrfs_map_block+0x994>
29e2   e46975:	48 89 f7             	mov    %rsi,%rdi
29e5   e46978:	e8 00 00 00 00       	call   e4697d <__btrfs_map_block+0x29ea>	e46979: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
29ea   e4697d:	0f 1f 00             	nopl   (%rax)
29ed   e46980:	e9 6f df ff ff       	jmp    e448f4 <__btrfs_map_block+0x961>
29f2   e46985:	e8 00 00 00 00       	call   e4698a <__btrfs_map_block+0x29f7>	e46986: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
29f7   e4698a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
29fd   e46990:	e9 24 df ff ff       	jmp    e448b9 <__btrfs_map_block+0x926>
2a02   e46995:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2a0a   e4699d:	89 94 24 c0 00 00 00 	mov    %edx,0xc0(%rsp)
2a11   e469a4:	48 89 f7             	mov    %rsi,%rdi
2a14   e469a7:	e8 00 00 00 00       	call   e469ac <__btrfs_map_block+0x2a19>	e469a8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2a19   e469ac:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2a21   e469b4:	8b 94 24 c0 00 00 00 	mov    0xc0(%rsp),%edx
2a28   e469bb:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2a30   e469c3:	e9 a3 f0 ff ff       	jmp    e45a6b <__btrfs_map_block+0x1ad8>
2a35   e469c8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e469cb: R_X86_64_32S	debug_locks
2a3c   e469cf:	e8 00 00 00 00       	call   e469d4 <__btrfs_map_block+0x2a41>	e469d0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2a41   e469d4:	e9 8d df ff ff       	jmp    e44966 <__btrfs_map_block+0x9d3>
2a46   e469d9:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
2a4e   e469e1:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
2a56   e469e9:	48 89 cf             	mov    %rcx,%rdi
2a59   e469ec:	e8 00 00 00 00       	call   e469f1 <__btrfs_map_block+0x2a5e>	e469ed: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2a5e   e469f1:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
2a66   e469f9:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
2a6e   e46a01:	e9 30 d9 ff ff       	jmp    e44336 <__btrfs_map_block+0x3a3>
2a73   e46a06:	e8 00 00 00 00       	call   e46a0b <__btrfs_map_block+0x2a78>	e46a07: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2a78   e46a0b:	e9 e2 ee ff ff       	jmp    e458f2 <__btrfs_map_block+0x195f>
2a7d   e46a10:	4c 89 f7             	mov    %r14,%rdi
2a80   e46a13:	e8 00 00 00 00       	call   e46a18 <__btrfs_map_block+0x2a85>	e46a14: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2a85   e46a18:	e9 b3 ee ff ff       	jmp    e458d0 <__btrfs_map_block+0x193d>
2a8a   e46a1d:	0f 1f 00             	nopl   (%rax)
2a8d   e46a20:	e8 00 00 00 00       	call   e46a25 <__btrfs_map_block+0x2a92>	e46a21: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2a92   e46a25:	e9 7c ee ff ff       	jmp    e458a6 <__btrfs_map_block+0x1913>
2a97   e46a2a:	48 89 df             	mov    %rbx,%rdi
2a9a   e46a2d:	0f 1f 00             	nopl   (%rax)
2a9d   e46a30:	e8 00 00 00 00       	call   e46a35 <__btrfs_map_block+0x2aa2>	e46a31: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2aa2   e46a35:	e9 f3 ee ff ff       	jmp    e4592d <__btrfs_map_block+0x199a>
0000 00000000000802ec <__btrfs_map_block.cold>:
0000    802ec:	4c 89 9c 24 a8 00 00 00 	mov    %r11,0xa8(%rsp)
0008    802f4:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
0010    802fc:	ba 51 19 00 00       	mov    $0x1951,%edx
0015    80301:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	80304: R_X86_64_32S	.rodata+0x2300a0
001c    80308:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8030b: R_X86_64_32S	.rodata+0x232260
0023    8030f:	e8 00 00 00 00       	call   80314 <__btrfs_map_block.cold+0x28>	80310: R_X86_64_PLT32	btrfs_assertfail-0x4
0028    80314:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
0030    8031c:	4c 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%r11
0038    80324:	e9 00 00 00 00       	jmp    80329 <__btrfs_map_block.cold+0x3d>	80325: R_X86_64_PC32	.text+0xe45636
003d    80329:	ba f9 18 00 00       	mov    $0x18f9,%edx
0042    8032e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	80331: R_X86_64_32S	.rodata+0x2300a0
0049    80335:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	80338: R_X86_64_32S	.rodata+0x232160
0050    8033c:	e8 00 00 00 00       	call   80341 <__btrfs_map_block.cold+0x55>	8033d: R_X86_64_PLT32	btrfs_assertfail-0x4
0055    80341:	e9 00 00 00 00       	jmp    80346 <__btrfs_map_block.cold+0x5a>	80342: R_X86_64_PC32	.text+0xe440be
005a    80346:	ba fa 18 00 00       	mov    $0x18fa,%edx
005f    8034b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8034e: R_X86_64_32S	.rodata+0x2300a0
0066    80352:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	80355: R_X86_64_32S	.rodata+0x232120
006d    80359:	e8 00 00 00 00       	call   8035e <__btrfs_map_block.cold+0x72>	8035a: R_X86_64_PLT32	btrfs_assertfail-0x4
0072    8035e:	e9 00 00 00 00       	jmp    80363 <__btrfs_map_block.cold+0x77>	8035f: R_X86_64_PC32	.text+0xe440cc
0077    80363:	ba fd 18 00 00       	mov    $0x18fd,%edx
007c    80368:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8036b: R_X86_64_32S	.rodata+0x2300a0
0083    8036f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	80372: R_X86_64_32S	.rodata+0x2321a0
008a    80376:	e8 00 00 00 00       	call   8037b <__btrfs_map_block.cold+0x8f>	80377: R_X86_64_PLT32	btrfs_assertfail-0x4
008f    8037b:	e9 00 00 00 00       	jmp    80380 <__btrfs_map_block.cold+0x94>	8037c: R_X86_64_PC32	.text+0xe44113
0094    80380:	44 89 c1             	mov    %r8d,%ecx
0097    80383:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	80386: R_X86_64_32S	.rodata+0x2322c0
009e    8038a:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
00a6    80392:	e8 00 00 00 00       	call   80397 <__btrfs_map_block.cold+0xab>	80393: R_X86_64_PLT32	_btrfs_printk-0x4
00ab    80397:	c7 84 24 a0 00 00 00 ea ff ff ff 	movl   $0xffffffea,0xa0(%rsp)
00b6    803a2:	e9 00 00 00 00       	jmp    803a7 <__btrfs_map_block.cold+0xbb>	803a3: R_X86_64_PC32	.text+0xe44927
00bb    803a7:	ba d6 17 00 00       	mov    $0x17d6,%edx
00c0    803ac:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	803af: R_X86_64_32S	.rodata+0x2300a0
00c7    803b3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	803b6: R_X86_64_32S	.rodata+0x2321e0
00ce    803ba:	e8 00 00 00 00       	call   803bf <__btrfs_map_block.cold+0xd3>	803bb: R_X86_64_PLT32	btrfs_assertfail-0x4
00d3    803bf:	e9 00 00 00 00       	jmp    803c4 <btrfs_bio_clone_partial.cold>	803c0: R_X86_64_PC32	.text+0xe44934

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--5vXlhXreqN7gDr/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.1.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23900
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23900
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_UAPI_HEADER_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ_FULL is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
CONFIG_USERMODE_DRIVER=y
CONFIG_BPF_PRELOAD=y
CONFIG_BPF_PRELOAD_UMD=m
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
CONFIG_SCHED_CORE=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_TIME_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_EMBED is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
# CONFIG_X86_MPPARSE is not set
CONFIG_GOLDFISH=y
# CONFIG_X86_CPU_RESCTRL is not set
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
CONFIG_MPSC=y
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_GENERIC_CPU is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=7
CONFIG_X86_L1_CACHE_SHIFT=7
CONFIG_X86_P6_NOP=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
# CONFIG_SCHED_MC_PRIO is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
CONFIG_X86_CPA_STATISTICS=y
# CONFIG_AMD_MEM_ENCRYPT is not set
# CONFIG_NUMA is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
CONFIG_EFI=y
# CONFIG_EFI_STUB is not set
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
# CONFIG_KEXEC is not set
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
CONFIG_KEXEC_SIG=y
# CONFIG_KEXEC_SIG_FORCE is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
CONFIG_DEBUG_HOTPLUG_CPU0=y
CONFIG_COMPAT_VDSO=y
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_RETPOLINE is not set
CONFIG_CPU_IBPB_ENTRY=y
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
# CONFIG_ACPI_DEBUGGER_USER is not set
# CONFIG_ACPI_SPCR_TABLE is not set
CONFIG_ACPI_FPDT=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
CONFIG_ACPI_EC_DEBUGFS=y
# CONFIG_ACPI_AC is not set
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=m
CONFIG_ACPI_TINY_POWER_BUTTON=m
CONFIG_ACPI_TINY_POWER_BUTTON_SIGNAL=38
CONFIG_ACPI_TAD=m
# CONFIG_ACPI_DOCK is not set
# CONFIG_ACPI_PROCESSOR is not set
# CONFIG_ACPI_IPMI is not set
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_TABLE_UPGRADE is not set
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
# CONFIG_ACPI_HOTPLUG_MEMORY is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
CONFIG_ACPI_CUSTOM_METHOD=m
CONFIG_ACPI_BGRT=y
CONFIG_ACPI_NFIT=y
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
# CONFIG_ACPI_APEI_GHES is not set
CONFIG_ACPI_APEI_EINJ=y
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_CONFIGFS=y
# CONFIG_ACPI_PFRUT is not set
# CONFIG_PMIC_OPREGION is not set
# CONFIG_ACPI_PRMT is not set
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
CONFIG_BLK_DEV_THROTTLING_LOW=y
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_CGROUP_IOLATENCY is not set
CONFIG_BLK_CGROUP_FC_APPID=y
# CONFIG_BLK_CGROUP_IOCOST is not set
CONFIG_BLK_CGROUP_IOPRIO=y
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
# CONFIG_MQ_IOSCHED_KYBER is not set
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
# CONFIG_SWAP is not set
CONFIG_ZSMALLOC=m
# CONFIG_ZSMALLOC_STAT is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
# CONFIG_MEMORY_HOTREMOVE is not set
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_VADDR is not set
# CONFIG_DAMON_PADDR is not set
# CONFIG_DAMON_SYSFS is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=m
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_PCI_GENERIC is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=m
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=m
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_BOOTLOADER_CONTROL=m
CONFIG_EFI_CAPSULE_LOADER=m
# CONFIG_EFI_TEST is not set
CONFIG_EFI_RCI2_TABLE=y
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=y
CONFIG_MTD_CMDLINE_PARTS=m
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=m
CONFIG_MTD_BLOCK_RO=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=m
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_INFTL=y
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=m
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_SBC_GXX=m
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=m
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
CONFIG_MTD_ONENAND_GENERIC=m
# CONFIG_MTD_ONENAND_OTP is not set
CONFIG_MTD_ONENAND_2X_PROGRAM=y
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
# CONFIG_MTD_NAND_DENALI_PCI is not set
# CONFIG_MTD_NAND_CAFE is not set
CONFIG_MTD_NAND_MXIC=m
CONFIG_MTD_NAND_GPIO=m
CONFIG_MTD_NAND_PLATFORM=m
CONFIG_MTD_NAND_ARASAN=m

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
# CONFIG_MTD_NAND_RICOH is not set
# CONFIG_MTD_NAND_DISKONCHIP is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
CONFIG_MTD_NAND_ECC_SW_BCH=y
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
CONFIG_MTD_HYPERBUS=m
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
CONFIG_PARPORT_AX88796=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=y
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_BLK_DEV_FD=m
# CONFIG_BLK_DEV_FD_RAWCMD is not set
CONFIG_CDROM=m
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=m
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_ZSTD is not set
# CONFIG_ZRAM_DEF_COMP_LZ4 is not set
# CONFIG_ZRAM_DEF_COMP_LZO is not set
# CONFIG_ZRAM_DEF_COMP_LZ4HC is not set
# CONFIG_ZRAM_DEF_COMP_842 is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
CONFIG_ZRAM_WRITEBACK=y
CONFIG_ZRAM_MEMORY_TRACKING=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_FABRICS=m
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
# CONFIG_NVME_TARGET_LOOP is not set
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=m
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
CONFIG_DS1682=m
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=y
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_HABANA_AI is not set
CONFIG_UACCE=m
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=m
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=m
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
# CONFIG_CHR_DEV_SG is not set
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=m
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=m
# CONFIG_SCSI_SAS_LIBSAS is not set
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=m
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
# CONFIG_ATA_ACPI is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
# CONFIG_SATA_AHCI_PLATFORM is not set
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=y
# CONFIG_TCM_PSCSI is not set
# CONFIG_TCM_USER2 is not set
CONFIG_LOOPBACK_TARGET=m
# CONFIG_ISCSI_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=m
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=y
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=y
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=m
CONFIG_MOUSE_GPIO=y
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=y
CONFIG_JOYSTICK_GF2K=m
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=m
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
CONFIG_JOYSTICK_TMDC=m
# CONFIG_JOYSTICK_IFORCE is not set
CONFIG_JOYSTICK_WARRIOR=m
CONFIG_JOYSTICK_MAGELLAN=m
# CONFIG_JOYSTICK_SPACEORB is not set
# CONFIG_JOYSTICK_SPACEBALL is not set
# CONFIG_JOYSTICK_STINGER is not set
CONFIG_JOYSTICK_TWIDJOY=m
CONFIG_JOYSTICK_ZHENHUA=y
# CONFIG_JOYSTICK_DB9 is not set
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=m
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_QWIIC=m
CONFIG_JOYSTICK_FSIA6B=y
# CONFIG_JOYSTICK_SENSEHAT is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=m
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SMB=y
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=m
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=m
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_LANTIQ=y
CONFIG_SERIAL_LANTIQ_CONSOLE=y
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX=m
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_ALTERA_JTAGUART=m
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_FSL_LINFLEXUART=m
# CONFIG_SERIAL_MEN_Z135 is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
# CONFIG_SYNCLINK_GT is not set
CONFIG_N_HDLC=m
CONFIG_GOLDFISH_TTY=m
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
# CONFIG_IPMI_WATCHDOG is not set
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=m
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=m
CONFIG_HW_RANDOM_VIA=m
# CONFIG_HW_RANDOM_VIRTIO is not set
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_TCG_TPM=m
CONFIG_HW_RANDOM_TPM=y
# CONFIG_TCG_TIS is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=m
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_NSC=m
# CONFIG_TCG_ATMEL is not set
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=m
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TELCLOCK is not set
# CONFIG_XILLYBUS is not set
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
# CONFIG_ACPI_I2C_OPREGION is not set
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
# CONFIG_I2C_MUX is not set
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=m
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_OCORES=m
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
CONFIG_CDNS_I3C_MASTER=m
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SVC_I3C_MASTER=m
# CONFIG_MIPI_I3C_HCI is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
CONFIG_HSI=m
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=m
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
CONFIG_PINCTRL_DA9062=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
CONFIG_PINCTRL_CHERRYVIEW=m
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
# CONFIG_PINCTRL_ALDERLAKE is not set
CONFIG_PINCTRL_BROXTON=m
CONFIG_PINCTRL_CANNONLAKE=y
CONFIG_PINCTRL_CEDARFORK=y
# CONFIG_PINCTRL_DENVERTON is not set
CONFIG_PINCTRL_ELKHARTLAKE=y
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=y
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_SUNRISEPOINT=m
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=m
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=m
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MENZ127 is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=m
CONFIG_GPIO_SCH311X=y
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_DA9052=m
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP3943=y
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_MADERA=m
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_MOCKUP=m
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_DS1WM=m
CONFIG_W1_MASTER_GPIO=m
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=m
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
CONFIG_WM831X_BACKUP=m
CONFIG_WM831X_POWER=y
# CONFIG_WM8350_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=m
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=m
CONFIG_BATTERY_BQ27XXX=m
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_BATTERY_DA9030=y
# CONFIG_BATTERY_DA9052 is not set
CONFIG_BATTERY_MAX17040=m
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_PCF50633=m
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=m
CONFIG_CHARGER_LT3651=y
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX14577 is not set
CONFIG_CHARGER_MAX77693=m
# CONFIG_CHARGER_MAX77976 is not set
CONFIG_CHARGER_MT6360=m
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=m
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_CHARGER_TPS65090 is not set
CONFIG_BATTERY_GAUGE_LTC2941=m
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
# CONFIG_HWMON is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
CONFIG_MFD_MADERA=m
CONFIG_MFD_MADERA_I2C=m
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=m
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=m
CONFIG_HTC_PASIC3=m
# CONFIG_HTC_I2CPLD is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=m
CONFIG_MFD_MAX77693=m
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT4831=y
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SI476X_CORE=m
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=m
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
CONFIG_MFD_ATC260X=m
CONFIG_MFD_ATC260X_I2C=m
CONFIG_RAVE_SP_CORE=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=m
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=m
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_AAT2870=y
# CONFIG_REGULATOR_ATC260X is not set
CONFIG_REGULATOR_DA903X=y
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
# CONFIG_REGULATOR_GPIO is not set
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=m
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
# CONFIG_REGULATOR_LP8788 is not set
CONFIG_REGULATOR_LTC3589=y
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=m
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX8649=m
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8893=m
CONFIG_REGULATOR_MAX8907=m
CONFIG_REGULATOR_MAX8952=m
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX77693=m
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
CONFIG_REGULATOR_MC13892=m
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MT6311=m
# CONFIG_REGULATOR_MT6323 is not set
# CONFIG_REGULATOR_MT6331 is not set
# CONFIG_REGULATOR_MT6332 is not set
# CONFIG_REGULATOR_MT6358 is not set
# CONFIG_REGULATOR_MT6359 is not set
CONFIG_REGULATOR_MT6360=y
# CONFIG_REGULATOR_MT6397 is not set
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCF50633=m
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=m
# CONFIG_REGULATOR_RC5T583 is not set
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4831=y
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5759 is not set
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=m
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS6105X is not set
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=m
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65090=m
# CONFIG_REGULATOR_TPS65132 is not set
# CONFIG_REGULATOR_WM831X is not set
CONFIG_REGULATOR_WM8350=y
CONFIG_REGULATOR_WM8400=m
CONFIG_REGULATOR_WM8994=y
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
CONFIG_RC_MAP=y
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=y
# CONFIG_IR_JVC_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=y
# CONFIG_IR_RC6_DECODER is not set
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=y
CONFIG_IR_SHARP_DECODER=y
# CONFIG_IR_SONY_DECODER is not set
CONFIG_IR_XMP_DECODER=m
# CONFIG_RC_DEVICES is not set
CONFIG_CEC_CORE=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
# CONFIG_CEC_SECO is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=m
# CONFIG_FB_VGA16 is not set
CONFIG_FB_N411=m
CONFIG_FB_HGA=m
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
CONFIG_FB_IBM_GXT4500=m
CONFIG_FB_GOLDFISH=m
CONFIG_FB_VIRTUAL=m
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_SIMPLE=m
CONFIG_FB_SSD1307=m
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=m
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
CONFIG_BACKLIGHT_LM3533=y
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_DA903X=y
CONFIG_BACKLIGHT_DA9052=m
CONFIG_BACKLIGHT_APPLE=m
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_RT4831 is not set
CONFIG_BACKLIGHT_SAHARA=y
CONFIG_BACKLIGHT_WM831X=m
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=m
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_AAT2870=y
CONFIG_BACKLIGHT_LM3630A=m
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_LP8788 is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=m
# CONFIG_BACKLIGHT_ARCXCNN is not set
# CONFIG_BACKLIGHT_RAVE_SP is not set
# end of Backlight & LCD device support

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=m
# CONFIG_SND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=y
CONFIG_HID_COUGAR=m
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_CMEDIA is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=m
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=m
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=y
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_VIVALDI=m
CONFIG_HID_KEYTOUCH=y
# CONFIG_HID_KYE is not set
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=y
# CONFIG_HID_VRC2 is not set
CONFIG_HID_XIAOMI=m
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=y
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=m
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=m
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=y
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=y
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=m
# CONFIG_PLAYSTATION_FF is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
CONFIG_HID_SAITEK=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=y
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=y
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=y
CONFIG_ZEROPLUS_FF=y
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=m
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# I2C HID support
#
CONFIG_I2C_HID_ACPI=m
# end of I2C HID support

CONFIG_I2C_HID_CORE=m

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

#
# Surface System Aggregator Module HID support
#
# CONFIG_SURFACE_KBD is not set
# end of Surface System Aggregator Module HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_TAHVO_USB is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
# CONFIG_MMC_SDHCI_PCI is not set
# CONFIG_MMC_SDHCI_ACPI is not set
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_F_SDH30=m
CONFIG_MMC_WBSD=m
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_SDHCI_XENON=m
# CONFIG_SCSI_UFSHCD is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=m
CONFIG_MS_BLOCK=m

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=m
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_MT6323=m
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
# CONFIG_LEDS_GPIO is not set
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=m
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_LP8788 is not set
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_WM831X_STATUS=m
# CONFIG_LEDS_WM8350 is not set
CONFIG_LEDS_DA903X=y
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_PWM=y
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2802=m
# CONFIG_LEDS_INTEL_SS4200 is not set
CONFIG_LEDS_LT3593=m
CONFIG_LEDS_MC13783=m
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_MLXCPLD is not set
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=y
CONFIG_LEDS_NIC78BX=m
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_TPS6105X=m

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#
# CONFIG_LEDS_PWM_MULTICOLOR is not set

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
# CONFIG_EDAC_E752X is not set
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
# CONFIG_EDAC_IE31200 is not set
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I5000 is not set
# CONFIG_EDAC_I5100 is not set
# CONFIG_EDAC_I7300 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=m
CONFIG_IMG_ASCII_LCD=y
CONFIG_HT16K33=m
# CONFIG_LCD2S is not set
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_PANEL=y
CONFIG_UIO=m
# CONFIG_UIO_CIF is not set
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=m
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
# CONFIG_VFIO_MDEV is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
# CONFIG_EFI_SECRET is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
# CONFIG_COMEDI_BOND is not set
# CONFIG_COMEDI_TEST is not set
CONFIG_COMEDI_PARPORT=y
CONFIG_COMEDI_ISA_DRIVERS=y
# CONFIG_COMEDI_PCL711 is not set
CONFIG_COMEDI_PCL724=m
CONFIG_COMEDI_PCL726=m
CONFIG_COMEDI_PCL730=m
CONFIG_COMEDI_PCL812=y
CONFIG_COMEDI_PCL816=m
CONFIG_COMEDI_PCL818=y
CONFIG_COMEDI_PCM3724=y
CONFIG_COMEDI_AMPLC_DIO200_ISA=m
CONFIG_COMEDI_AMPLC_PC236_ISA=y
CONFIG_COMEDI_AMPLC_PC263_ISA=m
# CONFIG_COMEDI_RTI800 is not set
CONFIG_COMEDI_RTI802=y
CONFIG_COMEDI_DAC02=m
CONFIG_COMEDI_DAS16M1=m
# CONFIG_COMEDI_DAS08_ISA is not set
# CONFIG_COMEDI_DAS16 is not set
CONFIG_COMEDI_DAS800=m
# CONFIG_COMEDI_DAS1800 is not set
# CONFIG_COMEDI_DAS6402 is not set
# CONFIG_COMEDI_DT2801 is not set
CONFIG_COMEDI_DT2811=y
CONFIG_COMEDI_DT2814=m
# CONFIG_COMEDI_DT2815 is not set
# CONFIG_COMEDI_DT2817 is not set
# CONFIG_COMEDI_DT282X is not set
CONFIG_COMEDI_DMM32AT=y
CONFIG_COMEDI_FL512=m
CONFIG_COMEDI_AIO_AIO12_8=y
CONFIG_COMEDI_AIO_IIRO_16=y
CONFIG_COMEDI_II_PCI20KC=m
CONFIG_COMEDI_C6XDIGIO=m
# CONFIG_COMEDI_MPC624 is not set
# CONFIG_COMEDI_ADQ12B is not set
# CONFIG_COMEDI_NI_AT_A2150 is not set
# CONFIG_COMEDI_NI_AT_AO is not set
CONFIG_COMEDI_NI_ATMIO=y
CONFIG_COMEDI_NI_ATMIO16D=y
CONFIG_COMEDI_NI_LABPC_ISA=y
CONFIG_COMEDI_PCMAD=y
CONFIG_COMEDI_PCMDA12=m
# CONFIG_COMEDI_PCMMIO is not set
CONFIG_COMEDI_PCMUIO=m
# CONFIG_COMEDI_MULTIQ3 is not set
# CONFIG_COMEDI_S526 is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_AMPLC_DIO200=m
CONFIG_COMEDI_AMPLC_PC236=y
CONFIG_COMEDI_ISADMA=y
CONFIG_COMEDI_NI_LABPC=y
CONFIG_COMEDI_NI_LABPC_ISADMA=y
CONFIG_COMEDI_NI_TIO=y
CONFIG_COMEDI_NI_ROUTING=y
# CONFIG_COMEDI_TESTS is not set
CONFIG_STAGING=y
# CONFIG_RTLLIB is not set
# CONFIG_RTS5208 is not set
# CONFIG_FB_SM750 is not set
CONFIG_STAGING_MEDIA=y
# CONFIG_KS7010 is not set
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_HID=m
CONFIG_GREYBUS_LIGHT=y
# CONFIG_GREYBUS_LOG is not set
# CONFIG_GREYBUS_LOOPBACK is not set
CONFIG_GREYBUS_POWER=m
CONFIG_GREYBUS_RAW=m
CONFIG_GREYBUS_VIBRATOR=y
CONFIG_GREYBUS_BRIDGED_PHY=y
CONFIG_GREYBUS_GPIO=y
# CONFIG_GREYBUS_I2C is not set
CONFIG_GREYBUS_PWM=m
# CONFIG_GREYBUS_SDIO is not set
# CONFIG_GREYBUS_UART is not set
CONFIG_FIELDBUS_DEV=y
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
CONFIG_GOLDFISH_PIPE=m
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_SURFACE_PLATFORMS=y
CONFIG_SURFACE_3_POWER_OPREGION=m
# CONFIG_SURFACE_ACPI_NOTIFY is not set
CONFIG_SURFACE_AGGREGATOR_CDEV=y
CONFIG_SURFACE_DTX=y
CONFIG_SURFACE_GPE=y
CONFIG_SURFACE_HOTPLUG=m
CONFIG_SURFACE_PRO3_BUTTON=y
CONFIG_SURFACE_AGGREGATOR=y
# CONFIG_SURFACE_AGGREGATOR_BUS is not set
# CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
# CONFIG_P2SB is not set
# CONFIG_COMMON_CLK is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=m
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=m
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=m
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=m
# CONFIG_EXTCON_GPIO is not set
CONFIG_EXTCON_INTEL_INT3496=m
CONFIG_EXTCON_MAX14577=m
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77693=m
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=m
CONFIG_MEMORY=y
# CONFIG_IIO is not set
# CONFIG_NTB is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_DWC is not set
# CONFIG_PWM_LP3943 is not set
CONFIG_PWM_LPSS=m
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
CONFIG_MADERA_IRQ=m
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_TI_SYSCON=m
# CONFIG_RESET_TI_TPS380X is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=m
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
CONFIG_MCB_LPC=y

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_USB4 is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

CONFIG_LIBNVDIMM=y
CONFIG_BLK_DEV_PMEM=y
# CONFIG_BTT is not set
CONFIG_DAX=y
# CONFIG_DEV_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RAVE_SP_EEPROM is not set
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=m
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=y
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=y
# CONFIG_STM_SOURCE_FTRACE is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_TEE=m
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
CONFIG_COUNTER=y
# CONFIG_INTERRUPT_CNT is not set
# CONFIG_INTEL_QEP is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_FS_POSIX_ACL=y
# CONFIG_EXT4_FS_SECURITY is not set
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=m
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=m
CONFIG_REISERFS_FS=m
CONFIG_REISERFS_CHECK=y
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
CONFIG_BTRFS_DEBUG=y
CONFIG_BTRFS_ASSERT=y
CONFIG_BTRFS_FS_REF_VERIFY=y
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
# CONFIG_F2FS_STAT_FS is not set
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
CONFIG_F2FS_FS_COMPRESSION=y
CONFIG_F2FS_FS_LZO=y
# CONFIG_F2FS_FS_LZORLE is not set
# CONFIG_F2FS_FS_LZ4 is not set
CONFIG_F2FS_FS_ZSTD=y
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_ZONEFS_FS=m
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=m
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QFMT_V1=y
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=m
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
# CONFIG_CUSE is not set
CONFIG_VIRTIO_FS=m
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_XINO_AUTO=y
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=y
CONFIG_CACHEFILES_DEBUG=y
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
# CONFIG_JOLIET is not set
# CONFIG_ZISOFS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
CONFIG_NTFS3_FS=y
CONFIG_NTFS3_64BIT_CLUSTER=y
CONFIG_NTFS3_LZX_XPRESS=y
CONFIG_NTFS3_FS_POSIX_ACL=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# CONFIG_EFIVAR_FS is not set
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
CONFIG_HFSPLUS_FS=m
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=m
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
CONFIG_JFFS2_SUMMARY=y
# CONFIG_JFFS2_FS_XATTR is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
CONFIG_JFFS2_CMODE_NONE=y
# CONFIG_JFFS2_CMODE_PRIORITY is not set
# CONFIG_JFFS2_CMODE_SIZE is not set
# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
# CONFIG_CRAMFS is not set
# CONFIG_SQUASHFS is not set
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
CONFIG_HPFS_FS=y
# CONFIG_QNX4FS_FS is not set
CONFIG_QNX6FS_FS=m
# CONFIG_QNX6FS_DEBUG is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
CONFIG_PSTORE_LZO_COMPRESS=m
CONFIG_PSTORE_LZ4_COMPRESS=y
CONFIG_PSTORE_LZ4HC_COMPRESS=m
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
CONFIG_UFS_FS=y
CONFIG_UFS_FS_WRITE=y
CONFIG_UFS_DEBUG=y
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=m
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=m
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=m
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=m
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=m
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=m
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=m
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=m
CONFIG_CRYPTO_AES_TI=m
# CONFIG_CRYPTO_ARIA is not set
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=m
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=m
# CONFIG_CRYPTO_SEQIV is not set
# CONFIG_CRYPTO_ECHAINIV is not set
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=m
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_VMAC is not set
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=m
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_CURVE25519_X86=y
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=y
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES3_EDE_X86_64=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
# CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
CONFIG_CRYPTO_NHPOLY1305_SSE2=m
CONFIG_CRYPTO_NHPOLY1305_AVX2=m
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=m
CONFIG_CRYPTO_SHA256_SSSE3=m
# CONFIG_CRYPTO_SHA512_SSSE3 is not set
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
# CONFIG_CRYPTO_CRC32C_INTEL is not set
CONFIG_CRYPTO_CRC32_PCLMUL=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
CONFIG_CRYPTO_LIB_POLY1305=m
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=m
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
CONFIG_CRC4=y
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
CONFIG_DMA_PERNUMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
CONFIG_CMA_SIZE_SEL_MIN=y
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CPUMASK_OFFSTACK=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
CONFIG_READABLE_ASM=y
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_OBJTOOL=y
CONFIG_NOINSTR_VALIDATION=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
CONFIG_PTDUMP_DEBUGFS=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
CONFIG_DEBUG_OBJECTS_WORK=y
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHED_DEBUG is not set
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_BOOTTIME_TRACING=y
CONFIG_FUNCTION_TRACER=y
# CONFIG_DYNAMIC_FTRACE is not set
# CONFIG_FUNCTION_PROFILER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_UPROBE_EVENTS is not set
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
CONFIG_IO_STRICT_DEVMEM=y

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_EFI_PGT_DUMP=y
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
# CONFIG_FAULT_INJECTION_USERCOPY is not set
# CONFIG_FAIL_MAKE_REQUEST is not set
CONFIG_FAIL_IO_TIMEOUT=y
CONFIG_FAIL_FUTEX=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
CONFIG_FAIL_MMC_REQUEST=y
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--5vXlhXreqN7gDr/c--
