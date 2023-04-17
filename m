Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3772B8460
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681744158; x=1713280158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddIPBOINECCTr/nljvfr0git9+3TxIPl1o7/wmKu2lg=;
  b=Ze/yQgls8JDeTP7SRbkZSowMr/5glVzEfDEte0YyfjEByk/eCcBQ0RNa
   +JZ0ImC5ucqy/dL9sR9Q59DSv7VcDfWyCeUIPeZICng1d4nnLhWcADjzU
   P0N5nfMkyWFQvWfxWApiDlPRGd6wYvFDJz67mAYVGcV3n0r/udDFdLWtu
   9rVj5SxSZpb5Op9+mq4BIlaO9YnEd8jnI7YeZJ+VS4XgZOlj25t7QuXZg
   CA1cdxWZen/y4F+ppn/i20avdHHKFvlvudpCxTBXLVz4qN3MLeY83QGOb
   5265vJI0ADzjVvA7j0IOQ8I7gLUxiY/WN8mgWLSpMETQJ7qCUGMPVfew5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343668358"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="343668358"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 08:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834466170"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="834466170"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 08:08:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poQTL-000cWR-2N;
	Mon, 17 Apr 2023 15:08:51 +0000
Date: Mon, 17 Apr 2023 23:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testings 65/65]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2690:21: error: expected ';'
 before '}' token
Message-ID: <202304172343.aQwJiRlH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testings
head:   4c7e876ff00d0fc0501fd5811bd1328cfc5d8408
commit: 4c7e876ff00d0fc0501fd5811bd1328cfc5d8408 [65/65] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
config: arc-randconfig-r043-20230417 (https://download.01.org/0day-ci/archive/20230417/202304172343.aQwJiRlH-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=4c7e876ff00d0fc0501fd5811bd1328cfc5d8408
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testings
        git checkout 4c7e876ff00d0fc0501fd5811bd1328cfc5d8408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/iio/imu/st_lsm6dsx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304172343.aQwJiRlH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c: In function 'lsm6dsx_get_acpi_mount_matrix':
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2690:21: error: expected ';' before '}' token
    2690 |         return false
         |                     ^
         |                     ;
    2691 | }
         | ~                    


vim +2690 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

  2686	
  2687	static int lsm6dsx_get_acpi_mount_matrix(struct device *dev,
  2688						  struct iio_mount_matrix *orientation)
  2689	{
> 2690		return false
  2691	}
  2692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
