Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB52EB19
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 23:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iG7F6uVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701906251; x=1733442251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Au4NheutJTv2N9tkxCMLcTBy6zYGIHCMAyKzgq/xz0=;
  b=iG7F6uVK41FXDvX/MmZZ5mgwZ5IBhbXMBAJkSCqXNDo6/BFAXOW985x0
   8+a1WZ1TOp/CIIwFlB0ZvsSm5JIgwde2n+kKpXNtN+7fdoTa/OfOtQJ8f
   tUIuXzi7OTEQVYJc8UknaDfZvPEmyiWB+toXlVJBkdLaHE/2KWPAy1utt
   emuhBQAtwTgpF7qWSPOT1rEsHNOEBmG7dwY3NNuJzcCHPszFfv93lxo3Y
   D4Tll71anXGQrDP35rxrfCasJ8moAku0SZlJE4OvYy5msYgZBVDUMpUDm
   Z2s4dVgdPpopj/fbcN4vceFxDAb5Lfvp+pwWnHhPHLdFiGIvGrYW1He/7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373634439"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373634439"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018737714"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1018737714"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 15:44:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1Yk-000Bb6-35;
	Wed, 06 Dec 2023 23:44:06 +0000
Date: Thu, 7 Dec 2023 07:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	quic_lingbok@quicinc.com
Subject: Re: [PATCH] wifi: ath12k: report tx bitrate for iw dev xxx station
 dump
Message-ID: <202312070759.wWy93Ana-lkp@intel.com>
References: <20231206134654.24662-1-quic_lingbok@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206134654.24662-1-quic_lingbok@quicinc.com>

Hi Lingbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0dbdc9383054fd3ecbcacfeb364aace3db744314]

url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-report-tx-bitrate-for-iw-dev-xxx-station-dump/20231206-215109
base:   0dbdc9383054fd3ecbcacfeb364aace3db744314
patch link:    https://lore.kernel.org/r/20231206134654.24662-1-quic_lingbok%40quicinc.com
patch subject: [PATCH] wifi: ath12k: report tx bitrate for iw dev xxx station dump
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231207/202312070759.wWy93Ana-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070759.wWy93Ana-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070759.wWy93Ana-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/mac.c:7765:20: warning: conflicting types for 'ath12k_mac_he_gi_to_nl80211_he_gi' due to enum/integer mismatch; have 'enum nl80211_he_gi(u8)' {aka 'enum nl80211_he_gi(unsigned char)'} [-Wenum-int-mismatch]
    7765 | enum nl80211_he_gi ath12k_mac_he_gi_to_nl80211_he_gi(u8 sgi)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/ath/ath12k/mac.c:9:
   drivers/net/wireless/ath/ath12k/mac.h:79:5: note: previous declaration of 'ath12k_mac_he_gi_to_nl80211_he_gi' with type 'u32(u8)' {aka 'unsigned int(unsigned char)'}
      79 | u32 ath12k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +7765 drivers/net/wireless/ath/ath12k/mac.c

  7764	
> 7765	enum nl80211_he_gi ath12k_mac_he_gi_to_nl80211_he_gi(u8 sgi)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
