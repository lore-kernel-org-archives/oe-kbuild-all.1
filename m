Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197323C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Dec 2022 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670774005; x=1702310005;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UBzRpyMHwWvPI0e/ifb0Ax8jExlP3veCcrYiHHFCEiY=;
  b=eubcDwZ7x1H4oyqju1PI7yTKp/yKDW+iV8dhz2iHNjLsIRu7zOV+9e7K
   cQLiHkXVsLDulsfmKu+OgMpMXYJpC51QE8YFeTxuVGKc+9OcVeggrJZlK
   Ew8teGC7dOPAKopUITWGhuVlDdOJkXD5UAdLfGuD/WvKCz2WmGHBzv+mv
   Cv7c5bAufH7m6MMXETNSLUjvTLz3jNvLZRZ80VhleEYCRQyKFUH7iv48g
   9fqL+CC37ccFh7KeIT36mhKvBCgSjwF9AZw3hsh6m3O63NLNGq2vKU0Is
   2DFDiRCCmwYXOQOP7zFQHplsR8S3FQuvZKuOLNIBY444ec2Pv+N4N2l3+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="403966060"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="403966060"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2022 07:53:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="647901780"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="647901780"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Dec 2022 07:53:22 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p4Odm-00038Z-0m;
	Sun, 11 Dec 2022 15:53:22 +0000
Date: Sun, 11 Dec 2022 23:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+223 bytes kernel size regression] [i386-tinyconfig]
 [dbaf7ced0e] sched/fair: Introduce short duration task check
Message-ID: <6395fce5.QGDYTdFm1NKBGEwf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +223 bytes kernel size regression due to commit:

commit: dbaf7ced0e802eb1232045aa2838f7052688df77 (sched/fair: Introduce short duration task check)
https://github.com/yu-chen-surf/linux.git sis_v4


Details as below (size data is obtained by `nm --size-sort vmlinux`):

76dcd734: Linux 6.1-rc8
dbaf7ced: sched/fair: Introduce short duration task check

+------------------------+----------+----------+-------+
|         symbol         | 76dcd734 | dbaf7ced | delta |
+------------------------+----------+----------+-------+
| nm.t.dequeue_task_fair | 228      | 326      | 98    |
| bzImage                | 491648   | 491744   | 96    |
| nm.D.init_task         | 5376     | 5440     | 64    |
| nm.t.__sched_fork      | 182      | 216      | 34    |
| nm.t.enqueue_task_rt   | 204      | 213      | 9     |
| nm.t.task_tick_rt      | 74       | 79       | 5     |
| nm.t.dequeue_task_rt   | 30       | 33       | 3     |
| nm.t.pick_next_task_rt | 118      | 121      | 3     |
| nm.t.update_curr_rt    | 313      | 316      | 3     |
| nm.t.yield_task_rt     | 17       | 19       | 2     |
| nm.D.linux_banner      | 152      | 154      | 2     |
+------------------------+----------+----------+-------+



Thanks

