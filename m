Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D103A762DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726270655; cv=none; b=mqiLF2jrp5tah7NEVC5aRW0yt9Mb2ypkNfGeH51iCwle2SmuVx3nqjykozb9h0CA/CK94BHoWAHcY2Q54P66cu9eARFGRjUZYaJBOOVw11aTGNCAey2pOsuYKF6TrLXQLyc0JgJhAb6s4jOVWSZOIl01o6HaYh1nQzWrcKbYUC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726270655; c=relaxed/simple;
	bh=/Xl1D93Cwz/zIWCCFU1WLcAkTU0WsI0YCN/ZSreaLpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3juZY+xn3PE1DaFv4yHBFf4V/y/stJQe28Zhrd14EFS5+iZI88S9HsVERuZhdInPTnQ+fqMvHbK9yA4lcKJHBMf3Mx/A+P77PogA0syijcPrnfQwPcP+PLy0Ioahi2TE5Soi4QhFj3CL5BIalyZU5FvSFp4ZRyxon/rgVJuQsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIvU2r+H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIvU2r+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726270653; x=1757806653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Xl1D93Cwz/zIWCCFU1WLcAkTU0WsI0YCN/ZSreaLpg=;
  b=jIvU2r+HLBnJjNwUe09cLB9w79+8uSsoBBfaOwOGxTskPK89s/iIDVu3
   yVzkucqwOyiio/05dapY5SCNsHxRzZD1qLOjEEoZpogtGMo5aONHJ9l/e
   RiJ47Ofm307a0hubP0j29mV7wiWJnQ29euMYPa53TlZ9mwxvRCKXfZLxz
   /sDXAo2q7ZjIzgMAP/+IEG/wMvhEcU8CveZ9OyQ56KmvMwZVGACcL2QwO
   ojDIpe3qq/Ok0Y+62faSd+6ZXq/WGrGg5oKtH/ejm/cItey4/WshEugPR
   m+UPujxutu30XMHkollDgZZHdP3loUEG59DhSoCk6RTx8BqS7flGRswAg
   g==;
X-CSE-ConnectionGUID: Jsydr4w8RfuZoH/+eXYyAw==
X-CSE-MsgGUID: eOPYCMdtTQ23rskXHtbkHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36566355"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="36566355"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 16:37:32 -0700
X-CSE-ConnectionGUID: inzYM+/AToSojuLFwjIEIQ==
X-CSE-MsgGUID: M50lzPBzSs6rNBx3LyxLcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68474875"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Sep 2024 16:37:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spFqz-00078m-11;
	Fri, 13 Sep 2024 23:37:29 +0000
Date: Sat, 14 Sep 2024 07:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 10095/13996]
 drivers/usb/gadget/android_configfs_uevent.c:231:6: sparse: sparse: symbol
 '__android_set_connected' was not declared. Should it be static?
Message-ID: <202409140757.LPduwcNE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   32a68c6fb36bf09c7e9fb64af347e48d54a2a3ed
commit: c6f183ea8e2b26be3fd296bd096c4cc579e891c3 [10095/13996] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: arm-randconfig-r112-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140757.LPduwcNE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409140757.LPduwcNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140757.LPduwcNE-lkp@intel.com/

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
