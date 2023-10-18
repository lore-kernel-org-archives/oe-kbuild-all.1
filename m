Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3D18B0B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XE3K3hhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697626119; x=1729162119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ErQomgMIuJQCvra9G7NGtemWA1/rYk3FZG28oUAk8v4=;
  b=XE3K3hhI0dRwEUGMecX4CyiQJ7VCrtw5hyOgIiVHu0e58NvdIusPNFdD
   dpn8lyI6fXUG+CUZxMCD17GGVKYFFS48a4bIfVwERFeiLWLlKX9aOYKJq
   YZSE3owMDNg6seifqDNxGfndyIbG58CVBQ2rlv2gfvLfvqlhp5ddC1jSI
   +HetNF5psqcJeeJcOVkLDLyuGLjOpxuGumY0nzeCWXFdRAUMt2dSSjgSE
   jBj3l3HQL9fvQrafBk9ZE58/etsrcrnQWrEquZN7NAg/KCE+2nk/fWkJL
   jfxESizZcuRpMxs6GfKbrDGyphhtGk9NW18I6FD7rF0cQUxa7YB029q/d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="376359121"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="376359121"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 03:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="733126727"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="733126727"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Oct 2023 03:48:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt46K-0000GC-2E;
	Wed, 18 Oct 2023 10:48:32 +0000
Date: Wed, 18 Oct 2023 18:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [linux-next:master 5045/13299] arch/s390/include/asm/ctlreg.h:80:9:
 warning: array subscript 0 is outside array bounds of 'struct ctlreg[0]'
Message-ID: <202310181800.Bh66q0T1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: 527618abb92793b9d4dba548d55822dcebd95317 [5045/13299] s390/ctlreg: add struct ctlreg
config: s390-buildonly-randconfig-r004-20220731 (https://download.01.org/0day-ci/archive/20231018/202310181800.Bh66q0T1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181800.Bh66q0T1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181800.Bh66q0T1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/lowcore.h:14,
                    from arch/s390/include/asm/current.h:13,
                    from arch/s390/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from arch/s390/include/asm/percpu.h:5,
                    from include/linux/irqflags.h:18,
                    from include/linux/rcupdate.h:26,
                    from include/linux/sysctl.h:26,
                    from arch/s390/mm/pgalloc.c:9:
   In function 'local_ctl_load',
       inlined from '__crst_table_upgrade' at arch/s390/mm/pgalloc.c:66:3:
>> arch/s390/include/asm/ctlreg.h:80:9: warning: array subscript 0 is outside array bounds of 'struct ctlreg[0]' [-Warray-bounds=]
      80 |         asm volatile(
         |         ^~~
   In function '__crst_table_upgrade':
   cc1: note: source object is likely at address zero


vim +80 arch/s390/include/asm/ctlreg.h

a0616cdebcfd57 arch/s390/include/asm/ctl_reg.h David Howells  2012-03-28  77  
527618abb92793 arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  78  static __always_inline void local_ctl_load(unsigned int cr, struct ctlreg *reg)
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  79  {
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11 @80  	asm volatile(
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  81  		"	lctlg	%[cr],%[cr],%[reg]\n"
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  82  		:
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  83  		: [reg] "Q" (*reg), [cr] "i" (cr)
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  84  		: "memory");
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  85  }
dfa33ce1245a4b arch/s390/include/asm/ctlreg.h  Heiko Carstens 2023-09-11  86  

:::::: The code at line 80 was first introduced by commit
:::::: dfa33ce1245a4b88402947fa0a847e179044d2fc s390/ctlreg: add local_ctl_load() and local_ctl_store()

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
