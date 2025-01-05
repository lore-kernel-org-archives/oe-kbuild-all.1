Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A2B42A83
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736066003; cv=none; b=TvKRbLd60TqxssOXdKnQVz6Kz5qefpKH+aeDIlesIqusQ8jz18YXmoNa/lDMeG1kl3YGauBr5UPuZRLxgpS+QnySUgPAxquzCetI3k35dX0UFTL+K1zD+FH0Vn+rDt3ES9hspEWisXEi+KPcvskbiav8fQHdkdsnHYb637A0rYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736066003; c=relaxed/simple;
	bh=uRTNCK7x3tqPayr5saB4f5UKVVjeTNraTdV/XQRda0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aV+R+0Mv6w/mCxYh88zPiHNOMYCVs2sL7HM6INAU1XDvcG2rjf2PopDaC2Imsj7kAsqOdyF1BrjF+VkA7hkkgADVgQ/MnlQ2nGbB/EwPOUVX64Ln9C3Uj9N/E0LnOu9AOpWmJ+XVOP8dk1G8oIh3vyBWz3/gfm27V+nTcioTSyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fznNM9z9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fznNM9z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736066001; x=1767602001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRTNCK7x3tqPayr5saB4f5UKVVjeTNraTdV/XQRda0Y=;
  b=fznNM9z9mEgR7ifY0x2BNZuo0S3B0ivhq54dYRF+SYEoeNeAezJcsUDj
   TJuKZZPEAeRbWRL2vHC34+1IxN5df4drowdKtHI9nRa3vL2EZW7qn1LPL
   dhkfQ+49Xai9p/AdYnBK36Mht+WAkx2qAmDsNg+KIPRp8Z6u4gUG57sls
   n57FUsG8TJRc+CzkdrLVLwavLCrjsdZGlp8NWHHOKgTIybd5kjsQJzuJh
   jbHsypzHc2qXJ8SR1IwKYgDmydHOELgFur0Dc2jmEuCNQJ1E4bL+Urj4e
   RjxBzx1fx+SEtkq58gV21zPnpVNnpSIPc8aXm/fI7aOvpv56u1i6ZrZyU
   Q==;
X-CSE-ConnectionGUID: wgZVCsw5QkeKufCDovXNzw==
X-CSE-MsgGUID: ZEXXqB+1T8+jfigUfkW9fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="40173661"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="40173661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 00:33:20 -0800
X-CSE-ConnectionGUID: 653Lmpi+QzGzMlDz3O4V8Q==
X-CSE-MsgGUID: ++McBKAoTriDWbtY+xPauA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125442808"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 00:33:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUM4T-000BZD-0Y;
	Sun, 05 Jan 2025 08:33:17 +0000
Date: Sun, 5 Jan 2025 16:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/firmware/efi/sysfb_efi.c:331:39: warning: 'efifb_fwnode_ops'
 defined but not used
