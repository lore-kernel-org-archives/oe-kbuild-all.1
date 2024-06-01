Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF03C3C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 02:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717208533; cv=none; b=kdIKptkenzIG49lKYJ0ZbN7MbXOOBYn3HKMAWvcVrMJKqJfdzbL1AHJgQEBzPheG3NJgGQChWT/cJxav50NndLHAuAoynJqZL/I4IMrid6RqllsDIrWjJQL2w0aV6VEyC2x424f/RNCgOtHA6SofBPmN51Ph8r0tl9vskZVTFN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717208533; c=relaxed/simple;
	bh=V9SLXhhhariLa7vwfu3V3Z36+Vvz81rKOQvX6eCG978=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4eTqqkF2uw6UI6qjve+JbumVp7zvQryD4rBHNau3sN6QAdA18odOUY3iFuDGUPQYRYMlDEGVGZY/fQTsFcE1IU40iwlI668w079TLtTuCiqQ3LBYtCJFSuUxjejYNsq1EGxnrsA+RsbpxSMZxxiOGIUjHQMWPHmHlRiZhHwqNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yrz9n8Ar; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yrz9n8Ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717208531; x=1748744531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9SLXhhhariLa7vwfu3V3Z36+Vvz81rKOQvX6eCG978=;
  b=Yrz9n8ArliWd2JPPjScxwBJ1nkQPx6UVQJV9VGht1KoawheV0kTbKwbC
   Uj/yJBimya0RswRpKCd1ZtutyoAuHC+XLaPxDgKobfFptRd7joctqvuQ/
   FGWvwiLEvMpHqV7nR2o2uSsf0cxYrwKa/KhX8B6Yk+TMsDaa422cdWHEC
   J55Bb3QeDIjNScOLMwStigurxm5C2kMbkd+f5w6d/GqbJvLcj6KhhGhZg
   LcFiVObYyZ3fOiOlo0UqwQ9w6p/8W80TRiMuPeQXmjxDN9SpbmZAa6QNI
   56q7EZQZTNPayxDtvlsFr/L+RWtVNSJkWH3esJ9FZBYWDlXYRoWB56eVF
   A==;
X-CSE-ConnectionGUID: mrpfUjF5QA2Ie/YBZCv90Q==
X-CSE-MsgGUID: HtmnBoNQTwanoVV7zOg3yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13994832"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="13994832"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 19:22:11 -0700
X-CSE-ConnectionGUID: o3EWZyFERQKMCIf1BM8HIQ==
X-CSE-MsgGUID: b74rdvkCRVy+nvlaimm3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="41261835"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 31 May 2024 19:22:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDENM-000IAF-0h;
	Sat, 01 Jun 2024 02:21:54 +0000
Date: Sat, 1 Jun 2024 10:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-interrupt-handler 20/21]
 sound/soc/sdca/sdca_interrupts.c:21:5: error: redefinition of
 'sdca_interrupt_info_alloc'
Message-ID: <202406011054.m6u5xHUx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-interrupt-handler
head:   cf1ef35b990554f35693db73eae7f6b461af107e
commit: 7bd6cae243614108de4802a9e8df2e5fc6f9d02e [20/21] ASoC: rt711-sdca: use generic SDCA interrupt handler
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406011054.m6u5xHUx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011054.m6u5xHUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011054.m6u5xHUx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/codecs/rt711-sdca.c: In function 'jack_detection_callback':
>> sound/soc/codecs/rt711-sdca.c:1492:37: warning: variable 'interrupt_info' set but not used [-Wunused-but-set-variable]
    1492 |         struct sdca_interrupt_info *interrupt_info;
         |                                     ^~~~~~~~~~~~~~
   sound/soc/codecs/rt711-sdca.c: In function 'button_detection_callback':
   sound/soc/codecs/rt711-sdca.c:1510:37: warning: variable 'interrupt_info' set but not used [-Wunused-but-set-variable]
    1510 |         struct sdca_interrupt_info *interrupt_info;
         |                                     ^~~~~~~~~~~~~~
