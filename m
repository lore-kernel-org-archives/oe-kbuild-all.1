Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62605E558
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694633041; x=1726169041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNe9PpuREl4o1SuMhqGlMthlpYLgOoAbfNgfXgbwpIo=;
  b=krGs9XDr4D5/qgRBi6QEYrgQixtMz0e1arhm3b8V/D82BpHlWDudvrU9
   m32JGgZG7/RXWhRjoGPwItwtI0+kj6zClA4IViQLSl7dZhPM+3LzAQJH7
   eNLv0SMkA/UXve/W5+ojkTaEQL9jLYfa7DTB1DkddIZq5WkS/rWhYWICI
   gzhdvUJetTLTRynOX/j2YXRC686ziiWji7bi7dB3a5puEfu80dmZqPc6J
   kDXhaibwEQYwpOr06AbuTbawdi3KGyQPhRUmNAW8Nchew8W9m/MItSmVn
   rKU7WEpbiVAZ+ZwTVDlJeHC+yGUatsfsn/8iP+amF5m5n+Ms7fEOWSnWu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377673269"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377673269"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 12:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="917962141"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="917962141"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 12:23:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgVSu-0000Vs-2M;
	Wed, 13 Sep 2023 19:23:56 +0000
Date: Thu, 14 Sep 2023 03:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>
Subject: [kvalo-ath:ath11k-testmode 6/7]
 drivers/net/wireless/ath/ath12k/testmode.c:28:16: warning: no previous
 prototype for 'ath12k_tm_get_ar'
Message-ID: <202309140338.JIMolIml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-testmode
head:   ba2a7d5c57ba0703f64cf849c0299ac23eb1c1f5
commit: b50dc57cafcdbdeab2e799fa6e3148498e7805d7 [6/7] wifi: ath12k: add factory test mode support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309140338.JIMolIml-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140338.JIMolIml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140338.JIMolIml-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/testmode.c:28:16: warning: no previous prototype for 'ath12k_tm_get_ar' [-Wmissing-prototypes]
      28 | struct ath12k *ath12k_tm_get_ar(struct ath12k_base *ab)
         |                ^~~~~~~~~~~~~~~~


vim +/ath12k_tm_get_ar +28 drivers/net/wireless/ath/ath12k/testmode.c

    27	
  > 28	struct ath12k *ath12k_tm_get_ar(struct ath12k_base *ab)
    29	{
    30		struct ath12k_pdev *pdev;
    31		struct ath12k *ar;
    32		int i;
    33	
    34		for (i = 0; i < ab->num_radios; i++) {
    35			pdev = &ab->pdevs[i];
    36			ar = pdev->ar;
    37	
    38			if (ar && ar->state == ATH12K_STATE_TM)
    39				return ar;
    40		}
    41	
    42		return NULL;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
