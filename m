Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEBD18C3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 23:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685574586; x=1717110586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XHfHa1yvPO4XfXDDJ6xZ/ZDXzF4hEJpuDkhjDS6Na2A=;
  b=McK78Vv6q3Kv4tCFOZNUyJshzRExiHHKI+eOb610uD2svzTLyo0HrADv
   lMtChMYw3MRQ7Qu6cojdJxZKPrL89RkPWniKgI1HaobZqbl+n0fHaxwdl
   ekMUWvn7172P2lV12Qk0lef42HD+dOPhC0eOuHZhszreD4DGW+xGlyXjz
   AWOj0Y39XMrnQxisly348mbGQYK2JDWNvhSPKHA8SiY+fbjMVM5YpZhcd
   cx25rwGngMUtYMjkUO8SOAvaTTvwK0ilhqgCC8N8HO9fMQ2Ouf6TNUvxe
   nGHT8N3VwUDzcHW1bvsipMB7Im97KeP04GhGJ5XiwKUlfjZCunW5fQPHE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418887661"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="418887661"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="701301002"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="701301002"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 May 2023 16:09:44 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Uwp-0001fv-2G;
	Wed, 31 May 2023 23:09:43 +0000
Date: Thu, 1 Jun 2023 07:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v1.1 11/15] arch/x86/mm/init.c:1134:2-3: Unneeded
 semicolon
Message-ID: <202306010734.zc0eDmAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v1.1
head:   ee9292c97c0c221b03b6a12402596b1829dd2bd0
commit: ee416086e3d885c91ac1e42b125c21ab59161f6a [11/15] x86/jitalloc: make memory allocated for code ROX
config: i386-randconfig-c001-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010734.zc0eDmAB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010734.zc0eDmAB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/mm/init.c:1134:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
