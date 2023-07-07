Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CDF5381
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688755688; x=1720291688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2Y5+rTIGN6apADGLqhwQrYf4VMUisHriOXOxoVDFSw=;
  b=gwuG95Xn0fiLT+cL1WSf9DjWoxl4dm1U7zIeFLwvPmdd515XPqzmdV2P
   IAwQmGNsxKE+fLlT6/INQmNZHpOq13/viIDpF/K2IrdDR5j56LjZpUx8E
   bcft4Wejgj1fgUYnDtEVSjVRB7aHD/pwRze2+1DyvtxJL+c5LmfCtxpcR
   9Cu+OEYfKftvqxcsBZluGIbwlbnv60jkbgE9HsJlbfKIi4xqkCUduQL4D
   2uDOwSzAUj8JVe19btEs7fPOC05Tv8gKAJWAOPyAlA9aRjZd8Z7br/aul
   ZVwEEszeYXLew5W23YfsLeDbbTPpcLs0vujyAty8fAit13YIyI9resacP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366543750"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="366543750"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 11:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="864652642"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="864652642"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2023 11:48:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHqUv-0002By-19;
	Fri, 07 Jul 2023 18:48:05 +0000
Date: Sat, 8 Jul 2023 02:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx6 2/9] ERROR: modpost: "bpf_mprog_free_rcu"
 [net/sched/sch_ingress.ko] undefined!
Message-ID: <202307080258.Bu5Gn3Ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx6
head:   2ca9ff83199a6107914894a890b2e425b00acacd
commit: e32fa7a0a789107cff988f10978f5c07007105d4 [2/9] bpf: Add fd-based tcx multi-prog infra with link support
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230708/202307080258.Bu5Gn3Ua-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080258.Bu5Gn3Ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080258.Bu5Gn3Ua-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bpf_mprog_free_rcu" [net/sched/sch_ingress.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
