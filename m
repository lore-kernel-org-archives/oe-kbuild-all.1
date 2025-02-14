Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0873C15573F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739563451; cv=none; b=l5L36hkNkP1Lf460Y9ORLJ6YcRiF7XUuz5iETtZj19JP1P9tbaT6oKwuBxFVLF+s5tEFLWGH+28u9FuvNTXYRGfGIyHzz+H1D7e5pZ2o9RwVer6IysoLT0/0kDhBqteq2kzP1u9+h/0nsjkguLGpCCs1SxM4x0ZnxDMHPNSZmEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739563451; c=relaxed/simple;
	bh=NFlifZutn+XmObz5eoUomJFmv4iBAG/OZ9H43+xVJFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuMHbwcLlrwzZH2G6kUk9/TWoUy42aKX7IcInpyxPnobQSa4HhTblIY+akgEWo+OBekcDT93ce/cRbKtBHdbEUPas10Epk/oCCc80BLiIW4nrnq3TLYd/O456bmhVvJl7sUSQIDFx0Rr9Xx+fn0H6C3ozxtTMkm5zlUtNKKOtk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ne63U/1S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ne63U/1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739563450; x=1771099450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NFlifZutn+XmObz5eoUomJFmv4iBAG/OZ9H43+xVJFI=;
  b=ne63U/1SNWGTq+1JW91Wt8XJkiSGIPlBokYU1mo5NYryjFm0tgis5o5m
   Jw45d5ywGHtwURDSA0WqlYJahHXfy7qm+HiKusoCPmxXs4kxJSc92KIZB
   xGd3ZnV9skL5nJHbNayBtAk/VdBwTyg1fKHZIM8PfkyKjKgBlfMHyNON0
   pUDEPPVVy50cJMq/1VZloDzN13airn9nXgw2RzRB4FSePmgWkqkR/+qfF
   0hX6C51Ep8F7xKOPmoIRamweAgs2/YA+IDkldRw792tI/Cp8ywSRADy7x
   wcgqs4dBb9yFovpTOtEEJELisBbIWgZsK7i5OJhF58l8bkvPYHXL4XFjI
   A==;
X-CSE-ConnectionGUID: gta98jzdRGeSk/ZiL7b5xA==
X-CSE-MsgGUID: le6GG6zzRri6nAIDA2ov2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50968974"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="50968974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 12:04:07 -0800
X-CSE-ConnectionGUID: Ch/8GF3bS8qcD9jiInzP6g==
X-CSE-MsgGUID: dMpgW+m2RHyFKUkx6WsYhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118471516"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 12:04:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj1uu-001A6l-0m;
	Fri, 14 Feb 2025 20:04:04 +0000
Date: Sat, 15 Feb 2025 04:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 1/1]
 drivers/remoteproc/mtk_vcp_rproc.c:80:18: warning:
 'vcp_reserve_mblock_remap' defined but not used
Message-ID: <202502150357.TtzlkN7z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6737b000ef8c138d01872003fa3b7fd0a39021f3
commit: 65b501d72807a421824c8b0da783b7f0c4f92d0c [1/1] CHROMIUM: remoteproc: vcp: add vcp kernel driver
config: arm64-randconfig-002-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150357.TtzlkN7z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150357.TtzlkN7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150357.TtzlkN7z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/mtk_vcp_rproc.c: In function 'vcp_reserve_memory_ioremap':
   drivers/remoteproc/mtk_vcp_rproc.c:891:16: warning: variable 'mblock_start_size' set but not used [-Wunused-but-set-variable]
     891 |         size_t mblock_start_size;
         |                ^~~~~~~~~~~~~~~~~
   drivers/remoteproc/mtk_vcp_rproc.c: At top level:
>> drivers/remoteproc/mtk_vcp_rproc.c:80:18: warning: 'vcp_reserve_mblock_remap' defined but not used [-Wunused-const-variable=]
      80 | static const int vcp_reserve_mblock_remap[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [m]:
   - MALI_MTK [=m] && HAS_IOMEM [=y] && ARM64 [=y] && !MALI [=n] && MALI [=n]!=m [=m] && MTK_GPU_SUPPORT [=y]


vim +/vcp_reserve_mblock_remap +80 drivers/remoteproc/mtk_vcp_rproc.c

    79	
  > 80	static const int vcp_reserve_mblock_remap[] = {
    81		VCP_RTOS_MEM_ID,
    82		VDEC_MEM_ID,
    83		VENC_MEM_ID,
    84		VCP_A_LOGGER_MEM_ID,
    85	};
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
