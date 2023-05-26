Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5618B0D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685126802; x=1716662802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98rGikuHde31/X+brp6QIbNo6J6jrJOTgaPIM2QpyWI=;
  b=M8daImmJIWRRNejlAyNzecjITgOdDJvIV0Ju4QnCJT8CgT1kJDBi4ecj
   gpiE9vpUy1pcvFY8DKyB4Qhb7Hkw4ROrDtOhGzedsQ1ZLDxZ45NyBNbVK
   H9x6uQ00iulnj0XWBZ5gEdGcjlmSrcEHNYXkHWAMDRlJ57I1pRPw4GtDy
   mnJWRonAnr1ON55z7E4HoS39QkhVeJY2kxfCV+iSBNl8oC5UShQi4P2nK
   NatTGoprQV9YFTYv+MpDeifBN3ZFAjsB/r8JIcNb+PQgy7wLT1XnpMFTe
   KgjBx9oqcTkPtZSWv+VQWeAlRGNWFTrj2/QpdVfdGh6aT5jC0MA24gr3+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333902040"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="333902040"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 11:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775177080"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="775177080"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 11:46:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2cSW-000JXU-37;
	Fri, 26 May 2023 18:46:40 +0000
Date: Sat, 27 May 2023 02:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 256/484]
 fs/xfs/scrub/parent_repair.c:193:2-8: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202305270250.OknJmn51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   325ab2d5a55be89bcab6a8d6ec52bb6697cb7c28
commit: c7a424359a4a9a8813e415f6f464f13a649f1499 [256/484] xfs: actually rebuild the parent pointer xattrs
config: i386-randconfig-c021-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270250.OknJmn51-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270250.OknJmn51-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/parent_repair.c:193:2-8: WARNING: NULL check before some freeing functions is not needed.
   fs/xfs/scrub/parent_repair.c:196:2-8: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
