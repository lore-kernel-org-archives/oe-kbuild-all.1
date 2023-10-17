Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F415B1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 04:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwqzY99k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697517691; x=1729053691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=icLdwh8Qw72wAQubkL58EiOXQOqV3N5svsAry0u/vJk=;
  b=GwqzY99khPaH+YIYp492Uwo5/Mu3tTIfJKcbbDUH255EP6qAbWGVRqvw
   qz+1bqMs/9Cx4W78NnPDEkN0xIQ8326JOOE8+qryddLWNP755ydSHEUOW
   6LHd1P3/4mftpJrhjqrKp9peIHiR1XRIfD//5y5lQ53Y8JOqDrPcEnmNs
   ABlHy56kvZn7SsCbbbJQQsRmZl+hxRv3A0pt0ekAzQeFUAujG/2Al/MsX
   X9DXqK2J5aURyU5bOXwjZJvA2woO+8hGHI3Z0vLE9qR3vpgfCMeyJx6SR
   KqDEfeRLSnt56LLubNRjD3PHDrAsRhQ71iJ6fu3yUpGQQTqiEVVsFUPL0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="385538080"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="385538080"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 21:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="705841392"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="705841392"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Oct 2023 21:41:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsbtV-00090r-0j;
	Tue, 17 Oct 2023 04:41:25 +0000
Date: Tue, 17 Oct 2023 12:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rt-unit-conversions-6.7 4/21] checkpatch:
 WARNING: ENOSYS means 'invalid syscall nr' and nothing else
Message-ID: <202310171239.qUOzFh0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git refactor-rt-unit-conversions-6.7
head:   f60b96941aa23f71e50fb4d64e9a789e93146d9b
commit: 29c02402734414f237162fb8afa9739952b7d75f [4/21] xfs: hoist freeing of rt data fork extent mappings
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171239.qUOzFh0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171239.qUOzFh0d-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#126: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#126: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#126: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(ENOSYS)
                                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
