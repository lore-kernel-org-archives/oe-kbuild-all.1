Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8C1481A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JB7IQrBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703709229; x=1735245229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ovh30ZXwNcsFuce+5puOcebD4P8dDNdV9zFx3ta3/o=;
  b=JB7IQrBsrgKVWLuk3V5dUbP8kXZR1LBT8TDnhWy199/4C3zylxzMpRhu
   D5vL3SSbF8T4kDCz0T5IJ2pptQ7RWN9mq4bTX66AhtGBQ1iX/xZvDIgh2
   TXQPDk2W/f/85c2TiYc9bcIBvy6SFNDxBzmRIGfDcPevl/HOt4BwZpIt3
   nGef5S99mOq5/1nxArvR6n2zQl20aV+LetW1pCFbpVnoaZVYgMRfWEisv
   QyAg2BZcZasKR17dg/VB5qFY/IOArnqW/ZEAf/oy6QWHM+XZfM/UFKf3L
   sJ2S0imYX+ErMRmYT4TYYU3ZNSQUP+3ASPtqtVkh+6yF9vj3r/cKZifgK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="386911306"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="386911306"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 12:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="896999462"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="896999462"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 27 Dec 2023 12:33:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIaat-000Fk5-16;
	Wed, 27 Dec 2023 20:33:35 +0000
Date: Thu, 28 Dec 2023 04:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: [linux-next:master 9812/10295] fscache.c:undefined reference to
 `__fscache_unuse_cookie'
Message-ID: <202312280428.aGomMXxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 942d0e589ffc07f949efc2bfbda02db748e063b6 [9812/10295] netfs, fscache: Combine fscache with netfs
config: x86_64-buildonly-randconfig-002-20231009 (https://download.01.org/0day-ci/archive/20231228/202312280428.aGomMXxf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280428.aGomMXxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280428.aGomMXxf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/erofs/fscache.o: in function `erofs_fscache_relinquish_cookie':
>> fscache.c:(.text+0x28): undefined reference to `__fscache_unuse_cookie'
>> ld: fscache.c:(.text+0x3f): undefined reference to `__fscache_relinquish_cookie'
   ld: fs/erofs/fscache.o: in function `erofs_fscache_register_volume':
>> fscache.c:(.text+0xee): undefined reference to `__fscache_acquire_volume'
   ld: fs/erofs/fscache.o: in function `erofs_fscache_acquire_cookie':
>> fscache.c:(.text+0x287): undefined reference to `__fscache_acquire_cookie'
>> ld: fscache.c:(.text+0x29e): undefined reference to `__fscache_use_cookie'
>> ld: fscache.c:(.text+0x416): undefined reference to `__fscache_unuse_cookie'
   ld: fscache.c:(.text+0x427): undefined reference to `__fscache_relinquish_cookie'
   ld: fs/erofs/fscache.o: in function `erofs_fscache_domain_put':
>> fscache.c:(.text+0xafa): undefined reference to `__fscache_relinquish_volume'
   ld: fs/erofs/fscache.o: in function `erofs_fscache_read_folios_async':
>> fscache.c:(.text+0xc9a): undefined reference to `__fscache_begin_read_operation'
   ld: fs/erofs/fscache.o: in function `erofs_fscache_unregister_fs':
   fscache.c:(.text+0x2512): undefined reference to `__fscache_relinquish_volume'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
