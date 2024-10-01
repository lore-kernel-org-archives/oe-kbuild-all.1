Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB491CF2A6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727823758; cv=none; b=bYLggNOJckQSlxrwdWMAKZ8DeXQDtWaSdEoqJQLv2j8MNpOeNy0llVw2MxpWWhNfWCzJlW6axqf9nN1eBtkzusya37Fnq9jYJntVd4NbIgB0RmsehU2p1vjUdIsrV8bRwTogFELrbCmpU9Q+YJkNrzKcU44lHcBZBWrjSHJp1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727823758; c=relaxed/simple;
	bh=ZdPtOk1F+VwI7S/8ChozkXNYLZRuv4oSBl8xA0vjF+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CBqDfzHK8LV6oRV2zYVIiLjmtI5D/3iVRTAcRA/aeAMobx3mdeYUYxtAGevPjiei4+Xk/gopsJ+Nz3gkKFeLvBDwCqi8/E7aYOOR07bRV0rHn8Dy7pIVEvOhx5D23KDBgns3Az/GtT7KZrU7TNVNhDHTaW60hFJAynI56Cs2Unc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJESOf0p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJESOf0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727823757; x=1759359757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdPtOk1F+VwI7S/8ChozkXNYLZRuv4oSBl8xA0vjF+M=;
  b=WJESOf0p0ZlwVNK9/vqHfUibEChD+9SYcZG6MWq8/PobdXpRGHtfmYbP
   71XnSGpC4wKneVSbpIqLXxtJKPLB/nsOihhy1bZzJzSfvvN0kHrwR0r16
   1RiGt15++oPvwuIwrdy1QFFdE8/KC0WqVPD9r+C1/ATukx8n924U8dgad
   r92G0pjGylT5ZZseelpLNPZnhWtByylgwj4ZFqUFSrHQRRwYuPhl6lSZd
   wMo+VC5Q/218eRjCFqkKCHnUu3+3uCtEMiQZX+KSESLWVZcv70U4KlSxk
   c4pZhECFXsCZxf/dnFEKjkwgigxx2fQ2X6VJdRxzUsVaIta0Jk7j+qjVp
   Q==;
X-CSE-ConnectionGUID: b6CcXcL8Q8WGOxVwmd7aLQ==
X-CSE-MsgGUID: DQeJirmXSNuv9OzVODouEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="52389034"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="52389034"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 16:02:11 -0700
X-CSE-ConnectionGUID: WDzxp3pfRmGEhi+L6tMChA==
X-CSE-MsgGUID: scZYhnSVRvSZ3jAOfPfd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="78238442"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2024 16:02:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svlsd-000RGH-2h;
	Tue, 01 Oct 2024 23:02:07 +0000
Date: Wed, 2 Oct 2024 07:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 73/1491] make[7]: *** No
 rule to make target 'drivers/gpu/drm/panel/panel-himax-hx83112a.o', needed
 by 'drivers/gpu/drm/panel/built-in.a'.
Message-ID: <202410020656.P9JAiVZt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cong,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 5231012766cc9828fd7af0e87d481f5e95599e26 [73/1491] BACKPORT: FROMGIT: drm/panel: himax-hx83102: Break out as separate driver
config: i386-buildonly-randconfig-003-20241002 (https://download.01.org/0day-ci/archive/20241002/202410020656.P9JAiVZt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020656.P9JAiVZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020656.P9JAiVZt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/gpu/drm/panel/panel-himax-hx83112a.o', needed by 'drivers/gpu/drm/panel/built-in.a'.
   make[7]: Target 'drivers/gpu/drm/panel/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
