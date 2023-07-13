Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ECC5680
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 06:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689230035; x=1720766035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=riJgKLhyE3QyBqPhf9uga0vHEHn78Wby8sYmY2v/XPk=;
  b=BwSfhDMxr71y5EbftwJmiP4iy+mIe3ShA8GiFcoXLQq7ZAHE8jIP+0kL
   aQpsTARkiy/h3vbciyEDhNItbCDtJvsRT3ml3F+kLkuUEoE8xleYW2Xgv
   sHHCtovmr4AoS32H0SEFbazxNcNegoECPaav3KNf3qxaDE2WGZQXSLntY
   rqI44Qyr05PGAJJPi1BMw56KBQeOOTeg438/eEry1J79z+yuHko+udyzp
   v7D9EGtubO4J9V1ERaKxSk+QAlFSbw3jif4lFFx87OpVR8/aA6XHM4zq8
   v4ZTa2dgUH1LxB849k3O5eBIlRt+J9T7g5tWoFph0dIDY4kfOyo9fEvCI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="355018387"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="355018387"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 23:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="1052484798"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="1052484798"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2023 23:33:39 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJptS-0006Jd-2H;
	Thu, 13 Jul 2023 06:33:38 +0000
Date: Thu, 13 Jul 2023 14:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tony Luck <tony.luck@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest-debug 2/4] vmlinux.o: warning: objtool:
 __halt+0x3a: call to __trace_tdx_hypercall() leaves .noinstr.text section
Message-ID: <202307131448.CqWcjSwC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-debug
head:   176c4fe81e2cf77a2bca277757cbafa0dca673c2
commit: c960d99c1884e1e670639b6f9e5d4f6b61c91bff [2/4] x86/tdx: Add TDCALL tracepoint
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307131448.CqWcjSwC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131448.CqWcjSwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131448.CqWcjSwC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __halt+0x3a: call to __trace_tdx_hypercall() leaves .noinstr.text section


objdump-func vmlinux.o __halt:
0000 0000000000000040 <__halt>:
0000       40:	48 83 ec 68          	sub    $0x68,%rsp
0004       44:	89 fa                	mov    %edi,%edx
0006       46:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
000f       4f:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
0014       54:	31 c0                	xor    %eax,%eax
0016       56:	e8 00 00 00 00       	call   5b <__halt+0x1b>	57: R_X86_64_PLT32	stackleak_track_stack-0x4
001b       5b:	b9 0c 00 00 00       	mov    $0xc,%ecx
0020       60:	48 89 e7             	mov    %rsp,%rdi
0023       63:	0f b6 d2             	movzbl %dl,%edx
0026       66:	f3 48 ab             	rep stos %rax,%es:(%rdi)
0029       69:	48 89 e7             	mov    %rsp,%rdi
002c       6c:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
0031       71:	48 c7 44 24 18 0c 00 00 00 	movq   $0xc,0x18(%rsp)
003a       7a:	e8 00 00 00 00       	call   7f <__halt+0x3f>	7b: R_X86_64_PC32	.text+0x7bbc
003f       7f:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
0044       84:	65 48 2b 14 25 28 00 00 00 	sub    %gs:0x28,%rdx
004d       8d:	75 0f                	jne    9e <__halt+0x5e>
004f       8f:	48 83 c4 68          	add    $0x68,%rsp
0053       93:	31 d2                	xor    %edx,%edx
0055       95:	31 c9                	xor    %ecx,%ecx
0057       97:	31 ff                	xor    %edi,%edi
0059       99:	e9 00 00 00 00       	jmp    9e <__halt+0x5e>	9a: R_X86_64_PLT32	__x86_return_thunk-0x4
005e       9e:	e8 00 00 00 00       	call   a3 <__halt+0x63>	9f: R_X86_64_PLT32	__stack_chk_fail-0x4
0063       a3:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
006e       ae:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0079       b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
