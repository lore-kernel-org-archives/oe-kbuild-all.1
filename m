Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD2C127
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691145110; x=1722681110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zna/HkfDOp8xSQE/CLFKOqgUPn/+SyRc57l7VIldt6Y=;
  b=AYhe36ZQiPTOUIVDtC3fq7W0Gi890MXSiEbw3kjuu+0xififKqeljQQ6
   1PzZrGp4L/7VJ7faAfQNTx3RaGaH5xReYMs/GpKaC+ZvffSdPhUrPU0/0
   yo6wj4j3s/ox+Yx5F0iQSJ7gWotl+RZg3MW16rcJ0zTtValK3Xnz2S83U
   ZJClb7vQwb85gb/9xO5XHmHCGhjMcP+jCwZ47vwbyfIHDcS1Gjsaea+re
   yHHj5bIzkZbMY8WS3lZ6NU8oZLrIwRA4lV1QxaQKXt+fqIlhkHe+DjAbM
   XK/lAI1A3gb1AVcDxKeenwgN2BDDIUvnx9RGbJUqOljmKguLb07okD6EK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436444688"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="436444688"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 03:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="723612286"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="723612286"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Aug 2023 03:31:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRs5a-0002n9-2b;
	Fri, 04 Aug 2023 10:31:22 +0000
Date: Fri, 4 Aug 2023 18:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH RESEND v2 1/2] memcg: Add support for zram object
 charge
Message-ID: <202308041820.1EOqUwD0-lkp@intel.com>
References: <20230804075736.207995-1-hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804075736.207995-1-hezhongkun.hzk@bytedance.com>

Hi Zhongkun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/memcg-Add-support-for-zram-object-charge/20230804-155952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230804075736.207995-1-hezhongkun.hzk%40bytedance.com
patch subject: [RFC PATCH RESEND v2 1/2] memcg: Add support for zram object charge
config: sparc-randconfig-r011-20230731 (https://download.01.org/0day-ci/archive/20230804/202308041820.1EOqUwD0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041820.1EOqUwD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041820.1EOqUwD0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpf.h:31,
                    from include/linux/filter.h:9,
                    from arch/sparc/kernel/sys_sparc32.c:29:
>> include/linux/memcontrol.h:1886:5: error: no previous prototype for 'obj_cgroup_charge_zram' [-Werror=missing-prototypes]
    1886 | int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/memcontrol.h:1892:6: error: no previous prototype for 'obj_cgroup_uncharge_zram' [-Werror=missing-prototypes]
    1892 | void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/swap.h:9,
                    from include/linux/userfaultfd_k.h:18,
                    from include/linux/hugetlb.h:16,
                    from arch/sparc/mm/init_64.c:16:
>> include/linux/memcontrol.h:1886:5: error: no previous prototype for 'obj_cgroup_charge_zram' [-Werror=missing-prototypes]
    1886 | int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/memcontrol.h:1892:6: error: no previous prototype for 'obj_cgroup_uncharge_zram' [-Werror=missing-prototypes]
    1892 | void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/mm/init_64.c:2630:6: error: no previous prototype for 'vmemmap_free' [-Werror=missing-prototypes]
    2630 | void vmemmap_free(unsigned long start, unsigned long end,
         |      ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   sparc64-linux-ld: drivers/iio/common/st_sensors/st_sensors_buffer.o: in function `obj_cgroup_charge_zram':
>> st_sensors_buffer.c:(.text+0x12c): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/common/st_sensors/st_sensors_core.o:st_sensors_core.c:(.text+0x31c): first defined here
   sparc64-linux-ld: drivers/iio/common/st_sensors/st_sensors_buffer.o: in function `obj_cgroup_uncharge_zram':
>> st_sensors_buffer.c:(.text+0x140): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/common/st_sensors/st_sensors_core.o:st_sensors_core.c:(.text+0x330): first defined here
   sparc64-linux-ld: drivers/iio/common/st_sensors/st_sensors_trigger.o: in function `obj_cgroup_charge_zram':
   st_sensors_trigger.c:(.text+0x320): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/common/st_sensors/st_sensors_core.o:st_sensors_core.c:(.text+0x31c): first defined here
   sparc64-linux-ld: drivers/iio/common/st_sensors/st_sensors_trigger.o: in function `obj_cgroup_uncharge_zram':
   st_sensors_trigger.c:(.text+0x334): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/common/st_sensors/st_sensors_core.o:st_sensors_core.c:(.text+0x330): first defined here
--
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.o: in function `obj_cgroup_charge_zram':
>> inv_icm42600_gyro.c:(.text+0xaa0): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8a0): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.o: in function `obj_cgroup_uncharge_zram':
>> inv_icm42600_gyro.c:(.text+0xab4): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8b4): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_accel.o: in function `obj_cgroup_charge_zram':
   inv_icm42600_accel.c:(.text+0xab4): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8a0): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_accel.o: in function `obj_cgroup_uncharge_zram':
   inv_icm42600_accel.c:(.text+0xac8): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8b4): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_temp.o: in function `obj_cgroup_charge_zram':
   inv_icm42600_temp.c:(.text+0x0): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8a0): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_temp.o: in function `obj_cgroup_uncharge_zram':
   inv_icm42600_temp.c:(.text+0x14): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8b4): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.o: in function `obj_cgroup_charge_zram':
   inv_icm42600_buffer.c:(.text+0x254): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8a0): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.o: in function `obj_cgroup_uncharge_zram':
   inv_icm42600_buffer.c:(.text+0x268): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8b4): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.o: in function `obj_cgroup_charge_zram':
   inv_icm42600_timestamp.c:(.text+0x74): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8a0): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.o: in function `obj_cgroup_uncharge_zram':
   inv_icm42600_timestamp.c:(.text+0x88): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_icm42600/inv_icm42600_core.o:inv_icm42600_core.c:(.text+0x8b4): first defined here
