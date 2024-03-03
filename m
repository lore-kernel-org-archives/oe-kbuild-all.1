Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD12C2E9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709468396; cv=none; b=bzpNLMHVgxzv09JwBvzuZ82N+PPGox5X+IcjfBV6qLhiTafKmGJ2bzM6GbWbj9To6bhX8XPXDtmYHYiOjA6UvC5jjlS8eH2KuI8Hf2lILFb21viaNBoBOxatMmS4yg0XcNhJKKmysLkrzOfEooZzwvNbKgffixYGcWbpDRUlY1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709468396; c=relaxed/simple;
	bh=ZV70JgJ6kfqaxA1G9YTG4a6g5BGHnChMIGMjnuwZSjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJzaSSUMrWsLHUn8RMeKtkZeWHij24LO18GpKz/Cgki/i6QgEi2MSFGhp6SzgJfqerDEqaXNux5prpcrYv6iPUltHyYIAEtnGNMQxXkocjNycJzWJCvMmhgj6I+diY9AXAnxwgo1SF4Ea7mJciT+ueR5+64zBQrnpXFkelcBq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beAAYu9/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beAAYu9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709468390; x=1741004390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZV70JgJ6kfqaxA1G9YTG4a6g5BGHnChMIGMjnuwZSjI=;
  b=beAAYu9/HsPK2XEy93RK1pRXinjY67Zh03VU1/6hC3oCqYaMeJLYc+9V
   Q3ZsFMWeqjtM8M0+2rb0ikS9V7tJMbiHrYJ0nO2DzaUZxiv0SXCSQRFbL
   XqPV8mTwpjkhZUSSZWh6h9iQ/IpZcOyeDuJe8o6n1Kw8dAAhLMfiZCbrB
   FT+lMFREMv9ciSMZkUqZjb7F0oE7DtdFiynsK/aUcN+xMEB+s3SUxF2gY
   C3U2AeZ+SdDEa/rjDe+UY0vYUZWjQZhiY1QNrxQjoDjiz4/FiZAwhmTnw
   XCXRHEh6HA7D+HI+ek4E61UwWRYos6+bldMyAV5QbGT9gPKaAd0o7Wpy+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4130993"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4130993"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 04:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="9149365"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2024 04:19:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgkoj-0001l6-06;
	Sun, 03 Mar 2024 12:19:45 +0000
Date: Sun, 3 Mar 2024 20:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt-rebase 85/29558] mm/zsmalloc.c:493:30:
 warning: 'zs_map_area_lock' defined but not used
Message-ID: <202403032012.9JuyAAe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: b1c86ee2f75b9bf19caa3b01efb61891e3acbb37 [85/29558] mm/zsmalloc: copy with get_cpu_var() and locking
config: arc-randconfig-002-20240303 (https://download.01.org/0day-ci/archive/20240303/202403032012.9JuyAAe4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032012.9JuyAAe4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032012.9JuyAAe4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zsmalloc.c:58:
>> mm/zsmalloc.c:493:30: warning: 'zs_map_area_lock' defined but not used [-Wunused-const-variable=]
     493 | static DEFINE_LOCAL_IRQ_LOCK(zs_map_area_lock);
         |                              ^~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/zs_map_area_lock +493 mm/zsmalloc.c

   490	
   491	/* per-cpu VM mapping areas for zspage accesses that cross page boundaries */
   492	static DEFINE_PER_CPU(struct mapping_area, zs_map_area);
 > 493	static DEFINE_LOCAL_IRQ_LOCK(zs_map_area_lock);
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
