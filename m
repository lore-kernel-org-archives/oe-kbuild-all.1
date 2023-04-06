Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70C2F38
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680780059; x=1712316059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D30TRDA+lXy9+GpSTvncfSX8duOAeq6KZpXX3mzd2zE=;
  b=SUOw2rSNIE+0tzPITmUS70MxtXQ7O6misRvESbC/A5e/4P8VfmF8B//D
   l/TMcvn/SPIEZFUuovXcfJlyhLIN/ydh1zVjoC48aNAfth6PWqZ/hEv9O
   F+BwkIdNTDpenV+ybl1jnrS7t8QnAATFxD2ml53us/1ae1F7rbKt2ZgVD
   DzNjkiHibyBFCLCv5HTEyZlLWJj8eig9AN9kKygz2Ci5XVSBwerIojlH6
   81dQRk5KrgNJtB5Qo2jVg777PUoZq6iQiEsGmAITyAiHQRqDag5oJAWaI
   64aXBaJ8rZzni2/3MuoRsPT1O/201TV3yDmSOvw4y9DIymUCdVag3PzSM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342718274"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="342718274"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 04:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="719674339"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="719674339"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 04:20:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkNfc-000RKK-2f;
	Thu, 06 Apr 2023 11:20:48 +0000
Date: Thu, 6 Apr 2023 19:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/urgent 7/8] vmlinux.o: warning: objtool:
 restore_processor_state+0x5e: call to native_write_cr3() leaves
 .noinstr.text section
Message-ID: <202304061905.tAIpVWCT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   3b534c3c460b4e02a509189c84c32ad1c2f805df
commit: 5502e7af183d175d435054d84127ae8b394722e4 [7/8] x86/power: Sprinkle some noinstr
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230406/202304061905.tAIpVWCT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=5502e7af183d175d435054d84127ae8b394722e4
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/urgent
        git checkout 5502e7af183d175d435054d84127ae8b394722e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061905.tAIpVWCT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: restore_processor_state+0x5e: call to native_write_cr3() leaves .noinstr.text section


