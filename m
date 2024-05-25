Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9636F28DB3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716636940; cv=none; b=LjNyZoyT9iirV/QNyoo4n0wehfccmUxstsAkaQkGEmK0e11/Ed2Hq4btwoEyl2+5zixWh+NekBhEmOwJf8AedmlvDElz2Uvd7TTXbpOldaIg2slnSyIIVitFQsZmdYCOeY1RI/xpETZP3IYPgdzQ1VlYxRVd+raLn6/yBDTX5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716636940; c=relaxed/simple;
	bh=D5w1jmL9G3p1es3qToJ+B01szqmABKCYmpwN4tjK93Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDtDDzqTaZgeWOK80a2l31P7cNbB3NAWyd1BkRBvmTrf7bNZVHmHrar6vTJcjhw68lILH9BNCdXpN81Fva94V3kMJIh4uNeNwrZleN66U1h8NRRrxzsoJMUWPygSjwVPXUXdZdbMk1zKDtZS9Ld/a35YjBebzv5H1yBFTKND4sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E17pxvWb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E17pxvWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716636938; x=1748172938;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D5w1jmL9G3p1es3qToJ+B01szqmABKCYmpwN4tjK93Q=;
  b=E17pxvWb+xi0FRMTNJozf75spOslgtEOzcETL8FMLCq4nygzxtA01FcD
   GchkFvZP1Vf6gD+xfaQEma9hwgTXuXHCJ7xoGXgf500KPOXkMWcA5/TBh
   CuSsNkT7eVnN77DZ5GiwUvAgBXLfw3yM5mN+5K4sBe790Cr4XXhbP5BHS
   uzDMoaT5j3wK7B/FLG8A8azRaW0TFiffoAKKMfyFLn457jiNQnd5DstAR
   sHBiWqiR/3KOmafUS+wEf8CST5460VMljsBUDxOtlQKVrjHybSAebeLnW
   2yT+VHlQSBYpr7znt7CEm0aFn9OcX6oKidDTXa3NuCe0oODbx3Xax0yRb
   A==;
X-CSE-ConnectionGUID: ClDvkl2XQearWXINYAgGVA==
X-CSE-MsgGUID: V46qA1awQBCULhqSDzEBaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24135580"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="24135580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 04:35:37 -0700
X-CSE-ConnectionGUID: n6VC7fypTZiOfx0OEulzkA==
X-CSE-MsgGUID: WrdwiifnQeqjI7dpAA2CDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="34164219"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 May 2024 04:35:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sApgT-0006tK-1U;
	Sat, 25 May 2024 11:35:33 +0000
Date: Sat, 25 May 2024 19:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:mariusz-npem 2/3] drivers/pci/npem.c:254:5: warning: no
 previous prototype for 'brightness_set'
Message-ID: <202405251943.zDqYDGLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/l1k/linux mariusz-npem
head:   e30503d3e113df301779a6441e3b7ed2665c7bf5
commit: 2b921886c1475171d2408875478dcb02df2b8afe [2/3] PCI/NPEM: Add Native PCIe Enclosure Management support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240525/202405251943.zDqYDGLx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251943.zDqYDGLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251943.zDqYDGLx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/npem.c:254:5: warning: no previous prototype for 'brightness_set' [-Wmissing-prototypes]
     254 | int brightness_set(struct led_classdev *led, enum led_brightness brightness)
         |     ^~~~~~~~~~~~~~
--
>> drivers/pci/npem.c:104: warning: Excess struct member 'npem' description in 'npem_ops'
>> drivers/pci/npem.c:104: warning: Excess struct member 'buf' description in 'npem_ops'
>> drivers/pci/npem.c:104: warning: Excess struct member 'npem' description in 'npem_ops'
>> drivers/pci/npem.c:104: warning: Excess struct member 'val' description in 'npem_ops'


