Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECFC207DFD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 23:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736550168; cv=none; b=goSWf9XW4iq1+NUAvU4EyRguGycp895WM65zrWosRqaEDiqUNlxOxcjDTDf0CLSOU9WPjGksCTi76ZwUlDtvl2EMGQB2+q3Vx/g6VDzDu6Ox9tM/XvKeVj3kljyYFSPddlEBqEBbyK+iDpLsR7rC3eYIT5OaQbxwclKcGb55poo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736550168; c=relaxed/simple;
	bh=jluxW86VjYkeqYhN1I6hqjODD7cVPRMSy6IzHGTR2Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4gGe6+2NfxNo7kSrVhhnBHnB/N+hhYP3a057untJU5iWIxoAuljQW9PN2FJZs6oTx254U/7wEh4pB2jfE10/gPFd1AlQgwjbX+xCJEoeLYFtkg/SxZmUXMm14U9HKFgMJHxB6EiMcaob1AT8BHW/t0OvpVJ2m/+PcvM390YGU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nK3Rdugw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nK3Rdugw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736550166; x=1768086166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jluxW86VjYkeqYhN1I6hqjODD7cVPRMSy6IzHGTR2Lk=;
  b=nK3RdugwIRreze3ZuA8qtL3l+UK8w+tLFwkjQRqROJW661GIr4U9t5ZX
   vaCW7JI9NcqbNIvZWrtRh4PXF64yGi9Km/aiqRjkSzsdUXI3Wg89b/+iJ
   MthBa0PE4jBlUPd4isgzscmrokdAPUNjElskn7X42JlORFe00v/aHG5ZX
   52b1yKjuZ4tzBdKlC2uJV3BW7ZL1MV7U0UjZj1cVsQKxgd8Kw5B+LUHJA
   tJK7N8WahUemOJjy0ncD+mrMk0SNru1M+oIp17wkc4lCcpdhNKcsa13q/
   /4xk9TbuLdXN/PFWplB18eXYlxjYTbfpJ8AJm273Xbm+Sm8km03vTv2ae
   g==;
X-CSE-ConnectionGUID: cYVtrDv9SEWallPXqS8kdQ==
X-CSE-MsgGUID: fSx0wsynQ6GJHjZaTG7iiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="39670273"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="39670273"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 15:02:46 -0800
X-CSE-ConnectionGUID: Hzpsj8QEQ9iXfyeXx/y4eg==
X-CSE-MsgGUID: JfbvvqAaTq2/s56rCO1OOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="103802756"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 15:02:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWO1a-000Jrl-0k;
	Fri, 10 Jan 2025 23:02:42 +0000
Date: Sat, 11 Jan 2025 07:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vadym Kochan <vadym.kochan@plvision.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/marvell/prestera/prestera_devlink.c:20:43:
 warning: '%d' directive output may be truncated writing between 1 and 5
 bytes into a region of size between 4 and 12
Message-ID: <202501110646.aGxZ97Ug-lkp@intel.com>
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
head:   e0daef7de1acecdb64c1fa31abc06529abb98710
commit: 34dd1710f5a3c9a7dc78e1ff6de69a19d407db25 net: marvell: prestera: Add basic devlink support
date:   4 years, 4 months ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250111/202501110646.aGxZ97Ug-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110646.aGxZ97Ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110646.aGxZ97Ug-lkp@intel.com/

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