objdump-func vmlinux.o restore_processor_state:
0000 0000000000004005 <restore_processor_state>:
0000     4005:	f3 0f 1e fa          	endbr64
0004     4009:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	400a: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0009     400e:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 4015 <restore_processor_state+0x10>	4010: R_X86_64_PC32	saved_context+0x137
0010     4015:	74 1a                	je     4031 <restore_processor_state+0x2c>
0012     4017:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	4018: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0017     401c:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 4023 <restore_processor_state+0x1e>	401f: R_X86_64_PC32	saved_context+0xe4
001e     4023:	b9 a0 01 00 00       	mov    $0x1a0,%ecx
0023     4028:	48 89 c2             	mov    %rax,%rdx
0026     402b:	48 c1 ea 20          	shr    $0x20,%rdx
002a     402f:	0f 30                	wrmsr
002c     4031:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	4032: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0031     4036:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 403d <restore_processor_state+0x38>	4039: R_X86_64_PC32	saved_context+0xfc
0038     403d:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
003d     4042:	48 89 c2             	mov    %rax,%rdx
0040     4045:	48 c1 ea 20          	shr    $0x20,%rdx
0044     4049:	0f 30                	wrmsr
0046     404b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 4052 <restore_processor_state+0x4d>	404e: R_X86_64_PC32	saved_context+0xdc
004d     4052:	0f 22 e0             	mov    %rax,%cr4
0050     4055:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 405c <restore_processor_state+0x57>	4058: R_X86_64_PC32	saved_context+0xd4
0057     405c:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 4063 <restore_processor_state+0x5e>	405f: R_X86_64_PC32	saved_context+0xdc
005e     4063:	e8 00 00 00 00       	call   4068 <restore_processor_state+0x63>	4064: R_X86_64_PC32	.text+0x1b629f4
0063     4068:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 406f <restore_processor_state+0x6a>	406b: R_X86_64_PC32	saved_context+0xcc
006a     406f:	0f 22 d0             	mov    %rax,%cr2
006d     4072:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 4079 <restore_processor_state+0x74>	4075: R_X86_64_PC32	saved_context+0xc4
0074     4079:	0f 22 c0             	mov    %rax,%cr0
0077     407c:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 4083 <restore_processor_state+0x7e>	407f: R_X86_64_PC32	saved_context+0xc4
007e     4083:	0f 01 1d 00 00 00 00 	lidt   0x0(%rip)        # 408a <restore_processor_state+0x85>	4086: R_X86_64_PC32	saved_context+0x112
0085     408a:	b8 18 00 00 00       	mov    $0x18,%eax
008a     408f:	8e d0                	mov    %eax,%ss
008c     4091:	b8 2b 00 00 00       	mov    $0x2b,%eax
0091     4096:	89 c2                	mov    %eax,%edx
0093     4098:	8e da                	mov    %edx,%ds
0095     409a:	8e c0                	mov    %eax,%es
0097     409c:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 40a3 <restore_processor_state+0x9e>	409f: R_X86_64_PC32	saved_context+0xac
009e     40a3:	b9 01 01 00 c0       	mov    $0xc0000101,%ecx
00a3     40a8:	48 89 c2             	mov    %rax,%rdx
00a6     40ab:	48 c1 ea 20          	shr    $0x20,%rdx
00aa     40af:	0f 30                	wrmsr
00ac     40b1:	90                   	nop
00ad     40b2:	e8 00 00 00 00       	call   40b7 <restore_processor_state+0xb2>	40b3: R_X86_64_PC32	.text+0x1b631fe
00b2     40b7:	66 8b 05 00 00 00 00 	mov    0x0(%rip),%ax        # 40be <restore_processor_state+0xb9>	40ba: R_X86_64_PC32	saved_context+0xa6
00b9     40be:	8e d8                	mov    %eax,%ds
00bb     40c0:	66 8b 05 00 00 00 00 	mov    0x0(%rip),%ax        # 40c7 <restore_processor_state+0xc2>	40c3: R_X86_64_PC32	saved_context+0xa6
00c2     40c7:	8e c0                	mov    %eax,%es
00c4     40c9:	0f b7 3d 00 00 00 00 	movzwl 0x0(%rip),%edi        # 40d0 <restore_processor_state+0xcb>	40cc: R_X86_64_PC32	saved_context+0xa8
00cb     40d0:	e8 00 00 00 00       	call   40d5 <restore_processor_state+0xd0>	40d1: R_X86_64_PC32	.text+0x1b629e8
00d0     40d5:	0f b7 3d 00 00 00 00 	movzwl 0x0(%rip),%edi        # 40dc <restore_processor_state+0xd7>	40d8: R_X86_64_PC32	saved_context+0xaa
00d7     40dc:	e8 00 00 00 00       	call   40e1 <restore_processor_state+0xdc>	40dd: R_X86_64_PC32	.text+0x1b62aba
00dc     40e1:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 40e8 <restore_processor_state+0xe3>	40e4: R_X86_64_PC32	saved_context+0xbc
00e3     40e8:	b9 00 01 00 c0       	mov    $0xc0000100,%ecx
00e8     40ed:	48 89 c2             	mov    %rax,%rdx
00eb     40f0:	48 c1 ea 20          	shr    $0x20,%rdx
00ef     40f4:	0f 30                	wrmsr
00f1     40f6:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 40fd <restore_processor_state+0xf8>	40f9: R_X86_64_PC32	saved_context+0xb4
00f8     40fd:	b9 02 01 00 c0       	mov    $0xc0000102,%ecx
00fd     4102:	48 89 c2             	mov    %rax,%rdx
0100     4105:	48 c1 ea 20          	shr    $0x20,%rdx
0104     4109:	0f 30                	wrmsr
0106     410b:	e8 00 00 00 00       	call   4110 <restore_processor_state+0x10b>	410c: R_X86_64_PC32	.text+0x1b62b38
010b     4110:	bf 01 00 00 00       	mov    $0x1,%edi
0110     4115:	e8 00 00 00 00       	call   411a <restore_processor_state+0x115>	4116: R_X86_64_PLT32	tsc_verify_tsc_adjust-0x4
0115     411a:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 4120 <restore_processor_state+0x11b>	411c: R_X86_64_PC32	x86_platform+0x44
011b     4120:	e8 00 00 00 00       	call   4125 <restore_processor_state+0x120>	4121: R_X86_64_PLT32	cache_bp_restore-0x4
0120     4125:	e8 00 00 00 00       	call   412a <restore_processor_state+0x125>	4126: R_X86_64_PLT32	perf_restore_debug_store-0x4
0125     412a:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 4131 <restore_processor_state+0x12c>	412d: R_X86_64_PC32	boot_cpu_data+0x3c
012c     4131:	48 85 c0             	test   %rax,%rax
012f     4134:	79 11                	jns    4147 <restore_processor_state+0x142>
0131     4136:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	4137: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0136     413b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	413e: R_X86_64_32S	boot_cpu_data
013d     4142:	e8 00 00 00 00       	call   4147 <restore_processor_state+0x142>	4143: R_X86_64_PLT32	init_ia32_feat_ctl-0x4
0142     4147:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	4148: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0147     414c:	e8 00 00 00 00       	call   4151 <restore_processor_state+0x14c>	414d: R_X86_64_PLT32	microcode_bsp_resume-0x4
014c     4151:	e8 00 00 00 00       	call   4156 <restore_processor_state+0x151>	4152: R_X86_64_PC32	.text+0x1b62b42
0151     4156:	90                   	nop
0152     4157:	c3                   	ret
0153     4158:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
015d     4162:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0167     416c:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0171     4176:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