--
>> sound/soc/sdca/sdca_interrupts.c:21:5: error: redefinition of 'sdca_interrupt_info_alloc'
      21 | int sdca_interrupt_info_alloc(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/soundwire/sdw.h:13,
                    from sound/soc/sdca/sdca_interrupts.c:10:
   include/sound/sdca.h:111:19: note: previous definition of 'sdca_interrupt_info_alloc' with type 'int(struct sdw_slave *)'
     111 | static inline int sdca_interrupt_info_alloc(struct sdw_slave *slave)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_interrupts.c:44:6: error: redefinition of 'sdca_interrupt_info_release'
      44 | void sdca_interrupt_info_release(struct sdw_slave *slave)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:116:20: note: previous definition of 'sdca_interrupt_info_release' with type 'void(struct sdw_slave *)'
     116 | static inline void sdca_interrupt_info_release(struct sdw_slave *slave) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_interrupts.c:66:5: error: redefinition of 'sdca_interrupt_info_reset'
      66 | int sdca_interrupt_info_reset(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:118:19: note: previous definition of 'sdca_interrupt_info_reset' with type 'int(struct sdw_slave *)'
     118 | static inline int sdca_interrupt_info_reset(struct sdw_slave *slave)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_interrupts.c:90:5: error: redefinition of 'sdca_interrupt_initialize'
      90 | int sdca_interrupt_initialize(struct sdw_slave *slave,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:123:19: note: previous definition of 'sdca_interrupt_initialize' with type 'int(struct sdw_slave *, int)'
     123 | static inline int sdca_interrupt_initialize(struct sdw_slave *slave,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_interrupts.c:120:5: error: redefinition of 'sdca_interrupt_register_source'
     120 | int sdca_interrupt_register_source(struct sdw_slave *slave,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:129:19: note: previous definition of 'sdca_interrupt_register_source' with type 'int(struct sdw_slave *, struct sdca_interrupt_source *)'
     129 | static inline int sdca_interrupt_register_source(struct sdw_slave *slave,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_interrupts.c:209:5: error: redefinition of 'sdca_interrupt_enable'
     209 | int sdca_interrupt_enable(struct sdw_slave *slave,
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:135:19: note: previous definition of 'sdca_interrupt_enable' with type 'int(struct sdw_slave *, u32,  bool)' {aka 'int(struct sdw_slave *, unsigned int,  _Bool)'}
     135 | static inline int sdca_interrupt_enable(struct sdw_slave *slave,
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_interrupts.c:366:5: error: redefinition of 'sdca_interrupt_handler'
     366 | int sdca_interrupt_handler(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:142:19: note: previous definition of 'sdca_interrupt_handler' with type 'int(struct sdw_slave *)'
     142 | static inline int sdca_interrupt_handler(struct sdw_slave *slave)
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/sdca_interrupt_info_alloc +21 sound/soc/sdca/sdca_interrupts.c

1088c808198104 Pierre-Louis Bossart 2024-05-30   13  
1088c808198104 Pierre-Louis Bossart 2024-05-30   14  /**
1088c808198104 Pierre-Louis Bossart 2024-05-30   15   * sdca_interrupt_info_alloc() - Helper to allocate the 'struct sdca_interrupt_info'
1088c808198104 Pierre-Louis Bossart 2024-05-30   16   * @slave: the SoundWire peripheral
1088c808198104 Pierre-Louis Bossart 2024-05-30   17   *
1088c808198104 Pierre-Louis Bossart 2024-05-30   18   * Note: this helper is intended to be called in the SoundWire driver probe() callback.
1088c808198104 Pierre-Louis Bossart 2024-05-30   19   */
1088c808198104 Pierre-Louis Bossart 2024-05-30   20  
1088c808198104 Pierre-Louis Bossart 2024-05-30  @21  int sdca_interrupt_info_alloc(struct sdw_slave *slave)
1088c808198104 Pierre-Louis Bossart 2024-05-30   22  {
1088c808198104 Pierre-Louis Bossart 2024-05-30   23  	struct sdca_interrupt_info *interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30   24  	struct device *dev = &slave->dev;
1088c808198104 Pierre-Louis Bossart 2024-05-30   25  
1088c808198104 Pierre-Louis Bossart 2024-05-30   26  	interrupt_info = devm_kzalloc(dev, sizeof(*interrupt_info), GFP_KERNEL);
1088c808198104 Pierre-Louis Bossart 2024-05-30   27  	if (!interrupt_info)
1088c808198104 Pierre-Louis Bossart 2024-05-30   28  		return -ENOMEM;
1088c808198104 Pierre-Louis Bossart 2024-05-30   29  
1088c808198104 Pierre-Louis Bossart 2024-05-30   30  	mutex_init(&interrupt_info->irqs_lock);
1088c808198104 Pierre-Louis Bossart 2024-05-30   31  
1088c808198104 Pierre-Louis Bossart 2024-05-30   32  	slave->sdca_data.interrupt_info = interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30   33  
1088c808198104 Pierre-Louis Bossart 2024-05-30   34  	return 0;
1088c808198104 Pierre-Louis Bossart 2024-05-30   35  }
1088c808198104 Pierre-Louis Bossart 2024-05-30   36  EXPORT_SYMBOL_NS(sdca_interrupt_info_alloc, SND_SOC_SDCA_IRQ_HANDLER);
1088c808198104 Pierre-Louis Bossart 2024-05-30   37  
1088c808198104 Pierre-Louis Bossart 2024-05-30   38  /**
1088c808198104 Pierre-Louis Bossart 2024-05-30   39   * sdca_interrupt_info_release() - Helper to release the 'struct sdca_interrupt_info'
1088c808198104 Pierre-Louis Bossart 2024-05-30   40   * @slave: the SoundWire peripheral
1088c808198104 Pierre-Louis Bossart 2024-05-30   41   *
1088c808198104 Pierre-Louis Bossart 2024-05-30   42   * Note: this helper is intended to be called in the SoundWire driver remove() callback.
1088c808198104 Pierre-Louis Bossart 2024-05-30   43   */
1088c808198104 Pierre-Louis Bossart 2024-05-30  @44  void sdca_interrupt_info_release(struct sdw_slave *slave)
1088c808198104 Pierre-Louis Bossart 2024-05-30   45  {
1088c808198104 Pierre-Louis Bossart 2024-05-30   46  	struct sdca_interrupt_info *interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30   47  
1088c808198104 Pierre-Louis Bossart 2024-05-30   48  	if (!slave->sdca_data.interrupt_info)
1088c808198104 Pierre-Louis Bossart 2024-05-30   49  		return;
1088c808198104 Pierre-Louis Bossart 2024-05-30   50  
1088c808198104 Pierre-Louis Bossart 2024-05-30   51  	interrupt_info = slave->sdca_data.interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30   52  	mutex_destroy(&interrupt_info->irqs_lock);
1088c808198104 Pierre-Louis Bossart 2024-05-30   53  
1088c808198104 Pierre-Louis Bossart 2024-05-30   54  	/* no memory to free since we used devm_ in the alloc */
1088c808198104 Pierre-Louis Bossart 2024-05-30   55  }
1088c808198104 Pierre-Louis Bossart 2024-05-30   56  EXPORT_SYMBOL_NS(sdca_interrupt_info_release, SND_SOC_SDCA_IRQ_HANDLER);
1088c808198104 Pierre-Louis Bossart 2024-05-30   57  
1088c808198104 Pierre-Louis Bossart 2024-05-30   58  /**
1088c808198104 Pierre-Louis Bossart 2024-05-30   59   * sdca_interrupt_info_reset() - Helper to reset internal SDCA interrupt status
1088c808198104 Pierre-Louis Bossart 2024-05-30   60   * @slave: the SoundWire peripheral
1088c808198104 Pierre-Louis Bossart 2024-05-30   61   *
1088c808198104 Pierre-Louis Bossart 2024-05-30   62   * Note: SoundWire peripherals could be reset and/or re-attach on the bus.
1088c808198104 Pierre-Louis Bossart 2024-05-30   63   * This helper is intended to be called during the 'update_status' callback to
1088c808198104 Pierre-Louis Bossart 2024-05-30   64   * reconcile the internal state of the 'struct sdca_interrupt_info'
1088c808198104 Pierre-Louis Bossart 2024-05-30   65   */
1088c808198104 Pierre-Louis Bossart 2024-05-30  @66  int sdca_interrupt_info_reset(struct sdw_slave *slave)
1088c808198104 Pierre-Louis Bossart 2024-05-30   67  {
1088c808198104 Pierre-Louis Bossart 2024-05-30   68  	struct sdca_interrupt_info *interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30   69  
1088c808198104 Pierre-Louis Bossart 2024-05-30   70  	if (!slave->sdca_data.interrupt_info)
1088c808198104 Pierre-Louis Bossart 2024-05-30   71  		return -ENODEV;
1088c808198104 Pierre-Louis Bossart 2024-05-30   72  
1088c808198104 Pierre-Louis Bossart 2024-05-30   73  	interrupt_info = slave->sdca_data.interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30   74  
1088c808198104 Pierre-Louis Bossart 2024-05-30   75  	/* interrupts need to be re-enabled after a reset */
1088c808198104 Pierre-Louis Bossart 2024-05-30   76  	interrupt_info->enabled_interrupt_mask = 0;
1088c808198104 Pierre-Louis Bossart 2024-05-30   77  
1088c808198104 Pierre-Louis Bossart 2024-05-30   78  	return 0;
1088c808198104 Pierre-Louis Bossart 2024-05-30   79  }
1088c808198104 Pierre-Louis Bossart 2024-05-30   80  EXPORT_SYMBOL_NS(sdca_interrupt_info_reset, SND_SOC_SDCA_IRQ_HANDLER);
1088c808198104 Pierre-Louis Bossart 2024-05-30   81  
1088c808198104 Pierre-Louis Bossart 2024-05-30   82  /**
1088c808198104 Pierre-Louis Bossart 2024-05-30   83   * sdca_interrupt_initialize() - device-level initialization of SDCA
1088c808198104 Pierre-Louis Bossart 2024-05-30   84   * interrupts
1088c808198104 Pierre-Louis Bossart 2024-05-30   85   * @slave: the SoundWire peripheral
1088c808198104 Pierre-Louis Bossart 2024-05-30   86   * @supported_hw_register_mask: One bit per supported SDCA interrupt register.
1088c808198104 Pierre-Louis Bossart 2024-05-30   87   * Valid values as in GENMASK(3, 0) since there are up to 3 registers in
1088c808198104 Pierre-Louis Bossart 2024-05-30   88   * hardware.
1088c808198104 Pierre-Louis Bossart 2024-05-30   89   */
1088c808198104 Pierre-Louis Bossart 2024-05-30  @90  int sdca_interrupt_initialize(struct sdw_slave *slave,
1088c808198104 Pierre-Louis Bossart 2024-05-30   91  			      int supported_hw_register_mask)
1088c808198104 Pierre-Louis Bossart 2024-05-30   92  {
1088c808198104 Pierre-Louis Bossart 2024-05-30   93  	struct sdca_interrupt_info *interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30   94  	struct device *dev = &slave->dev;
1088c808198104 Pierre-Louis Bossart 2024-05-30   95  
1088c808198104 Pierre-Louis Bossart 2024-05-30   96  	if (!slave->sdca_data.interrupt_info)
1088c808198104 Pierre-Louis Bossart 2024-05-30   97  		return -ENODEV;
1088c808198104 Pierre-Louis Bossart 2024-05-30   98  
1088c808198104 Pierre-Louis Bossart 2024-05-30   99  	if (supported_hw_register_mask & ~GENMASK(3, 0)) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  100  		dev_err(dev, "%s: invalid supported_hw_register_mask: %#x\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  101  			__func__, supported_hw_register_mask);
1088c808198104 Pierre-Louis Bossart 2024-05-30  102  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  103  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  104  
1088c808198104 Pierre-Louis Bossart 2024-05-30  105  	interrupt_info = slave->sdca_data.interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30  106  	interrupt_info->supported_hw_register_mask = supported_hw_register_mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  107  
1088c808198104 Pierre-Louis Bossart 2024-05-30  108  	return 0;
1088c808198104 Pierre-Louis Bossart 2024-05-30  109  }
1088c808198104 Pierre-Louis Bossart 2024-05-30  110  EXPORT_SYMBOL_NS(sdca_interrupt_initialize, SND_SOC_SDCA_IRQ_HANDLER);
1088c808198104 Pierre-Louis Bossart 2024-05-30  111  
1088c808198104 Pierre-Louis Bossart 2024-05-30  112  /**
1088c808198104 Pierre-Louis Bossart 2024-05-30  113   * sdca_interrupt_register_source() - Helper to register a SDCA interrupt source interrupts
1088c808198104 Pierre-Louis Bossart 2024-05-30  114   * @slave: the SoundWire peripheral
1088c808198104 Pierre-Louis Bossart 2024-05-30  115   * @source:  source-specific information and callback, providing an opaque interface
1088c808198104 Pierre-Louis Bossart 2024-05-30  116   * with the bus interrupt handling core
1088c808198104 Pierre-Louis Bossart 2024-05-30  117   *
1088c808198104 Pierre-Louis Bossart 2024-05-30  118   * Note: to prevent race conditions, the code relies on the 'irq_lock' mutex
1088c808198104 Pierre-Louis Bossart 2024-05-30  119   */
1088c808198104 Pierre-Louis Bossart 2024-05-30 @120  int sdca_interrupt_register_source(struct sdw_slave *slave,
1088c808198104 Pierre-Louis Bossart 2024-05-30  121  				   struct sdca_interrupt_source *source)
1088c808198104 Pierre-Louis Bossart 2024-05-30  122  {
1088c808198104 Pierre-Louis Bossart 2024-05-30  123  	struct sdca_interrupt_info *interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30  124  	struct device *dev = &slave->dev;
1088c808198104 Pierre-Louis Bossart 2024-05-30  125  	int index;
1088c808198104 Pierre-Louis Bossart 2024-05-30  126  
1088c808198104 Pierre-Louis Bossart 2024-05-30  127  	if (!slave->sdca_data.interrupt_info)
1088c808198104 Pierre-Louis Bossart 2024-05-30  128  		return -ENODEV;
1088c808198104 Pierre-Louis Bossart 2024-05-30  129  
1088c808198104 Pierre-Louis Bossart 2024-05-30  130  	if (!source)
1088c808198104 Pierre-Louis Bossart 2024-05-30  131  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  132  
1088c808198104 Pierre-Louis Bossart 2024-05-30  133  	index = source->index;
1088c808198104 Pierre-Louis Bossart 2024-05-30  134  	if (index < 0 && index >= SDCA_MAX_INTERRUPTS) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  135  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  136  			"%s: invalid source index %d\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  137  			__func__, source->index);
1088c808198104 Pierre-Louis Bossart 2024-05-30  138  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  139  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  140  
1088c808198104 Pierre-Louis Bossart 2024-05-30  141  	if (!source->callback) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  142  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  143  			"%s: no callback provided for source index %d\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  144  			__func__, source->index);
1088c808198104 Pierre-Louis Bossart 2024-05-30  145  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  146  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  147  
1088c808198104 Pierre-Louis Bossart 2024-05-30  148  	if (!source->context) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  149  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  150  			"%s: no context provided for source index %d\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  151  			__func__, source->index);
1088c808198104 Pierre-Louis Bossart 2024-05-30  152  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  153  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  154  
1088c808198104 Pierre-Louis Bossart 2024-05-30  155  	interrupt_info = slave->sdca_data.interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30  156  
1088c808198104 Pierre-Louis Bossart 2024-05-30  157  	mutex_lock(&interrupt_info->irqs_lock);
1088c808198104 Pierre-Louis Bossart 2024-05-30  158  
1088c808198104 Pierre-Louis Bossart 2024-05-30  159  	interrupt_info->sources[index] = source;
1088c808198104 Pierre-Louis Bossart 2024-05-30  160  	interrupt_info->registered_source_mask |= BIT(source->index);
1088c808198104 Pierre-Louis Bossart 2024-05-30  161  
1088c808198104 Pierre-Louis Bossart 2024-05-30  162  	mutex_unlock(&interrupt_info->irqs_lock);
1088c808198104 Pierre-Louis Bossart 2024-05-30  163  
1088c808198104 Pierre-Louis Bossart 2024-05-30  164  	return 0;
1088c808198104 Pierre-Louis Bossart 2024-05-30  165  }
1088c808198104 Pierre-Louis Bossart 2024-05-30  166  EXPORT_SYMBOL_NS(sdca_interrupt_register_source, SND_SOC_SDCA_IRQ_HANDLER);
1088c808198104 Pierre-Louis Bossart 2024-05-30  167  
1088c808198104 Pierre-Louis Bossart 2024-05-30  168  static int sdca_interrupt_register_mask_rmw(struct sdw_slave *slave,
1088c808198104 Pierre-Louis Bossart 2024-05-30  169  					    int reg_index,
1088c808198104 Pierre-Louis Bossart 2024-05-30  170  					    u8 byte_mask,
1088c808198104 Pierre-Louis Bossart 2024-05-30  171  					    int enable)
1088c808198104 Pierre-Louis Bossart 2024-05-30  172  {
1088c808198104 Pierre-Louis Bossart 2024-05-30  173  	struct device *dev = &slave->dev;
1088c808198104 Pierre-Louis Bossart 2024-05-30  174  	u8 mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  175  	int ret;
1088c808198104 Pierre-Louis Bossart 2024-05-30  176  
1088c808198104 Pierre-Louis Bossart 2024-05-30  177  	ret = sdw_read_no_pm(slave, SDW_SCP_SDCA_INTMASK1 + reg_index);
1088c808198104 Pierre-Louis Bossart 2024-05-30  178  	if (ret < 0) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  179  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  180  			"%s: read from SDW_SCP_SDCA_INT_%d failed: %d\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  181  			__func__, reg_index, ret);
1088c808198104 Pierre-Louis Bossart 2024-05-30  182  		goto io_error;
1088c808198104 Pierre-Louis Bossart 2024-05-30  183  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  184  	mask = ret;
1088c808198104 Pierre-Louis Bossart 2024-05-30  185  
1088c808198104 Pierre-Louis Bossart 2024-05-30  186  	if (enable)
1088c808198104 Pierre-Louis Bossart 2024-05-30  187  		mask |= byte_mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  188  	else
1088c808198104 Pierre-Louis Bossart 2024-05-30  189  		mask &= byte_mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  190  
1088c808198104 Pierre-Louis Bossart 2024-05-30  191  	ret = sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1 + reg_index, mask);
1088c808198104 Pierre-Louis Bossart 2024-05-30  192  	if (ret < 0)
1088c808198104 Pierre-Louis Bossart 2024-05-30  193  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  194  			"%s: write to SDW_SCP_SDCA_INT_%d failed: %d\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  195  			__func__, reg_index, ret);
1088c808198104 Pierre-Louis Bossart 2024-05-30  196  
1088c808198104 Pierre-Louis Bossart 2024-05-30  197  io_error:
1088c808198104 Pierre-Louis Bossart 2024-05-30  198  	return ret;
1088c808198104 Pierre-Louis Bossart 2024-05-30  199  }
1088c808198104 Pierre-Louis Bossart 2024-05-30  200  
1088c808198104 Pierre-Louis Bossart 2024-05-30  201  /**
1088c808198104 Pierre-Louis Bossart 2024-05-30  202   * sdca_interrupt_enable() - Helper to enable/disable SDCA interrupt sources
1088c808198104 Pierre-Louis Bossart 2024-05-30  203   * @slave: the SoundWire peripheral
1088c808198104 Pierre-Louis Bossart 2024-05-30  204   * @source_mask: a bitmask of all interrupt sources to enable/disable
1088c808198104 Pierre-Louis Bossart 2024-05-30  205   * @enable: boolean to enable/disable
1088c808198104 Pierre-Louis Bossart 2024-05-30  206   *
1088c808198104 Pierre-Louis Bossart 2024-05-30  207   * Note: to prevent race conditions, the code relies on the 'irq_lock' mutex
1088c808198104 Pierre-Louis Bossart 2024-05-30  208   */
1088c808198104 Pierre-Louis Bossart 2024-05-30 @209  int sdca_interrupt_enable(struct sdw_slave *slave,
1088c808198104 Pierre-Louis Bossart 2024-05-30  210  			  u32 source_mask,
1088c808198104 Pierre-Louis Bossart 2024-05-30  211  			  bool enable)
1088c808198104 Pierre-Louis Bossart 2024-05-30  212  {
1088c808198104 Pierre-Louis Bossart 2024-05-30  213  	struct sdca_interrupt_info *interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30  214  	struct device *dev = &slave->dev;
1088c808198104 Pierre-Louis Bossart 2024-05-30  215  	unsigned long hw_register_mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  216  	int max_register;
1088c808198104 Pierre-Louis Bossart 2024-05-30  217  	int max_source;
1088c808198104 Pierre-Louis Bossart 2024-05-30  218  	int reg_index;
1088c808198104 Pierre-Louis Bossart 2024-05-30  219  	int ret = 0;
1088c808198104 Pierre-Louis Bossart 2024-05-30  220  
1088c808198104 Pierre-Louis Bossart 2024-05-30  221  	if (!slave->sdca_data.interrupt_info)
1088c808198104 Pierre-Louis Bossart 2024-05-30  222  		return -ENODEV;
1088c808198104 Pierre-Louis Bossart 2024-05-30  223  
1088c808198104 Pierre-Louis Bossart 2024-05-30  224  	interrupt_info = slave->sdca_data.interrupt_info;
1088c808198104 Pierre-Louis Bossart 2024-05-30  225  
1088c808198104 Pierre-Louis Bossart 2024-05-30  226  	/* check first if the interrupt masks are consistent */
1088c808198104 Pierre-Louis Bossart 2024-05-30  227  	hw_register_mask = interrupt_info->supported_hw_register_mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  228  	if (!hw_register_mask) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  229  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  230  			"%s: supported_hw_register mask not initialized\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  231  			__func__);
1088c808198104 Pierre-Louis Bossart 2024-05-30  232  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  233  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  234  
1088c808198104 Pierre-Louis Bossart 2024-05-30  235  	if (!source_mask) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  236  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  237  			"%s: source mask not set\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  238  			__func__);
1088c808198104 Pierre-Louis Bossart 2024-05-30  239  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  240  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  241  
1088c808198104 Pierre-Louis Bossart 2024-05-30  242  	max_register = __fls(hw_register_mask); /* __fls is zero-based, values should be 0..3 */
1088c808198104 Pierre-Louis Bossart 2024-05-30  243  	max_source = __fls(source_mask);     /* __fls is zero-based, values should be 0..31 */
1088c808198104 Pierre-Louis Bossart 2024-05-30  244  
1088c808198104 Pierre-Louis Bossart 2024-05-30  245  	if (max_source >= (8 << max_register)) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  246  		dev_err(dev,
1088c808198104 Pierre-Louis Bossart 2024-05-30  247  			"%s: source mask %#x incompatible with supported registers %#lx\n",
1088c808198104 Pierre-Louis Bossart 2024-05-30  248  			__func__, source_mask, hw_register_mask);
1088c808198104 Pierre-Louis Bossart 2024-05-30  249  		return -EINVAL;
1088c808198104 Pierre-Louis Bossart 2024-05-30  250  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  251  
1088c808198104 Pierre-Louis Bossart 2024-05-30  252  	/* now start the interrupt mask updates */
1088c808198104 Pierre-Louis Bossart 2024-05-30  253  	mutex_lock(&interrupt_info->irqs_lock);
1088c808198104 Pierre-Louis Bossart 2024-05-30  254  
1088c808198104 Pierre-Louis Bossart 2024-05-30  255  	for_each_set_bit(reg_index, &hw_register_mask, 32) {
1088c808198104 Pierre-Louis Bossart 2024-05-30  256  		int shift = reg_index << 3;
1088c808198104 Pierre-Louis Bossart 2024-05-30  257  		int source_mask_byte =  (source_mask >> shift) & GENMASK(7, 0);
1088c808198104 Pierre-Louis Bossart 2024-05-30  258  
1088c808198104 Pierre-Louis Bossart 2024-05-30  259  		if (!source_mask_byte)
1088c808198104 Pierre-Louis Bossart 2024-05-30  260  			continue;
1088c808198104 Pierre-Louis Bossart 2024-05-30  261  
1088c808198104 Pierre-Louis Bossart 2024-05-30  262  		ret = sdca_interrupt_register_mask_rmw(slave, reg_index,
1088c808198104 Pierre-Louis Bossart 2024-05-30  263  						       source_mask_byte,
1088c808198104 Pierre-Louis Bossart 2024-05-30  264  						       enable);
1088c808198104 Pierre-Louis Bossart 2024-05-30  265  		if (ret < 0)
1088c808198104 Pierre-Louis Bossart 2024-05-30  266  			goto unlock;
1088c808198104 Pierre-Louis Bossart 2024-05-30  267  	}
1088c808198104 Pierre-Louis Bossart 2024-05-30  268  
1088c808198104 Pierre-Louis Bossart 2024-05-30  269  	/*
1088c808198104 Pierre-Louis Bossart 2024-05-30  270  	 * Almost done, keep track of the combined interrupt mask used to
1088c808198104 Pierre-Louis Bossart 2024-05-30  271  	 * filter interrupts in the handler.
1088c808198104 Pierre-Louis Bossart 2024-05-30  272  	 */
1088c808198104 Pierre-Louis Bossart 2024-05-30  273  	if (enable)
1088c808198104 Pierre-Louis Bossart 2024-05-30  274  		interrupt_info->enabled_interrupt_mask |= source_mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  275  	else
1088c808198104 Pierre-Louis Bossart 2024-05-30  276  		interrupt_info->enabled_interrupt_mask &= ~source_mask;
1088c808198104 Pierre-Louis Bossart 2024-05-30  277  
1088c808198104 Pierre-Louis Bossart 2024-05-30  278  unlock:
1088c808198104 Pierre-Louis Bossart 2024-05-30  279  	mutex_unlock(&interrupt_info->irqs_lock);
1088c808198104 Pierre-Louis Bossart 2024-05-30  280  
1088c808198104 Pierre-Louis Bossart 2024-05-30  281  	return ret;
1088c808198104 Pierre-Louis Bossart 2024-05-30  282  }
1088c808198104 Pierre-Louis Bossart 2024-05-30  283  EXPORT_SYMBOL_NS(sdca_interrupt_enable, SND_SOC_SDCA_IRQ_HANDLER);
1088c808198104 Pierre-Louis Bossart 2024-05-30  284  

:::::: The code at line 21 was first introduced by commit
:::::: 1088c8081981044a36becf4afd2f0a19f5edca74 ASoC: SDCA: add helpers to handle SDCA interrupt sources

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
