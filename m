Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC6222597
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878081; cv=none; b=aNTlScJWAlvgzdXThuYKD+V9/tZfRR+opXQedsgQFCpHvO3o5seXW0Tp3LP+12fi2NMtacszOotxT27awXT39grchOtWmVE5znfaSPiE1KnvDA8xFAzeH3SsanWI+1voPmXEZMsx/OodYzrpO96vqLMOAraWNRSagtEPNFA/rL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878081; c=relaxed/simple;
	bh=bL04t8sspo7Iek+W+cVYEd1sMW1yn9CcWc/agQ3U7+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhT4Iw2YEp6bvd0Tp5U66WsQHg6OOiLwv1iMIQH7yMkeq8XGpLb5D/U/X5vldEbGt8yDnJ9Php5g27TENr6YOJg6KzBBvcAkD2JvE4Fj1CDTxz8l0iITH6Wwx5enUeo2/knV1S6Ns7P8yerKoN/b+kM0crNAZalJ6c8vXkWYrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ni6oGJEc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ni6oGJEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738878080; x=1770414080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bL04t8sspo7Iek+W+cVYEd1sMW1yn9CcWc/agQ3U7+U=;
  b=ni6oGJEcxwGabP38tjrBvAVnFbaNU/uiIKYxLYFi2MSkP6lVrqGeQbOy
   MAdpBivFPLM+/Av3+jpGbGlWYO7CJGrgAslfdAODkU/5KAgUptcO5+2mv
   cFXYJRgdMFUEXsayY47eMFBsk4EM19kK8RzNHnn5cJC4gEcfZzABngk3k
   NF4Esn9hNnppGcN3tJfFFySlgzMZLfmX9nJ8GQlkHGacvgCtLDggh5Rnk
   7s1dSZM3sfC98xzYXnHJABhNxQa5jdhx0gVxTl9nCTprj4S/KcG2EN+zy
   qepD4VuN1MXLk9mFbc1WWqPRCmWwb8wdb+6mSZbNYMMXid2nZizRWsZ3c
   A==;
X-CSE-ConnectionGUID: zvG3M67uSau3hGA69yFOgQ==
X-CSE-MsgGUID: 3jq/SmyGTCyjNHUk2IKoKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42345011"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="42345011"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:41:18 -0800
X-CSE-ConnectionGUID: wWTYx2dOTYOAMWofOwVSfg==
X-CSE-MsgGUID: Fm5DSmB3Tv2oxeoZnkISEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116528527"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 13:41:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg9cY-000xMP-0a;
	Thu, 06 Feb 2025 21:41:14 +0000
Date: Fri, 7 Feb 2025 05:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1418/1780] kismet: WARNING: unmet direct
 dependencies detected for FB_DEFERRED_IO when selected by
 FB_SYSMEM_HELPERS_DEFERRED
Message-ID: <202502070529.LDjeJquO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   808eb958781e4ebb6e9c0962af2e856767e20f45
commit: 236ee083f1b9128fd5bd266054c5b8868f803cee [1418/1780] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
config: arm-kismet-CONFIG_FB_DEFERRED_IO-CONFIG_FB_SYSMEM_HELPERS_DEFERRED-0-0 (https://download.01.org/0day-ci/archive/20250207/202502070529.LDjeJquO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250207/202502070529.LDjeJquO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070529.LDjeJquO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_DEFERRED_IO when selected by FB_SYSMEM_HELPERS_DEFERRED
   WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
     Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
     Selected by [y]:
     - FB_SYSMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
