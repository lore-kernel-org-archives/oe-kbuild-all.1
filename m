Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF9E2E738E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 02:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440991; cv=none; b=AiOoAHAjaC4vQNnjm++wWYkzebmnsrY3aHPLfYgO+vMhRspDUJDzjIuZbvf9jZPyQi4EBVc8P3y+/fXTOH648Gr8vGi8fW875Y1amxG+tFigLdR5qu2iQqq2P1lYRVKrLUrCfcmZmtCKXN3s89/00nDRB0J8ha4XXpsF3V+/Y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440991; c=relaxed/simple;
	bh=qFCMGqzAWXTYpcOtnWPipVoxp9/sbg890AtjjHZuYSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SQc6LabQbeyDRl50HHdJBguf1UIwGMvrBZXP4O19L52RoluKBSfYy5dowJl3vgY4izRBlNOmPvdDN8mX4vU25mq8PXFo1mVe1yZdjMy6jnY+o/O4QKthLqGEv3yko2+Z3EfkAu90uWigrRoIqfJzJrZip37O4d51W+u1PJlqHGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6UNxXkP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6UNxXkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782440989; x=1813976989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFCMGqzAWXTYpcOtnWPipVoxp9/sbg890AtjjHZuYSw=;
  b=l6UNxXkPhRKzCttNlPgPSnxVdWyJk7x9UXVa6lUSvHDW1rVQCBFBbKgG
   m7kweSIPgotjiysvdrLNzjh0s33/xBJTC0gBwKyKC8wcH/2Ha4g54Tqy7
   HC9Q8wmwRJa2vHYBoWm3csKpF19YnD/BzoyZA7jGpXU1IM6OKz2AnT95b
   MSZo8lx5q6Z41BesRkXBds+h6ETmpuPzrhO3bxKg0CYJ1wWJ7kLNa+6s6
   ZPJhFNn2KZseb5Z9oNYBQnqGYEomrD/Odn3eFQJC1YT9m8hPYGnKjGcfq
   ymC4T1qAKBSbAgAY4ACOMMxMZ7pg1P932ORlSSCoOLHTUpExqoNt5CVRW
   g==;
X-CSE-ConnectionGUID: wtYcAgSORZuRoamNgcLJGg==
X-CSE-MsgGUID: cmo1SDQ3RW+deg1nFTRdtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="87084419"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="87084419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 19:29:48 -0700
X-CSE-ConnectionGUID: oE3D2rIxRui7t60ek32/+Q==
X-CSE-MsgGUID: nTtqdfPTSLS5+zewcgxwIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="281305017"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Jun 2026 19:29:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcwK6-000000004jr-2MrZ;
	Fri, 26 Jun 2026 02:29:42 +0000
