Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5B2D060B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606679; cv=none; b=O9RckLLa4hSx1x2z0IGON1YyQTy5jT6l7fvjIizbkMcF6wysJbAF/PMNGarDxG5g9uJET+h2aDW3IPdwdwELAr02Z1KbGaSd9roJd3+7hLxBhR0zDE/V7q49DszMpNOUZwlDYqrBKnX1dw6v6y3aOYJWbJ69UacTJMi9cSNjsoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606679; c=relaxed/simple;
	bh=9d99LFFsuxTxOYTTpd+iPkQ+xdT6xm1Lks4s1XdRf5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tKlecOO62ToIG1EJfC202ljCW1aXLQjoJN+9/1AdRJjU+eWdbNoPL23fK/QyI1c+uWFs6bIh0ShXHWO1KApMGAYjvF3y44+V8EsR1L3GTwtldPK8Txx13w4D0Z0OphiMKnyB2Ev6I7Jz0DT9TQkIrDRX2WrQv1Dp7atSMBkDpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/Ep3BOi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/Ep3BOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783606676; x=1815142676;
  h=date:from:to:cc:subject:message-id;
  bh=9d99LFFsuxTxOYTTpd+iPkQ+xdT6xm1Lks4s1XdRf5A=;
  b=i/Ep3BOixK6T0QELTUN2QNYP0ooq0gHPHckrQ+8ZIgjPgaCJ7JkcXAgB
   vjzJkqY5EWU9Hl035VfhWSsMEY7bIHeZGt6a+mnOyiPbSAtBaefgfftCg
   mPk3A4DM8E0Hpyoyx4rmEkmUhIjFc89RTJFwq8oMGR0H2UTT0wvynut32
   PdO5O4yo7HYg6gnUiIpnTOluU6PGoOclTMd/oD2aBMHbYXTjsjim4w0fm
   T0PZ9B4S+n/4BiC8TtkMlKmw+fYRdG5HPS3Fvk+4OsO7mSuBCbWfhwVCc
   wtMcB4ZOqciyzSB8GnSeKlHgdAzvQJNerilMCMmeqRFW7LN0m10YEiE7H
   Q==;
X-CSE-ConnectionGUID: wAn7v9MmTvCgGBnYRriJWw==
X-CSE-MsgGUID: JZ4ep/RxTOiHckcYWMwbeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95802508"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95802508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 07:17:56 -0700
X-CSE-ConnectionGUID: O79MDbH6Th2/nsr/JYPP8A==
X-CSE-MsgGUID: 4Qg9Q/oeRy++fByZhJRqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250611471"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 07:17:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whpZR-00000000HkL-0rhi;
	Thu, 09 Jul 2026 14:17:47 +0000
Date: Thu, 09 Jul 2026 22:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 21/25]
 drivers/firmware/arm_scmi/driver.c:3088:32: error: implicit declaration of
 function 'acpi_device_hid'; did you mean 'acpi_device_handle'?
Message-ID: <202607092200.MXXGM5Tt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   147aaa2ff94d6bc16f229c93e8af301b6c172b4f
commit: 9901e591cdb4a593b48de0ded456d28677064078 [21/25] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260709/202607092200.MXXGM5Tt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092200.MXXGM5Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092200.MXXGM5Tt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/arm_scmi/driver.c: In function 'scmi_debugfs_common_setup':
>> drivers/firmware/arm_scmi/driver.c:3088:32: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
    3088 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                                ^~~~~~~~~~~~~~~
         |                                acpi_device_handle
>> drivers/firmware/arm_scmi/driver.c:3088:54: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
    3088 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                                                      ^


vim +3088 drivers/firmware/arm_scmi/driver.c

  3066	
  3067	static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
  3068	{
  3069		char top_dir[16];
  3070		struct dentry *trans, *top_dentry;
  3071		struct scmi_debug_info *dbg;
  3072		struct acpi_device *adev;
  3073		const char *c_ptr = NULL;
  3074	
  3075		dbg = devm_kzalloc(info->dev, sizeof(*dbg), GFP_KERNEL);
  3076		if (!dbg)
  3077			return NULL;
  3078	
  3079		dbg->name = kstrdup(fwnode_get_name(dev_fwnode(info->dev)), GFP_KERNEL);
  3080		if (!dbg->name) {
  3081			devm_kfree(info->dev, dbg);
  3082			return NULL;
  3083		}
  3084	
  3085		if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
  3086						&c_ptr)) {
  3087			adev = ACPI_COMPANION(info->dev);
> 3088			c_ptr = adev ? acpi_device_hid(adev) : "unknown";
  3089		}
  3090		dbg->type = kstrdup(c_ptr, GFP_KERNEL);
  3091		if (!dbg->type) {
  3092			kfree(dbg->name);
  3093			devm_kfree(info->dev, dbg);
  3094			return NULL;
  3095		}
  3096	
  3097		snprintf(top_dir, 16, "%d", info->id);
  3098		top_dentry = debugfs_create_dir(top_dir, scmi_top_dentry);
  3099		trans = debugfs_create_dir("transport", top_dentry);
  3100	
  3101		dbg->is_atomic = info->desc->atomic_enabled &&
  3102					is_transport_polling_capable(info->desc);
  3103	
  3104		debugfs_create_str("instance_name", 0400, top_dentry,
  3105				   (char **)&dbg->name);
  3106	
  3107		debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
  3108				   (u32 *)&info->desc->atomic_threshold);
  3109	
  3110		debugfs_create_str("type", 0400, trans, (char **)&dbg->type);
  3111	
  3112		debugfs_create_bool("is_atomic", 0400, trans, &dbg->is_atomic);
  3113	
  3114		debugfs_create_u32("max_rx_timeout_ms", 0400, trans,
  3115				   (u32 *)&info->desc->max_rx_timeout_ms);
  3116	
  3117		debugfs_create_u32("max_msg_size", 0400, trans,
  3118				   (u32 *)&info->desc->max_msg_size);
  3119	
  3120		debugfs_create_u32("tx_max_msg", 0400, trans,
  3121				   (u32 *)&info->tx_minfo.max_msg);
  3122	
  3123		debugfs_create_u32("rx_max_msg", 0400, trans,
  3124				   (u32 *)&info->rx_minfo.max_msg);
  3125	
  3126		if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
  3127			scmi_debugfs_counters_setup(dbg, trans);
  3128	
  3129		dbg->top_dentry = top_dentry;
  3130	
  3131		if (devm_add_action_or_reset(info->dev,
  3132					     scmi_debugfs_common_cleanup, dbg))
  3133			return NULL;
  3134	
  3135		return dbg;
  3136	}
  3137	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
