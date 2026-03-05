Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262723F431
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 01:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674203; cv=none; b=jp1OrSfWV9hxk68RxqsvatHHpC4AIpksFBIEDPU7CNBqKcFmB5tZBWmWUQ2dXgaGMg1ik0sjykjEUQQia6HXoGhPwZM3mxrlFD1dZTSH2/jSXKBITfqh9c+vEEJlGK7aZoXmqHYB5f4+NcMPxdWQjGne2OlOLB0h/27bnvRqWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674203; c=relaxed/simple;
	bh=5eAJrlVESjOXxJgE7S6hHnBZfz0Zweldvt25Yx3SUps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Re3ALZAmvI5fetNjx1nLEn9d97hKumMZGw3pPxbv8TRjEKq0QOGBkVN/9LBArBnTkMdtOFIKx/6pbEMHUf72izECxux5ZULHTldojPlOxMxr4KapD6487weMMTzAV4eCDrZA/tTVPNUbQxLSQ8SQ/xhHvooD6DML5CN3S1HzLjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGCI2ArH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGCI2ArH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772674201; x=1804210201;
  h=date:from:to:cc:subject:message-id;
  bh=5eAJrlVESjOXxJgE7S6hHnBZfz0Zweldvt25Yx3SUps=;
  b=WGCI2ArHoHoPwzRrpKwpOLB0IU5OKscmUk3H1IKsLK1PqoGixV+qAtU5
   yCtuw6y8Dpta5LEtnZbsaXUy98DOHLKbjgSQgEafMLBrq7tYnkHcOLAAK
   cZepXfKO2xaRBU0Ngz9OxAjRns8XLhCM/uGMiFMEICRmOqVwLS7f6nxxi
   NsqqmExytCCqJM+5545HBKNnSkf5739EwjA/J/LnXBNZTFxYZ/4IEght4
   /bjX2OYAcg1rsQbPKmk2A1uCsZLrILFuc8SQw/92+tmALusb4q4Ri4si1
   qYi/Goyu77808WNKt0JAI4ZGMC48Kq+OzeDBy/5WyYPAX25wzeCen4nF5
   w==;
X-CSE-ConnectionGUID: P+TlFkfwQrOByobaCqg5SQ==
X-CSE-MsgGUID: 2UfaOkaGRxmPNGFPj4NQ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73941194"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73941194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 17:30:00 -0800
X-CSE-ConnectionGUID: sNYU705FQbmEeq67Gp1WRA==
X-CSE-MsgGUID: 5xOSC/h9TLiwQJ4N/P56/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216813734"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 17:29:58 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxxXI-000000004wJ-0axC;
	Thu, 05 Mar 2026 01:29:56 +0000
Date: Thu, 05 Mar 2026 09:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.10.y 0/334]
 drivers/media/dvb-frontends/dib7000p.c:2203:6: warning: mixing declarations
 and code is a C99 extension
Message-ID: <202603050956.DLVOlTz5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.10.y
head:   aed5c3b77cd53ba74f66767b03bfb9177662af4b
commit: b3d77a3fc71c084575d3df4ec6544b3fb6ce587d [0/334] media: dvb-frontends: w7090p: fix null-ptr-deref in w7090p_tuner_write_serpar and w7090p_tuner_read_serpar
config: x86_64-buildonly-randconfig-004-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050956.DLVOlTz5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050956.DLVOlTz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050956.DLVOlTz5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/dvb-frontends/dib7000p.c:2203:6: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
    2203 |         u16 serpar_num = msg[0].buf[0];
         |             ^
   drivers/media/dvb-frontends/dib7000p.c:2224:6: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
    2224 |         u16 serpar_num = msg[0].buf[0];
         |             ^
   2 warnings generated.


vim +2203 drivers/media/dvb-frontends/dib7000p.c

713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2195  
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2196  static int w7090p_tuner_write_serpar(struct i2c_adapter *i2c_adap, struct i2c_msg msg[], int num)
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2197  {
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2198  	struct dib7000p_state *state = i2c_get_adapdata(i2c_adap);
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2199  	u8 n_overflow = 1;
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2200  	u16 i = 1000;
b3d77a3fc71c084 drivers/media/dvb-frontends/dib7000p.c Alex Guo              2025-06-15  2201  	if (msg[0].len < 3)
b3d77a3fc71c084 drivers/media/dvb-frontends/dib7000p.c Alex Guo              2025-06-15  2202  		return -EOPNOTSUPP;
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04 @2203  	u16 serpar_num = msg[0].buf[0];
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2204  
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2205  	while (n_overflow == 1 && i) {
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2206  		n_overflow = (dib7000p_read_word(state, 1984) >> 1) & 0x1;
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2207  		i--;
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2208  		if (i == 0)
5a0e2a4e936d04a drivers/media/dvb-frontends/dib7000p.c Mauro Carvalho Chehab 2016-10-14  2209  			dprintk("Tuner ITF: write busy (overflow)\n");
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2210  	}
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2211  	dib7000p_write_word(state, 1985, (1 << 6) | (serpar_num & 0x3f));
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2212  	dib7000p_write_word(state, 1986, (msg[0].buf[1] << 8) | msg[0].buf[2]);
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2213  
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2214  	return num;
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2215  }
713d54a8bd81222 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2216  

:::::: The code at line 2203 was first introduced by commit
:::::: 713d54a8bd812229410a1902cd9b332a2a27af9f [media] DiB7090: add support for the dib7090 based

:::::: TO: Olivier Grenie <olivier.grenie@dibcom.fr>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
