Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6652F41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 22:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676069211; x=1707605211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1+r0ibWXcKTN1r7eIv8rSHtMDgGGFcIM9Y/QoLgdfU=;
  b=ikpOQT9aT/1tbqjatMEUy0Q4n/oU9qQWgSyfCFoNjtRM8eE/BDbkwT1f
   btuuS4cJMeCX6dZYLeBXqfGPZBknfFpHZuQZ9q4vuPmCWG8Imz80sRB94
   PDNB+FL1p75mVRp99b/3KQeYzJBHEzIC5eBfzNAgFq6sTTd5y2kLMBqy3
   y9FCRRxGLelptFjc0KmpDfuFkrkOl358Jq4fJxFPhO+CuBDSApEKQ2xsS
   uxsIE1BX8IGU52CqXKSWHOKPE/O3UhA23dUZQn79/7W5jjLE4vZ7zZg0M
   1/1567WDohVsn9+ILS+jcLZDtEdL3ssXJZK2wjwJSH7yrdNrsDg74G9TH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416769411"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="416769411"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 14:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="736881027"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="736881027"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2023 14:46:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQcAK-000661-2w;
	Fri, 10 Feb 2023 22:46:48 +0000
Date: Sat, 11 Feb 2023 06:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] vmlinux.o: warning: objtool:
 __vmx_vcpu_run+0x107: stack layout conflict in alternatives
Message-ID: <202302110646.Z2nzaGq3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f
commit: b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f [6/6] x86: Tweak FILL_RETURN_BUFFER some more
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230211/202302110646.Z2nzaGq3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110646.Z2nzaGq3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __switch_to_asm+0x22: stack layout conflict in alternatives
>> vmlinux.o: warning: objtool: __vmx_vcpu_run+0x107: stack layout conflict in alternatives
>> vmlinux.o: warning: objtool: __vmx_vcpu_run+0x96: objtool isn't smart enough to handle this CFI save/restore combo


objdump-func vmlinux.o __vmx_vcpu_run:
0000 0000000000000580 <__vmx_vcpu_run>:
0000      580:	f3 0f 1e fa          	endbr64
0004      584:	55                   	push   %rbp
0005      585:	48 89 e5             	mov    %rsp,%rbp
0008      588:	41 57                	push   %r15
000a      58a:	41 56                	push   %r14
000c      58c:	41 55                	push   %r13
000e      58e:	41 54                	push   %r12
0010      590:	53                   	push   %rbx
0011      591:	57                   	push   %rdi
0012      592:	52                   	push   %rdx
0013      593:	56                   	push   %rsi
0014      594:	88 d3                	mov    %dl,%bl
0016      596:	48 8d 34 24          	lea    (%rsp),%rsi
001a      59a:	e8 00 00 00 00       	call   59f <__vmx_vcpu_run+0x1f>	59b: R_X86_64_PLT32	vmx_update_host_rsp-0x4
001f      59f:	eb 21                	jmp    5c2 <__vmx_vcpu_run+0x42>
0021      5a1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0026      5a6:	8b bf 58 1f 00 00    	mov    0x1f58(%rdi),%edi
002c      5ac:	8b 34 25 00 00 00 00 	mov    0x0,%esi	5af: R_X86_64_32S	x86_spec_ctrl_current
0033      5b3:	39 fe                	cmp    %edi,%esi
0035      5b5:	74 0b                	je     5c2 <__vmx_vcpu_run+0x42>
0037      5b7:	b9 48 00 00 00       	mov    $0x48,%ecx
003c      5bc:	31 d2                	xor    %edx,%edx
003e      5be:	89 f8                	mov    %edi,%eax
0040      5c0:	0f 30                	wrmsr
0042      5c2:	48 8b 04 24          	mov    (%rsp),%rax
0046      5c6:	f6 c3 01             	test   $0x1,%bl
0049      5c9:	48 8b 48 08          	mov    0x8(%rax),%rcx
004d      5cd:	48 8b 50 10          	mov    0x10(%rax),%rdx
0051      5d1:	48 8b 58 18          	mov    0x18(%rax),%rbx
0055      5d5:	48 8b 68 28          	mov    0x28(%rax),%rbp
0059      5d9:	48 8b 70 30          	mov    0x30(%rax),%rsi
005d      5dd:	48 8b 78 38          	mov    0x38(%rax),%rdi
0061      5e1:	4c 8b 40 40          	mov    0x40(%rax),%r8
0065      5e5:	4c 8b 48 48          	mov    0x48(%rax),%r9
0069      5e9:	4c 8b 50 50          	mov    0x50(%rax),%r10
006d      5ed:	4c 8b 58 58          	mov    0x58(%rax),%r11
0071      5f1:	4c 8b 60 60          	mov    0x60(%rax),%r12
0075      5f5:	4c 8b 68 68          	mov    0x68(%rax),%r13
0079      5f9:	4c 8b 70 70          	mov    0x70(%rax),%r14
007d      5fd:	4c 8b 78 78          	mov    0x78(%rax),%r15
0081      601:	48 8b 00             	mov    (%rax),%rax
0084      604:	74 08                	je     60e <__vmx_vcpu_run+0x8e>
0086      606:	0f 01 c3             	vmresume
0089      609:	e9 c3 00 00 00       	jmp    6d1 <vmx_vmexit+0xbb>
008e      60e:	0f 01 c2             	vmlaunch
0091      611:	e9 bb 00 00 00       	jmp    6d1 <vmx_vmexit+0xbb>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
