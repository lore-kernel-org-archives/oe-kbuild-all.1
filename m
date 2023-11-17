Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C654D26A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 18:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNHcMBsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700247238; x=1731783238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJn5CdGl/OgPmwK9byJdv1irrtaSO+ZUXsRV4cAyA6Q=;
  b=FNHcMBsB4JOghI5CDP9Eru45GfxsoxigvvOnMK/XiQkoT/HZ2b2MZ2jt
   xgu4cQuC4hiEI/O6r8kntqRrhGhNS5ktDbOjPdjAUhHY30IshRk/+SOSI
   AFsD/ZLEHkX1MKqqCIIaBep6TWcdcZHw6Snrn2JiJmZIt8YzeilQfEkLP
   3ryeqjVAaoBKKW8kFGlvWDlkdE+F66t+IeOu3oe6XK2U4fbjJVx+EsfZC
   jDRO//YM3oqO+YpkP4mhNGdOyyB9fnBUYqBFaw93UR0kmvzgfwiQSc+0d
   Orzk2saEInC3gQw0B/lFNzpK22QaB8+ybTdLqs1sJ0zjdNzGPY/TPBrUL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="381740663"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381740663"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 10:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="909503216"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="909503216"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2023 10:53:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r43yU-000339-0A;
	Fri, 17 Nov 2023 18:53:54 +0000
Date: Sat, 18 Nov 2023 02:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 879/898] base.c:undefined reference to
 `wmi_evaluate_method'
Message-ID: <202311180240.w7IngNSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d
commit: 556206e017f1aebd4b3637bf8b0e65606c0b1796 [879/898] drm/xe/display: Implement display support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311180240.w7IngNSe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180240.w7IngNSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180240.w7IngNSe-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `wmi_wmmx_mxmi':
>> base.c:(.text+0x7c): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `mxm_shadow_wmi':
>> base.c:(.text+0x1e0): undefined reference to `wmi_has_guid'
   loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `.L22':
   base.c:(.text+0x244): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/hwmon/asus_wmi_sensors.o: in function `asus_wmi_sensor_info':
>> asus_wmi_sensors.c:(.text+0xf4): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/hwmon/asus_wmi_sensors.o: in function `asus_wmi_probe':
   asus_wmi_sensors.c:(.text+0x688): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/hwmon/asus_wmi_sensors.o: in function `.L116':
   asus_wmi_sensors.c:(.text+0x6e8): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/hwmon/asus_wmi_sensors.o: in function `asus_wmi_hwmon_read':
   asus_wmi_sensors.c:(.text+0x904): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/hwmon/asus_wmi_sensors.o:asus_wmi_sensors.c:(.text+0x99c): more undefined references to `wmi_evaluate_method' follow
   loongarch64-linux-ld: drivers/hwmon/asus_wmi_sensors.o: in function `asus_sensors_wmi_driver_init':
>> asus_wmi_sensors.c:(.init.text+0x14): undefined reference to `__wmi_driver_register'
   loongarch64-linux-ld: drivers/hwmon/asus_wmi_sensors.o: in function `asus_sensors_wmi_driver_exit':
>> asus_wmi_sensors.c:(.exit.text+0x8): undefined reference to `wmi_driver_unregister'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `hp_wmi_devm_notify_remove':
>> hp-wmi-sensors.c:(.text+0x7c0): undefined reference to `wmi_remove_notify_handler'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `hp_wmi_notify':
>> hp-wmi-sensors.c:(.text+0xc08): undefined reference to `wmi_get_event_data'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `hp_wmi_update_info':
>> hp-wmi-sensors.c:(.text+0x10ac): undefined reference to `wmi_query_block'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `init_numeric_sensors':
>> hp-wmi-sensors.c:(.text+0x1f18): undefined reference to `wmi_instance_count'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `.L407':
   hp-wmi-sensors.c:(.text+0x1fbc): undefined reference to `wmi_query_block'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `init_platform_events.constprop.0':
   hp-wmi-sensors.c:(.text+0x22dc): undefined reference to `wmi_instance_count'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `.L467':
   hp-wmi-sensors.c:(.text+0x23a8): undefined reference to `wmi_query_block'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `hp_wmi_sensors_init':
>> hp-wmi-sensors.c:(.text+0x26f8): undefined reference to `wmi_install_notify_handler'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `.L488':
   hp-wmi-sensors.c:(.text+0x2740): undefined reference to `wmi_remove_notify_handler'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `hp_wmi_sensors_driver_init':
>> hp-wmi-sensors.c:(.init.text+0x14): undefined reference to `__wmi_driver_register'
   loongarch64-linux-ld: drivers/hwmon/hp-wmi-sensors.o: in function `hp_wmi_sensors_driver_exit':
>> hp-wmi-sensors.c:(.exit.text+0x8): undefined reference to `wmi_driver_unregister'
   loongarch64-linux-ld: drivers/platform/surface/surface3-wmi.o: in function `s3_wmi_send_lid_state':
>> surface3-wmi.c:(.text+0x260): undefined reference to `wmi_query_block'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_WMI
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
   Selected by [y]:
   - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m && MODULES [=y] || y && KUNIT [=y]=y) && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
