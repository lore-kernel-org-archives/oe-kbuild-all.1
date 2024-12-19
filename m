Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494C226164
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734614895; cv=none; b=hxNwYdO5qmrtAYNFv9/R8QpodjgBhNqUS8JZhvufs9rljKUNINavVIRtB5N4DwCyFtPoDnVtKdOyVaduLxrDJ0VINZ3EHF77HSO6YdPyb+7zc/20+FCDIyGXULAQ8V6+n++Ac+3gZWfoErOqRk6gWQq25ids9xsvmmFu2gXMJZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734614895; c=relaxed/simple;
	bh=chkT6FHZMN+UxmECpYWrJ/Hptf+3JZss1kcOTCUq+yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otxPsAH3Ss7liqSTNxgsp4fzI5X9/XGh3GkhD6Ik9IC7T7vwt74cyjk4zdSxO6PEE3cweG2JFWscEzuZr/Bm1tUiXeUwKfuMapeR2TqX122kayWH4iyMejbT8DnCQ1OxRXEnQDZW9H0TDGVEi/sO+/eXGdeXZA6TFe3GTitKTEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNZQY/S0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNZQY/S0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734614894; x=1766150894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chkT6FHZMN+UxmECpYWrJ/Hptf+3JZss1kcOTCUq+yc=;
  b=KNZQY/S0Om6ks+NGP6f0u3UEL2ZQnUT1DpRUMYjErr4VuYEEbOb9z1ve
   Klwxsucbc+bvkCbahODHl2p+IV589u2Hs1P8eAllv5/tHSxRw8d3iRFgV
   I925/JBKAEq+xQHaO9twlW9k2cEbOQXs0317aboevtCL4L+LNDAtw8If6
   gKf785hxLcjlIUD0cjji8d5jXbHE77URH7f9CiPT0H5wY8z3r4l5dwUqh
   UELKZSbvA81yabQIuP2PCoZmGaipNnOZWBbOpZL9/gjBYgTijBBUJkbd+
   NUYpVbHiUIeRaTDTPeZg4teeWJ0G21vZi+q+ME8uGjqgILG2y/XZG+rzs
   A==;
X-CSE-ConnectionGUID: lcIgi3hqRVSDgX/jjE1oig==
X-CSE-MsgGUID: XlV61cnfQ+C941PKoAJkIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38902189"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="38902189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 05:28:13 -0800
X-CSE-ConnectionGUID: 3DaEQdPDQjyPAEgGjXmLfw==
X-CSE-MsgGUID: lEL39qgVQLS5cLVkQ4uy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121461385"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Dec 2024 05:28:12 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOGZW-0000GC-0Y;
	Thu, 19 Dec 2024 13:28:10 +0000
Date: Thu, 19 Dec 2024 21:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1336/1336]
 drivers/staging/gmjstcm/tcm_tis_spi.c:817:36: warning:
 'tcm_tis_spi_acpi_match' defined but not used
Message-ID: <202412192143.ddGXn3L0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   dda59452adcd5503512e4d25631db28a50f38fd0
commit: 5ebbfc8c29eb5eb6dfdab853bdb2a622e0533d7e [1336/1336] staging: TCM: add GMJS(Nationz Tech) TCM driver.
config: arm64-randconfig-003-20241219 (https://download.01.org/0day-ci/archive/20241219/202412192143.ddGXn3L0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412192143.ddGXn3L0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412192143.ddGXn3L0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/staging/gmjstcm/tcm_tis_spi.c:109:5: warning: no previous prototype for 'tcm_tis_spi_transfer' [-Wmissing-prototypes]
     109 | int tcm_tis_spi_transfer(struct device *dev, u32 addr, u16 len,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'recv_data':
   drivers/staging/gmjstcm/tcm_tis_spi.c:423:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     423 |         int ret;
         |             ^~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: At top level:
>> drivers/staging/gmjstcm/tcm_tis_spi.c:817:36: warning: 'tcm_tis_spi_acpi_match' defined but not used [-Wunused-const-variable=]
     817 | static const struct acpi_device_id tcm_tis_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'cleanup_tis':
   drivers/staging/gmjstcm/tcm_tis_spi.c:249:17: warning: 'inten' may be used uninitialized [-Wmaybe-uninitialized]
     249 |                 tcm_tis_writel(chip->dev, TCM_INT_ENABLE(chip->vendor.locality),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                                 ~TCM_GLOBAL_INT_ENABLE & inten);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c:237:13: note: 'inten' was declared here
     237 |         u32 inten;
         |             ^~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'tcm_tis_init':
   drivers/staging/gmjstcm/tcm_tis_spi.c:264:21: warning: 'vendor' may be used uninitialized [-Wmaybe-uninitialized]
     264 |         if ((vendor & 0xffff) != 0x19f5 && (vendor & 0xffff) != 0x1B4E)
         |             ~~~~~~~~^~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c:260:13: note: 'vendor' was declared here
     260 |         u32 vendor, intfcaps;
         |             ^~~~~~
--
   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: fs/ext4/super.o: in function `ext4_handle_error':
   super.c:(.text+0x1472c): undefined reference to `__alloc_skb'
>> super.c:(.text+0x1472c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__alloc_skb'
>> aarch64-linux-ld: super.c:(.text+0x14794): undefined reference to `__nlmsg_put'
>> super.c:(.text+0x14794): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__nlmsg_put'
>> aarch64-linux-ld: super.c:(.text+0x14878): undefined reference to `netlink_broadcast'
>> super.c:(.text+0x14878): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netlink_broadcast'
>> aarch64-linux-ld: super.c:(.text+0x149cc): undefined reference to `kfree_skb'
>> super.c:(.text+0x149cc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `kfree_skb'
   aarch64-linux-ld: fs/ext4/super.o: in function `ext4_init_fs':
   super.c:(.init.text+0x52e4): undefined reference to `init_net'
>> super.c:(.init.text+0x52e4): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `init_net'
>> aarch64-linux-ld: super.c:(.init.text+0x52ec): undefined reference to `init_net'
>> aarch64-linux-ld: super.c:(.init.text+0x52f4): undefined reference to `__netlink_kernel_create'
>> super.c:(.init.text+0x52f4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__netlink_kernel_create'
   aarch64-linux-ld: fs/ext4/super.o: in function `ext4_exit_fs':
   super.c:(.exit.text+0x7c): undefined reference to `netlink_kernel_release'
>> super.c:(.exit.text+0x7c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netlink_kernel_release'


vim +/tcm_tis_spi_acpi_match +817 drivers/staging/gmjstcm/tcm_tis_spi.c

   816	
 > 817	static const struct acpi_device_id tcm_tis_spi_acpi_match[] = {
   818		{"TCMS0001", 0},
   819		{"SMO0768", 0},
   820		{"ZIC0601", 0},
   821		{}
   822	};
   823	MODULE_DEVICE_TABLE(acpi, tcm_tis_spi_acpi_match);
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
