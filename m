Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6293D668C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837120; cv=none; b=oisMxO4nISfCFEkkBIucwRedlzx5xN4NxgqnXPkOh87eHK60VPtE/cDzyAMC6baOoJ6Dw+JBLjwbkHeeTIT0C/upbWIyfobvI8HeEALaPZbSjPLxzLBMX+cerp/Ex8hVVFc8zwIhc1GvLsjFqJQ2Lw3u017aSrj7Hnw1V8XQL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837120; c=relaxed/simple;
	bh=7TDA3/taTYRncl1OCXDkDOA3ZrhNPzOxkoRbfZ2Zwew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f89qkzjAgqDXiffuy5j+8uFWwH+3jfZkYlFqpusZ4il53WlEo+xcuc2S4CRLTi3b1bMp84RxsrHyduI7X8IpKxHM1zuy/W7QyW855Z7YWFBtjFoMRcA65l8d8fnxZfRAZAo4n2kz6ul04ihlt3cVIbNCwo/ojHu5kQN7aJgvWRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOsQLjMD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOsQLjMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773837118; x=1805373118;
  h=date:from:to:cc:subject:message-id;
  bh=7TDA3/taTYRncl1OCXDkDOA3ZrhNPzOxkoRbfZ2Zwew=;
  b=nOsQLjMDvgcE2ktivbPxwwrMsROj8pruD/jC8T3/UQXL1PY22TF/h/9k
   k1Tu52Ja8oeishxQorq+680+nlP3Abcz0+2Gry/f6DOJRnJZamOwi0x3U
   ZvTrNsd5yPdzc9YgoRnQnKCU2q9LtBFUvoL+2KHvxB0RWLpvYVx4ACa2I
   e/b8hvUF9jp80voFw2xxyjWeOpThr9X7VMPegy+zikIsI1wIqU3SwS06C
   bzbKOlWAawHq0wIvr5d+vXOf91lVJN3qtY1cXCQpRkPR0TbcrDY9ukZon
   ZyzQbx2PmmlM4Z7QjM8Seq81yHwzHtVRS9DIrm1TKyYpS9xWLyFhVBeUZ
   A==;
X-CSE-ConnectionGUID: +ZVKGoVYTbGS9vWStRYUIA==
X-CSE-MsgGUID: RZqUvekxQ/ecU8SA5PlkoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74861786"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74861786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:31:57 -0700
X-CSE-ConnectionGUID: 8srx4lwWTnS7n5wWBGFuyQ==
X-CSE-MsgGUID: jthjVyaLQy2u6lURKXmoFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218644398"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 05:31:56 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2q42-000000002tp-0utX;
	Wed, 18 Mar 2026 12:31:54 +0000
Date: Wed, 18 Mar 2026 20:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2] Warning: mm/cma.c:288
 function parameter 'gcma' not described in 'cma_init_reserved_mem'
Message-ID: <202603182048.ERawjK0j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b0e662fb17ec139a265b282999e920fe1f021414
commit: abb7c88dc2ee1567f73d54212320789301304f3d [0/2] ANDROID: integrate GCMA with CMA using dt-bindings
config: i386-randconfig-002-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182048.ERawjK0j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182048.ERawjK0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182048.ERawjK0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/cma.c:288 function parameter 'gcma' not described in 'cma_init_reserved_mem'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
