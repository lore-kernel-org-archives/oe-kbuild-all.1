Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE731FCCE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733815516; cv=none; b=A3RbTGkHtcE56ITzKNjpx6oHxEobrB7ozQdbsJzMdv187HfT0APsKnx0jX2Sv147wOiQAGqMm1ChSKdXKDykibJguzqq9N23YqlDg/QY27uX9Pw4jxEWHC1hiIKD55LVifLoKoUZM0VXhMSLdsw+sycvae8Jaa1ZIveGUWdS08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733815516; c=relaxed/simple;
	bh=Ub49DNftYhYQSh1jNeOwljT6iuLvJ0aZ7vs49ou2uFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QO0Pa/vL47w2wNLDUK1G5T6aGQKmIisTJH/NntWCcpA4bcubvVpvCSumvWX2doR/H9MUwPWCjAgrXd/SOCUQ3inqYp4lfTyA9rxV7JFBt5IGb5UO3YLTR8rYL7dDGEi7in79mYN4l3G9Ukd4qaahvmZbjPK67l3rYj+tgTocUbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMTpUN4Z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMTpUN4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733815514; x=1765351514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ub49DNftYhYQSh1jNeOwljT6iuLvJ0aZ7vs49ou2uFs=;
  b=TMTpUN4ZWLT9g5wVqDYsPG2eBOC59sOSFpDfmkwdMf9Edqmf9KYLX4rR
   9ByECwbPmDGar+XOQCCe1VqNOBCW33yvgag6CN6YjKAEzRRQ2wexnleF5
   vAR9PsbRFI9oR8VzfC+SqRu1E5uFJhEkMDUUXsC1T9+krbD2SVGmOUsOq
   kzzLpzSDOYBoPUqY795ZMwWyXA0iUaJzdrABII2QsnAAsqUuIvY8NFFfr
   4MzU/lTaM0XbFQTxYm/eCf9F3X8vi7b51sKyqZivkeK/9PXRG0TE5eSR/
   w2K8dwW5tTxv1U6QU8vCeafzKzUhOd7XJb03DJNdthZfrg2xwopvocoTy
   A==;
X-CSE-ConnectionGUID: AW01Bd6NSBuw+vaK7sgF2g==
X-CSE-MsgGUID: 2Q1cbII+Q2u+I7fgWdxYUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37829846"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="37829846"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:25:13 -0800
X-CSE-ConnectionGUID: Xe9dhn+xTj2c8QdVuaQGiA==
X-CSE-MsgGUID: COUFFVRYQCyNVMzoki81WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="100272683"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2024 23:25:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKucH-0005Er-0A;
	Tue, 10 Dec 2024 07:25:09 +0000
Date: Tue, 10 Dec 2024 15:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 1434/2442] phy-mtk-hdmi.c:undefined reference to
 `devm_regulator_register'
Message-ID: <202412101533.zHMBJARL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d1486dca38afd08ca279ae94eb3a397f10737824
commit: 49393b2da1cd5b0a6859693369b4fb27df59d3e2 [1434/2442] phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator
config: s390-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101533.zHMBJARL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101533.zHMBJARL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101533.zHMBJARL-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function `mtk_hdmi_phy_register_regulators':
>> phy-mtk-hdmi.c:(.text.unlikely+0x118): undefined reference to `devm_regulator_register'
   s390-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_is_enabled':
>> phy-mtk-hdmi-mt8195.c:(.text+0x13e): undefined reference to `rdev_get_drvdata'
   s390-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_enable':
   phy-mtk-hdmi-mt8195.c:(.text+0x49e): undefined reference to `rdev_get_drvdata'
   s390-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_disable':
   phy-mtk-hdmi-mt8195.c:(.text+0x5ce): undefined reference to `rdev_get_drvdata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
