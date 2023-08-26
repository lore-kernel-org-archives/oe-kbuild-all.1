Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D337D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 00:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693008148; x=1724544148;
  h=date:from:to:cc:subject:message-id;
  bh=Ncj9cfACAcRc38LdN56NSZijjT+MmWlm1Yeit9uq4YY=;
  b=I+g95jobSEh1IwDhUQGGTadrGpsi+Q1M2HsNs7og7b39BNrLrXkpOBTm
   a4DC9O25p0ayBRpv6yuch6nSdOwl7XrRW/fmWXm44Q2Sw/Albin4N83us
   vUzQfgepmaTciy13AXTx9iNf2WsOqGHr1cLT8xxUtQ2SpyLvYLXIuVCem
   BYZBd+9oO+EisIpXX+MX0U07UVDRUYpsiZfbrGlvN3dhDIVwb8pxkC36i
   MAdWJ99oiINcK8zmB3f8yhFEG1uDq511tIPCalBGMvWUJC4AK0F1wrGwz
   TohXVdOvGhu6xf7djXNV37oi9cUatn+QXu5DwiM5DU8APhJe43iBsriff
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="438771793"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="438771793"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="827752651"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="827752651"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2023 17:02:25 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZgky-00049J-14;
	Sat, 26 Aug 2023 00:02:24 +0000
Date: Sat, 26 Aug 2023 08:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+117 bytes kernel size regression] [i386-tinyconfig]
 [5c480b99b0] printk: Add per-console suspended state
Message-ID: <20230826000158.b1Vid%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +117 bytes kernel size regression due to commit:

commit: 5c480b99b01acec0935b964dadfc517559faf56d (printk: Add per-console suspended state)
https://git.kernel.org/cgit/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt-rebase


Details as below (size data is obtained by `nm --size-sort vmlinux`):

b23a6c75: printk: Consolidate console deferred printing
5c480b99: printk: Add per-console suspended state

+------------------------+----------+----------+-------+
|         symbol         | b23a6c75 | 5c480b99 | delta |
+------------------------+----------+----------+-------+
| bzImage                | 516464   | 516528   | 64    |
| nm.T.resume_console    | 29       | 84       | 55    |
| nm.T.suspend_console   | 30       | 82       | 52    |
| nm.t.console_flush_all | 128      | 138      | 10    |
+------------------------+----------+----------+-------+



Thanks