vim +/brightness_set +254 drivers/pci/npem.c

    86	
    87	/**
    88	 * struct npem_ops - backend specific callbacks
    89	 * @inds: supported indications array
    90	 * @get_active_indications: get active indications
    91	 *	@npem: npem device
    92	 *	@buf: response buffer
    93	 * @set_active_indications: set new indications
    94	 *	@npem: npem device
    95	 *	@val: bit mask to set
    96	 *
    97	 * Handle communication with hardware. set_active_indications updates
    98	 * npem->active_indications.
    99	 */
   100	struct npem_ops {
   101		const struct indication *inds;
   102		int (*get_active_indications)(struct npem *npem, u32 *buf);
   103		int (*set_active_indications)(struct npem *npem, u32 val);
 > 104	};
   105	
   106	/**
   107	 * struct npem - NPEM device properties
   108	 * @dev: PCIe device this driver is attached to
   109	 * @ops: Backend specific callbacks
   110	 * @npem_lock: to keep concurrent updates serialized
   111	 * @pos: NPEM capability offset (only relevant for NPEM direct register access,
   112	 *	 not DSM access method)
   113	 * @supported_indications: bit mask of supported indications
   114	 *			   non-indication and reserved bits are cleared
   115	 * @active_indications: bit mask of active indications
   116	 *			non-indication and reserved bits are cleared
   117	 * @led_cnt: Supported LEDs count
   118	 * @leds: supported LEDs
   119	 */
   120	struct npem {
   121		struct pci_dev *dev;
   122		const struct npem_ops *ops;
   123		struct mutex npem_lock;
   124		u16 pos;
   125		u32 supported_indications;
   126		u32 active_indications;
   127		int led_cnt;
   128		struct npem_led leds[];
   129	};
   130	
   131	static int npem_read_reg(struct npem *npem, u16 reg, u32 *val)
   132	{
   133		int ret = pci_read_config_dword(npem->dev, npem->pos + reg, val);
   134	
   135		return pcibios_err_to_errno(ret);
   136	}
   137	
   138	static int npem_write_ctrl(struct npem *npem, u32 reg)
   139	{
   140		int pos = npem->pos + PCI_NPEM_CTRL;
   141		int ret = pci_write_config_dword(npem->dev, pos, reg);
   142	
   143		return pcibios_err_to_errno(ret);
   144	}
   145	
   146	static int npem_get_active_indications(struct npem *npem, u32 *buf)
   147	{
   148		int ret;
   149	
   150		ret = npem_read_reg(npem, PCI_NPEM_CTRL, buf);
   151		if (ret)
   152			return ret;
   153	
   154		/* If PCI_NPEM_CTRL_ENABLE is not set then no indication should blink */
   155		if (!(*buf & PCI_NPEM_CTRL_ENABLE))
   156			*buf = 0;
   157	
   158		/* Filter out not supported indications in response */
   159		*buf &= npem->supported_indications;
   160		return 0;
   161	}
   162	
   163	static int npem_set_active_indications(struct npem *npem, u32 val)
   164	{
   165		int ret, ret_val;
   166		u32 cc_status;
   167	
   168		lockdep_assert_held(&npem->npem_lock);
   169	
   170		/* This bit is always required */
   171		val |= PCI_NPEM_CTRL_ENABLE;
   172		ret = npem_write_ctrl(npem, val);
   173		if (ret)
   174			return ret;
   175	
   176		/*
   177		 * For the case where a NPEM command has not completed immediately,
   178		 * it is recommended that software not continuously “spin” on polling
   179		 * the status register, but rather poll under interrupt at a reduced
   180		 * rate; for example at 10 ms intervals.
   181		 *
   182		 * PCIe r6.1 sec 6.28 "Implementation Note: Software Polling of NPEM
   183		 * Command Completed"
   184		 */
   185		ret = read_poll_timeout(npem_read_reg, ret_val,
   186					ret_val || (cc_status & PCI_NPEM_STATUS_CC),
   187					10 * USEC_PER_MSEC, USEC_PER_SEC, false, npem,
   188					PCI_NPEM_STATUS, &cc_status);
   189		if (ret)
   190			return ret_val;
   191	
   192		/*
   193		 * All writes to control register, including writes that do not change
   194		 * the register value, are NPEM commands and should eventually result
   195		 * in a command completion indication in the NPEM Status Register.
   196		 *
   197		 * PCIe Base Specification r6.1 sec 7.9.19.3
   198		 *
   199		 * Register may not be updated, or other conflicting bits may be
   200		 * cleared. Spec is not strict here. Read NPEM Control register after
   201		 * write to keep cache in-sync.
   202		 */
   203		return npem_get_active_indications(npem, &npem->active_indications);
   204	}
   205	
   206	const struct npem_ops npem_ops = {
   207		.inds = npem_indications,
   208		.get_active_indications = npem_get_active_indications,
   209		.set_active_indications = npem_set_active_indications,
   210	};
   211	
   212	#define DSM_GUID GUID_INIT(0x5d524d9d, 0xfff9, 0x4d4b,  0x8c, 0xb7, 0x74, 0x7e,\
   213				   0xd5, 0x1e, 0x19, 0x4d)
   214	#define GET_SUPPORTED_STATES_DSM	BIT(1)
   215	#define GET_STATE_DSM			BIT(2)
   216	#define SET_STATE_DSM			BIT(3)
   217	
   218	static const guid_t dsm_guid = DSM_GUID;
   219	
   220	static bool npem_has_dsm(struct pci_dev *pdev)
   221	{
   222		acpi_handle handle;
   223	
   224		handle = ACPI_HANDLE(&pdev->dev);
   225		if (!handle)
   226			return false;
   227	
   228		return acpi_check_dsm(handle, &dsm_guid, 0x1, GET_SUPPORTED_STATES_DSM |
   229				      GET_STATE_DSM | SET_STATE_DSM);
   230	}
   231	
   232	/*
   233	 * This function does not use ops->get_active_indications().
   234	 * It returns cached value, npem->npem_lock is held and it is safe.
   235	 */
   236	static enum led_brightness brightness_get(struct led_classdev *led)
   237	{
   238		struct npem_led *nled = container_of(led, struct npem_led, led);
   239		struct npem *npem = nled->npem;
   240		int ret, val = LED_OFF;
   241	
   242		ret = mutex_lock_interruptible(&npem->npem_lock);
   243		if (ret)
   244			return ret;
   245	
   246		if (npem->active_indications & nled->indication->bit)
   247			val = LED_ON;
   248	
   249		mutex_unlock(&npem->npem_lock);
   250	
   251		return val;
   252	}
   253	
 > 254	int brightness_set(struct led_classdev *led, enum led_brightness brightness)
   255	{
   256		struct npem_led *nled = container_of(led, struct npem_led, led);
   257		struct npem *npem = nled->npem;
   258		u32 indications;
   259		int ret;
   260	
   261		ret = mutex_lock_interruptible(&npem->npem_lock);
   262		if (ret)
   263			return ret;
   264	
   265		if (brightness == LED_OFF)
   266			indications = npem->active_indications & ~(nled->indication->bit);
   267		else
   268			indications = npem->active_indications | nled->indication->bit;
   269	
   270		ret = npem->ops->set_active_indications(npem, indications);
   271	
   272		mutex_unlock(&npem->npem_lock);
   273		return ret;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
