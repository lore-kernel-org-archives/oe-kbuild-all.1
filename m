Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F320F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693389456; x=1724925456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uH+06baDbp5Rdid3m0IKchYb4mmW1e2n13XbwsJ4BIg=;
  b=mZbhf1F1rvd50B9364PyjbccRTB15fbTjYXzsX8xW15ogoK+JVtGOIJM
   eNHtMwOwSrP1QV9hsNDFZFgcVaUEfmrKFA/NXhSrrNCtuQBbjA8bOUUAn
   JUkV5SMFS26yNHAmeqj1rFaHATyYlFsR27BJu7WQ3XhMsP1uxwY83yc+R
   nS9u0vmxWx5wUqw6Os8ltW6RkY3IxhfHPeb/1cUaiaYagiAnc4xC1QPTn
   FN2mA/iL984/S6yqO4ISGaix4Com+kX67g8cVTKcuTPxYxkfpa02tBUSA
   qhb/IjwmDLj9ikfgSjtr7LUaXkMsQfYH0rNQSyeAGaGdTL7kqMKZhG+QJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="365804776"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="365804776"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 02:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882677552"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2023 02:57:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbHwr-0009gl-2q;
	Wed, 30 Aug 2023 09:57:26 +0000
Date: Wed, 30 Aug 2023 17:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o: warning: objtool:
 kfd_mem_dmaunmap_attachment()+0x201: unreachable instruction
