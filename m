Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7147B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675607963; x=1707143963;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=8F6bOF7Qc9eqY70uepvErXmfZFHilnak55dbOvSbQm0=;
  b=jz7tnLF66CTQ+kqp+jqc4rJIdsZFG2w7c0vMV3qs4F1Th3SYb72hrGXK
   euHOXl/lO2ds7Uba792WBd/PfTsJszqT3VF+6AgyOjt6pf7dJJmIvwijo
   qDJBwcFGPq2yeldgYeQgKkHp77huRG/wy6iwO27TxiQndn6RhUe2fkv0p
   U/GYoBMh/+UBfZt+6V0NTqsrSvzUHMANqL4QGU3mXpecuSsNAK4jgZSFx
   xapcSIiJB6sl91mPkx0MFnra2N0Pz0Oxh6ioUXgj3Zch2x6dDG5dQ7H+7
   dN3d1n0xXzAJwTGOpsHzVQVncuSO1Xlat8/Ii6VkhJfDQcUWHPXhbRN/p
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308692277"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="308692277"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 06:39:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="666258872"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="666258872"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Feb 2023 06:39:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOgAr-00023g-1N;
	Sun, 05 Feb 2023 14:39:21 +0000
Date: Sun, 5 Feb 2023 22:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+135 bytes kernel size regression] [i386-tinyconfig]
 [4299144a45] fs: move drop_pagecache_sb() for others to use
Message-ID: <Y9+/jQMFHTlvSOfH@154bab7f4c55>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675522718-88-3-git-send-email-ruansy.fnst@fujitsu.com>


FYI, we noticed a +135 bytes kernel size regression due to commit:

commit: 4299144a452513c0fe7f90596ecb6910a1496ecc (fs: move drop_pagecache_sb() for others to use)
url: https://github.com/intel-lab-lkp/linux/commits/Shiyang-Ruan/xfs-fix-the-calculation-of-length-and-end/20230204-230158
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/1675522718-88-3-git-send-email-ruansy.fnst@fujitsu.com/
patch subject: [PATCH v9 2/3] fs: move drop_pagecache_sb() for others to use


Details as below (size data is obtained by `nm --size-sort vmlinux`):

fc58b138: xfs: fix the calculation of length and end
4299144a: fs: move drop_pagecache_sb() for others to use

+-----------------------------+----------+----------+-------+
|           symbol            | fc58b138 | 4299144a | delta |
+-----------------------------+----------+----------+-------+
| bzImage                     | 495968   | 496128   | 160   |
| nm.T.super_drop_pagecache   | 0        | 122      | 122   |
| nm.T.invalidate_inode_pages | 0        | 13       | 13    |
+-----------------------------+----------+----------+-------+



Thanks


