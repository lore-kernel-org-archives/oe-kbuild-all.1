Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD01C29
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693039948; x=1724575948;
  h=date:from:to:cc:subject:message-id;
  bh=y8CiUsoroEBgUkGWqhZuAdLaL0p7Azo9Ibx1PxK7fiU=;
  b=TgzFphOcGkASvVaWv5kCL7vEoAZNsKHO5xcrT8KYXOLK51utNQ4Kzp+Y
   rfaWoPB2D4L9kfZp1/0TyDemRMZNMRcEXhkqz8a1Z+xq1m8t11jLOAoh6
   UZUhPLmzwWsj9PV//mfqiD91zheWAt9CBmwr6p1rQHxuED3lbkxq+oQhi
   T7aYEBemtQ3ObWiTnU/i/6wkmOqxlfeZLVfQOvcW5bXZx+xlUGDeMPED9
   8y0djlGPWXisA3i7Iyuk1frMJuqzgTvaOOxaQ6gpd/+24QFKAuOOgP/V6
   pSawdfLBmQ+07iZTql2XwT9lOnGaOC5RjlE+SsqU8nDNOH7O3S4qaimjK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="365062723"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="365062723"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 01:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="767158704"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="767158704"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2023 01:52:25 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZp1s-0004Wd-2T;
	Sat, 26 Aug 2023 08:52:24 +0000
Date: Sat, 26 Aug 2023 16:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+651 bytes kernel size regression] [i386-tinyconfig]
 [e586c67baa] kthread: Provide a mechanism to control kthread sched_attr
Message-ID: <20230826085139.mUwfs%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +651 bytes kernel size regression due to commit:

commit: e586c67baa1c537a793f135e324cc56df2b6585b (kthread: Provide a mechanism to control kthread sched_attr)
https://github.com/qais-yousef/linux sched-setscheduler-hide


Details as below (size data is obtained by `nm --size-sort vmlinux`):

66cbe87c: sched: Make sched_set{scheduler, attr}() static
e586c67b: kthread: Provide a mechanism to control kthread sched_attr

+---------------------------------+----------+----------+-------+
|             symbol              | 66cbe87c | e586c67b | delta |
+---------------------------------+----------+----------+-------+
| bzImage                         | 516272   | 516688   | 416   |
| nm.d.__param_str_sched_deadline | 0        | 35       | 35    |
| nm.d.__param_str_sched_priority | 0        | 35       | 35    |
| nm.d.__param_str_sched_util_max | 0        | 35       | 35    |
| nm.d.__param_str_sched_util_min | 0        | 35       | 35    |
| nm.d.__param_str_sched_runtime  | 0        | 34       | 34    |
| nm.d.__param_str_sched_period   | 0        | 33       | 33    |
| nm.d.__param_str_sched_policy   | 0        | 33       | 33    |
| nm.d.__param_str_sched_nice     | 0        | 31       | 31    |
| nm.r.__param_sched_deadline     | 0        | 20       | 20    |
| nm.r.__param_sched_nice         | 0        | 20       | 20    |
| nm.r.__param_sched_period       | 0        | 20       | 20    |
| nm.r.__param_sched_policy       | 0        | 20       | 20    |
| nm.r.__param_sched_priority     | 0        | 20       | 20    |
| nm.r.__param_sched_runtime      | 0        | 20       | 20    |
| nm.r.__param_sched_util_max     | 0        | 20       | 20    |
| nm.r.__param_sched_util_min     | 0        | 20       | 20    |
| nm.D.param_ops_sched_deadline   | 0        | 16       | 16    |
| nm.D.param_ops_sched_nice       | 0        | 16       | 16    |
| nm.D.param_ops_sched_period     | 0        | 16       | 16    |
| nm.D.param_ops_sched_policy     | 0        | 16       | 16    |
| nm.D.param_ops_sched_priority   | 0        | 16       | 16    |
| nm.D.param_ops_sched_runtime    | 0        | 16       | 16    |
| nm.D.param_ops_sched_util_max   | 0        | 16       | 16    |
| nm.D.param_ops_sched_util_min   | 0        | 16       | 16    |
| nm.b.sched_deadline             | 0        | 8        | 8     |
| nm.b.sched_period               | 0        | 8        | 8     |
| nm.b.sched_runtime              | 0        | 8        | 8     |
| nm.b.sched_nice                 | 0        | 4        | 4     |
| nm.b.sched_policy               | 0        | 4        | 4     |
| nm.b.sched_priority             | 0        | 4        | 4     |
| nm.b.sched_util_max             | 0        | 4        | 4     |
| nm.b.sched_util_min             | 0        | 4        | 4     |
| nm.T.param_get_sched_deadline   | 0        | 3        | 3     |
| nm.T.param_get_sched_nice       | 0        | 3        | 3     |
| nm.T.param_get_sched_period     | 0        | 3        | 3     |
| nm.T.param_get_sched_policy     | 0        | 3        | 3     |
| nm.T.param_get_sched_priority   | 0        | 3        | 3     |
| nm.T.param_get_sched_runtime    | 0        | 3        | 3     |
| nm.T.param_get_sched_util_max   | 0        | 3        | 3     |
| nm.T.param_get_sched_util_min   | 0        | 3        | 3     |
| nm.T.param_set_sched_deadline   | 0        | 3        | 3     |
| nm.T.param_set_sched_nice       | 0        | 3        | 3     |
| nm.T.param_set_sched_period     | 0        | 3        | 3     |
| nm.T.param_set_sched_policy     | 0        | 3        | 3     |
| nm.T.param_set_sched_priority   | 0        | 3        | 3     |
| nm.T.param_set_sched_runtime    | 0        | 3        | 3     |
| nm.T.param_set_sched_util_max   | 0        | 3        | 3     |
| nm.T.param_set_sched_util_min   | 0        | 3        | 3     |
+---------------------------------+----------+----------+-------+



Thanks

