Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25671402B8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132232; cv=none; b=UaiZCuCQK2ZcVeS7vxwan5RfI0FAgwi2lle6LIEkUWtLuKxhH9hQru/O+/ltjIPC2PPyVL5nx+6LjjbjwPvTQJQWistCduxsWaWMrsLGYBhqtt/H5dJJxIvSqq2FqYsxFWcya+Tnb7bnGjD1uW9dzmcqjGvdiYPyh58Lbyl9K1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132232; c=relaxed/simple;
	bh=Pkk56UhXNUwuMiFfh3EkZyfbky2uzihOpy+35lWnefQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t1YkTalUbDqENhymemtO7A0xw7cZ9JB+EM85znkxAoDg3Cnx3hAbhZQmLoThUbueRlcgs2UFXuGTynkzM8eljbK0AAG7l8wdIQ0aC9WPq9UdDYLXz7pgwGIx5ajFB5baADAyQh/bXrebhcUKaLml9afpDu1gJivmqC16guGS3lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esM19kcV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esM19kcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787132232; x=1818668232;
  h=date:from:to:cc:subject:message-id;
  bh=Pkk56UhXNUwuMiFfh3EkZyfbky2uzihOpy+35lWnefQ=;
  b=esM19kcVKGNcDqo0amQUQiRucYHEGyLpQKlIf+7wSrTSw0GoKZKOZn1a
   IulWkzD8dZlyS8CgdLW/KSlVXpFgDfo4V9KZRCZHJz58WAHZleYuaxeg4
   7nhL7vAc0Ef1VwAS9tsGV/KpS6AJJlegbv6N4R8OvSgqyceUJqiBKs/DB
   SnRFDe0wvIhwPgPVG0n67QcxxgEG4xay6HwCExi7YOMnizQCadq63QnGk
   HMyx2P42qKMAPGBvQWF2SOhIv7W5+Ajfv/Az142HMPSou/PwjNa5e9uov
   GUxI6RQoKNE6aWRPRF/JumruZa2XbOP+Cgw3AW1KYqO5qTSmvwZVrnF9n
   w==;
X-CSE-ConnectionGUID: EwjKd4ySSxibJD6Zmg6BEw==
X-CSE-MsgGUID: kPB/AUF7QrOPysMsMcTTyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99167648"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="99167648"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:37:11 -0700
X-CSE-ConnectionGUID: RrccwPsOQVW3qKgEvqbr+Q==
X-CSE-MsgGUID: 0e6tHwiFT/OLL3Z75l4D1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="295405398"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 02:37:10 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwcjL-000000007Mf-0MO4;
	Wed, 19 Aug 2026 09:37:07 +0000
Date: Wed, 19 Aug 2026 11:36:34 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 198/200] htmldocs:
 Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to
 nonexisting document 'hwmon/max197' [toc.not_readable]
Message-ID: <202608191100.NpT4Y8jp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: ac9888639e961ae0a4bceac5a00698724ae1a940 [198/200] remaining driver removal
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260819/202608191100.NpT4Y8jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191100.NpT4Y8jp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to nonexisting document 'hwmon/max197' [toc.not_readable]
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.


vim +19 Documentation/hwmon/index.rst

7ebd8b66dd9e5a Mauro Carvalho Chehab 2019-04-17  18  
7ebd8b66dd9e5a Mauro Carvalho Chehab 2019-04-17 @19  .. toctree::

:::::: The code at line 19 was first introduced by commit
:::::: 7ebd8b66dd9e5a0b65e5ee5e2b8e7ca382ec97b7 docs: hwmon: Add an index file and rename docs to *.rst

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
