Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC917E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710551553; cv=none; b=L1OCWhIEUbUM0/07vnUCacVmJ2qhTAOokvyIYX8tIjyI05j2YMDXLFI9MM3CU5CROAqOZlMfRGeKskhKZvUsh8Szj5x9MxBUlVb8Q0CZiwZ+Rdk4GNdCQgOp1drkevn9mKNOybZuKaYzE1Hni4X9I37SMe+uoIgFWexRn8zqVqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710551553; c=relaxed/simple;
	bh=t7FM3ZHEVh6aVfL6zzgnViupilBEovUlw5mr4YI5Z6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRlUjo8V5qVuaOXDRnvZwgv85tXUejZwtl9bAjR9/Qimy+/xCFX9majjOKsa6IimrRoOGljtb78Qyl7eEGPNryGcX91KlhswCP9YscbCyBj8zZU2FYJcAcIdV6mQMArKXkfA9I+J/PuTs+X7IKJw+ItWoIh6g8NYdGhsP7NJlh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cD6HGWk4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cD6HGWk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710551549; x=1742087549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7FM3ZHEVh6aVfL6zzgnViupilBEovUlw5mr4YI5Z6A=;
  b=cD6HGWk4H+QllTAtfwlldy3AEFhsVroIil8R6NvrXyaGckKxOqC2Fmt/
   3jpE9rnunMOG9GJCTWAepaE8Aoaaw5oe/dSiF4S+59S4MTCsh5+4/tVgy
   9j5tUg481pX2J6LkFoqaUEdv94Hi2Z5wTPPwnNWs5CbacGj4d0yxvqj0R
   30krl44VKb/oNcVOtrDOI/a5kqzICkvoK/tMUNd8tqe8iFrxNQRXoK9Wx
   prjLC4xFMlfi/m0hv5w8TS8YrKtHEBJfCSmseF06sKjKRYT8CPYphJ/S+
   +yorYEpnxNlcnH1GI4B+W7czRRIEIkSCPYb6oNN3KV7NtnxD2TOuP2J9i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5649699"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5649699"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 18:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="50290709"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2024 18:12:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlIb2-000Ew9-2z;
	Sat, 16 Mar 2024 01:12:24 +0000
Date: Sat, 16 Mar 2024 09:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 12169/30000] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202403160929.oJCVtqpu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   43a5ead9254d686c58a74762bc6e25438b2f8dd0
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [12169/30000] ANDROID: Incremental fs: Add zstd compression support
config: i386-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20240316/202403160929.oJCVtqpu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240316/202403160929.oJCVtqpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160929.oJCVtqpu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - LG_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && ACPI_WMI [=y] && INPUT [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
