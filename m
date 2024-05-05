Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E76D1AB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714925260; cv=none; b=kCgKp+74RUlcAKcHfcy2i6KP2+lWUcseuIY084ue4w6NsG3y3aawH9XAH/G7tT3fiFnEBtmtgwr87uH3lTfwEXWS7MLMI6yfLgzWjKpnbpPUcYmto3Mpa+BhXa1fAah4xURzXcwtrfEObdO9SSogiSZX4Afk9GiQOk0EybKcJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714925260; c=relaxed/simple;
	bh=hCoBH/tZnyRd+be98rL6smCJhx93FZbMHOkwAFmdIh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivrdZrn0wsg/GT3v4BgFPsXhS3qnI9tMyTcX6w9kt0DHicLyM5ujiP+Tp1RcMoycpSXZXCR6eA88bXb7kByQUjWIqSo/R3KsVmkXtoFafi4Ja3kccvnQRkYA+P/4h6AY5AVdDWlx0ZLTUM+gFFskI9Eiu+RRZds+wr6VBmUZoRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb+UkYx+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb+UkYx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714925259; x=1746461259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCoBH/tZnyRd+be98rL6smCJhx93FZbMHOkwAFmdIh0=;
  b=Yb+UkYx+TcfqoYwolpyxPxu1TkGa0qAYMMLn6x7How2uQqltH4eo3nUh
   z24xZA8Lmm6jsFWVZSvVQRNUfn2u7LUT8VgmEWmM8LSxkN2mdLCUQYVYF
   wET1lz+n3pIMiLjeDmRufcqs+7SYz1NabxxbqAm3WK4QV/c/RxNxOoFWS
   U47yBZpdFPaR9kDLVmSO8ASNoKEP0wd6n0Ny0wHqwOZXElkQ4MEzBcpD4
   oZvKIbEpQWy2NcZ51CcRPhpffd9hNtDmCmBCNrty9WW7gErQZaVd4hUTo
   uUNyq5wc68c3tUxT4rUio/wS+Vz6XkOjNhsXcex7iS3L1Akk0askHZnoG
   Q==;
X-CSE-ConnectionGUID: gMOQ05xJS5GooQVptoHX8g==
X-CSE-MsgGUID: 12CrfXrdQceOh0yMjhSvEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21351752"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="21351752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 09:07:36 -0700
X-CSE-ConnectionGUID: sl2O+qA/Thu4dp0sDmczIA==
X-CSE-MsgGUID: R3K/5KDiTqyi5yLnmd3E3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32741634"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2024 09:07:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3eOi-00002A-1y;
	Sun, 05 May 2024 16:07:32 +0000
Date: Mon, 6 May 2024 00:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3220/30000]
 drivers/input/touchscreen/vtl/vtl_ts.c:126:undefined reference to
 `i2c_transfer'
Message-ID: <202405052358.q0f4Qe2U-lkp@intel.com>
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
commit: 5fd1a9756fe0090bd795889b135e4dfb78141f0a [3220/30000] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: x86_64-randconfig-076-20240505 (https://download.01.org/0day-ci/archive/20240505/202405052358.q0f4Qe2U-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052358.q0f4Qe2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405052358.q0f4Qe2U-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `vtl_read_xy_data':
>> drivers/input/touchscreen/vtl/vtl_ts.c:126:(.text+0x778): undefined reference to `i2c_transfer'
   ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `ct36x_test_tp':
   drivers/input/touchscreen/vtl/vtl_ts.c:376:(.text+0x9b3): undefined reference to `i2c_transfer'
   ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `vtl_ts_driver_init':
>> drivers/input/touchscreen/vtl/vtl_ts.c:492:(.init.text+0x14): undefined reference to `i2c_register_driver'
   ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `vtl_ts_driver_exit':
>> drivers/input/touchscreen/vtl/vtl_ts.c:492:(.exit.text+0xd): undefined reference to `i2c_del_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +126 drivers/input/touchscreen/vtl/vtl_ts.c

   113	
   114	static union ts_xy_data *vtl_read_xy_data(struct ts_info *ts)
   115	{
   116		struct i2c_msg msgs;
   117		int err;
   118	
   119		DEBUG();
   120	
   121		msgs.addr = ts->driver->client->addr;
   122		msgs.flags = 0x01;
   123		msgs.len = sizeof(ts->xy_data.buf);
   124		msgs.buf = ts->xy_data.buf;
   125	
 > 126		err = i2c_transfer(ts->driver->client->adapter, &msgs, 1);
   127		if (err != 1) {
   128			pr_err("___%s:i2c read err___\n", __func__);
   129			return NULL;
   130		}
   131		return &ts->xy_data;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
