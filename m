Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4A23D7B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 17:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679852749; x=1711388749;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1boyXk9osOrLxHXRdopFrPT9VG6Q7RXkpNOTNuTK/og=;
  b=iSO83EB+dR3MZUje+MIwWJiBo1oPvMb2EMK4vys4DHP/ueiYKsxOPx8/
   m/lIcGj42dhIGLkA9v/MQqFZIV2yCUxguwCsqiCHgEHSpaFx10grjnLZI
   +QEE/bztFhHtzDitjK4FiPojkvO/b+BVvHrJjWM9l/hYqWBa9ACP7oBa8
   DrF0OSh/6KuB7xN6Qf1yX1QHbfqxFpawuqnBSB0VMd20J7P8+3dS64KCk
   Eifc/2Q4diTHj/laBcM28PSgg5kv8pir4M+W6LoP/Ll8YctsQLGEEyjmd
   lkHg20Th4CWxHLwiiGHr6zNnOcm2uDIjxTs9LZIY88nMd+tyHA95Lwn05
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="405036992"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="405036992"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 10:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="715829844"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="715829844"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Mar 2023 10:45:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgUR9-000HHH-0c;
	Sun, 26 Mar 2023 17:45:47 +0000
Date: Mon, 27 Mar 2023 01:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+438 bytes kernel size regression] [i386-tinyconfig]
 [158190cd35] sched/fair: Add avg_vruntime
Message-ID: <642084ab.ZGaERWCSISWJA7g3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +438 bytes kernel size regression due to commit:

commit: 158190cd358e8de9eea36341f47c2393f4edd22e (sched/fair: Add avg_vruntime)
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf


Details as below (size data is obtained by `nm --size-sort vmlinux`):

26019bab: sched/fair: Add sched group latency support
158190cd: sched/fair: Add avg_vruntime

+--------------------------+----------+----------+-------+
|          symbol          | 26019bab | 158190cd | delta |
+--------------------------+----------+----------+-------+
| bzImage                  | 501856   | 502048   | 192   |
| nm.T.reweight_task       | 105      | 249      | 144   |
| nm.T.avg_vruntime        | 0        | 122      | 122   |
| nm.t.__dequeue_entity    | 0        | 86       | 86    |
| nm.t.update_min_vruntime | 181      | 252      | 71    |
| nm.t.__enqueue_entity    | 93       | 152      | 59    |
| nm.t.set_next_entity     | 64       | 58       | -6    |
| nm.t.dequeue_task_fair   | 228      | 222      | -6    |
| nm.t.rb_erase_cached     | 32       | 0        | -32   |
+--------------------------+----------+----------+-------+



Thanks

