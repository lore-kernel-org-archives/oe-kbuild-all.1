Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098621B9F5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 01:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765243916; cv=none; b=qO5B+YWkLS7/FGwFTFmrpDTYO8QuxWexHTgFUDP+uqWgG2jchBpET9LoHrPRNl0hoQAABDD6WJdZxJmtHiHTfdb6GoXZU/oIsM+orgByqngVamqNvxf778rGELOcIM47d9C8nXg9Ws8ilmMs6TSS6bflLTabqXltiMgvEksmbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765243916; c=relaxed/simple;
	bh=a+Iy0nr9RWNN3yxw6oWeXWJAsRV42FZCCkrybqA8aMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkJxgSjjju18V0ALTUh3J2hysRYCEVdCIjw0Ak1+Ngg+PsRvGmZEjVmqrBbjpRtWI5e+ACy7xlL+nnzs+2k7qAF834rbCzBNUxsVu3lQ5rtU/TnBeFvgPP0PX42fJd26M4Bl/dT9Luy3h21DQkCIKgMBqLEqM2zchqym1BLukqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Od7VsSaY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Od7VsSaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765243915; x=1796779915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+Iy0nr9RWNN3yxw6oWeXWJAsRV42FZCCkrybqA8aMA=;
  b=Od7VsSaY6pO+/ACciZoxyCSVwXYsIN5XFUikEebKoN/bBAJQOE/ZLKp+
   WQaii26sNUmK6EHfyVb0kc4KSIR6LgE/fDktr85hPMlX4A59vwvbJQDH7
   TN6Ig4L7WSMxpirrs8rLpKTtSyI3cv356VFxS9DN0s92seLD4MxTvFffE
   Tgd9RAuKwJhPo+k/Zem1baCOQ7yPuJxew2RBp5SqOM2m9ORBPVSjiPDp9
   xhxIl/Q+Sh4NwEVQq9rREyomLTawwP2B4p3wAOvrpUJtuwhCOS2o4Hd7D
   3aMKFoaQQhcjbhkDqZRq/UHR2Xy2m2vva9PyrnVzrHp1g7/50PANiqxpH
   Q==;
X-CSE-ConnectionGUID: gor+49idRNeZUUCKbK4foQ==
X-CSE-MsgGUID: zBvxtwoxSTuLjgm2qGCn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78313830"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="78313830"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 17:31:54 -0800
X-CSE-ConnectionGUID: 7fgj9GuOSZm+ydNKLebX0g==
X-CSE-MsgGUID: aUxtltnnR1uULcxAu8q5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196141038"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2025 17:31:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSmZy-0000000019K-0W6F;
	Tue, 09 Dec 2025 01:31:50 +0000
Date: Tue, 9 Dec 2025 09:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 36/36]
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c:61:8: warning: no previous
 prototype for function 'mtk_disp_outproc_crc_cnt'
