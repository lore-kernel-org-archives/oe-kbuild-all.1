Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B79224F0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 23:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735859012; cv=none; b=i68ZkZmHcA2dq4gdITO/IqweK+uBD9s5hPSQODVCmjeEoVd9qOa6NzKd9PI6Aeaone9jzAEBgtu2mSBrV10Qey0zKMS9MffvCR7Mc669I6lgWiR//gOYxEubJefJ+aWYuHldPn5ry4zxIOgyeFfj1JHUVX7ytLKPvFVIcwvB3gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735859012; c=relaxed/simple;
	bh=s1S2sy0VpjKOoxLEh6zg/91UIiOOMzKDCVGbC0H9vEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AaVCFu6s4KHuo2GAwpzhNzYg0AI4A/cUi0Swr/9ByfPL0kLK6zMd9627upQAdNXIjio0kyP+6iZnuQmI/j9AQZYT3o2jXZk6XUlNe5EgsoDjnWqmTsvPUv4woqOzrr/n3ao7NZoTfemGWYwJ2tWyEh+zWA2638238TekRPm1gTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tobgb1ru; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tobgb1ru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735859011; x=1767395011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1S2sy0VpjKOoxLEh6zg/91UIiOOMzKDCVGbC0H9vEo=;
  b=Tobgb1ruOmPgpbVNTSSyuHZb1D4ia0QwESxbZnR4xoDaaoUouZb6okML
   9fRLXiDZl92nQ65vGgSnXsSQHAEHZMloVF51kTM6NRajq99Ochsi871Ez
   Y5BlsxXW3np84U+7ds+pFj1drqxRFLC5QtDJYFkA4hOb8CyCYxaJLqP9x
   K4yX14vZCCfydKZ3k8saLdsp6SgcnC28Wr3thSfPhUkJft5l7xq4Krr1X
   6fz38tAX8AorlsI1Aod9zDHi5L9kbbZomQV/WQErlRqlAl2REE3JgARfQ
   jgKLe/pPTM0Hxohfc42489Ht8I17I/VFdFCzf/cOovCkfi3i9M54Vb4VZ
   A==;
X-CSE-ConnectionGUID: wtbpwX9jQaON+BTTmVq1wQ==
X-CSE-MsgGUID: S/JvwrX/RE+yp11Y2DIGUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35989135"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35989135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 15:03:30 -0800
X-CSE-ConnectionGUID: B847RHQmR0uMHsPFduC+mA==
X-CSE-MsgGUID: FF5r4LBjScaRbZFWtPVYMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101432380"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jan 2025 15:03:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTUDu-0008wZ-1j;
	Thu, 02 Jan 2025 23:03:26 +0000
Date: Fri, 3 Jan 2025 07:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/gpu/drm/phytium/phytium_debugfs.c:189:34-69: opportunity for
 str_enabled_disabled(phytium_dp -> panel . backlight_enabled)
Message-ID: <202501030757.m59EWrOL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c116febc8d53bc1f8f25a3d60db331f17ab8cd8
commit: cad0702e5286d3cc80afe545de027858b855dd5a [1365/1365] DRM: Phytium display DRM driver
config: arm64-randconfig-r064-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030757.m59EWrOL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030757.m59EWrOL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/phytium/phytium_debugfs.c:189:34-69: opportunity for str_enabled_disabled(phytium_dp -> panel . backlight_enabled)
>> drivers/gpu/drm/phytium/phytium_debugfs.c:217:30-61: opportunity for str_enabled_disabled(phytium_dp -> panel . power_enabled)
>> drivers/gpu/drm/phytium/phytium_debugfs.c:340:35-56: opportunity for str_yes_no(phytium_dp -> has_audio)
--
>> drivers/gpu/drm/phytium/phytium_dp.c:1279:10-34: opportunity for str_enable_disable(mode == DRM_MODE_DPMS_ON)
--
>> drivers/gpu/drm/phytium/phytium_panel.c:79:10-16: opportunity for str_enable_disable(enable)

