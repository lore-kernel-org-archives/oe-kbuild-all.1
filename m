Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165146B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683986233; x=1715522233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0lOoHCwap1rDgmWS6BSI6nrDhFOuQoMHM4AgM5qne4=;
  b=UIw339GPhZd5vXgIVbb1yIQR70JdeWNkywcM44OzWGFNFAUbWFtNAGyq
   mw8MyVBBWizVfNEsN6febBOX/jrS5zMqpnhbAR3ZeUJIBvHo8+ooyHcHS
   stMsu2H/azgwvg/VnAl0uzE/X43fdDa7MbEe5/2caifobL8nPK0cevmFf
   Hpop92r623zWg8XSGs0M91jRyDrO4JRv33ereuHqjrW9RJgksEgQa4/4O
   UxQMohXFW/Yhpi0GKdMe97JcG9ZAZq3IX2KLSWaFRPd8cxKmo8fr8Mfh1
   MjT4BX+XreL20mdPHuItfdFz1GV8s4o8Scc+PTacojocOYPT9tdndU7fB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="330577135"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="330577135"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 06:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844723159"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="844723159"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 May 2023 06:57:11 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxpkE-0005Vc-1H;
	Sat, 13 May 2023 13:57:10 +0000
Date: Sat, 13 May 2023 21:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/6.1 108/183] vmlinux.o: warning: objtool:
 emit_return+0x12: relocation to !ENDBR: .text.__x86.return_thunk+0x3b
Message-ID: <202305132119.8Z86w1xG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.1
head:   b35b1f6de36bba692669bc17cc73a8c04ab72347
commit: 8fbd06a141344159de0ba3f09458fab658dd0c63 [108/183] x86/retbleed: Fix return thunk alignment
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230513/202305132119.8Z86w1xG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=8fbd06a141344159de0ba3f09458fab658dd0c63
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.1
        git checkout 8fbd06a141344159de0ba3f09458fab658dd0c63
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305132119.8Z86w1xG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: emit_return+0x12: relocation to !ENDBR: .text.__x86.return_thunk+0x3b
   vmlinux.o: warning: objtool: relocate_restore_code+0x3c: relocation to !ENDBR: get_option+0x68


objdump-func vmlinux.o emit_return:
0000 00000000000d7300 <emit_return>:
0000    d7300:	e8 00 00 00 00       	call   d7305 <emit_return+0x5>	d7301: R_X86_64_PLT32	__fentry__-0x4
0005    d7305:	55                   	push   %rbp
0006    d7306:	48 89 fd             	mov    %rdi,%rbp
0009    d7309:	53                   	push   %rbx
000a    d730a:	48 8b 1f             	mov    (%rdi),%rbx
000d    d730d:	e9 00 00 00 00       	jmp    d7312 <emit_return+0x12>	d730e: R_X86_64_PC32	.altinstr_aux+0x1622
0012    d7312:	48 b8 00 00 00 00 00 00 00 00 	movabs $0x0,%rax	d7314: R_X86_64_64	__x86_return_thunk-0x5
001c    d731c:	48 29 f0             	sub    %rsi,%rax
001f    d731f:	48 63 d0             	movslq %eax,%rdx
0022    d7322:	48 39 d0             	cmp    %rdx,%rax
0025    d7325:	0f 85 00 00 00 00    	jne    d732b <emit_return+0x2b>	d7327: R_X86_64_PC32	.text.unlikely+0x75a7
002b    d732b:	c6 03 e9             	movb   $0xe9,(%rbx)
002e    d732e:	89 43 01             	mov    %eax,0x1(%rbx)
0031    d7331:	48 83 c3 05          	add    $0x5,%rbx
0035    d7335:	48 89 5d 00          	mov    %rbx,0x0(%rbp)
0039    d7339:	5b                   	pop    %rbx
003a    d733a:	5d                   	pop    %rbp
003b    d733b:	e9 00 00 00 00       	jmp    d7340 <emit_return+0x40>	d733c: R_X86_64_PLT32	__x86_return_thunk-0x4
0040    d7340:	c6 03 c3             	movb   $0xc3,(%rbx)
0043    d7343:	48 83 c3 01          	add    $0x1,%rbx
0047    d7347:	48 89 5d 00          	mov    %rbx,0x0(%rbp)
004b    d734b:	5b                   	pop    %rbx
004c    d734c:	5d                   	pop    %rbp
004d    d734d:	e9 00 00 00 00       	jmp    d7352 <emit_return+0x52>	d734e: R_X86_64_PLT32	__x86_return_thunk-0x4
0052    d7352:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
005d    d735d:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0068    d7368:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0073    d7373:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
007e    d737e:	66 90                	xchg   %ax,%ax
0000 00000000000075ab <emit_return.cold>:
0000     75ab:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	75ae: R_X86_64_32S	__x86_return_thunk
0007     75b2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	75b5: R_X86_64_32S	.rodata.str1.8+0x10aa0
000e     75b9:	e8 00 00 00 00       	call   75be <emit_return.cold+0x13>	75ba: R_X86_64_PLT32	_printk-0x4
0013     75be:	e9 00 00 00 00       	jmp    75c3 <emit_bpf_tail_call_direct.cold>	75bf: R_X86_64_PC32	.text+0xd7331

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
