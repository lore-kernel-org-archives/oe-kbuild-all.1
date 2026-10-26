Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979136;
	b=Or9Ya75BTPv5RKmg0nPmrzTiFHoYFtiOY1CitHdsMF14NtbNFdsdLTUXr1fEzR/U63g+
	 t4BZPeghzU3E18ZrSG2sgRdzXG7VLCCU31wYq6ODv5B1RPVrdvWTgrR+sT0uZilsHR/NA
	 uQ4qNYOb5/OPyCxfggitiRLtkg2TjDFVFx7gC9lao6vR0xtRRI7jbk90eSt1yVDdHkAH0
	 I0uwi6Bvqw1EBRWdpXnNv+wnDdqS+Uwgr6UpzOa08nH+I25Tpi14Ac0qsHl8ABcKeldmb
	 F0OB/Vbekg2h4wWbQL+ftKcaj3Dd+c4BOHe0OfMfQ3mbaOvGZRiGg4S0z2v0T/t6T+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xTfl6JG5XOX7PlU3WukGovmtXFHl+ztXvpy6ksl1ihc=;
	b=nhhtSqFOdcDyPY/KcRefU8s4tGpLbyrLrEI2kTjAol3MjvJzcZ/GYRZR/IXoXwY3reEH
	 K6fkwHQ+IkK9FLo5hInx/2vXUJUti4LzwFK7yFriAjvBCNglAgg/RhhHRjO2G7OeeKu8Y
	 wMmTVbmttxx2xvBnY/cdscwBh/aB/VJslR+6Gj9fkC53vDrfMxBoJzBE0Duu5w1V2y4Lf
	 RbVLFx6L4rriMDzRp749mdUjnQL0vHqA6YNvggGmc3DgTBtXV1Edh4eRkm3mKwrD4QNvw
	 D7REcJ8OHhCMs/EQtlBTbX5NZzsgzdFmDI/aQ+Wf6OpxkIKRDwU5YFEPjL+nO8sN3hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjbPGE1c;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51146606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 01:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51146606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjbPGE1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792979134; x=1824515134;
  h=date:from:to:cc:subject:message-id;
  bh=fBlIEiea9lL+8d24rcFpHew56fmdEM/SuwkyU5LuxtQ=;
  b=NjbPGE1cArX0Jbjl+r8xinzEdybIsMI6Tvk6ssrNoToLJXTdF6DXMD5G
   fuE82W/zrHtXkGhcjv9EKG03kczxz5DoZEaakutvxPEMu/EfjVD6uHq4C
   4z5fr1xmGk7xjWL88lUnLVRfCrs2yiqMVILw3459pla9QKLc/0tZnaWtM
   o98BM0B799aq/hFx6iWT7QpbHWL25H8nAVMgBT65JGeFmhQzHktIeQL9o
   ohL9jpkDWUJ40dFrsNBKDj8iOo74oskmNQasP9eac/x3uwubJy3e28j+o
   cB7lb+zDgB7xE50tiaPBnYtqFFtGZExuvmLzGoBqcZJlzEAMo2W9ZLGrP
   w==;
X-CSE-ConnectionGUID: od5eyrk7SnGzbTD2Vm0+/Q==
X-CSE-MsgGUID: S2HlkRLrTt+2hPC44GDf8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1642415"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1642415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:45:33 -0700
X-CSE-ConnectionGUID: 1QZY5FeDR7ePt4+nORFB6A==
X-CSE-MsgGUID: 10NPsyqXTaKbrI2zPUZB6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4533597"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2026 18:45:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL9mD-00000000VLS-3jZY;
	Mon, 26 Oct 2026 01:45:29 +0000
Date: Mon, 26 Oct 2026 09:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] Warning:
 drivers/android/wonder/mac80211_txs.c:19 cannot understand function
 prototype: 'struct txs_queue g_txs_queue;'
Message-ID: <202610260913.0iuoLO3U-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Will,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   721ad43cbf3c182a07edf6a2a8127c587313f6a7
commit: 8a7c7d3954c2839bb2f6ebe475648ec14b8a2c9f [1/1] ANDROID: Add Wonder driver to GKI
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261026/202610260913.0iuoLO3U-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260913.0iuoLO3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260913.0iuoLO3U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/android/wonder/mac80211_txs.c:19 cannot understand function prototype: 'struct txs_queue g_txs_queue;'
--
>> Warning: drivers/android/wonder/nl80211_ven_cmd.c:23 Cannot find identifier on line:
   * @brief Auto-generate policy for integer attributes
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:24 Cannot find identifier on line:
   */
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:25 Cannot find identifier on line:
   #define WONDER_POL_SCALAR(attr) \
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:26 Cannot find identifier on line:
   [attr] = { .type = _WONDER_GET_TYPE(attr##_SIZE) }
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:27 Cannot find identifier on line:
--
>> Warning: drivers/android/wonder/nl80211_ven_cmd.c:108 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   static int wonder_vendor_cmd_set_frequency(struct wiphy *wiphy,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
