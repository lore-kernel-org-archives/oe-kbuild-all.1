Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A441166F1A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738052233; cv=none; b=jFuwTyZh3bBeP+DJ/Wbj9MRtYCZHMLy/ey5AiR7dUz8Oc11I3v3UllgYHYhqmW9KYXvlIKM525I2vUUZE3S43KBSASQ9P9HPpLL2V5fxm1vTIul0ehIS3RNWJX4k522aWlIwiuUY3WuuR+kghatiPYpa3Tah3oMAsSvl5FiJLdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738052233; c=relaxed/simple;
	bh=Bs45d9OKfL72+ciOGmQ/cFmf5Q4YMnRA3dcVY1YDq+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JsXc2xQr+5anar1f5rCilOmbVyzJ6pG7fejsNktG5LaUvAO4NuQGPr6WAjfgsQRZPjaSQiD2g3FWZhELWqDUki+OguLPpv2UwGEihA87lUe7lpTYR7bhDm333TdXuky/dJvdNKUJSBdZOEIT1lBSOTISTbGOQ4hrFg9V+H9bHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+xJpspP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+xJpspP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738052232; x=1769588232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bs45d9OKfL72+ciOGmQ/cFmf5Q4YMnRA3dcVY1YDq+M=;
  b=Q+xJpspPyWpEJIYj9zCitNnrsRX0gnpJPOQziq7TQsqJN8JK8JqlRcgC
   7W4fKwjdkgauJLi+7WFACyotcoJFqTc5eIvFSiXfyz9A0u5ca9P7kLGI1
   juTHvgWp2dNyWbHfe7hGsKNvBpUy09hmd37SIRqwg4QToi8vVqxOjfJk7
   9JojOPhmkypQGYUC84DgjotJgyRkjgwdlyPMFNwQCwQYz070/pVbPTK8G
   cxE5p47ew5MdIOyFNnxvp6ZyoweC2frddbNZ1FMB7jhOBpYDYj0TqMMY3
   ffXyTvfQY4Mb9wUptw+4NZDvWBcv9Yr6Ae82Mp8mkIo92ORB4VeCGEO+V
   Q==;
X-CSE-ConnectionGUID: jlDV86pZR9GNKresq9j7CQ==
X-CSE-MsgGUID: L7T7n+9RT/6hnA2AtH5Sfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63886976"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="63886976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 00:17:11 -0800
X-CSE-ConnectionGUID: nsojEz63RbWtc+Vn7mQ9lw==
X-CSE-MsgGUID: yEHOeynBQYOdx6yOkBxC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109597365"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 00:17:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcgmS-000hZr-04;
	Tue, 28 Jan 2025 08:17:08 +0000
Date: Tue, 28 Jan 2025 16:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Vadym Kochan <vadym.kochan@plvision.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/marvell/prestera/prestera_devlink.c:20:43:
 warning: '%d' directive output may be truncated writing between 1 and 5
 bytes into a region of size between 4 and 12
Message-ID: <202501281659.uLgq0KDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vadym,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
commit: 34dd1710f5a3c9a7dc78e1ff6de69a19d407db25 net: marvell: prestera: Add basic devlink support
date:   4 years, 4 months ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250128/202501281659.uLgq0KDb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281659.uLgq0KDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281659.uLgq0KDb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/marvell/prestera/prestera_devlink.c: In function 'prestera_dl_info_get':
>> drivers/net/ethernet/marvell/prestera/prestera_devlink.c:20:43: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 4 and 12 [-Wformat-truncation=]
      20 |         snprintf(buf, sizeof(buf), "%d.%d.%d",
         |                                           ^~
   drivers/net/ethernet/marvell/prestera/prestera_devlink.c:20:36: note: directive argument in the range [0, 65535]
      20 |         snprintf(buf, sizeof(buf), "%d.%d.%d",
         |                                    ^~~~~~~~~~
   drivers/net/ethernet/marvell/prestera/prestera_devlink.c:20:9: note: 'snprintf' output between 6 and 18 bytes into a destination of size 16
      20 |         snprintf(buf, sizeof(buf), "%d.%d.%d",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      21 |                  sw->dev->fw_rev.maj,
         |                  ~~~~~~~~~~~~~~~~~~~~
      22 |                  sw->dev->fw_rev.min,
         |                  ~~~~~~~~~~~~~~~~~~~~
      23 |                  sw->dev->fw_rev.sub);
         |                  ~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_PCI_POWERNV
   Depends on [n]: PCI [=y] && HOTPLUG_PCI [=n] && PPC_POWERNV [=y] && EEH [=y]
   Selected by [y]:
   - OCXL [=y] && PPC_POWERNV [=y] && PCI [=y] && EEH [=y]


vim +20 drivers/net/ethernet/marvell/prestera/prestera_devlink.c

     7	
     8	static int prestera_dl_info_get(struct devlink *dl,
     9					struct devlink_info_req *req,
    10					struct netlink_ext_ack *extack)
    11	{
    12		struct prestera_switch *sw = devlink_priv(dl);
    13		char buf[16];
    14		int err;
    15	
    16		err = devlink_info_driver_name_put(req, PRESTERA_DRV_NAME);
    17		if (err)
    18			return err;
    19	
  > 20		snprintf(buf, sizeof(buf), "%d.%d.%d",
    21			 sw->dev->fw_rev.maj,
    22			 sw->dev->fw_rev.min,
    23			 sw->dev->fw_rev.sub);
    24	
    25		return devlink_info_version_running_put(req,
    26						       DEVLINK_INFO_VERSION_GENERIC_FW,
    27						       buf);
    28	}
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
