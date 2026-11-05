Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905948;
	b=zS1FKoehTj2pKFZZoFy/WsgKdxj7hy/5XEbqXz9QQ1x9sioVWWe5PgmJElAZldAuR84c
	 ugVnwAuvIhdNMOl3iycAzsS5FR1WsI1kCwqRTI4/Buyd7kvCXcPYiWmPz54qejy4G/xBe
	 CgxTM13zWYefrsTa9qHLbrYqJgBy7Cj+ETenccezM6q8OciIX30RnWpNTZTWbyBZTjano
	 rB/giUkSio8M8EyUsGqUb323CDBznoVNuHgrS2RbBbmQtWYm/15gyt3zwJ7Vlk7z5Fx1R
	 QtO9ihRETRHQdBgcRZnC+HPTa/1urBp4KQLopBcshG3/VFWqaraHERkYqYhRkzWTYhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905948;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hy7JJ0SbH/t6xDwsEtvd8ua6DrU4regn4+FcmoZwt38=;
	b=bpP7vkUPBxEluPTyQ3OGtDEB3Z9lLO5DviUszYWZ0xfEWNdBc6PU5hS5b0ea97VCwtkm
	 234EPKpMx2Svv1IRxnHpGlxxKLaT/q9cdCKoFvEJjUYuVOrTheYFVJELvqFwagvGsn/Wp
	 J0yT3vJ0E0d8AoVHqHWmIgW6kQNadBA4/0+1uZgMmxi3OPnkRDSgU0OKVhJWfL/Og8KpY
	 u8hf1Hycp6TzApZ3vI2+6LgLj2TdP02kEOEg71du3uOVaLq/KpOocG9P1RLPbsCGny4hB
	 8ue4bjdPpFjmInnErq3ha0k8kiLFz+RQTXM1Kv5FPwCy7on5QiPwnnfPcpLD1W3Z+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JffNlRIc;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB1606D807
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 19:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9CB1606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JffNlRIc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793905947; x=1825441947;
  h=date:from:to:cc:subject:message-id;
  bh=yqDyX0ailfesNEPizEahD6jvAuhHLn6xQb0GKRFhgdg=;
  b=JffNlRIcNj6uPRQdSx1o2r9ieJw7kz9vi5+/n5+znZKBY2/ohXpJPVrJ
   8IQM8OtP/Gjrvh8Msr5QxUnbZqcaV+5SVbu3NBr+PvE3MlAr+6dLKbHLH
   EM2s+mWak/k8Rd5A0r0HNGC2R1CATV4M2vn2K4S41uYqtXzYVQPyBVF7h
   WMoKxNnqc+wbjhqQ8x+PDS1QtYAKzflIDg3ioEFGD6rLomknt7a1AIRC8
   r4/NQ/iVTaWucVu8pPhSOVL1PdP2kW2ia/IL+KQVovNi/a262cGgIHREt
   ndgpN1aAiW/HNMFKeAM+nH/lTJVAy55vcvMK5+uWaGtRwGM8+ERsdKlo6
   w==;
X-CSE-ConnectionGUID: sTana4oSS5ytPNYRlWr5ug==
X-CSE-MsgGUID: i/WdKIjGS/WBCulisGAuiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2598124"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2598124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 11:12:27 -0800
X-CSE-ConnectionGUID: bz7jVO1JTHmEQh2xtb0p6Q==
X-CSE-MsgGUID: hlvE3R7ISmyxl8dsPHVpaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6919331"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2026 11:12:25 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP2sn-000000009lP-1EgU;
	Thu, 05 Nov 2026 19:12:21 +0000
Date: Thu, 05 Nov 2026 20:12:01 +0100
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [spacemit-com:wip/k3-ufs 2/4] Warning:
 drivers/ufs/host/ufs-spacemit.c:611 static const struct ufs_hba_variant_ops
 ufs_hba_spacemit_vops = { .name = "ufshcd-spacemit", .init =
 ufs_spacemit_init, .link_startup_notify = ufs_spacemit_link_startup_notify,
 .negotiate_pwr_mode = ufs_spacemi...
Message-ID: <202611052010.5TwdeAL7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/spacemit-com/linux wip/k3-ufs
head:   e1882b3856480b6a204f21fd16742fce6cbe2ca6
commit: 1c5046aacbfe053aa225f17069c8a410d2a97181 [2/4] scsi: ufs: spacemit: k3: Add UFS Host Controller driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611052010.5TwdeAL7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052010.5TwdeAL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052010.5TwdeAL7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ufs/host/ufs-spacemit.c:611 static const struct ufs_hba_variant_ops ufs_hba_spacemit_vops = { .name = "ufshcd-spacemit", .init = ufs_spacemit_init, .link_startup_notify = ufs_spacemit_link_startup_notify, .negotiate_pwr_mode = ufs_spacemit_negotiate_pwr_mode, .pwr_change_notify = ufs_spacemit_pwr_change_notify, .device_reset = ufs_spacemit_device_reset, .event_notify = ufs_spacemit_event_notify, .apply_dev_quirks = ufs_spacemit_apply_dev_quirks, .hibern8_notify = ufs_spacemit_hibern8_notify, }; error: Cannot parse struct or union!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
