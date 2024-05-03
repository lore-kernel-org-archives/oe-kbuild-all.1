Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3806A003
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714712178; cv=none; b=iLBY42IeDtw3hIWBwR1+4oVQpQv7ZyPl7M5QmnZC2DsZf4n7oessTA4Pa4RuguO+4OVoicqFh7z+Hr4ZteWAQDEmrNhSyfLiUUFNBuglac1vnfzqbu++nmv5zKcS0oE4RaDgdo91Scv6o+L7E/EpzFNCFIc/ayCMjWJ+Rf0W35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714712178; c=relaxed/simple;
	bh=8GR3X63jE5dpqZYNeTHWY1FV+ERjR1KjLk0z46kUK2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hc8AmfJ/mlS1yJT+ItFg/zFZLspOCUz3QuoE2r6e+qfedQSrfQJcGLXqFRPRGjylgJBXCtZKEtCWvqlzuQ7tFBnbAUJn5qS1W78uRpa5QNgX0+mz00lN82/UrGgn3nv/9T3FfaUEvHS/NWQpkV2U3j9nkIi8f8/WVdHMdWobNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=env+NEEx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="env+NEEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714712176; x=1746248176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8GR3X63jE5dpqZYNeTHWY1FV+ERjR1KjLk0z46kUK2E=;
  b=env+NEExr7s73RLJh1EUo5YNmAB8Xw/uKJNfMsGrHtL6D0LXRQlixaFv
   fAv+z5U9eSydXvFzWjIG1VlbQ518s2qdy4xa2wBnAhk6ZyPGM4Xv3dC0e
   ovSbiWi9Km0ZnBfyuQM55jPX6OvxVI/NHL9XAakQybiuGeXLVLNk+OMMG
   ozXmahoJvCzTcZmIpiegtEpFZ5peENg+WvkGw9irqyDwnfQ+2drPfLJ/s
   R5wPi+n5MjGy1Jojc/PrwrHXZJSLl5iOQJ4FLqNUxhVIIX692TeagSud/
   J6l6O/g24n7iyXtSNOBhWrOGZiC74piWpDLgOvJTxlPnnzNRLwTMmZqpq
   g==;
X-CSE-ConnectionGUID: KPD8b1kQQgalE0BRIjkL4A==
X-CSE-MsgGUID: 4SODO2w1TSGwxzkxTQhLng==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21924394"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21924394"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 21:56:15 -0700
X-CSE-ConnectionGUID: KZgcaaXIRlq4TFvIUnrAgw==
X-CSE-MsgGUID: GWeCrSz5QVGMzIJhqFafXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27860211"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 May 2024 21:56:15 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2kxw-000BK5-0v;
	Fri, 03 May 2024 04:56:12 +0000
Date: Fri, 3 May 2024 12:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dongsheng Yang <dongsheng.yang@easystack.cn>
Cc: oe-kbuild-all@lists.linux.dev, Coly Li <colyli@suse.de>
Subject: [colyli-bcache:for-next 3/3] drivers/md/bcache/bcache.h:892:22:
 warning: 'ca' is used uninitialized
Message-ID: <202405031253.UuepkGiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git for-next
head:   f7093093e7a41cc15a90a97581d77d4c4af54cc5
commit: f7093093e7a41cc15a90a97581d77d4c4af54cc5 [3/3] bcache: allow allocator to invalidate bucket in gc
config: i386-randconfig-141-20240503 (https://download.01.org/0day-ci/archive/20240503/202405031253.UuepkGiC-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031253.UuepkGiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031253.UuepkGiC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/bcache/btree.c:24:
   drivers/md/bcache/btree.c: In function 'bch_btree_gc_finish':
>> drivers/md/bcache/bcache.h:892:22: warning: 'ca' is used uninitialized [-Wuninitialized]
     892 |         for (b = (ca)->buckets + (ca)->sb.first_bucket;                 \
         |                  ~~~~^~~~~~~~~
   drivers/md/bcache/btree.c:1774:9: note: in expansion of macro 'for_each_bucket'
    1774 |         for_each_bucket(b, ca)
         |         ^~~~~~~~~~~~~~~
   drivers/md/bcache/btree.c:1764:23: note: 'ca' was declared here
    1764 |         struct cache *ca;
         |                       ^~


vim +/ca +892 drivers/md/bcache/bcache.h

cafe563591446c Kent Overstreet 2013-03-23  890  
cafe563591446c Kent Overstreet 2013-03-23  891  #define for_each_bucket(b, ca)						\
cafe563591446c Kent Overstreet 2013-03-23 @892  	for (b = (ca)->buckets + (ca)->sb.first_bucket;			\
cafe563591446c Kent Overstreet 2013-03-23  893  	     b < (ca)->buckets + (ca)->sb.nbuckets; b++)
cafe563591446c Kent Overstreet 2013-03-23  894  

:::::: The code at line 892 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
