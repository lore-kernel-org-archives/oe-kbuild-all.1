Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E81DF9D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692312583; x=1723848583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MeBBR3pYl0TIW2lL+cPc+R4O9aDDqapxcZP3Xf9jfWw=;
  b=MEFoSE9oPi3WjJW3Vqk9ndC9wJBv1CpEH+Lh4K9pA54EeBaqlx10zCyn
   +pMjFRrgnPKFWMit7OGt3eU9p/u0UQIVAyXrGTd9I4Mfpi+Gv4/XpSaqU
   VzasWxb1GJy67FnYqsTtgctP23uKdqnUah2XF5Vz2tXPguISyxkDOrg2E
   dLrXQKr87k6PwTc2mLnlS6PPYfzy8mZ+WjeLX60qoPc34NJhXkEPy5GNc
   qdWKFCpUAWD1gXcZjqIogt2ZSI/dMXmsi8FiBcS3swqXeMCBXa4Mjd+LU
   Z37mEV4ZWtQgxAfNpCe/w+WHhD1ESrvOizixA2kkNmM0Oyb4NvUaMl00x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403931294"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="403931294"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 15:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858411460"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="858411460"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 15:49:39 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWloB-0001XB-03;
	Thu, 17 Aug 2023 22:49:39 +0000
Date: Fri, 18 Aug 2023 06:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 125/9999] drivers/iio/accel/mma8452.c:186:
 warning: Function parameter or member 'name' not described in
 'mma_chip_info'
Message-ID: <202308180615.V29RRzEO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 011e841cd11b85d7f67997f3ed2f2abaad3b8bf7 [125/9999] iio: mma8452: Fix probe failing when an i2c_device_id is used
config: h8300-randconfig-r004-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180615.V29RRzEO-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180615.V29RRzEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180615.V29RRzEO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/mma8452.c:186: warning: Function parameter or member 'name' not described in 'mma_chip_info'


vim +186 drivers/iio/accel/mma8452.c

605f72de137ad9 Harinath Nampally 2017-09-09  165  
605f72de137ad9 Harinath Nampally 2017-09-09  166  /**
605f72de137ad9 Harinath Nampally 2017-09-09  167   * struct mma_chip_info - chip specific data
605f72de137ad9 Harinath Nampally 2017-09-09  168   * @chip_id:			WHO_AM_I register's value
605f72de137ad9 Harinath Nampally 2017-09-09  169   * @channels:			struct iio_chan_spec matching the device's
605f72de137ad9 Harinath Nampally 2017-09-09  170   *				capabilities
605f72de137ad9 Harinath Nampally 2017-09-09  171   * @num_channels:		number of channels
605f72de137ad9 Harinath Nampally 2017-09-09  172   * @mma_scales:			scale factors for converting register values
605f72de137ad9 Harinath Nampally 2017-09-09  173   *				to m/s^2; 3 modes: 2g, 4g, 8g; 2 integers
605f72de137ad9 Harinath Nampally 2017-09-09  174   *				per mode: m/s^2 and micro m/s^2
605f72de137ad9 Harinath Nampally 2017-09-09  175   * @all_events:			all events supported by this chip
605f72de137ad9 Harinath Nampally 2017-09-09  176   * @enabled_events:		event flags enabled and handled by this driver
605f72de137ad9 Harinath Nampally 2017-09-09  177   */
605f72de137ad9 Harinath Nampally 2017-09-09  178  struct mma_chip_info {
011e841cd11b85 Hans de Goede     2022-02-08  179  	const char *name;
605f72de137ad9 Harinath Nampally 2017-09-09  180  	u8 chip_id;
605f72de137ad9 Harinath Nampally 2017-09-09  181  	const struct iio_chan_spec *channels;
605f72de137ad9 Harinath Nampally 2017-09-09  182  	int num_channels;
605f72de137ad9 Harinath Nampally 2017-09-09  183  	const int mma_scales[3][2];
605f72de137ad9 Harinath Nampally 2017-09-09  184  	int all_events;
605f72de137ad9 Harinath Nampally 2017-09-09  185  	int enabled_events;
605f72de137ad9 Harinath Nampally 2017-09-09 @186  };
605f72de137ad9 Harinath Nampally 2017-09-09  187  

:::::: The code at line 186 was first introduced by commit
:::::: 605f72de137ad92a9c29ca1d3d1fead34685b1af iio: accel: mma8452: improvements to handle multiple events

:::::: TO: Harinath Nampally <harinath922@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
