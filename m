Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2045CDF1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 00:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755475351; cv=none; b=OAaZ/XlaqGh8P7YqWXDNZhfaRzZlOWGXVQpjjn2LSZtAjbRyFr7r8Zl9grLtesBuoZpcFWWdRhTl3ORZ2b/Ohs4OJ7YJ37ZZgMJrerDDGOy/T3530EIT6+imy0GvpS0rM2nLdRUDkrqwsaokczEkIt/Uy+pSAAnLx4VtrznP8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755475351; c=relaxed/simple;
	bh=9II7IW9PrETb2OGmq6IN1gC5JB4G6FHnozlS/CXyEys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LigaKo9GfbEf+NuLfk21+AAAL0DI9fpIm0afNqhCHe3PiomeP0Wr0NyZtmTx39z/U4dAagvJ5o7fAp2d3DxBErWWQJlyFYymIB5p/AV0xltmjyzTQ6Re0ZNiLiZF9PzDLrELjRU9rLqWS4Ezfcb25LHbu8KN7iRgZtX5o9shPuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUb05gSj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUb05gSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755475350; x=1787011350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9II7IW9PrETb2OGmq6IN1gC5JB4G6FHnozlS/CXyEys=;
  b=LUb05gSjcrlM9jxalbI9ct+VGn4BAK/YNy8Rd4pXiqbN+lPX4hM98aan
   JWoU33Kb13S+0lNEk314AMU6XJpISk2YJbb36SasXu/h9kbGk3JMN0Kmf
   ++rsnNL/ty6SST5R+FJ7RWDRxvk3nFVo69Ob06ZwWQzoaDRgXinPK+qUz
   kyQfjEecRwqxnMm8RUhDhkTzVypsj3gX2o0S4BlX4SWdf/onazcTx4VU1
   L7IjyNtUC6kgPM45Fb8Ja/PiI62bpQ+8quLWIHXDG3r3+GmXKFOLLbXQZ
   WznbK9JuWsC9i1ajSny/UhvUkmBrZwKSoO6dGoyC/HscOJnWRsnwuL2D6
   Q==;
X-CSE-ConnectionGUID: 51Ge9RNDQ9mibKBDJZ56NQ==
X-CSE-MsgGUID: lpKhghYUQCGxl/VJXkv9jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68298074"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68298074"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 17:02:28 -0700
X-CSE-ConnectionGUID: AcqKu4zWTuu/j4mrxnzl3A==
X-CSE-MsgGUID: qhYIpKksSbeUA2+kUez+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167051874"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Aug 2025 17:02:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unnKR-000Dmy-34;
	Mon, 18 Aug 2025 00:02:23 +0000
Date: Mon, 18 Aug 2025 08:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [tip:timers/clocksource 18/24] decompress.c:undefined reference to
 `__decompress'
Message-ID: <202508180750.eB80Lf6D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/clocksource
head:   7b098309ced7709c0a502b5eb9f54bd1f26fc6c6
commit: ed1d4c331f9f161788903885ce9ddfd665bdbe18 [18/24] clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
config: powerpc-randconfig-001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180750.eB80Lf6D-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180750.eB80Lf6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180750.eB80Lf6D-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> decompress.c:(.text+0x1ec): undefined reference to `__decompress'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
