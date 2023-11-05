Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973318C20
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMVk2l04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699220575; x=1730756575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w2FnluHHDnB074iePoZTz9vJmF50AMNb57s8kTvuYik=;
  b=aMVk2l04lGwZk5OhNpb/pvAFv5IREq1K4z/JWxcpp8AJOT4h8efSSxKb
   kGwGYp5ZgeXNC4hs4WzfCAKNozx3S2P4IP87wQfn3Barc+TAQFsZ2N3EH
   LqVeV1pj2RgVxBNPF3d5kQtpJSDOJep6X0gaHFplwQ/psj9G32ab35hYb
   g8xAa38hu8G+IIoNMzMi5TX3vMneFF06whNjP/Wx5mHMQS7vqhtWqs7Xg
   H4B7/2CLfP8hzI4o+Um3aGe22K/TjL0qYMidQtUKYJ6tHe5gi0bcZXOpE
   rn1z3Xt3kGWJIQ1M/fjDJlvSio2uyVQ4s+uJJbwNr1tfMAnWKs3bprD2Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379572216"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="379572216"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 13:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10276319"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 13:42:52 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzktN-0005oq-2s;
	Sun, 05 Nov 2023 21:42:49 +0000
Date: Mon, 6 Nov 2023 05:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 5/5]
 utils/firmware/mediatek/mediatek-2p5ge-phy-dmb.bin: warning: ignored by one
 of the .gitignore files
Message-ID: <202311060509.emx5CbK1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   557f7f4c3c2bf9abd7f1eac4d33490b23e49a048
commit: 557f7f4c3c2bf9abd7f1eac4d33490b23e49a048 [5/5] firmware: add firmware for r4 wifi (and 2g5 phy)
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20231106/202311060509.emx5CbK1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060509.emx5CbK1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060509.emx5CbK1-lkp@intel.com/

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
>> utils/firmware/mediatek/mediatek-2p5ge-phy-dmb.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mediatek-2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_dsp.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_eeprom.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_eeprom_dual_404.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_eeprom_tm.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_rom_patch.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_wa.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_wm.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_wm_tm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
