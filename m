Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681C1AAE06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732224837; cv=none; b=WXoTPXl0MQil1QCGoM1wnQtf4Ah0pAx3a9F1MPIHU+5uMKELrhhJUmb8jW6wVhlK5JkmyiM+5Lj+/KxNhLN8g4qAX4V9j5LBmMSTi4HTZCGtQTjEgh4P/9c1jmdX5RKdnxBs7+IkfKzZuGvg2UHXo/pl192sxV6UrnfAE5XR0pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732224837; c=relaxed/simple;
	bh=KI2QnyWouYbxSsgicLUMYAWLBUtyDiglIHC+tI6A3bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBkTT4mR0dCQf6M0QSMdia7HISvbTKhXGVBM33D5nu2jLXahB61drvoNydBb+kX9TSC0iHxZ1jbBq3WCm9JOFIeprwF6Ea4SxDCYK16OyRdTfj/9QGBhjTMyILMwgZyrGX65hoCs7FjuMnw4nlKecO78yaGzA7jq9XKXrKbP9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqPb/4z5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqPb/4z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732224835; x=1763760835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KI2QnyWouYbxSsgicLUMYAWLBUtyDiglIHC+tI6A3bc=;
  b=IqPb/4z5PmxMNFwGgZtu3BR2PgtzA5t9PrlYHKs445ZiC420AmKDyI6B
   8Cp2lGE+p+iZ3++5hYsi6drWSFddMA86p5M+WMAnWqYy2PHA36zpwFXz6
   FbhskfM6STxLG5NWpgeUoglKVIna5cr2xTQG+lNifWRmTCylmVqygjM9Y
   E7tauQd8djMHbI5vJvnqvxGc69ccXC/R9qAjb/Juj/v5lvEfe2pNyJ3OB
   D0gL0krgji5PCyzAVDvODa0LtBWQvk6njtvwPAp+XiGrjzgztjCDqU4tx
   e3HvLQP+pJ23cwc1QQsiuHuBfRItdy/vhptoMGdb5+iKomBHyEE+M6UqY
   w==;
X-CSE-ConnectionGUID: aVxLELCmTgKIYWMRws4FWA==
X-CSE-MsgGUID: Pb6xfDpmR8StdpT5jNlvhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32421868"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32421868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 13:33:55 -0800
X-CSE-ConnectionGUID: bjUlHcedTs6EPtGgJCJ0yA==
X-CSE-MsgGUID: HNjleCPuQxSCxIq2LBPe4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="95323279"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2024 13:33:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEEoB-0003NI-0Q;
	Thu, 21 Nov 2024 21:33:51 +0000
Date: Fri, 22 Nov 2024 05:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Issam Hamdi <ih@simonwunderlich.de>
Cc: oe-kbuild-all@lists.linux.dev, johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	mathias.kretschmer@fit.fraunhofer.de, sw@simonwunderlich.de
Subject: Re: [PATCH v2] wifi: mac80211: fix mbss changed flags corruption on
 32 bit systems
Message-ID: <202411220516.wuQOEE8t-lkp@intel.com>
References: <20241118125640.1110502-1-ih@simonwunderlich.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118125640.1110502-1-ih@simonwunderlich.de>

Hi Issam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dfc14664794a4706e0c2186a0c082386e6b14c4d]

url:    https://github.com/intel-lab-lkp/linux/commits/Issam-Hamdi/wifi-mac80211-fix-mbss-changed-flags-corruption-on-32-bit-systems/20241121-150801
base:   dfc14664794a4706e0c2186a0c082386e6b14c4d
patch link:    https://lore.kernel.org/r/20241118125640.1110502-1-ih%40simonwunderlich.de
patch subject: [PATCH v2] wifi: mac80211: fix mbss changed flags corruption on 32 bit systems
config: arm64-randconfig-004-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220516.wuQOEE8t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220516.wuQOEE8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220516.wuQOEE8t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/mac80211/mesh.c: In function 'ieee80211_mbss_info_change_notify':
>> net/mac80211/mesh.c:1163:13: warning: the address of 'bits' will always evaluate as 'true' [-Waddress]
    1163 |         if (!bits)
         |             ^


vim +1163 net/mac80211/mesh.c

2b5e19677592c1 Thomas Pedersen 2013-02-14  1155  
2b5e19677592c1 Thomas Pedersen 2013-02-14  1156  void ieee80211_mbss_info_change_notify(struct ieee80211_sub_if_data *sdata,
15ddba5f43114c Anjaneyulu      2023-06-04  1157  				       u64 changed)
2b5e19677592c1 Thomas Pedersen 2013-02-14  1158  {
f81a9dedaff434 Thomas Pedersen 2013-06-13  1159  	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
f0e1110ae72964 Issam Hamdi     2024-11-18  1160  	unsigned long bits[] = { BITMAP_FROM_U64(changed) };
f81a9dedaff434 Thomas Pedersen 2013-06-13  1161  	u32 bit;
f81a9dedaff434 Thomas Pedersen 2013-06-13  1162  
f81a9dedaff434 Thomas Pedersen 2013-06-13 @1163  	if (!bits)
2b5e19677592c1 Thomas Pedersen 2013-02-14  1164  		return;
f81a9dedaff434 Thomas Pedersen 2013-06-13  1165  
f81a9dedaff434 Thomas Pedersen 2013-06-13  1166  	/* if we race with running work, worst case this work becomes a noop */
f0e1110ae72964 Issam Hamdi     2024-11-18  1167  	for_each_set_bit(bit, bits, sizeof(changed) * BITS_PER_BYTE)
6e48ebffc2db54 Felix Fietkau   2023-09-13  1168  		set_bit(bit, ifmsh->mbss_changed);
f81a9dedaff434 Thomas Pedersen 2013-06-13  1169  	set_bit(MESH_WORK_MBSS_CHANGED, &ifmsh->wrkq_flags);
16114496d684a3 Johannes Berg   2023-06-06  1170  	wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
2b5e19677592c1 Thomas Pedersen 2013-02-14  1171  }
2b5e19677592c1 Thomas Pedersen 2013-02-14  1172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