Message-ID: <202512090902.2tc2BsdI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   5df2e81b9f63652fba901d69ccdd1518f736ad21
commit: 128c3864e6ce89c2eae2231e0fd787f0a309c69f [36/36] CHROMIUM: drm/mediatek: Remove mtk_disp_outproc.h and migrate CRC headers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251209/202512090902.2tc2BsdI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090902.2tc2BsdI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090902.2tc2BsdI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:61:8: warning: no previous prototype for function 'mtk_disp_outproc_crc_cnt' [-Wmissing-prototypes]
      61 | size_t mtk_disp_outproc_crc_cnt(struct device *dev)
         |        ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      61 | size_t mtk_disp_outproc_crc_cnt(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:68:6: warning: no previous prototype for function 'mtk_disp_outproc_crc_entry' [-Wmissing-prototypes]
      68 | u32 *mtk_disp_outproc_crc_entry(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | u32 *mtk_disp_outproc_crc_entry(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:75:6: warning: no previous prototype for function 'mtk_disp_outproc_crc_read' [-Wmissing-prototypes]
      75 | void mtk_disp_outproc_crc_read(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | void mtk_disp_outproc_crc_read(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:82:6: warning: no previous prototype for function 'mtk_disp_outproc_register_vblank_cb' [-Wmissing-prototypes]
      82 | void mtk_disp_outproc_register_vblank_cb(struct device *dev,
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:82:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      82 | void mtk_disp_outproc_register_vblank_cb(struct device *dev,
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:92:6: warning: no previous prototype for function 'mtk_disp_outproc_unregister_vblank_cb' [-Wmissing-prototypes]
      92 | void mtk_disp_outproc_unregister_vblank_cb(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      92 | void mtk_disp_outproc_unregister_vblank_cb(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:100:6: warning: no previous prototype for function 'mtk_disp_outproc_enable_vblank' [-Wmissing-prototypes]
     100 | void mtk_disp_outproc_enable_vblank(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | void mtk_disp_outproc_enable_vblank(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:108:6: warning: no previous prototype for function 'mtk_disp_outproc_disable_vblank' [-Wmissing-prototypes]
     108 | void mtk_disp_outproc_disable_vblank(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     108 | void mtk_disp_outproc_disable_vblank(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:137:6: warning: no previous prototype for function 'mtk_disp_outproc_config' [-Wmissing-prototypes]
     137 | void mtk_disp_outproc_config(struct device *dev, unsigned int w,
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | void mtk_disp_outproc_config(struct device *dev, unsigned int w,
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:156:6: warning: no previous prototype for function 'mtk_disp_outproc_start' [-Wmissing-prototypes]
     156 | void mtk_disp_outproc_start(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     156 | void mtk_disp_outproc_start(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:184:6: warning: no previous prototype for function 'mtk_disp_outproc_stop' [-Wmissing-prototypes]
     184 | void mtk_disp_outproc_stop(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     184 | void mtk_disp_outproc_stop(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:207:6: warning: no previous prototype for function 'mtk_disp_outproc_crc_reset' [-Wmissing-prototypes]
     207 | void mtk_disp_outproc_crc_reset(struct device *dev, struct cmdq_pkt *cmdq_pkt)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:207:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     207 | void mtk_disp_outproc_crc_reset(struct device *dev, struct cmdq_pkt *cmdq_pkt)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:221:6: warning: no previous prototype for function 'mtk_disp_outproc_crc_attach' [-Wmissing-prototypes]
     221 | void mtk_disp_outproc_crc_attach(struct device *dev, struct mtk_crtc *data)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | void mtk_disp_outproc_crc_attach(struct device *dev, struct mtk_crtc *data)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:228:6: warning: no previous prototype for function 'mtk_disp_outproc_crc_detach' [-Wmissing-prototypes]
     228 | void mtk_disp_outproc_crc_detach(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     228 | void mtk_disp_outproc_crc_detach(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:235:5: warning: no previous prototype for function 'mtk_disp_outproc_clk_enable' [-Wmissing-prototypes]
     235 | int mtk_disp_outproc_clk_enable(struct device *dev)
         |     ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | int mtk_disp_outproc_clk_enable(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:242:6: warning: no previous prototype for function 'mtk_disp_outproc_clk_disable' [-Wmissing-prototypes]
     242 | void mtk_disp_outproc_clk_disable(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:242:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     242 | void mtk_disp_outproc_clk_disable(struct device *dev)
         | ^
         | static 
   15 warnings generated.


vim +/mtk_disp_outproc_crc_cnt +61 drivers/gpu/drm/mediatek/mtk_disp_outproc.c

f3e6b1244e7c0a Nancy.Lin     2025-01-10   60  
b7c8e781f020aa Sunny.Shen    2024-09-11  @61  size_t mtk_disp_outproc_crc_cnt(struct device *dev)
b7c8e781f020aa Sunny.Shen    2024-09-11   62  {
b7c8e781f020aa Sunny.Shen    2024-09-11   63  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
b7c8e781f020aa Sunny.Shen    2024-09-11   64  
b7c8e781f020aa Sunny.Shen    2024-09-11   65  	return priv->crc.cnt;
b7c8e781f020aa Sunny.Shen    2024-09-11   66  }
b7c8e781f020aa Sunny.Shen    2024-09-11   67  
b7c8e781f020aa Sunny.Shen    2024-09-11  @68  u32 *mtk_disp_outproc_crc_entry(struct device *dev)
b7c8e781f020aa Sunny.Shen    2024-09-11   69  {
b7c8e781f020aa Sunny.Shen    2024-09-11   70  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
b7c8e781f020aa Sunny.Shen    2024-09-11   71  
b7c8e781f020aa Sunny.Shen    2024-09-11   72  	return priv->crc.va;
b7c8e781f020aa Sunny.Shen    2024-09-11   73  }
b7c8e781f020aa Sunny.Shen    2024-09-11   74  
b7c8e781f020aa Sunny.Shen    2024-09-11  @75  void mtk_disp_outproc_crc_read(struct device *dev)
b7c8e781f020aa Sunny.Shen    2024-09-11   76  {
b7c8e781f020aa Sunny.Shen    2024-09-11   77  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
b7c8e781f020aa Sunny.Shen    2024-09-11   78  
b7c8e781f020aa Sunny.Shen    2024-09-11   79  	mtk_crtc_read_crc(&priv->crc);
b7c8e781f020aa Sunny.Shen    2024-09-11   80  }
b7c8e781f020aa Sunny.Shen    2024-09-11   81  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  @82  void mtk_disp_outproc_register_vblank_cb(struct device *dev,
f3e6b1244e7c0a Nancy.Lin     2025-01-10   83  					 void (*vblank_cb)(void *),
f3e6b1244e7c0a Nancy.Lin     2025-01-10   84  					 void *vblank_cb_data)
f3e6b1244e7c0a Nancy.Lin     2025-01-10   85  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10   86  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
f3e6b1244e7c0a Nancy.Lin     2025-01-10   87  
f3e6b1244e7c0a Nancy.Lin     2025-01-10   88  	priv->vblank_cb = vblank_cb;
f3e6b1244e7c0a Nancy.Lin     2025-01-10   89  	priv->vblank_cb_data = vblank_cb_data;
f3e6b1244e7c0a Nancy.Lin     2025-01-10   90  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10   91  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  @92  void mtk_disp_outproc_unregister_vblank_cb(struct device *dev)
f3e6b1244e7c0a Nancy.Lin     2025-01-10   93  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10   94  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
f3e6b1244e7c0a Nancy.Lin     2025-01-10   95  
f3e6b1244e7c0a Nancy.Lin     2025-01-10   96  	priv->vblank_cb = NULL;
f3e6b1244e7c0a Nancy.Lin     2025-01-10   97  	priv->vblank_cb_data = NULL;
f3e6b1244e7c0a Nancy.Lin     2025-01-10   98  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10   99  
f3e6b1244e7c0a Nancy.Lin     2025-01-10 @100  void mtk_disp_outproc_enable_vblank(struct device *dev)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  101  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  102  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  103  
d5581be4f939c5 Jason-jh Lin  2025-10-31  104  	writel(OVL_OUTPROC_FME_CPL_INTEN | OVL_OUTPROC_FME_UND_INTEN,
d5581be4f939c5 Jason-jh Lin  2025-10-31  105  	       priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  106  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  107  
f3e6b1244e7c0a Nancy.Lin     2025-01-10 @108  void mtk_disp_outproc_disable_vblank(struct device *dev)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  109  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  110  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  111  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  112  	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  113  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  114  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  115  static irqreturn_t mtk_disp_outproc_irq_handler(int irq, void *dev_id)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  116  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  117  	struct mtk_disp_outproc *priv = dev_id;
f3e6b1244e7c0a Nancy.Lin     2025-01-10  118  	u32 val;
f3e6b1244e7c0a Nancy.Lin     2025-01-10  119  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  120  	val = readl(priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  121  	if (!val)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  122  		return IRQ_NONE;
f3e6b1244e7c0a Nancy.Lin     2025-01-10  123  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  124  	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  125  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  126  	if (priv->vblank_cb)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  127  		priv->vblank_cb(priv->vblank_cb_data);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  128  
d5581be4f939c5 Jason-jh Lin  2025-10-31  129  	if (val & OVL_OUTPROC_FME_CPL_INTEN)
d5581be4f939c5 Jason-jh Lin  2025-10-31  130  		DRM_DEV_DEBUG_DRIVER(priv->dev, "frame complete!\n");
d5581be4f939c5 Jason-jh Lin  2025-10-31  131  	if (val & OVL_OUTPROC_FME_UND_INTEN)
d5581be4f939c5 Jason-jh Lin  2025-10-31  132  		dev_err(priv->dev, "frame underflow!\n");
d5581be4f939c5 Jason-jh Lin  2025-10-31  133  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  134  	return IRQ_HANDLED;
f3e6b1244e7c0a Nancy.Lin     2025-01-10  135  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  136  
f3e6b1244e7c0a Nancy.Lin     2025-01-10 @137  void mtk_disp_outproc_config(struct device *dev, unsigned int w,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  138  			     unsigned int h, unsigned int vrefresh,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  139  			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  140  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  141  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  142  	unsigned int tmp;
f3e6b1244e7c0a Nancy.Lin     2025-01-10  143  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  144  	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  145  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  146  	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  147  	tmp = tmp | OVL_OUTPROC_BYPASS_SHADOW;
f3e6b1244e7c0a Nancy.Lin     2025-01-10  148  	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  149  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  150  	mtk_ddp_write_mask(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  151  			   DISP_REG_OVL_OUTPROC_ROI_SIZE, ~0);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  152  	mtk_ddp_write_mask(cmdq_pkt, DATAPATH_CON_OUTPUT_CLAMP, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  153  			   DISP_REG_OVL_OUTPROC_DATAPATH_CON, DATAPATH_CON_OUTPUT_CLAMP);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  154  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  155  
f3e6b1244e7c0a Nancy.Lin     2025-01-10 @156  void mtk_disp_outproc_start(struct device *dev)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  157  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  158  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
b7c8e781f020aa Sunny.Shen    2024-09-11  159  	unsigned int crc_mode_en  = OVL_OUTPROC_HG_FOVL_CK_ON |
b7c8e781f020aa Sunny.Shen    2024-09-11  160  				    OVL_OUTPROC_HF_FOVL_CK_ON |
b7c8e781f020aa Sunny.Shen    2024-09-11  161  				    OVL_OUTPROC_OP_8BIT_MODE;
f3e6b1244e7c0a Nancy.Lin     2025-01-10  162  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  163  	mtk_ddp_write_mask(NULL, OVL_OUTPROC_RST, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  164  			   DISP_REG_OVL_OUTPROC_RST, OVL_OUTPROC_RST);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  165  	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  166  			   DISP_REG_OVL_OUTPROC_RST, OVL_OUTPROC_RST);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  167  	mtk_ddp_write(NULL, 0, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  168  		      DISP_REG_OVL_OUTPROC_INTSTA);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  169  	mtk_ddp_write_mask(NULL, OVL_OUTPROC_OVL_EN, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  170  			   DISP_REG_OVL_OUTPROC_EN, OVL_OUTPROC_OVL_EN);
b7c8e781f020aa Sunny.Shen    2024-09-11  171  
b7c8e781f020aa Sunny.Shen    2024-09-11  172  	if (priv->crc.cnt) {
b7c8e781f020aa Sunny.Shen    2024-09-11  173  		mtk_ddp_write_mask(NULL, crc_mode_en, &priv->cmdq_reg, priv->regs,
b7c8e781f020aa Sunny.Shen    2024-09-11  174  				 DISP_REG_OVL_OUTPROC_MODE, crc_mode_en);
b7c8e781f020aa Sunny.Shen    2024-09-11  175  		mtk_ddp_write(NULL, OVL_OUTPROC_CRC_EN, &priv->cmdq_reg, priv->regs,
b7c8e781f020aa Sunny.Shen    2024-09-11  176  			      DISP_REG_OVL_OUTPROC_TRIG);
b7c8e781f020aa Sunny.Shen    2024-09-11  177  
b7c8e781f020aa Sunny.Shen    2024-09-11  178  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
b7c8e781f020aa Sunny.Shen    2024-09-11  179  		mtk_crtc_start_crc_cmdq(&priv->crc);
b7c8e781f020aa Sunny.Shen    2024-09-11  180  #endif
b7c8e781f020aa Sunny.Shen    2024-09-11  181  	}
f3e6b1244e7c0a Nancy.Lin     2025-01-10  182  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  183  
f3e6b1244e7c0a Nancy.Lin     2025-01-10 @184  void mtk_disp_outproc_stop(struct device *dev)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  185  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  186  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
b7c8e781f020aa Sunny.Shen    2024-09-11  187  	unsigned int crc_mode_en  = OVL_OUTPROC_HG_FOVL_CK_ON |
b7c8e781f020aa Sunny.Shen    2024-09-11  188  				    OVL_OUTPROC_HF_FOVL_CK_ON |
b7c8e781f020aa Sunny.Shen    2024-09-11  189  				    OVL_OUTPROC_OP_8BIT_MODE;
b7c8e781f020aa Sunny.Shen    2024-09-11  190  
b7c8e781f020aa Sunny.Shen    2024-09-11  191  	mtk_ddp_write(NULL, 0, &priv->cmdq_reg, priv->regs,
b7c8e781f020aa Sunny.Shen    2024-09-11  192  		      DISP_REG_OVL_OUTPROC_TRIG);
b7c8e781f020aa Sunny.Shen    2024-09-11  193  	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
b7c8e781f020aa Sunny.Shen    2024-09-11  194  			   DISP_REG_OVL_OUTPROC_MODE, crc_mode_en);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  195  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  196  	mtk_ddp_write(NULL, 0, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  197  		      DISP_REG_OVL_OUTPROC_INTEN);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  198  	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
f3e6b1244e7c0a Nancy.Lin     2025-01-10  199  			   DISP_REG_OVL_OUTPROC_EN, OVL_OUTPROC_OVL_EN);
b7c8e781f020aa Sunny.Shen    2024-09-11  200  
b7c8e781f020aa Sunny.Shen    2024-09-11  201  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
b7c8e781f020aa Sunny.Shen    2024-09-11  202  	if (priv->crc.cnt)
b7c8e781f020aa Sunny.Shen    2024-09-11  203  		mtk_crtc_stop_crc_cmdq(&priv->crc);
b7c8e781f020aa Sunny.Shen    2024-09-11  204  #endif
f3e6b1244e7c0a Nancy.Lin     2025-01-10  205  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  206  
31d89b3b35a1b3 xiandong.wang 2025-11-24 @207  void mtk_disp_outproc_crc_reset(struct device *dev, struct cmdq_pkt *cmdq_pkt)
31d89b3b35a1b3 xiandong.wang 2025-11-24  208  {
31d89b3b35a1b3 xiandong.wang 2025-11-24  209  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
31d89b3b35a1b3 xiandong.wang 2025-11-24  210  	struct mtk_crtc_crc *crc = &priv->crc;
31d89b3b35a1b3 xiandong.wang 2025-11-24  211  
31d89b3b35a1b3 xiandong.wang 2025-11-24  212  	/* reset crc */
31d89b3b35a1b3 xiandong.wang 2025-11-24  213  	mtk_ddp_write_mask(cmdq_pkt, OVL_OUTPROC_CRC_CLR, &priv->cmdq_reg, priv->regs,
31d89b3b35a1b3 xiandong.wang 2025-11-24  214  			   crc->rst_ofs, crc->rst_msk);
31d89b3b35a1b3 xiandong.wang 2025-11-24  215  
31d89b3b35a1b3 xiandong.wang 2025-11-24  216  	/* clear reset bit */
31d89b3b35a1b3 xiandong.wang 2025-11-24  217  	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
31d89b3b35a1b3 xiandong.wang 2025-11-24  218  			   crc->rst_ofs, crc->rst_msk);
31d89b3b35a1b3 xiandong.wang 2025-11-24  219  }
31d89b3b35a1b3 xiandong.wang 2025-11-24  220  
31d89b3b35a1b3 xiandong.wang 2025-11-24 @221  void mtk_disp_outproc_crc_attach(struct device *dev, struct mtk_crtc *data)
31d89b3b35a1b3 xiandong.wang 2025-11-24  222  {
31d89b3b35a1b3 xiandong.wang 2025-11-24  223  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
31d89b3b35a1b3 xiandong.wang 2025-11-24  224  
31d89b3b35a1b3 xiandong.wang 2025-11-24  225  	mtk_crtc_create_crc_cmdq(&priv->crc, data);
31d89b3b35a1b3 xiandong.wang 2025-11-24  226  }
31d89b3b35a1b3 xiandong.wang 2025-11-24  227  
31d89b3b35a1b3 xiandong.wang 2025-11-24 @228  void mtk_disp_outproc_crc_detach(struct device *dev)
31d89b3b35a1b3 xiandong.wang 2025-11-24  229  {
31d89b3b35a1b3 xiandong.wang 2025-11-24  230  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
31d89b3b35a1b3 xiandong.wang 2025-11-24  231  
31d89b3b35a1b3 xiandong.wang 2025-11-24  232  	mtk_crtc_destroy_crc_cmdq(&priv->crc);
31d89b3b35a1b3 xiandong.wang 2025-11-24  233  }
31d89b3b35a1b3 xiandong.wang 2025-11-24  234  
f3e6b1244e7c0a Nancy.Lin     2025-01-10 @235  int mtk_disp_outproc_clk_enable(struct device *dev)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  236  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  237  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  238  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  239  	return clk_prepare_enable(priv->clk);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  240  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  241  
f3e6b1244e7c0a Nancy.Lin     2025-01-10 @242  void mtk_disp_outproc_clk_disable(struct device *dev)
f3e6b1244e7c0a Nancy.Lin     2025-01-10  243  {
f3e6b1244e7c0a Nancy.Lin     2025-01-10  244  	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  245  
f3e6b1244e7c0a Nancy.Lin     2025-01-10  246  	clk_disable_unprepare(priv->clk);
f3e6b1244e7c0a Nancy.Lin     2025-01-10  247  }
f3e6b1244e7c0a Nancy.Lin     2025-01-10  248  

:::::: The code at line 61 was first introduced by commit
:::::: b7c8e781f020aabd1461232257632f4c04ba97ca CHROMIUM: drm/mediatek: Add CRC support for MT8196

:::::: TO: Sunny.Shen <sunny.shen@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
