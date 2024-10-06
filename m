Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB0EC5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 05:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728191450; cv=none; b=PugfeUttPJ9e2vwfGDZDShwGDzfLxEkw+muR3Iay239Fd+EZpUUsi1AimIzkdFCJlMIjByHEmzOWgmgcKta1HUjf88C4cUwwqKhM7t/8/AVItG2Xo9iKLXpldUSYwisXr2n9UcRJH4YRMiNIz1uciYhSuYNaU+X/e+57rsENfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728191450; c=relaxed/simple;
	bh=AO9lZKu+3Qu4Oj/HJH7GGeMMuIrf9hIJHDjhn9+HqWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MyC5zffJVwz3yEdWPAH/OSSFt53Ye3cQ2wUPnYIGGlsCXv4O2ZJI7GniBnxJsmBwTelh8MGUDgzMHfZglalGk2RLDy4P1/ETJiq/Zv8bgQ3WityEtzq2tEmhwVuQDqNRnrZBlTV/HHIsOmtuo1Tx33N/NLIJo9PU1V1NV0pSxxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFTJ2hTv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFTJ2hTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728191448; x=1759727448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AO9lZKu+3Qu4Oj/HJH7GGeMMuIrf9hIJHDjhn9+HqWM=;
  b=FFTJ2hTvHqAgHd1u4SW74wr4Gtyg6t4y9XaCagpjK2ltMdZOtNHI7uUX
   08lSUxIpriOJQD2H+Kryz56xbh8l9URXY0CSPPRhdxJNN3JJB6r1anE7U
   83l/9tVkAGqPG+IxXpnLc91l4Wbqo3dWyPt28UyAD9VLX62ywdrw2rF9V
   tNQf9BfOAYUTtwgsYY6f5iUVw1YgpWY2s1vaV9lMxPvPlA4J1N0oACZzW
   CNbDgpmQkb0K1hJrlIEwwY4/R9IXDY3jLgAtmFp6wq7wv4/72mfAgQsN0
   ndzEsNFUWAtr1bbb+zw7mwRPaoUVzhHXuqZ/CMnwS2N6d7RD1XJMItKny
   A==;
X-CSE-ConnectionGUID: YkKSQPcPRcapL1Ix+kHN5Q==
X-CSE-MsgGUID: 5eK1aFZRTDmuOSWc+V+A2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="49896978"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="49896978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 22:10:48 -0700
X-CSE-ConnectionGUID: HN5GaikuRPaoaTgM1xDQSQ==
X-CSE-MsgGUID: 9OruTTKET2i1YJccgzUTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79534254"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Oct 2024 22:10:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxJXY-0003cc-1O;
	Sun, 06 Oct 2024 05:10:44 +0000
Date: Sun, 6 Oct 2024 13:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/usb/gadget/android_configfs_uevent.c:231:6: sparse: sparse: symbol
 '__android_set_connected' was not declared. Should it be static?
Message-ID: <202410061307.Vmc3t4GW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   d30885a29d6526b6f138843023920289f6480373
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [1/1] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: arm-randconfig-r112-20241006 (https://download.01.org/0day-ci/archive/20241006/202410061307.Vmc3t4GW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241006/202410061307.Vmc3t4GW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061307.Vmc3t4GW-lkp@intel.com/

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
