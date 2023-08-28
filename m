Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43264125DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693244956; x=1724780956;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Aln0lRGpE9Vd5xF1U9MboUJgfHr/GZ913AIbQGuEahY=;
  b=dHcXTX01zqQT6Azx5IUFQJYZMIw8KR/y7Wa5JDPhcT8IJvVP+aW7RjSr
   CPL/ocdIt3iFZS1b2wzWOp7NqXtLviDXdDaJKA+vXxyD4BwlZRFwnN+za
   YkuODKpvphMuUW30ACxZ7BZEzzyjVmWlSjwA3YcdVvOT3pH6DG47izq+a
   M9DfR1cPmxG72R1zi+9XYjRQ6NKQcQ4Na0hBmOpmEk2Dno/A+0k8vqXTi
   XF6Wt44R64jTbllVGsk90xaruV8UgY3ioBoEf50P8bngePWlOuFSS6H1M
   9TIhYcmrzWynAX9vPUOUAhup0YEh4xJDCqONFu7FeaHk6hFRO+io5U9hW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="374057736"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="374057736"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 10:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="984985793"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="984985793"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2023 10:49:14 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qagMT-000859-0s
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Aug 2023 17:49:13 +0000
Date: Tue, 29 Aug 2023 01:48:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2251/26832]
 kernel/irq_work.c:52:13: warning: no previous prototype for function
 'irq_local_work_raise'
Message-ID: <202308290123.uKnOyyKV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef4cd214d7c9836eb64fced61f30c02eadf8a91c
commit: 2d5253bea505b64cf79922d14e34f1411e1b9b95 [2251/26832] genirq: irq_pipeline: add IRQ pipeline core
config: hexagon-randconfig-001-20230828 (https://download.01.org/0day-ci/archive/20230829/202308290123.uKnOyyKV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290123.uKnOyyKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290123.uKnOyyKV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq_work.c:45:13: warning: no previous prototype for function 'arch_irq_work_raise' [-Wmissing-prototypes]
   void __weak arch_irq_work_raise(void)
               ^
   kernel/irq_work.c:45:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_irq_work_raise(void)
   ^
   static 
>> kernel/irq_work.c:52:13: warning: no previous prototype for function 'irq_local_work_raise' [-Wmissing-prototypes]
   void __weak irq_local_work_raise(void)
               ^
   kernel/irq_work.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak irq_local_work_raise(void)
   ^
   static 
   2 warnings generated.


vim +/irq_local_work_raise +52 kernel/irq_work.c

    51	
  > 52	void __weak irq_local_work_raise(void)
    53	{
    54		arch_irq_work_raise();
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
