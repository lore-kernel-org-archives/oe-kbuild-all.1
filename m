Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6745008
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 21:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMSWIhP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700168456; x=1731704456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+LoGkfC6gD6kSAPTyvJNXWYirhXHahVs8GoVMDljuqo=;
  b=RMSWIhP13QsnJfWJG6NSlo+eyvrusC6428rIX+wwZGNG1Nqgc2Rc2T7T
   eK+s4IbIQYF3M5uemM2ha+2C1AaSWmYXhRKCzYnzmoyiRFzAIdkIgPh3+
   lz3VXVr2J6eVYTOyrRMbQD9C6TONVMbNYanUrOvzL3NACTEVS4//GU23v
   oMMhaYOcicm3e5gwFcTfmQyCNEgz1NFFLVYtDBCgHJ1rycmCL2jXUKhJ4
   qNVfDDuHGfS1wrBUOXI0zKlSW/ofv2fY/EY6Hnd3pGAVw9RaqSvGJ+RqL
   z0h1a2Aau8ZSVV4CsgX6wPTFLQ86j37YE4zwih7wAqBMkV4sqYPSwc/jZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12730993"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="12730993"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 13:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="835862381"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="835862381"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2023 13:00:40 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3jTa-00023l-1c;
	Thu, 16 Nov 2023 21:00:38 +0000
Date: Fri, 17 Nov 2023 05:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/parisc/net/bpf_jit_comp32.c:321:13: sparse: sparse: missing
 identifier in declaration
Message-ID: <202311170447.4luWB2PB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7475e51b87969e01a6812eac713a1c8310372e8a
commit: 4800a6215e335c6dade05e10c8fdbf919c04a3a7 parisc: Wire up eBPF JIT compiler
date:   3 months ago
config: parisc-randconfig-r113-20231115 (https://download.01.org/0day-ci/archive/20231117/202311170447.4luWB2PB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311170447.4luWB2PB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170447.4luWB2PB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/parisc/net/bpf_jit_comp32.c:321:13: sparse: sparse: missing identifier in declaration
   arch/parisc/net/bpf_jit_comp32.c:321:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/net/bpf_jit_comp32.c:321:13: sparse: sparse: got $
   arch/parisc/net/bpf_jit_comp32.c:322:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/net/bpf_jit_comp32.c:322:13: sparse: sparse: got $
   arch/parisc/net/bpf_jit_comp32.c:323:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/net/bpf_jit_comp32.c:323:13: sparse: sparse: got $
   arch/parisc/net/bpf_jit_comp32.c:666:37: sparse: sparse: Expected ) in function call
   arch/parisc/net/bpf_jit_comp32.c:666:37: sparse: sparse: got $
   arch/parisc/net/bpf_jit_comp32.c:669:37: sparse: sparse: Expected ) in function call
   arch/parisc/net/bpf_jit_comp32.c:669:37: sparse: sparse: got $
   arch/parisc/net/bpf_jit_comp32.c:672:37: sparse: sparse: Expected ) in function call
   arch/parisc/net/bpf_jit_comp32.c:672:37: sparse: sparse: got $
>> arch/parisc/net/bpf_jit_comp32.c:666:36: sparse: sparse: not enough arguments for function emit_call_millicode
   arch/parisc/net/bpf_jit_comp32.c:669:36: sparse: sparse: not enough arguments for function emit_call_millicode
   arch/parisc/net/bpf_jit_comp32.c:672:36: sparse: sparse: not enough arguments for function emit_call_millicode

vim +321 arch/parisc/net/bpf_jit_comp32.c

ceb0e7267693d3 Helge Deller 2023-08-17  319  
ceb0e7267693d3 Helge Deller 2023-08-17  320  /* extern hppa millicode functions */
ceb0e7267693d3 Helge Deller 2023-08-17 @321  extern void $$mulI(void);
ceb0e7267693d3 Helge Deller 2023-08-17  322  extern void $$divU(void);
ceb0e7267693d3 Helge Deller 2023-08-17  323  extern void $$remU(void);
ceb0e7267693d3 Helge Deller 2023-08-17  324  

:::::: The code at line 321 was first introduced by commit
:::::: ceb0e7267693d3e6c43bd65695cd79d7c072a42a parisc: Add 32-bit eBPF JIT compiler

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
