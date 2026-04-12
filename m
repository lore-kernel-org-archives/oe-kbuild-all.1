Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A8339A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Apr 2026 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775984318; cv=none; b=JyumyNDqcbKmqKMNMx2tSJfmGL1VJ2oIo/fKj/gVb1/LNmZTol+WRfXv2IF4mOAa+kkNImPtDqY/Ud0x28NWk3l9EnA7WwpRNIdvaHPMP2U4TGEE1Z5E3Qhft5/wcEvtNtl3dj3KzilkO/A7L2DynK+BGUvdg/gziSYN4qvMzms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775984318; c=relaxed/simple;
	bh=K7KjJl2qLsoD103xwVCqtlnGqixut41eaOwRUHLveUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C1gST+G1tltmsJI0bCaJCArHmdo7HqHuuGSTeZR5LhOD8yexZahAZR5X4zw680DFOPPZC7qWhlmWY9jAU6ImWqrFoHnzWmQ4ODx3hYLGG3g1xjmm+Mmwlx0owiQav4m1kfL0yJhAANcPO/f/vmjhlMjczongE5Fzutuz0kMfYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi56AlqM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi56AlqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775984315; x=1807520315;
  h=date:from:to:cc:subject:message-id;
  bh=K7KjJl2qLsoD103xwVCqtlnGqixut41eaOwRUHLveUk=;
  b=Gi56AlqMDHSeO9e/zsikou9K56eW4FEtWnjhemrNL2hyH2jQAX21d7Cs
   BCpwgwlTuhNxuzMkYnI6c+CE1dxXMu0mORtA/tAA53lwVNpuukOvNedyi
   CvLyxX8WguWnaxTjQ0dje81L28/9gH/RvGrHjXSBeX8RWmbUxbms7ElmT
   MFqSvQ/arf7Pbc6djYadhGmZsP0lZGNrUDRu8Xmb1q7I7jmlJXUBspHtS
   P9WNM6IVwId3U/Gjoo5X8drKOtkOYTgxRt6OUveSMubavdk4GNeGOABh8
   F1rHP/JoSIYIu/5znc0IATDF8C7gUKwfeuhSakbsDted4GmpzXwq5rcbI
   g==;
X-CSE-ConnectionGUID: Ivx4dVJ2TpSVKRIUqjLGJA==
X-CSE-MsgGUID: Zcs62wRqRkiYeOvrdhUiLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94337225"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="94337225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 01:58:35 -0700
X-CSE-ConnectionGUID: vTKcA0A4Twih4gPDOQesCA==
X-CSE-MsgGUID: 4+ggRwYyQAittpZbC+vIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="252900307"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2026 01:58:33 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBqeF-0000000023X-1Sjd;
	Sun, 12 Apr 2026 08:58:31 +0000
Date: Sun, 12 Apr 2026 16:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 1/1]
 drivers/usb/musb/da8xx.c:86: warning: Function parameter or struct member
 'musb' not described in 'da8xx_musb_enable'
Message-ID: <202604121600.kD4AXihx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5f9b673221e971553e198f78304aa6f4db751402
commit: dfc80ed249b618f2cf48481adc8aff0d8ef444b4 [1/1] ARM: davinci: da850: fix selecting ARCH_DAVINCI_DA8XX
config: arm-randconfig-r073-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121600.kD4AXihx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121600.kD4AXihx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121600.kD4AXihx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/musb/da8xx.c:86: warning: Function parameter or struct member 'musb' not described in 'da8xx_musb_enable'
>> drivers/usb/musb/da8xx.c:105: warning: Function parameter or struct member 'musb' not described in 'da8xx_musb_disable'


vim +86 drivers/usb/musb/da8xx.c

