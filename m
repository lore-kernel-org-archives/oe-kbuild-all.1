Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B801D54A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696443132; x=1727979132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YtR4MmBXb8w8zv7F3c/OpISK7gtI0OoP0+GquwhA4M4=;
  b=EA0cg4twYTMgxtjnJ6dl/75yowuOAG58aj6ayrLR8mJeP94mouohToJo
   lrXutSUZKCUFUAF2Ngmbtt8EJOdKM7J/ToJCtGkxr+uw2EjE2HRHAlsu7
   NZmpHWK/SSIRej2x48Q6a2si1IiLJbsiXExvIv1iaoWABtM3KNQoaovbS
   /Edgx8UyaMCrm6BZNheDPJrEVDVHarEbH0Gldf6iyIxa3QLbTYVz0k5KL
   H6i45FjLZh+e7Kl28b8BhkBIPvKZBDQPRLO26nsP7S/5gNyntGUB0dTS6
   i5XdrPC0a1aNBXn74vchwpKjJ1h7OdGOoVikzxgLdELmmZgL4NX562oxa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414173421"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="414173421"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 11:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701232230"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="701232230"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Oct 2023 11:11:56 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo6Li-000KU4-02;
	Wed, 04 Oct 2023 18:11:54 +0000
Date: Thu, 5 Oct 2023 02:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:xfs-atomic-write-v1 9/21] blk-merge.c:undefined
 reference to `__moddi3'
Message-ID: <202310050212.F8KZLnNe-lkp@intel.com>
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
commit: d510c9be9e4f296b8c570e740dbec8cff0d2a6a3 [9/21] block: Add checks to merging of atomic writes
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231005/202310050212.F8KZLnNe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050212.F8KZLnNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050212.F8KZLnNe-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: block/blk-merge.o: in function `ll_back_merge_fn':
>> blk-merge.c:(.text+0x1000): undefined reference to `__moddi3'
   sh4-linux-ld: block/blk-merge.o: in function `attempt_merge':
   blk-merge.c:(.text+0x1298): undefined reference to `__moddi3'
   sh4-linux-ld: block/blk-merge.o: in function `bio_attempt_front_merge':
   blk-merge.c:(.text+0x1744): undefined reference to `__moddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
