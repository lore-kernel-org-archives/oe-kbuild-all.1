Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73D33343B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768884101; cv=none; b=DT79YrTx/uf/vWQYwa0GNNyUyAhlsv17H3Kqz6JJ0EuIx6DqAb3Tn0xE7WJ+sypbkOIO2KoUQyXJdJ8dfJuUW/kqjYGugYSdqHs64pC3qh8619+NXnJE8I1hNVRRin1dwl1+0kjyiTdULP33QbGgV82rBg7PmRhg0d5j86nuYAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768884101; c=relaxed/simple;
	bh=qotN8rQXAQFd0JE6quxLzkMeoWYSldv0w4G9VN9dcDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E3Pip6OHdahdG+9yFlbvtfEqOL0sUhSqxNpuQ0poj+dbhokvxBxTRaT1g8OL0DgrXgGxCxPLWYCa53kzVuW1CJa9tes/UMFFc3Ss4UpiFnDec5i8qXB/fZHhQ18Adn3IkPeqwkWMPm2YiXE/JVCE8vclS+ccCeoobtZnIjMNPhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3hXIa4x; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3hXIa4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768884099; x=1800420099;
  h=date:from:to:cc:subject:message-id;
  bh=qotN8rQXAQFd0JE6quxLzkMeoWYSldv0w4G9VN9dcDM=;
  b=L3hXIa4xlknbZ0+wfQWXqmYyr2EYFfhtf1oa+Sr6fJS0qAILDV0B+CXZ
   k23uwBeRupbjkdduz99RJWr5BtTZxyl1xv9hx3ooB3MGh+WQIFsSoA6M7
   MiG9WFSQjvg8cCZ33+BtpjOtkqpuBH3vjNQvQZt2+ObQLGi8ljdgXiz6h
   6g9gSap0W8r1IqAlxycQG+CYvZ7bwlWqvvA6W9dXfbEuTZMbmD6h8k6eM
   tjjjZqEjLyre0GCH6JiSHhsVW2qQqM89ocKTNNohTqMc4Gy5oIDbCWVr1
   7awsK2eaq0doUSH7om5ByipGSO3rkK0DxoN4M1EqC4Fb2CeUEIUEUv/Fj
   w==;
X-CSE-ConnectionGUID: 9L8TroXkT6C9KnULeXz36A==
X-CSE-MsgGUID: UMmkGKk9QDCKPMioKO0Htw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69984943"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="69984943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:41:39 -0800
X-CSE-ConnectionGUID: o/QZpu81QCyE3PQV7tuuvQ==
X-CSE-MsgGUID: De7TNsANSbqdJd94k+3tqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="210866628"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jan 2026 20:41:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi3Yb-00000000OYv-2UNO;
	Tue, 20 Jan 2026 04:41:33 +0000
Date: Tue, 20 Jan 2026 12:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>,
 Avraham Stern <avraham.stern@intel.com>,
 Daniel Gabay <daniel.gabay@intel.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Shaul Triebitz <shaul.triebitz@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/fw/api/rx.h:511:2:
 warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than
 'union iwl_rx_mpdu_desc_v1::(anonymous at
 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h:511:2)' and is usually due to
 'struct i...
Message-ID: <202601201250.zemonG0p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
date:   11 months ago
config: arm-randconfig-r063-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201250.zemonG0p-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201250.zemonG0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201250.zemonG0p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/fw/init.c:13:
>> drivers/net/wireless/intel/iwlwifi/fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   1 warning generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.c:8:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   1 warning generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/rx.c:9:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:608:2: warning: field  within 'struct iwl_rx_mpdu_desc_v3' is less aligned than 'union iwl_rx_mpdu_desc_v3::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:608:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v3' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     608 |         union {
         |         ^
   2 warnings generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tx.c:5:
   include/net/ip.h:478:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     478 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tx.c:5:
   include/net/ip.h:478:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
   include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tx.c:5:
   include/net/ip.h:478:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
   include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tx.c:7:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tx.h:8:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   4 warnings generated.


vim +511 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h

0ac93c06dca70f drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  452  
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  453  /**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  454   * struct iwl_rx_mpdu_desc_v1 - RX MPDU descriptor
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  455   */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  456  struct iwl_rx_mpdu_desc_v1 {
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  457  	/* DW7 - carries rss_hash only when rpa_en == 1 */
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  458  	union {
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  459  		/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  460  		 * @rss_hash: RSS hash value
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  461  		 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  462  		__le32 rss_hash;
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  463  
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  464  		/**
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  465  		 * @phy_data2: depends on info type (see @phy_data1)
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  466  		 */
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  467  		__le32 phy_data2;
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  468  	};
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  469  
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  470  	/* DW8 - carries filter_match only when rpa_en == 1 */
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  471  	union {
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  472  		/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  473  		 * @filter_match: filter match value
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  474  		 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  475  		__le32 filter_match;
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  476  
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  477  		/**
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  478  		 * @phy_data3: depends on info type (see @phy_data1)
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  479  		 */
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  480  		__le32 phy_data3;
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  481  	};
dabf9844385885 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  482  
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  483  	/* DW9 */
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  484  	/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  485  	 * @rate_n_flags: RX rate/flags encoding
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  486  	 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  487  	__le32 rate_n_flags;
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  488  	/* DW10 */
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  489  	/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  490  	 * @energy_a: energy chain A
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  491  	 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  492  	u8 energy_a;
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  493  	/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  494  	 * @energy_b: energy chain B
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  495  	 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  496  	u8 energy_b;
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  497  	/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  498  	 * @channel: channel number
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  499  	 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  500  	u8 channel;
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  501  	/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  502  	 * @mac_context: MAC context mask
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  503  	 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  504  	u8 mac_context;
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  505  	/* DW11 */
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  506  	/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  507  	 * @gp2_on_air_rise: GP2 timer value on air rise (INA)
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  508  	 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  509  	__le32 gp2_on_air_rise;
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  510  	/* DW12 & DW13 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05 @511  	union {
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  512  		/**
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  513  		 * @tsf_on_air_rise:
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  514  		 * TSF value on air rise (INA), only valid if
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  515  		 * %IWL_RX_MPDU_PHY_TSF_OVERLOAD isn't set
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  516  		 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  517  		__le64 tsf_on_air_rise;
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  518  
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  519  		struct {
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  520  			/**
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  521  			 * @phy_data0: depends on info_type, see @phy_data1
6857df8c10e698 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  522  			 */
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  523  			__le32 phy_data0;
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  524  			/**
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  525  			 * @phy_data1: valid only if
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  526  			 * %IWL_RX_MPDU_PHY_TSF_OVERLOAD is set,
0ac93c06dca70f drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  527  			 * see &enum iwl_rx_phy_common_data1 or
0ac93c06dca70f drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  528  			 *     &enum iwl_rx_phy_he_data1 or
0ac93c06dca70f drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  529  			 *     &enum iwl_rx_phy_eht_data1.
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  530  			 */
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  531  			__le32 phy_data1;
bdf180c8d375ee drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  532  		};
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  533  	};
ce712478a458fc drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2021-10-17  534  } __packed; /* RX_MPDU_RES_START_API_S_VER_4 */
18ead597daa17a drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  535  

:::::: The code at line 511 was first introduced by commit
:::::: 18ead597daa17a557249cf4b2f494361d836ed52 iwlwifi: support new rx_mpdu_desc api

:::::: TO: Golan Ben Ami <golan.ben.ami@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
