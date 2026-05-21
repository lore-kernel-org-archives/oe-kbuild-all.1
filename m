Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51168394463
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347067; cv=none; b=d6QQhCeaoCSm4sPTrQj/WeFMBrLS83RdVlqgXUVWpjEN8FZ29qtiUMz5pAa2mTmgryo8hWomf3re8wjXvXl4WR95XFX47A1zmR3KDLHqTEyGlr7XdFK3EZZWpAKLu4ALFczQR26hMRiDjf8rVMR33EIRUGxnLqwiqzK6/7J4J1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347067; c=relaxed/simple;
	bh=7yRZZMtp4dtrB+ZgdiQ7jrMpv6rF9+JUpp/yg3biKH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V2AZUfXizrAY00AKrpIcjVmdcTOCFFIDxijSh13+ToT6vdX67GailONF2OOI+Zrw2nlz/kjsBGrNjSU6Pd1BWys2foaxx4SuIg+jTnRpICqObbMOl0EMQf8mSMLAGdBOiIqfonDaLxARHG3CMW1cSYSpAtkkKJmUmFiCeNXsAeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ye1IaD4p; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ye1IaD4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779347067; x=1810883067;
  h=date:from:to:cc:subject:message-id;
  bh=7yRZZMtp4dtrB+ZgdiQ7jrMpv6rF9+JUpp/yg3biKH4=;
  b=Ye1IaD4p/3nIO+0dbDZ0CKRrgYPKNLm+S+OmUdqVFqS3hZamANmLr2Py
   0eYbDnrfSEwvheBaspNcKlAaF9UuTH8fyLXFXMbittf/aBUu843s0VGMj
   hJmxtuZyDZIDYyjuPQBVrslmtiGj0knwu+FBo1kIA5k6gwirh1LqouLmR
   Tr5b9oxE0GbSNWGkPEiR355sXxLHLGA2tpME6URxgF1OUkzUNpDLL8W1r
   qZ010UeQAocq/fKJHcFjVy+I1MlxC50UNd9jMjIUaZ+VCnbhCHxqgthWu
   hK3NtIFb+PqTy1aH7dZ0DJ84TPZb3IY78uHqE5Iw4znchN+UOWFO2dXzV
   Q==;
X-CSE-ConnectionGUID: 7N2w9/0PSZOaE5wPaTE3xg==
X-CSE-MsgGUID: Jo+eY7+USOW+owUSCMZzBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84145918"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="84145918"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:04:25 -0700
X-CSE-ConnectionGUID: y2EF0eOwTKqd0NIi5Y3F2g==
X-CSE-MsgGUID: jU83LxaRRvCpaEl8pi7hXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240684284"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2026 00:04:23 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPxS8-000000004Yl-2Ng1;
	Thu, 21 May 2026 07:04:20 +0000
Date: Thu, 21 May 2026 15:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 50/1130]
 drivers/net/wireless/ath/carl9170/main.c:994:29: warning: conversion from
 'long long unsigned int' to 'uintptr_t' {aka 'long unsigned int'} changes
 value from '18446744073709551615' to '4294967295'
