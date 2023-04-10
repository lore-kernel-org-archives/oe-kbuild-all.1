Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BC35246
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681155639; x=1712691639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X0n8nwcp+JLAyJ2/FOYRZx/siUCTym1dMMoEjvhXYw8=;
  b=eJYmyXqQO88FEQbBvBe8LLwTqbBtPZrLuVl7yOTxveeaVvOfObv09UF7
   xFtzhxBXpTGlcBzGJ2Woq4AR8NCJw7fUKwUD4GKSs4uqDflMK/FOOZo0c
   WKumBtuuUZb+CaCZ8JfBHNpOCYbKnxF79rf/oM2q0Y+8V+1B71UNXvIRs
   TvtPDLzfxrmJKnk7YI0Kv7rBAM3gN8/ZwvAcLW5It/fo9/MRfn1vEopq9
   8B/jGJhi1tozc4S08p1kN+uUGscv4FepZRskvmhfker7UxyteZkQ5BJw2
   8xc7jj19rVWKRlqw39kgSQb1l+m+DjVvdn/A2ib5VeYdNuIu4IMvVgBTX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="340926650"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="340926650"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 12:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="799605253"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="799605253"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2023 12:40:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plxNV-000Vd1-0r;
	Mon, 10 Apr 2023 19:40:37 +0000
Date: Tue, 11 Apr 2023 03:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testing 65/65]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2641:14: error: implicit
 declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'?
Message-ID: <202304110301.A3AHN43T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   4c3b188facb2011e9edcdaaf71f2f553e9c230df
commit: 4c3b188facb2011e9edcdaaf71f2f553e9c230df [65/65] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230411/202304110301.A3AHN43T-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=4c3b188facb2011e9edcdaaf71f2f553e9c230df
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout 4c3b188facb2011e9edcdaaf71f2f553e9c230df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110301.A3AHN43T-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c: In function 'lsm6dsx_get_acpi_mount_matrix':
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2641:14: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Werror=implicit-function-declaration]
    2641 |         if (!acpi_has_method(adev->handle, "ROTM"))
         |              ^~~~~~~~~~~~~~~
         |              acpi_has_watchdog
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2641:34: error: invalid use of undefined type 'struct acpi_device'
    2641 |         if (!acpi_has_method(adev->handle, "ROTM"))
         |                                  ^~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2644:43: error: invalid use of undefined type 'struct acpi_device'
    2644 |         status = acpi_evaluate_object(adev->handle, "ROTM", NULL, &buffer);
         |                                           ^~
   cc1: some warnings being treated as errors


vim +2641 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

  2627	
  2628	static bool lsm6dsx_get_acpi_mount_matrix(struct device *dev,
  2629						  struct iio_mount_matrix *orientation)
  2630	{
  2631		struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
  2632		struct acpi_device *adev = ACPI_COMPANION(dev);
  2633		union acpi_object *obj, *elements;
  2634		acpi_status status;
  2635		int i, j, val[3];
  2636		char *str;
  2637	
  2638		if (!has_acpi_companion(dev))
  2639			return -EINVAL;
  2640	
> 2641		if (!acpi_has_method(adev->handle, "ROTM"))
  2642			return -EINVAL;
  2643	
  2644		status = acpi_evaluate_object(adev->handle, "ROTM", NULL, &buffer);
  2645		if (ACPI_FAILURE(status)) {
  2646			dev_warn(dev, "Failed to get ACPI mount matrix: %d\n", status);
  2647			return -EINVAL;
  2648		}
  2649	
  2650		obj = buffer.pointer;
  2651		if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 3)
  2652			goto unknown_format;
  2653	
  2654		elements = obj->package.elements;
  2655		for (i = 0; i < 3; i++) {
  2656			if (elements[i].type != ACPI_TYPE_STRING)
  2657				goto unknown_format;
  2658	
  2659			str = elements[i].string.pointer;
  2660			if (sscanf(str, "%d %d %d", &val[0], &val[1], &val[2]) != 3)
  2661				goto unknown_format;
  2662	
  2663			for (j = 0; j < 3; j++) {
  2664				switch (val[j]) {
  2665				case -1: str = "-1"; break;
  2666				case 0:  str = "0";  break;
  2667				case 1:  str = "1";  break;
  2668				default: goto unknown_format;
  2669				}
  2670				orientation->rotation[i * 3 + j] = str;
  2671			}
  2672		}
  2673	
  2674		kfree(buffer.pointer);
  2675		return 0;
  2676	
  2677	unknown_format:
  2678		dev_warn(dev, "Unknown ACPI mount matrix format, ignoring\n");
  2679		kfree(buffer.pointer);
  2680		return -EINVAL;
  2681	}
  2682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
