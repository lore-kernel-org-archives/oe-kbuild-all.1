Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C263C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 04:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680582424; x=1712118424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EgB6Iq3mOL2vDFK7fIrli9H2BGvmm49kVdprFILWUs=;
  b=PpDWRPOSeoF8vzzsJPHKLiZJzDRcJ79VCY8uZoqDCTJouDq6kbjJ7DyW
   zhnNnmNybU7PlY9XtfUxpBfGx+0ehYLlOfzC7jeoTjdhmNmdyxBH6dUMp
   m97GeamGhO/DAW7J3qN+J+Sv3Y1cs+5MBiOOceChvVxsnHc9mde8ETb0C
   BnqX/HkDa9NlXL8vQXt1NvvcdGbyxBSdAS5IVGpmatqyUQDv4foo6aEUY
   IwpySud4Idkwd9iy0Ie3KXebG9ZRvGMCv9Wuiucj4T7TamztfpHe/ScF/
   Yw4MO5mEF9OUH3KZ/HXCvItpedDbN68vlXfHAmphm76U37n3BusnaXz5R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343785810"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="343785810"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 21:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="797368712"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="797368712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2023 21:27:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjYG5-000PBE-1e;
	Tue, 04 Apr 2023 04:27:01 +0000
Date: Tue, 4 Apr 2023 12:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-lts 859/1999] vmlinux.o: warning: objtool:
 mptctl_timeout_expired+0x27b: unreachable instruction
Message-ID: <202304041257.EaW6IBVs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-lts
head:   9a29b30d6f9646cce171f20da1a3bf3f2fbf98b8
commit: 982f8ef8ec7e9a4cdb110d020c6be12ae9a6fbce [859/1999] context_tracking: Fix noinstr vs KASAN
config: x86_64-randconfig-r026-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041257.EaW6IBVs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=982f8ef8ec7e9a4cdb110d020c6be12ae9a6fbce
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-lts
        git checkout 982f8ef8ec7e9a4cdb110d020c6be12ae9a6fbce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041257.EaW6IBVs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: mptctl_timeout_expired+0x27b: unreachable instruction


