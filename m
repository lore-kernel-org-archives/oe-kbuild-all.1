Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E7C156C8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685959680; x=1717495680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=saZyDXa+Z7ShoeVDdUVJJDEQ/MSf+OX1gNgogHhLVJQ=;
  b=FjA/pujNg373VJUZQIxT/jo4Yd3I4doemWq4EQD97mOAs22CGFbBvB0f
   IC7UxcZIKy0RGt+oIksFrWSFAEYtWmSj2qR9ZK+8PxUep3ZA9AbKZxXla
   Q1K0lJfhJZ6fsw+LvyDEkT0NHugt92kiBKiQbJGIoYauqZJU0BBrTl7wK
   OiYCbrMz+0EBrvQs0CHP7h45HzTVoCvJ3TnrDxXXzgjzxP7G0BCAisPq0
   UIUkgbvcNP+ja756c1HqstxQjiA4BFsWk5ulmxynghOJHEE4FmcelYW/r
   IHACn6D13oIUHke7e8kiNLGroPDdXoHinXWOZx9x6sBGdR6P35jpfozso
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="335948340"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="335948340"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 03:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="832751256"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="832751256"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 03:07:58 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6782-00045e-0F;
	Mon, 05 Jun 2023 10:07:58 +0000
Date: Mon, 5 Jun 2023 18:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/060-spi 2/2] drivers/spi/spi-apple.c:536:3-8: No
 need to set .owner here. The core will do it.
Message-ID: <202306051820.3Jg7FFtj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/060-spi
head:   dfb0bd4a56714916a20a80a68042f02f208ab39a
commit: dfb0bd4a56714916a20a80a68042f02f208ab39a [2/2] spi: apple: Add driver for Apple SPI controller
config: parisc-randconfig-c043-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051820.3Jg7FFtj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051820.3Jg7FFtj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-apple.c:536:3-8: No need to set .owner here. The core will do it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