--
   sparc64-linux-ld: drivers/iio/pressure/st_pressure_buffer.o: in function `obj_cgroup_charge_zram':
>> st_pressure_buffer.c:(.text+0x40): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/pressure/st_pressure_core.o:st_pressure_core.c:(.text+0x29c): first defined here
   sparc64-linux-ld: drivers/iio/pressure/st_pressure_buffer.o: in function `obj_cgroup_uncharge_zram':
>> st_pressure_buffer.c:(.text+0x54): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/pressure/st_pressure_core.o:st_pressure_core.c:(.text+0x2b0): first defined here
--
   sparc64-linux-ld: drivers/iio/pressure/bmp280-regmap.o: in function `obj_cgroup_charge_zram':
>> bmp280-regmap.c:(.text+0x1ac): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/pressure/bmp280-core.o:bmp280-core.c:(.text+0x22c8): first defined here
   sparc64-linux-ld: drivers/iio/pressure/bmp280-regmap.o: in function `obj_cgroup_uncharge_zram':
>> bmp280-regmap.c:(.text+0x1c0): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/pressure/bmp280-core.o:bmp280-core.c:(.text+0x22dc): first defined here
--
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_ring.o: in function `obj_cgroup_charge_zram':
>> inv_mpu_ring.c:(.text+0x0): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9d8): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_ring.o: in function `obj_cgroup_uncharge_zram':
>> inv_mpu_ring.c:(.text+0x14): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9ec): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.o: in function `obj_cgroup_charge_zram':
   inv_mpu_trigger.c:(.text+0xf8): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9d8): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.o: in function `obj_cgroup_uncharge_zram':
   inv_mpu_trigger.c:(.text+0x10c): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9ec): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_aux.o: in function `obj_cgroup_charge_zram':
   inv_mpu_aux.c:(.text+0xc4): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9d8): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_aux.o: in function `obj_cgroup_uncharge_zram':
   inv_mpu_aux.c:(.text+0xd8): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9ec): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_magn.o: in function `obj_cgroup_charge_zram':
   inv_mpu_magn.c:(.text+0x1c): multiple definition of `obj_cgroup_charge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9d8): first defined here
   sparc64-linux-ld: drivers/iio/imu/inv_mpu6050/inv_mpu_magn.o: in function `obj_cgroup_uncharge_zram':
   inv_mpu_magn.c:(.text+0x30): multiple definition of `obj_cgroup_uncharge_zram'; drivers/iio/imu/inv_mpu6050/inv_mpu_core.o:inv_mpu_core.c:(.text+0x9ec): first defined here
--
   sparc64-linux-ld: drivers/i2c/i2c-core-smbus.o: in function `obj_cgroup_charge_zram':
>> i2c-core-smbus.c:(.text+0x1954): multiple definition of `obj_cgroup_charge_zram'; drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x29c4): first defined here
   sparc64-linux-ld: drivers/i2c/i2c-core-smbus.o: in function `obj_cgroup_uncharge_zram':
>> i2c-core-smbus.c:(.text+0x1968): multiple definition of `obj_cgroup_uncharge_zram'; drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x29d8): first defined here
   sparc64-linux-ld: drivers/i2c/i2c-core-slave.o: in function `obj_cgroup_charge_zram':
   i2c-core-slave.c:(.text+0x4cc): multiple definition of `obj_cgroup_charge_zram'; drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x29c4): first defined here
   sparc64-linux-ld: drivers/i2c/i2c-core-slave.o: in function `obj_cgroup_uncharge_zram':
   i2c-core-slave.c:(.text+0x4e0): multiple definition of `obj_cgroup_uncharge_zram'; drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x29d8): first defined here
   sparc64-linux-ld: drivers/i2c/i2c-core-of.o: in function `obj_cgroup_charge_zram':
   i2c-core-of.c:(.text+0x344): multiple definition of `obj_cgroup_charge_zram'; drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x29c4): first defined here
   sparc64-linux-ld: drivers/i2c/i2c-core-of.o: in function `obj_cgroup_uncharge_zram':
   i2c-core-of.c:(.text+0x358): multiple definition of `obj_cgroup_uncharge_zram'; drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x29d8): first defined here
