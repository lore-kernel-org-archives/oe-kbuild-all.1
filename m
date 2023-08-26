Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BF37C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 00:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693008146; x=1724544146;
  h=date:from:to:cc:subject:message-id;
  bh=KPWTezc0BZYBZtcp8hQzLYsk2XK0DC4YUk66BmSDgTs=;
  b=Vpmv/EwH2R5fVkm4RsV/1ayChlSYBJgC73i6lZO9/EwDetalWwq61Q4R
   HJvPhZwaPTdAB1C4xNOXbqwAAeBnVizVu2dISeRQ61UfygQma9dWIM+BV
   hFbjThUXnCfb7h+hZ+PWhX038/0z3E8WkoFLlQTe3bGSzAYPzau0G8PTa
   d800yQT697g6G4b8STCMgbtF8VyNLgnr26fNOoeGGRWjNTz8YXRKQpjgE
   eLep4koWThO/FK/+U/PFgBiJVjgwrOCdLn4USM0sYBmeKS3nn6pdpiVnr
   +P/Mi/EXi5dPdYMvZoP9wwElMxDzMt4hnCorkHAr+uQjtooH0V6lUh2Ph
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359823192"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="359823192"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911447211"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="911447211"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 17:02:25 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZgky-00049M-1A;
	Sat, 26 Aug 2023 00:02:24 +0000
Date: Sat, 26 Aug 2023 08:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+64 bytes kernel size regression] [i386-tinyconfig]
 [f8788d2a0f] printk: Add non-BKL console basic infrastructure
Message-ID: <20230826000220.aXKNq%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +64 bytes kernel size regression due to commit:

commit: f8788d2a0fbe75a9b76ea62cbfd1870da4834ed8 (printk: Add non-BKL console basic infrastructure)
https://git.kernel.org/cgit/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt-rebase


Details as below (size data is obtained by `nm --size-sort vmlinux`):

5c480b99: printk: Add per-console suspended state
f8788d2a: printk: Add non-BKL console basic infrastructure

+-----------------------------+----------+----------+-------+
|           symbol            | 5c480b99 | f8788d2a | delta |
+-----------------------------+----------+----------+-------+
| bzImage                     | 516528   | 516656   | 128   |
| nm.T.register_console       | 516      | 549      | 33    |
| nm.T.console_flush_on_panic | 90       | 100      | 10    |
| nm.T.console_unblank        | 119      | 129      | 10    |
| nm.t.console_cpu_notify     | 17       | 26       | 9     |
| nm.b.have_bkl_console       | 0        | 1        | 1     |
| nm.B.have_boot_console      | 0        | 1        | 1     |
+-----------------------------+----------+----------+-------+



Thanks

