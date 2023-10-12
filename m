Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0FB655
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 03:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHZPHLiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697079827; x=1728615827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lP3M1K0nn8/rsn7cXqCnlGlfqVgN0UwikaAy6daX3ks=;
  b=dHZPHLiRoVxO+dCAt/VUItpOdTwPgXzRnia/51dUx5/Wt1xU9Tpc1zv9
   3OFsM/8GAakT8wzpnXZnetAhjrYnixoDqKRU97RhmVQU6acOs14ZHcECg
   tty/g6MBt7WB3+E8tfVh/+3Q24NJNGkQ/X8Gz1/r0IgSUo0pSOR/MI9xa
   2fs7sEiUx6ufDA1ELNCFzYCkDj1jJ4jUTpwDJbEsjgos1QYdAdNmBkXqS
   vc2EuaCS1Pqnn0IPSydpmcGTMceI1k/rowtQYVbcsc4zT4TiAUJK7GFL7
   opZ5J9sZ3/yvdHHnkyvVYScxrtuCUBWeExJNfeD+9KIjt9/McAFKiPXpm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384673608"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="384673608"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 20:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754073978"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="754073978"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Oct 2023 20:03:42 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqlzA-00034D-0W;
	Thu, 12 Oct 2023 03:03:40 +0000
Date: Thu, 12 Oct 2023 11:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 74/269] checkpatch: WARNING: Prefer
 'unsigned int' to bare use of 'unsigned'
Message-ID: <202310121017.O3cZMXpO-lkp@intel.com>
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
commit: 365b5eacdf81411788778b1b729631499ab52add [74/269] xfs: create buftarg helpers to abstract block_device operations
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121017.O3cZMXpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121017.O3cZMXpO-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#100: FILE: fs/xfs/xfs_buf.h:414:
+	unsigned		flags)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
