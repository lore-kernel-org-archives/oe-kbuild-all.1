Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83491AC8B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 17:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726075569; cv=none; b=iWNFQI5ia3hBIrFLDNPgiwQVn105Tdz+UhK3LkOyu9YBN7CKgPvCGhPi8e+DXYRJ4oCH4AnqYD/QVYx1pk8JwgEtb2FLppgDMOr0vhDxDNSeZbis5iu1YJBcXbYY7uEgFY8d4HRZBro+6Hu6GlkJem8nvtRyv1aeDtsJVMj0MYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726075569; c=relaxed/simple;
	bh=sm9kOqoqqn8TdRLBSrjyw1FmPxp//FJTC5Fyjm6AAi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI05eMNKOZUOhR0p1IrCKgR8QlkSztEOa0amuj7GOMduOUBGqYAq2tf3bsUs6vK3CC3WwH48PhPUNl+u3UaGW4iK6sYNEFNE+uWxR1wB4hBEt5rZmVJ9c8BZdlekWkrI4UR1BZsiOdgJQDcejbCzD/7EWugT9uxjkBEMDLVkDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDjNK0Wu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDjNK0Wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726075567; x=1757611567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sm9kOqoqqn8TdRLBSrjyw1FmPxp//FJTC5Fyjm6AAi0=;
  b=ZDjNK0WuiDpBBVwaorTd92ERg64KP50RFItw76HFqfmkQovNA9CRP5RA
   KbPi1HRz5CzisB9bFFRe9wK/DFd9kUMHXgkGeOYWGgHljfvflicblASQz
   xA6fEbBTwbix/JtBil3ZBDg0LNcl5Fmupw0FSmL4YD9ZS5vOW1ORVvBHT
   Mqr36TCkDVhTNdjyKBDAaQec7QrAaPxMXFqZjppeAo4OjFcK30Rhigs2N
   BFrZ0WI15jh+glCb24lEttVNGtOsR9kGfHUnAZlr33YSPE0cKGbKW0RDY
   sDPa3kSVviQRTCOYdpS2jCzQfL2T0vBnBWbQSr/0fShqeBJRtZaCdC6PW
   A==;
X-CSE-ConnectionGUID: vHAdL1otR9+/IBKgVp/JhQ==
X-CSE-MsgGUID: zvPmqGXSROeIzjiBZcwI/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24762066"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24762066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 10:26:07 -0700
X-CSE-ConnectionGUID: 84bx++t8Tr+4xYGEbBhn7g==
X-CSE-MsgGUID: 7KGnhBqrTOuQ9lhdNmjJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67163844"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2024 10:26:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soR6S-0003ts-0u;
	Wed, 11 Sep 2024 17:26:04 +0000
Date: Thu, 12 Sep 2024 01:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/3]
 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2168:8: error: redefinition
 of 'struct cfg80211_ttlm_params'
Message-ID: <202409120142.YcArirw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   3669ba03ddfc0ea94d6685f802b229564b807ebe
commit: 00cccc6e75d20fc4fa449923c883ab1104bc97d1 [2/3] Reapply "UPSTREAM: wifi: cfg80211: Add support for setting TID to link mapping"
config: x86_64-randconfig-006-20240911 (https://download.01.org/0day-ci/archive/20240912/202409120142.YcArirw5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120142.YcArirw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120142.YcArirw5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
>> drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2168:8: error: redefinition of 'struct cfg80211_ttlm_params'
    2168 | struct cfg80211_ttlm_params {
         |        ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:7:
   include/net/cfg80211.h:1595:8: note: originally defined here
    1595 | struct cfg80211_ttlm_params {
         |        ^~~~~~~~~~~~~~~~~~~~


vim +2168 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h

4c13b53f91aab1 Ayala Beker   2023-06-14  2167  
4c13b53f91aab1 Ayala Beker   2023-06-14 @2168  struct cfg80211_ttlm_params {
4c13b53f91aab1 Ayala Beker   2023-06-14  2169  	u16 dlink[8];
4c13b53f91aab1 Ayala Beker   2023-06-14  2170  	u16 ulink[8];
4c13b53f91aab1 Ayala Beker   2023-06-14  2171  };
800097b1e14a76 Johannes Berg 2024-02-06  2172  #endif
8faa6d09277325 Johannes Berg 2020-09-15  2173  

:::::: The code at line 2168 was first introduced by commit
:::::: 4c13b53f91aab115f2980385f6974274eb3972b8 CHROMIUM: iwl7000: mac80211: add support for negotiated TTLM request

:::::: TO: Ayala Beker <ayala.beker@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
