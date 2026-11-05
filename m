Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847646;
	b=frLV7ayxNDpqeqsgwisjFiGCNI101H3x7200BYIbUKPTK6w9v3DFNqFg8uP3SuL+daV3
	 SR+Jd6VifD3TSmVTbdQwRdpjjVxKSu8/HZgP5k9b/kD7qRH4in55WG/synqHcGqAgOw39
	 M8uH/ECnFHT7vtVjgF8QHxfVyQkTfg3VXmNE/oNB8iaYzHJ7hxeDpgyY1gZua4czS9wPe
	 679akkVDqLdYVSV2i0bBoea1LrmBBsMFUq+DyzRZc23IC9Z9/M6vbeSljJxA62WF+zyOW
	 purnuXrZ5kh8semWNEltcCVuLPMS7EDdEy2b64ub71UDILXDkZq/QeAAzdGRcTt6q9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847646;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nTzg6QOECMb0qmoU7Hqs0opl2b57o4ew6XvoioZYbdQ=;
	b=K3d3OO7MR7Kov/fUZV3rft6I+nHnrGqymBpFiFwvHg2oMUZozTRyFuI5UlYjUcincyue
	 LrF2f30TqNb3P4+V2ehbQsFDAuc1DG3Lin7vCcAlc59Z+/DaHaEqfS1XljLVw0j3b9Mug
	 63cjNDYwkKIZst0A4u7EdqWfN+MFaieqb3cNJHHdsFdztLVwNHmx4ClUlEBfhvt2SqA+a
	 uhh0H1Iz5Q1QUARsl4g8GWsmy5jH1qmCpj0s5SSFvRdINBfm8P4uXIgTtvM5Il5jnCmcp
	 3HlofDqwsxlVcZVfjddUJhKYrFGu7tHNpcLXGtv0OHZCpYidT11LGWdsuBhnAIkiTIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JhdfG6AK;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479A606A329
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 03:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5479A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JhdfG6AK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793847644; x=1825383644;
  h=date:from:to:cc:subject:message-id;
  bh=roz1uzATnAPDr8Rp1mNYfu8LoLfCMoME+LCSrxKrOE4=;
  b=JhdfG6AKG9lBroY48/pH0ebk52hbDnXIDfBL9q6E8YTA8h58v6lD8843
   VdMuL5J9Ik6HiJLs9uI0ZXYvQUf2lyDXpk8SegXB/PaBrBK9DpRuVSW1h
   GIo4ZDhHOVhhpbB35l5LgN58Hh/7qFrasi9hqJjgz6s9Kfci9IR3fOjb7
   GgWfGju8/lErm1QApW3vbNOOlTOl07hOso2a7Kx+MGK+1kWR97ZSE8aEe
   8YZq7o0V6ecDzwVNfnCCWyXNLxtKZnGZUCJB9MKw9WFl4i5tFv7BfOz15
   50jHShjxF8qbFCD9YWIYJj3UPl8xeuvvuHN0jk5jWQJNOYsvMAFUJLcge
   g==;
X-CSE-ConnectionGUID: 3nfqGrzmQ4eLNgltjSjzEA==
X-CSE-MsgGUID: KYWDiF0wS5e4QDvaDlzrhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2616262"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2616262"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:00:44 -0800
X-CSE-ConnectionGUID: Asb1//J0TimpEYeASd5DPA==
X-CSE-MsgGUID: lh1wogKMRlSgnOuZGB7eDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8661976"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 04 Nov 2026 19:00:43 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOniS-00000000lXr-0Rmm;
	Thu, 05 Nov 2026 03:00:40 +0000
Date: Thu, 05 Nov 2026 11:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 211/445]
 arch/mips/include/uapi/asm/signal.h:16:32: error: missing binary operator
 before token '('
Message-ID: <202611051018.yn2aowTe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   d7fccb0c43af0d515fd23b885eb43ee9c38a6247
commit: 4edb32e9edb0de9a9e2b9c5fbe1aafd898744fa4 [211/445] signal: Use preprocessor conditionals in sigisemptyset() and sigequalsets()
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611051018.yn2aowTe-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051018.yn2aowTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051018.yn2aowTe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/signal.h:12,
                    from include/uapi/linux/signal.h:5,
                    from include/linux/signal_types.h:10,
                    from include/linux/sched.h:37,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/uio.h:9,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from arch/mips/kernel/asm-offsets.c:14:
   include/linux/signal.h: In function 'sigisemptyset':
>> arch/mips/include/uapi/asm/signal.h:16:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:96:5: note: in expansion of macro '_NSIG_WORDS'
      96 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:32: error: missing binary operator before token '('
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:96:5: note: in expansion of macro '_NSIG_WORDS'
      96 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:98:7: note: in expansion of macro '_NSIG_WORDS'
      98 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:32: error: missing binary operator before token '('
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:98:7: note: in expansion of macro '_NSIG_WORDS'
      98 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:100:7: note: in expansion of macro '_NSIG_WORDS'
     100 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:32: error: missing binary operator before token '('
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:100:7: note: in expansion of macro '_NSIG_WORDS'
     100 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
   include/linux/signal.h: In function 'sigequalsets':
>> arch/mips/include/uapi/asm/signal.h:16:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:110:5: note: in expansion of macro '_NSIG_WORDS'
     110 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:32: error: missing binary operator before token '('
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:110:5: note: in expansion of macro '_NSIG_WORDS'
     110 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:115:7: note: in expansion of macro '_NSIG_WORDS'
     115 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:32: error: missing binary operator before token '('
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:115:7: note: in expansion of macro '_NSIG_WORDS'
     115 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:118:7: note: in expansion of macro '_NSIG_WORDS'
     118 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
>> arch/mips/include/uapi/asm/signal.h:16:32: error: missing binary operator before token '('
      16 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/mips/include/uapi/asm/signal.h:17:34: note: in expansion of macro '_NSIG_BPW'
      17 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:118:7: note: in expansion of macro '_NSIG_WORDS'
     118 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +16 arch/mips/include/uapi/asm/signal.h

61730c538f8281e David Howells 2012-10-09  14  
61730c538f8281e David Howells 2012-10-09  15  #define _NSIG		128
61730c538f8281e David Howells 2012-10-09 @16  #define _NSIG_BPW	(sizeof(unsigned long) * 8)
61730c538f8281e David Howells 2012-10-09  17  #define _NSIG_WORDS	(_NSIG / _NSIG_BPW)
61730c538f8281e David Howells 2012-10-09  18  

:::::: The code at line 16 was first introduced by commit
:::::: 61730c538f8281efa7ac12596da9f3f9a31b9272 UAPI: (Scripted) Disintegrate arch/mips/include/asm

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
