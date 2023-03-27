Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE42596
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 23:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679959359; x=1711495359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9xG9M8LsbjSI+H//IKHZxC78kmTii1MyX5CYuaIlIQ=;
  b=ihBjd33Prkiv4KyB1cH02+XRDoxYk0qMrmMb4/u8Axh6T41i9UqBVgnq
   KnyrXlcEmlCIehS1Ape8aSKlVebvWJhvf8ZVPtpS3y9oosyPZUQAjhh/u
   EfuL7GpjKBIABibtaepM8DMBcuV5Qy7xPUrQPUTaAONen/y8qAuIT9hWu
   0o8+CiRo6IdySMxiIpx764cwZqUgIDa1+dZrd9yR+crNWCBTRYps2BQGF
   0gx5C+bZTAHuL82otTWPveKMoK1BWueORZShS+KSfOstwxL6L2canjDeX
   ZxZiufaZR8GZr6MIpwNgRryHvn3cObLv869ZkQDaOxif27ueW9L0oo/Lt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="340442518"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="340442518"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 16:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748176665"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="748176665"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Mar 2023 16:22:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgwAf-000I51-1O;
	Mon, 27 Mar 2023 23:22:37 +0000
Date: Tue, 28 Mar 2023 07:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:class_cleanup 83/87] drivers/base/core.c:3431:
 undefined reference to `block_class'
Message-ID: <202303280729.OPVdWwue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   768b1a193b9d918cd016e3eb38728680a463cdfa
commit: 1833557a6402e9aee2dee7ccaf8662996217e74a [83/87] driver core: clean up the logic to determine which /sys/dev/ directory to use
config: x86_64-randconfig-a002-20230327 (https://download.01.org/0day-ci/archive/20230328/202303280729.OPVdWwue-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=1833557a6402e9aee2dee7ccaf8662996217e74a
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core class_cleanup
        git checkout 1833557a6402e9aee2dee7ccaf8662996217e74a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280729.OPVdWwue-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/base/core.o: in function `device_to_dev_kobj':
>> drivers/base/core.c:3431: undefined reference to `block_class'
>> ld: drivers/base/core.c:3431: undefined reference to `block_class'


vim +3431 drivers/base/core.c

  3427	
  3428	/* select a /sys/dev/ directory for the device */
  3429	static struct kobject *device_to_dev_kobj(struct device *dev)
  3430	{
> 3431		if (dev->class == &block_class)
  3432			return sysfs_dev_block_kobj;
  3433		else
  3434			return sysfs_dev_char_kobj;
  3435	}
  3436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
