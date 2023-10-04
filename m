Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8B219E9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VU85aKMJ"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696447443; x=1727983443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PjfM31URntTXe/4sWxj6I9KrN0r+t6fNuz8aa4OEuHA=;
  b=VU85aKMJJGKyTgoqJgRaDjmE1lFFsTE2zSi9eYCbt2bgL9cjRWxQIag3
   WTfl07Z1bvizAmpVM6T5EPSvwZpHAzkOHV3J3CCYNfOo/0V9OYZO4Z/OY
   h40HiLzChqDQhV2L1XKWbLO6P6aRcvM6vYJZh/JKDaeHY6ai9VaYAhazn
   yZYjLSGHKD5xwWzZjpz0Y3Toq0+dH72Z6Oex3n7nhwOtZX+N+hq5s3NcN
   +zs4w0/qcWyY+lHhqSl0Z3KDXvN/FNdrq35cCTVO1FthB/PYRNv9kdWXk
   GR62FZ/SNpKrPRFEwi0cFl9ZjxS/IqRs42RTFeQJiJBWSeomYeQh0Q+e6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382144345"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="382144345"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 12:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701278240"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="701278240"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Oct 2023 12:23:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo7TQ-000KXs-11;
	Wed, 04 Oct 2023 19:23:56 +0000
Date: Thu, 5 Oct 2023 03:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:xfs-atomic-write-v1 9/21] blk-merge.c:undefined
 reference to `__aeabi_ldivmod'
Message-ID: <202310050303.lTI9IG7v-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20231005/202310050303.lTI9IG7v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050303.lTI9IG7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050303.lTI9IG7v-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: block/blk-merge.o: in function `ll_back_merge_fn':
>> blk-merge.c:(.text+0xbf2): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: blk-merge.c:(.text+0xc0a): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o: in function `attempt_merge':
   blk-merge.c:(.text+0xe06): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: blk-merge.c:(.text+0xe20): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o: in function `bio_attempt_front_merge':
   blk-merge.c:(.text+0x10e6): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o:blk-merge.c:(.text+0x10fe): more undefined references to `__aeabi_ldivmod' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
