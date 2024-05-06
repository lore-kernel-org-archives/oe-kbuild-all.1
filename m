Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A800044C81
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715006974; cv=none; b=fTl9Cp9AL1wJXVOMcMKcdIvUnc1JBmrsy5+TITZMJE0j5+Jsg2Y4ezJbBvs/GQtKSo4xnLAFdNRln3Jimm1HRL6xq47g3W31H9NUb6XNqzPt9lft7Tbma4/Qb7hpZKxbHdCNy57EB9eh24+tXg96j+PpJ3OgConyO2CjXq/Htrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715006974; c=relaxed/simple;
	bh=BAiCFrevSjOE5a2H/3oZQaP3RID9ahdOZSlFDvMf83k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARYSgO6SaVyCgoC9SAPkmN0pA3AJuw7+e4HhkEb4gr4jRSEepriCKxFSmit4Z3leeTKMPdRUiarxk4m3b/mFqydd5bPbSKA4k0KX3uO1hG1CgGjqOSyWpN/wA7oI2gq6xUt7hBL9Y03/Pe8XHGAPvvt0PPiqGWiTP8T3+8feyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wiv9Yz75; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wiv9Yz75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715006972; x=1746542972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BAiCFrevSjOE5a2H/3oZQaP3RID9ahdOZSlFDvMf83k=;
  b=Wiv9Yz752V3NFEoFtLzSOzVynzIMzWEBOwN7FNIqF+p0IPLLNsMz40nU
   BK4Dp58O2y63OBrMDuxOxjKPHS5gfQ91sLLL3RMQFoBUzjYuhh83VWd+A
   Kl9rDMtFw/R8qWnhUnOKn8jKf8xg1DudRbSrt3i6mxS8RjZjQNAdGW4ti
   1EQEo9QSr67lXbc5EcMUElJvCVERUnLvkUXE0mnZwRWAd9aADqaLcCAVR
   IbyhN46mJpcV6BCVLFc7hCt0wc3e/o7FPW2HeLGSYoWQUqKCYqrLZkyd9
   rGpSEdJKRgJHatYnvvsbhfhiBcYFQqUqpT57weI2yEjrbxnhICiwiK9xE
   A==;
X-CSE-ConnectionGUID: AqYpt++oTHWWONTvQkbnvw==
X-CSE-MsgGUID: lnj+R3skToyoXfQ1S0CCmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10606601"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="10606601"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:49:31 -0700
X-CSE-ConnectionGUID: phPUcO0/RS+ncU3owlXzIQ==
X-CSE-MsgGUID: 7PgnOPDBS9OSMerzA2VCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28276614"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2024 07:49:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3zeg-0000jL-2v;
	Mon, 06 May 2024 14:49:26 +0000
Date: Mon, 6 May 2024 22:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6110/30000]
 drivers/media/platform/mxc/output/mxc_vout.c:295:12: error: implicit
 declaration of function 'get_fs'
