Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAC010EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 05:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693288044; x=1724824044;
  h=date:from:to:cc:subject:message-id;
  bh=q1iEJoSmiuGFpcKEFseZ59R/H5QjV+wwpEsCTKdf/as=;
  b=Z6XIi8E+pVOUnTV9hTO4Q54gZOTzCUMn75dr13NPChvfMOAL+JhbF1TP
   tAvIajXYYiXF2dzp0pQUpieW2VCoqPSwnXWZOksQFYYpOmuWsg3bcRpX6
   3AK+DW156GFI2Th3Lab+RsuXqVM97cVuGNQLI2YRn5OWlJbeMETPgkZCb
   3XgcV6TewcNNU0g5x6mpoPC8EeHPUUF+UzubCB6wfebqXlus7KZIj0NmM
   dg1TtSHfXbI8kVPtB5rqgHf64KJDYisFr9vYWAydidBIodtMqViDdu/iA
   13m6c2rIHXvPO2d6wyu5gwL0+PIx06cy9+PCjVAK/nSsqYLIedj5hJx+D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441630220"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="441630220"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882183773"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2023 22:47:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qarZR-0008Rv-13;
	Tue, 29 Aug 2023 05:47:21 +0000
Date: Tue, 29 Aug 2023 13:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>,
 Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+139 bytes kernel size regression] [i386-tinyconfig]
 [bf45053c96] ZEN: mm: Don't hog the CPU and zone lock in rmqueue_bulk()
Message-ID: <20230829054635.LaFn7%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +139 bytes kernel size regression due to commit:

commit: bf45053c965e9b8a0b6225c5d378493b5aaf1336 (ZEN: mm: Don't hog the CPU and zone lock in rmqueue_bulk())
https://github.com/zen-kernel/zen-kernel 6.5/zen-sauce


Details as below (size data is obtained by `nm --size-sort vmlinux`):

42ed39f2: ZEN: INTERACTIVE: Document PDS/BMQ configuration
bf45053c: ZEN: mm: Don't hog the CPU and zone lock in rmqueue_bulk()

+-------------------+----------+----------+-------+
|      symbol       | 42ed39f2 | bf45053c | delta |
+-------------------+----------+----------+-------+
| bzImage           | 516656   | 516848   | 192   |
| nm.t.rmqueue_bulk | 353      | 492      | 139   |
+-------------------+----------+----------+-------+



Thanks

