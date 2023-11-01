Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1FF7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 05:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXofZyTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698816380; x=1730352380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ceRVbsW0m4wbAWWrkctU1TzuAplrn60bEa8LfjpOG0=;
  b=ZXofZyTbBsvNgLrjnojH3mdv8PRJdQvswmsjjLMbjvudsqyOrnYMik1u
   7xCUuCz54GDUQQTdjBmJdl0ndMiMkQ35Scg7RrT5NiRAYDWSOglMSuRNA
   jqH85Oa5UQZuOQltbaQkvoVv9V7bMNEb67KlliAkgYdxioyeUsFLqtaw4
   vArkisWsmWZgAiYfL6q1ItqMQEm32yc7qQftmSPZmHLnE3r2Eq3KtR19P
   zrrojgZEQ5pag1ifQ3R91UKPo4qvpMdmWTt5+mWR51p/fqfAi0eYJLz3k
   ofeL8btmhcXo++0m/4gxzEj8tBGFjnHLH/Dw4ozgGToqHXNu84HGseNg8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388257370"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="388257370"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 22:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="754376847"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="754376847"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Oct 2023 22:26:17 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy3k7-0000cq-2K;
	Wed, 01 Nov 2023 05:26:15 +0000
Date: Wed, 1 Nov 2023 13:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 20/48] buffered-io.c:undefined reference to
 `__udivdi3'
Message-ID: <202311011313.ixlRbPxy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   c4f7071632b671933d29f8b9cdb202a6c1c43dd4
commit: 0bebbff604f9f794dd835c776c496036426b4cd3 [20/48] iomap: add the concept of a merge boundary to the writeback code
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311011313.ixlRbPxy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011313.ixlRbPxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011313.ixlRbPxy-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/iomap/buffered-io.o: in function `iomap_ioend_try_merge':
>> buffered-io.c:(.text+0x110): undefined reference to `__udivdi3'
   sh4-linux-ld: fs/iomap/buffered-io.o: in function `iomap_writepage_map':
   buffered-io.c:(.text+0x3c70): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
