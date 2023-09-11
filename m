Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F02F22
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694464372; x=1726000372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KgUW2P33hsMud/OQFL7ECIuZWaSGLNLIKMNylW8j3Fk=;
  b=lnaU42MqfG4AQXk6L/N4HUMNSfobO5dd4P7+AqVg28Kp9m6M++Cxg76r
   xPGi8jDGcCXIdWfQbEYlsBO9rNMeSiR9OZz/M+qZ9xDXFJfLljRn0waGg
   SN9RbRM0oc/2SlTF9AUwWTDo8NiqpohvmoVhN1ahIfDy3JKatwIsU586p
   zrr2ei9tKyzUwwErWtOFB0E/K6mgVDr8/p/nVtMy6zAR0PUYvFDq6HUpM
   DN8vaDGEKD0qdgINw1i3PNZjL3dVNTMKBWoc3KIMROU1IMq3625PljoCY
   8fCW6F9vPKOX73gWm/N8TImTt5XsqMWrjSLsOIAvFREsqy1CiiOmi/5bb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="380898432"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="380898432"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 13:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778529842"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="778529842"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Sep 2023 13:32:40 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfnaI-0006hw-0c;
	Mon, 11 Sep 2023 20:32:38 +0000
Date: Tue, 12 Sep 2023 04:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tony Luck <tony.luck@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest-debug 2/4] vmlinux.o: warning: objtool:
 __halt+0x3a: call to __trace_tdx_hypercall() leaves .noinstr.text section
Message-ID: <202309120403.6YbZ4RqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-debug
head:   141d41ee558493c843b9e556af209975f630f2dc
commit: 6490c1bb4de82b2b8c2178c01efcd13d51f30ac2 [2/4] x86/tdx: Add TDCALL tracepoint
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309120403.6YbZ4RqX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120403.6YbZ4RqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120403.6YbZ4RqX-lkp@intel.com/

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
