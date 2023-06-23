Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A268F5D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687529352; x=1719065352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=94kZDuuWp/60RXx5tPqsG1tl4PiHbNaVRLx7uvsbQJY=;
  b=QNjF+kWIBiE8/YXREwQkLtYUllX723gfnxnvisuc0UKumcLFA+QmjYa+
   QK6q35Psw3Sf9e8iQA5sZZRCmm2WEZg0MWDqEbvdXNmfnJFw8Jn0vVlg+
   7cMVcBSLOG4FDSCig989NIFu4HmoGBOgJnH2M/TR8DqEb0BNeZawNhAYl
   2kpV1/WE9dnqsxcrGYNnHpjV8uCVVaTVUzIilVet6DZrnpwNS2PXst4qX
   cZaKRo3utuUDa1QoK5A2a5o2WwSViRnWUtPX+LF2M+M4PHekuBtDk13uf
   TiTAXJU+VXKjU96jGNW2afE13TG7mprYHZe3z4MyFQicNr4KS5xerDPJE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="363325207"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="363325207"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 07:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="1045649524"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="1045649524"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jun 2023 07:09:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qChTJ-0008JH-02;
	Fri, 23 Jun 2023 14:09:09 +0000
Date: Fri, 23 Jun 2023 22:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/thunderbolt/dma_test.c:302:13-20: WARNING opportunity for
 kmemdup
Message-ID: <202306232236.9QoeQpFV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: e299e41caaf67e6efa1acb7363bdf49b7b9480ce Merge origin/chromeos-5.10-net
date:   2 years, 6 months ago
config: microblaze-randconfig-c034-20230621 (https://download.01.org/0day-ci/archive/20230623/202306232236.9QoeQpFV-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232236.9QoeQpFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306232236.9QoeQpFV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/dma_test.c:302:13-20: WARNING opportunity for kmemdup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
