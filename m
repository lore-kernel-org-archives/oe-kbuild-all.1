Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26E17CE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 06:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677996320; x=1709532320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2rYz05WNBX9vIhsNX5PLqA0UDzVXcetuYOhN38Qv5k=;
  b=V2/UZyiCbmFpOUzF5DeVF69HkJtpyeycw5GtyGo0jcPoBvTX0qkP+mqh
   YNWz4rPYg6OtsrChT2iSWSNG8IHBdkUKKraMvmTB6iuN1Im3wA5PmO0BK
   XA+sS15wMR8CVU/xHZ7WUHAIEoQRhz/FGBf/e3fvvZTRpYznNWd+ILkpK
   SzMnjgEsbF8MntPp04ACZjRGqJaYbBGIKEBDiIGvySQtAKI4cbGd/EKLU
   dMAqqjVZ0cEik8cpOt2p3SfKgYIPhq+cO4qBFDbubDKSDLu/j0Wi+O4e+
   Nqtr5YUf7Brm877rU1DbXpKHU3R5TpvMaDiK+nSiDfnliQEkSG3WGul46
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="319174785"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="319174785"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 22:05:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="921542884"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="921542884"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Mar 2023 22:05:17 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYhUj-0002Zt-0G;
	Sun, 05 Mar 2023 06:05:17 +0000
Date: Sun, 5 Mar 2023 14:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [linux-stable-rc:queue/6.2 657/745] vmlinux.o: warning: objtool:
 btrfs_unfreeze+0x3e1: unreachable instruction