e6480faa1067af9 Felipe Balbi    2010-12-02   74  
3ee076dea68e11d Sergei Shtylyov 2010-09-24   75  /*
3ee076dea68e11d Sergei Shtylyov 2010-09-24   76   * Because we don't set CTRL.UINT, it's "important" to:
3ee076dea68e11d Sergei Shtylyov 2010-09-24   77   *	- not read/write INTRUSB/INTRUSBE (except during
3ee076dea68e11d Sergei Shtylyov 2010-09-24   78   *	  initial setup, as a workaround);
3ee076dea68e11d Sergei Shtylyov 2010-09-24   79   *	- use INTSET/INTCLR instead.
3ee076dea68e11d Sergei Shtylyov 2010-09-24   80   */
3ee076dea68e11d Sergei Shtylyov 2010-09-24   81  
3ee076dea68e11d Sergei Shtylyov 2010-09-24   82  /**
743411b3f3e96e8 Felipe Balbi    2010-12-01   83   * da8xx_musb_enable - enable interrupts
3ee076dea68e11d Sergei Shtylyov 2010-09-24   84   */
743411b3f3e96e8 Felipe Balbi    2010-12-01   85  static void da8xx_musb_enable(struct musb *musb)
3ee076dea68e11d Sergei Shtylyov 2010-09-24  @86  {
3ee076dea68e11d Sergei Shtylyov 2010-09-24   87  	void __iomem *reg_base = musb->ctrl_base;
3ee076dea68e11d Sergei Shtylyov 2010-09-24   88  	u32 mask;
3ee076dea68e11d Sergei Shtylyov 2010-09-24   89  
3ee076dea68e11d Sergei Shtylyov 2010-09-24   90  	/* Workaround: setup IRQs through both register sets. */
3ee076dea68e11d Sergei Shtylyov 2010-09-24   91  	mask = ((musb->epmask & DA8XX_USB_TX_EP_MASK) << DA8XX_INTR_TX_SHIFT) |
3ee076dea68e11d Sergei Shtylyov 2010-09-24   92  	       ((musb->epmask & DA8XX_USB_RX_EP_MASK) << DA8XX_INTR_RX_SHIFT) |
3ee076dea68e11d Sergei Shtylyov 2010-09-24   93  	       DA8XX_INTR_USB_MASK;
3ee076dea68e11d Sergei Shtylyov 2010-09-24   94  	musb_writel(reg_base, DA8XX_USB_INTR_MASK_SET_REG, mask);
3ee076dea68e11d Sergei Shtylyov 2010-09-24   95  
3ee076dea68e11d Sergei Shtylyov 2010-09-24   96  	/* Force the DRVVBUS IRQ so we can start polling for ID change. */
3ee076dea68e11d Sergei Shtylyov 2010-09-24   97  	musb_writel(reg_base, DA8XX_USB_INTR_SRC_SET_REG,
3ee076dea68e11d Sergei Shtylyov 2010-09-24   98  			DA8XX_INTR_DRVVBUS << DA8XX_INTR_USB_SHIFT);
3ee076dea68e11d Sergei Shtylyov 2010-09-24   99  }
3ee076dea68e11d Sergei Shtylyov 2010-09-24  100  
3ee076dea68e11d Sergei Shtylyov 2010-09-24  101  /**
743411b3f3e96e8 Felipe Balbi    2010-12-01  102   * da8xx_musb_disable - disable HDRC and flush interrupts
3ee076dea68e11d Sergei Shtylyov 2010-09-24  103   */
743411b3f3e96e8 Felipe Balbi    2010-12-01  104  static void da8xx_musb_disable(struct musb *musb)
3ee076dea68e11d Sergei Shtylyov 2010-09-24 @105  {
3ee076dea68e11d Sergei Shtylyov 2010-09-24  106  	void __iomem *reg_base = musb->ctrl_base;
3ee076dea68e11d Sergei Shtylyov 2010-09-24  107  
3ee076dea68e11d Sergei Shtylyov 2010-09-24  108  	musb_writel(reg_base, DA8XX_USB_INTR_MASK_CLEAR_REG,
3ee076dea68e11d Sergei Shtylyov 2010-09-24  109  		    DA8XX_INTR_USB_MASK |
3ee076dea68e11d Sergei Shtylyov 2010-09-24  110  		    DA8XX_INTR_TX_MASK | DA8XX_INTR_RX_MASK);
3ee076dea68e11d Sergei Shtylyov 2010-09-24  111  	musb_writel(reg_base, DA8XX_USB_END_OF_INTR_REG, 0);
3ee076dea68e11d Sergei Shtylyov 2010-09-24  112  }
3ee076dea68e11d Sergei Shtylyov 2010-09-24  113  

:::::: The code at line 86 was first introduced by commit
:::::: 3ee076dea68e11d4685972df7298b80b8e7673e4 usb: musb: introduce DA8xx/OMAP-L1x glue layer

:::::: TO: Sergei Shtylyov <sshtylyov@ru.mvista.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
