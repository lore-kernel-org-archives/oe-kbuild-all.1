Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621A2F6196
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207714; cv=none; b=BrhUi39z8CqckQzXBB615Ej6AD1vgAjyVCgEXU39oZizI11twcZWYuru/sSz2GSWgwcuDsw8HlNOGI7ZP23ig2ALe4uOEoT0EXMjkQbM0iR/irhZ61mTcKuwMFAYyMAIo/vq7xB+xb5IZUFWjnYFmgC54CQo1g99e+cNF80dGBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207714; c=relaxed/simple;
	bh=/E1sQuNPaPZp7hBq/8fuhzRLo17fCO+C4j5DYCQQ19k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8Uv/fMk2IzVJ+KQRDkxpUFhq0wvobqo64YjNyAREPZ87U0Bkmf7mO6TawOo8m9c5EYjIdcFCOPtpIa3HvD1seZJ1jnoWpAdH4SLfjH8Dn8BKNaaxDSZCO7+8a9UlcQVsm1FLw3sQaVprLxvKYWlZy79u1CfDFsdlVTo0jNOFvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkpULVvd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkpULVvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761207710; x=1792743710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/E1sQuNPaPZp7hBq/8fuhzRLo17fCO+C4j5DYCQQ19k=;
  b=LkpULVvd5+hFXXpp0bGUhIwGP86Oz1Gky6e2byGKr9/CV9UU3D2/AGQh
   Nioe1Az5K3y45w3djFQiZT1IXzKdKinmLIXD5JyQue33hNcytx0ndcEys
   6IYsklWxL7x6yT0F4XZdOoULYp03RLqUwumSSYV7M9VEWBxJuhCfLrt95
   v8ttAHScQ6Ai46erW0m35DR4MVwxfaN0Ucf9knQMe7MmWLnwLJ2grkw+s
   nVcklbB9KJzP7JmFc0w/CVjWEcRIy5KHdpDL3Bei8ExOwfsq4cKOtXqwW
   njiWLeOWm87RCKhPtUrdmFbAqzvZ+03JGDrRPSg6TMtpK8lHg4pE1Q/6U
   Q==;
X-CSE-ConnectionGUID: mpVj591dTTGR7ytDLChzjQ==
X-CSE-MsgGUID: ZgSBmXpaTJuypSPf/KGdNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74808582"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74808582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:21:48 -0700
X-CSE-ConnectionGUID: xFd1dy89TxmdDpLa2cm4fw==
X-CSE-MsgGUID: y5GFyevTS/yt/zyeQqwfkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="207753247"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2025 01:21:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBqZr-000DDl-2m;
	Thu, 23 Oct 2025 08:21:43 +0000
Date: Thu, 23 Oct 2025 16:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	amd-gfx@lists.freedesktop.org, corbet@lwn.net, rafael@kernel.org,
	gregkh@linuxfoundation.org, dakr@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] PM: Allow device drivers to manage the frozen state
 of a device
Message-ID: <202510231647.os6nFPgQ-lkp@intel.com>
References: <20251022155114.48418-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022155114.48418-2-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/PM-Allow-device-drivers-to-manage-the-frozen-state-of-a-device/20251022-235319
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251022155114.48418-2-mario.limonciello%40amd.com
patch subject: [PATCH 1/2] PM: Allow device drivers to manage the frozen state of a device
config: riscv-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231647.os6nFPgQ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231647.os6nFPgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231647.os6nFPgQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/power/main.c: In function 'device_resume':
>> drivers/base/power/main.c:1114:25: error: 'struct dev_pm_info' has no member named 'is_frozen'
     if (error && dev->power.is_frozen) {
                            ^


vim +1114 drivers/base/power/main.c

  1026	
  1027	/**
  1028	 * device_resume - Execute "resume" callbacks for given device.
  1029	 * @dev: Device to handle.
  1030	 * @state: PM transition of the system being carried out.
  1031	 * @async: If true, the device is being resumed asynchronously.
  1032	 */
  1033	static void device_resume(struct device *dev, pm_message_t state, bool async)
  1034	{
  1035		pm_callback_t callback = NULL;
  1036		const char *info = NULL;
  1037		int error = 0;
  1038		DECLARE_DPM_WATCHDOG_ON_STACK(wd);
  1039	
  1040		TRACE_DEVICE(dev);
  1041		TRACE_RESUME(0);
  1042	
  1043		if (dev->power.syscore)
  1044			goto Complete;
  1045	
  1046		if (!dev->power.is_suspended)
  1047			goto Complete;
  1048	
  1049		dev->power.is_suspended = false;
  1050	
  1051		if (dev->power.direct_complete) {
  1052			/*
  1053			 * Allow new children to be added under the device after this
  1054			 * point if it has no PM callbacks.
  1055			 */
  1056			if (dev->power.no_pm_callbacks)
  1057				dev->power.is_prepared = false;
  1058	
  1059			/* Match the pm_runtime_disable() in device_suspend(). */
  1060			pm_runtime_enable(dev);
  1061			goto Complete;
  1062		}
  1063	
  1064		if (!dpm_wait_for_superior(dev, async))
  1065			goto Complete;
  1066	
  1067		dpm_watchdog_set(&wd, dev);
  1068		device_lock(dev);
  1069	
  1070		/*
  1071		 * This is a fib.  But we'll allow new children to be added below
  1072		 * a resumed device, even if the device hasn't been completed yet.
  1073		 */
  1074		dev->power.is_prepared = false;
  1075	
  1076		if (dev->pm_domain) {
  1077			info = "power domain ";
  1078			callback = pm_op(&dev->pm_domain->ops, state);
  1079			goto Driver;
  1080		}
  1081	
  1082		if (dev->type && dev->type->pm) {
  1083			info = "type ";
  1084			callback = pm_op(dev->type->pm, state);
  1085			goto Driver;
  1086		}
  1087	
  1088		if (dev->class && dev->class->pm) {
  1089			info = "class ";
  1090			callback = pm_op(dev->class->pm, state);
  1091			goto Driver;
  1092		}
  1093	
  1094		if (dev->bus) {
  1095			if (dev->bus->pm) {
  1096				info = "bus ";
  1097				callback = pm_op(dev->bus->pm, state);
  1098			} else if (dev->bus->resume) {
  1099				info = "legacy bus ";
  1100				callback = dev->bus->resume;
  1101				goto End;
  1102			}
  1103		}
  1104	
  1105	 Driver:
  1106		if (!callback && dev->driver && dev->driver->pm) {
  1107			info = "driver ";
  1108			callback = pm_op(dev->driver->pm, state);
  1109		}
  1110	
  1111	 End:
  1112		error = dpm_run_callback(callback, dev, state, info);
  1113		/* device manages frozen state */
> 1114		if (error && dev->power.is_frozen) {
  1115			dev->power.is_suspended = true;
  1116			error = 0;
  1117		}
  1118	
  1119		device_unlock(dev);
  1120		dpm_watchdog_clear(&wd);
  1121	
  1122	 Complete:
  1123		complete_all(&dev->power.completion);
  1124	
  1125		TRACE_RESUME(error);
  1126	
  1127		if (error) {
  1128			WRITE_ONCE(async_error, error);
  1129			dpm_save_failed_dev(dev_name(dev));
  1130			pm_dev_err(dev, state, async ? " async" : "", error);
  1131		}
  1132	
  1133		dpm_async_resume_subordinate(dev, async_resume);
  1134	}
  1135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