Message-ID: <202605211515.oPv9kXOX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: de1dc4d2f18ef29dff3e7d4b01132e313e9f172e [50/1130] cheri: wireless: Apply the multicast.cocci script to update the ABI
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211515.oPv9kXOX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211515.oPv9kXOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211515.oPv9kXOX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/carl9170/main.c: In function 'carl9170_op_configure_filter':
>> drivers/net/wireless/ath/carl9170/main.c:994:29: warning: conversion from 'long long unsigned int' to 'uintptr_t' {aka 'long unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     994 |                 multicast = ~0ULL;
         |                             ^


vim +994 drivers/net/wireless/ath/carl9170/main.c

fe8ee9ad80b28382 Christian Lamparter 2010-09-06   971  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   972  static void carl9170_op_configure_filter(struct ieee80211_hw *hw,
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   973  					 unsigned int changed_flags,
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   974  					 unsigned int *new_flags,
de1dc4d2f18ef29d Christian Ehrhardt  2025-06-03   975  					 uintptr_t multicast)
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   976  {
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   977  	struct ar9170 *ar = hw->priv;
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   978  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   979  	/* mask supported flags */
5c895691944862e7 Christian Lamparter 2010-09-28   980  	*new_flags &= FIF_ALLMULTI | ar->rx_filter_caps;
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   981  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   982  	if (!IS_ACCEPTING_CMD(ar))
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   983  		return;
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   984  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   985  	mutex_lock(&ar->mutex);
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   986  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   987  	ar->filter_state = *new_flags;
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   988  	/*
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   989  	 * We can support more by setting the sniffer bit and
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   990  	 * then checking the error flags, later.
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   991  	 */
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   992  
8f7f3b2fcc4ccbba Nicolas Cavallari   2011-05-04   993  	if (*new_flags & FIF_ALLMULTI)
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  @994  		multicast = ~0ULL;
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   995  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   996  	if (multicast != ar->cur_mc_hash)
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   997  		WARN_ON(carl9170_update_multicast(ar, multicast));
fe8ee9ad80b28382 Christian Lamparter 2010-09-06   998  
df1404650ccbfeb7 Johannes Berg       2015-04-22   999  	if (changed_flags & FIF_OTHER_BSS) {
df1404650ccbfeb7 Johannes Berg       2015-04-22  1000  		ar->sniffer_enabled = !!(*new_flags & FIF_OTHER_BSS);
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  1001  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  1002  		WARN_ON(carl9170_set_operating_mode(ar));
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  1003  	}
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  1004  
5c895691944862e7 Christian Lamparter 2010-09-28  1005  	if (ar->fw.rx_filter && changed_flags & ar->rx_filter_caps) {
5c895691944862e7 Christian Lamparter 2010-09-28  1006  		u32 rx_filter = 0;
5c895691944862e7 Christian Lamparter 2010-09-28  1007  
c9122c0d63a50bab Christian Lamparter 2012-07-07  1008  		if (!ar->fw.ba_filter)
c9122c0d63a50bab Christian Lamparter 2012-07-07  1009  			rx_filter |= CARL9170_RX_FILTER_CTL_OTHER;
c9122c0d63a50bab Christian Lamparter 2012-07-07  1010  
5c895691944862e7 Christian Lamparter 2010-09-28  1011  		if (!(*new_flags & (FIF_FCSFAIL | FIF_PLCPFAIL)))
5c895691944862e7 Christian Lamparter 2010-09-28  1012  			rx_filter |= CARL9170_RX_FILTER_BAD;
5c895691944862e7 Christian Lamparter 2010-09-28  1013  
5c895691944862e7 Christian Lamparter 2010-09-28  1014  		if (!(*new_flags & FIF_CONTROL))
5c895691944862e7 Christian Lamparter 2010-09-28  1015  			rx_filter |= CARL9170_RX_FILTER_CTL_OTHER;
5c895691944862e7 Christian Lamparter 2010-09-28  1016  
5c895691944862e7 Christian Lamparter 2010-09-28  1017  		if (!(*new_flags & FIF_PSPOLL))
5c895691944862e7 Christian Lamparter 2010-09-28  1018  			rx_filter |= CARL9170_RX_FILTER_CTL_PSPOLL;
5c895691944862e7 Christian Lamparter 2010-09-28  1019  
df1404650ccbfeb7 Johannes Berg       2015-04-22  1020  		if (!(*new_flags & FIF_OTHER_BSS)) {
5c895691944862e7 Christian Lamparter 2010-09-28  1021  			rx_filter |= CARL9170_RX_FILTER_OTHER_RA;
5c895691944862e7 Christian Lamparter 2010-09-28  1022  			rx_filter |= CARL9170_RX_FILTER_DECRY_FAIL;
5c895691944862e7 Christian Lamparter 2010-09-28  1023  		}
5c895691944862e7 Christian Lamparter 2010-09-28  1024  
5c895691944862e7 Christian Lamparter 2010-09-28  1025  		WARN_ON(carl9170_rx_filter(ar, rx_filter));
5c895691944862e7 Christian Lamparter 2010-09-28  1026  	}
5c895691944862e7 Christian Lamparter 2010-09-28  1027  
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  1028  	mutex_unlock(&ar->mutex);
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  1029  }
fe8ee9ad80b28382 Christian Lamparter 2010-09-06  1030  

:::::: The code at line 994 was first introduced by commit
:::::: fe8ee9ad80b28382111f0aab01690b09982e5691 carl9170: mac80211 glue and command interface

:::::: TO: Christian Lamparter <chunkeey@googlemail.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
