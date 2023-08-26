Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFCF1C29
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693039887; x=1724575887;
  h=date:from:to:cc:subject:message-id;
  bh=Gu9EEQp1IAqYoxD+ZyY/yE5ipmlC2K5DeSCDY0MdAM8=;
  b=LRwQ6I3TH9FzSiYjzoGQSGs5QeqTYJyctJgnAcHAfIluippWR/7kMUR+
   +MQmbkT8qwUveMjkZVCKS6atYkfQuKrXrje6zqM1N3VDaDNnPg1lhWAu9
   /tkFlA9lGufFv2LYCMQhz49Q7VeIfflWrOWivcok3OBmK/9IgCk4sPHMF
   tGjkTDZWQi2o1w7ELpeqyfITfq/BsbNpLMApuXcdvBRCU5sJYJAEKIUxf
   3lnmZgNMlVhWw64ujhCr6DzIpenXjAU07h9YSdGdkSAJrZR2iQyqS1wHD
   j2WAp8ciGy0ZXFwkrkGtWP1RB7WWXUUKZ234BnyNn7wHuoH4bY7fz8W/+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="405854604"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="405854604"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 01:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="740852964"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="740852964"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Aug 2023 01:51:25 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZp0u-0004WX-2O;
	Sat, 26 Aug 2023 08:51:24 +0000
Date: Sat, 26 Aug 2023 16:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>, Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+94 bytes kernel size regression] [i386-tinyconfig]
 [fb1020ea55] sched/core: Introduce sched_set_dl()
Message-ID: <20230826085122.M9m9L%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +94 bytes kernel size regression due to commit:

commit: fb1020ea55ca9602bfcf1d25a33a90f08475b5de (sched/core: Introduce sched_set_dl())
https://github.com/qais-yousef/linux sched-setscheduler-hide


Details as below (size data is obtained by `nm --size-sort vmlinux`):

029b407f: rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
fb1020ea: sched/core: Introduce sched_set_dl()

+-------------------+----------+----------+-------+
|      symbol       | 029b407f | fb1020ea | delta |
+-------------------+----------+----------+-------+
| nm.T.sched_set_dl | 0        | 94       | 94    |
| bzImage           | 516208   | 516272   | 64    |
+-------------------+----------+----------+-------+



Thanks

