Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4341BC065
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252762; cv=none; b=t+HUXXDg6gYL4/KURXKB+Tc6vEUhy0ZGpE7bO1+MJjW5gxtUYdWjYXOUAniKejhbad5MNtokySzpO2t32A8vLL4/95ODJTaLav8QwuwK4hWDwR3+PkjUVw6UKwLE/zIQTcOt+b0gW3tqDqBOvybd5obiI54qsIYvREug2jo2jr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252762; c=relaxed/simple;
	bh=B//KgLE52j+t/ae+RBfTUK4Xn87kTyzs6RKzwMZ6ecc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWcNYVd5Lgc7KE67CMxXvo/RjkLFv8vrSufXUsR8rNRJKiod5YeBt+cYjzTv1xbDhrVlbrQ0CIjH4b2Nbx21KqqON8e/X7NmjoqVPXBkqzhS6eukDl9mfgnkTad8ObYCbGzQyTQ1ZqtEBVzEjrZe7VddcUcya23hfdQadpXWHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARLaabW5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARLaabW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738252760; x=1769788760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B//KgLE52j+t/ae+RBfTUK4Xn87kTyzs6RKzwMZ6ecc=;
  b=ARLaabW5hOSAaE97jAG791m9XIg9W8AZ90mdCuoOviSDORyufk+x/8ku
   5xsitR5oEZWO0f5ddHLyBwcESPJSQofafb0iapRasaXSMkzDJy2IgggKz
   scq5/FLDCqFHs4Sbl2T/1tO+8gZGaSGb9Fh4zNtMPT5QkTP8aLnFAa3C0
   g4fW7iXGEwU8QxPvaRyaLzKXlFili2Hi3mejVr17hbt5Hzt/P/fI9fWqM
   y4ND7Imqbx/EjsRKNN8Q3f1zVCgHx0RbJk0Gs+CbH6PADNIlZWO2lptdA
   bM2fMu9DaJmPUkxLcIU/Bes+OL1RakvwBPM88XMWhUQdfYnA+EbVY2gu+
   w==;
X-CSE-ConnectionGUID: xBtifiyuRLmgwzXiow3vJw==
X-CSE-MsgGUID: nfBFA3cmQlWCGOdRtn5Sjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42459380"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42459380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 07:59:19 -0800
X-CSE-ConnectionGUID: fM3bjX7ZSs26qQMMDwU+EQ==
X-CSE-MsgGUID: wpWLEtD9ReyniqxjJzqfJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113987967"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2025 07:59:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdWwm-000keP-0E;
	Thu, 30 Jan 2025 15:59:16 +0000
Date: Thu, 30 Jan 2025 23:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/9] kismet: WARNING: unmet direct
 dependencies detected for DEVFREQ_THERMAL when selected by MALI_MTK
Message-ID: <202501302329.BkiprYTT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   cb7dc2e67513ccaa6ab1fa84980411f98df1077d
commit: 20c6549501f674937409aba5411ee8c5c0ab133a [9/9] CHROMIUM: gpu/mediatek: Enable Kconfig and build target
config: arm64-kismet-CONFIG_DEVFREQ_THERMAL-CONFIG_MALI_MTK-0-0 (https://download.01.org/0day-ci/archive/20250130/202501302329.BkiprYTT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250130/202501302329.BkiprYTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501302329.BkiprYTT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL when selected by MALI_MTK
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
     Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
     Selected by [y]:
     - MALI_MTK [=y] && HAS_IOMEM [=y] && ARM64 [=y] && !MALI [=n] && MALI [=n]!=m [=m] && MTK_GPU_SUPPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
