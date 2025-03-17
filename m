Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCDA2036EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 21:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742248491; cv=none; b=IujKZBGVItuzBxQKRUnir0w09SLIFCDBg23ozeOjhJZwZ9pIcC6hq9cxODr3bKtRJQshy6mp5Ts/f++x1z1l34oTJoOU/GUJ7WQKqG0yzrGSZil8oDT0ACTmK7bZ53Yp6I9KEoMPN2//jOO+FIfk9aoGrp6tnpj6w7jVc3NfN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742248491; c=relaxed/simple;
	bh=wDHigmYcJihFoI934hThX6lG+DpDsy1fGDOLlF2QJJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdv4Ot7C/pORCYzhzaU7jNEGCtA8wK8n04v0rAHN4z6iY8IFZOcyrxrPgTgn5K5kPg+oyep/IDWOu1DtmFZj6Yj+ffXXoDL9BAgycFPz7QuMWDOoq44rZlvALe3BWIV4s3kPuwH4qqxNDgMO27BZn3y+0m61QQf8INrBlO0x2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/PoFlb5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/PoFlb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742248489; x=1773784489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDHigmYcJihFoI934hThX6lG+DpDsy1fGDOLlF2QJJ4=;
  b=K/PoFlb55PyFZ54sclYw44GfjiqzWmox/NmdrpAu1QTWrtmLEAq55T1r
   ku0IAljexk+y1q+i0b84FQPVAFQQ5RpBvMXRVg26H89Pw3+Ae2szMLsyu
   5dKcj8Oxu/KuLv2OR539BgovvXSEEVxZTN9dvuKomPkNycAW7xB/AI5mO
   8EY39fQNq4dVsEJxUQgXkqTXZa7OCsPWNf7EEbMftDYJ6XNOF/yDH2IDi
   n+sxvUENPLt/L3XCVrxnAcwzcrY+CWncwhRbhZrs+VEk/nKUD5frsu+Jl
   ZLyz5TvgVlEXlk0t4pTA72jQF6eD4UEUUtiu4naVImN69PZeq7Xo64cyV
   g==;
X-CSE-ConnectionGUID: 1g7zxB83SJWrxnnTem4uxA==
X-CSE-MsgGUID: OTcAsRceQbyBTpddmaQCHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="46133022"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="46133022"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 14:54:48 -0700
X-CSE-ConnectionGUID: th3mqystSD+anxKarUt4YA==
X-CSE-MsgGUID: w68TnwEOTtq28fmVE7zKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126724049"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2025 14:54:47 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuIQ1-000DC3-16;
	Mon, 17 Mar 2025 21:54:45 +0000
Date: Tue, 18 Mar 2025 05:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [linux-next:master 9638/11415] ERROR: modpost:
 "th1520_aon_power_update" [drivers/pmdomain/thead/th1520-pm-domains.ko]
 undefined!
Message-ID: <202503180522.PzEJzKAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e94bd4ec45ac156616da285a0bf03056cd7430fc
commit: dc9a897dbb03dfd46c3bd2ce69e42e378bd12ca0 [9638/11415] pmdomain: thead: Add power-domain driver for TH1520
config: loongarch-randconfig-r054-20250318 (https://download.01.org/0day-ci/archive/20250318/202503180522.PzEJzKAB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180522.PzEJzKAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180522.PzEJzKAB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "th1520_aon_power_update" [drivers/pmdomain/thead/th1520-pm-domains.ko] undefined!
>> ERROR: modpost: "th1520_aon_init" [drivers/pmdomain/thead/th1520-pm-domains.ko] undefined!
>> ERROR: modpost: "th1520_aon_deinit" [drivers/pmdomain/thead/th1520-pm-domains.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
