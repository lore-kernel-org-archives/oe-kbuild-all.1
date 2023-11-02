Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A89125A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVIA0E0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698936235; x=1730472235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KuT/znOqvMfZDx5ONFhilKeZbceO1WblLECj/570lM=;
  b=FVIA0E0hrr77EvBeVunDgvYyk75ay0qFJCHpsYZjNk57M5G0BpAn+6dw
   WpqQBJmKdsGYSBULfxxfp5u25YQy/4TNbGxORZq+mC0ONZJinTGzAuuLA
   8/XIDKgWW3HHVUAPNYBXt62uw+lOiD+UE8G0jgIvfn7vblM4gvzNzp7+y
   IwkoPfxP3f0Tb7dWFMpW56zqwuu5yy6iEw8MzFNOLma8lEEmrOowCQMiP
   f9g4EkY+UpczZJNQE/XA51ejsTlt/WBNo7IwllxQkG7m/xJ6z+udEZRWV
   T0z4t6gaPctMi6IPg3+wNePZR40pV5YfftePl5SDf5Wg8c8NXQoSj5Ppl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388544520"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="388544520"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 07:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="2450076"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Nov 2023 07:43:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyYvF-0001Wi-2B;
	Thu, 02 Nov 2023 14:43:49 +0000
Date: Thu, 2 Nov 2023 22:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Drew Fustini <drew@beagleboard.org>
Subject: [esmil:visionfive 47/47] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202311022211.PErlU1A1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   f20633e6824b415b4926e353c80e6fe0951a8f0d
commit: f20633e6824b415b4926e353c80e6fe0951a8f0d [47/47] [NOT-FOR-UPSTREAM] Add build instructions
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311022211.PErlU1A1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311022211.PErlU1A1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311022211.PErlU1A1-lkp@intel.com/

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