vim +189 drivers/gpu/drm/phytium/phytium_debugfs.c

   179	
   180	static int phytium_edp_backlight_show(struct seq_file *m, void *data)
   181	{
   182		struct drm_connector *connector = m->private;
   183		struct phytium_dp_device *phytium_dp = connector_to_dp_device(connector);
   184	
   185		if (!phytium_dp->is_edp)
   186			return -ENODEV;
   187	
   188		mutex_lock(&phytium_dp->panel.panel_lock);
 > 189		seq_printf(m, "backlight: %s\n", phytium_dp->panel.backlight_enabled?"enabled":"disabled");
   190		mutex_unlock(&phytium_dp->panel.panel_lock);
   191	
   192		return 0;
   193	}
   194	
   195	static int phytium_edp_backlight_open(struct inode *inode, struct file *file)
   196	{
   197		return single_open(file, phytium_edp_backlight_show, inode->i_private);
   198	}
   199	
   200	static const struct file_operations phytium_edp_backlight_fops = {
   201		.owner = THIS_MODULE,
   202		.open = phytium_edp_backlight_open,
   203		.read = seq_read,
   204		.llseek = seq_lseek,
   205		.release = single_release,
   206	};
   207	
   208	static int phytium_edp_power_show(struct seq_file *m, void *data)
   209	{
   210		struct drm_connector *connector = m->private;
   211		struct phytium_dp_device *phytium_dp = connector_to_dp_device(connector);
   212	
   213		if (!phytium_dp->is_edp)
   214			return -ENODEV;
   215	
   216		mutex_lock(&phytium_dp->panel.panel_lock);
 > 217		seq_printf(m, "power: %s\n", phytium_dp->panel.power_enabled?"enabled":"disabled");
   218		mutex_unlock(&phytium_dp->panel.panel_lock);
   219	
   220		return 0;
   221	}
   222	
   223	static int phytium_edp_power_open(struct inode *inode, struct file *file)
   224	{
   225		return single_open(file, phytium_edp_power_show, inode->i_private);
   226	}
   227	
   228	static const struct file_operations phytium_edp_power_fops = {
   229		.owner = THIS_MODULE,
   230		.open = phytium_edp_power_open,
   231		.read = seq_read,
   232		.llseek = seq_lseek,
   233		.release = single_release,
   234	};
   235	
   236	struct dpcd_block {
   237		/* DPCD dump start address. */
   238		unsigned int offset;
   239		/* DPCD dump end address, inclusive. If unset, .size will be used. */
   240		unsigned int end;
   241		/* DPCD dump size. Used if .end is unset. If unset, defaults to 1. */
   242		size_t size;
   243		/* Only valid for eDP. */
   244		bool edp;
   245	};
   246	
   247	static const struct dpcd_block phytium_dpcd_debug[] = {
   248		{ .offset = DP_DPCD_REV, .size = DP_RECEIVER_CAP_SIZE },
   249		{ .offset = DP_PSR_SUPPORT, .end = DP_PSR_CAPS },
   250		{ .offset = DP_DOWNSTREAM_PORT_0, .size = 16 },
   251		{ .offset = DP_LINK_BW_SET, .end = DP_EDP_CONFIGURATION_SET },
   252		{ .offset = DP_SINK_COUNT, .end = DP_ADJUST_REQUEST_LANE2_3 },
   253		{ .offset = DP_SET_POWER },
   254		{ .offset = DP_EDP_DPCD_REV },
   255		{ .offset = DP_EDP_GENERAL_CAP_1, .end = DP_EDP_GENERAL_CAP_3 },
   256		{ .offset = DP_EDP_DISPLAY_CONTROL_REGISTER, .end = DP_EDP_BACKLIGHT_FREQ_CAP_MAX_LSB },
   257		{ .offset = DP_EDP_DBC_MINIMUM_BRIGHTNESS_SET, .end = DP_EDP_DBC_MAXIMUM_BRIGHTNESS_SET },
   258		{ .offset = DP_DEVICE_SERVICE_IRQ_VECTOR, .size = 1 },
   259		{ .offset = DP_TEST_REQUEST, .end = DP_TEST_PATTERN },
   260	};
   261	
   262	static int phytium_dpcd_show(struct seq_file *m, void *data)
   263	{
   264		struct drm_connector *connector = m->private;
   265		struct phytium_dp_device *phytium_dp = connector_to_dp_device(connector);
   266		uint8_t buf[16], i;
   267		ssize_t err;
   268	
   269		if (connector->status != connector_status_connected)
   270			return -ENODEV;
   271	
   272		for (i = 0; i < ARRAY_SIZE(phytium_dpcd_debug); i++) {
   273			const struct dpcd_block *b = &phytium_dpcd_debug[i];
   274			size_t size = b->end ? b->end - b->offset + 1 : (b->size ?: 1);
   275	
   276			if (WARN_ON(size > sizeof(buf)))
   277				continue;
   278	
   279			err = drm_dp_dpcd_read(&phytium_dp->aux, b->offset, buf, size);
   280			if (err <= 0) {
   281				DRM_ERROR("dpcd read (%zu bytes at %u) failed (%zd)\n",
   282					   size, b->offset, err);
   283				continue;
   284			}
   285	
   286			seq_printf(m, "%04x: %*ph\n", b->offset, (int) size, buf);
   287		}
   288	
   289		return 0;
   290	}
   291	
   292	static int phytium_dpcd_open(struct inode *inode, struct file *file)
   293	{
   294		return single_open(file, phytium_dpcd_show, inode->i_private);
   295	}
   296	
   297	static const struct file_operations phytium_dpcd_fops = {
   298		.owner = THIS_MODULE,
   299		.open = phytium_dpcd_open,
   300		.read = seq_read,
   301		.llseek = seq_lseek,
   302		.release = single_release,
   303	};
   304	
   305	static ssize_t
   306	phytium_dp_state_write(struct file *filp,
   307					 const char __user *ubuf,
   308					 size_t len,
   309					 loff_t *ppos)
   310	{
   311		char tmp[16];
   312	
   313		if (len >= sizeof(tmp))
   314			return -EINVAL;
   315	
   316		memset(tmp, 0, sizeof(tmp));
   317		if (copy_from_user(tmp, ubuf, len))
   318			return -EFAULT;
   319		tmp[len] = '\0';
   320	
   321		return len;
   322	}
   323	
   324	static int phytium_dp_state_show(struct seq_file *m, void *data)
   325	{
   326		struct drm_connector *connector = m->private;
   327		struct phytium_dp_device *phytium_dp = connector_to_dp_device(connector);
   328	
   329		seq_printf(m, "port number: %d\n", phytium_dp->port);
   330		seq_printf(m, "source_max_lane_count: %d\n", phytium_dp->source_max_lane_count);
   331		seq_printf(m, "max_source_rates: %d\n",
   332			   phytium_dp->source_rates[phytium_dp->num_source_rates-1]);
   333		if (connector->status == connector_status_connected) {
   334			seq_printf(m, "sink_max_lane_count: %d\n", phytium_dp->sink_max_lane_count);
   335			seq_printf(m, "max_sink_rates: %d\n",
   336				   phytium_dp->sink_rates[phytium_dp->num_sink_rates-1]);
   337			seq_printf(m, "link_rate: %d\n", phytium_dp->link_rate);
   338			seq_printf(m, "link_lane_count: %d\n", phytium_dp->link_lane_count);
   339			seq_printf(m, "train_set[0]: %d\n", phytium_dp->train_set[0]);
 > 340			seq_printf(m, "has_audio: %s\n", phytium_dp->has_audio?"yes":"no");
   341		}
   342	
   343		return 0;
   344	}
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