Date: Fri, 26 Jun 2026 10:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/scsi/qedi/qedi_debugfs.c:109:45: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202606261021.2zXZiUy4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   9 months ago
config: um-randconfig-r111-20260626 (https://download.01.org/0day-ci/archive/20260626/202606261021.2zXZiUy4-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606261021.2zXZiUy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606261021.2zXZiUy4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/qedi/qedi_debugfs.c:109:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const *ct @@     got char const [noderef] __user *buffer @@
   drivers/scsi/qedi/qedi_debugfs.c:109:45: sparse:     expected char const *ct
   drivers/scsi/qedi/qedi_debugfs.c:109:45: sparse:     got char const [noderef] __user *buffer
   drivers/scsi/qedi/qedi_debugfs.c:150:41: sparse: sparse: restricted __le16 degrades to integer
--
   drivers/net/wireless/ath/wil6210/debugfs.c: note: in included file:
>> drivers/net/wireless/ath/wil6210/txrx.h:662:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/wireless/ath/wil6210/debugfs.c:53:31: sparse: signed value source
>> drivers/net/wireless/ath/wil6210/txrx.h:662:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/wireless/ath/wil6210/debugfs.c:1123:39: sparse: signed value source

vim +109 drivers/scsi/qedi/qedi_debugfs.c

ace7f46ba5fde7 Manish Rangankar   2016-12-01   13  
bd571195c9535c Arnd Bergmann      2017-03-02  @14  int qedi_do_not_recover;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   15  static struct dentry *qedi_dbg_root;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   16  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   17  void
ace7f46ba5fde7 Manish Rangankar   2016-12-01   18  qedi_dbg_host_init(struct qedi_dbg_ctx *qedi,
779936faf4f121 Arnd Bergmann      2018-02-02   19  		   const struct qedi_debugfs_ops *dops,
ace7f46ba5fde7 Manish Rangankar   2016-12-01   20  		   const struct file_operations *fops)
ace7f46ba5fde7 Manish Rangankar   2016-12-01   21  {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   22  	char host_dirname[32];
ace7f46ba5fde7 Manish Rangankar   2016-12-01   23  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   24  	sprintf(host_dirname, "host%u", qedi->host_no);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   25  	qedi->bdf_dentry = debugfs_create_dir(host_dirname, qedi_dbg_root);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   26  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   27  	while (dops) {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   28  		if (!(dops->name))
ace7f46ba5fde7 Manish Rangankar   2016-12-01   29  			break;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   30  
26febfb38c7d67 Greg Kroah-Hartman 2019-01-22   31  		debugfs_create_file(dops->name, 0600, qedi->bdf_dentry, qedi,
ace7f46ba5fde7 Manish Rangankar   2016-12-01   32  				    fops);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   33  		dops++;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   34  		fops++;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   35  	}
ace7f46ba5fde7 Manish Rangankar   2016-12-01   36  }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   37  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   38  void
ace7f46ba5fde7 Manish Rangankar   2016-12-01   39  qedi_dbg_host_exit(struct qedi_dbg_ctx *qedi)
ace7f46ba5fde7 Manish Rangankar   2016-12-01   40  {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   41  	debugfs_remove_recursive(qedi->bdf_dentry);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   42  	qedi->bdf_dentry = NULL;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   43  }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   44  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   45  void
ace7f46ba5fde7 Manish Rangankar   2016-12-01   46  qedi_dbg_init(char *drv_name)
ace7f46ba5fde7 Manish Rangankar   2016-12-01   47  {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   48  	qedi_dbg_root = debugfs_create_dir(drv_name, NULL);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   49  }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   50  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   51  void
ace7f46ba5fde7 Manish Rangankar   2016-12-01   52  qedi_dbg_exit(void)
ace7f46ba5fde7 Manish Rangankar   2016-12-01   53  {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   54  	debugfs_remove_recursive(qedi_dbg_root);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   55  	qedi_dbg_root = NULL;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   56  }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   57  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   58  static ssize_t
ace7f46ba5fde7 Manish Rangankar   2016-12-01   59  qedi_dbg_do_not_recover_enable(struct qedi_dbg_ctx *qedi_dbg)
ace7f46ba5fde7 Manish Rangankar   2016-12-01   60  {
bd571195c9535c Arnd Bergmann      2017-03-02   61  	if (!qedi_do_not_recover)
bd571195c9535c Arnd Bergmann      2017-03-02   62  		qedi_do_not_recover = 1;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   63  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   64  	QEDI_INFO(qedi_dbg, QEDI_LOG_DEBUGFS, "do_not_recover=%d\n",
bd571195c9535c Arnd Bergmann      2017-03-02   65  		  qedi_do_not_recover);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   66  	return 0;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   67  }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   68  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   69  static ssize_t
ace7f46ba5fde7 Manish Rangankar   2016-12-01   70  qedi_dbg_do_not_recover_disable(struct qedi_dbg_ctx *qedi_dbg)
ace7f46ba5fde7 Manish Rangankar   2016-12-01   71  {
bd571195c9535c Arnd Bergmann      2017-03-02   72  	if (qedi_do_not_recover)
bd571195c9535c Arnd Bergmann      2017-03-02   73  		qedi_do_not_recover = 0;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   74  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   75  	QEDI_INFO(qedi_dbg, QEDI_LOG_DEBUGFS, "do_not_recover=%d\n",
bd571195c9535c Arnd Bergmann      2017-03-02   76  		  qedi_do_not_recover);
ace7f46ba5fde7 Manish Rangankar   2016-12-01   77  	return 0;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   78  }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   79  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   80  static struct qedi_list_of_funcs qedi_dbg_do_not_recover_ops[] = {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   81  	{ "enable", qedi_dbg_do_not_recover_enable },
ace7f46ba5fde7 Manish Rangankar   2016-12-01   82  	{ "disable", qedi_dbg_do_not_recover_disable },
ace7f46ba5fde7 Manish Rangankar   2016-12-01   83  	{ NULL, NULL }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   84  };
ace7f46ba5fde7 Manish Rangankar   2016-12-01   85  
779936faf4f121 Arnd Bergmann      2018-02-02   86  const struct qedi_debugfs_ops qedi_debugfs_ops[] = {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   87  	{ "gbl_ctx", NULL },
ace7f46ba5fde7 Manish Rangankar   2016-12-01   88  	{ "do_not_recover", qedi_dbg_do_not_recover_ops},
ace7f46ba5fde7 Manish Rangankar   2016-12-01   89  	{ "io_trace", NULL },
ace7f46ba5fde7 Manish Rangankar   2016-12-01   90  	{ NULL, NULL }
ace7f46ba5fde7 Manish Rangankar   2016-12-01   91  };
ace7f46ba5fde7 Manish Rangankar   2016-12-01   92  
ace7f46ba5fde7 Manish Rangankar   2016-12-01   93  static ssize_t
ace7f46ba5fde7 Manish Rangankar   2016-12-01   94  qedi_dbg_do_not_recover_cmd_write(struct file *filp, const char __user *buffer,
ace7f46ba5fde7 Manish Rangankar   2016-12-01   95  				  size_t count, loff_t *ppos)
ace7f46ba5fde7 Manish Rangankar   2016-12-01   96  {
ace7f46ba5fde7 Manish Rangankar   2016-12-01   97  	size_t cnt = 0;
ace7f46ba5fde7 Manish Rangankar   2016-12-01   98  	struct qedi_dbg_ctx *qedi_dbg =
ace7f46ba5fde7 Manish Rangankar   2016-12-01   99  			(struct qedi_dbg_ctx *)filp->private_data;
ace7f46ba5fde7 Manish Rangankar   2016-12-01  100  	struct qedi_list_of_funcs *lof = qedi_dbg_do_not_recover_ops;
ace7f46ba5fde7 Manish Rangankar   2016-12-01  101  
ace7f46ba5fde7 Manish Rangankar   2016-12-01  102  	if (*ppos)
ace7f46ba5fde7 Manish Rangankar   2016-12-01  103  		return 0;
ace7f46ba5fde7 Manish Rangankar   2016-12-01  104  
ace7f46ba5fde7 Manish Rangankar   2016-12-01  105  	while (lof) {
ace7f46ba5fde7 Manish Rangankar   2016-12-01  106  		if (!(lof->oper_str))
ace7f46ba5fde7 Manish Rangankar   2016-12-01  107  			break;
ace7f46ba5fde7 Manish Rangankar   2016-12-01  108  
ace7f46ba5fde7 Manish Rangankar   2016-12-01 @109  		if (!strncmp(lof->oper_str, buffer, strlen(lof->oper_str))) {
ace7f46ba5fde7 Manish Rangankar   2016-12-01  110  			cnt = lof->oper_func(qedi_dbg);
ace7f46ba5fde7 Manish Rangankar   2016-12-01  111  			break;
ace7f46ba5fde7 Manish Rangankar   2016-12-01  112  		}
ace7f46ba5fde7 Manish Rangankar   2016-12-01  113  
ace7f46ba5fde7 Manish Rangankar   2016-12-01  114  		lof++;
ace7f46ba5fde7 Manish Rangankar   2016-12-01  115  	}
ace7f46ba5fde7 Manish Rangankar   2016-12-01  116  	return (count - cnt);
ace7f46ba5fde7 Manish Rangankar   2016-12-01  117  }
ace7f46ba5fde7 Manish Rangankar   2016-12-01  118  

:::::: The code at line 109 was first introduced by commit
:::::: ace7f46ba5fde7273207c7122b0650ceb72510e0 scsi: qedi: Add QLogic FastLinQ offload iSCSI driver framework.

:::::: TO: Manish Rangankar <manish.rangankar@cavium.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
