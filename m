Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F692ED84A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 22:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774563386; cv=none; b=IaVlEc2Lp0RuAD/WKXANaLEameqgylV71SjHQRjqXMOa/fOwjDse+Q4eXrL7Scm7P/RkwLkvuoy9yuz113w5UlCtShxtByTeLc42EjAOxIrxtkSXtG23KTQskixUccjH5hgxnDPe1aEvbRL72RaQ9qofldtpzHc18pLwb4iF680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774563386; c=relaxed/simple;
	bh=rCTdyv3X3Z/XBSxLWlmUWobAqE6JAgKrBiR2OX+3Ub8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZyytHFsChUVLfVSTRW0rTOARXYTZXaYgLiy3a1MSkBRxCasShLfSrZinVkgsZ02a5AhMoKhDQff0ejNxr4yxkfuNc5d3dC+1H3k1dYKanaQ6/jZbA+D5WXxxhyrtlDtu+AoGPgE8hU37n+1lAHvyLWIRv3Q18xOlTHwCNaxvdfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANgmSQS0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANgmSQS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774563385; x=1806099385;
  h=date:from:to:cc:subject:message-id;
  bh=rCTdyv3X3Z/XBSxLWlmUWobAqE6JAgKrBiR2OX+3Ub8=;
  b=ANgmSQS0PIKmedUR94SyJAtfSe7Q79bgmc3koACp5Wb2PVL5LctGZ/+/
   nVPaTooxvCwgQiCJXLXt0O5B1SHDTOq4QfWG0wGdPkQElGImqleyprQUJ
   qq/lMtw8a5x2SXe8tN7S20K4mLyV9f+ztyuhzerI+OVUsBxG5FTv9jRij
   Ho7XuB6IiZbrOUiqM7arVJsWkzMH3J0b4ff3+/kGt8VefMEShFHpvgcKL
   KKBF/VHExTqpazWESjw+dwtNJ1fabjH0kemVNfiT9k4cfSx2VJUL0XRgg
   4o3l+Z0JIsdItY1A24qpr0clohk1MFYgPVKO8yvQ2rVsj6+t/IGQjq1Qz
   A==;
X-CSE-ConnectionGUID: FgXt54iJS/CbA5hBHPSRLA==
X-CSE-MsgGUID: a7lg2GXeR+Ksv64SQWNWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86713122"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="86713122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 15:16:22 -0700
X-CSE-ConnectionGUID: F4iKKXe7Sc+XU1iA6F8wZQ==
X-CSE-MsgGUID: 5HT/K1aLS3GpxB2B4a0lkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="248491657"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2026 15:16:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5szz-000000009Qp-0h4r;
	Thu, 26 Mar 2026 22:16:19 +0000
Date: Fri, 27 Mar 2026 06:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous
 prototype for '__android_set_connected'
Message-ID: <202603270617.qr9168hV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   028e591355fbe43d834e69213a013c2944080c1a
commit: c6f183ea8e2b26be3fd296bd096c4cc579e891c3 [1/1] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270617.qr9168hV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270617.qr9168hV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270617.qr9168hV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous prototype for '__android_set_connected' [-Wmissing-prototypes]
     231 | void __android_set_connected(struct android_uevent_opts *opts,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:245:6: warning: no previous prototype for '__android_set_configured' [-Wmissing-prototypes]
     245 | void __android_set_configured(struct android_uevent_opts *opts,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
