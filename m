Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F2ECA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 03:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690599828; x=1722135828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xqcP3FCbcuRDdzyhSH64RJ2GOn+OtLVvkVP+1exZKpU=;
  b=DrIGfnbmqGL4lEBvhzFWy+ZnFt/llKiSriGZfOeD9pT5pz3pcbeqbOdn
   afA82/K7vO9YFSErkfoHIAUfLbV7oMMbK42ElspKNERGjDeb2WXdwTdby
   fbZ5mKqGBMtaDdXo+Ft1k8j9qCUtI+BrfCPTDt8vqD1qbqB+tHJSicq/n
   6m15Nf/e5XTGzrqCM3ZUNTaW/PQYeDM4zrYgsj7palcu9L8FWOWuvy16B
   oUg+zZlmLe0o+Gbsw3lHne28Nolq7N1opZmJ/2xqli2+JEOAjmJ7ZzkUq
   bANk5IUD+OXV4KiEDMolwuSUSIQrXu94hrnQxaorktuaHUdfo/SEh6iC+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348330217"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="348330217"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 20:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="704788938"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="704788938"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 20:03:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPaF7-0003mh-0n;
	Sat, 29 Jul 2023 03:03:45 +0000
Date: Sat, 29 Jul 2023 11:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:tcx_warn_dbg 1/1] undefined reference to
 `tcx_warn_triggered'
Message-ID: <202307291148.TQ7KNGM5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git tcx_warn_dbg
head:   60e4b66be28ba06cc6c12d45f741e2ff760ed18f
commit: 60e4b66be28ba06cc6c12d45f741e2ff760ed18f [1/1] dbg print for tcx warn splat
config: microblaze-randconfig-r002-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291148.TQ7KNGM5-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291148.TQ7KNGM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291148.TQ7KNGM5-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: net/sched/sch_ingress.o: in function `clsact_destroy':
>> (.text+0x9dc): undefined reference to `tcx_warn_triggered'
>> microblaze-linux-ld: (.text+0x9f0): undefined reference to `tcx_warn_triggered'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
