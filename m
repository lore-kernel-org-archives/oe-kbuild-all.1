Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C420EB21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jan 2023 22:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673995439; x=1705531439;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fJRfRygksPl9oxLgCO2IUlbVZR+M23SW+smakaxLPtY=;
  b=CFxDevzM3TTpoaXozq+O1mG+5qBxiC/Q6ARNq+19r7R10g8c5KuuFRYs
   L+BbV9PoTYR5LC47TRmeIlKZygx4Ou71LPIT1MbIKLeTqd6YdAcx/S81k
   Htj/whQowZPyXQ2tgPPIRr9YnDJjgx/0+/bIIXIAk+r5aRzMWGCthjCRS
   CPkO1kLLG2YhVBIn6f5nZ0ugO+MrNo38gN7xgb7H6avWzT+5Fesx19vFw
   HkiZx6LKQOQVCzOqJHNXPgZKuwfr7pKV6zPy6KRzpjORc8wLANVOvBXjQ
   TRoSyc0ulgb+QzJkysXJ43yQuqYVmPEosrDqT24SP3E9GVlPPhWSZmokW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305213347"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="305213347"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 14:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988305751"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="988305751"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 14:43:57 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHugO-0001S7-2i;
	Tue, 17 Jan 2023 22:43:56 +0000
Date: Wed, 18 Jan 2023 06:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+200 bytes kernel size regression] [i386-tinyconfig]
 [648ec09830] perf/core: Set data->sample_flags in perf_prepare_sample()
Message-ID: <63c724a4.JI4HunwypLxdZxX9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +200 bytes kernel size regression due to commit:

commit: 648ec098301d04b30086a4e892f646b7effe1920 (perf/core: Set data->sample_flags in perf_prepare_sample())
https://git.kernel.org/cgit/linux/kernel/git/namhyung/linux-perf.git perf/prepare-sample-v3


Details as below (size data is obtained by `nm --size-sort vmlinux`):

24e413d9: perf/core: Add perf_sample_save_brstack() helper
648ec098: perf/core: Set data->sample_flags in perf_prepare_sample()

+-----------------------------------+----------+----------+-------+
|              symbol               | 24e413d9 | 648ec098 | delta |
+-----------------------------------+----------+----------+-------+
| nm.T.perf_prepare_sample          | 1320     | 1509     | 189   |
| bzImage                           | 496384   | 496448   | 64    |
| nm.t.__perf_event_header__init_id | 184      | 195      | 11    |
+-----------------------------------+----------+----------+-------+



Thanks

