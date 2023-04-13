Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83256361
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681348832; x=1712884832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEl8O2w8wSALtrDCMNHAF1xiHfFbJgxVlZ7HZHm+CgA=;
  b=dCWjYWjj3FKgQVAX2KmKUovAiEIQzg8emGYkFKQjB95OuPs99XmdbLPL
   ahXcJmk/8P2MYgnSmgL+iWQsVwURYvn1ry3sBoWNSPLqcIOBL0N0pB3dC
   qB3YALvDS6PYQYlN0Ra5U6nXl7CQ3YFh7n45QJxib5mujP5H7v3cAetES
   RE3a++fAuGSKAn2A+oJbfqsyixo7xmdGkplG/d5hEB2Kp4GnmUAmmfkTK
   fM4fYyhv+uCkhX1pc+WaC5ek/fDNTKWYGTamihwJri0ihYJ2JquyXV7/I
   SEaE18urRTcEZaGmjKJZNnPgkoT3FJDNmGecIAJXtHo+wc6n1fGv4SuJy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342811276"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="342811276"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 18:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813195292"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="813195292"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 18:20:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmldV-000YDZ-2Z;
	Thu, 13 Apr 2023 01:20:29 +0000
Date: Thu, 13 Apr 2023 09:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testing 2/10]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2690:21: error: expected ';'
 before '}' token
Message-ID: <202304130917.JK9wknvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   32f442dba193b5682bd1e9784b0ea42893c6e966
commit: 7a8fe04fbdc0cbb4da0fb6a5779a5f3959dc64c7 [2/10] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
config: openrisc-randconfig-r003-20230409 (https://download.01.org/0day-ci/archive/20230413/202304130917.JK9wknvK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=7a8fe04fbdc0cbb4da0fb6a5779a5f3959dc64c7
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout 7a8fe04fbdc0cbb4da0fb6a5779a5f3959dc64c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/iio/imu/st_lsm6dsx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130917.JK9wknvK-lkp@intel.com/

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
