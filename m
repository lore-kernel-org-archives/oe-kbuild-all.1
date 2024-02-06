Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4047F7F4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707196856; cv=none; b=KSI8G0OUPz4zR3Ui7FlNLm5NE5cV2PDKu3Obz9JUsrlQ/4bf9Emq8RWr2LPN9I8Yxg9PR7x5cSLCBa7UiqyrhzHtzj7qLtKJPyS7yfEXgEuTtUsNC1IUg4385lNq4mKYd0LJcSNHnXqDrWiVkOCtbqZ6JcCxXYTpnQsBldWeEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707196856; c=relaxed/simple;
	bh=FwnTT6D/+pcsk1A89odlq+HAVqKeNiQ96qeF09WG99o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jLCNkbY585Eo2mm/Pw/1Ray0ayp/ztF57KbfMKNltbgvAtX6uunjKBA/ZfHr20dKmMvL+0usiFfvnQZPtGIQ30daUURwEutLCXSGxtSWyjwhc0saK/WFj0E1V6Od6ToTVK4nAhpxNQOjKm+cRkOk+nGnK97fnTn3pXa1dwfWZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGvj76Gl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGvj76Gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707196854; x=1738732854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FwnTT6D/+pcsk1A89odlq+HAVqKeNiQ96qeF09WG99o=;
  b=NGvj76GlfoJy/oP1dOxth8tF7VcDEFKfj1liUw7nXHpfEs5tcNCDPFL8
   fYoarxb+BXTzQhJnBqyMGdcBiM4XbyKPI29w9NksqC9FkrrOxUO1SXCSc
   PM1Zh1MTE5ZXg8bTfr8nBqJaREnYghzn+IbqY7in55HKuJV0HpdG9osTT
   abtXJM3HZhMOshsyoUmjyxlhTtVIPuntAKwzRn8a10vi+MaV/kyLdMLqW
   BAkP4IO6j3GOnBu1Pj0oh37NICEgM5eoDzCjeK5fC5kpqoKmfTbM/pXH8
   JqGCMCK4NufuHKAd1Ek/9B3KZWQXBKbDmpE3VvtvWhubmffa5maBm7Ygs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11320683"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="11320683"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 21:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="5672793"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2024 21:20:51 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXDt3-00015Q-09;
	Tue, 06 Feb 2024 05:20:49 +0000
Date: Tue, 6 Feb 2024 13:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16749/21616]
 drivers/cpuidle/.tmp_cpuidle-haltpoll.o: warning: objtool: missing symbol
 for section .exit.text
Message-ID: <202402061323.krZA8tkb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 8104395ba98a81c8cb1ddd245482baca0d57d163 [16749/21616] add cpuidle-haltpoll driver
config: x86_64-buildonly-randconfig-006-20240203 (https://download.01.org/0day-ci/archive/20240206/202402061323.krZA8tkb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061323.krZA8tkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061323.krZA8tkb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuidle/.tmp_cpuidle-haltpoll.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
