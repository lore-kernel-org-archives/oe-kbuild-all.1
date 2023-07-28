Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0384723B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 21:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690581265; x=1722117265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tB0vUZod/MLqhGegN42+FU1vjFJh8etnNga3Zn7l+o8=;
  b=RoJK2CZMGMcxu3p5B4rbwg2gyYDlKVRwd/SVigoOrrQBcV2Cv6BU4OLY
   Yauk3hD7mu/3gx2VSOtvfOGI8avxKRSmf6miPoSDNszmZq2wbafz7G1/G
   v1MbVwgENzBtZl2x+iiQGwf/Hyo4u86Jqi36IxeSQGahrmnYft/wICvg4
   xxbx75KYsHTBj9N1RRhNgAtpr8vIns8LViOBivRAyZNCr5auzJzKzkL3f
   OUg6c9doLdRUcm2WNkgsH1HyKVwWoyB82W2DDDqmHB1NksKYdDn5ZaMIo
   2ze3QVN1lPNUWjrOECkV03RgQb/o9ULNhMrF9WQ/j3Soheiu3pOAu6OMv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="372323094"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="372323094"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 14:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="793048022"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="793048022"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 14:54:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPVPj-0003bX-03;
	Fri, 28 Jul 2023 21:54:23 +0000
Date: Sat, 29 Jul 2023 05:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: [linux-next:master 3523/5284] arch/s390/kernel/mcount.S:133: Error:
 Unrecognized opcode: `aghik'
Message-ID: <202307290545.uivDhFHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 1256e70a082ad855efe351146dfa39207d5e3e70 [3523/5284] s390/ftrace: enable HAVE_FUNCTION_GRAPH_RETVAL
config: s390-randconfig-m031-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290545.uivDhFHO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290545.uivDhFHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290545.uivDhFHO-lkp@intel.com/

Note: the linux-next/master HEAD d7b3af5a77e8d8da28f435f313e069aea5bcf172 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arch/s390/kernel/mcount.S: Assembler messages:
>> arch/s390/kernel/mcount.S:133: Error: Unrecognized opcode: `aghik'


vim +133 arch/s390/kernel/mcount.S

   127	
   128	SYM_FUNC_START(return_to_handler)
   129		stmg	%r2,%r5,32(%r15)
   130		lgr	%r1,%r15
   131		aghi	%r15,-(STACK_FRAME_OVERHEAD+__FGRAPH_RET_SIZE)
   132		stg	%r1,__SF_BACKCHAIN(%r15)
 > 133		aghik	%r3,%r15,STACK_FRAME_OVERHEAD
   134		stg	%r1,__FGRAPH_RET_FP(%r3)
   135		stg	%r2,__FGRAPH_RET_GPR2(%r3)
   136		lgr	%r2,%r3
   137		brasl	%r14,ftrace_return_to_handler
   138		aghi	%r15,STACK_FRAME_OVERHEAD+__FGRAPH_RET_SIZE
   139		lgr	%r14,%r2
   140		lmg	%r2,%r5,32(%r15)
   141		BR_EX	%r14
   142	SYM_FUNC_END(return_to_handler)
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
