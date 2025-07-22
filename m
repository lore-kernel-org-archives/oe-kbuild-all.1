Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996321A0712
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187759; cv=none; b=otGlN6QFV6RVtVIhZrOWAsndhI5ik31FNiCLLb2RhRjqhr2UR5BGspN3h2r8vwzVEvW7N3vp16DGaIL286/bY6JZQHmQWZAGdyVhfNza622Kmj3dCwLfKLRTADyxeWjywjivCq3IKxK2cJ1HCkBXQtvr8rHmReTTVrU9ChJO7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187759; c=relaxed/simple;
	bh=5vo/TIHrS96g4/YtBkcLaA+2ORszAAU1W+R4l9ooGcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+dV4UXr3BClcNQOAlfdTCjc0cNpJE09KjKaLgfY4s/QvvjSEeOmZGgXiC+FmTHDvztpJZ91zV+5CGzpUQbA6uwFsjcj5zb1XQWfRk3j5vM4I0lKvnqZpDBzQ2tvSeFDnUet2GdxxtKscB5DXvQMuAVFIKoZZjK9klVCBo/Ae04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URB4gy0y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URB4gy0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753187758; x=1784723758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vo/TIHrS96g4/YtBkcLaA+2ORszAAU1W+R4l9ooGcU=;
  b=URB4gy0y7UKFXw3MctuMNPeDHHwtxG+Y0gOcpby99+hG0hJR/Svi8XCh
   DAjPurciu1w6CcA/UVDxmGlMYHhsWLXPiXMFhB3AopkztOeHx+3/O1cwF
   D9d0rzDj2X70ryeRWQVWoqQ87sXMjCLCSXUWa0N0pe6XncDD6J8qVLwRM
   fGb7DH6yao0Nmy7k0PhhM4fQ+QtDEgw60huTJSbxG/urOqxUf+2kV7hll
   tpDZRqcu0ySz28BOy647q50D9aHXXbnczFcm8LNsHBF0BqMXVe4DcXo6u
   bxCydZixBdN082GlfQmbkVoKCXMRIT6vKqM3F1Sx+Jo/MWa8DGRJbULiT
   A==;
X-CSE-ConnectionGUID: OYE9LPrgSSuN6NwBbqgHwA==
X-CSE-MsgGUID: SGQuHDk/Tg2UsTaT+JEAOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66119879"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="66119879"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 05:35:57 -0700
X-CSE-ConnectionGUID: 2ir9PPG9RxSK5WE6ChvI/g==
X-CSE-MsgGUID: +WBcjXUITPmkojz5/9Mh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="164601270"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jul 2025 05:35:56 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueCDp-000Hml-2L;
	Tue, 22 Jul 2025 12:35:53 +0000
Date: Tue, 22 Jul 2025 20:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto-conversions 78/84] kismet: WARNING: unmet
 direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by
 INTEGRITY_ASYMMETRIC_KEYS
Message-ID: <202507222011.Jt3RpcEM-lkp@intel.com>
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
config: alpha-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_INTEGRITY_ASYMMETRIC_KEYS-0-0 (https://download.01.org/0day-ci/archive/20250722/202507222011.Jt3RpcEM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507222011.Jt3RpcEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222011.Jt3RpcEM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by INTEGRITY_ASYMMETRIC_KEYS
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
