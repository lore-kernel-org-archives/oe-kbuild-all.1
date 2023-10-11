Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78BC1D546
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AggVpD0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697065252; x=1728601252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ST7MfvB7qmsKbZjE0cBw1LBA5cjBC3vv4Tc/7Q6bVVM=;
  b=AggVpD0G7r+lEAqXUAVPmgg6ROVasOspRu6vDRdUT3/8aC47nxCIY5ZA
   xkGNc8L5A1TgmEHSD2OGXC2a9jg6XSlkGKoC4mjhynzEg4P+KKUaJ0I2q
   BONqEdAEXSR4/5DNan6XJRZDX/qVT+59Z3k3RCghQQ663o+ESD5rQMfBu
   xwoU8JkwSE0DN0oXokXt2eE8T/2zkSoKbG9ueQpzPXvynzyhqe2n2fgCB
   T9GhvoUeKW++Mjq1N5sxac7SnTzzjb7aa+EhhBGXmZiLWNW1K2JIADWlj
   mXG0nrJbJ7osrWiq3Q4GlrfJNiT1t429YfGJJKutpx3XI31x29fUeHgbt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387628052"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="387628052"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 16:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754008975"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="754008975"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Oct 2023 16:00:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqiC8-0002pD-2x;
	Wed, 11 Oct 2023 23:00:48 +0000
Date: Thu, 12 Oct 2023 07:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 16/269] checkpatch: WARNING: Possible
 repeated word: 'so'
Message-ID: <202310120614.lZInKi0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git inode-refactor
head:   5d7848682f41b20567e9d24b7c29a6d3964f0de6
commit: 64f5b22c66dde52ab99e2bd16b703309f88205b9 [16/269] xfs: repair free space btrees
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120614.lZInKi0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120614.lZInKi0S-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'so'
#494: FILE: fs/xfs/scrub/alloc_repair.c:274:
+ * Re-sort the free extents by block number so so that we can put the records

WARNING:REPEATED_WORD: Possible repeated word: 'so'
#542: FILE: fs/xfs/scrub/alloc_repair.c:322:
+ * Sort the free extents by length so so that we can put the records into the

WARNING:REPEATED_WORD: Possible repeated word: 'so'
#953: FILE: fs/xfs/scrub/alloc_repair.c:733:
+	 * If we need to re-sort the free extents by length, do so so that we

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
