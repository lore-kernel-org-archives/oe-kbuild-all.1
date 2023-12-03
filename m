Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D364C139
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIeVLGS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701603741; x=1733139741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjatdcq/YDJCzs0+IFKQYa5LXh2dObZqbXdr3Z3PTnM=;
  b=UIeVLGS/7DTDwivCNEefpamjpgb2phzyiinKLPlzcDi1OCZ7M3/p4mx6
   GA6Pfto3VxKkFSeD2lFhADOH84hxgNdajiMgS09NcDVXEx8gOHy25avRn
   H9hF1XOoiLlaTvJ4xPEKOX8NSJF/qhG2+0t6DePkI7kK5NBZsKD+zAVDP
   RkALl9YveIQiexYKdl+Ih9lFrPHRBsS4gl4GJ0ru8cHYTwtTRVmiwGxir
   GKzO+gmhvJOqDTeXpU0snBNGtnBBihi2JHLw30yKO0oFCRiKaz7jBY9kM
   /8qgNZ9nakfyGp+hXW63X+cDDlTqelc1bKqmNvRhYSZuB88/7z7BZvqYG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="424805343"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="424805343"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 03:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914144297"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="914144297"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2023 03:42:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9krZ-0006bz-1E;
	Sun, 03 Dec 2023 11:42:17 +0000
Date: Sun, 3 Dec 2023 19:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: drivers/iio/dac/ad5755.c:786:34: warning: 'ad5755_of_match' defined
 but not used
Message-ID: <202312031846.QS2OB5i6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: c947459979c6c9c8aff9c9b5027b31dbf8055106 iio: ad5755: add support for dt bindings
date:   7 years ago
config: x86_64-randconfig-015-20231009 (https://download.01.org/0day-ci/archive/20231203/202312031846.QS2OB5i6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312031846.QS2OB5i6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312031846.QS2OB5i6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from drivers/iio/dac/ad5755.c:9:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:437:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     437 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/iio/dac/ad5755.c: At top level:
>> drivers/iio/dac/ad5755.c:786:34: warning: 'ad5755_of_match' defined but not used [-Wunused-const-variable=]
     786 | static const struct of_device_id ad5755_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/ad5755_of_match +786 drivers/iio/dac/ad5755.c

   785	
 > 786	static const struct of_device_id ad5755_of_match[] = {
   787		{ .compatible = "adi,ad5755" },
   788		{ .compatible = "adi,ad5755-1" },
   789		{ .compatible = "adi,ad5757" },
   790		{ .compatible = "adi,ad5735" },
   791		{ .compatible = "adi,ad5737" },
   792		{ }
   793	};
   794	MODULE_DEVICE_TABLE(of, ad5755_of_match);
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
