Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB43D549
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716526294; cv=none; b=JstotQMaLvGFxiN0Rg6mH+ywcj/PyHptzmAZSUO/75qlWAWebgTTcnJDJuf+YZx9qK3hEgneQTWQHY/w/X2UAIlHFw0ubBLeeDCqOLRobGGNMIyEg1kNqrZOM5ivhxmSFCgp2glIlPT//VTjtPNQNqAp7mo+d4w9ETEx90a44ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716526294; c=relaxed/simple;
	bh=OTmvvccWEV0TPB+X9NG0orPtzzzvtKP77XixEqETaEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvXlO6DsuZliC+KmNmIVqS9qNjEBzIMagsueTbppZvrsZisnXchyiB28jAMqI4/AhtIEnR+IjAh31OyOmdfgLzGO7VrZXVXBMdcwkBwugtlOWNZaYdY0JBVwV9nKmleKn3MU9BejeXrMK9GPvHWZwsoTHmwDj/q8xSv0dTKGdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikU/pau5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikU/pau5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716526292; x=1748062292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OTmvvccWEV0TPB+X9NG0orPtzzzvtKP77XixEqETaEA=;
  b=ikU/pau5w7WFP4GIADD/iCwl2jqrkDaT4n0YJ9dvt9w3b71tqJ7j/+Vx
   niDQ7gXMD3QgkBPXZbanAieqfJpna/tGbfR7WuUmfNSmotCThbkkD0dAF
   oCrpz6W8Fxzbg23lmBBZn12cAt2tHwnhv3Z98g+pvVXKaDyYwqQHvGZz6
   hXBt9oW4B8S5MTRYclYgFak/PVHP9EYOmywv+Jge4Ur/CWvrn9cuMkZm9
   jsR9PfjdN1KcgWHtzioXtj0fgYYbVlyQsG8fP0hTbanYhY97ezTRA8GYz
   rIbfQw7M9swKEvmpZ7oBB3RWSrsm182uBZevNHGjHabO6/IDI7nSim1HN
   w==;
X-CSE-ConnectionGUID: nsPaF1HBSHGJnK657BXHSg==
X-CSE-MsgGUID: TUYSuDEISVqYHBLkYWkv+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30390919"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="30390919"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 21:51:31 -0700
X-CSE-ConnectionGUID: V1VVi4sbQ/6gnTFSxyRrJg==
X-CSE-MsgGUID: Rs4K0R47Q+GWsc/+iqmRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="33912619"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2024 21:51:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAMtr-0003sj-3B;
	Fri, 24 May 2024 04:51:27 +0000
Date: Fri, 24 May 2024 12:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_mapcount_reset 3/6] kismet: WARNING: unmet
 direct dependencies detected for ZSMALLOC when selected by ZRAM
Message-ID: <202405241252.TtFWV5RE-lkp@intel.com>
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
config: hexagon-kismet-CONFIG_ZSMALLOC-CONFIG_ZRAM-0-0 (https://download.01.org/0day-ci/archive/20240524/202405241252.TtFWV5RE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240524/202405241252.TtFWV5RE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241252.TtFWV5RE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ZSMALLOC when selected by ZRAM
   WARNING: unmet direct dependencies detected for ZSMALLOC
     Depends on [n]: MMU [=y] && PAGE_SIZE_LESS_THAN_256KB [=n]
     Selected by [y]:
     - ZRAM [=y] && BLK_DEV [=y] && BLOCK [=y] && SYSFS [=y] && MMU [=y] && (CRYPTO_LZO [=n] || CRYPTO_ZSTD [=n] || CRYPTO_LZ4 [=y] || CRYPTO_LZ4HC [=n] || CRYPTO_842 [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
