Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE67339D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 00:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683852693; x=1715388693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dVnYGLpMDbqmOdWAUTGd4MDHOxrnkOxgrVpdYcajKA=;
  b=RAQ5dur2SvcCLFVuLC5v8iR5VRdhObKZFMBWegdct0zSRMNxQUM5HkJh
   S5R4ltQHR17d0nd5PEbU0fv2NhcCs5+7JnpVgjo+uFNdTB6CVkin/id6m
   wWPKOj0jRItXeowmwcWGq4tceALVZffFlnYPDTsXivQMDy+jzp5BCSmbE
   oHd9IxDbFS6e5mX//F1C8Ofkj63bbM9OHHXaYCjNwmpUlk5J871AP62dc
   K2dq0bR5EyIbC7Ix2ttG79D2K6oJdtLhANn+G2KjI1W96Vb9WeB4T6X+u
   bXehkR9OiD4g6H7Qcsv+N0bWDwVnCkYadn2gDPe4MPPFn+yBxtWyAZ1uu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353789677"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="353789677"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 17:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844199917"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="844199917"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 May 2023 17:51:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxH0M-0004Lk-34;
	Fri, 12 May 2023 00:51:30 +0000
Date: Fri, 12 May 2023 08:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>, Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest-fuzzer 2/9] vmlinux.o: warning: objtool:
 __halt+0x2c: call to __trace_tdx_hypercall() leaves .noinstr.text section
Message-ID: <202305120835.DxkVUqL0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-fuzzer
head:   6bdbad3baca02851e6eeba0f95d533461e0080f9
commit: 136d63e173c071639ade0709b3e1ad07ff8acacd [2/9] x86/tdx: Add TDCALL tracepoint
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230512/202305120835.DxkVUqL0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/136d63e173c071639ade0709b3e1ad07ff8acacd
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-fuzzer
        git checkout 136d63e173c071639ade0709b3e1ad07ff8acacd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120835.DxkVUqL0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __halt+0x2c: call to __trace_tdx_hypercall() leaves .noinstr.text section


objdump-func vmlinux.o __halt:
0000 0000000000000000 <__halt>:
0000    0:	53                   	push   %rbx
0001    1:	89 fb                	mov    %edi,%ebx
0003    3:	0f b6 db             	movzbl %bl,%ebx
0006    6:	48 83 ec 60          	sub    $0x60,%rsp
000a    a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	b: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
000f    f:	31 c0                	xor    %eax,%eax
0011   11:	b9 18 00 00 00       	mov    $0x18,%ecx
0016   16:	48 89 e7             	mov    %rsp,%rdi
0019   19:	f3 ab                	rep stos %eax,%es:(%rdi)
001b   1b:	48 89 e7             	mov    %rsp,%rdi
001e   1e:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
0023   23:	48 c7 44 24 18 0c 00 00 00 	movq   $0xc,0x18(%rsp)
002c   2c:	e8 00 00 00 00       	call   31 <__halt+0x31>	2d: R_X86_64_PC32	.text+0x5d10
0031   31:	48 83 c4 60          	add    $0x60,%rsp
0035   35:	5b                   	pop    %rbx
0036   36:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
