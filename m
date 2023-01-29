Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6B182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 00:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674951302; x=1706487302;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uR0LdlOx42SqaCeYPmK47Ri+Ui8crIR3iZAwVtGlINg=;
  b=Jg0La8Diq7ls2iAJbEmIUFT9PaSfbF0vD86GsO9ciT1oEnbCg2SZq4cU
   AoD9Xx4RNdurKlwe9P6Vs56jAwHjmGZ9g9ELQ+1PHBsE52iTi0O9ipguC
   9A1qJC6pk9Ul+EhbgAiVs4IRmb7ak69yV5Tjoy2AlzauRH1ba6of6HU/y
   zlY/rlRYdyGv/yvumbwT5DxxKRJOW4QiFyBDlT4qFZq8+SoR0cKFpWUeM
   5UO4IQa656k5zFlG/01nwYQKzJYqfwaSil8Ekn3QwF10OjzhHR2e1zyUo
   /XQ4aF2zVyvQC6Ka6QpNBY9iQI8CyOwbK60PTLb2usv/n4pBcJ8F8OmZn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325042445"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="325042445"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 16:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="641119554"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="641119554"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jan 2023 16:15:00 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLvLX-0001GG-1W;
	Sun, 29 Jan 2023 00:14:59 +0000
Date: Sun, 29 Jan 2023 08:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: Paul E. McKenney <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+861 bytes kernel size regression] [i386-tinyconfig]
 [f9588508f1] sched/clock: Make local_clock() noinstr
Message-ID: <63d5ba67.EhiTFPb8O16qLrG/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +861 bytes kernel size regression due to commit:

commit: f9588508f16615daf50ae4e3e16f40b6be874154 (sched/clock: Make local_clock() noinstr)
https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/peterz.2023.01.26a


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a154b2be: x86: Mark sched_clock() noinstr
f9588508: sched/clock: Make local_clock() noinstr

+-------------------------------------------+----------+----------+-------+
|                  symbol                   | a154b2be | f9588508 | delta |
+-------------------------------------------+----------+----------+-------+
| nm.t.sched_clock_cpu                      | 0        | 628      | 628   |
| bzImage                                   | 496000   | 496448   | 448   |
| nm.T.local_clock                          | 0        | 324      | 324   |
| nm.T.sched_clock_tick                     | 29       | 326      | 297   |
| nm.t.__try_cmpxchg64                      | 0        | 39       | 39    |
| nm.W.running_clock                        | 11       | 9        | -2    |
| nm.t.dummy_clock_read                     | 33       | 31       | -2    |
| nm.W.read_persistent_wall_and_boot_offset | 56       | 54       | -2    |
| nm.t.local_clock                          | 11       | 0        | -11   |
| nm.T.sched_clock_cpu                      | 141      | 52       | -89   |
| nm.t.sched_clock_local                    | 321      | 0        | -321  |
+-------------------------------------------+----------+----------+-------+



Thanks

