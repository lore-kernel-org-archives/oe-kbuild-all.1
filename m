Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9F28F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 19:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714246674; cv=none; b=E2i2doU/f6v7i05GdUZmiZTIPu3zwJC0tfYgpDgKnhBsq44amMciuV9B/dhDBKnW4Kl6DJNe/nxO0oP608lLUOGiU4Q2IbT7sD0RkjEVMSfzOTN6sekRuzLSJPB24dqhXFBwNa7BCnKkcgo1B2ZmeQhV2d48MkI7ZG9G4E2kIhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714246674; c=relaxed/simple;
	bh=sStTVzZoTFHbd/ls6SX/4Kmr4TgoXVjxlBJWMkYQI38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGS4uvlLYlSMsL4zmdQ7Ro3t6aX5L3Dj5V9HWvqis8UZTu/yVaFfZeHPgI9ABnz2rAwHNb/6d/amiW8Y53ShQ6pYdxMglPenyc7bwGyldV/N8/06r9W/v2031+P29G05w8VyMA27U2GgffVtK1Kv1MBeT2/UcKWYpIp8+N87bQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVLS8Rl3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVLS8Rl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714246672; x=1745782672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sStTVzZoTFHbd/ls6SX/4Kmr4TgoXVjxlBJWMkYQI38=;
  b=cVLS8Rl33TXEYc8/vhKFPo0gtzOyt3C6hEzwpl9zyIm9tdOSNIIOmcoe
   PZFh8U4gjiWDUtxJsgVmHVLKfKCOuH4Q95ZEaJhHQCMONQ1deflatMYwb
   458+EM6YYK1233Lu7+uME8EUJ/tXN8hYhs1hK/5rNxbuK9PCTwpvscn3T
   sdsiJ8pispTUPOZqxgLYMkmNKf2/X4A3eQU0CBaBSiWU47m3TK+gSPyeL
   GGhaDeVpkcZxNUsAEioMQi04YyGr0pToujJwo6igpzLUzg1ZZ2oZBUwU4
   9wpBh8f1yQ1ykTdZ4/Ma3/2nl8j8LSJRqEXNk6wpL0l6FLaQjsjk4/O3z
   g==;
X-CSE-ConnectionGUID: 2aUyTlKsRpyA/7FwKoXr5A==
X-CSE-MsgGUID: esAZ0u6nSrCr9Amki9/Sxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35348351"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="35348351"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 12:37:51 -0700
X-CSE-ConnectionGUID: 0VwDU/9qSB2bxdxvGXELBQ==
X-CSE-MsgGUID: AIRQhQl4QiSITCSi0MIaAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30535707"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2024 12:37:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0nrn-0005Qw-2G;
	Sat, 27 Apr 2024 19:37:47 +0000
Date: Sun, 28 Apr 2024 03:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 136/153]
 drivers/usb/typec/ucsi/cros_ec_ucsi.c:127:24: sparse: sparse: symbol
 'cros_ucsi_ops' was not declared. Should it be static?
Message-ID: <202404280306.To66RR4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   7ec7b4b9d284b739801688bc0d8d02ead80edc06
commit: c4305a040e64e8f28aef41db921b3de50d62e902 [136/153] CHROMIUM: usb: typec: Implement UCSI driver for ChromeOS
config: x86_64-randconfig-122-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280306.To66RR4B-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280306.To66RR4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280306.To66RR4B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:127:24: sparse: sparse: symbol 'cros_ucsi_ops' was not declared. Should it be static?
   drivers/usb/typec/ucsi/cros_ec_ucsi.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/cros_ucsi_ops +127 drivers/usb/typec/ucsi/cros_ec_ucsi.c

   126	
 > 127	struct ucsi_operations cros_ucsi_ops = {
   128		.read = cros_ucsi_read,
   129		.async_write = cros_ucsi_async_write,
   130		.sync_write = cros_ucsi_sync_write,
   131	};
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
