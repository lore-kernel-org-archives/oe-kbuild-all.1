Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A7B1B29D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6jQe2Y1"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696448084; x=1727984084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgfIsy/jMuE95BMo/SlaF1qwUBop+ydZJrhlIoi2t3w=;
  b=W6jQe2Y1BAftq6rgEWGgZI1sEFSmjqs1ryozd8u0MeGaZ4n8uWDaE3ny
   YmSaFu5JwRy6VEtueR8ynACcwc3qc1hp0oCwVGec85DyACJtOeMoRRg+B
   Nna3da+/LUbyluqMA/utzouSq1RtXmHXL9Gd17zNKC6gI6cNqEX2O8zg+
   LGx+IjRZhy/zucxyYEIGflPfJMzaWNJAgk0G8yR3DuuLnc04xxvANQz3b
   HehJfnPDsSGgk+ct5afMkHL1iJ1caW1mAekmk1xIXaSZZ9lP6K1pGPJwW
   Q+ukzTRon0vFlhg+OJC+C+aLmaBJzdpiYV+kdDdl9xiyL/58mUVtJndka
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4845907"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="4845907"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 12:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="895107482"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="895107482"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2023 12:33:15 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo7dn-000KYq-1r;
	Wed, 04 Oct 2023 19:34:39 +0000
Date: Thu, 5 Oct 2023 03:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:xfs-atomic-write-v1 10/21] fops.c:undefined reference
 to `__moddi3'
Message-ID: <202310050323.jyDV6rW5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux xfs-atomic-write-v1
head:   6e46c5eac75533f8ca2e7446bddedc9560a032fc
commit: e6f110099f01b1aee4193e3be1df4ba873175abd [10/21] block: Add fops atomic write support
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231005/202310050323.jyDV6rW5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050323.jyDV6rW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050323.jyDV6rW5-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: block/fops.o: in function `blkdev_atomic_write_valid.isra.0':
>> fops.c:(.text+0x344): undefined reference to `__moddi3'
   sh4-linux-ld: block/blk-merge.o: in function `ll_back_merge_fn':
   blk-merge.c:(.text+0x1000): undefined reference to `__moddi3'
   sh4-linux-ld: block/blk-merge.o: in function `attempt_merge':
   blk-merge.c:(.text+0x1298): undefined reference to `__moddi3'
   sh4-linux-ld: block/blk-merge.o: in function `bio_attempt_front_merge':
   blk-merge.c:(.text+0x1744): undefined reference to `__moddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
