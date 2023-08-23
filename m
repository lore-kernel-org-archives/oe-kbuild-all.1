Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D03D8BF6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692778819; x=1724314819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkDSkZHHvgipZTbJLM94ATWxMYHed0RMEhbagOeGPcE=;
  b=ICjJUGSCU+4zhkDwL/ADXOv759LSM32qN6PcvRZN7bhc5JSoSLeP42fp
   Qu/WIwRa1qKB6QRG4EC8olmgk0zU/DdXFPp8TSeaasP7Rz9RtFl36Gv6W
   G7OCEUAlGewBSmFhYmDs0hp6ZBmbv7xt8D2QrygqeIqrKut25CAqw2txg
   +4ZJ3wU6E98yS00++S539PmnU5YQjuNxN5oEc5PqIEKnwkI81CXqmC2hI
   7seH96XHRy9bYFyQKbllyRUSSmbY6B86bMPj7C6G6yKrpKvqoHnRP+Kiq
   Bl842nARgOBlPzgrlTGPgf49du8dkm7OFY3jMZB1PynBB8E0D1ZPJXrCU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="376830386"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="376830386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 01:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="713489967"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="713489967"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Aug 2023 01:20:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYj69-00010C-1S;
	Wed, 23 Aug 2023 08:20:17 +0000
Date: Wed, 23 Aug 2023 16:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 17409/28543] htmldocs:
 Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc"
 directive:
Message-ID: <202308231646.4xqNquyX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WeiXiong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   a14f43f0b97d279d50029fba7442bb4cd393089d
commit: c0003a71672a751ec23d85451cbe43ff64609ab1 [17409/28543] UPSTREAM: Documentation: Add details for pstore/blk
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231646.4xqNquyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231646.4xqNquyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc" directive:
>> Documentation/admin-guide/pstore-blk.rst: WARNING: document isn't included in any toctree

vim +152 Documentation/admin-guide/pstore-blk.rst

   151	
 > 152	.. kernel-doc:: fs/pstore/blk.c
   153	   :identifiers: register_pstore_blk
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
