Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57367207B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 22:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAO+XocJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702940076; x=1734476076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/XJuBswUArSE/maHI98hsbXXamPQ3bTHdY74mFQgZI=;
  b=jAO+XocJ2LqsD3/yc3HYYzVwVJ2/Obw1tVeQYPQG5zIQ8zyj5RGYFaE7
   eveU5HC8yYEHailqsHlL1S1zyPxyrGvoDcLoabWsUm+6ZdVgz11rtc10E
   kLSCgURpQGyNn22xjDNtzo5SKpfg6VuaCwsew/Ry2/9ZX1LKJg8GjSceF
   jhySQKYo2qkLKF2orYcyQwi3/33bIpxDPqR535a6IDof8w7NQ5lQOYDwn
   ei/N3EuHMjK9FyUAqeRvHHTE5L8f07h42Nly3vMd7MH2ut7qcJ34ZG1xb
   qHoNqXV/WVpr5NS1H/K1PpZSOeaYbOyGLxX+KPfMEZTWHYCMnS6APEh3L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="459917339"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="459917339"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 14:54:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="804680832"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="804680832"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Dec 2023 14:54:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFMVM-0004c5-1F;
	Mon, 18 Dec 2023 22:54:32 +0000
Date: Tue, 19 Dec 2023 06:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Beau Belgrave <beaub@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: make[4]: *** No rule to make target
 'tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko', needed by
 '__modfinal'.
Message-ID: <202312190604.D3PQYa8D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Beau,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf4f94d8e8646803f8fb0facf134b0cd7fb691a
commit: e5a26a4048eeb9558e5c84f340a989c78db4adf4 tracing/user_events: Split header into uapi and kernel
date:   9 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190604.D3PQYa8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190604.D3PQYa8D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko', needed by '__modfinal'.
   make[4]: Target '__modfinal' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