Message-ID: <202405062253.jQpVm2ZG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6110/30000] Merge branch 'mxc/next' into next
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405062253.jQpVm2ZG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405062253.jQpVm2ZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405062253.jQpVm2ZG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mxc/capture/ov5640.c:25:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:13:
   In file included from include/linux/memblock.h:13:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mxc/capture/ov5640.c:33:
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:281:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_fmtdesc *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     281 | V4L2_INT_WRAPPER_1(enum_fmt_cap, struct v4l2_fmtdesc, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:282:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     282 | V4L2_INT_WRAPPER_1(g_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:283:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     283 | V4L2_INT_WRAPPER_1(s_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:284:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     284 | V4L2_INT_WRAPPER_1(try_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:285:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_queryctrl *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     285 | V4L2_INT_WRAPPER_1(queryctrl, struct v4l2_queryctrl, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:286:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     286 | V4L2_INT_WRAPPER_1(g_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:287:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     287 | V4L2_INT_WRAPPER_1(s_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:288:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_cropcap *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     288 | V4L2_INT_WRAPPER_1(cropcap, struct v4l2_cropcap, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:289:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     289 | V4L2_INT_WRAPPER_1(g_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:290:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     290 | V4L2_INT_WRAPPER_1(s_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:291:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     291 | V4L2_INT_WRAPPER_1(g_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:292:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     292 | V4L2_INT_WRAPPER_1(s_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:293:1: warning: cast from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' (aka 'int (*)(struct v4l2_int_device *, unsigned long long *)') to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     293 | V4L2_INT_WRAPPER_1(querystd, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:294:1: warning: cast from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' (aka 'int (*)(struct v4l2_int_device *, unsigned long long *)') to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     294 | V4L2_INT_WRAPPER_1(s_std, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:298:1: warning: cast from 'int (*)(struct v4l2_int_device *, enum v4l2_power)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     298 | V4L2_INT_WRAPPER_1(s_power, enum v4l2_power, /*dummy arg*/);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:299:1: warning: cast from 'int (*)(struct v4l2_int_device *, void *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     299 | V4L2_INT_WRAPPER_1(g_priv, void, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:300:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_ifparm *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     300 | V4L2_INT_WRAPPER_1(g_ifparm, struct v4l2_ifparm, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:301:1: warning: cast from 'int (*)(struct v4l2_int_device *, void *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     301 | V4L2_INT_WRAPPER_1(g_needs_reset, void, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:302:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_frmsizeenum *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     302 | V4L2_INT_WRAPPER_1(enum_framesizes, struct v4l2_frmsizeenum, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:303:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_frmivalenum *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     303 | V4L2_INT_WRAPPER_1(enum_frameintervals, struct v4l2_frmivalenum, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:307:1: warning: cast from 'int (*)(struct v4l2_int_device *, int *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     307 | V4L2_INT_WRAPPER_1(g_chip_ident, int, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mxc/capture/ov5640.c:34:
   drivers/media/platform/mxc/capture/mxc_v4l2_capture.h:28:10: fatal error: 'linux/pxp_dma.h' file not found
      28 | #include <linux/pxp_dma.h>
         |          ^~~~~~~~~~~~~~~~~
   26 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mxc/capture/v4l2-int-device.c:19:
   In file included from drivers/media/platform/mxc/capture/v4l2-int-device.h:30:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:13:
   In file included from include/linux/memblock.h:13:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mxc/capture/v4l2-int-device.c:19:
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:281:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_fmtdesc *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     281 | V4L2_INT_WRAPPER_1(enum_fmt_cap, struct v4l2_fmtdesc, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:282:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     282 | V4L2_INT_WRAPPER_1(g_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:283:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     283 | V4L2_INT_WRAPPER_1(s_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:284:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     284 | V4L2_INT_WRAPPER_1(try_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:285:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_queryctrl *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     285 | V4L2_INT_WRAPPER_1(queryctrl, struct v4l2_queryctrl, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:286:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     286 | V4L2_INT_WRAPPER_1(g_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:287:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     287 | V4L2_INT_WRAPPER_1(s_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:288:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_cropcap *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     288 | V4L2_INT_WRAPPER_1(cropcap, struct v4l2_cropcap, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:289:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     289 | V4L2_INT_WRAPPER_1(g_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:290:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     290 | V4L2_INT_WRAPPER_1(s_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:291:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     291 | V4L2_INT_WRAPPER_1(g_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:292:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     292 | V4L2_INT_WRAPPER_1(s_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:293:1: warning: cast from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' (aka 'int (*)(struct v4l2_int_device *, unsigned long long *)') to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     293 | V4L2_INT_WRAPPER_1(querystd, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:294:1: warning: cast from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' (aka 'int (*)(struct v4l2_int_device *, unsigned long long *)') to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     294 | V4L2_INT_WRAPPER_1(s_std, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:298:1: warning: cast from 'int (*)(struct v4l2_int_device *, enum v4l2_power)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     298 | V4L2_INT_WRAPPER_1(s_power, enum v4l2_power, /*dummy arg*/);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:299:1: warning: cast from 'int (*)(struct v4l2_int_device *, void *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     299 | V4L2_INT_WRAPPER_1(g_priv, void, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:300:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_ifparm *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     300 | V4L2_INT_WRAPPER_1(g_ifparm, struct v4l2_ifparm, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:301:1: warning: cast from 'int (*)(struct v4l2_int_device *, void *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     301 | V4L2_INT_WRAPPER_1(g_needs_reset, void, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:302:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_frmsizeenum *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     302 | V4L2_INT_WRAPPER_1(enum_framesizes, struct v4l2_frmsizeenum, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:303:1: warning: cast from 'int (*)(struct v4l2_int_device *, struct v4l2_frmivalenum *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     303 | V4L2_INT_WRAPPER_1(enum_frameintervals, struct v4l2_frmivalenum, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:307:1: warning: cast from 'int (*)(struct v4l2_int_device *, int *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     307 | V4L2_INT_WRAPPER_1(g_chip_ident, int, *);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:15: note: expanded from macro 'V4L2_INT_WRAPPER_1'
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.c:148:7: warning: cast from 'int (*)(struct v4l2_int_device *, void *)' to 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') converts to incompatible function type [-Wcast-function-type-strict]
     148 |                            (v4l2_int_ioctl_func *)no_such_ioctl_1))(d, arg);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/v4l2-int-device.c:146:10: warning: cast from 'v4l2_int_ioctl_func *' (aka 'int (*)(struct v4l2_int_device *)') to 'v4l2_int_ioctl_func_1 *' (aka 'int (*)(struct v4l2_int_device *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
     146 |         return ((v4l2_int_ioctl_func_1 *)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
     147 |                 find_ioctl(d->u.slave, cmd,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     148 |                            (v4l2_int_ioctl_func *)no_such_ioctl_1))(d, arg);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   28 warnings generated.
..


vim +/get_fs +295 drivers/media/platform/mxc/output/mxc_vout.c

a6257e45730bd7 Liu Ying 2019-09-29  288  
a6257e45730bd7 Liu Ying 2019-09-29  289  static ipu_channel_t get_ipu_channel(struct fb_info *fbi)
a6257e45730bd7 Liu Ying 2019-09-29  290  {
a6257e45730bd7 Liu Ying 2019-09-29  291  	ipu_channel_t ipu_ch = CHAN_NONE;
a6257e45730bd7 Liu Ying 2019-09-29  292  	mm_segment_t old_fs;
a6257e45730bd7 Liu Ying 2019-09-29  293  
a6257e45730bd7 Liu Ying 2019-09-29  294  	if (fbi->fbops->fb_ioctl) {
a6257e45730bd7 Liu Ying 2019-09-29 @295  		old_fs = get_fs();
a6257e45730bd7 Liu Ying 2019-09-29 @296  		set_fs(KERNEL_DS);
a6257e45730bd7 Liu Ying 2019-09-29  297  		fbi->fbops->fb_ioctl(fbi, MXCFB_GET_FB_IPU_CHAN,
a6257e45730bd7 Liu Ying 2019-09-29  298  				(unsigned long)&ipu_ch);
a6257e45730bd7 Liu Ying 2019-09-29  299  		set_fs(old_fs);
a6257e45730bd7 Liu Ying 2019-09-29  300  	}
a6257e45730bd7 Liu Ying 2019-09-29  301  
a6257e45730bd7 Liu Ying 2019-09-29  302  	return ipu_ch;
a6257e45730bd7 Liu Ying 2019-09-29  303  }
a6257e45730bd7 Liu Ying 2019-09-29  304  

:::::: The code at line 295 was first introduced by commit
:::::: a6257e45730bd71f39bcdbb91be7812caf34febe media: platform: mxc: output: Forward IPUv3 V4L2 output driver from imx_4.19.y

:::::: TO: Liu Ying <victor.liu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
