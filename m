Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37E3B797
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696358712; x=1727894712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwOfJwps6tmfT/K1t1rL2+IvQbmX3wwBs7PBiQtufJM=;
  b=er2d4K9C8XQwCZhZJUT4jbgH1CFBhlrhN6nV0P9AOS8LtwRSpXnv0ovJ
   JZHvV7QURfqIVH/ZsQsh+0aVTTgCSNTJDbD5xfOVomt9KIGJo83Zutwo8
   gXGgNDj0OA5NiKT1Ha0YMmYG6YiwBJBerE3I2dAuKkPGI7dwN/tVC1EtZ
   w63HE4chkHMSp2usbRXe+oMzfqFNKk7SZ9/gqxMnXsIxVuptjbeentZqh
   +EBKKe4mJjcDvL+sVx4FeSmY2Dnj+2XZirfClCnNDtkVYv51DFqOeYH+K
   aBA7iju8D182YHOl2ns05KGFILyGbzsyXyyUtPQh+9tipFAKkPIrRjZt9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="381824195"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="381824195"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 11:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821358616"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="821358616"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 03 Oct 2023 11:45:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnkOK-0008P2-1G;
	Tue, 03 Oct 2023 18:45:08 +0000
Date: Wed, 4 Oct 2023 02:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-2e 33/37] lib/dynamic_debug.c:1408:6: sparse:
 sparse: symbol 'dd_store_range' was not declared. Should it be static?
Message-ID: <202310040202.FqBTQrWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-2e
head:   71a19a8b881bc14025717ba9993f8efcd5e6a44b
commit: 06791193d7c8556038615b81aa9eedd940625a92 [33/37] dyndbg: add site_*() macros to avoid using _ddebug.site
config: i386-randconfig-061-20231003 (https://download.01.org/0day-ci/archive/20231004/202310040202.FqBTQrWj-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040202.FqBTQrWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040202.FqBTQrWj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:1408:6: sparse: sparse: symbol 'dd_store_range' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
