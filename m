Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA4EAD7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940692; cv=none; b=gcZiqFHOn/x/gqZi8o8Cf2dIBNicpqyQELKiuWP5nBKsLjDduhNdBl5kdvil0seqQbPXMrljionh+Y0s1W6xrRhiUhZH55U/XHVbcDujh3ef8P+ytEwSq2QJNGOjpf2a9hYtNZXtB/J91l44thKiLieKgULGMlH6sjzuLrwdKwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940692; c=relaxed/simple;
	bh=FrKDdKg9Yq50jHXqk95l8M0vIk7u0PLVuTTOGefkoDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lTDQ8/mpuCuRj+jc7gOi3hheQPcyII1856wGlZBE+iIWT4HUQEYCREuDyT+j25EZrvcKh/vm3nUVXzOZLo6DQD/8DXk5yChnaVaJ1a7j+k34A/9I1ZMs7B1wFpl6dnZiTGwspClktWG8fCdgYtvVTtalIpHuqHsKf2uOvJBgAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOcdiecg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOcdiecg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741940690; x=1773476690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrKDdKg9Yq50jHXqk95l8M0vIk7u0PLVuTTOGefkoDw=;
  b=SOcdiecg/ZwIK2K+PyXPsvdlkksavU+/RonyOH7zyGWnfocKGvkAiS3/
   4ZeZZV4LHMC46kGnYfUqB/wgaPVNivV5b9BiRe3zuE0pj+O9a9bLEhrTO
   9Py08eRerLvJh6tuxnn6LYqyeOqgsxuE9H0O6w/XIm2ahKAWhoXL43KIF
   nmaYhMYxHk4hbl7jt2jQLeKZHiGtcHkV/PvS2TqWIsWav4cgb4nKq8zGI
   OzWNq5aKgMqwQw+NWmrpEiTDJRwJtC8BJRJ9Wz8I44bGclBhPFTnqvatm
   Pditq82grE5DLMV9gjTgVLN/vlO8GBTHju55FV6I0XDYr/8icCi94945w
   g==;
X-CSE-ConnectionGUID: dVu3BW5QS5KJZt+G0ccMHw==
X-CSE-MsgGUID: UtWZxHQ0TyKOLHmZCQdJog==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43116293"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43116293"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 01:24:50 -0700
X-CSE-ConnectionGUID: o0BkSBrRQgi9Whq/YythnQ==
X-CSE-MsgGUID: O21swm3zRbS1fN7IJnFLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="125389753"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Mar 2025 01:24:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt0LW-000ADw-1N;
	Fri, 14 Mar 2025 08:24:46 +0000
Date: Fri, 14 Mar 2025 16:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 157/158]
 random.c:(.text.__get_random_u64_below+0x138): undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202503141619.1r8XYrfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   454dd9816ae1cd9fd0827c062a641dbbdbe44ef0
commit: a888eae7549b5515b25ca0846d4b39f1195a3020 [157/158] bcachefs: kill bch2_get_random_u64_below()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250314/202503141619.1r8XYrfv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141619.1r8XYrfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141619.1r8XYrfv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/char/random.o: in function `__get_random_u64_below':
>> random.c:(.text.__get_random_u64_below+0x138): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
