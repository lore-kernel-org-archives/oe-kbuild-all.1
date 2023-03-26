Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6EC3C3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 17:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679852749; x=1711388749;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=48LvFeNUWKXXrVdsVAjhKUOGhxHyWTa5NBoslJbkM1s=;
  b=K/VJDCu84YsYSbmzGsJYCU2zaQPNJ+2+uJuM3T8U4yt7rHmrrWldAenq
   3tRus/2iYNZfkTE4VqH/u33cmiQ/eBBeUYLK9A0RtCyRlzmdJQZjf30uz
   91ZgJZ6vnMsNsWMADKv0Qr5tjPKVEn4Eg07/3bH1tj4fd120Nv4RiFPSE
   HQhX6x4LO/svELpQXmx4P2A9T+jtxgW4WhuMPULscK77G0D7dFNHaJOVG
   vkot2ayHEfBPtqeFSq6sS5AeUH6NffH7rrBetioUf8s2tRoUkllDgGgBB
   wZYUT5Q+eO0r+Wgap8Broj5erQIenBwtFn1oT6s006vnVECLnvlMpCjuV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="323997979"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="323997979"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 10:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857429814"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="857429814"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Mar 2023 10:45:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgUR9-000HHF-0W;
	Sun, 26 Mar 2023 17:45:47 +0000
Date: Mon, 27 Mar 2023 01:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+101 bytes kernel size regression] [i386-tinyconfig]
 [c764ce1205] sched/fair: Add latency_offset
Message-ID: <64208490.O5zpC0gnDULI8RlN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +101 bytes kernel size regression due to commit:

commit: c764ce12053a1762097ddd302e2d6d6210c9f11d (sched/fair: Add latency_offset)
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf


Details as below (size data is obtained by `nm --size-sort vmlinux`):

26327173: sched: Introduce latency-nice as a per-task attribute
c764ce12: sched/fair: Add latency_offset

+---------------------------+----------+----------+-------+
|          symbol           | 26327173 | c764ce12 | delta |
+---------------------------+----------+----------+-------+
| bzImage                   | 501696   | 501792   | 96    |
| nm.T.calc_latency_offset  | 0        | 43       | 43    |
| nm.t.set_latency_offset   | 0        | 26       | 26    |
| nm.T.sched_fork           | 177      | 184      | 7     |
| nm.t.__sched_fork         | 188      | 195      | 7     |
| nm.t.__sched_setscheduler | 1053     | 1060     | 7     |
| nm.t.pick_next_task_rt    | 122      | 125      | 3     |
| nm.t.update_curr_rt       | 313      | 316      | 3     |
| nm.t.yield_task_rt        | 17       | 19       | 2     |
| nm.t.task_tick_rt         | 77       | 79       | 2     |
| nm.D.linux_banner         | 165      | 166      | 1     |
+---------------------------+----------+----------+-------+



Thanks