--
   sparc64-linux-ld: drivers/i2c/busses/i2c-designware-master.o: in function `obj_cgroup_charge_zram':
>> i2c-designware-master.c:(.text+0x154c): multiple definition of `obj_cgroup_charge_zram'; drivers/i2c/busses/i2c-designware-common.o:i2c-designware-common.c:(.text+0x304): first defined here
   sparc64-linux-ld: drivers/i2c/busses/i2c-designware-master.o: in function `obj_cgroup_uncharge_zram':
>> i2c-designware-master.c:(.text+0x1560): multiple definition of `obj_cgroup_uncharge_zram'; drivers/i2c/busses/i2c-designware-common.o:i2c-designware-common.c:(.text+0x318): first defined here
   sparc64-linux-ld: drivers/i2c/busses/i2c-designware-slave.o: in function `obj_cgroup_charge_zram':
   i2c-designware-slave.c:(.text+0x5ac): multiple definition of `obj_cgroup_charge_zram'; drivers/i2c/busses/i2c-designware-common.o:i2c-designware-common.c:(.text+0x304): first defined here
   sparc64-linux-ld: drivers/i2c/busses/i2c-designware-slave.o: in function `obj_cgroup_uncharge_zram':
   i2c-designware-slave.c:(.text+0x5c0): multiple definition of `obj_cgroup_uncharge_zram'; drivers/i2c/busses/i2c-designware-common.o:i2c-designware-common.c:(.text+0x318): first defined here
--
   sparc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o: in function `obj_cgroup_charge_zram':
>> drm_modeset_helper.c:(.text+0x2d8): multiple definition of `obj_cgroup_charge_zram'; drivers/gpu/drm/drm_encoder_slave.o:drm_encoder_slave.c:(.text+0x22c): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o: in function `obj_cgroup_uncharge_zram':
>> drm_modeset_helper.c:(.text+0x2ec): multiple definition of `obj_cgroup_uncharge_zram'; drivers/gpu/drm/drm_encoder_slave.o:drm_encoder_slave.c:(.text+0x240): first defined here
--
   sparc64-linux-ld: drivers/gpu/drm/drm_gem.o: in function `obj_cgroup_charge_zram':
>> drm_gem.c:(.text+0x16b8): multiple definition of `obj_cgroup_charge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fa8): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_gem.o: in function `obj_cgroup_uncharge_zram':
>> drm_gem.c:(.text+0x16cc): multiple definition of `obj_cgroup_uncharge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fbc): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_modes.o: in function `obj_cgroup_charge_zram':
   drm_modes.c:(.text+0x2ad4): multiple definition of `obj_cgroup_charge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fa8): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_modes.o: in function `obj_cgroup_uncharge_zram':
   drm_modes.c:(.text+0x2ae8): multiple definition of `obj_cgroup_uncharge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fbc): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_sysfs.o: in function `obj_cgroup_charge_zram':
   drm_sysfs.c:(.text+0x6a8): multiple definition of `obj_cgroup_charge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fa8): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_sysfs.o: in function `obj_cgroup_uncharge_zram':
   drm_sysfs.c:(.text+0x6bc): multiple definition of `obj_cgroup_uncharge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fbc): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_panel.o: in function `obj_cgroup_charge_zram':
   drm_panel.c:(.text+0x498): multiple definition of `obj_cgroup_charge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fa8): first defined here
   sparc64-linux-ld: drivers/gpu/drm/drm_panel.o: in function `obj_cgroup_uncharge_zram':
   drm_panel.c:(.text+0x4ac): multiple definition of `obj_cgroup_uncharge_zram'; drivers/gpu/drm/drm_edid.o:drm_edid.c:(.text+0x5fbc): first defined here
..


vim +/obj_cgroup_charge_zram +1886 include/linux/memcontrol.h

  1885	
> 1886	int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
  1887						size_t size)
  1888	{
  1889		return 0;
  1890	}
  1891	
> 1892	void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
  1893	{
  1894	}
  1895	#endif /* CONFIG_MEMCG_KMEM */
  1896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
