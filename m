Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7263D7B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679852750; x=1711388750;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=McH3CnBhDCqJKK/RFfv5t4xbEQdFomla0IDwMG5SZEk=;
  b=Ybuq+mSTi/00P0OXqcA1XT6bMCnOebjyhZvG4TgYdkks7ICvdoJD9EHV
   mu17Q0C2CV6y7voRfVydUF8RcZTk+333UON4/heXTCJ+c3BGAzi9EjeQI
   lEwp5R9W6LfI+mdaBUijUEpjL6/086eUK2x/S/FSpcHbKL2mxsZAR7M83
   ZPBW6DY3Oow8DhnRP+7aZqPGYMRBGgCxMx5sXNHuxIyinmJOuq3gGm0If
   aOa2kE9g15kdMmaRa0STBco/kDaebqbuvK1CuSgM7CDsbABGkB4uK6L6K
   txcoQlLEAnWD453VKoYayMqDSy4T2Xc43hnCPs2F9QWpXRXL71xVE1nY5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="405036988"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="405036988"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 10:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="715829842"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="715829842"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Mar 2023 10:45:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgUR9-000HHD-0Q;
	Sun, 26 Mar 2023 17:45:47 +0000
Date: Mon, 27 Mar 2023 01:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+768 bytes kernel size regression] [i386-tinyconfig]
 [77831add12] sched/fair: Implement an EEVDF like policy
Message-ID: <642084c2.FLUwyKcCOKHp/EgN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +768 bytes kernel size regression due to commit:

commit: 77831add12462ef1dbc603d0e2670ed21d8c9ab9 (sched/fair: Implement an EEVDF like policy)
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf


Details as below (size data is obtained by `nm --size-sort vmlinux`):

5bb7382b: rbtree: Add rb_add_augmented_cached() helper
77831add: sched/fair: Implement an EEVDF like policy

+--------------------------------+----------+----------+-------+
|             symbol             | 5bb7382b | 77831add | delta |
+--------------------------------+----------+----------+-------+
| bzImage                        | 502080   | 502496   | 416   |
| nm.t.__dequeue_entity          | 86       | 381      | 295   |
| nm.t.pick_eevdf                | 0        | 234      | 234   |
| nm.t.calc_delta_fair           | 0        | 216      | 216   |
| nm.T.entity_eligible           | 0        | 169      | 169   |
| nm.T.update_entity_lag         | 22       | 133      | 111   |
| nm.t.place_entity              | 99       | 173      | 74    |
| nm.t.min_deadline_cb_propagate | 0        | 71       | 71    |
| nm.t.min_deadline_cb_rotate    | 0        | 51       | 51    |
| nm.t.__update_min_deadline     | 0        | 42       | 42    |
| nm.t.__enqueue_entity          | 152      | 192      | 40    |
| nm.t.update_curr               | 93       | 127      | 34    |
| nm.t.enqueue_task_fair         | 212      | 234      | 22    |
| nm.t.yield_task_fair           | 73       | 89       | 16    |
| nm.t.min_deadline_cb_copy      | 0        | 15       | 15    |
| nm.T.reweight_task             | 269      | 281      | 12    |
| nm.t.task_fork_fair            | 168      | 173      | 5     |
| nm.t.update_min_vruntime       | 252      | 257      | 5     |
| nm.t.switched_from_fair        | 48       | 50       | 2     |
| nm.t.get_rr_interval_fair      | 25       | 23       | -2    |
| nm.t.__pick_next_task_fair     | 9        | 6        | -3    |
| nm.t.check_preempt_wakeup      | 139      | 133      | -6    |
| nm.t.wakeup_preempt_entity     | 75       | 0        | -75   |
| nm.t.task_tick_fair            | 155      | 65       | -90   |
| nm.T.pick_next_task_fair       | 149      | 53       | -96   |
| nm.t.sched_slice               | 168      | 0        | -168  |
| nm.t.__calc_delta              | 206      | 0        | -206  |
+--------------------------------+----------+----------+-------+



Thanks

