Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F1517BB32
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724280247; cv=none; b=QRAGMMhll3J9wNfAbOPn2rf4x7km59+94ZSdraU6IKoGyM73FEwyAXPp6NnWx16Yl3+1TTXiQTkpVcqfXSzHMXnRnWvqDACer7ObIiYj4oX33DLE+SqCsZXGGTtXuuaL40wxXUbsj6A2s0y9GfJr9Io0S4DVsTN+Aga9MfXl79A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724280247; c=relaxed/simple;
	bh=UpLhzEcFGMAyCLpXbCNeJ4FvoiU6x8UGQeE1ZX0UVfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SduEOg6dO2BWsEenuh/Om0ca+cRamIoml6jdj8NiMwIYtS7s7EqUXUW+duoDsP28f2FD/cln1D+eoEtJylLIHG92fS6Ep79twSOGysU0mW1qpD2XwDJClEYRWxlQ9iu1oW853vXBi0lehdIk/O8N2ABK2f9A/26qBanhxs8v6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ad+5hcEn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ad+5hcEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724280245; x=1755816245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpLhzEcFGMAyCLpXbCNeJ4FvoiU6x8UGQeE1ZX0UVfE=;
  b=ad+5hcEnfnk2UYu+Oj+SDbSjy/iEAEJQvKcgeHbbVCk1Y4+Q+Czfzqfr
   +EfL5jkZ1VJUh9ALFw8RcF4OBuHFmCve9ezxjASBn6nfNByFW0K1mJpyN
   HKZaUUhTO6cF74hAuMFkoogKeO+k5VCPbcRiR+LtwNWuJVt/BNSdBSuzo
   FIPArDbl54Rae+CNVjEgffs1b8sL3FngN5ggxu7B0B9ZvFZS2fax3qe1T
   SCZvX5a2YkaOBqIz7OWZRu4YYDMaiT0jT9+1uscNPWd+QW5GYFf8TfT73
   DSybf8uKRqqjAyJMRyG4lJT5f8aMFAySGGt+oFBpcqOYl2NkzcbD/4wZl
   A==;
X-CSE-ConnectionGUID: /7dE4sCcQnConig7hEw0mg==
X-CSE-MsgGUID: bYK+RgUFTba0G5xkghvM4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22278379"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="22278379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 15:44:04 -0700
X-CSE-ConnectionGUID: bGZ911CbQ62uZp9EkDrQyw==
X-CSE-MsgGUID: UlXA2+QFQvm6E0uNpyTfIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61262142"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2024 15:44:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgu3c-000C1U-30;
	Wed, 21 Aug 2024 22:44:00 +0000
Date: Thu, 22 Aug 2024 06:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/3]
 drivers/net/wireless/iwl7000/iwlwifi/pcie/trans.c:2030:35: warning: implicit
 conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes
 value from 18446744073709551615 to 4294967295
