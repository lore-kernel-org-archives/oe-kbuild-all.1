Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C5C284
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678389521; x=1709925521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2m7SZJAfJ+zpSO945uFPu0QLmUbls4CYTDjZ+adSxuY=;
  b=nBP7J+cMICaolRCbnetswaYNdCfIWCtBT2X0pllTtPyNXpnrsvrFxDlO
   zfdvLUi8PdAUX4b7djREGrGn6p/wvHzWwNSUnUGeNL7gKkMZVTGEMFtFq
   RJ19vtIrquX7ORL0CXqqG4nD9hsI7vlAouiWoSLWWdHiPr1jclGzE4qyx
   pOyGMR7bWCm+B/MrN20+g4kO5JQXgyzwd5coXDKAgOBvbdflrTLDVc1nP
   xaemMNhcT8RoCmu6PGggCdYGsQaF+3//wSpZ25fWq8vQjO+hY0djZD/pi
   YvSqVQf3mTJcJPpsh7w9TR7b+GuRnQrDCSklrUQo4FBab63cZ6tXlPzwO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422814028"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="422814028"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 11:18:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="820743546"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="820743546"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 11:18:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paLmf-0003AZ-1k;
	Thu, 09 Mar 2023 19:18:37 +0000
Date: Fri, 10 Mar 2023 03:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+296 bytes kernel size regression] [i386-tinyconfig]
 [8753875763] printk: Bring back the RT bits.
Message-ID: <640a3102.vilihN4K2Vp0davt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +296 bytes kernel size regression due to commit:

commit: 875387576398cac3c3b7e1bfce5013004d9f21c1 (printk: Bring back the RT bits.)
https://git.kernel.org/cgit/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase


Details as below (size data is obtained by `nm --size-sort vmlinux`):

85cd1bd2: preempt: Put preempt_enable() within an instrumentation*() section.
87538757: printk: Bring back the RT bits.

+--------------------------------+----------+----------+-------+
|             symbol             | 85cd1bd2 | 87538757 | delta |
+--------------------------------+----------+----------+-------+
| bzImage                        | 501568   | 501728   | 160   |
| nm.T.console_unlock            | 64       | 168      | 104   |
| nm.T.console_lock              | 40       | 110      | 70    |
| nm.t.printk_activate_kthreads  | 0        | 35       | 35    |
| nm.T.register_console          | 533      | 567      | 34    |
| nm.t.unregister_console_locked | 105      | 129      | 24    |
| nm.T.is_console_locked         | 6        | 28       | 22    |
| nm.T.console_unblank           | 122      | 131      | 9     |
| nm.b.console_kthreads_active   | 0        | 4        | 4     |
| nm.T.resume_console            | 32       | 35       | 3     |
| nm.B.block_console_kthreads    | 0        | 1        | 1     |
| nm.b.console_kthreads_blocked  | 0        | 1        | 1     |
| nm.b.console_locked            | 4        | 0        | -4    |
| nm.t.console_flush_all         | 129      | 122      | -7    |
+--------------------------------+----------+----------+-------+



Thanks

