Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD829B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676042920; x=1707578920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKY25AXqdljqoI136zadbMTKIkRMdg1Tv7cgoYK28SA=;
  b=ZD/I7hoKqZYex4AsyMXwDte2FLxMlfa1tj6n2saDRm4A4xDkt52ZRUzv
   /+tqmRxIg/H0VNjkqwIK+FT7oo8YKp8wqJdYqSPQW5CH85qcbYtfZcirH
   9QuW69yixCcIYt4uXGO3mtKM8VV5VQB8hateiqq8f/Pvm6Uld/vb9rTKu
   /PtbN4fmn0hgN2LCAM3xHHfsddboyPXZyNU0dj30XSkvbbuC08rKs9w3g
   I2OYmNPrgNypmjvhoMxPgGbmCOJiXOw0bWkvtX/HjZY6LEbPMeyrOwvIO
   fW4pCvBTA0f4wCXvfiPjSY+PFdHT6aQS0woH+5wLvPfKbybB3k1E/TuX3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="332581847"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="332581847"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="670032231"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="670032231"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2023 07:28:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQVKI-0005rj-0G;
	Fri, 10 Feb 2023 15:28:38 +0000
Date: Fri, 10 Feb 2023 23:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] vmlinux.o: warning: objtool:
 __switch_to_asm+0x22: stack layout conflict in alternatives
Message-ID: <202302102356.cpei3tyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   cc1feb4e38be192cd99f7598777ff691f8a8a20e
commit: cc1feb4e38be192cd99f7598777ff691f8a8a20e [6/6] x86: Tweak FILL_RETURN_BUFFER some more
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230210/202302102356.cpei3tyE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=cc1feb4e38be192cd99f7598777ff691f8a8a20e
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout cc1feb4e38be192cd99f7598777ff691f8a8a20e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302102356.cpei3tyE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __switch_to_asm+0x22: stack layout conflict in alternatives


objdump-func vmlinux.o __switch_to_asm:
0000 0000000000003cc0 <__switch_to_asm>:
0000     3cc0:	f3 0f 1e fa          	endbr64
0004     3cc4:	55                   	push   %rbp
0005     3cc5:	53                   	push   %rbx
0006     3cc6:	41 54                	push   %r12
0008     3cc8:	41 55                	push   %r13
000a     3cca:	41 56                	push   %r14
000c     3ccc:	41 57                	push   %r15
000e     3cce:	48 89 a7 58 25 00 00 	mov    %rsp,0x2558(%rdi)
0015     3cd5:	48 8b a6 58 25 00 00 	mov    0x2558(%rsi),%rsp
001c     3cdc:	90                   	nop
001d     3cdd:	90                   	nop
001e     3cde:	90                   	nop
001f     3cdf:	90                   	nop
0020     3ce0:	90                   	nop
0021     3ce1:	90                   	nop
0022     3ce2:	90                   	nop
0023     3ce3:	90                   	nop
0024     3ce4:	90                   	nop
0025     3ce5:	90                   	nop
0026     3ce6:	90                   	nop
0027     3ce7:	90                   	nop
0028     3ce8:	90                   	nop
0029     3ce9:	90                   	nop
002a     3cea:	90                   	nop
002b     3ceb:	90                   	nop
002c     3cec:	90                   	nop
002d     3ced:	90                   	nop
002e     3cee:	90                   	nop
002f     3cef:	90                   	nop
0030     3cf0:	90                   	nop
0031     3cf1:	90                   	nop
0032     3cf2:	90                   	nop
0033     3cf3:	90                   	nop
0034     3cf4:	90                   	nop
0035     3cf5:	90                   	nop
0036     3cf6:	90                   	nop
0037     3cf7:	90                   	nop
0038     3cf8:	90                   	nop
0039     3cf9:	90                   	nop
003a     3cfa:	90                   	nop
003b     3cfb:	41 5f                	pop    %r15
003d     3cfd:	41 5e                	pop    %r14
003f     3cff:	41 5d                	pop    %r13
0041     3d01:	41 5c                	pop    %r12
0043     3d03:	5b                   	pop    %rbx
0044     3d04:	5d                   	pop    %rbp
0045     3d05:	e9 00 00 00 00       	jmp    3d0a <__switch_to_asm+0x4a>	3d06: R_X86_64_PLT32	__switch_to-0x4
004a     3d0a:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0055     3d15:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0060     3d20:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
006b     3d2b:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0076     3d36:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
