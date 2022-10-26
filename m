Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB92AD2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Oct 2022 19:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666811829; x=1698347829;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xB6PhP7dmslwh0cdyrXcH00uIXU21T5BNivoONPG3H8=;
  b=iqGkLAl/Vmf0lk0yv37vhTR3ipP1VqysC65pmYaShJKVKlFAamZFzvTN
   RklUbvkwW30YOLEA6pk9KT+NbWWQFfhchKTG7D4rB3MD4hEKzC5F9exvd
   rJ+wpiskT6nT91oNm0+q98sU26h4Crwa4xEfEYg+GoBsQs7V0Kos7CTHK
   dY9JqpcG6uzQtGoOFNtdySSTALDXxXxamE1d6aucJahyGri/bVGZhxoGR
   kBPQK/scV1Hxy9lHIdbmlzWcNyy8k6Gbxg4hN6UYGOYNkpQNlQ6GzaGun
   uM48rj8d6xfyhogzev7pD7Z6kXOVgwfewjIweeBB2cICSVhxV3WksihPy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309733834"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="309733834"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 12:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="583276953"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="583276953"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2022 12:17:07 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onltj-0007lH-0O;
	Wed, 26 Oct 2022 19:17:07 +0000
Date: Thu, 27 Oct 2022 03:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+238 bytes kernel size regression] [i386-tinyconfig]
 [0222549514] printk: Bring back the RT bits.
Message-ID: <635987b0.MQpeqMUkqkP79rHI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +238 bytes kernel size regression due to commit:

commit: 0222549514eb1926979338f5716fdcaa0ce23e47 (printk: Bring back the RT bits.)
https://git.kernel.org/cgit/linux/kernel/git/rt/linux-rt-devel.git linux-6.1.y-rt-rebase


Details as below (size data is obtained by `nm --size-sort vmlinux`):

e9ffa43d: locking/lockdep: Remove lockdep_init_map_crosslock.
02225495: printk: Bring back the RT bits.

+-------------------------------+----------+----------+-------+
|            symbol             | e9ffa43d | 02225495 | delta |
+-------------------------------+----------+----------+-------+
| bzImage                       | 491744   | 491840   | 96    |
| nm.T.console_unlock           | 48       | 126      | 78    |
| nm.T.console_lock             | 40       | 79       | 39    |
| nm.T.register_console         | 403      | 434      | 31    |
| nm.T.unregister_console       | 126      | 154      | 28    |
| nm.t.printk_activate_kthreads | 0        | 27       | 27    |
| nm.T.is_console_locked        | 6        | 28       | 22    |
| nm.T.console_unblank          | 84       | 92       | 8     |
| nm.b.console_kthreads_active  | 0        | 4        | 4     |
| nm.T.resume_console           | 32       | 35       | 3     |
| nm.B.block_console_kthreads   | 0        | 1        | 1     |
| nm.b.console_kthreads_blocked | 0        | 1        | 1     |
| nm.b.console_locked           | 4        | 0        | -4    |
+-------------------------------+----------+----------+-------+



Thanks

