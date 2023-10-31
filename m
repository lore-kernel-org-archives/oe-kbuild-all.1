Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD61A711
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcQ9jJAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698752435; x=1730288435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wde244ZJx5rVvU+M8T5K+51gjte8+h55SrdeIKDIm2U=;
  b=ZcQ9jJApfZQ16W7nAF/i17EoSsPltq0ChmExfISnp722DWLKswYLJj52
   /qNEkZHXSGSKLTjVadh/6V74On7qUX7hcxPqPRYkEtbeUFC6FJTs7Nb0O
   XQP/JZbqxRj7yCkDPkHRxQfHRZCWOwwhoCh7s1d6KFUrYqS8HOaN4F5aQ
   YeHwf0SOqpH0ebK5KA9NrA37ugnWkTwNu6kWW7fQbRFdwDTzignGKKpkM
   HbimvZROnW6L8xDEowkr/JbV7GgWvd7MWzOC5rEMgI38myajX+7Er1VhC
   M+cZRFtVdtBDXEf/4lT8kQC1ZSXujylK0KHSWBhfm0Wf7AusJt+GqHAyU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419379257"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="419379257"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 04:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="831019535"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="831019535"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Oct 2023 04:40:32 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxn6j-00008S-3D;
	Tue, 31 Oct 2023 11:40:30 +0000
Date: Tue, 31 Oct 2023 19:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp1 25/46]
 drivers/net/wireless/intel/iwlwifi/dvm/tx.c:473:1: error: function
 definition is not allowed here
Message-ID: <202310311955.meEXMms3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp1
head:   62bfd93b1d4bc92cd171973923c45a2b011f1c5c
commit: d2a923ac7fd344f9f6be35393ae75b64ec9fac27 [25/46] wifi: intel: use atomic find_bit() API where appropriate
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231031/202310311955.meEXMms3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311955.meEXMms3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311955.meEXMms3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:473:1: error: function definition is not allowed here
     473 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:480:1: error: function definition is not allowed here
     480 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:571:1: error: function definition is not allowed here
     571 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:630:1: error: function definition is not allowed here
     630 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:675:1: error: function definition is not allowed here
     675 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:738:1: error: function definition is not allowed here
     738 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:782:1: error: function definition is not allowed here
     782 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:803:1: error: function definition is not allowed here
     803 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:823:1: error: function definition is not allowed here
     823 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:862:1: error: function definition is not allowed here
     862 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:909:1: error: function definition is not allowed here
     909 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:916:1: error: function definition is not allowed here
     916 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:979:1: error: function definition is not allowed here
     979 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1003:1: error: function definition is not allowed here
    1003 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1082:1: error: function definition is not allowed here
    1082 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1097:1: error: function definition is not allowed here
    1097 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1106:1: error: function definition is not allowed here
    1106 | {
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1259:1: error: function definition is not allowed here
    1259 | {
         | ^
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1386:2: error: expected '}'
    1386 | }
         |  ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:461:1: note: to match this '{'
     461 | {
         | ^
   19 errors generated.
--
>> drivers/net/wireless/intel/iwlwifi/dvm/sta.c:722:51: error: use of undeclared identifier 'sta_key_max_num'
     722 |         int i = find_and_set_bit(&priv->ucode_key_table, sta_key_max_num);
         |                                                          ^
   drivers/net/wireless/intel/iwlwifi/dvm/sta.c:724:13: error: use of undeclared identifier 'sta_key_max_num'
     724 |         return i < sta_key_max_num ? i : WEP_INVALID_OFFSET;
         |                    ^
   2 errors generated.


vim +473 drivers/net/wireless/intel/iwlwifi/dvm/tx.c

9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  471  
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  472  static void iwlagn_dealloc_agg_txq(struct iwl_priv *priv, int q)
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15 @473  {
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  474  	clear_bit(q, priv->agg_q_alloc);
1479177ba69023 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-04-17  475  	priv->queue_to_mac80211[q] = IWL_INVALID_MAC80211_QUEUE;
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  476  }
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  477  

:::::: The code at line 473 was first introduced by commit
:::::: 9eae88fa9a02e31af69a215beaa5e1194da3a5a1 iwlwifi: move queue mapping out of transport

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