Message-ID: <202408220604.pzYkCA7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   0e373696b4350bab5db32cbf4ee0a7dfcd9b6939
commit: 00cccc6e75d20fc4fa449923c883ab1104bc97d1 [2/3] Reapply "UPSTREAM: wifi: cfg80211: Add support for setting TID to link mapping"
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408220604.pzYkCA7w-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220604.pzYkCA7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220604.pzYkCA7w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149:
   drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2168:8: error: redefinition of 'cfg80211_ttlm_params'
    2168 | struct cfg80211_ttlm_params {
         |        ^
   include/net/cfg80211.h:1595:8: note: previous definition is here
    1595 | struct cfg80211_ttlm_params {
         |        ^
>> drivers/net/wireless/iwl7000/iwlwifi/pcie/trans.c:2030:35: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    2030 |         trans_pcie->supported_dma_mask = DMA_BIT_MASK(12);
         |                                        ~ ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   drivers/net/wireless/iwl7000/iwlwifi/pcie/trans.c:2032:36: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    2032 |                 trans_pcie->supported_dma_mask = DMA_BIT_MASK(11);
         |                                                ~ ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   2 warnings and 1 error generated.


vim +2030 drivers/net/wireless/iwl7000/iwlwifi/pcie/trans.c

90bd21b536dd67 Miri Korenblit 2023-12-12  2001  
90bd21b536dd67 Miri Korenblit 2023-12-12  2002  static void iwl_trans_pcie_configure(struct iwl_trans *trans,
90bd21b536dd67 Miri Korenblit 2023-12-12  2003  				     const struct iwl_trans_config *trans_cfg)
90bd21b536dd67 Miri Korenblit 2023-12-12  2004  {
90bd21b536dd67 Miri Korenblit 2023-12-12  2005  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
90bd21b536dd67 Miri Korenblit 2023-12-12  2006  
90bd21b536dd67 Miri Korenblit 2023-12-12  2007  	/* free all first - we might be reconfigured for a different size */
90bd21b536dd67 Miri Korenblit 2023-12-12  2008  	iwl_pcie_free_rbs_pool(trans);
90bd21b536dd67 Miri Korenblit 2023-12-12  2009  
90bd21b536dd67 Miri Korenblit 2023-12-12  2010  	trans->txqs.cmd.q_id = trans_cfg->cmd_queue;
90bd21b536dd67 Miri Korenblit 2023-12-12  2011  	trans->txqs.cmd.fifo = trans_cfg->cmd_fifo;
90bd21b536dd67 Miri Korenblit 2023-12-12  2012  	trans->txqs.cmd.wdg_timeout = trans_cfg->cmd_q_wdg_timeout;
90bd21b536dd67 Miri Korenblit 2023-12-12  2013  	trans->txqs.page_offs = trans_cfg->cb_data_offs;
90bd21b536dd67 Miri Korenblit 2023-12-12  2014  	trans->txqs.dev_cmd_offs = trans_cfg->cb_data_offs + sizeof(void *);
90bd21b536dd67 Miri Korenblit 2023-12-12  2015  	trans->txqs.queue_alloc_cmd_ver = trans_cfg->queue_alloc_cmd_ver;
90bd21b536dd67 Miri Korenblit 2023-12-12  2016  
90bd21b536dd67 Miri Korenblit 2023-12-12  2017  	if (WARN_ON(trans_cfg->n_no_reclaim_cmds > MAX_NO_RECLAIM_CMDS))
90bd21b536dd67 Miri Korenblit 2023-12-12  2018  		trans_pcie->n_no_reclaim_cmds = 0;
90bd21b536dd67 Miri Korenblit 2023-12-12  2019  	else
90bd21b536dd67 Miri Korenblit 2023-12-12  2020  		trans_pcie->n_no_reclaim_cmds = trans_cfg->n_no_reclaim_cmds;
90bd21b536dd67 Miri Korenblit 2023-12-12  2021  	if (trans_pcie->n_no_reclaim_cmds)
90bd21b536dd67 Miri Korenblit 2023-12-12  2022  		memcpy(trans_pcie->no_reclaim_cmds, trans_cfg->no_reclaim_cmds,
90bd21b536dd67 Miri Korenblit 2023-12-12  2023  		       trans_pcie->n_no_reclaim_cmds * sizeof(u8));
90bd21b536dd67 Miri Korenblit 2023-12-12  2024  
90bd21b536dd67 Miri Korenblit 2023-12-12  2025  	trans_pcie->rx_buf_size = trans_cfg->rx_buf_size;
90bd21b536dd67 Miri Korenblit 2023-12-12  2026  	trans_pcie->rx_page_order =
90bd21b536dd67 Miri Korenblit 2023-12-12  2027  		iwl_trans_get_rb_size_order(trans_pcie->rx_buf_size);
90bd21b536dd67 Miri Korenblit 2023-12-12  2028  	trans_pcie->rx_buf_bytes =
90bd21b536dd67 Miri Korenblit 2023-12-12  2029  		iwl_trans_get_rb_size(trans_pcie->rx_buf_size);
90bd21b536dd67 Miri Korenblit 2023-12-12 @2030  	trans_pcie->supported_dma_mask = DMA_BIT_MASK(12);
90bd21b536dd67 Miri Korenblit 2023-12-12  2031  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210)
90bd21b536dd67 Miri Korenblit 2023-12-12  2032  		trans_pcie->supported_dma_mask = DMA_BIT_MASK(11);
90bd21b536dd67 Miri Korenblit 2023-12-12  2033  
90bd21b536dd67 Miri Korenblit 2023-12-12  2034  	trans->txqs.bc_table_dword = trans_cfg->bc_table_dword;
90bd21b536dd67 Miri Korenblit 2023-12-12  2035  	trans_pcie->scd_set_active = trans_cfg->scd_set_active;
90bd21b536dd67 Miri Korenblit 2023-12-12  2036  
90bd21b536dd67 Miri Korenblit 2023-12-12  2037  	trans->command_groups = trans_cfg->command_groups;
90bd21b536dd67 Miri Korenblit 2023-12-12  2038  	trans->command_groups_size = trans_cfg->command_groups_size;
90bd21b536dd67 Miri Korenblit 2023-12-12  2039  
90bd21b536dd67 Miri Korenblit 2023-12-12  2040  	/* Initialize NAPI here - it should be before registering to mac80211
90bd21b536dd67 Miri Korenblit 2023-12-12  2041  	 * in the opmode but after the HW struct is allocated.
90bd21b536dd67 Miri Korenblit 2023-12-12  2042  	 * As this function may be called again in some corner cases don't
90bd21b536dd67 Miri Korenblit 2023-12-12  2043  	 * do anything if NAPI was already initialized.
90bd21b536dd67 Miri Korenblit 2023-12-12  2044  	 */
90bd21b536dd67 Miri Korenblit 2023-12-12  2045  	if (trans_pcie->napi_dev.reg_state != NETREG_DUMMY)
90bd21b536dd67 Miri Korenblit 2023-12-12  2046  		init_dummy_netdev(&trans_pcie->napi_dev);
90bd21b536dd67 Miri Korenblit 2023-12-12  2047  
90bd21b536dd67 Miri Korenblit 2023-12-12  2048  	trans_pcie->fw_reset_handshake = trans_cfg->fw_reset_handshake;
90bd21b536dd67 Miri Korenblit 2023-12-12  2049  }
90bd21b536dd67 Miri Korenblit 2023-12-12  2050  

:::::: The code at line 2030 was first introduced by commit
:::::: 90bd21b536dd67fe8cd25d1a905b81a288d8bbf3 CHROMIUM: iwl7000: add driver

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
