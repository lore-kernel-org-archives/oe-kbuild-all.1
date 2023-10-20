Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5B361
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 00:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HInTez4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697762859; x=1729298859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TklG5zq6MYjdSj824nGbNSbzw2Wlq9n7Xv1l1SMJuPM=;
  b=HInTez4F6LJhIQu0cOnd4rM9TPbhNAOeOCflt2o9RvH1ZxKTIDbwt6Hs
   QZhp97lZjppLctfI7CgLunD83362fuPeSnd/vQdaPA7ues6ULvVcrSrhh
   dPGDyq5XxzK18SbPar1n++9bVoe22N+QDBoR9Wmg1r9KePjWRjD1shRoN
   GGqkc+lIG0BmKBfFEvjQwQfl4XZVA5DSWxlTobyXCuMrDxFpHgE9m5Bpu
   OVQY6Yil1mJq0qb8i+Nxj1dQ/F7WyZzBKkueLwWhnRTcoCldj1lVIMTE9
   q/GTV2FXNK46aUSvI0W5yB4QGfKozXES3NgK6nrO9OQvjUxhVaasvYhCY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="376783650"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="376783650"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 17:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="880900946"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="880900946"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Oct 2023 17:47:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtdfr-0002nG-21;
	Fri, 20 Oct 2023 00:47:35 +0000
Date: Fri, 20 Oct 2023 08:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/btfids_5 11/12] /bin/bash: line 1:
 ./tools/bpf/resolve_btfids/resolve_btfids: No such file or directory
Message-ID: <202310200809.ufYOkCyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/btfids_5
head:   960fc70930b61365f1fc8d448796360cbd1edad0
commit: 8e7e6fc5fdfa9ab3dac3c9ef81847f9db6dcdb22 [11/12] kbuild: Add support to build with CONFIG_DEBUG_INFO_BTF_IDS_DATA_SECTION
config: um-defconfig (https://download.01.org/0day-ci/archive/20231020/202310200809.ufYOkCyQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200809.ufYOkCyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200809.ufYOkCyQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: ./tools/bpf/resolve_btfids/resolve_btfids: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
