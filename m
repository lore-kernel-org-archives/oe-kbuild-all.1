Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01BA61FFE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737796540; cv=none; b=GLxLOhuPnpariFGhk96TXKaqBOBEqfNqWGK8Nc4jAjn7e2wnWah2PFDMO+33k6UgfaVkpDh1SWq7cTdaqlrh6zqQ5GH9eGAGTEdQkxRb05Pj2XQWqbAcu4f3USF1LuZlClp3ysrz3I/Jd14nxSF2+/12en/jV9ISrQIbE5gtnqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737796540; c=relaxed/simple;
	bh=JlRMP2CrFSaQxTzAJAfgqORkox024XwPOgpvrtdlcrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NDOUUkq6YgNS9PYzQ+WUBUVeQDDmSV5Y58eNLgAQbdmDFE4OdsXNxCgzu76ONqBJIUv6GFnC4o06JQvJTZ8g1IhRT9esabHWQVOQ8tzfrljSalDa8Xy7UurMJ+AGMqgF2BgwQ/Ku/jCz8JbxqU3sQAgvO97I7Sv2KZ242nTyANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdFluL6o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdFluL6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737796539; x=1769332539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JlRMP2CrFSaQxTzAJAfgqORkox024XwPOgpvrtdlcrQ=;
  b=UdFluL6oxPH3oQWhH0xQGCUpeUBC44K4YkuBi9GtNcs0erWPjclegogZ
   7ZN6+ZNJ81kJTTwPP7qfGkLIYYCgnmBJisXX+i30XwJ4g0yhyQOJgMsN3
   nTD0a9fI6cItPA/6VsaT8lsfT9MxrVlcH0zJ9gUSd5FB5BVPjF+SyLARI
   mWqnf3Y/FF3eMnSxWt8TLMWdXjJyR6ACw33SVxQNRZ0Gg/N7LkI4S3oBV
   bo/+KsUvC+KCnNd+sIlIyzlLiBIhU/3E/Nyg10vk+syg33Zf8D3G6C8IN
   fL5AeM0dLwEX2y9yH2VsfPQgjhNrIkHJqKwHrx0THKO+v+BrLYLvYjyq4
   Q==;
X-CSE-ConnectionGUID: 08tH/r6nQNOF5uKqqD15yA==
X-CSE-MsgGUID: ywIwUQ2nRGWcbjyoDm56pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="37534304"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="37534304"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 01:15:38 -0800
X-CSE-ConnectionGUID: qVdh6qYORN+FZ12omq3u2A==
X-CSE-MsgGUID: fWaC+G8ZQnmFfEIQpCF/mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="138846364"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2025 01:15:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbcGM-000df1-2b;
	Sat, 25 Jan 2025 09:15:34 +0000
Date: Sat, 25 Jan 2025 17:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
Message-ID: <202501251726.iAisFbis-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   6ab8cf3e119e5846b97e0cd66ade22fa83d7ddde
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [2/2] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm64-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_HDCP-0-0 (https://download.01.org/0day-ci/archive/20250125/202501251726.iAisFbis-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250125/202501251726.iAisFbis-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251726.iAisFbis-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y] && !CONFIG_FS_VERITY_BUILTIN_SIGNATURES

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
