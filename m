Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B73FE35
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kC91uigp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701879746; x=1733415746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tWTy72mM6QmDiHuWH6XcVH51PFBJOPjfQIe5CWDdbsw=;
  b=kC91uigpm6VddefnOi1brSebAoYHf2JBGN5uryLt/25eSkhUeUmGxyIo
   TOjzc1Wg8DDrJj7e9uUXhALP2+4pmIUKgxN7LoCufh9An1Q7vpwzPSdz7
   u++dADbNATtpw+v7TG6PxLCTOaqNTsZT80XjaGbbJq/92j7OsOd9wA1M3
   rXR1uGKaWb5u7Nuz0M2wgI/yUUf5rr9KRTnzptIYmF9I10TQbpLfEavg+
   8CiGJJaT/LXFN4WU7ZgrghAgVil8BLQxVApC2L/ppS6dl+bWuDqFQ9FDs
   Swv8XXoeD7HH9uyxToEVf3VnCf0ZqotQ6wg3t1W22EfgKTjXkJ5Uv3QSM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="480281265"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="480281265"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 08:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="764783858"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="764783858"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Dec 2023 08:22:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAufB-000B7C-3D;
	Wed, 06 Dec 2023 16:22:18 +0000
Date: Thu, 7 Dec 2023 00:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski@linaro.org,
	broonie@kernel.org, agross@kernel.org, andersson@kernel.org,
	quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	quic_phaniu@quicinc.com, quic_avangala@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
Message-ID: <202312070038.2pjLNBhG-lkp@intel.com>
References: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/ASoC-codecs-wcd937x-Add-wcd937x-codec-driver/20231205-203631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231205123400.6353-1-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
config: s390-randconfig-r111-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070038.2pjLNBhG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070038.2pjLNBhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070038.2pjLNBhG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/wcd937x.c:1410:12: sparse: sparse: symbol 'tx_master_ch_text' was not declared. Should it be static?
>> sound/soc/codecs/wcd937x.c:1417:23: sparse: sparse: symbol 'tx_master_ch_enum' was not declared. Should it be static?

vim +/tx_master_ch_text +1410 sound/soc/codecs/wcd937x.c

  1409	
> 1410	const char * const tx_master_ch_text[] = {
  1411		"ZERO", "SWRM_TX1_CH1", "SWRM_TX1_CH2", "SWRM_TX1_CH3", "SWRM_TX1_CH4",
  1412		"SWRM_TX2_CH1", "SWRM_TX2_CH2", "SWRM_TX2_CH3", "SWRM_TX2_CH4",
  1413		"SWRM_TX3_CH1", "SWRM_TX3_CH2", "SWRM_TX3_CH3", "SWRM_TX3_CH4",
  1414		"SWRM_PCM_IN",
  1415	};
  1416	
> 1417	const struct soc_enum tx_master_ch_enum =
  1418		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(tx_master_ch_text), tx_master_ch_text);
  1419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
