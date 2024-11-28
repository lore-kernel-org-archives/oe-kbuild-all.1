Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE4B45025
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 04:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732768049; cv=none; b=GaxSsKp53ja6CC4deRvxIYQNc454028FnbmA2WB4CVLIcErU7rLvuR0sst9blQYqUkSMpMAN2ndZKYy1IlaYQ4gfIv5Fx/O7q60OzycZdpMQNu5KIu8eIspSQjhkwo9FRBsW3C/SnMAV4nQz5vJYHFkDlLF9AhC+IgxkfAvqirU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732768049; c=relaxed/simple;
	bh=Z5x7Zo3jRSBlEejRaMCF068TwZxiNg4He5A3LWaK5jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wq2RzgLgt/BeztItLlIGVIeJARA2NpXiNj63yHAb4FdU02fCNuaiVf1o3JdZONB1OGTDCcArVPAcDqA5x0JX39DAeiL4H2f3UvuWR/GyeYBiiYFpxOeyrXBw0jgGKdjK1ROfBYzBnfSD2Plf0wOW4bV3KwxfOEFMmRAwcB5ESgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCypqLOI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCypqLOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732768047; x=1764304047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5x7Zo3jRSBlEejRaMCF068TwZxiNg4He5A3LWaK5jQ=;
  b=OCypqLOIu8kZwMYQDW5mRQk6DvAPUDAPNAM2TCXLtrXeQxHdYj/sUDZs
   V53HCLIHIwlS90TvayV6QPDCQIhehlh5rkQ+OZCMT3TOCudQj/zraALub
   tgP4t8Ehci95rKApmrD6QdRi50jZQ77Zwhx2ROnC91yp/2507VVVxQ+VJ
   8yNPyLAJvaLFMoZFDwiM8MUlWiiIqBMZt1chC1AgSCppudYu/AuaO0aR4
   86CHwRxzyPqQkAiljvFpWIVcWLHQD7Lvz9kTs+kMmfdJc8FI4/z2d+P+S
   /na58lRWeS3hqjhGbnY5CJ6Dhjfrc3VYGMZLChK92CHdBwfgp1XlgzU0B
   g==;
X-CSE-ConnectionGUID: +6Cj+C16SUS1CzRiDTkbXw==
X-CSE-MsgGUID: txrEUjDxSwm9npF55gK4RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33142552"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="33142552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 20:27:26 -0800
X-CSE-ConnectionGUID: 5BG3MjmvTh2bwmQ0fsUF3A==
X-CSE-MsgGUID: Abx63ktRRpWrt3jlFDfjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="91999378"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2024 20:27:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGW7f-00092K-0n;
	Thu, 28 Nov 2024 04:27:23 +0000
Date: Thu, 28 Nov 2024 12:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1308/1308] lib/.tmp_idr.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202411281203.h94fcnp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   897ce607838618bcd783a6493748dd11891683fd
commit: eaab6483a9cc9c59427c23d4b45c9990d2888f78 [1308/1308] ida: don't use BUG_ON() for debugging
config: x86_64-buildonly-randconfig-001-20241126 (https://download.01.org/0day-ci/archive/20241128/202411281203.h94fcnp9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281203.h94fcnp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281203.h94fcnp9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/.tmp_idr.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
