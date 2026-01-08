Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD131B825
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 18:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767897491; cv=none; b=qzUOPIgf1YddtRlLPr8EbS1Q/XBYoW2L43QYAyloeUI6RSmG76U689eOlScDrpltZlnWFqMGobR69XBcWlU0qfsPcjQxd+8bOtPXx66+cXHKL6Um3I3081GhCFUeKCkGAgbUianTfONmN4ym3m5KPwEp1tyt4vNs65B6QnN5vww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767897491; c=relaxed/simple;
	bh=oe3TQpcC1D4mKqD7Dl/Yk7tsa4DwnuAHD/6sfhA743k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DpdgFNR67lmHVspYRtcRCWscSTGbbw18Y+YqfCYohoJZ6/IY5QaP8P7BKHq97OztPvfr2qXEqtgillNs1JXgMEJ4/Z2n3tz6Mm9h8nLSoaWS3uVxmWwQ4p405v8Vyc7hoeAyEqg4sJBFG0ZXemy5/F3mjwEjIgUFsiq8hqiYgCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dP4+k5W8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dP4+k5W8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767897489; x=1799433489;
  h=date:from:to:cc:subject:message-id;
  bh=oe3TQpcC1D4mKqD7Dl/Yk7tsa4DwnuAHD/6sfhA743k=;
  b=dP4+k5W8RJEDt/VZXG5k2eMcv+y4RZ6/+wH5vGiUsvZyybOORAc53ojN
   ib5KNT6uJcwtg8OrGdZ2Z/DH1m3WJQ3yDDC4G0CmDkeaYPze6kzyspR0r
   PGiVvBsKK5LN5p0UvFi4sZysJSbZAxNkUwgnm69IthhijBqtSI0oWUh5n
   9KQvBrRw9p5Kdj477odk3DM3uNskdGxtX7SgX43rRf/ZoWQg9ckjKJXZI
   Siqg4vI9xvqWQV1GVLWGvjj5X2/JdhPtjTZ2JgRQ2izkA4qwhZ0Don09+
   rV1oepDNfSBmUvHZvOGlcNjSDED436a5q9hPW9dK1W1VB7pIVKJjiFBvB
   A==;
X-CSE-ConnectionGUID: h2rS4LJ7RdCfbrggGeXO8Q==
X-CSE-MsgGUID: qw35mHT7R/ueGD9Cxq937A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69194712"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69194712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 10:38:07 -0800
X-CSE-ConnectionGUID: YX0n27UQRAWiEqnEPbRIgw==
X-CSE-MsgGUID: C20wucRKRfOQ1ull9g+Jdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="207810178"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jan 2026 10:38:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdutX-0000000054W-0mRL;
	Thu, 08 Jan 2026 18:38:03 +0000
Date: Fri, 09 Jan 2026 02:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Johannes Berg <johannes.berg@intel.com>
Subject: [iwlwifi-next:nan 9/46] ERROR: modpost: "__umoddi3"
 [drivers/net/wireless/virtual/mac80211_hwsim.ko] undefined!
Message-ID: <202601090248.sbcLmpfR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan
head:   ef17da8fe0ae228176b066e096126a5ea77fe979
commit: 3472916471107e29a2ed524a634ccc143629dca8 [9/46] wifi: mac80211_hwsim: register beacon timer by calculating TBTT
config: i386-randconfig-006-20260108 (https://download.01.org/0day-ci/archive/20260109/202601090248.sbcLmpfR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090248.sbcLmpfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090248.sbcLmpfR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/net/wireless/virtual/mac80211_hwsim.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
