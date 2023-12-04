Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB639843
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuNZot1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726276; x=1733262276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKGUmmwabAyOevMTlTTwgAfUCm9eXnQjD7WjK1/CEo8=;
  b=TuNZot1WixKC3wRmyW3DpHua7zxJJO1Ms6Kdn4MigasLtCZ5Xw1iseP1
   SKj99eKaTK5XLWYgvcPgGdiIqQpkYoN4yADbaPxxLFuUDARb1xLs+fGzx
   figoEwVkKS26r4mg/Iq9oFjy/cioDvsIVFhq0dLhUBmBd3mUXnkh4G7qQ
   2KuFo+cnjm+FkuRpGxSX15q8er+VrcbJiXc7mCNaNXoW8kivSL3m9vclV
   6Aq/fjzBkSxoRf8GGrI473TINsmiLa+DcExRMpNKVUvn8k3r7Qn9nN2NQ
   Ia95cDEw+maVc63YIiiXNYQj4vKrcvcxMsYByTFMWmh2SDZ58ozU5nAj0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="460296261"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="460296261"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:44:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914575943"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="914575943"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2023 13:44:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAGjs-00086d-2i;
	Mon, 04 Dec 2023 21:44:28 +0000
Date: Tue, 5 Dec 2023 05:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or
 member 'stale_en' not described in 'llcc_slice_config'
