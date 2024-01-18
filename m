Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BFB185D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 01:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705541129; cv=none; b=ihzeajLuQWC+8hQJwFNdjHFkPU50gsNILLWbiW/I8duB0aN4fSOhm/Gey5MrAB4KCodVR8b0ppRRcwydtIENRd2MJ35LmCBo2uUptFLTC+VTU0hnO8kiCYUV9T0hlXtaPhIX+1yd8fc1eQMom4ufU4H1WfVMKEPVTxqXbCdETJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705541129; c=relaxed/simple;
	bh=nLEzLbS1uq9jCuJbz7dbpx3NUWm5Y6ynPybiP9p6Sa8=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=XJakIvDKGZiyOv+0HHwT0+sIx4ZNiRGyVRdg5qtCj5sd5P7y55V/e4W5IVKD/OBabxjeSLNqNXNR8wDtfYA3bngPlCzaeP1mjzFZbvy2feE5XQPBGUiqLH1P9AdlhT2kQXnGrTV6v7+vXKeQaYSPv9TdT89Pk9nGJW/E2B+kcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhwYiKd/; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhwYiKd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705541128; x=1737077128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLEzLbS1uq9jCuJbz7dbpx3NUWm5Y6ynPybiP9p6Sa8=;
  b=XhwYiKd/tGjQ2RQyVC1uAswTbPEP2+r687dGXODFR/hpBmu1DKfm271a
   k/Dk5o+dL6JkLgZLzRIw0zgdRbZZP+5tBqrn4xw1tTux39Fb5/cNYVbAC
   i2h6joP+T2e1IA6l0SoErJ/j8O0rxyTeBsvGL5MGv30kBp66ZrkjjW9Cm
   T2piGV1X3yiFOq2ONNoQoDfWi8SRb7iDTIVNmkpnAVngdgl27TJm84xfn
   qPWNdyWWkYyruxdh9tekJoM2VWfgCpQn20rQmnT99u/EMSu7sSGoHC5dg
   0TOWusdxPXv0dJ/5XL8MZ2XaTZ2U9IhtZRCO7fwEAO0aRG8+4xe/MTmfG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="486469697"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="486469697"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 17:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031501853"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="1031501853"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jan 2024 17:25:23 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQH9l-0002UA-2F;
	Thu, 18 Jan 2024 01:25:21 +0000
Date: Thu, 18 Jan 2024 09:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 7/25]
 drivers/gpu/drm/evdi/evdi_connector.c:54:6: sparse: sparse: symbol
 'is_lowest_frequency_mode_of_given_resolution' was not declared. Should it
 be static?
Message-ID: <202401180928.9XMQqg8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   49eebf8fceb9d327dc6099f875b36ddd96605c39
commit: 350ced6ff13d0f43fb3ee0de43f7d3eae197bda2 [7/25] CHROMIUM: drm/evdi: Fix 2k monitor is not supported regression
config: i386-randconfig-061-20240118 (https://download.01.org/0day-ci/archive/20240118/202401180928.9XMQqg8f-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180928.9XMQqg8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180928.9XMQqg8f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/evdi/evdi_connector.c:54:6: sparse: sparse: symbol 'is_lowest_frequency_mode_of_given_resolution' was not declared. Should it be static?

vim +/is_lowest_frequency_mode_of_given_resolution +54 drivers/gpu/drm/evdi/evdi_connector.c

    53	
  > 54	bool is_lowest_frequency_mode_of_given_resolution(
    55		struct drm_connector *connector, struct drm_display_mode *mode)
    56	{
    57		struct drm_display_mode *modeptr;
    58	
    59		list_for_each_entry(modeptr, &(connector->modes), head) {
    60			if (modeptr->hdisplay == mode->hdisplay &&
    61				modeptr->vdisplay == mode->vdisplay &&
    62				drm_mode_vrefresh(modeptr) < drm_mode_vrefresh(mode)) {
    63				return false;
    64			}
    65		}
    66		return true;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
