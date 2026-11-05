Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845128;
	b=MohlOR2ke3aN/HjVYldBmEamgHh0m3iPVNHbwf8vuWy3Wk082R2lm1g4NV4g3Gqjyppc
	 eWofFmS7U6RqOw5g3UqYB0XckMcUk3jdsYcJKRJpVmo5/jexelvJZLx6DyJaTF4P+Mk9K
	 Z0HeKeZ47bEGaYkjwc4wxRSz91tPxSYSFNgkVvWmtT6Bg3y0r+FbovfpcQ94nYXrTd7PO
	 F9v/MtiObMFSBRfqDyT28m8JQPGj+rVVN+G5OREr/nmUiNS9DUgpXCaQ00juhVeeOAWZj
	 mTv8zNCi02o5NYsAqlJBvg8Ww7+yoBamBmolevoit6tpa4EwcXkSUElNBtBN5SmuYnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845128;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EG3HwtNArJDBA4pGi7SXIm4jGSUd19/1cIyao15E1CE=;
	b=CVb9s1bq+XU3PKGn3/nuNDHHV32A6+q1m0vAxmfdcOddsmE5ZEOAoNexGEWB6U4ZGW5z
	 jr84LvU2Yebz3Hs4uVskwJeMI46AyoS1qgOgAO2jTeRpqcyd1nGQUMVeuqfJzs9udbKIP
	 OB9U8+fB0lIpfh1IKZQjh7olQfoRDeg2+rT5yMHRAeJwsrq+yQ0X1YX2+ctwECNox8Odl
	 8mIpXyITUhE66eyD9NLX8E1ITtXkZHrWaCpsFuNr2KKWYeOZw1DzOHmeQ0aD7WmP3fMvB
	 PzdH3Bm/SERdUVVGRQIh7ZPs3nQ5PRZGXAF/n9/eAUI1pHpbqvvNuKgBxgrhCvupLwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A+tN5LHZ;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA3A606A328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 02:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA3A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A+tN5LHZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793845127; x=1825381127;
  h=date:from:to:cc:subject:message-id;
  bh=nGR/4+RXv+2f/PHIqLqV6bar4tPT6mBAQ9ejRsJHXDs=;
  b=A+tN5LHZtzO60d0fqfJuZpdefrTH5Y9lHq5XtEsnjZBlpPKvi+JQ1kPE
   NenMXaX1YJ5Rfwm/p4XWOTUrC+rwyfbO5X1OnbuftMPRNTi7EgRpOlZZy
   wf9mZXcPmZIIHm34Rmj/nKm1v/SEQs0Hp2BV8NUveWanIG4xw5xC3Vc49
   q3FeqD3faSbddZT1AlgvYT74dEKjZWeaZ/jUG8jBNMTf25oDOQlhuyo3s
   M1uBXcJI5iu10gr0XIoK8W0ZGAqbBxSq/OQJElyATF0FhHr322agJxk8X
   a6U+IjWU6k9FA/3zsjYnChYLEB6Eq+t11Q2lrU9261I7jQGokEdxiCNPz
   Q==;
X-CSE-ConnectionGUID: eBSUP81dT3yuMgGyrkUAPg==
X-CSE-MsgGUID: fSS5Fa5ST0C2zvZUwGkx0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2613968"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2613968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 18:18:43 -0800
X-CSE-ConnectionGUID: G85PMD5uTGaXudPu7i73Xg==
X-CSE-MsgGUID: GoOUuHX/QfeHMf6yQw+f/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7206930"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2026 18:18:41 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOn3k-00000000lU9-2lg1;
	Thu, 05 Nov 2026 02:18:36 +0000
Date: Thu, 05 Nov 2026 10:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 211/445]
 arch/parisc/include/uapi/asm/signal.h:61:32: error: missing binary operator
 before token '('
Message-ID: <202611051031.yd6nwB9R-lkp@intel.com>
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
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20261105/202611051031.yd6nwB9R-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051031.yd6nwB9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051031.yd6nwB9R-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/signal.h:5,
                    from include/uapi/linux/signal.h:5,
                    from include/linux/signal_types.h:10,
                    from include/linux/sched.h:37,
                    from arch/parisc/kernel/asm-offsets.c:19:
   include/linux/signal.h: In function 'sigisemptyset':
>> arch/parisc/include/uapi/asm/signal.h:61:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:96:5: note: in expansion of macro '_NSIG_WORDS'
      96 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:32: error: missing binary operator before token '('
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:96:5: note: in expansion of macro '_NSIG_WORDS'
      96 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:98:7: note: in expansion of macro '_NSIG_WORDS'
      98 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:32: error: missing binary operator before token '('
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:98:7: note: in expansion of macro '_NSIG_WORDS'
      98 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:100:7: note: in expansion of macro '_NSIG_WORDS'
     100 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:32: error: missing binary operator before token '('
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:100:7: note: in expansion of macro '_NSIG_WORDS'
     100 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
   include/linux/signal.h: In function 'sigequalsets':
>> arch/parisc/include/uapi/asm/signal.h:61:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:110:5: note: in expansion of macro '_NSIG_WORDS'
     110 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:32: error: missing binary operator before token '('
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:110:5: note: in expansion of macro '_NSIG_WORDS'
     110 | #if _NSIG_WORDS == 4
         |     ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:115:7: note: in expansion of macro '_NSIG_WORDS'
     115 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:32: error: missing binary operator before token '('
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:115:7: note: in expansion of macro '_NSIG_WORDS'
     115 | #elif _NSIG_WORDS == 2
         |       ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:26: warning: 'sizeof' is not defined, evaluates to '0' [-Wundef]
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                          ^~~~~~
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:118:7: note: in expansion of macro '_NSIG_WORDS'
     118 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
>> arch/parisc/include/uapi/asm/signal.h:61:32: error: missing binary operator before token '('
      61 | #define _NSIG_BPW       (sizeof(unsigned long) * 8)
         |                                ^
   arch/parisc/include/uapi/asm/signal.h:62:34: note: in expansion of macro '_NSIG_BPW'
      62 | #define _NSIG_WORDS     (_NSIG / _NSIG_BPW)
         |                                  ^~~~~~~~~
   include/linux/signal.h:118:7: note: in expansion of macro '_NSIG_WORDS'
     118 | #elif _NSIG_WORDS == 1
         |       ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/parisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +61 arch/parisc/include/uapi/asm/signal.h

70c1674f62026e4 David Howells 2012-10-16  59  
487fa28fa8b6041 Helge Deller  2024-04-27  60  #define _NSIG		64
487fa28fa8b6041 Helge Deller  2024-04-27 @61  #define _NSIG_BPW	(sizeof(unsigned long) * 8)
487fa28fa8b6041 Helge Deller  2024-04-27  62  #define _NSIG_WORDS	(_NSIG / _NSIG_BPW)
487fa28fa8b6041 Helge Deller  2024-04-27  63  

:::::: The code at line 61 was first introduced by commit
:::::: 487fa28fa8b60417642ac58e8beda6e2509d18f9 parisc: Define sigset_t in parisc uapi header

:::::: TO: Helge Deller <deller@kernel.org>
:::::: CC: Helge Deller <deller@gmx.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
