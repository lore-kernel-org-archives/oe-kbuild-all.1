Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC1174C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689714683; x=1721250683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C4IZZ9coCOaJerHTSRSzhc7vTRckbsSaaxuGuMhEEaY=;
  b=KHxCzXp9Z3eUQbC1K4m7dKaeScPmU8OG4z2ObUZWFalS4wNCKLEIZTpw
   44SHzhQVp/qGrF2UHalIVKx4OstQaGzSwcsejSSHefzGhxPK9qRjTUjkx
   uYTZmpPySqMm8Ww0JTGfMSTFYSi6LuzI4z41ac//vG6mONTYdC+UzkIi4
   ziJwvJCKgTMBogvD5U03jNDy+nvPxlqrf6BtcxkRQVLWbmVMgPg7kR0Af
   WMe/kk0ouA8LVNioLnubiJq6YaUOnhA1WrMPqHti63hPtsGY/3sIWoFt0
   LxbIyAwzDhJrsxmW1MVZZPLBJGs6h/wm4FEks/KrDoPoNg4ZfdYNd90E6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397161770"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="397161770"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 14:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="727096388"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="727096388"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2023 14:11:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLryY-0003tN-22;
	Tue, 18 Jul 2023 21:11:19 +0000
Date: Wed, 19 Jul 2023 05:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-mt7988 43/44]
 utils/firmware/mediatek/mediatek-2p5ge-phy-dmb.bin: warning: ignored by one
 of the .gitignore files
Message-ID: <202307190518.13UU3sJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-mt7988
head:   35d2b1490f09427b4e80ff4172af889a78628dca
commit: e7cc6b78fb84f75cd911dfaa8eef20f0be21b8b4 [43/44] firmware: add firmware for 2g5 ethernet phy
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230719/202307190518.13UU3sJI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190518.13UU3sJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190518.13UU3sJI-lkp@intel.com/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
