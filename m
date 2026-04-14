Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49DC1FC8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168545; cv=none; b=sYmgHwrEgwiuAVVeqnf+tduipqjwJQ+th0BQSBV/L9KHvQvJrRrICIKmimAwelsObnVHM1v7/7m+CdH8PDaAaV/rM9B1oaYcdat+Zm5AtWYwOFAnkaCt6v4Qdq6J+JrQllx1S7nMAMDHOEgbXTjwsnZh5G7X2/9+RY8plfH4iVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168545; c=relaxed/simple;
	bh=L5ybFqb/DaxnKziiT44oW2TNd39idghePGdfbCpq+3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BGqQEvVYMv0lKt2NvKwYRIcpJSqPVNCNeQmCCiIJvDrH7wQRGfGFce5+E/uuKDPyWzIw7YF0qwJAldMcbtsbYwNcbhK54TvcG26HCo8Yl/Us3do0XgUmo1cNoUELr05s/Wxr16xBLJyHA/bhXJGBrCM7qgeki/sxyo1WgPuG+/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K88tvOTh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K88tvOTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776168543; x=1807704543;
  h=date:from:to:cc:subject:message-id;
  bh=L5ybFqb/DaxnKziiT44oW2TNd39idghePGdfbCpq+3g=;
  b=K88tvOThe2WBUwpmTFC51RVyxvvmi2oVpYVs6wD2YBSR2+xM3GiIGH0L
   76hH7BU3Y+/5Pk2kG/YiwjlM5J4/pLypz8xqboqekABvqYgyMgLmPRqBA
   AFlTRWy6vUxVF8+J7uWrGS4LMSUWQT3w27Oi4XmQ0VQck95xasrfFnqVT
   MrphKN5Ztev76/1aYUOhdcS0NwKcnXNXBH+I3XivYxQl/xz3lJmV5Xuk+
   K//QE4ytr+muJyICxnTdQQr+dZtGkamDebmfi1+eMDOpXf0MFMZ3Z+JWy
   SgIxMn0vVeugbcJHYJADV1sOsE7FLiu7NX3T3k5eUhdPSq831qMxIBiEJ
   g==;
X-CSE-ConnectionGUID: QyEsyNtMTxGPIwxgf83ilw==
X-CSE-MsgGUID: pt6ccQshSkqVSME8M0vvWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77194610"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77194610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:09:02 -0700
X-CSE-ConnectionGUID: ioULdPOgRjK6GdY+5y+XEw==
X-CSE-MsgGUID: ic4t6/uMRM+vDhW/Gmm1+g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2026 05:09:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCcZf-000000000P5-0isO;
	Tue, 14 Apr 2026 12:08:59 +0000
Date: Tue, 14 Apr 2026 14:08:18 +0200
From: kernel test robot <lkp@intel.com>
To: "Pablo Martin-Gomez" <pmartin-gomez@freebox.fr>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/mac80211/debugfs_sta.c:1006:13: error: 'band' undeclared
Message-ID: <202604141450.GJY3YpL8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pablo-Martin-Gomez/wifi-nl80211-remove-EHT-IE-size-validation/20260414-014056
head:   27802dfbd9cea5146c1de2ae0dae896fb8e15a40
commit: 87dc4b6cfb8f621071c6da12f21e455b9cae9d18 wifi: do not read band-dependent reserved bits
date:   18 hours ago
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260414/202604141450.GJY3YpL8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141450.GJY3YpL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141450.GJY3YpL8-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/mac80211/debugfs_sta.c: In function 'link_sta_he_capa_read':
>> net/mac80211/debugfs_sta.c:1006:13: error: 'band' undeclared (first use in this function)
    1006 |         if (band != NL80211_BAND_2GHZ &&
         |             ^~~~
   net/mac80211/debugfs_sta.c:1006:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/band +1006 net/mac80211/debugfs_sta.c

   979	
   980	#define PRINT_NSS_SUPP(f, n)						\
   981		do {								\
   982			int _i;							\
   983			u16 v = le16_to_cpu(nss->f);				\
   984			p += scnprintf(p, buf_sz + buf - p, n ": %#.4x\n", v);	\
   985			for (_i = 0; _i < 8; _i += 2) {				\
   986				switch ((v >> _i) & 0x3) {			\
   987				case 0:						\
   988					PRINT(n "-%d-SUPPORT-0-7", _i / 2);	\
   989					break;					\
   990				case 1:						\
   991					PRINT(n "-%d-SUPPORT-0-9", _i / 2);	\
   992					break;					\
   993				case 2:						\
   994					PRINT(n "-%d-SUPPORT-0-11", _i / 2);	\
   995					break;					\
   996				case 3:						\
   997					PRINT(n "-%d-NOT-SUPPORTED", _i / 2);	\
   998					break;					\
   999				}						\
  1000			}							\
  1001		} while (0)
  1002	
  1003		PRINT_NSS_SUPP(rx_mcs_80, "RX-MCS-80");
  1004		PRINT_NSS_SUPP(tx_mcs_80, "TX-MCS-80");
  1005	
> 1006		if (band != NL80211_BAND_2GHZ &&
  1007		    cap[0] & IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G) {
  1008			PRINT_NSS_SUPP(rx_mcs_160, "RX-MCS-160");
  1009			PRINT_NSS_SUPP(tx_mcs_160, "TX-MCS-160");
  1010		}
  1011	
  1012		if (band != NL80211_BAND_2GHZ &&
  1013		    cap[0] & IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
  1014			PRINT_NSS_SUPP(rx_mcs_80p80, "RX-MCS-80P80");
  1015			PRINT_NSS_SUPP(tx_mcs_80p80, "TX-MCS-80P80");
  1016		}
  1017	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
