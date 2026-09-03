Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B603F4128
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427673; cv=none; b=WS1s9uAB/gacnxa/iRTlfsWLJsFTh83iVWP4vBsCJsXjF47PA/twPjyHLnmAjSXwjma1utWZzxFQzpeTBP5tJFtaRiyNPXeFsueO7dgQSQdWYmNSvJKM/IYaE30ztD1lW7o5WvNirAIrUoPFtpDt+Q3FQD+ZAJXfHxDUMcRhIPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427673; c=relaxed/simple;
	bh=XA3kqSNBOWHEURJs9O7B0IRHhkqECwJ0eo88s7MfrOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JB5FgjmffGKxqvsjKOB+G0aPGWFQIBxR0ZsWzZtnaqFD1zqLYEpqEkn+T42umcBUjPRBWyzVA4a+CsBXEhTiugKlu3HD3WQyUXBWRSIvw3d0fjynvae5Pe+zFob7PdrXBN6dPGAxcVZc3jTQJKUj6Vf53j1FvKVjk3nkwbYgXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2eLSZif; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2eLSZif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788427671; x=1819963671;
  h=date:from:to:cc:subject:message-id;
  bh=XA3kqSNBOWHEURJs9O7B0IRHhkqECwJ0eo88s7MfrOA=;
  b=M2eLSZifq1KoJUiQepf8glTKNFQmJG+SVQP57QCwi/yWWd48FPoGgLY8
   eAekK4dZ9qYRxYHQIn6getTHCbD9argFtwTACniyzXBctmECua0jDY2Cp
   GVtF0ghGszgqvETtcnQTOu4o21Bbosci+0xuwxkc9WcvgyfrDGl7AUGQ1
   FG4os0cHzSNmxtx5NCdxzgnYez2dNXnvRnfa+KOLHtFSrhEcqov90V0q5
   vBv65wdYiusGJs6Y+E9zpUEwX2b2AbFnF6TS/NXkCxdyNop4XoXdNwsJL
   vbwnDW2bO6k2UZUTkkqZGd4rq+XAP+GAuoFGDoAEIaHeYqKj1p+P4PE8G
   w==;
X-CSE-ConnectionGUID: L2bxm4tWRsevdoGpijt+Nw==
X-CSE-MsgGUID: QaxHL9FkT8Ocgfj9U7v0eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="91414704"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="91414704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 02:27:50 -0700
X-CSE-ConnectionGUID: SfbwlFu1SSWUybohTfXZBg==
X-CSE-MsgGUID: p3t27GqdQFuNH57lzPdk8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="274947884"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 02:27:49 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x23jW-000000000sR-3wCt;
	Thu, 03 Sep 2026 09:27:46 +0000
Date: Thu, 03 Sep 2026 11:27:02 +0200
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [sudeep-holla:b4/acpi_scmi_pcc 4/10]
 drivers/firmware/arm_scmi/driver.c:3357:56: error: use of undeclared
 identifier 'child'
