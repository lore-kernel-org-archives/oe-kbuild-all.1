Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F391FE44D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753761213; cv=none; b=AB0zmlmN6VIg6UvecpspfJgVzVUKs2Oaz2VEEVX4JdgfERS72m7s+MXreMpgcGVL9SlhoDV3vF6Dv0mKAohcp1MybgMMLQo7xhFyRH+UGSNTNqHPPhXPGMfKRGSLa1f4qjRA3Gw92ZobiLDBzlbpqfo3C7myKOkv1Xgha5PUAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753761213; c=relaxed/simple;
	bh=YjEML0PbjaznciIA66W7SLSfI1fkvNFPDDax1CCFlEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWZeauaWPI7BIrz/XzszpaF0lTf3Nv0EeYsdMqm0xlhlHdoUUgIsARVx6ScBMeFCbGcsiZzyMzbWVBTL5KXJhN5cZieMoOeybFbsDyf0N4DW4vIwZr7eHvQ5oszOxU63SfNmTKYotpFx45pbgMQroLEJ1cDTIxo9pI0MZOkDQmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8OkQ1e5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8OkQ1e5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753761212; x=1785297212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjEML0PbjaznciIA66W7SLSfI1fkvNFPDDax1CCFlEU=;
  b=j8OkQ1e52Qx5zsNlsSlOTvym2al0YQCdiuhSc+DAi7XFZVxWOZNe0MEb
   /N8THlHBhB6JRkMZgAuAOS8L3Y1W3hjdeN4NHOBMYtdecE//NHOYxYQNT
   25D0HMidiuBFI9ersLnKAUyDe1N8VxCYymVAiV60q2mi4vwBuWzOHLcDb
   SkQRZNH5s/mEDKBuWSSG7MbnuEIAO58706czTbpH+gKBxvbl3hnF8NPJZ
   FPw1ARPQfjtPimV4J7f/xfdjUJvOu6J7pxhWTDwkeppEEdTBidAteA2MD
   OzM2ax50n+6RJcMbuAmxSXAg0q/Ta8TOWBdrmWV0nL10/KyMW508FOj2b
   A==;
X-CSE-ConnectionGUID: k0fK/BpvQL6Y6b3ktvFgdg==
X-CSE-MsgGUID: /DSXGXsXQaWzkEttpKPHIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73469308"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="73469308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 20:53:31 -0700
X-CSE-ConnectionGUID: H6xkPzyzRdmdAZFDsTXkhg==
X-CSE-MsgGUID: zYHq2XzFR+2wuDoEI6Gmxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163032338"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jul 2025 20:53:30 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugbP5-0000xn-2p;
	Tue, 29 Jul 2025 03:53:27 +0000
Date: Tue, 29 Jul 2025 11:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 35/35] mm/shrinker.c:698: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202507291110.bTFrwdmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f5139a8dd3c12cb0a4d854039d7c6ae10a89a87f
commit: b3e9f57966dfb560c0430ca84ce86076206ebf4e [35/35] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250729/202507291110.bTFrwdmE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291110.bTFrwdmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291110.bTFrwdmE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Keep synchronize_shrinkers() here only to keep KAPI compatibility,


vim +698 mm/shrinker.c

   695	
   696	
   697	/**
 > 698	 * Keep synchronize_shrinkers() here only to keep KAPI compatibility,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
