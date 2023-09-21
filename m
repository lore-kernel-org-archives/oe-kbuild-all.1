Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A723D90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695281058; x=1726817058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rbouvc54V811LMrNGLG/uyLQr9hzO9qEsZRatwpvPhE=;
  b=BIoOBFn1K/R+SsPrOCFtGNSbgBrs0Ztm6koRlasxER2p/SXeoVdS2u7e
   Q+awcbdDU/Mg41EtG0RDJHKtFwxnFhPJa/Hh9YMTNzDH9gd0fZuiR2zF3
   WC9nhPFKkVTZzvjepv1t6LyZSUqjIYQZw6oOEr+ayuAk+GwWAA9e3oBL2
   Bo1eOHbjzAvEorX6dMs06aOiegCJek2fAbEckRKyktZTd4WX3lzzJIcyW
   JGuFJthjQXhQuHodaqeT8blhT8y1Os+mDM24h//unwPeovbJNkfQsZI7B
   2k+1EpFuByvwkWP737jc7qVic2x9qj3dqBQZmEYTz64m6SxeYepVqZShk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379326116"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="379326116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 00:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862340949"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="862340949"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2023 00:18:13 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjDww-0009gw-1I;
	Thu, 21 Sep 2023 07:18:10 +0000
Date: Thu, 21 Sep 2023 15:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-unionfs@vger.kernel.org
Subject: [mszeredi-vfs:statmount-v2 2/3] fs/namespace.c:4681:17: sparse:
 sparse: symbol 'lookup_mnt_in_ns' was not declared. Should it be static?
Message-ID: <202309211554.PYeIATsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git statmount-v2
head:   9b5ff63d2b9b94298e6c9fbac4df9e77e6901fc9
commit: 43d6746354fa23a231946542c476e14f483c44c5 [2/3] add statmount(2) syscall
config: i386-randconfig-062-20230921 (https://download.01.org/0day-ci/archive/20230921/202309211554.PYeIATsU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211554.PYeIATsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211554.PYeIATsU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/namespace.c:4681:17: sparse: sparse: symbol 'lookup_mnt_in_ns' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