Message-ID: <202308301712.gQOqyzU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core63-43
head:   61b59f76f27b6ba04eb55fcc6b6d84d2bf4e76b6
commit: 42e6a211eecffbf811f5d643272779a72500e774 UPSTREAM: drm/amdgpu: DMA map/unmap when updating GPU mappings
date:   2 years, 2 months ago
config: x86_64-randconfig-015-20230829 (https://download.01.org/0day-ci/archive/20230830/202308301712.gQOqyzU8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301712.gQOqyzU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301712.gQOqyzU8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o: warning: objtool: kfd_mem_dmaunmap_attachment()+0x201: unreachable instruction


objdump-func vmlinux.o kfd_mem_dmaunmap_attachment:
0000 0000000001b9aca0 <kfd_mem_dmaunmap_attachment>:
0000  1b9aca0:	55                   	push   %rbp
0001  1b9aca1:	41 57                	push   %r15
0003  1b9aca3:	41 56                	push   %r14
0005  1b9aca5:	41 55                	push   %r13
0007  1b9aca7:	41 54                	push   %r12
0009  1b9aca9:	53                   	push   %rbx
000a  1b9acaa:	48 83 ec 28          	sub    $0x28,%rsp
000e  1b9acae:	49 89 f7             	mov    %rsi,%r15
0011  1b9acb1:	48 89 fb             	mov    %rdi,%rbx
0014  1b9acb4:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001d  1b9acbd:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0022  1b9acc2:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
002c  1b9accc:	4c 8d 76 10          	lea    0x10(%rsi),%r14
0030  1b9acd0:	4c 89 f0             	mov    %r14,%rax
0033  1b9acd3:	48 c1 e8 03          	shr    $0x3,%rax
0037  1b9acd7:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
003b  1b9acdb:	84 c0                	test   %al,%al
003d  1b9acdd:	0f 85 dd 01 00 00    	jne    1b9aec0 <kfd_mem_dmaunmap_attachment+0x220>
0043  1b9ace3:	41 8b 06             	mov    (%r14),%eax
0046  1b9ace6:	85 c0                	test   %eax,%eax
0048  1b9ace8:	0f 84 9c 01 00 00    	je     1b9ae8a <kfd_mem_dmaunmap_attachment+0x1ea>
004e  1b9acee:	83 f8 01             	cmp    $0x1,%eax
0051  1b9acf1:	0f 85 a8 01 00 00    	jne    1b9ae9f <kfd_mem_dmaunmap_attachment+0x1ff>
0057  1b9acf7:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
005e  1b9acfe:	48 89 d8             	mov    %rbx,%rax
0061  1b9ad01:	48 c1 e8 03          	shr    $0x3,%rax
0065  1b9ad05:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0069  1b9ad09:	84 c0                	test   %al,%al
006b  1b9ad0b:	0f 85 cd 01 00 00    	jne    1b9aede <kfd_mem_dmaunmap_attachment+0x23e>
0071  1b9ad11:	8b 03                	mov    (%rbx),%eax
0073  1b9ad13:	89 44 24 04          	mov    %eax,0x4(%rsp)
0077  1b9ad17:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
007c  1b9ad1c:	ba 18 00 00 00       	mov    $0x18,%edx
0081  1b9ad21:	31 f6                	xor    %esi,%esi
0083  1b9ad23:	e8 00 00 00 00       	call   1b9ad28 <kfd_mem_dmaunmap_attachment+0x88>	1b9ad24: R_X86_64_PLT32	memset-0x4
0088  1b9ad28:	4d 8d 77 18          	lea    0x18(%r15),%r14
008c  1b9ad2c:	4c 89 f0             	mov    %r14,%rax
008f  1b9ad2f:	48 c1 e8 03          	shr    $0x3,%rax
0093  1b9ad33:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0097  1b9ad37:	74 08                	je     1b9ad41 <kfd_mem_dmaunmap_attachment+0xa1>
0099  1b9ad39:	4c 89 f7             	mov    %r14,%rdi
009c  1b9ad3c:	e8 00 00 00 00       	call   1b9ad41 <kfd_mem_dmaunmap_attachment+0xa1>	1b9ad3d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00a1  1b9ad41:	4d 8b 36             	mov    (%r14),%r14
00a4  1b9ad44:	49 83 c6 08          	add    $0x8,%r14
00a8  1b9ad48:	4c 89 f0             	mov    %r14,%rax
00ab  1b9ad4b:	48 c1 e8 03          	shr    $0x3,%rax
00af  1b9ad4f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00b3  1b9ad53:	74 08                	je     1b9ad5d <kfd_mem_dmaunmap_attachment+0xbd>
00b5  1b9ad55:	4c 89 f7             	mov    %r14,%rdi
00b8  1b9ad58:	e8 00 00 00 00       	call   1b9ad5d <kfd_mem_dmaunmap_attachment+0xbd>	1b9ad59: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00bd  1b9ad5d:	4d 8b 26             	mov    (%r14),%r12
00c0  1b9ad60:	4d 8d b4 24 f0 02 00 00 	lea    0x2f0(%r12),%r14
00c8  1b9ad68:	4c 89 f0             	mov    %r14,%rax
00cb  1b9ad6b:	48 c1 e8 03          	shr    $0x3,%rax
00cf  1b9ad6f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00d3  1b9ad73:	74 08                	je     1b9ad7d <kfd_mem_dmaunmap_attachment+0xdd>
00d5  1b9ad75:	4c 89 f7             	mov    %r14,%rdi
00d8  1b9ad78:	e8 00 00 00 00       	call   1b9ad7d <kfd_mem_dmaunmap_attachment+0xdd>	1b9ad79: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00dd  1b9ad7d:	4d 8b 36             	mov    (%r14),%r14
00e0  1b9ad80:	49 83 c6 10          	add    $0x10,%r14
00e4  1b9ad84:	4c 89 f3             	mov    %r14,%rbx
00e7  1b9ad87:	48 c1 eb 03          	shr    $0x3,%rbx
00eb  1b9ad8b:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
00ef  1b9ad8f:	74 08                	je     1b9ad99 <kfd_mem_dmaunmap_attachment+0xf9>
00f1  1b9ad91:	4c 89 f7             	mov    %r14,%rdi
00f4  1b9ad94:	e8 00 00 00 00       	call   1b9ad99 <kfd_mem_dmaunmap_attachment+0xf9>	1b9ad95: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00f9  1b9ad99:	49 83 3e 00          	cmpq   $0x0,(%r14)
00fd  1b9ad9d:	0f 84 e7 00 00 00    	je     1b9ae8a <kfd_mem_dmaunmap_attachment+0x1ea>
0103  1b9ada3:	4d 8d 6c 24 58       	lea    0x58(%r12),%r13
0108  1b9ada8:	49 83 c7 20          	add    $0x20,%r15
010c  1b9adac:	4c 89 f8             	mov    %r15,%rax
010f  1b9adaf:	48 c1 e8 03          	shr    $0x3,%rax
0113  1b9adb3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0117  1b9adb7:	74 08                	je     1b9adc1 <kfd_mem_dmaunmap_attachment+0x121>
0119  1b9adb9:	4c 89 ff             	mov    %r15,%rdi
011c  1b9adbc:	e8 00 00 00 00       	call   1b9adc1 <kfd_mem_dmaunmap_attachment+0x121>	1b9adbd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0121  1b9adc1:	4d 8b 3f             	mov    (%r15),%r15
0124  1b9adc4:	4c 89 e7             	mov    %r12,%rdi
0127  1b9adc7:	be 01 00 00 00       	mov    $0x1,%esi
012c  1b9adcc:	e8 00 00 00 00       	call   1b9add1 <kfd_mem_dmaunmap_attachment+0x131>	1b9adcd: R_X86_64_PLT32	amdgpu_bo_placement_from_domain-0x4
0131  1b9add1:	49 83 c4 38          	add    $0x38,%r12
0135  1b9add5:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
013a  1b9adda:	4c 89 ef             	mov    %r13,%rdi
013d  1b9addd:	4c 89 e6             	mov    %r12,%rsi
0140  1b9ade0:	e8 00 00 00 00       	call   1b9ade5 <kfd_mem_dmaunmap_attachment+0x145>	1b9ade1: R_X86_64_PLT32	ttm_bo_validate-0x4
0145  1b9ade5:	4c 89 f8             	mov    %r15,%rax
0148  1b9ade8:	48 c1 e8 03          	shr    $0x3,%rax
014c  1b9adec:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0150  1b9adf0:	74 08                	je     1b9adfa <kfd_mem_dmaunmap_attachment+0x15a>
0152  1b9adf2:	4c 89 ff             	mov    %r15,%rdi
0155  1b9adf5:	e8 00 00 00 00       	call   1b9adfa <kfd_mem_dmaunmap_attachment+0x15a>	1b9adf6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
015a  1b9adfa:	4d 8b 3f             	mov    (%r15),%r15
015d  1b9adfd:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
0161  1b9ae01:	74 08                	je     1b9ae0b <kfd_mem_dmaunmap_attachment+0x16b>
0163  1b9ae03:	4c 89 f7             	mov    %r14,%rdi
0166  1b9ae06:	e8 00 00 00 00       	call   1b9ae0b <kfd_mem_dmaunmap_attachment+0x16b>	1b9ae07: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
016b  1b9ae0b:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
016f  1b9ae0f:	f7 d1                	not    %ecx
0171  1b9ae11:	4d 8b 26             	mov    (%r14),%r12
0174  1b9ae14:	4c 89 e0             	mov    %r12,%rax
0177  1b9ae17:	48 c1 e8 03          	shr    $0x3,%rax
017b  1b9ae1b:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
017f  1b9ae1f:	74 0e                	je     1b9ae2f <kfd_mem_dmaunmap_attachment+0x18f>
0181  1b9ae21:	4c 89 e7             	mov    %r12,%rdi
0184  1b9ae24:	41 89 cd             	mov    %ecx,%r13d
0187  1b9ae27:	e8 00 00 00 00       	call   1b9ae2c <kfd_mem_dmaunmap_attachment+0x18c>	1b9ae28: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
018c  1b9ae2c:	44 89 e9             	mov    %r13d,%ecx
018f  1b9ae2f:	c1 e9 1f             	shr    $0x1f,%ecx
0192  1b9ae32:	4d 8b 2c 24          	mov    (%r12),%r13
0196  1b9ae36:	49 83 c4 0c          	add    $0xc,%r12
019a  1b9ae3a:	4c 89 e0             	mov    %r12,%rax
019d  1b9ae3d:	48 c1 e8 03          	shr    $0x3,%rax
01a1  1b9ae41:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
01a5  1b9ae45:	84 c0                	test   %al,%al
01a7  1b9ae47:	0f 85 ae 00 00 00    	jne    1b9aefb <kfd_mem_dmaunmap_attachment+0x25b>
01ad  1b9ae4d:	41 8b 14 24          	mov    (%r12),%edx
01b1  1b9ae51:	4c 89 ff             	mov    %r15,%rdi
01b4  1b9ae54:	4c 89 ee             	mov    %r13,%rsi
01b7  1b9ae57:	45 31 c0             	xor    %r8d,%r8d
01ba  1b9ae5a:	e8 00 00 00 00       	call   1b9ae5f <kfd_mem_dmaunmap_attachment+0x1bf>	1b9ae5b: R_X86_64_PLT32	dma_unmap_sg_attrs-0x4
01bf  1b9ae5f:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
01c3  1b9ae63:	74 08                	je     1b9ae6d <kfd_mem_dmaunmap_attachment+0x1cd>
01c5  1b9ae65:	4c 89 f7             	mov    %r14,%rdi
01c8  1b9ae68:	e8 00 00 00 00       	call   1b9ae6d <kfd_mem_dmaunmap_attachment+0x1cd>	1b9ae69: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01cd  1b9ae6d:	49 8b 3e             	mov    (%r14),%rdi
01d0  1b9ae70:	e8 00 00 00 00       	call   1b9ae75 <kfd_mem_dmaunmap_attachment+0x1d5>	1b9ae71: R_X86_64_PLT32	sg_free_table-0x4
01d5  1b9ae75:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
01d9  1b9ae79:	74 08                	je     1b9ae83 <kfd_mem_dmaunmap_attachment+0x1e3>
01db  1b9ae7b:	4c 89 f7             	mov    %r14,%rdi
01de  1b9ae7e:	e8 00 00 00 00       	call   1b9ae83 <kfd_mem_dmaunmap_attachment+0x1e3>	1b9ae7f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
01e3  1b9ae83:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
01ea  1b9ae8a:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
01f3  1b9ae93:	48 3b 44 24 20       	cmp    0x20(%rsp),%rax
01f8  1b9ae98:	74 17                	je     1b9aeb1 <kfd_mem_dmaunmap_attachment+0x211>
01fa  1b9ae9a:	e9 82 00 00 00       	jmp    1b9af21 <kfd_mem_dmaunmap_attachment+0x281>
01ff  1b9ae9f:	0f 0b                	ud2
0201  1b9aea1:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
020a  1b9aeaa:	48 3b 44 24 20       	cmp    0x20(%rsp),%rax
020f  1b9aeaf:	75 70                	jne    1b9af21 <kfd_mem_dmaunmap_attachment+0x281>
0211  1b9aeb1:	48 83 c4 28          	add    $0x28,%rsp
0215  1b9aeb5:	5b                   	pop    %rbx
0216  1b9aeb6:	41 5c                	pop    %r12
0218  1b9aeb8:	41 5d                	pop    %r13
021a  1b9aeba:	41 5e                	pop    %r14
021c  1b9aebc:	41 5f                	pop    %r15
021e  1b9aebe:	5d                   	pop    %rbp
021f  1b9aebf:	c3                   	ret
0220  1b9aec0:	44 89 f1             	mov    %r14d,%ecx
0223  1b9aec3:	80 e1 07             	and    $0x7,%cl
0226  1b9aec6:	80 c1 03             	add    $0x3,%cl
0229  1b9aec9:	38 c1                	cmp    %al,%cl
022b  1b9aecb:	0f 8c 12 fe ff ff    	jl     1b9ace3 <kfd_mem_dmaunmap_attachment+0x43>
0231  1b9aed1:	4c 89 f7             	mov    %r14,%rdi
0234  1b9aed4:	e8 00 00 00 00       	call   1b9aed9 <kfd_mem_dmaunmap_attachment+0x239>	1b9aed5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0239  1b9aed9:	e9 05 fe ff ff       	jmp    1b9ace3 <kfd_mem_dmaunmap_attachment+0x43>
023e  1b9aede:	89 d9                	mov    %ebx,%ecx
0240  1b9aee0:	80 e1 07             	and    $0x7,%cl
0243  1b9aee3:	80 c1 03             	add    $0x3,%cl
0246  1b9aee6:	38 c1                	cmp    %al,%cl
0248  1b9aee8:	0f 8c 23 fe ff ff    	jl     1b9ad11 <kfd_mem_dmaunmap_attachment+0x71>
024e  1b9aeee:	48 89 df             	mov    %rbx,%rdi
0251  1b9aef1:	e8 00 00 00 00       	call   1b9aef6 <kfd_mem_dmaunmap_attachment+0x256>	1b9aef2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0256  1b9aef6:	e9 16 fe ff ff       	jmp    1b9ad11 <kfd_mem_dmaunmap_attachment+0x71>
025b  1b9aefb:	44 89 e2             	mov    %r12d,%edx
025e  1b9aefe:	80 e2 07             	and    $0x7,%dl
0261  1b9af01:	80 c2 03             	add    $0x3,%dl
0264  1b9af04:	38 c2                	cmp    %al,%dl
0266  1b9af06:	0f 8c 41 ff ff ff    	jl     1b9ae4d <kfd_mem_dmaunmap_attachment+0x1ad>
026c  1b9af0c:	4c 89 e7             	mov    %r12,%rdi
026f  1b9af0f:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
0273  1b9af13:	e8 00 00 00 00       	call   1b9af18 <kfd_mem_dmaunmap_attachment+0x278>	1b9af14: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0278  1b9af18:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
027c  1b9af1c:	e9 2c ff ff ff       	jmp    1b9ae4d <kfd_mem_dmaunmap_attachment+0x1ad>
0281  1b9af21:	e8 00 00 00 00       	call   1b9af26 <kfd_mem_dmaunmap_attachment+0x286>	1b9af22: R_X86_64_PLT32	__stack_chk_fail-0x4
0286  1b9af26:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
