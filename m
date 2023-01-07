Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166C95FD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673082209; x=1704618209;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ggiGfbl7YJShXnYT9OqwK/x5UPDxPh631VSLYBjWRQs=;
  b=U2NDEHgmAMLyMRuir1quGyoEWDCGherO6tU3U0aSiYP5UqwqYlT/dTUR
   vRRiY+/AHg1GKr4alElSt+8t6WwNBkLtMTlvIyPNoYZpLd89QvIMdeV9z
   AeW6iZrV444rEjmVDCCtxEuAsrl1zw6HXtDWfNthBTSD2fcCA7AyaV3M+
   6FIa14pyqoXXnIipulPAkbfQ0zcNby1qH+7m55Wp41j4ds4otGtVBNVFM
   atr9CrocOwCpQc/AdJyAnYfqIGRUdCEgy7R3Q1DZ9PsJv50WuonhMPGVc
   l2ygealdbq3Iqx7k090ahUqmKXOndfVogXVgoHNBfE9j01ikMtFpayh0a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="302323117"
X-IronPort-AV: E=Sophos;i="5.96,308,1665471600"; 
   d="scan'208";a="302323117"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2023 01:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="830139445"
X-IronPort-AV: E=Sophos;i="5.96,308,1665471600"; 
   d="scan'208";a="830139445"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Jan 2023 01:03:27 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pE56s-0004RK-0N;
	Sat, 07 Jan 2023 09:03:26 +0000
Date: Sat, 07 Jan 2023 17:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Paul E. McKenney <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+110 bytes kernel size regression] [i386-tinyconfig]
 [8913f44d2f] clocksource: Permit limited-duration clocksource watchdogging
Message-ID: <63b9353a.nQpRMM06Z4AiTzCD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +110 bytes kernel size regression due to commit:

commit: 8913f44d2f34f4110c5771b758f81ad2e0213e7d (clocksource: Permit limited-duration clocksource watchdogging)
https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git workqueue.2023.01.06a


Details as below (size data is obtained by `nm --size-sort vmlinux`):

c58a777f: rcu: Fix missing TICK_DEP_MASK_RCU_EXP dependency check
8913f44d: clocksource: Permit limited-duration clocksource watchdogging

+------------------------------------+----------+----------+-------+
|               symbol               | c58a777f | 8913f44d | delta |
+------------------------------------+----------+----------+-------+
| bzImage                            | 495776   | 495904   | 128   |
| nm.d.__param_str_watchdog_duration | 0        | 30       | 30    |
| nm.t.clocksource_select_watchdog   | 230      | 260      | 30    |
| nm.t.clocksource_watchdog          | 1072     | 1094     | 22    |
| nm.r.__param_watchdog_duration     | 0        | 20       | 20    |
| nm.d.watchdog_duration             | 0        | 4        | 4     |
| nm.b.watchdog_end_jiffies          | 0        | 4        | 4     |
+------------------------------------+----------+----------+-------+



Thanks

