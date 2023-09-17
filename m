Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54712EA2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 04:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694925849; x=1726461849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9SrpjqlCeNa7z2s2hc0244OOpnADIFOsXgvKlzL2RBg=;
  b=aQ8Bv6J3/0skg/WtFO9tXvO99Fr2IwHPL+4XT5oFqobyIqqT+VWxzJRk
   5G7M4JT/yEaDNzbimhXmshGsd7Tkcb8N+l5V86waoiglvfknUy9jXA49X
   gaf41MSLOmcK/F4IObGXeSQkDqLO4shF0fsK3304eVUR5l+Id5fYAMAUx
   gLQTi9XHWbVO79Tjqb8s+Qz5WpW5KsWQzF2mFntlT+kRD4TE3Iu6oZfen
   A6NPa3PIz3tc9vhB3R+1Fk/M4YmThMOnWGolanlqIaJRJSRucUFlQXIxL
   EAcc6iO/7C860zhzHUokk4XCMrxizsX1Hb12qlzdic0EmZ9JCAYuPJpz4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359720001"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="359720001"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 21:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="888664912"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="888664912"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2023 21:43:28 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhjdd-0004wu-1k;
	Sun, 17 Sep 2023 04:44:05 +0000
Date: Sun, 17 Sep 2023 12:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-next 19/29] lib/lwq.c:118:2-3: Unneeded semicolon
Message-ID: <202309171249.n0rBFvdw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-next
head:   078f32da1096100ff82a4d4f76f06af4e7afd321
commit: 0bd143da74f6989a4a234f387677dbae95e13bf9 [19/29] lib: add light-weight queuing mechanism.
config: x86_64-randconfig-102-20230917 (https://download.01.org/0day-ci/archive/20230917/202309171249.n0rBFvdw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309171249.n0rBFvdw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309171249.n0rBFvdw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/lwq.c:118:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
