Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B85A49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 01:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689556118; x=1721092118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A8aYLqFO3rcZ0auEtILh/ovg3KBA2Gklo8PnT3orhuk=;
  b=nEPM9lrHrRSe5y/AVT3SFhz1KXSYYGgZaF3kdjyAG3lDQgS0oZZKSpWC
   S2cyH4gOs1voIgLl9RNIVqCvhLWdg6BNVv4SoVIoJzPZzMzuVAcP+4HL/
   WUKGti9Y9JYIbo9S5n4byl15r5AxgaiSWLtMZosTIh2g50mHwEzVZpuTg
   E/cY0ERlFmNLFR57sEu/WBXfbyI/9qwRl41V/SV8jVM1xazGq5SEOixHO
   aDAC5Xqtl8iSlpiaRP/X1hZTMXjbEZS0m1Z4/EGfl+XWcZqSewbPQL4jh
   3vfNplJXoCskNLglCUv++EJgZ9SU0ZCAQVG61TFfEFK5TniMsmJ/Ov2dT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365860171"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="365860171"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 18:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="847105814"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="847105814"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jul 2023 18:08:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLCj4-00095s-2O;
	Mon, 17 Jul 2023 01:08:34 +0000
Date: Mon, 17 Jul 2023 09:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 10/10] fs/read_write.c:848:9: sparse:
 sparse: symbol 'do_iter_write' was not declared. Should it be static?
Message-ID: <202307170923.4MiI7xuW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   249f6fc94a26bd48f4d0903e05fb15d9e77356e2
commit: 249f6fc94a26bd48f4d0903e05fb15d9e77356e2 [10/10] fs: move file_start_write() into vfs_iter_write()
config: um-randconfig-r093-20230716 (https://download.01.org/0day-ci/archive/20230717/202307170923.4MiI7xuW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170923.4MiI7xuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170923.4MiI7xuW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/read_write.c:848:9: sparse: sparse: symbol 'do_iter_write' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
