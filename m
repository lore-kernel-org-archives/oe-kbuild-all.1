Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B751C863B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 17:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664760; cv=none; b=j4nfZe6DVkBSiqKe8cHYHxWfIE56pmAwiCB4KyoegzSIHpY6rzTMsYB+J09kPaUvsg5A9vB/kR6j63SLJnXXZQbV6BbDK8cMVd0jhT8KfQUryVKANJ2PwnFXfgARDjmKTDexZkvF1VMJQ1/xKOKFYXWLJAjW74f674DVq4w4DuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664760; c=relaxed/simple;
	bh=g9a+zu7wcI87pfU2lwfKfobp5lCpDKz93LZ0XEFyIW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXAgZL6AjTF4dVqrLpWviLxUmQtDGocsEWgJNbCk30Tz87dPMDwy9QCh+cHT/MnbV7CWvqOc1Zdi23U9VpFrXtnUiukPZaJhMxtxk9/ZVcnyhUY3wg/Uhdf/L/C/R0tQBY6acu07iZHleJe8iJtFsOhyBiZosC5htJem4sNZF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBMer94K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBMer94K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749664759; x=1781200759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g9a+zu7wcI87pfU2lwfKfobp5lCpDKz93LZ0XEFyIW4=;
  b=oBMer94KBWFBd8IwETrh5lxUGl7yDKr1VOUmcxLRN2rVqUI5HNwxV1iZ
   eYjJlPmaz+9E31whlb8ann1AgP5QmqVPuzFn36eHF7nPCp7Uq4IF1AIY1
   2WyXUhHj7mxTvnHUgB3d1r/EYutwJcT3JB1Y3fuuHr56jVxsziwbSYf5w
   n1mEFWH/17f3XqZMzGD3MYyNpLdAZVAYs0AfSnHB4dtoYapY8KjEkIt9X
   fHYDyid3zpYQAjTOOsXE/Czs1rvh09CYL4xLZDUEwu0TxqA+YTE2NikYU
   sqMkYhY+Ea9djkbPBVxKn+kGXuF4l6Ekvz5T422dpGEtkTYOkcrbcej4O
   g==;
X-CSE-ConnectionGUID: Cxr84s5nTmGwtRl3zbKnnA==
X-CSE-MsgGUID: JHRsBYLqSOOefj+QWv6saw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62471211"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="62471211"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:59:17 -0700
X-CSE-ConnectionGUID: O/8Nt+SrRjuFRif15LSrpQ==
X-CSE-MsgGUID: uwJOzwt9TnufQu42yOW/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="152041990"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2025 10:59:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPPjF-000Akk-0p;
	Wed, 11 Jun 2025 17:59:13 +0000
Date: Thu, 12 Jun 2025 01:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb Connolly <caleb@connolly.tech>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [linux-next:master 1451/1841]
 drivers/gpu/drm/panel/panel-visionox-rm69299.c:352:42: sparse: sparse:
 symbol 'visionox_rm69299_shift_desc' was not declared. Should it be static?
Message-ID: <202506120158.gAv9jVB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   19a60293b9925080d97f22f122aca3fc46dadaf9
commit: 783334f366b1825d8ca22e3b8fac6dd7a662e5fd [1451/1841] drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq
config: i386-randconfig-063-20250611 (https://download.01.org/0day-ci/archive/20250612/202506120158.gAv9jVB9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120158.gAv9jVB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120158.gAv9jVB9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/panel/panel-visionox-rm69299.c:346:42: sparse: sparse: symbol 'visionox_rm69299_1080p_display_desc' was not declared. Should it be static?
>> drivers/gpu/drm/panel/panel-visionox-rm69299.c:352:42: sparse: sparse: symbol 'visionox_rm69299_shift_desc' was not declared. Should it be static?

vim +/visionox_rm69299_shift_desc +352 drivers/gpu/drm/panel/panel-visionox-rm69299.c

   351	
 > 352	const struct visionox_rm69299_panel_desc visionox_rm69299_shift_desc = {
   353		.mode = &visionox_rm69299_1080x2160_60hz,
   354		.init_seq = (const u8 *)visionox_rm69299_1080x2160_60hz_init_seq,
   355		.init_seq_len = ARRAY_SIZE(visionox_rm69299_1080x2160_60hz_init_seq),
   356	};
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
