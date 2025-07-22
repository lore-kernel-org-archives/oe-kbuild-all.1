Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B92628D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753190765; cv=none; b=CGMU8UGQt9JWuy0fP9PZhbvJRnBLfGiLZQu2LaIrM7pKKBGvg6eaW2WLqvQYRUuHMTA20VpFkmHVIpHDEeoTbvWiG87tNt4bppVp8fcYloU+yvmbsbff67JIANAWc1ZJckP50VR/5YwOezCN0JKqVEWrHTNOFez1VqHJp6BwtSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753190765; c=relaxed/simple;
	bh=FHVW7YtJ6s7labN80WdRBvW6XIu5IRCYcp0VzFr/CiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=to4IYDHN5tpBfjwhy7CPdiGQHHWjUM3Q3/Rld3P9JLq6NKLE89HxEr1JA+ha66LSJzTlNuNWJy8ei8JyVrxLYpKt//sok9tpq8pgfO8K0eBrvRyapBU5IK58+2aS9wUtDxUjOD450/xfKroAvQ64YHgAXQ70B+uPC5sgGLOg2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfVETUkq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfVETUkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753190763; x=1784726763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FHVW7YtJ6s7labN80WdRBvW6XIu5IRCYcp0VzFr/CiQ=;
  b=WfVETUkqop8eFOCx5K6PalW9C2rMPVco7Q4frKhhbhrQOSasxornanBX
   /B1f5be2ZiIBNcXGhNS2+kxQYWCu9lhavTAjeqkf85fGDvueXzhvARxNE
   z24O+B37UXlmTYDMelUbjVwrxS2U9dT4t91SBReGtjy47OQr7dwTj/COs
   Ul4NgyCpwew8hpsJF7yybi/Cm+ttsQlALtK9ZxkVo9VEaCxlfowOWdXWT
   WHWZHCKi2kFryHd7Uc1QOwakEGUfq+8RHkjmyxM/lIkDD/Ok/gTWC7Nok
   WjCc8QJi4tXbX+ZKeWjog2hPqRkAE7vlJ6cwJKdti8sw2rwHboDU/knPy
   g==;
X-CSE-ConnectionGUID: MlAAw1E9Ri6didZey7BH1g==
X-CSE-MsgGUID: /iMVOzICStCn1pu3UZjWwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55552050"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55552050"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 06:26:03 -0700
X-CSE-ConnectionGUID: 0JiLf17nRQqbnE5HuHHDlQ==
X-CSE-MsgGUID: 6F4hoxEMRjyoRhxtErkIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159214066"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jul 2025 06:26:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueD0J-000Hox-0n;
	Tue, 22 Jul 2025 13:25:59 +0000
Date: Tue, 22 Jul 2025 21:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto-conversions 78/84] kismet: WARNING: unmet
 direct dependencies detected for ASYMMETRIC_PUBLIC_KEY_SUBTYPE when selected
 by INTEGRITY_ASYMMETRIC_KEYS
Message-ID: <202507222151.DXcc18nc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-libcrypto-conversions
head:   60f592d9fe4e26c4e98273c0275ac1f1f87fab3e
commit: 2a8926c5c8560e0188a237145b9e95146e1d112f [78/84] lib/digsig: Use SHA-1 library instead of crypto_shash
config: alpha-kismet-CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE-CONFIG_INTEGRITY_ASYMMETRIC_KEYS-0-0 (https://download.01.org/0day-ci/archive/20250722/202507222151.DXcc18nc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507222151.DXcc18nc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222151.DXcc18nc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_PUBLIC_KEY_SUBTYPE when selected by INTEGRITY_ASYMMETRIC_KEYS
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=n] && KEYS [=y]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]
   
   WARNING: unmet direct dependencies detected for ASYMMETRIC_PUBLIC_KEY_SUBTYPE
     Depends on [n]: CRYPTO [=n] && ASYMMETRIC_KEY_TYPE [=y]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]
   
   WARNING: unmet direct dependencies detected for X509_CERTIFICATE_PARSER
     Depends on [n]: CRYPTO [=n] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=y]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_RSA
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
