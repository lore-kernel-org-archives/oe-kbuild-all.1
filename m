Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471351B285
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 23:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EywrQTZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699830934; x=1731366934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wiLKaXgEsTgl4wxIt1+snn2POgBUTXnyuHElNrkvJr8=;
  b=EywrQTZ9XRzua8YoSP5i8dxcjM2a/2r0TLNFNGZBn34fjPYOdwHqayrz
   khzpxEK3lk6M8cHvltPiKHmJ7xUP8f6yv+0EYSrNfD8WVJSFYtUgY12Ad
   4sfjY3IzdTbA9T4wylmK0vCIVvtIXO6v7vXT/O/eP0b6vloZbMJf4Xubn
   IF+MQzB+3QzFzYQvyrWM+3vk9gm/t3eurFIoCrjhwBFGHObgD/p+donIt
   ubGU6IX5AXk8FP67ezp/QyHGhz6ooHROBiawue8La0n/SOFT89OJyN+NK
   dK9eNFC9K/iVBdomrMAmZJNGTdnM7WVbKTe9tuwFmSRb3N3cGUOTnCQYw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="380746917"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="380746917"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 15:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="937605823"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="937605823"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2023 15:15:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Jfs-000Bbl-0O;
	Sun, 12 Nov 2023 23:15:28 +0000
Date: Mon, 13 Nov 2023 07:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r4-dango 1/1]
 utils/firmware/mt7996/mt7996_dsp.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202311130717.F83B7N6F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r4-dango
head:   a5a598d7e673122a9029ab02546923a7e30ed809
commit: a5a598d7e673122a9029ab02546923a7e30ed809 [1/1] util: firmware: add firmware for r4/mt7996
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20231113/202311130717.F83B7N6F-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130717.F83B7N6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130717.F83B7N6F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files
>> utils/firmware/mt7996/mt7996_dsp.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mt7996/mt7996_eeprom.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mt7996/mt7996_eeprom_tm.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mt7996/mt7996_rom_patch.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mt7996/mt7996_wa.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mt7996/mt7996_wm.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mt7996/mt7996_wm_tm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