Message-ID: <202501051626.SMkizYIE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 75ed63d919400b803691a0c757ee23c6f767a625 efi: clean up Kconfig dependencies on CONFIG_EFI
date:   2 years, 7 months ago
config: x86_64-randconfig-075-20231009 (https://download.01.org/0day-ci/archive/20250105/202501051626.SMkizYIE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051626.SMkizYIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051626.SMkizYIE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/sysfb_efi.c:331:39: warning: 'efifb_fwnode_ops' defined but not used [-Wunused-const-variable=]
     331 | static const struct fwnode_operations efifb_fwnode_ops = {
         |                                       ^~~~~~~~~~~~~~~~
>> drivers/firmware/efi/sysfb_efi.c:240:35: warning: 'efifb_dmi_swap_width_height' defined but not used [-Wunused-const-variable=]
     240 | static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/efi/sysfb_efi.c:190:35: warning: 'efifb_dmi_system_table' defined but not used [-Wunused-const-variable=]
     190 | static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/efifb_fwnode_ops +331 drivers/firmware/efi/sysfb_efi.c

2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  178  
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  179  #define EFIFB_DMI_SYSTEM_ID(vendor, name, enumid)		\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  180  	{							\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  181  		efifb_set_system,				\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  182  		name,						\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  183  		{						\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  184  			DMI_MATCH(DMI_BIOS_VENDOR, vendor),	\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  185  			DMI_MATCH(DMI_PRODUCT_NAME, name)	\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  186  		},						\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  187  		&efifb_dmi_list[enumid]				\
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  188  	}
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  189  
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02 @190  static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  191  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "iMac4,1", M_I17),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  192  	/* At least one of these two will be right; maybe both? */
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  193  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "iMac5,1", M_I20),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  194  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "iMac5,1", M_I20),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  195  	/* At least one of these two will be right; maybe both? */
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  196  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "iMac6,1", M_I24),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  197  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "iMac6,1", M_I24),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  198  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "iMac7,1", M_I20_SR),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  199  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "iMac8,1", M_I24_8_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  200  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "iMac10,1", M_I24_10_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  201  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "iMac11,1", M_I27_11_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  202  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "Macmini1,1", M_MINI),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  203  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "Macmini3,1", M_MINI_3_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  204  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "Macmini4,1", M_MINI_4_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  205  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "MacBook1,1", M_MB),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  206  	/* At least one of these two will be right; maybe both? */
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  207  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "MacBook2,1", M_MB),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  208  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBook2,1", M_MB),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  209  	/* At least one of these two will be right; maybe both? */
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  210  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "MacBook3,1", M_MB),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  211  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBook3,1", M_MB),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  212  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBook4,1", M_MB),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  213  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBook5,1", M_MB_5_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  214  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBook6,1", M_MB_6_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  215  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBook7,1", M_MB_7_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  216  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookAir1,1", M_MBA),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  217  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookAir3,1", M_MBA_3),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  218  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "MacBookPro1,1", M_MBP),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  219  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "MacBookPro2,1", M_MBP_2),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  220  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "MacBookPro2,2", M_MBP_2_2),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  221  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro2,1", M_MBP_2),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  222  	EFIFB_DMI_SYSTEM_ID("Apple Computer, Inc.", "MacBookPro3,1", M_MBP_SR),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  223  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro3,1", M_MBP_SR),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  224  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro4,1", M_MBP_4),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  225  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro5,1", M_MBP_5_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  226  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro5,2", M_MBP_5_2),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  227  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro5,3", M_MBP_5_3),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  228  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro6,1", M_MBP_6_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  229  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro6,2", M_MBP_6_2),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  230  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro7,1", M_MBP_7_1),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  231  	EFIFB_DMI_SYSTEM_ID("Apple Inc.", "MacBookPro8,2", M_MBP_8_2),
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  232  	{},
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  233  };
2995e506276bfd arch/x86/kernel/sysfb_efi.c      David Herrmann           2013-08-02  234  
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  235  /*
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  236   * Some devices have a portrait LCD but advertise a landscape resolution (and
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  237   * pitch). We simply swap width and height for these devices so that we can
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  238   * correctly deal with some of them coming with multiple resolutions.
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  239   */
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21 @240  static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  241  	{
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  242  		/*
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  243  		 * Lenovo MIIX310-10ICR, only some batches have the troublesome
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  244  		 * 800x1280 portrait screen. Luckily the portrait version has
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  245  		 * its own BIOS version, so we match on that.
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  246  		 */
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  247  		.matches = {
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  248  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  249  			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10ICR"),
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  250  			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "1HCN44WW"),
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  251  		},
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  252  	},
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  253  	{
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  254  		/* Lenovo MIIX 320-10ICR with 800x1280 portrait screen */
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  255  		.matches = {
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  256  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  257  			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  258  					"Lenovo MIIX 320-10ICR"),
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  259  		},
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  260  	},
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  261  	{
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  262  		/* Lenovo D330 with 800x1280 or 1200x1920 portrait screen */
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  263  		.matches = {
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  264  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  265  			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  266  					"Lenovo ideapad D330-10IGM"),
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  267  		},
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  268  	},
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  269  	{},
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  270  };
d02f1aa39189e0 arch/x86/kernel/sysfb_efi.c      Hans de Goede            2019-07-21  271  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  272  static bool efifb_overlaps_pci_range(const struct of_pci_range *range)
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  273  {
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  274  	u64 fb_base = screen_info.lfb_base;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  275  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  276  	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  277  		fb_base |= (u64)(unsigned long)screen_info.ext_lfb_base << 32;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  278  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  279  	return fb_base >= range->cpu_addr &&
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  280  	       fb_base < (range->cpu_addr + range->size);
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  281  }
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  282  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  283  static struct device_node *find_pci_overlap_node(void)
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  284  {
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  285  	struct device_node *np;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  286  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  287  	for_each_node_by_type(np, "pci") {
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  288  		struct of_pci_range_parser parser;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  289  		struct of_pci_range range;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  290  		int err;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  291  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  292  		err = of_pci_range_parser_init(&parser, np);
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  293  		if (err) {
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  294  			pr_warn("of_pci_range_parser_init() failed: %d\n", err);
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  295  			continue;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  296  		}
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  297  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  298  		for_each_of_pci_range(&parser, &range)
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  299  			if (efifb_overlaps_pci_range(&range))
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  300  				return np;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  301  	}
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  302  	return NULL;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  303  }
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  304  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  305  /*
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  306   * If the efifb framebuffer is backed by a PCI graphics controller, we have
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  307   * to ensure that this relation is expressed using a device link when
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  308   * running in DT mode, or the probe order may be reversed, resulting in a
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  309   * resource reservation conflict on the memory window that the efifb
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  310   * framebuffer steals from the PCIe host bridge.
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  311   */
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  312  static int efifb_add_links(struct fwnode_handle *fwnode)
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  313  {
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  314  	struct device_node *sup_np;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  315  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  316  	sup_np = find_pci_overlap_node();
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  317  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  318  	/*
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  319  	 * If there's no PCI graphics controller backing the efifb, we are
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  320  	 * done here.
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  321  	 */
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  322  	if (!sup_np)
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  323  		return 0;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  324  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  325  	fwnode_link_add(fwnode, of_fwnode_handle(sup_np));
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  326  	of_node_put(sup_np);
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  327  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  328  	return 0;
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  329  }
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  330  
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25 @331  static const struct fwnode_operations efifb_fwnode_ops = {
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  332  	.add_links = efifb_add_links,
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  333  };
8633ef82f101c0 drivers/firmware/efi/sysfb_efi.c Javier Martinez Canillas 2021-06-25  334  

:::::: The code at line 331 was first introduced by commit
:::::: 8633ef82f101c040427b57d4df7b706261420b94 drivers/firmware: consolidate EFI framebuffer setup for all arches

:::::: TO: Javier Martinez Canillas <javierm@redhat.com>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
