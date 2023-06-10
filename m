Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921F71878
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 07:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686380904; x=1717916904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bziLaReYEhZNopiKQ5/R688YOKXcWPxi5ilykFeeVOg=;
  b=hFbum+GoyfO1/7wBL13Ce6/F0/csZl47IyycCsiN7ZDxZb4/PexuhxzL
   qq8hJslYr6t1ME4/pTgofJijWKiTWalRW/c4rPVy6fCOm7y+rn0bG3sKt
   eu7cf1B3ElrCTiKuiKN3hQUVwQW+PUjYvYXtX0PyKEywq5XBQhSNQwET5
   iGFx3hv9c4qoRSa+/dH2bzy5+sze27teCex8S+tmm+tp/eNItQlM9yqte
   SiNMqyYS0WJEJEiUjz+1wJ0FcWE6Gua1oN3sDs6W0FVa2ISTyuGwKKDG+
   3eBnLTn4VHGrLJ0ip/kpyxlQKUY53HFaxcPxbAdGf6C3G5nWilzzk3+Ey
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338099816"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338099816"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 00:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="834878312"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="834878312"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2023 00:08:22 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7shx-0009qf-0R;
	Sat, 10 Jun 2023 07:08:21 +0000
Date: Sat, 10 Jun 2023 15:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:ma 7/10] kernel/bpf/memalloc.c:601:8-15: WARNING
 opportunity for kmemdup
Message-ID: <202306101519.voWOUMhY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git ma
head:   49fbaff7ba484c18e309224108568d2c293b175f
commit: b10b8811a558e2d946ca78d44bccd961e3955035 [7/10] bpf: Move waiting_for_gp_ttrace from per-cpu into per-bpf_mem_alloc.
config: s390-randconfig-c042-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101519.voWOUMhY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101519.voWOUMhY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/memalloc.c:601:8-15: WARNING opportunity for kmemdup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
