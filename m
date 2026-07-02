Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B234BA50
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964637; cv=none; b=ExrwRNpcJGz/DtK+W0QJPB4qjnIug+8RzTthTk5514cP9bqaop3O30FQQy0dKgCG0RBlYeQse01Uw7HKR9TfTXpTz8gFb2q6jVp2hK1TP7fCE31yyTMbI1ipRUYv5ce4/fHSGXoSqVTiDQjzSjFSW3b8KY4Vy7U+hVd6ALCGQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964637; c=relaxed/simple;
	bh=/73BSBSCzDBXmU57X1xw94mDxUh0iE2B7S8K2vY10lg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bTnyVoI7U+zXgvZ23S6w18sigy5Np96RkOdZ0/3+NOJI/bVpiA2oPyLsZ6TcZtdXRXd5Bx2VYokMQ/v2KnGLqqu2R4Ne1jtMHTTtlHBXZnDNF4y+RwnyiXEe6K6mYd2gvJnIaYv62R0e4w/amurPQBlJZ75JRENqtN/sP2iVqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpxZfnBv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpxZfnBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782964636; x=1814500636;
  h=date:from:to:cc:subject:message-id;
  bh=/73BSBSCzDBXmU57X1xw94mDxUh0iE2B7S8K2vY10lg=;
  b=KpxZfnBvAZoUBUqUMRPRNIDnKT7t8qlBzWLVlELcdVV0inyRRWZzSn67
   Q/VyMCFl8bvljeyzfbo2uBzWO9YGbMFnQbg0ZWkhg4e/H/amkkmmhJiO5
   Mq46aiylFN0dxP3F6SpE6V5iRVWuEF4qNdbTCa9cvAIhVlvKkhNFphvxN
   AHPMu2/y/8Cik42s7wPxmitzT9bPuVGnYPcZLDYM0roBtuieN4sU5phmy
   lktIRJahAKM/+62KucX2PRQ3GQ92SJlSMTZ3NYefrK7jC4dmV6Vn4IsZs
   5XGzMOvQFU++DeaVr5LCo4K9wL4fKGgp4q6I0+x5ednDX685ZbhNLADl/
   A==;
X-CSE-ConnectionGUID: wonpMBPRQA2JkxuHGdneZA==
X-CSE-MsgGUID: KWdnB6inTIi2wwqhtewhtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83837747"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83837747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:57:14 -0700
X-CSE-ConnectionGUID: cDdc2qB2Q26FtEIkg1uMUg==
X-CSE-MsgGUID: ffcEUzTeR4eNv8y9d4W4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256658499"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2026 20:57:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8Y2-000000009xh-00H5;
	Thu, 02 Jul 2026 03:57:10 +0000
Date: Thu, 02 Jul 2026 11:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 19/23]
 drivers/firmware/arm_scmi/driver.c:3072:54: warning: pointer/integer type
 mismatch in conditional expression
Message-ID: <202607021119.VLWpioPF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   bdcaa5728f17002c1091efd93dd082c9c23ddd39
commit: f17b84ab4e8011a39adfbbf053b2cac4433e6918 [19/23] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
config: arc-randconfig-002-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021119.VLWpioPF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021119.VLWpioPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021119.VLWpioPF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/driver.c: In function 'scmi_debugfs_common_setup':
   drivers/firmware/arm_scmi/driver.c:3072:32: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Werror=implicit-function-declaration]
    3072 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                                ^~~~~~~~~~~~~~~
         |                                acpi_device_handle
>> drivers/firmware/arm_scmi/driver.c:3072:54: warning: pointer/integer type mismatch in conditional expression
    3072 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                                                      ^
   cc1: some warnings being treated as errors


vim +3072 drivers/firmware/arm_scmi/driver.c

  3050	
  3051	static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
  3052	{
  3053		char top_dir[16];
  3054		struct dentry *trans, *top_dentry;
  3055		struct scmi_debug_info *dbg;
  3056		struct acpi_device *adev;
  3057		const char *c_ptr = NULL;
  3058	
  3059		dbg = devm_kzalloc(info->dev, sizeof(*dbg), GFP_KERNEL);
  3060		if (!dbg)
  3061			return NULL;
  3062	
  3063		dbg->name = kstrdup(fwnode_get_name(dev_fwnode(info->dev)), GFP_KERNEL);
  3064		if (!dbg->name) {
  3065			devm_kfree(info->dev, dbg);
  3066			return NULL;
  3067		}
  3068	
  3069		if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
  3070						&c_ptr)) {
  3071			adev = ACPI_COMPANION(info->dev);
> 3072			c_ptr = adev ? acpi_device_hid(adev) : "unknown";
  3073		}
  3074		dbg->type = kstrdup(c_ptr, GFP_KERNEL);
  3075		if (!dbg->type) {
  3076			kfree(dbg->name);
  3077			devm_kfree(info->dev, dbg);
  3078			return NULL;
  3079		}
  3080	
  3081		snprintf(top_dir, 16, "%d", info->id);
  3082		top_dentry = debugfs_create_dir(top_dir, scmi_top_dentry);
  3083		trans = debugfs_create_dir("transport", top_dentry);
  3084	
  3085		dbg->is_atomic = info->desc->atomic_enabled &&
  3086					is_transport_polling_capable(info->desc);
  3087	
  3088		debugfs_create_str("instance_name", 0400, top_dentry,
  3089				   (char **)&dbg->name);
  3090	
  3091		debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
  3092				   (u32 *)&info->desc->atomic_threshold);
  3093	
  3094		debugfs_create_str("type", 0400, trans, (char **)&dbg->type);
  3095	
  3096		debugfs_create_bool("is_atomic", 0400, trans, &dbg->is_atomic);
  3097	
  3098		debugfs_create_u32("max_rx_timeout_ms", 0400, trans,
  3099				   (u32 *)&info->desc->max_rx_timeout_ms);
  3100	
  3101		debugfs_create_u32("max_msg_size", 0400, trans,
  3102				   (u32 *)&info->desc->max_msg_size);
  3103	
  3104		debugfs_create_u32("tx_max_msg", 0400, trans,
  3105				   (u32 *)&info->tx_minfo.max_msg);
  3106	
  3107		debugfs_create_u32("rx_max_msg", 0400, trans,
  3108				   (u32 *)&info->rx_minfo.max_msg);
  3109	
  3110		if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
  3111			scmi_debugfs_counters_setup(dbg, trans);
  3112	
  3113		dbg->top_dentry = top_dentry;
  3114	
  3115		if (devm_add_action_or_reset(info->dev,
  3116					     scmi_debugfs_common_cleanup, dbg))
  3117			return NULL;
  3118	
  3119		return dbg;
  3120	}
  3121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
