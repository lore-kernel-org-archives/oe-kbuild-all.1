Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065335;
	b=vd+bm2ykEJ9ieQKuJAxlNlYRGIdXLH1IdXr5SP0ajI8tovdwkiqnyYqP8+Ta0I9Y/HS3
	 Q9ABxJ2EjJK91UT7VEU0O9daNJUpmE/ONCv/EA6JnCnR904iZ0JZa8fHwGkquh4Vpiz1/
	 3ZlSpiH1IqfxLusqTtsmeN4z52kG4y3K9yI/ubIQCFiHHQL/BXV7KNq+RboZnm0jy6/Y3
	 uO2IOX6LQ26G3GyZImf/wpVAD+zwDvEuYeYhgtpICuJWb4eRrJ1xG/xlfZL7kwMHU3tDW
	 F+64EOo+ECVn5UfVM+AdxZphykURZWN5Dtk6ZYgt49ybmsGir4d+6C5jTZmyLYAeqdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065335;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eXlnNi26eOgmyS8RD5b1M48GZVxrkV0LCfid5fBl+d4=;
	b=VxDoUd6vuLVZuPy5ETpx30XW3H0gwWGZIJsj20bHcJ0CifIspSgursu+9vrxYoopREK0
	 LVOS1AZ9L6Rjn/GQpLnX8HFEd6iQghpVOsM4vurNp5X+68TYY8eS2k/e2WJnp7BIExgW5
	 lFwYD9hgvCVLpz9OUWnTq/WvVsePUaWHMyLs+obkYCpV5ZzM1BKDZJZpsDYOoQlpEjy8q
	 P78HdwAqE6N9Pbq1ncnVAA2X4UKHeOCcxOcepGiVgiAImGmLz3us4rgxz43BpFgMUOFjX
	 a4Vh4a7/VJZW1zjOsjQo6qp8wJvxWm0s6X9dB57UWSLxN+7KnGnmCknaEY9VzUrH2Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kL+gI01l;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C2606A32F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 15:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89C2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kL+gI01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794065334; x=1825601334;
  h=date:from:to:cc:subject:message-id;
  bh=H+RI7f3Zbx9Oe3qGZ9nct/Nyaf/mBn4ucvf9ipJHNh0=;
  b=kL+gI01lq6f9sxzqFBrpbG9c91KmxWPWAt2cNSOm+CY5aFsbyyOvUONv
   PumykFdFyAo7JTvcsN24jrzB8pfMIZYHgt6jXbWwQwyCi7QF3nS26R/t+
   2dCeOeB3/D10MQB+PHhO5zR2s7u3+RqjuUVrpfEvi1BbwNPGudr/hwVrV
   r093fhcK9B7PVG/COnrRFArwSMtqCFVB3CEa0AxclxjNrONX6V4yxupaw
   ZgIqBfFpaADNsPB9beEl7mhcJ+8oQ0z6Q4kC6XlKlZRuGtVZjqt1Rnaen
   Q9TRivc37TgbTAbmTj2uQuwFgzRou0Xs1E67u45VQ7dAu0hWx1gX47kqu
   A==;
X-CSE-ConnectionGUID: xw716k31TcyLhVquYSp6BQ==
X-CSE-MsgGUID: e4nA4BdqQwuZ5fKUaJucTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2858332"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2858332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 07:28:53 -0800
X-CSE-ConnectionGUID: p+bsvaXbRYapqVGIM3uEVg==
X-CSE-MsgGUID: hIczwddbQJ6OyAgc4uLzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7397576"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2026 07:28:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPiLZ-00000000r6B-0wuF;
	Sat, 07 Nov 2026 15:28:49 +0000
Date: Sat, 07 Nov 2026 23:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [mm-page-alloc:page_alloc/for-next-fixes 5/18] WARNING:
 modpost: lib/test_bitmap.ko: section mismatch in reference: strncmp+0x24
 (section: .text.unlikely) -> __UNIQUE_ID_addressable_init_module_206
 (section: .init.data)
Message-ID: <202611072346.LgjhdXj7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mm/page_alloc.git page_alloc/for-next-fixes
head:   2c4bc0176b275c4af9b1b1e8f2386ee8dd428d5e
commit: 9c52ebe9c89d41c56fcb5d94efe9e539414175a9 [5/18] mm/mmzone: read the zoneref slot once in zonelist_zone()
config: xtensa-randconfig-1000-20261107 (https://download.01.org/0day-ci/archive/20261107/202611072346.LgjhdXj7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072346.LgjhdXj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072346.LgjhdXj7-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x10 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: lib/test_bitmap.ko: section mismatch in reference: strncmp+0x24 (section: .text.unlikely) -> __UNIQUE_ID_addressable_init_module_206 (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
