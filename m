Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629A382F27
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782755100; cv=none; b=trtl4/c45XUpTncUl3dN9pKemU0eXPzoII549s9nw9q5gjAlwnmFfa3BgwnFxIrXHXaXw7xh2EgtIfPOuR9VcycIJPtXX9lVdON89a+lYpgjeuaBqpEf80uBpCduiUahqtYWV7hVJiD8DA2RWfS9aNZZTvIiXlIDzKyssy3Bsww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782755100; c=relaxed/simple;
	bh=EErIcWVR7Jd7ZZGP7EzSLAGxEFoBjIFgsMLeGUDUU7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hUGxlKh/eC3OVZzcUPRiZXEkxSdWC/5F1i08Pk0k0MT+3/XcrCnL1KU8TnFsbr067G+yMOFTSnsIFVln4S2UBlEDUAJqyqlhwC3zjV5OgCLoqFa9lHchtzv4jgFU4X1sitp5KAvI4dhebre0Im33hyir1pRiEJBiL5QulzRpjC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJNZ1FKW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJNZ1FKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782755099; x=1814291099;
  h=date:from:to:cc:subject:message-id;
  bh=EErIcWVR7Jd7ZZGP7EzSLAGxEFoBjIFgsMLeGUDUU7I=;
  b=JJNZ1FKWMGKkZUGCnrK/wnTghyG4qqrRNjkd/7++IEq2lbbToOIv9acb
   fqBKWOAfwMOzNkhpQI5k1qPGVPaElhk+Xizayg+Sm4/s3SmbNovhByZxg
   F0cpGbH0sBAxiQDBuHGlG+WJ7QGVvT07IGrJT5TEUcaAX1sZrksoWEuT7
   c5qN9w3Kqids0DkrkcpsA7KriClr3ZmKPsmooJVrRYGJr5lCtg6OvzWDz
   pm4hUSaPw7n4aa6rPEo2ktvXN1fSSQDfnr0qB/HRnqRTPYBtlTgWDU5LI
   CrE1xUx4agrZlUvyKmA7abeNSInW0JAcAOkIbKyA2kO66EZbeFfTDK6t8
   A==;
X-CSE-ConnectionGUID: 8IgcLWEVSjyyhCalxF7uYQ==
X-CSE-MsgGUID: 8gilylksR2GwWG7JnG6hpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94840479"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94840479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:44:58 -0700
X-CSE-ConnectionGUID: FbiZSiQgQDuJm8uHFPrlRA==
X-CSE-MsgGUID: sSOtf9m9SLWLW7tPjK/lfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="290148626"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Jun 2026 10:44:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weG2P-000000007d7-3lu1;
	Mon, 29 Jun 2026 17:44:53 +0000
Date: Tue, 30 Jun 2026 01:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 12/19] Warning:
 drivers/hid/hid-magicmouse.c:616 expecting prototype for struct vendor.
 Prototype was for struct tp_header instead
Message-ID: <202606300102.8lwUpMqI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   f77f12b8ae2813d2a707ad6380ebc492db8b7c2b
commit: 2018266c442b93a943726d0d6fca431ae02f4780 [12/19] HID: magicmouse: Add MTP multi-touch device support
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606300102.8lwUpMqI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300102.8lwUpMqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300102.8lwUpMqI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-magicmouse.c:616 expecting prototype for struct vendor. Prototype was for struct tp_header instead
--
>> Warning: drivers/hid/hid-magicmouse.c:631 expecting prototype for struct standard. Prototype was for struct tp_mouse_report instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