objdump-func vmlinux.o mptctl_timeout_expired:
0000 00000000019c7020 <mptctl_timeout_expired>:
0000  19c7020:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
000a  19c702a:	55                   	push   %rbp
000b  19c702b:	48 89 e5             	mov    %rsp,%rbp
000e  19c702e:	41 57                	push   %r15
0010  19c7030:	41 56                	push   %r14
0012  19c7032:	41 55                	push   %r13
0014  19c7034:	49 89 f5             	mov    %rsi,%r13
0017  19c7037:	41 54                	push   %r12
0019  19c7039:	49 89 fc             	mov    %rdi,%r12
001c  19c703c:	48 8d 7e 03          	lea    0x3(%rsi),%rdi
0020  19c7040:	53                   	push   %rbx
0021  19c7041:	48 89 fa             	mov    %rdi,%rdx
0024  19c7044:	48 c1 ea 03          	shr    $0x3,%rdx
0028  19c7048:	48 83 ec 08          	sub    $0x8,%rsp
002c  19c704c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0030  19c7050:	48 89 fa             	mov    %rdi,%rdx
0033  19c7053:	83 e2 07             	and    $0x7,%edx
0036  19c7056:	38 d0                	cmp    %dl,%al
0038  19c7058:	7f 08                	jg     19c7062 <mptctl_timeout_expired+0x42>
003a  19c705a:	84 c0                	test   %al,%al
003c  19c705c:	0f 85 2c 03 00 00    	jne    19c738e <mptctl_timeout_expired+0x36e>
0042  19c7062:	4d 8d b4 24 c8 00 00 00 	lea    0xc8(%r12),%r14
004a  19c706a:	41 0f b6 5d 03       	movzbl 0x3(%r13),%ebx
004f  19c706f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0059  19c7079:	4c 89 f2             	mov    %r14,%rdx
005c  19c707c:	48 c1 ea 03          	shr    $0x3,%rdx
0060  19c7080:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0064  19c7084:	84 c0                	test   %al,%al
0066  19c7086:	74 08                	je     19c7090 <mptctl_timeout_expired+0x70>
0068  19c7088:	3c 03                	cmp    $0x3,%al
006a  19c708a:	0f 8e f1 02 00 00    	jle    19c7381 <mptctl_timeout_expired+0x361>
0070  19c7090:	41 f6 84 24 c9 00 00 00 01 	testb  $0x1,0xc9(%r12)
0079  19c7099:	0f 85 00 00 00 00    	jne    19c709f <mptctl_timeout_expired+0x7f>	19c709b: R_X86_64_PC32	.text.unlikely+0x11db91
007f  19c709f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	19c70a2: R_X86_64_32S	mpt_fwfault_debug
0086  19c70a6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0090  19c70b0:	48 89 c1             	mov    %rax,%rcx
0093  19c70b3:	83 e0 07             	and    $0x7,%eax
0096  19c70b6:	48 c1 e9 03          	shr    $0x3,%rcx
009a  19c70ba:	83 c0 03             	add    $0x3,%eax
009d  19c70bd:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
00a1  19c70c1:	38 d0                	cmp    %dl,%al
00a3  19c70c3:	7c 08                	jl     19c70cd <mptctl_timeout_expired+0xad>
00a5  19c70c5:	84 d2                	test   %dl,%dl
00a7  19c70c7:	0f 85 a3 02 00 00    	jne    19c7370 <mptctl_timeout_expired+0x350>
00ad  19c70cd:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 19c70d3 <mptctl_timeout_expired+0xb3>	19c70cf: R_X86_64_PC32	mpt_fwfault_debug-0x4
00b3  19c70d3:	85 c0                	test   %eax,%eax
00b5  19c70d5:	0f 85 b8 01 00 00    	jne    19c7293 <mptctl_timeout_expired+0x273>
00bb  19c70db:	4d 8d bc 24 10 12 00 00 	lea    0x1210(%r12),%r15
00c3  19c70e3:	4c 89 ff             	mov    %r15,%rdi
00c6  19c70e6:	e8 00 00 00 00       	call   19c70eb <mptctl_timeout_expired+0xcb>	19c70e7: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
00cb  19c70eb:	49 8d bc 24 5d 12 00 00 	lea    0x125d(%r12),%rdi
00d3  19c70f3:	48 89 fa             	mov    %rdi,%rdx
00d6  19c70f6:	48 89 c6             	mov    %rax,%rsi
00d9  19c70f9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00e3  19c7103:	48 c1 ea 03          	shr    $0x3,%rdx
00e7  19c7107:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
00eb  19c710b:	48 89 fa             	mov    %rdi,%rdx
00ee  19c710e:	83 e2 07             	and    $0x7,%edx
00f1  19c7111:	38 d0                	cmp    %dl,%al
00f3  19c7113:	7f 08                	jg     19c711d <mptctl_timeout_expired+0xfd>
00f5  19c7115:	84 c0                	test   %al,%al
00f7  19c7117:	0f 85 41 02 00 00    	jne    19c735e <mptctl_timeout_expired+0x33e>
00fd  19c711d:	41 80 bc 24 5d 12 00 00 00 	cmpb   $0x0,0x125d(%r12)
0106  19c7126:	4c 89 ff             	mov    %r15,%rdi
0109  19c7129:	0f 85 15 01 00 00    	jne    19c7244 <mptctl_timeout_expired+0x224>
010f  19c712f:	e8 00 00 00 00       	call   19c7134 <mptctl_timeout_expired+0x114>	19c7130: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0114  19c7134:	49 8d bc 24 00 12 00 00 	lea    0x1200(%r12),%rdi
011c  19c713c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0126  19c7146:	48 89 fa             	mov    %rdi,%rdx
0129  19c7149:	48 c1 ea 03          	shr    $0x3,%rdx
012d  19c714d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0131  19c7151:	84 c0                	test   %al,%al
0133  19c7153:	74 06                	je     19c715b <mptctl_timeout_expired+0x13b>
0135  19c7155:	0f 8e 47 02 00 00    	jle    19c73a2 <mptctl_timeout_expired+0x382>
013b  19c715b:	49 8d bc 24 e0 00 00 00 	lea    0xe0(%r12),%rdi
0143  19c7163:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
014d  19c716d:	41 80 a4 24 00 12 00 00 fb 	andb   $0xfb,0x1200(%r12)
0156  19c7176:	48 89 fa             	mov    %rdi,%rdx
0159  19c7179:	48 c1 ea 03          	shr    $0x3,%rdx
015d  19c717d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0161  19c7181:	84 c0                	test   %al,%al
0163  19c7183:	74 06                	je     19c718b <mptctl_timeout_expired+0x16b>
0165  19c7185:	0f 8e 0d 02 00 00    	jle    19c7398 <mptctl_timeout_expired+0x378>
016b  19c718b:	41 80 bc 24 e0 00 00 00 02 	cmpb   $0x2,0xe0(%r12)
0174  19c7194:	74 68                	je     19c71fe <mptctl_timeout_expired+0x1de>
0176  19c7196:	84 db                	test   %bl,%bl
0178  19c7198:	0f 84 83 01 00 00    	je     19c7321 <mptctl_timeout_expired+0x301>
017e  19c719e:	80 fb 16             	cmp    $0x16,%bl
0181  19c71a1:	0f 84 7a 01 00 00    	je     19c7321 <mptctl_timeout_expired+0x301>
0187  19c71a7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0191  19c71b1:	4c 89 f2             	mov    %r14,%rdx
0194  19c71b4:	48 c1 ea 03          	shr    $0x3,%rdx
0198  19c71b8:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
019c  19c71bc:	84 c0                	test   %al,%al
019e  19c71be:	74 08                	je     19c71c8 <mptctl_timeout_expired+0x1a8>
01a0  19c71c0:	3c 03                	cmp    $0x3,%al
01a2  19c71c2:	0f 8e ee 01 00 00    	jle    19c73b6 <mptctl_timeout_expired+0x396>
01a8  19c71c8:	41 f6 84 24 c9 00 00 00 01 	testb  $0x1,0xc9(%r12)
01b1  19c71d1:	0f 85 f6 01 00 00    	jne    19c73cd <mptctl_timeout_expired+0x3ad>
01b7  19c71d7:	be 01 00 00 00       	mov    $0x1,%esi
01bc  19c71dc:	4c 89 e7             	mov    %r12,%rdi
01bf  19c71df:	e8 00 00 00 00       	call   19c71e4 <mptctl_timeout_expired+0x1c4>	19c71e0: R_X86_64_PLT32	mpt_Soft_Hard_ResetHandler-0x4
01c4  19c71e4:	4c 89 ee             	mov    %r13,%rsi
01c7  19c71e7:	4c 89 e7             	mov    %r12,%rdi
01ca  19c71ea:	e8 00 00 00 00       	call   19c71ef <mptctl_timeout_expired+0x1cf>	19c71eb: R_X86_64_PLT32	mpt_free_msg_frame-0x4
01cf  19c71ef:	48 83 c4 08          	add    $0x8,%rsp
01d3  19c71f3:	5b                   	pop    %rbx
01d4  19c71f4:	41 5c                	pop    %r12
01d6  19c71f6:	41 5d                	pop    %r13
01d8  19c71f8:	41 5e                	pop    %r14
01da  19c71fa:	41 5f                	pop    %r15
01dc  19c71fc:	5d                   	pop    %rbp
01dd  19c71fd:	c3                   	ret
01de  19c71fe:	84 db                	test   %bl,%bl
01e0  19c7200:	0f 84 9a 00 00 00    	je     19c72a0 <mptctl_timeout_expired+0x280>
01e6  19c7206:	80 fb 16             	cmp    $0x16,%bl
01e9  19c7209:	75 9c                	jne    19c71a7 <mptctl_timeout_expired+0x187>
01eb  19c720b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01f5  19c7215:	49 8d 7d 01          	lea    0x1(%r13),%rdi
01f9  19c7219:	48 89 fa             	mov    %rdi,%rdx
01fc  19c721c:	48 c1 ea 03          	shr    $0x3,%rdx
0200  19c7220:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0204  19c7224:	48 89 fa             	mov    %rdi,%rdx
0207  19c7227:	83 e2 07             	and    $0x7,%edx
020a  19c722a:	38 d0                	cmp    %dl,%al
020c  19c722c:	0f 8f 16 01 00 00    	jg     19c7348 <mptctl_timeout_expired+0x328>
0212  19c7232:	84 c0                	test   %al,%al
0214  19c7234:	0f 84 0e 01 00 00    	je     19c7348 <mptctl_timeout_expired+0x328>
021a  19c723a:	e8 00 00 00 00       	call   19c723f <mptctl_timeout_expired+0x21f>	19c723b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
021f  19c723f:	e9 04 01 00 00       	jmp    19c7348 <mptctl_timeout_expired+0x328>
0224  19c7244:	e8 00 00 00 00       	call   19c7249 <mptctl_timeout_expired+0x229>	19c7245: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0229  19c7249:	49 8d bc 24 00 12 00 00 	lea    0x1200(%r12),%rdi
0231  19c7251:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
023b  19c725b:	48 89 fa             	mov    %rdi,%rdx
023e  19c725e:	48 c1 ea 03          	shr    $0x3,%rdx
0242  19c7262:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0246  19c7266:	84 c0                	test   %al,%al
0248  19c7268:	74 06                	je     19c7270 <mptctl_timeout_expired+0x250>
024a  19c726a:	0f 8e 3c 01 00 00    	jle    19c73ac <mptctl_timeout_expired+0x38c>
0250  19c7270:	41 80 a4 24 00 12 00 00 fb 	andb   $0xfb,0x1200(%r12)
0259  19c7279:	4c 89 ee             	mov    %r13,%rsi
025c  19c727c:	4c 89 e7             	mov    %r12,%rdi
025f  19c727f:	e8 00 00 00 00       	call   19c7284 <mptctl_timeout_expired+0x264>	19c7280: R_X86_64_PLT32	mpt_free_msg_frame-0x4
0264  19c7284:	48 83 c4 08          	add    $0x8,%rsp
0268  19c7288:	5b                   	pop    %rbx
0269  19c7289:	41 5c                	pop    %r12
026b  19c728b:	41 5d                	pop    %r13
026d  19c728d:	41 5e                	pop    %r14
026f  19c728f:	41 5f                	pop    %r15
0271  19c7291:	5d                   	pop    %rbp
0272  19c7292:	c3                   	ret
0273  19c7293:	4c 89 e7             	mov    %r12,%rdi
0276  19c7296:	e8 00 00 00 00       	call   19c729b <mptctl_timeout_expired+0x27b>	19c7297: R_X86_64_PLT32	mpt_halt_firmware-0x4
027b  19c729b:	e9 3b fe ff ff       	jmp    19c70db <mptctl_timeout_expired+0xbb>
0280  19c72a0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
028a  19c72aa:	4c 89 ea             	mov    %r13,%rdx
028d  19c72ad:	48 c1 ea 03          	shr    $0x3,%rdx
0291  19c72b1:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0295  19c72b5:	4c 89 ea             	mov    %r13,%rdx
0298  19c72b8:	83 e2 07             	and    $0x7,%edx
029b  19c72bb:	38 d0                	cmp    %dl,%al
029d  19c72bd:	7f 0c                	jg     19c72cb <mptctl_timeout_expired+0x2ab>
029f  19c72bf:	84 c0                	test   %al,%al
02a1  19c72c1:	74 08                	je     19c72cb <mptctl_timeout_expired+0x2ab>
02a3  19c72c3:	4c 89 ef             	mov    %r13,%rdi
02a6  19c72c6:	e8 00 00 00 00       	call   19c72cb <mptctl_timeout_expired+0x2ab>	19c72c7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
02ab  19c72cb:	49 8d 7d 01          	lea    0x1(%r13),%rdi
02af  19c72cf:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
02b4  19c72d4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02be  19c72de:	48 89 fa             	mov    %rdi,%rdx
02c1  19c72e1:	48 c1 ea 03          	shr    $0x3,%rdx
02c5  19c72e5:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
02c9  19c72e9:	48 89 fa             	mov    %rdi,%rdx
02cc  19c72ec:	83 e2 07             	and    $0x7,%edx
02cf  19c72ef:	38 d0                	cmp    %dl,%al
02d1  19c72f1:	7f 0f                	jg     19c7302 <mptctl_timeout_expired+0x2e2>
02d3  19c72f3:	84 c0                	test   %al,%al
02d5  19c72f5:	74 0b                	je     19c7302 <mptctl_timeout_expired+0x2e2>
02d7  19c72f7:	89 4d d0             	mov    %ecx,-0x30(%rbp)
02da  19c72fa:	e8 00 00 00 00       	call   19c72ff <mptctl_timeout_expired+0x2df>	19c72fb: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
02df  19c72ff:	8b 4d d0             	mov    -0x30(%rbp),%ecx
02e2  19c7302:	41 0f b6 55 01       	movzbl 0x1(%r13),%edx
02e7  19c7307:	be 03 00 00 00       	mov    $0x3,%esi
02ec  19c730c:	4c 89 e7             	mov    %r12,%rdi
02ef  19c730f:	e8 0c f1 ff ff       	call   19c6420 <mptctl_do_taskmgmt>
02f4  19c7314:	85 c0                	test   %eax,%eax
02f6  19c7316:	0f 85 8b fe ff ff    	jne    19c71a7 <mptctl_timeout_expired+0x187>
02fc  19c731c:	e9 ce fe ff ff       	jmp    19c71ef <mptctl_timeout_expired+0x1cf>
0301  19c7321:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
030b  19c732b:	49 8d 7d 01          	lea    0x1(%r13),%rdi
030f  19c732f:	48 89 fa             	mov    %rdi,%rdx
0312  19c7332:	48 c1 ea 03          	shr    $0x3,%rdx
0316  19c7336:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
031a  19c733a:	48 89 fa             	mov    %rdi,%rdx
031d  19c733d:	83 e2 07             	and    $0x7,%edx
0320  19c7340:	38 d0                	cmp    %dl,%al
0322  19c7342:	7f 04                	jg     19c7348 <mptctl_timeout_expired+0x328>
0324  19c7344:	84 c0                	test   %al,%al
0326  19c7346:	75 7b                	jne    19c73c3 <mptctl_timeout_expired+0x3a3>
0328  19c7348:	41 0f b6 55 01       	movzbl 0x1(%r13),%edx
032d  19c734d:	31 c9                	xor    %ecx,%ecx
032f  19c734f:	be 04 00 00 00       	mov    $0x4,%esi
0334  19c7354:	4c 89 e7             	mov    %r12,%rdi
0337  19c7357:	e8 c4 f0 ff ff       	call   19c6420 <mptctl_do_taskmgmt>
033c  19c735c:	eb b6                	jmp    19c7314 <mptctl_timeout_expired+0x2f4>
033e  19c735e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
0342  19c7362:	e8 00 00 00 00       	call   19c7367 <mptctl_timeout_expired+0x347>	19c7363: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0347  19c7367:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
034b  19c736b:	e9 ad fd ff ff       	jmp    19c711d <mptctl_timeout_expired+0xfd>
0350  19c7370:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	19c7373: R_X86_64_32S	mpt_fwfault_debug
0357  19c7377:	e8 00 00 00 00       	call   19c737c <mptctl_timeout_expired+0x35c>	19c7378: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
035c  19c737c:	e9 4c fd ff ff       	jmp    19c70cd <mptctl_timeout_expired+0xad>
0361  19c7381:	4c 89 f7             	mov    %r14,%rdi
0364  19c7384:	e8 00 00 00 00       	call   19c7389 <mptctl_timeout_expired+0x369>	19c7385: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0369  19c7389:	e9 02 fd ff ff       	jmp    19c7090 <mptctl_timeout_expired+0x70>
036e  19c738e:	e8 00 00 00 00       	call   19c7393 <mptctl_timeout_expired+0x373>	19c738f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0373  19c7393:	e9 ca fc ff ff       	jmp    19c7062 <mptctl_timeout_expired+0x42>
0378  19c7398:	e8 00 00 00 00       	call   19c739d <mptctl_timeout_expired+0x37d>	19c7399: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
037d  19c739d:	e9 e9 fd ff ff       	jmp    19c718b <mptctl_timeout_expired+0x16b>
0382  19c73a2:	e8 00 00 00 00       	call   19c73a7 <mptctl_timeout_expired+0x387>	19c73a3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0387  19c73a7:	e9 af fd ff ff       	jmp    19c715b <mptctl_timeout_expired+0x13b>
038c  19c73ac:	e8 00 00 00 00       	call   19c73b1 <mptctl_timeout_expired+0x391>	19c73ad: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0391  19c73b1:	e9 ba fe ff ff       	jmp    19c7270 <mptctl_timeout_expired+0x250>
0396  19c73b6:	4c 89 f7             	mov    %r14,%rdi
0399  19c73b9:	e8 00 00 00 00       	call   19c73be <mptctl_timeout_expired+0x39e>	19c73ba: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
039e  19c73be:	e9 05 fe ff ff       	jmp    19c71c8 <mptctl_timeout_expired+0x1a8>
03a3  19c73c3:	e8 00 00 00 00       	call   19c73c8 <mptctl_timeout_expired+0x3a8>	19c73c4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
03a8  19c73c8:	e9 7b ff ff ff       	jmp    19c7348 <mptctl_timeout_expired+0x328>
03ad  19c73cd:	e9 00 00 00 00       	jmp    19c73d2 <mptctl_timeout_expired+0x3b2>	19c73ce: R_X86_64_PC32	.text.unlikely+0x11dbae
03b2  19c73d2:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
03bd  19c73dd:	0f 1f 00             	nopl   (%rax)
0000 000000000011db95 <mptctl_timeout_expired.cold>:
0000   11db95:	49 8d 74 24 08       	lea    0x8(%r12),%rsi
0005   11db9a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	11db9d: R_X86_64_32S	.rodata+0x4d5ac0
000c   11dba1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11dba4: R_X86_64_32S	.rodata+0x4d37a0
0013   11dba8:	e8 00 00 00 00       	call   11dbad <mptctl_timeout_expired.cold+0x18>	11dba9: R_X86_64_PLT32	_printk-0x4
0018   11dbad:	e9 00 00 00 00       	jmp    11dbb2 <mptctl_timeout_expired.cold+0x1d>	11dbae: R_X86_64_PC32	.text+0x19c709b
001d   11dbb2:	49 8d 74 24 08       	lea    0x8(%r12),%rsi
0022   11dbb7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11dbba: R_X86_64_32S	.rodata+0x4d37e0
0029   11dbbe:	e8 00 00 00 00       	call   11dbc3 <mptctl_timeout_expired.cold+0x2e>	11dbbf: R_X86_64_PLT32	_printk-0x4
002e   11dbc3:	e9 00 00 00 00       	jmp    11dbc8 <kfree_sgl.cold>	11dbc4: R_X86_64_PC32	.text+0x19c71d3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
