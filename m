Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D8414EC73
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 22:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840094; cv=none; b=P7862QhjRJAofBCTI3OxRP9X2MaGBuEiaziyOJPZ/kpqRbD/sIHNilE+hmjuFpBMlDPFezocInFAJaGlKQ65uIThxoJGa4sd2eTxoRdhY2DCvbuK111Z8ZLFiTblTCjTSeWGQrd5RyKgY0R3wTmHPgWToc9BshWftuC2PH5mTFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840094; c=relaxed/simple;
	bh=SLQp4BdXi62K2QLnDb1lJiKMdtq/pGYvpk18dMg3TVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYRkb01oe63BqdZw3d1Cemm9oKudlaCm7g3B3/7cGBmuFkNWSqujpZqFSGlpq7/rGI1zK+wGn8dJv/YnRtkFda1MjHsgJ7HHlTBRjbVq+1EulvhrdCaRiFQGw+mCt2JSFUf+zugQjrYZC5J3eRJkMWLQumvwNl7FMpKcmTsEUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W59i23SU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W59i23SU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840092; x=1783376092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SLQp4BdXi62K2QLnDb1lJiKMdtq/pGYvpk18dMg3TVU=;
  b=W59i23SUvFMS43xK8qL2KWovnh4srQ/h/WsftcUg4+a+u6OXtOGCTMin
   ygnCzS5LXIJRXzgBA+aL95BW6D1XV2I5bGv9dwciSOLZgWITiL2/oHVSx
   fr7d+c2lhhgOxeNJBNJnVmlwBN4D80AQUs7DdROJLS3spTQiYlmy0QwLO
   rFc2bfU3CIVSlejp4zGrZcznn2Pk6t3WBRQ9elfPpmy+nH3MV2RNVuBSq
   AiZxmrXomIZvjVfsvUZ6ZqOp02trBnOYW6zB2sQivc9iblf2hVuw9rb9i
   yda5Z6xtASDwXuYwcVsQr6q9SyKdOjTiGYNa+Uz9n2DsHxjhpPIsQ5G0m
   g==;
X-CSE-ConnectionGUID: l/TurM+fS4KFVwhatx3fQQ==
X-CSE-MsgGUID: sYNFV6TkSzORPUBlNMwg7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65123381"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="65123381"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:51 -0700
X-CSE-ConnectionGUID: TUjsHo7iQtOP6ixp/Wd+Yw==
X-CSE-MsgGUID: MQ6WzQ6pRn+AtoWlmColtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154802323"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdH-00001M-36;
	Sun, 06 Jul 2025 22:14:47 +0000
Date: Mon, 7 Jul 2025 06:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Lucien.Jheng" <lucienzx159@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 6231/7381] air_en8811h.c:undefined reference to
 `clk_restore_context'
Message-ID: <202507070502.Qe2Ag6iS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
commit: 6b9c9def95cb402374730d51a1f44927f467b774 [6231/7381] net: phy: air_en8811h: Introduce resume/suspend and clk_restore_context to ensure correct CKO settings after network interface reinitialization.
config: sh-randconfig-001-20250707 (https://download.01.org/0day-ci/archive/20250707/202507070502.Qe2Ag6iS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070502.Qe2Ag6iS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070502.Qe2Ag6iS-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_resume':
>> air_en8811h.c:(.text+0x564): undefined reference to `clk_restore_context'
   sh4-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_suspend':
>> air_en8811h.c:(.text+0x59c): undefined reference to `clk_save_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