Message-ID: <202312050519.mup4Q8mD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: c72ca343f911c3ba1b10163399f891ddb86ad109 soc: qcom: llcc: Add v4.1 HW version support
date:   12 months ago
config: x86_64-buildonly-randconfig-006-20230906 (https://download.01.org/0day-ci/archive/20231205/202312050519.mup4Q8mD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312050519.mup4Q8mD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312050519.mup4Q8mD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'stale_en' not described in 'llcc_slice_config'
>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'stale_cap_en' not described in 'llcc_slice_config'
>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'mru_uncap_en' not described in 'llcc_slice_config'
>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'mru_rollover' not described in 'llcc_slice_config'
>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'alloc_oneway_en' not described in 'llcc_slice_config'
>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'ovcap_en' not described in 'llcc_slice_config'
>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'ovcap_prio' not described in 'llcc_slice_config'
>> drivers/soc/qcom/llcc-qcom.c:121: warning: Function parameter or member 'vict_prio' not described in 'llcc_slice_config'


vim +121 drivers/soc/qcom/llcc-qcom.c

8008e7902f28eb9 Sai Prakash Ranjan    2022-01-28   70  
99356b03b431f95 Vivek Gautam          2019-07-18   71  /**
171c03171a4cdf2 Lee Jones             2020-11-03   72   * struct llcc_slice_config - Data associated with the llcc slice
99356b03b431f95 Vivek Gautam          2019-07-18   73   * @usecase_id: Unique id for the client's use case
99356b03b431f95 Vivek Gautam          2019-07-18   74   * @slice_id: llcc slice id for each client
99356b03b431f95 Vivek Gautam          2019-07-18   75   * @max_cap: The maximum capacity of the cache slice provided in KB
99356b03b431f95 Vivek Gautam          2019-07-18   76   * @priority: Priority of the client used to select victim line for replacement
99356b03b431f95 Vivek Gautam          2019-07-18   77   * @fixed_size: Boolean indicating if the slice has a fixed capacity
99356b03b431f95 Vivek Gautam          2019-07-18   78   * @bonus_ways: Bonus ways are additional ways to be used for any slice,
99356b03b431f95 Vivek Gautam          2019-07-18   79   *		if client ends up using more than reserved cache ways. Bonus
99356b03b431f95 Vivek Gautam          2019-07-18   80   *		ways are allocated only if they are not reserved for some
99356b03b431f95 Vivek Gautam          2019-07-18   81   *		other client.
99356b03b431f95 Vivek Gautam          2019-07-18   82   * @res_ways: Reserved ways for the cache slice, the reserved ways cannot
99356b03b431f95 Vivek Gautam          2019-07-18   83   *		be used by any other client than the one its assigned to.
99356b03b431f95 Vivek Gautam          2019-07-18   84   * @cache_mode: Each slice operates as a cache, this controls the mode of the
99356b03b431f95 Vivek Gautam          2019-07-18   85   *             slice: normal or TCM(Tightly Coupled Memory)
99356b03b431f95 Vivek Gautam          2019-07-18   86   * @probe_target_ways: Determines what ways to probe for access hit. When
99356b03b431f95 Vivek Gautam          2019-07-18   87   *                    configured to 1 only bonus and reserved ways are probed.
99356b03b431f95 Vivek Gautam          2019-07-18   88   *                    When configured to 0 all ways in llcc are probed.
99356b03b431f95 Vivek Gautam          2019-07-18   89   * @dis_cap_alloc: Disable capacity based allocation for a client
99356b03b431f95 Vivek Gautam          2019-07-18   90   * @retain_on_pc: If this bit is set and client has maintained active vote
99356b03b431f95 Vivek Gautam          2019-07-18   91   *               then the ways assigned to this client are not flushed on power
99356b03b431f95 Vivek Gautam          2019-07-18   92   *               collapse.
99356b03b431f95 Vivek Gautam          2019-07-18   93   * @activate_on_init: Activate the slice immediately after it is programmed
c4df37fe186de4d Manivannan Sadhasivam 2020-11-30   94   * @write_scid_en: Bit enables write cache support for a given scid.
2b8175a1f108361 Sai Prakash Ranjan    2022-01-28   95   * @write_scid_cacheable_en: Enables write cache cacheable support for a
2b8175a1f108361 Sai Prakash Ranjan    2022-01-28   96   *			     given scid (not supported on v2 or older hardware).
99356b03b431f95 Vivek Gautam          2019-07-18   97   */
99356b03b431f95 Vivek Gautam          2019-07-18   98  struct llcc_slice_config {
99356b03b431f95 Vivek Gautam          2019-07-18   99  	u32 usecase_id;
99356b03b431f95 Vivek Gautam          2019-07-18  100  	u32 slice_id;
99356b03b431f95 Vivek Gautam          2019-07-18  101  	u32 max_cap;
99356b03b431f95 Vivek Gautam          2019-07-18  102  	u32 priority;
99356b03b431f95 Vivek Gautam          2019-07-18  103  	bool fixed_size;
99356b03b431f95 Vivek Gautam          2019-07-18  104  	u32 bonus_ways;
99356b03b431f95 Vivek Gautam          2019-07-18  105  	u32 res_ways;
99356b03b431f95 Vivek Gautam          2019-07-18  106  	u32 cache_mode;
99356b03b431f95 Vivek Gautam          2019-07-18  107  	u32 probe_target_ways;
99356b03b431f95 Vivek Gautam          2019-07-18  108  	bool dis_cap_alloc;
99356b03b431f95 Vivek Gautam          2019-07-18  109  	bool retain_on_pc;
99356b03b431f95 Vivek Gautam          2019-07-18  110  	bool activate_on_init;
c4df37fe186de4d Manivannan Sadhasivam 2020-11-30  111  	bool write_scid_en;
2b8175a1f108361 Sai Prakash Ranjan    2022-01-28  112  	bool write_scid_cacheable_en;
c72ca343f911c3b Abel Vesa             2022-11-16  113  	bool stale_en;
c72ca343f911c3b Abel Vesa             2022-11-16  114  	bool stale_cap_en;
c72ca343f911c3b Abel Vesa             2022-11-16  115  	bool mru_uncap_en;
c72ca343f911c3b Abel Vesa             2022-11-16  116  	bool mru_rollover;
c72ca343f911c3b Abel Vesa             2022-11-16  117  	bool alloc_oneway_en;
c72ca343f911c3b Abel Vesa             2022-11-16  118  	bool ovcap_en;
c72ca343f911c3b Abel Vesa             2022-11-16  119  	bool ovcap_prio;
c72ca343f911c3b Abel Vesa             2022-11-16  120  	bool vict_prio;
99356b03b431f95 Vivek Gautam          2019-07-18 @121  };
99356b03b431f95 Vivek Gautam          2019-07-18  122  

:::::: The code at line 121 was first introduced by commit
:::::: 99356b03b431f9589bbaec2bc5bacceccb3dd99a soc: qcom: Make llcc-qcom a generic driver

:::::: TO: Vivek Gautam <vivek.gautam@codeaurora.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
