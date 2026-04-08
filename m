Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC0331CA4E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775614966; cv=none; b=MHhTAy2B6kHrtzHl1/DswB4GgGdpb42synaB0MXO1ODvfl2CDvmjDBsoRNaddywZwinmW+l9Onh6D9q34whuGAIcTpBs8qnysNXDmVai9gAXQng/zrhWvRiJ5LGiG22UlytAhFAbBYfFThf5k5EFlDgJVlsordiLPAPoR9HxPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775614966; c=relaxed/simple;
	bh=G/ybkeXCro7yc2EZ/oX3x+XL6ExUMSiAnW4RJdguI+w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LsS2Ek+mOsi/JDGGNBAys8LjifReQ2E6gKx7qhFTHePBKrcE0ES0q9RucDaD0KZEEMmW1b5M6typb8TVsxlh9tjCd2dYLwnvp+QWytJvou7C12fZf/gcdtAfuV5Cgl4fI7cf2X3spKYmZwMqUHJWTrpdVHlnzJX/UyQHPxnHfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0d1AsZh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0d1AsZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775614965; x=1807150965;
  h=date:from:to:cc:subject:message-id;
  bh=G/ybkeXCro7yc2EZ/oX3x+XL6ExUMSiAnW4RJdguI+w=;
  b=L0d1AsZhtCjj2PetQ5CXorEHGPQoLLTLCBoJPmLoZ9y9EKyNAMVU2NQr
   5iAWBA5M53l8sL7+oXVvsqbUQJpxaRgb/eaqi/pt/T2GrDr2duY1oAxJk
   aLVQ/m3OrhzBbKRXUrit2nc0f0kJha+YYbnvvUnT33LnVnTrEnItBg8lM
   pBaRAC1v5tz5qCkXGpnk8vx+Jb0wjHvJI5/GtBx5Dse6tjaxK74XIsITl
   Eq1YyRO/S/yra2jJ+XklEsbEtoLsp9QrR989pcxVxbbrmci42i3BU52QS
   2gNG7BBGGOuCEwQKoT1e6G1ePlsu7IoQr50QnGlTlTvxHyX7+SuD5cJS4
   g==;
X-CSE-ConnectionGUID: zu8+FtqRSIqF1rCyohtmZQ==
X-CSE-MsgGUID: OwM23g3+Rk+UuzfM5F6XwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76601212"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76601212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 19:22:44 -0700
X-CSE-ConnectionGUID: 9iXHsZEvRouQXZwFgkuK6g==
X-CSE-MsgGUID: /fAbnTJYSHaa5UcNMarwBA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Apr 2026 19:22:42 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAIYy-000000001KH-0UjD;
	Wed, 08 Apr 2026 02:22:40 +0000
Date: Wed, 08 Apr 2026 10:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/panel/panel-edp.c:204: warning: Function
 parameter or member 'delay' not described in 'edp_panel_entry'
Message-ID: <202604081054.qXKdJnya-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3036cd0d3328220a1858b1ab390be8b562774e8a
commit: 5540cf8f3e8dac7ef2de28edcf2623c1516fbe45 drm/panel-edp: Implement generic "edp-panel"s probed by EDID
date:   4 years, 7 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260408/202604081054.qXKdJnya-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604081054.qXKdJnya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probed by EDID")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081054.qXKdJnya-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or member 'delay' not described in 'edp_panel_entry'
>> drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or member 'name' not described in 'edp_panel_entry'


vim +204 drivers/gpu/drm/panel/panel-edp.c

   191	
   192	/**
   193	 * struct edp_panel_entry - Maps panel ID to delay / panel name.
   194	 */
   195	struct edp_panel_entry {
   196		/** @panel_id: 32-bit ID for panel, encoded with drm_edid_encode_panel_id(). */
   197		u32 panel_id;
   198	
   199		/* @delay: The power sequencing delays needed for this panel. */
   200		const struct panel_delay *delay;
   201	
   202		/* @name: Name of this panel (for printing to logs). */
   203		const char *name;
 > 204	};
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
