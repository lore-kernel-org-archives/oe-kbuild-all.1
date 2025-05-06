Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024BA19F489
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525374; cv=none; b=CfjiI4467FB2M3gnOjJydAEEb3mTKjbShEnEZlebkeMBHjGxsThAnsk9vayvAmSp/gZY7+kTKd1lckfGJcxS7GSaUIoCl7sQNy+ro8/l4/oVweKGXpdXpF11K/ivAlUXqmA9pS5ExvE1qJq04rlE1wThKsG9bvmAuj++MIVWScY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525374; c=relaxed/simple;
	bh=NWFUDog49FSRuWOmBDEOSohFnHptOy7oweaUp+RWyvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUtwMTxQ8tbRyQneguXCjG7NYYkRktB0VpMlcfxFradCHcgf2KnsCwdubeceBI3pj9TP0x8pyOdCzthRClQOGGdAvTDv44tGLZgbl60LLsPQz4B+/MzUnJY04NkYsCr5xk+9Iz0OUUHoQg/4RU5S4dmyxqMLx9lMKK2g4xJKoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPHniwen; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPHniwen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746525372; x=1778061372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NWFUDog49FSRuWOmBDEOSohFnHptOy7oweaUp+RWyvg=;
  b=XPHniwenDAmNzoNV+uahOPw4+JPt2ATpVYHBxS+3HC5f/ukk7gJtR04o
   Z17XXN6wFetG0U3hWHrqnc4972X8Eh6uFtYG4f5sEnM2SBsUj8utnUWfM
   WPeLMBPmBp5Sg89K1Axu+Hd9lt2DMeFaIo9ai4IRG8KHGCsNN27LqfPto
   8HhtpK4NHdzCyZYzo8a+zeMeBLW/X9qfo+DZdFLWK9TafgZkKf4NEw/UY
   sJ1ZhYMbpbjtu62HkcEUQZYLp9WeTDViN2WltYbgk+GtNXrCRs4hFT/GD
   Y5A/sYtqrwxkMAG4US4sKN+pfPoWJoS/xKCN/QD4yrNvdk/FUX6yO3Hr6
   Q==;
X-CSE-ConnectionGUID: F7NIIzNCS6qGSEIdcsc0sQ==
X-CSE-MsgGUID: hVFDiOBiQiuwWTaYjmDSSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35803242"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="35803242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 02:56:11 -0700
X-CSE-ConnectionGUID: PWya5ZjnRL689R/fvdX0/g==
X-CSE-MsgGUID: VMaXwzF+TcOZdrAydjlQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135449580"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 May 2025 02:56:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCF1z-0006Sf-2l;
	Tue, 06 May 2025 09:56:07 +0000
Date: Tue, 6 May 2025 17:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_ENGINE when selected by
 GKI_HIDDEN_CRYPTO_CONFIGS
Message-ID: <202505061720.KxTJTRhn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 77002c324012cf3931a613f828b37abe7ab4392a [2/2] ANDROID: gki_defconfig: Enable req modules in GKI
config: i386-kismet-CONFIG_CRYPTO_ENGINE-CONFIG_GKI_HIDDEN_CRYPTO_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250506/202505061720.KxTJTRhn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250506/202505061720.KxTJTRhn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061720.KxTJTRhn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ENGINE when selected by GKI_HIDDEN_CRYPTO_CONFIGS
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_HMAC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA1
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ENGINE
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - GKI_HIDDEN_CRYPTO_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
