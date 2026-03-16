Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78931E847
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646300; cv=none; b=SYewRqYlXd0jo1y3PpJwrIFqmJDaCnxWWwWk6e2W9h6o5mRjCdPdiccLhRghU1TMrK8B/tuLy7l6JTvrc6nDbTZN7ozqo3hqTqwdiNiId5fAxrH3iTBXu04dM8sESApWRhUCNBRd7SnrIUgE0oPFrogXyKhWbOPLOgWocnE1NMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646300; c=relaxed/simple;
	bh=VMVF2c7zhqFq9RRm5uYOPBRx/T1kWdvZz14Lf6fSRXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZKsKz0NNz5ubEBuk14jz1xxH1Atlv9wsguXi7jybZgFjH5pLmfs7SwIsrPEdzpogLkvOx0kjK5GiaBbUJdPNm7+L5mppSWJe+k2h9ZY2Gf+NKZVQJFEa9n3ZV7AwBPnT7RA4rjxotziYim7S9mhcKV/F+qmt39eGnfow05q9OAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRqdz/xH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRqdz/xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773646300; x=1805182300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMVF2c7zhqFq9RRm5uYOPBRx/T1kWdvZz14Lf6fSRXg=;
  b=LRqdz/xHofpUt+c0vpsVU1Mwn0S+AM3fCFPqXrrh30mo3LzLl0ClhXO3
   mYfLeEYO3sve/2PJkpQorFy3zei7QEhxiqdWyeYj1X5zdcXg3NRJwkzoA
   OZ4Jn+xumEFLomK4maFK4u8WCnMJ/Su6zLGfTHW/hPRXswK2CkVjQsaeD
   EyfJzxcHYjjCNbmYoY2N5LWyA9H6PdigAX8cSvn/akOrZgNvZPxSyUmXT
   o/aBqZA5cer5+3DPrpVczl4xRzBKht+KWA+0R7X3rYf02Xoxg9nzHRoL+
   L8K9J9G2gVQXKJA9MZ+1srAABDWHTbTNshchTzAny5snC33T4JS51yeQe
   Q==;
X-CSE-ConnectionGUID: /K/agu0LQxCDGrN9A1gaCg==
X-CSE-MsgGUID: rM4t2q4VQHa7iRdnCpPHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="86010417"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="86010417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 00:31:39 -0700
X-CSE-ConnectionGUID: sbYa2k/0R5GLyUKEic6bmg==
X-CSE-MsgGUID: 1il9eNn+TsWUlMD1kehZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="226292983"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Mar 2026 00:31:37 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w22QI-000000000IW-3UWF;
	Mon, 16 Mar 2026 07:31:34 +0000
Date: Mon, 16 Mar 2026 15:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jump-batch-n 76/79] include/linux/jump_label.h:363:13:
 error: 'static_key_apply_queued' defined but not used
Message-ID: <202603161557.P7vEt8hb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git jump-batch-n
head:   3eafae45451bbc9ea7f96beacc5a928bc3edd593
commit: 58a3d3a59bbfeaeaf50e1e57c3cfe09fab217e73 [76/79] dyndbg: use static-key queueing API in dynamic-debug (working)
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260316/202603161557.P7vEt8hb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161557.P7vEt8hb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161557.P7vEt8hb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/static_key.h:1,
                    from include/linux/tracepoint-defs.h:12,
                    from include/linux/sched.h:49,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/test_bitops.c:10:
>> include/linux/jump_label.h:363:13: error: 'static_key_apply_queued' defined but not used [-Werror=unused-function]
     363 | static void static_key_apply_queued(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/static_key_apply_queued +363 include/linux/jump_label.h

   362	
 > 363	static void static_key_apply_queued(void) {}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
