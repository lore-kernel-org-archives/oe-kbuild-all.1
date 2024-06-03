Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC3E23A6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717451193; cv=none; b=kYmmlF3N+hsQMSoP45zS/yUjLxCsElwtWZBuvAHatHZtyDTnlDyTz31Aj5zg6O3z+oDicWfErslrGa6WfHGdM5P1Gq0N0fHljed7anyC+a1KZHv8w6S8L1us5EuBNe0+BuVsneTnOWNC+fal08ibZZqcspz6jvIa3sZq4J1dGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717451193; c=relaxed/simple;
	bh=t8pa/PXK8rskoHtc29EUIQO9xEmDAR306gcf75dfygo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gmTtLGj5Yf+z4D/Q3iLkfavvNZGVDdLD87dBb1xX9wDtLywM2OJQ3YpSi5deNf9h6JTV9gWdJGYjhG4CtrhZ2d1upub3Hxdeh1aSTZeZ4w1Me7APn2ad6bNHb0qPqGrXUMrTUUcKq3sqp7/nB81xDoLEsvTcFNskubazg40vfvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR41Jak4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR41Jak4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717451191; x=1748987191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8pa/PXK8rskoHtc29EUIQO9xEmDAR306gcf75dfygo=;
  b=hR41Jak4CkGHSc3xKDCa4ZZO2A2DAUI2Ldh7//kNOXjVCsJvZAfb2s77
   +cUx7KzIjdjmVMJGKSxXyKEqWnsE5UwbpSnCPXPjmzGGvH92MHBDbVSKT
   nbW0ZWeP5nFZjiJMG87Aprx/Fy7pLirxRX+YCgggwqJmHBAQZ1/TXTbg2
   3i6KJ6vrhqZcQXpRwHVKSL5rgeVgMTnE/ZjpL2Ys8aVbseM3eAZepgGI5
   efA9m+8sWKgm+xMDRGOmwxz7Xm+EawCYZ4L8brQ+QE7hyeP/4GV2ott0u
   olOE5BElWxoEE4WVPRi7VsD1syOIyrbqiaITZlmQflk/R8p+9+gE5undr
   Q==;
X-CSE-ConnectionGUID: 672y/fWmQa2wJXv+m0f4Xw==
X-CSE-MsgGUID: nJGIsXmQS1iwwjqsCifaug==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13842682"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13842682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 14:46:31 -0700
X-CSE-ConnectionGUID: +kWlfWVjSUG3UkRhsfNibg==
X-CSE-MsgGUID: WtZVPdKvTJyWfipJAvdMtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37033600"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jun 2024 14:46:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEFUv-000ME2-06;
	Mon, 03 Jun 2024 21:46:15 +0000
Date: Tue, 4 Jun 2024 05:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 6/71] ERROR: modpost:
 "drm_connector_attach_content_protection_property"
 [drivers/gpu/drm/mediatek/mediatek-drm.ko] undefined!
Message-ID: <202406040537.HEdVMWmm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   69684fae77482607cfcf279fb80f99d971a86be0
commit: 5985699410444a25f09a714c1a0da5b5854dc50d [6/71] BACKPORT: FROMLIST: Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x feature for DisplayPort
config: arm-randconfig-002-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040537.HEdVMWmm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040537.HEdVMWmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040537.HEdVMWmm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/memory/emif.o: section mismatch in reference: emif_driver (section: .data) -> emif_remove (section: .exit.text)
>> ERROR: modpost: "drm_connector_attach_content_protection_property" [drivers/gpu/drm/mediatek/mediatek-drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
