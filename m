Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A77233D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716537126; cv=none; b=ISMr+hjL9O3aCoLru+VBVxdZSwmmGLXRpPGn//I0nuGNPDNEz3d8eBUTQ+YY1xaxcZcgoZrk8FzkUB3EpNQMhpIN8rHOoZpHG3YePAu7R5it2mqY5o+qN8+mX3YsY4j/YAWS1ZXfTyQZLALZqrl59bzsbxIbMxQ5pM3ZtQlkm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716537126; c=relaxed/simple;
	bh=cjlfr1aSXC/WuPIJUuurA+NUJuezh6BXGJojRscFLXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mHKJuSgj6dUzFq4PdwKDfNAnDcJK5C1xOR6SnJPtxHGS5RqXA95WxMmm6cVSJdU9Y7Z06xq+P4rHyCAC5z4b4WuPXikiRurQnl18TbZgSFwms3PeghXurubg2PFMv1r6E94MCzU9Th2duOrQ7Z/rTT+bAxJ4GdDxP5u1AABGGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aY6uMoSY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY6uMoSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716537125; x=1748073125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjlfr1aSXC/WuPIJUuurA+NUJuezh6BXGJojRscFLXU=;
  b=aY6uMoSYT84wATa29lwybjS1Adx7nBmMKGS70k/Vq5e8D3ePAMINxjdA
   ldZTivWT27MFrHY3Ylcf2GEObKfncES2e5QruRMnE1i6t0eWaz07txQk/
   Jww0eJpVOsA08S/RRHj+ih7yFXD5jO1Ow3wWxiiRCRVIdYgD0GvOOx+wX
   I0Iz5RPRw/KvmvcO+PLBjKotFE9u5hr0qvEbriw8aHAn3wcsrl4aVr2gv
   whTnLQH1ofLNDFDwymJauJk9ET5QsC4kQIXkQ07KWGS4BwTT7Atr5VjCg
   AjEGY9aEt5CsxFtIdTCZko+Wwt4ikhDiXIKfKnHXpuRXcVWmLHPskpxxt
   A==;
X-CSE-ConnectionGUID: dr52+t81S5eB63WQPz4WOg==
X-CSE-MsgGUID: 95lhLSwbQ6qHaRp+mMHFBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="15845820"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="15845820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 00:52:04 -0700
X-CSE-ConnectionGUID: dgiJFNFXSiW2MCwZcfVuwA==
X-CSE-MsgGUID: Chq78dg5Qimz+C9IIkIUYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="38356736"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 May 2024 00:52:03 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAPiX-00046n-1f;
	Fri, 24 May 2024 07:51:58 +0000
Date: Fri, 24 May 2024 15:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_mapcount_reset 3/6] kismet: WARNING: unmet
 direct dependencies detected for ZSMALLOC when selected by
 ZSWAP_ZPOOL_DEFAULT_ZSMALLOC
Message-ID: <202405241549.3Gcj7Eys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_mapcount_reset
head:   b29f783f826072cb553ec89a95bb1393c96af139
commit: 6b6d701fc4ccebcd7bdadc24dfb045e4f7f0940c [3/6] mm/zsmalloc: use a proper page type
config: hexagon-kismet-CONFIG_ZSMALLOC-CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC-0-0 (https://download.01.org/0day-ci/archive/20240524/202405241549.3Gcj7Eys-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240524/202405241549.3Gcj7Eys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241549.3Gcj7Eys-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ZSMALLOC when selected by ZSWAP_ZPOOL_DEFAULT_ZSMALLOC
   WARNING: unmet direct dependencies detected for ZSMALLOC
     Depends on [n]: MMU [=y] && PAGE_SIZE_LESS_THAN_256KB [=n]
     Selected by [y]:
     - ZSWAP_ZPOOL_DEFAULT_ZSMALLOC [=y] && <choice>
     - ZRAM [=y] && BLK_DEV [=y] && BLOCK [=y] && SYSFS [=y] && MMU [=y] && (CRYPTO_LZO [=y] || CRYPTO_ZSTD [=n] || CRYPTO_LZ4 [=n] || CRYPTO_LZ4HC [=n] || CRYPTO_842 [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
