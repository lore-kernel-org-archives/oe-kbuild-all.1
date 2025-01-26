Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC525A620
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737892471; cv=none; b=Gnrk5X3p6KevDGr8Vbtund+HNefIdgnPip+vqOt7/bdYiwvVSiw75ysE/Ut5BDMm60jqmEfHPzamg6K9UzcbkGC/HG0oD+AO0OuGE7c46PXUYvJzF89BuSmHZch7uAsdXLpItZRuq254JxBDyJFSakmnPMLsOUSeyOKfE1HzLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737892471; c=relaxed/simple;
	bh=/fXycq5uccnRs5MQD/8C2osqYyAn7OGCgq4SUt3iklM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oYY3XL7tsrQANzq3g6qoFte8dYPHiWVCNoPqkDhew1frGtlXhD5GE6p5s3U155b1DenNZANIHetjuA5HnmtFHJBt5pfRqeH1uDX9sPre7YRTZ9SKIaOMINs4UDxsiTcZV84/e5yBA03mmRzb+bEczB9wkwtbM/dwTubIBQ3hSvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYJoatE3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYJoatE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737892471; x=1769428471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/fXycq5uccnRs5MQD/8C2osqYyAn7OGCgq4SUt3iklM=;
  b=fYJoatE3svdVenhmDbGGJ141K9L+jgOT4n0mEUsdMpIlMSW7eiZR+9zN
   skI3Sm+w5+IDE1iTRPId80LtfWWzX597cu/tY6jxbZ+D0R18YrjoPXonj
   bLbQT2BY/q6nf7U64PJtSywlixL3hLipRzva82cFk+2OAaTtDH9E2vv6x
   aNwvEKCL6nxL3ATMs9oH/vJteXGJn2nXXHiWoqPhVO8LubLo5oiSwcXs2
   8tlglyB1cMM1xnXdbt7PeQflDZ4cUzaEaF6rQwMib2sskrGtH0QQc++Rc
   t14xRRcWh6qVEDuavh240UuB98kKtL672AM7tXpzOq40HZnQfc5+oV1ZI
   Q==;
X-CSE-ConnectionGUID: vHUzCLjqSxyWt6izUAnnVw==
X-CSE-MsgGUID: F+DV3EfFS8it6CT0+P6P2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42128094"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="42128094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 03:54:30 -0800
X-CSE-ConnectionGUID: ODvoTFlrQKOsx6ZSnmeN8A==
X-CSE-MsgGUID: KEDHlANfQpWnTHWO4eca3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108059617"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jan 2025 03:54:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc1Dc-000fK5-2A;
	Sun, 26 Jan 2025 11:54:24 +0000
Date: Sun, 26 Jan 2025 19:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [chenhuacai-loongson:loongarch-next 10/13] platform.c:undefined
 reference to `acpi_hw_enable_all_wakeup_gpes'
Message-ID: <202501261959.XqDu3jP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   10fbe46dddb701efb775114b3eee660de8c9d982
commit: 765a3931379633090988ef36aaeb15b570a7da71 [10/13] LoongArch: Fix warnings during S3 suspend
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250126/202501261959.XqDu3jP7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261959.XqDu3jP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261959.XqDu3jP7-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: arch/loongarch/power/platform.o: in function `enable_gpe_wakeup':
>> platform.c:(.text+0x78): undefined reference to `acpi_hw_enable_all_wakeup_gpes'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
