Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377BEEDE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689641956; x=1721177956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+WuPHtAOvcFWKeZXmEUMMHhkCJi/xJxbNsivVKJLmxU=;
  b=eAe9Ek0U6yBcuYzWAvLqv8c70hWE/RjTRyuLzoc80QRiMuPCzAXlEmir
   TBy7HweqA/7XdldqmU8uvAXddpGTVB+mphD8/ApepiXiLHmcOb643TzuG
   HOUBQ7Mup48BrcSEJp89rxgzcSCM6kq+omhzcaKxTkkmztORiqGNe6PHR
   DCuelwzgkKTvdycy7mXqqKiUQ01JR9udq336RZQtchxujvfpAvz84jjzo
   jtSB0ef5Ta3Pkikj6jVgR54gGyegHl/RKT8yn8ruzPaLcnpNXUQW0Kzwa
   8PqOeJoPIhD/Om3DwP85l+rm1ScuX9UzvvDw1+9RSp3mpo4f+FHfshu5P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350941957"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="350941957"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 17:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1054081820"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="1054081820"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jul 2023 17:59:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLZ3Z-000A2w-2l;
	Tue, 18 Jul 2023 00:59:13 +0000
Date: Tue, 18 Jul 2023 08:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rw-misc:embedded_go_prog 1/1] /bin/bash: line 1: go: command not
 found
Message-ID: <202307180806.prgq1hPx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git embedded_go_prog
head:   58a51666e0ed2b23253048b0616ee5879361cc4a
commit: 58a51666e0ed2b23253048b0616ee5879361cc4a [1/1] misc: Add demo driver for user mode driver usage
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230718/202307180806.prgq1hPx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180806.prgq1hPx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180806.prgq1hPx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: go: command not found

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
