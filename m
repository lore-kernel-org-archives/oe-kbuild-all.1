Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F27CEA5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 02:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690165594; x=1721701594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LNy8yj4jkK0MnpU9SV76+ah0kCUOK5ew8LR8F0qj/IU=;
  b=mdMwB2QVUg/zEVJkLXQRMgHw436FGbvi7CrEqz0K4CHLCkH6/eIZ4T9H
   WYs0A0q7Dc/zBp+vqZEt59+uY7kXMAR5IOuqE34Jjuj6hwF1Qdd4/ML5X
   45vZuaFZ1AedlJk69i2vaSa025+JstEk/RF0n0DkHvG6lweKFA4l6jGCo
   BM7fp0VuPPEuNfygWNQzH2c/81YMLF+05rcJmy6qJYxKiTJEgT/89d2m9
   OmPv1Si8SvcpORurJkbInrViM3CpE4cUPT7k7ydFwvTEAD2XnZHZFao3l
   zgrJfH9BTPAOKqVRPysC2jeFuCfG729ShsLdKr4ZMU0c8/X2cDtsvRepb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398230422"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398230422"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 19:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="702693700"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="702693700"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2023 19:26:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNlHD-0009QP-24;
	Mon, 24 Jul 2023 02:26:23 +0000
Date: Mon, 24 Jul 2023 10:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Drew Fustini <drew@beagleboard.org>
Subject: [esmil:visionfive 75/75] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202307241058.6VMfj8Td-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   67e2a22c34a5e14f77710f1276401e483e14bfaa
commit: 67e2a22c34a5e14f77710f1276401e483e14bfaa [75/75] [NOT-FOR-UPSTREAM] Add build instructions
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230724/202307241058.6VMfj8Td-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241058.6VMfj8Td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241058.6VMfj8Td-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> firmware/brcm/brcmfmac43430-sdio.bin: warning: ignored by one of the .gitignore files
   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
