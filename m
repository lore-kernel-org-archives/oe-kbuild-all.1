Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4D3033E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788120786; cv=none; b=Z3y+gJt8l9xY4foymGCQWB3UbsC0fpLKFIaD14ek6kGO/KKHgG8d6emNUj65f23gJW/vcgIP3BG3WXSZt1pWnCdZBgqYsWQmmlahUkuo65a8OHXB7wjlXsvIHU3YV++jL7wc+kW4dCOqszGeWixiNhOQFN48FvjU00FRS6kdyW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788120786; c=relaxed/simple;
	bh=MzTS0LgVhM+aAmvFV03hrXnHPoCu05lPhRxfACTOOxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DjYAZqK/IDEsa9ICuA9vBpKv6rUKiltsQ9jyncobjTeD8Ss/l6EDsoL+YqVpAsL0T0tjxGB7lwOvHCd6vuvDreB1WkhygJHa15Fh8x6QUk7g23/1rPa/y0MpQNyZEC6owNVwSP2LbfH93sJFhEpfvS02hIgkP1i4vcoiTw561nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhabHfsz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhabHfsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788120784; x=1819656784;
  h=date:from:to:cc:subject:message-id;
  bh=MzTS0LgVhM+aAmvFV03hrXnHPoCu05lPhRxfACTOOxA=;
  b=JhabHfszYoaRB9aZViZ3+qqYRgLd5Nq5emGP696mnHVdvw9zrkcFdj9r
   PnrF18lNCVF9NKpn9SPN41uu5v5SNIBMi/Fe5ZHXRTFcQ5aUerMgRRXG4
   j5P71fSaW3XqQSkrX6EkIztc9lAP820DikWArVfVj3T2HBiHWxSCCV3+O
   dofpmcCJdzWIo2sSYEAVzUXHAB262q0mNZyxKjpYSF+o6LVvgG9x5oVKy
   lL39tZeufVZsl7RKBAZ8RMMDQj9dnsmsEbwNLbUIXYMVZvA29mVu6IJhp
   exja0b9iganw9Q/vzi4u3VA/ie4stAEPBiAaTFxmaLsnTO55AaWkGDwvC
   g==;
X-CSE-ConnectionGUID: Ojbwh+saSMOiZsQNXp2z+A==
X-CSE-MsgGUID: 4zkMoKZjTLWenckN2ys66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88459084"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88459084"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 13:13:03 -0700
X-CSE-ConnectionGUID: e4iv0HbyT6itchkzdvE/pA==
X-CSE-MsgGUID: xaTSCVclQ3SVPrXX+CUeVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="262496663"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2026 13:13:01 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0ltj-000000000Cr-0FCN;
	Sun, 30 Aug 2026 20:12:59 +0000
Date: Sun, 30 Aug 2026 22:12:33 +0200
From: kernel test robot <lkp@intel.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/ethtool/pse-pd.c:287:undefined reference to
 `phy_pse_control_lock'
Message-ID: <202608302239.ZpkaN51z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Carlo-Szelinsky/net-pse-pd-add-notifier-chain-for-controller-lifecycle-events/20260827-000340
head:   16e3924b8f46ad1002a2937228ba031223e3b7ec
commit: bd47f5cd512aaf1ab36475e5bfa5c5102d0a4c5d net: phy: use a dedicated mutex instead of rtnl for PSE control attach
date:   4 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260830/202608302239.ZpkaN51z-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302239.ZpkaN51z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302239.ZpkaN51z-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: net/ethtool/pse-pd.o: in function `ethnl_set_pse':
>> net/ethtool/pse-pd.c:287:(.text+0x1e4): undefined reference to `phy_pse_control_lock'
>> s390x-linux-gnu-ld: net/ethtool/pse-pd.c:331:(.text+0x2a6): undefined reference to `phy_pse_control_unlock'
   s390x-linux-gnu-ld: net/ethtool/pse-pd.c:331:(.text+0x2f6): undefined reference to `phy_pse_control_unlock'
   s390x-linux-gnu-ld: net/ethtool/pse-pd.o: in function `pse_prepare_data':
   net/ethtool/pse-pd.c:74:(.text+0xd2c): undefined reference to `phy_pse_control_lock'
   s390x-linux-gnu-ld: net/ethtool/pse-pd.c:76:(.text+0xd70): undefined reference to `phy_pse_control_unlock'


vim +287 net/ethtool/pse-pd.c

   276	
   277	static int
   278	ethnl_set_pse(struct ethnl_req_info *req_info, struct genl_info *info)
   279	{
   280		struct nlattr **tb = info->attrs;
   281		struct phy_device *phydev;
   282		int ret;
   283	
   284		phydev = ethnl_req_get_phydev(req_info, tb, ETHTOOL_A_PSE_HEADER,
   285					      info->extack);
   286	
 > 287		phy_pse_control_lock();
   288	
   289		ret = ethnl_set_pse_validate(phydev, info);
   290		if (ret)
   291			goto out;
   292	
   293		if (tb[ETHTOOL_A_PSE_PRIO]) {
   294			unsigned int prio;
   295	
   296			prio = nla_get_u32(tb[ETHTOOL_A_PSE_PRIO]);
   297			ret = pse_ethtool_set_prio(phydev->psec, info->extack, prio);
   298			if (ret)
   299				goto out;
   300		}
   301	
   302		if (tb[ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT]) {
   303			unsigned int pw_limit;
   304	
   305			pw_limit = nla_get_u32(tb[ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT]);
   306			ret = pse_ethtool_set_pw_limit(phydev->psec, info->extack,
   307						       pw_limit);
   308			if (ret)
   309				goto out;
   310		}
   311	
   312		/* These values are already validated by the ethnl_pse_set_policy */
   313		if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL] ||
   314		    tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL]) {
   315			struct pse_control_config config = {};
   316	
   317			if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL])
   318				config.podl_admin_control = nla_get_u32(tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL]);
   319			if (tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL])
   320				config.c33_admin_control = nla_get_u32(tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL]);
   321	
   322			/* pse_ethtool_set_config() will do nothing if the config
   323			 * is zero
   324			 */
   325			ret = pse_ethtool_set_config(phydev->psec, info->extack,
   326						     &config);
   327		}
   328	
   329	out:
   330		/* Return errno or zero - PSE has no notification */
 > 331		phy_pse_control_unlock();
   332		return ret;
   333	}
   334	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