Message-ID: <202303051302.FSTuNchQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.2
head:   adfadd03a8b460e75b9dd9fbedc2875f000417a8
commit: 54b3db8f985d6ad6cde2f9a3e53f88ef4ebd1b45 [657/745] Compiler attributes: GCC cold function alignment workarounds
config: x86_64-randconfig-a006 (https://download.01.org/0day-ci/archive/20230305/202303051302.FSTuNchQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=54b3db8f985d6ad6cde2f9a3e53f88ef4ebd1b45
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.2
        git checkout 54b3db8f985d6ad6cde2f9a3e53f88ef4ebd1b45
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303051302.FSTuNchQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: btrfs_unfreeze+0x3e1: unreachable instruction


objdump-func vmlinux.o btrfs_unfreeze:
0000 0000000000dd1ca0 <btrfs_unfreeze>:
0000   dd1ca0:	f3 0f 1e fa          	endbr64
0004   dd1ca4:	e8 00 00 00 00       	call   dd1ca9 <btrfs_unfreeze+0x9>	dd1ca5: R_X86_64_PLT32	__fentry__-0x4
0009   dd1ca9:	41 57                	push   %r15
000b   dd1cab:	41 56                	push   %r14
000d   dd1cad:	41 55                	push   %r13
000f   dd1caf:	41 54                	push   %r12
0011   dd1cb1:	55                   	push   %rbp
0012   dd1cb2:	53                   	push   %rbx
0013   dd1cb3:	48 83 ec 18          	sub    $0x18,%rsp
0017   dd1cb7:	48 89 fb             	mov    %rdi,%rbx
001a   dd1cba:	48 81 c7 70 06 00 00 	add    $0x670,%rdi
0021   dd1cc1:	48 89 fa             	mov    %rdi,%rdx
0024   dd1cc4:	48 c1 ea 03          	shr    $0x3,%rdx
0028   dd1cc8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0032   dd1cd2:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0036   dd1cd6:	0f 85 aa 04 00 00    	jne    dd2186 <btrfs_unfreeze+0x4e6>
003c   dd1cdc:	4c 8b ab 70 06 00 00 	mov    0x670(%rbx),%r13
0043   dd1ce3:	49 8d 85 20 11 00 00 	lea    0x1120(%r13),%rax
004a   dd1cea:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
004f   dd1cef:	48 89 c2             	mov    %rax,%rdx
0052   dd1cf2:	48 c1 ea 03          	shr    $0x3,%rdx
0056   dd1cf6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0060   dd1d00:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0064   dd1d04:	0f 85 6d 04 00 00    	jne    dd2177 <btrfs_unfreeze+0x4d7>
006a   dd1d0a:	49 8b 9d 20 11 00 00 	mov    0x1120(%r13),%rbx
0071   dd1d11:	48 8d ab 08 01 00 00 	lea    0x108(%rbx),%rbp
0078   dd1d18:	48 89 ea             	mov    %rbp,%rdx
007b   dd1d1b:	48 c1 ea 03          	shr    $0x3,%rdx
007f   dd1d1f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0089   dd1d29:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
008d   dd1d2d:	0f 85 04 04 00 00    	jne    dd2137 <btrfs_unfreeze+0x497>
0093   dd1d33:	48 8b 9b 08 01 00 00 	mov    0x108(%rbx),%rbx
009a   dd1d3a:	48 39 eb             	cmp    %rbp,%rbx
009d   dd1d3d:	0f 84 e3 01 00 00    	je     dd1f26 <btrfs_unfreeze+0x286>
00a3   dd1d43:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
00ad   dd1d4d:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
00b2   dd1d52:	49 c1 ee 03          	shr    $0x3,%r14
00b6   dd1d56:	49 01 ee             	add    %rbp,%r14
00b9   dd1d59:	48 8d 7b 38          	lea    0x38(%rbx),%rdi
00bd   dd1d5d:	48 89 f8             	mov    %rdi,%rax
00c0   dd1d60:	48 c1 e8 03          	shr    $0x3,%rax
00c4   dd1d64:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00c8   dd1d68:	0f 85 57 03 00 00    	jne    dd20c5 <btrfs_unfreeze+0x425>
00ce   dd1d6e:	4c 8b 7b 38          	mov    0x38(%rbx),%r15
00d2   dd1d72:	4d 8d 67 10          	lea    0x10(%r15),%r12
00d6   dd1d76:	be 08 00 00 00       	mov    $0x8,%esi
00db   dd1d7b:	4c 89 e7             	mov    %r12,%rdi
00de   dd1d7e:	e8 00 00 00 00       	call   dd1d83 <btrfs_unfreeze+0xe3>	dd1d7f: R_X86_64_PLT32	__kasan_check_read-0x4
00e3   dd1d83:	4c 89 e0             	mov    %r12,%rax
00e6   dd1d86:	48 c1 e8 03          	shr    $0x3,%rax
00ea   dd1d8a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00ee   dd1d8e:	0f 85 21 03 00 00    	jne    dd20b5 <btrfs_unfreeze+0x415>
00f4   dd1d94:	49 8b 47 10          	mov    0x10(%r15),%rax
00f8   dd1d98:	f6 c4 08             	test   $0x8,%ah
00fb   dd1d9b:	0f 84 c8 02 00 00    	je     dd2069 <btrfs_unfreeze+0x3c9>
0101   dd1da1:	48 8d 7b 50          	lea    0x50(%rbx),%rdi
0105   dd1da5:	48 89 f8             	mov    %rdi,%rax
0108   dd1da8:	48 c1 e8 03          	shr    $0x3,%rax
010c   dd1dac:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0110   dd1db0:	0f 85 f4 02 00 00    	jne    dd20aa <btrfs_unfreeze+0x40a>
0116   dd1db6:	48 8b 7b 50          	mov    0x50(%rbx),%rdi
011a   dd1dba:	48 85 ff             	test   %rdi,%rdi
011d   dd1dbd:	0f 84 4c 02 00 00    	je     dd200f <btrfs_unfreeze+0x36f>
0123   dd1dc3:	ba 01 00 00 00       	mov    $0x1,%edx
0128   dd1dc8:	31 f6                	xor    %esi,%esi
012a   dd1dca:	e8 00 00 00 00       	call   dd1dcf <btrfs_unfreeze+0x12f>	dd1dcb: R_X86_64_PLT32	btrfs_read_dev_one_super-0x4
012f   dd1dcf:	49 89 c4             	mov    %rax,%r12
0132   dd1dd2:	89 c1                	mov    %eax,%ecx
0134   dd1dd4:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
013a   dd1dda:	0f 87 27 02 00 00    	ja     dd2007 <btrfs_unfreeze+0x367>
0140   dd1de0:	48 8d b8 c4 00 00 00 	lea    0xc4(%rax),%rdi
0147   dd1de7:	48 89 f8             	mov    %rdi,%rax
014a   dd1dea:	48 c1 e8 03          	shr    $0x3,%rax
014e   dd1dee:	0f b6 0c 28          	movzbl (%rax,%rbp,1),%ecx
0152   dd1df2:	49 8d 84 24 c5 00 00 00 	lea    0xc5(%r12),%rax
015a   dd1dfa:	48 89 c2             	mov    %rax,%rdx
015d   dd1dfd:	48 c1 ea 03          	shr    $0x3,%rdx
0161   dd1e01:	0f b6 14 2a          	movzbl (%rdx,%rbp,1),%edx
0165   dd1e05:	48 89 fe             	mov    %rdi,%rsi
0168   dd1e08:	83 e6 07             	and    $0x7,%esi
016b   dd1e0b:	40 38 f1             	cmp    %sil,%cl
016e   dd1e0e:	40 0f 9e c6          	setle  %sil
0172   dd1e12:	84 c9                	test   %cl,%cl
0174   dd1e14:	0f 95 c1             	setne  %cl
0177   dd1e17:	40 84 ce             	test   %cl,%sil
017a   dd1e1a:	0f 85 e7 02 00 00    	jne    dd2107 <btrfs_unfreeze+0x467>
0180   dd1e20:	83 e0 07             	and    $0x7,%eax
0183   dd1e23:	38 c2                	cmp    %al,%dl
0185   dd1e25:	0f 9e c1             	setle  %cl
0188   dd1e28:	84 d2                	test   %dl,%dl
018a   dd1e2a:	0f 95 c0             	setne  %al
018d   dd1e2d:	84 c1                	test   %al,%cl
018f   dd1e2f:	0f 85 d2 02 00 00    	jne    dd2107 <btrfs_unfreeze+0x467>
0195   dd1e35:	41 0f b7 94 24 c4 00 00 00 	movzwl 0xc4(%r12),%edx
019e   dd1e3e:	49 8d bf c0 06 00 00 	lea    0x6c0(%r15),%rdi
01a5   dd1e45:	48 89 f8             	mov    %rdi,%rax
01a8   dd1e48:	48 c1 e8 03          	shr    $0x3,%rax
01ac   dd1e4c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
01b0   dd1e50:	0f 85 9f 02 00 00    	jne    dd20f5 <btrfs_unfreeze+0x455>
01b6   dd1e56:	49 8b 8f c0 06 00 00 	mov    0x6c0(%r15),%rcx
01bd   dd1e5d:	48 8d b9 c4 00 00 00 	lea    0xc4(%rcx),%rdi
01c4   dd1e64:	48 89 f8             	mov    %rdi,%rax
01c7   dd1e67:	48 c1 e8 03          	shr    $0x3,%rax
01cb   dd1e6b:	44 0f b6 0c 28       	movzbl (%rax,%rbp,1),%r9d
01d0   dd1e70:	48 8d 81 c5 00 00 00 	lea    0xc5(%rcx),%rax
01d7   dd1e77:	48 89 c6             	mov    %rax,%rsi
01da   dd1e7a:	48 c1 ee 03          	shr    $0x3,%rsi
01de   dd1e7e:	0f b6 34 2e          	movzbl (%rsi,%rbp,1),%esi
01e2   dd1e82:	49 89 fa             	mov    %rdi,%r10
01e5   dd1e85:	41 83 e2 07          	and    $0x7,%r10d
01e9   dd1e89:	45 38 d1             	cmp    %r10b,%r9b
01ec   dd1e8c:	41 0f 9e c2          	setle  %r10b
01f0   dd1e90:	45 84 c9             	test   %r9b,%r9b
01f3   dd1e93:	41 0f 95 c1          	setne  %r9b
01f7   dd1e97:	45 84 ca             	test   %r9b,%r10b
01fa   dd1e9a:	0f 85 76 02 00 00    	jne    dd2116 <btrfs_unfreeze+0x476>
0200   dd1ea0:	83 e0 07             	and    $0x7,%eax
0203   dd1ea3:	40 38 c6             	cmp    %al,%sil
0206   dd1ea6:	41 0f 9e c1          	setle  %r9b
020a   dd1eaa:	40 84 f6             	test   %sil,%sil
020d   dd1ead:	0f 95 c0             	setne  %al
0210   dd1eb0:	41 84 c1             	test   %al,%r9b
0213   dd1eb3:	0f 85 5d 02 00 00    	jne    dd2116 <btrfs_unfreeze+0x476>
0219   dd1eb9:	0f b7 89 c4 00 00 00 	movzwl 0xc4(%rcx),%ecx
0220   dd1ec0:	66 39 ca             	cmp    %cx,%dx
0223   dd1ec3:	0f 84 82 00 00 00    	je     dd1f4b <btrfs_unfreeze+0x2ab>
0229   dd1ec9:	0f b7 d2             	movzwl %dx,%edx
022c   dd1ecc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	dd1ecf: R_X86_64_32S	.rodata+0x213580
0233   dd1ed3:	4c 89 ff             	mov    %r15,%rdi
0236   dd1ed6:	e8 00 00 00 00       	call   dd1edb <btrfs_unfreeze+0x23b>	dd1ed7: R_X86_64_PLT32	_btrfs_printk-0x4
023b   dd1edb:	4c 89 e7             	mov    %r12,%rdi
023e   dd1ede:	e8 00 00 00 00       	call   dd1ee3 <btrfs_unfreeze+0x243>	dd1edf: R_X86_64_PLT32	btrfs_release_disk_super-0x4
0243   dd1ee3:	b9 8b ff ff ff       	mov    $0xffffff8b,%ecx
0248   dd1ee8:	48 8d 7b 78          	lea    0x78(%rbx),%rdi
024c   dd1eec:	48 89 fa             	mov    %rdi,%rdx
024f   dd1eef:	48 c1 ea 03          	shr    $0x3,%rdx
0253   dd1ef3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
025d   dd1efd:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0261   dd1f01:	0f 85 8e 02 00 00    	jne    dd2195 <btrfs_unfreeze+0x4f5>
0267   dd1f07:	4c 8b 4b 78          	mov    0x78(%rbx),%r9
026b   dd1f0b:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	dd1f0e: R_X86_64_32S	.rodata+0x2136a0
0272   dd1f12:	ba 09 09 00 00       	mov    $0x909,%edx
0277   dd1f17:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	dd1f1a: R_X86_64_32S	.rodata+0x216180
027e   dd1f1e:	4c 89 ef             	mov    %r13,%rdi
0281   dd1f21:	e8 00 00 00 00       	call   dd1f26 <btrfs_unfreeze+0x286>	dd1f22: R_X86_64_PLT32	__btrfs_handle_fs_error-0x4
0286   dd1f26:	49 8d 7d 10          	lea    0x10(%r13),%rdi
028a   dd1f2a:	be 08 00 00 00       	mov    $0x8,%esi
028f   dd1f2f:	e8 00 00 00 00       	call   dd1f34 <btrfs_unfreeze+0x294>	dd1f30: R_X86_64_PLT32	__kasan_check_write-0x4
0294   dd1f34:	f0 41 80 65 11 f7    	lock andb $0xf7,0x11(%r13)
029a   dd1f3a:	31 c0                	xor    %eax,%eax
029c   dd1f3c:	48 83 c4 18          	add    $0x18,%rsp
02a0   dd1f40:	5b                   	pop    %rbx
02a1   dd1f41:	5d                   	pop    %rbp
02a2   dd1f42:	41 5c                	pop    %r12
02a4   dd1f44:	41 5d                	pop    %r13
02a6   dd1f46:	41 5e                	pop    %r14
02a8   dd1f48:	41 5f                	pop    %r15
02aa   dd1f4a:	c3                   	ret
02ab   dd1f4b:	4c 89 e6             	mov    %r12,%rsi
02ae   dd1f4e:	4c 89 ff             	mov    %r15,%rdi
02b1   dd1f51:	e8 00 00 00 00       	call   dd1f56 <btrfs_unfreeze+0x2b6>	dd1f52: R_X86_64_PLT32	btrfs_check_super_csum-0x4
02b6   dd1f56:	85 c0                	test   %eax,%eax
02b8   dd1f58:	0f 85 ea 00 00 00    	jne    dd2048 <btrfs_unfreeze+0x3a8>
02be   dd1f5e:	31 d2                	xor    %edx,%edx
02c0   dd1f60:	4c 89 e6             	mov    %r12,%rsi
02c3   dd1f63:	4c 89 ff             	mov    %r15,%rdi
02c6   dd1f66:	e8 00 00 00 00       	call   dd1f6b <btrfs_unfreeze+0x2cb>	dd1f67: R_X86_64_PLT32	btrfs_validate_super-0x4
02cb   dd1f6b:	89 c1                	mov    %eax,%ecx
02cd   dd1f6d:	85 c0                	test   %eax,%eax
02cf   dd1f6f:	0f 88 82 00 00 00    	js     dd1ff7 <btrfs_unfreeze+0x357>
02d5   dd1f75:	49 8d 7c 24 48       	lea    0x48(%r12),%rdi
02da   dd1f7a:	48 89 f8             	mov    %rdi,%rax
02dd   dd1f7d:	48 c1 e8 03          	shr    $0x3,%rax
02e1   dd1f81:	0f b6 34 28          	movzbl (%rax,%rbp,1),%esi
02e5   dd1f85:	49 8d 44 24 4f       	lea    0x4f(%r12),%rax
02ea   dd1f8a:	48 89 c2             	mov    %rax,%rdx
02ed   dd1f8d:	48 c1 ea 03          	shr    $0x3,%rdx
02f1   dd1f91:	0f b6 14 2a          	movzbl (%rdx,%rbp,1),%edx
02f5   dd1f95:	49 89 f9             	mov    %rdi,%r9
02f8   dd1f98:	41 83 e1 07          	and    $0x7,%r9d
02fc   dd1f9c:	44 38 ce             	cmp    %r9b,%sil
02ff   dd1f9f:	41 0f 9e c1          	setle  %r9b
0303   dd1fa3:	40 84 f6             	test   %sil,%sil
0306   dd1fa6:	40 0f 95 c6          	setne  %sil
030a   dd1faa:	41 84 f1             	test   %sil,%r9b
030d   dd1fad:	0f 85 91 01 00 00    	jne    dd2144 <btrfs_unfreeze+0x4a4>
0313   dd1fb3:	83 e0 07             	and    $0x7,%eax
0316   dd1fb6:	38 c2                	cmp    %al,%dl
0318   dd1fb8:	40 0f 9e c6          	setle  %sil
031c   dd1fbc:	84 d2                	test   %dl,%dl
031e   dd1fbe:	0f 95 c0             	setne  %al
0321   dd1fc1:	40 84 c6             	test   %al,%sil
0324   dd1fc4:	0f 85 7a 01 00 00    	jne    dd2144 <btrfs_unfreeze+0x4a4>
032a   dd1fca:	49 8b 54 24 48       	mov    0x48(%r12),%rdx
032f   dd1fcf:	49 8d bf f8 04 00 00 	lea    0x4f8(%r15),%rdi
0336   dd1fd6:	48 89 f8             	mov    %rdi,%rax
0339   dd1fd9:	48 c1 e8 03          	shr    $0x3,%rax
033d   dd1fdd:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0341   dd1fe1:	0f 85 74 01 00 00    	jne    dd215b <btrfs_unfreeze+0x4bb>
0347   dd1fe7:	4d 8b 8f f8 04 00 00 	mov    0x4f8(%r15),%r9
034e   dd1fee:	4c 39 ca             	cmp    %r9,%rdx
0351   dd1ff1:	0f 85 8f 00 00 00    	jne    dd2086 <btrfs_unfreeze+0x3e6>
0357   dd1ff7:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
035b   dd1ffb:	4c 89 e7             	mov    %r12,%rdi
035e   dd1ffe:	e8 00 00 00 00       	call   dd2003 <btrfs_unfreeze+0x363>	dd1fff: R_X86_64_PLT32	btrfs_release_disk_super-0x4
0363   dd2003:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
0367   dd2007:	85 c9                	test   %ecx,%ecx
0369   dd2009:	0f 88 d9 fe ff ff    	js     dd1ee8 <btrfs_unfreeze+0x248>
036f   dd200f:	48 89 d8             	mov    %rbx,%rax
0372   dd2012:	48 c1 e8 03          	shr    $0x3,%rax
0376   dd2016:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
037a   dd201a:	0f 85 c5 00 00 00    	jne    dd20e5 <btrfs_unfreeze+0x445>
0380   dd2020:	48 8b 1b             	mov    (%rbx),%rbx
0383   dd2023:	41 80 3e 00          	cmpb   $0x0,(%r14)
0387   dd2027:	0f 85 a8 00 00 00    	jne    dd20d5 <btrfs_unfreeze+0x435>
038d   dd202d:	49 8b 85 20 11 00 00 	mov    0x1120(%r13),%rax
0394   dd2034:	48 05 08 01 00 00    	add    $0x108,%rax
039a   dd203a:	48 39 c3             	cmp    %rax,%rbx
039d   dd203d:	0f 85 16 fd ff ff    	jne    dd1d59 <btrfs_unfreeze+0xb9>
03a3   dd2043:	e9 de fe ff ff       	jmp    dd1f26 <btrfs_unfreeze+0x286>
03a8   dd2048:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	dd204b: R_X86_64_32S	.rodata+0x2135e0
03af   dd204f:	4c 89 ff             	mov    %r15,%rdi
03b2   dd2052:	e8 00 00 00 00       	call   dd2057 <btrfs_unfreeze+0x3b7>	dd2053: R_X86_64_PLT32	_btrfs_printk-0x4
03b7   dd2057:	4c 89 e7             	mov    %r12,%rdi
03ba   dd205a:	e8 00 00 00 00       	call   dd205f <btrfs_unfreeze+0x3bf>	dd205b: R_X86_64_PLT32	btrfs_release_disk_super-0x4
03bf   dd205f:	b9 8b ff ff ff       	mov    $0xffffff8b,%ecx
03c4   dd2064:	e9 7f fe ff ff       	jmp    dd1ee8 <btrfs_unfreeze+0x248>
03c9   dd2069:	ba cd 08 00 00       	mov    $0x8cd,%edx
03ce   dd206e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	dd2071: R_X86_64_32S	.rodata+0x2134a0
03d5   dd2075:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	dd2078: R_X86_64_32S	.rodata+0x213520
03dc   dd207c:	e8 00 00 00 00       	call   dd2081 <btrfs_unfreeze+0x3e1>	dd207d: R_X86_64_PLT32	btrfs_assertfail-0x4
03e1   dd2081:	e9 1b fd ff ff       	jmp    dd1da1 <btrfs_unfreeze+0x101>
03e6   dd2086:	4c 89 c9             	mov    %r9,%rcx
03e9   dd2089:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	dd208c: R_X86_64_32S	.rodata+0x213640
03f0   dd2090:	4c 89 ff             	mov    %r15,%rdi
03f3   dd2093:	e8 00 00 00 00       	call   dd2098 <btrfs_unfreeze+0x3f8>	dd2094: R_X86_64_PLT32	_btrfs_printk-0x4
03f8   dd2098:	4c 89 e7             	mov    %r12,%rdi
03fb   dd209b:	e8 00 00 00 00       	call   dd20a0 <btrfs_unfreeze+0x400>	dd209c: R_X86_64_PLT32	btrfs_release_disk_super-0x4
0400   dd20a0:	b9 8b ff ff ff       	mov    $0xffffff8b,%ecx
0405   dd20a5:	e9 3e fe ff ff       	jmp    dd1ee8 <btrfs_unfreeze+0x248>
040a   dd20aa:	e8 00 00 00 00       	call   dd20af <btrfs_unfreeze+0x40f>	dd20ab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
040f   dd20af:	90                   	nop
0410   dd20b0:	e9 01 fd ff ff       	jmp    dd1db6 <btrfs_unfreeze+0x116>
0415   dd20b5:	4c 89 e7             	mov    %r12,%rdi
0418   dd20b8:	e8 00 00 00 00       	call   dd20bd <btrfs_unfreeze+0x41d>	dd20b9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
041d   dd20bd:	0f 1f 00             	nopl   (%rax)
0420   dd20c0:	e9 cf fc ff ff       	jmp    dd1d94 <btrfs_unfreeze+0xf4>
0425   dd20c5:	e8 00 00 00 00       	call   dd20ca <btrfs_unfreeze+0x42a>	dd20c6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
042a   dd20ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
0430   dd20d0:	e9 99 fc ff ff       	jmp    dd1d6e <btrfs_unfreeze+0xce>
0435   dd20d5:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
043a   dd20da:	e8 00 00 00 00       	call   dd20df <btrfs_unfreeze+0x43f>	dd20db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
043f   dd20df:	90                   	nop
0440   dd20e0:	e9 48 ff ff ff       	jmp    dd202d <btrfs_unfreeze+0x38d>
0445   dd20e5:	48 89 df             	mov    %rbx,%rdi
0448   dd20e8:	e8 00 00 00 00       	call   dd20ed <btrfs_unfreeze+0x44d>	dd20e9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
044d   dd20ed:	0f 1f 00             	nopl   (%rax)
0450   dd20f0:	e9 2b ff ff ff       	jmp    dd2020 <btrfs_unfreeze+0x380>
0455   dd20f5:	89 54 24 04          	mov    %edx,0x4(%rsp)
0459   dd20f9:	e8 00 00 00 00       	call   dd20fe <btrfs_unfreeze+0x45e>	dd20fa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
045e   dd20fe:	8b 54 24 04          	mov    0x4(%rsp),%edx
0462   dd2102:	e9 4f fd ff ff       	jmp    dd1e56 <btrfs_unfreeze+0x1b6>
0467   dd2107:	be 02 00 00 00       	mov    $0x2,%esi
046c   dd210c:	e8 00 00 00 00       	call   dd2111 <btrfs_unfreeze+0x471>	dd210d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0471   dd2111:	e9 1f fd ff ff       	jmp    dd1e35 <btrfs_unfreeze+0x195>
0476   dd2116:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
047b   dd211b:	89 54 24 04          	mov    %edx,0x4(%rsp)
047f   dd211f:	be 02 00 00 00       	mov    $0x2,%esi
0484   dd2124:	e8 00 00 00 00       	call   dd2129 <btrfs_unfreeze+0x489>	dd2125: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0489   dd2129:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
048e   dd212e:	8b 54 24 04          	mov    0x4(%rsp),%edx
0492   dd2132:	e9 82 fd ff ff       	jmp    dd1eb9 <btrfs_unfreeze+0x219>
0497   dd2137:	48 89 ef             	mov    %rbp,%rdi
049a   dd213a:	e8 00 00 00 00       	call   dd213f <btrfs_unfreeze+0x49f>	dd213b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
049f   dd213f:	e9 ef fb ff ff       	jmp    dd1d33 <btrfs_unfreeze+0x93>
04a4   dd2144:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
04a8   dd2148:	be 08 00 00 00       	mov    $0x8,%esi
04ad   dd214d:	e8 00 00 00 00       	call   dd2152 <btrfs_unfreeze+0x4b2>	dd214e: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
04b2   dd2152:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
04b6   dd2156:	e9 6f fe ff ff       	jmp    dd1fca <btrfs_unfreeze+0x32a>
04bb   dd215b:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
04c0   dd2160:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
04c4   dd2164:	e8 00 00 00 00       	call   dd2169 <btrfs_unfreeze+0x4c9>	dd2165: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04c9   dd2169:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
04ce   dd216e:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
04d2   dd2172:	e9 70 fe ff ff       	jmp    dd1fe7 <btrfs_unfreeze+0x347>
04d7   dd2177:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
04dc   dd217c:	e8 00 00 00 00       	call   dd2181 <btrfs_unfreeze+0x4e1>	dd217d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04e1   dd2181:	e9 84 fb ff ff       	jmp    dd1d0a <btrfs_unfreeze+0x6a>
04e6   dd2186:	e8 00 00 00 00       	call   dd218b <btrfs_unfreeze+0x4eb>	dd2187: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04eb   dd218b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
04f0   dd2190:	e9 47 fb ff ff       	jmp    dd1cdc <btrfs_unfreeze+0x3c>
04f5   dd2195:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
04f9   dd2199:	e8 00 00 00 00       	call   dd219e <btrfs_unfreeze+0x4fe>	dd219a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04fe   dd219e:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
0502   dd21a2:	e9 60 fd ff ff       	jmp    dd1f07 <btrfs_unfreeze+0x267>
0507   dd21a7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