Message-ID: <202609031114.FGVE8i8e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   673f426a7fa015555d9fd8433710b4cd2de2f661
commit: f34e9f996f20892dc1471c7d6edf0a542e3f63bb [4/10] firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031114.FGVE8i8e-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031114.FGVE8i8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031114.FGVE8i8e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/driver.c:3357:56: error: use of undeclared identifier 'child'
    3357 |         fwnode_for_each_available_child_node(dev_fwnode(dev), child) {
         |                                                               ^~~~~
>> drivers/firmware/arm_scmi/driver.c:3357:56: error: use of undeclared identifier 'child'
    3357 |         fwnode_for_each_available_child_node(dev_fwnode(dev), child) {
         |                                                               ^~~~~
>> drivers/firmware/arm_scmi/driver.c:3357:56: error: use of undeclared identifier 'child'
    3357 |         fwnode_for_each_available_child_node(dev_fwnode(dev), child) {
         |                                                               ^~~~~
>> drivers/firmware/arm_scmi/driver.c:3357:56: error: use of undeclared identifier 'child'
    3357 |         fwnode_for_each_available_child_node(dev_fwnode(dev), child) {
         |                                                               ^~~~~
   drivers/firmware/arm_scmi/driver.c:3360:32: error: use of undeclared identifier 'child'
    3360 |                 if (fwnode_property_read_u32(child, "reg", &prot_id))
         |                                              ^~~~~
   drivers/firmware/arm_scmi/driver.c:3378:44: error: use of undeclared identifier 'child'
    3378 |                 ret = idr_alloc(&info->active_protocols, child,
         |                                                          ^~~~~
   drivers/firmware/arm_scmi/driver.c:3386:50: error: use of undeclared identifier 'child'
    3386 |                 scmi_create_protocol_devices(fwnode_handle_get(child), info,
         |                                                                ^~~~~
   7 errors generated.


vim +/child +3357 drivers/firmware/arm_scmi/driver.c

  3234	
  3235	static int scmi_probe(struct platform_device *pdev)
  3236	{
  3237		int ret;
  3238		char *err_str = "probe failure\n";
  3239		struct scmi_handle *handle;
  3240		const struct scmi_desc *desc;
  3241		struct scmi_info *info;
  3242		bool coex = IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX);
  3243		struct device *dev = &pdev->dev;
  3244	
  3245		desc = scmi_transport_setup(dev);
  3246		if (!desc) {
  3247			err_str = "transport invalid\n";
  3248			ret = -EINVAL;
  3249			goto out_err;
  3250		}
  3251	
  3252		info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
  3253		if (!info)
  3254			return -ENOMEM;
  3255	
  3256		info->id = ida_alloc_min(&scmi_id, 0, GFP_KERNEL);
  3257		if (info->id < 0)
  3258			return info->id;
  3259	
  3260		info->dev = dev;
  3261		info->desc = desc;
  3262		info->bus_nb.notifier_call = scmi_bus_notifier;
  3263		info->dev_req_nb.notifier_call = scmi_device_request_notifier;
  3264		INIT_LIST_HEAD(&info->node);
  3265		idr_init(&info->protocols);
  3266		mutex_init(&info->protocols_mtx);
  3267		idr_init(&info->active_protocols);
  3268		mutex_init(&info->devreq_mtx);
  3269	
  3270		platform_set_drvdata(pdev, info);
  3271		idr_init(&info->tx_idr);
  3272		idr_init(&info->rx_idr);
  3273	
  3274		handle = &info->handle;
  3275		handle->dev = info->dev;
  3276		handle->version = &info->version;
  3277		handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
  3278		handle->devm_protocol_get = scmi_devm_protocol_get;
  3279		handle->devm_protocol_put = scmi_devm_protocol_put;
  3280		handle->is_transport_atomic = scmi_is_transport_atomic;
  3281	
  3282		/* Setup all channels described in the fwnode at first */
  3283		ret = scmi_channels_setup(info);
  3284		if (ret) {
  3285			err_str = "failed to setup channels\n";
  3286			goto clear_txrx_setup;
  3287		}
  3288	
  3289		ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
  3290		if (ret) {
  3291			err_str = "failed to register bus notifier\n";
  3292			goto clear_txrx_setup;
  3293		}
  3294	
  3295		ret = blocking_notifier_chain_register(&scmi_requested_devices_nh,
  3296						       &info->dev_req_nb);
  3297		if (ret) {
  3298			err_str = "failed to register device notifier\n";
  3299			goto clear_bus_notifier;
  3300		}
  3301	
  3302		ret = scmi_xfer_info_init(info);
  3303		if (ret) {
  3304			err_str = "failed to init xfers pool\n";
  3305			goto clear_dev_req_notifier;
  3306		}
  3307	
  3308		if (scmi_top_dentry) {
  3309			info->dbg = scmi_debugfs_common_setup(info);
  3310			if (!info->dbg)
  3311				dev_warn(dev, "Failed to setup SCMI debugfs.\n");
  3312	
  3313			if (info->dbg && IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT)) {
  3314				ret = scmi_debugfs_raw_mode_setup(info);
  3315				if (!coex) {
  3316					if (ret)
  3317						goto clear_dev_req_notifier;
  3318	
  3319					/* Bail out anyway when coex disabled. */
  3320					return 0;
  3321				}
  3322	
  3323				/* Coex enabled, carry on in any case. */
  3324				dev_info(dev, "SCMI RAW Mode COEX enabled !\n");
  3325			}
  3326		}
  3327	
  3328		if (scmi_notification_init(handle))
  3329			dev_err(dev, "SCMI Notifications NOT available.\n");
  3330	
  3331		if (info->desc->atomic_enabled &&
  3332		    !is_transport_polling_capable(info->desc))
  3333			dev_err(dev,
  3334				"Transport is not polling capable. Atomic mode not supported.\n");
  3335	
  3336		/*
  3337		 * Trigger SCMI Base protocol initialization.
  3338		 * It's mandatory and won't be ever released/deinit until the
  3339		 * SCMI stack is shutdown/unloaded as a whole.
  3340		 */
  3341		ret = scmi_protocol_acquire(handle, SCMI_PROTOCOL_BASE);
  3342		if (ret) {
  3343			err_str = "unable to communicate with SCMI\n";
  3344			if (coex) {
  3345				dev_err(dev, "%s", err_str);
  3346				return 0;
  3347			}
  3348			goto raw_mode_cleanup;
  3349		}
  3350	
  3351		mutex_lock(&scmi_list_mutex);
  3352		list_add_tail(&info->node, &scmi_list);
  3353		mutex_unlock(&scmi_list_mutex);
  3354	
  3355		scmi_enable_matching_quirks(info);
  3356	
> 3357		fwnode_for_each_available_child_node(dev_fwnode(dev), child) {
  3358			u32 prot_id;
  3359	
  3360			if (fwnode_property_read_u32(child, "reg", &prot_id))
  3361				continue;
  3362	
  3363			if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
  3364				dev_err(dev, "Out of range protocol %d\n", prot_id);
  3365				continue;
  3366			}
  3367	
  3368			if (!scmi_is_protocol_implemented(handle, prot_id)) {
  3369				dev_err(dev, "SCMI protocol %d not implemented\n",
  3370					prot_id);
  3371				continue;
  3372			}
  3373	
  3374			/*
  3375			 * Save this valid fwnode protocol descriptor amongst
  3376			 * @active_protocols for this SCMI instance.
  3377			 */
  3378			ret = idr_alloc(&info->active_protocols, child,
  3379					prot_id, prot_id + 1, GFP_KERNEL);
  3380			if (ret != prot_id) {
  3381				dev_err(dev, "SCMI protocol %d already activated. Skip\n",
  3382					prot_id);
  3383				continue;
  3384			}
  3385	
  3386			scmi_create_protocol_devices(fwnode_handle_get(child), info,
  3387						     prot_id, NULL);
  3388		}
  3389	
  3390		return 0;
  3391	
  3392	raw_mode_cleanup:
  3393		if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
  3394			scmi_raw_mode_cleanup(info->raw);
  3395	clear_dev_req_notifier:
  3396		blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
  3397						   &info->dev_req_nb);
  3398	clear_bus_notifier:
  3399		bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
  3400	clear_txrx_setup:
  3401		scmi_notification_quiesce(&info->handle);
  3402		scmi_cleanup_txrx_channels(info);
  3403		scmi_notification_exit(&info->handle);
  3404		ida_free(&scmi_id, info->id);
  3405	
  3406	out_err:
  3407		return dev_err_probe(dev, ret, "%s", err_str);
  3408	}
  3409	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
