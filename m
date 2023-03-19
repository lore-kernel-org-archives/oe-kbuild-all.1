Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E11872
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679252237; x=1710788237;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k9hQBEkHrp3oPgnRyBZqWXUEbx/TCOh7aff1PKI0/+8=;
  b=CE2NuVjKvilXM0vhS5ZZm+t+DDRj0ZyCSsI9kZLT7F2MXuwR/Wz2YaJs
   JoPzGhLY9UuFs+Iax8gjfOClR6XPG6x7GWoeleKEjUe80SI3MqzE0FtOe
   Q/pASjK0VHh6nwJLpbrXCcpt4N05JbELqEHyGYw/IlDs6TXfZftGg8zpL
   jiIaWYCCRhY359mTfL/vPPYqto94B3mq4yqNk44dwTzG4JNbmA4ScQ7J9
   3N/Qhzfw+Ampi/suq0O8awlfkMRWAV+NzgMgSSZJGlYdjnIb4jqVleXRD
   rg7NZgsp3OcjmV3dO40HYUhEzMNPgrGVNCMlXSQ/ZE62oLN0tj/0X22nA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="401109987"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="401109987"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 11:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="824257796"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="824257796"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2023 11:57:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdyDS-000Ad2-1n;
	Sun, 19 Mar 2023 18:57:14 +0000
Date: Mon, 20 Mar 2023 02:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Darrick J. Wong <djwong@kernel.org>,
 Dave Chinner <dchinner@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+79 bytes kernel size regression] [i386-tinyconfig]
 [1470afefc3] cpumask: introduce for_each_cpu_or
Message-ID: <64175ada.qebQHwjZb1CVDs7s%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +79 bytes kernel size regression due to commit:

commit: 1470afefc3c42df5d1662f87d079b46651bdc95b (cpumask: introduce for_each_cpu_or)
https://git.kernel.org/cgit/fs/xfs/xfs-linux.git xfs-6.3-fixes


Details as below (size data is obtained by `nm --size-sort vmlinux`):

3cfb9290: xfs: test dir/attr hash when loading module
1470afef: cpumask: introduce for_each_cpu_or

+------------------------+----------+----------+-------+
|         symbol         | 3cfb9290 | 1470afef | delta |
+------------------------+----------+----------+-------+
| bzImage                | 501504   | 501600   | 96    |
| nm.T._find_next_or_bit | 0        | 79       | 79    |
+------------------------+----------+----------+-------+



Thanks

