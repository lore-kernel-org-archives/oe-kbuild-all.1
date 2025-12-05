Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F652E229F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964640; cv=none; b=rpgcE0s21oX4cI4dqOhnDjkz9G4DPOY/O3B7VZufNVOxp/4GWPdUMu+1cW1aT9W5gpYNLZA7jegmhmKXjd4e6K9sdaTg7jby8ODEV0MhAzLteTr7OBt6hrZSCkdKKx1XJhqHoMCa9dwgsj+1iY+WmrY3KuLv7/O57zzmlqc2nfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964640; c=relaxed/simple;
	bh=GpqwIDGWqERgWPD4BSJkFzojQ6UaiLeM2sjLUbmvNtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvPV7HnJybKEi5lyR6mCeTVH846ZjrYCrYsskG1TWUtypAQQ0YmABfMf2GOiow9MKw6QvRdH1q15RV7GUnbUX/s+AvovJ9WXY/nsPFoXHYhUDlKFGg/9UB/yW7mD48wRkBO3IwM8364mI+Ty5Qg8Ffm0v3Xy7m1ya2xDMIY4PU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFltKaXM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFltKaXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764964638; x=1796500638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GpqwIDGWqERgWPD4BSJkFzojQ6UaiLeM2sjLUbmvNtQ=;
  b=dFltKaXMQldYxecd+ElQ7CdEtsZhb/tEjBD6jloq3NT58deeA2Az1P8N
   HE+beKPrL4QlHxjvdNAOl+R6Vu1mRj8WHYytj4/CPpB/caxqnncs4Argw
   CHMjIdcnnisXbVWY1DZA6q+loNZ38KqXU/LMdr5XbSizxccQcJOVAivEm
   IF1+eJMNjMHo6ia8h+73HHJUrJBdof0TzUZ+4tMfcfGYTMF5P4fZEs+aS
   IuytBkKVv9wSfi51ATJ8Qje5uVgFmr68RdIB5ToAq6GWV1I20anaOou/k
   CJSFR/OnwXKg8of4Vjj+IqhBm8mjvzc59X8bxSmX7RJunzR4J3BBIt9gG
   w==;
X-CSE-ConnectionGUID: asfJ21N2TOW98xFDsDyV2Q==
X-CSE-MsgGUID: wuY0EZywTASVJjzxqPJg/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70622889"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="70622889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:57:18 -0800
X-CSE-ConnectionGUID: PRtCDQnnRLSKm6ar43XjPw==
X-CSE-MsgGUID: YYnz4t+CQcqwOZPKVbvYCg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Dec 2025 11:57:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRbvX-00000000FUL-0noC;
	Fri, 05 Dec 2025 19:57:15 +0000
Date: Sat, 6 Dec 2025 03:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202512060333.k8Y7hSVe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [1/1] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20251206/202512060333.k8Y7hSVe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060333.k8Y7hSVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060333.k8Y7hSVe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
