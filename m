Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD02D605
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707365970; cv=none; b=QyY7Jg3AndTGhZAVA2moJDObIMGEyCp5oKWLt4xoG5y+hJvpenFm0xNlxK/+QrQqHdtfc64xN+ypwH1QhpEpmng+Qw8MuctV7lI0aQtDlNTBjWU3D6ZXIW6Y9MKZgQUdnyliX6Xr1yTSZWDuUBNCItMrpVeFe9smb2oCSoLIcjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707365970; c=relaxed/simple;
	bh=vOfMDji0MFFZv0a0k3lBwXU2D8gIOi6egKLjiJ9G00o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ktmaz0vH9S7GsfQa2l/HrjL1TuCky9BW2kfxiknZhf0LrL1RRLBNuVP2xaV1+vVDQzawPflkvNYE2cqLmHPbZbNc+fPyIylIEhLKh3sKvgBk8w0u1uxhYJRS9U2e9W2blOwozRbKO50yfURI2XgnARWAU9fd+GxJ8d/+CAtjIEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJyKHm5D; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJyKHm5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707365969; x=1738901969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vOfMDji0MFFZv0a0k3lBwXU2D8gIOi6egKLjiJ9G00o=;
  b=LJyKHm5D2A65TVzepz3WPq8/3f2R1LQ+CFLFiPlhEcojQpiDuwzBuzuD
   tS/upGMJaWlvc/02PyPRuinaTp1X4afhrtoffZUqqqfzhK84l/7g1KUb/
   Dr+q7Sr917A+lgqtxD3HDrEWpHO31L6f9EpHJAu8NLuqoAb4v62HKR9PA
   PMN5GgJTV6BAuYW1fgEN4T3cBl0Nhand2B1zGEwjkO+8Ng9eX6Mh+RxSm
   OvIqoTsulbWkBCGNxf1h9lR3HFqLVKVGJ56mOFnaSMDzlOvSjbikslG2b
   CkFd8h9JHIDHAynUPb9tToIDijuiK5IL4TE7/i7XIVhFp4IpTDnZdaLIt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1289477"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1289477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 20:19:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="32350545"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2024 20:19:27 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXvsi-0003Lm-0V;
	Thu, 08 Feb 2024 04:19:24 +0000
Date: Thu, 8 Feb 2024 12:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.8.y 50/50]
 drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning:
 'st7701s_ids' defined but not used
Message-ID: <202402081200.ntB2HodH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: f3b6698ac10e7f6528408bda7d8d162065a44af1 [50/50] drm/panel: Add driver for ST7701s DPI LCD panel
config: csky-randconfig-r081-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081200.ntB2HodH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081200.ntB2HodH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081200.ntB2HodH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning: 'st7701s_ids' defined but not used [-Wunused-const-variable=]
     426 | static const struct spi_device_id st7701s_ids[] = {
         |                                   ^~~~~~~~~~~


vim +/st7701s_ids +426 drivers/gpu/drm/panel/panel-sitronix-st7701s.c

   425	
 > 426	static const struct spi_device_id st7701s_ids[] = {
   427		{ "st7701s" },
   428		{ }
   429	};
   430	MODULE_DEVICE_TABLE(spi, st7701s_ids);
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
