Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161EB3D78
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690748147; x=1722284147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPa33QU6EHvLowXEV4Ivhx48w5xpJXBJujUUVl4R9w0=;
  b=HiSDXe4P1P13kcO2xpmcJugBgV2Y+WikllBaTez+eDIaDS4sjQJKVmV7
   WJUk0nb5IDStCMtMJxwlaCABwWIF2rBKBfPqtV2KRWFfQK4G2wQUtZwnD
   cvbvZa9yjXCi4st9Kptr45AAIp1J+FMlqAQClEgfO/cLFDFTTWASfBcZt
   WFKFrqmdV0r6vFS4qaMYtYg7Bh0jB7oy0T2JIeQjWbR8YK1unJTl6eaGP
   Pk+rFQk4u2tDu8oAgUxQ3fDGm+SvXrZI33hrYr43gGiymlOcCB+PhVN0H
   fsrAYpqfLAbPxF8xe1qiykaP7XZZjPLF7Lpg7qK6lEHEYrj/d7w9qJVn7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="367764434"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="367764434"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 13:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="728072373"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="728072373"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jul 2023 13:15:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQCpM-0004lN-1l;
	Sun, 30 Jul 2023 20:15:44 +0000
Date: Mon, 31 Jul 2023 04:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-r4 50/50]
 utils/firmware/mediatek/mt7996/mt7996_dsp.bin: warning: ignored by one of
 the .gitignore files
Message-ID: <202307310420.cEjTtiMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-r4
head:   12662b8da30efa998466c3f2c6a8bf4e20622ce2
commit: 12662b8da30efa998466c3f2c6a8bf4e20622ce2 [50/50] firmware: add mt7996 firmware files
config: nios2-randconfig-r015-20230731 (https://download.01.org/0day-ci/archive/20230731/202307310420.cEjTtiMo-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310420.cEjTtiMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310420.cEjTtiMo-lkp@intel.com/

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
   utils/firmware/mediatek/mediatek-2p5ge-phy-dmb.bin: warning: ignored by one of the .gitignore files
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
