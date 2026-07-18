Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0DB1DED63
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377828; cv=none; b=tIWGPEfN3H/RrFQyC52n97fZ8EvNQZWaI4s+ojbX6ba6KH8aySa50rhM2HPtmm0lb+V/b1mB6oceyz4+l97JzZpquxPy/tMI/mAyC0N5dP/KVTQ6uzRdlURIXoAwH+HXpmKxCspTs63tdpaVQdBoulvZgS1TeX/Iwl906K5fbi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377828; c=relaxed/simple;
	bh=UgOBfWyyTVms8iiv3aFygPeP+0SBogxKhHNs8l67BRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YDBYepUZe3mlwMWfm4f3KD0BWLkS1lDTnnH0JJB/ynImhBrwuUiM2ZEdqHvTCa8KKgPLJ6YivGWcbuM5FiuZkaM46E28o9FFsTsssTFwhLdMUHnOvRu/AiUISM50n3rj3tcgjky8nt8xDNITlj/CxdFmAm3VSEohLtr8cE6B2C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs6C4fvk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs6C4fvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784377826; x=1815913826;
  h=date:from:to:cc:subject:message-id;
  bh=UgOBfWyyTVms8iiv3aFygPeP+0SBogxKhHNs8l67BRM=;
  b=bs6C4fvkp3N3xD6E0xwq2ZP+o40ka5wrC2X28dkCBnn9hW8yHgy3Obdd
   eHBZUHU8iph/YED62WvAtit3GrLcXdozMIPVDE0O/mv7rhjuoftFs1o7S
   wUeat3c9asKFcHnb/fqrZv5WEHhZKVy7kEP6FpS7Mz36N/IYCs4KxavLY
   Ji4coaCnxDnN9qEOf88Ky3rV/Bz/Ug0prlZdK6yEVxG4rQvUuHHiyUHWe
   DvcNOyl04mC/TBGq2gLZdV5WKDm0wZ5QG+scYAzqLFkA4sqWwNoqPgSZU
   TVHrkTsPCCfy9yA0AlxOS9Zi2jbZqfL81FAenHeF6J5F/rSacqugxTJHg
   g==;
X-CSE-ConnectionGUID: bwCT0SDDTnu0MHvmkZmmLw==
X-CSE-MsgGUID: FrO+ZcAMThKMX/Uz8NIYkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96163280"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96163280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 05:30:26 -0700
X-CSE-ConnectionGUID: 5HIGbmP0T1ynQkWwupGYAw==
X-CSE-MsgGUID: EVn+O7cRSjuKVjH3ZDBA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="280297921"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2026 05:30:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl4BN-00000000UlY-1E02;
	Sat, 18 Jul 2026 12:30:18 +0000
Date: Sat, 18 Jul 2026 20:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/usb/gadget/android_configfs_uevent.c:231:6: sparse: sparse: symbol
 '__android_set_connected' was not declared. Should it be static?
Message-ID: <202607182024.HNcMTxuv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [0/1] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: x86_64-randconfig-122-20260718 (https://download.01.org/0day-ci/archive/20260718/202607182024.HNcMTxuv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607182024.HNcMTxuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607182024.HNcMTxuv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/android_configfs_uevent.c:231:6: sparse: sparse: symbol '__android_set_connected' was not declared. Should it be static?
>> drivers/usb/gadget/android_configfs_uevent.c:245:6: sparse: sparse: symbol '__android_set_configured' was not declared. Should it be static?

vim +/__android_set_connected +231 drivers/usb/gadget/android_configfs_uevent.c

   230	
 > 231	void __android_set_connected(struct android_uevent_opts *opts,
   232			bool connected)
   233	{
   234		unsigned long flags;
   235	
   236		spin_lock_irqsave(&opts_lock, flags);
   237		// Don't send the uevent if connected state is not changed
   238		if (opts->connected != connected) {
   239			opts->connected = connected;
   240			schedule_work(&opts->work);
   241		}
   242		spin_unlock_irqrestore(&opts_lock, flags);
   243	}
   244	
 > 245	void __android_set_configured(struct android_uevent_opts *opts,
   246			bool configured)
   247	{
   248		unsigned long flags;
   249	
   250		spin_lock_irqsave(&opts_lock, flags);
   251		// Don't send the uevent if configure state is not changed
   252		if (opts->configured != configured) {
   253			opts->configured = configured;
   254			schedule_work(&opts->work);
   255		}
   256		spin_unlock_irqrestore(&opts_lock, flags);
   257	}
   258	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
