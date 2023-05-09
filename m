Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B737C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 01:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683596938; x=1715132938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddNw/mIRRN/bPPsL/Nd2YYquqy1baORJYC81HlWlPoE=;
  b=fPPh3iiVJx4oGEmcrPO9L8IFMWdnbUHbfspvs7uELf2pb04EKO/KGB19
   m2k33kW9xuBMU7/HL9GJav6xUx6QHLmwM4NN+pcvJsbb/7AUoN4tCtL6k
   Gw1TLfz0+1C8vyfUUWyXBhHgk7K7DSsn8m+o6LBg+7ALpQr7Yb5Hhscfm
   sp30W7flFsMTH0ILwV7zk+7PqT7ApmB2M29QGNbtI6HrQDs0uBMCwzyrZ
   +/h5zE8KQv2WzfZ3kuGiTuiLVjEeNookqBcVfHeZWlxgubTMWdSM6ZbDD
   o5+eoZGaJy69vFEUbv9VIx+94BUb1u8w0S4dCQAnA1y1/+95bycd9OhAK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330149732"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="330149732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 18:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698714259"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="698714259"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2023 18:48:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwCTA-0001Zx-27;
	Tue, 09 May 2023 01:48:48 +0000
Date: Tue, 9 May 2023 09:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tony Luck <tony.luck@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest-debug 2/4] vmlinux.o: warning: objtool:
 __halt+0x42: call to __trace_tdx_hypercall() leaves .noinstr.text section
Message-ID: <202305090938.dhEoUp7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-debug
head:   031127dc4d308e0315da21e23b5cb7707d0908a3
commit: deffdad121c47bd047a0fee69bf0797fb9a35ea3 [2/4] x86/tdx: Add TDCALL tracepoint
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305090938.dhEoUp7q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/deffdad121c47bd047a0fee69bf0797fb9a35ea3
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-debug
        git checkout deffdad121c47bd047a0fee69bf0797fb9a35ea3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090938.dhEoUp7q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __halt+0x42: call to __trace_tdx_hypercall() leaves .noinstr.text section


objdump-func vmlinux.o __halt:
0000 0000000000000040 <__halt>:
0000       40:	53                   	push   %rbx
0001       41:	89 fb                	mov    %edi,%ebx
0003       43:	48 83 ec 68          	sub    $0x68,%rsp
0007       47:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0010       50:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
0015       55:	31 c0                	xor    %eax,%eax
0017       57:	e8 00 00 00 00       	call   5c <__halt+0x1c>	58: R_X86_64_PLT32	stackleak_track_stack-0x4
001c       5c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	5d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0021       61:	31 c0                	xor    %eax,%eax
0023       63:	b9 0c 00 00 00       	mov    $0xc,%ecx
0028       68:	0f b6 db             	movzbl %bl,%ebx
002b       6b:	48 89 e7             	mov    %rsp,%rdi
002e       6e:	f3 48 ab             	rep stos %rax,%es:(%rdi)
0031       71:	48 89 e7             	mov    %rsp,%rdi
0034       74:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
0039       79:	48 c7 44 24 18 0c 00 00 00 	movq   $0xc,0x18(%rsp)
0042       82:	e8 00 00 00 00       	call   87 <__halt+0x47>	83: R_X86_64_PC32	.text+0x80bc
0047       87:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
004c       8c:	65 48 2b 14 25 28 00 00 00 	sub    %gs:0x28,%rdx
0055       95:	75 10                	jne    a7 <__halt+0x67>
0057       97:	48 83 c4 68          	add    $0x68,%rsp
005b       9b:	5b                   	pop    %rbx
005c       9c:	31 d2                	xor    %edx,%edx
005e       9e:	31 c9                	xor    %ecx,%ecx
0060       a0:	31 ff                	xor    %edi,%edi
0062       a2:	e9 00 00 00 00       	jmp    a7 <__halt+0x67>	a3: R_X86_64_PLT32	__x86_return_thunk-0x4
0067       a7:	e8 00 00 00 00       	call   ac <__halt+0x6c>	a8: R_X86_64_PLT32	__stack_chk_fail-0x4
006c       ac:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0077       b7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
