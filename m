Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DEC315AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzD/6wzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700143785; x=1731679785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obXrc3QeoXL3bMpGcLRvF+VyVwoplaPFUBf6cbbtgVY=;
  b=MzD/6wzMu8O3IVufUk5VjDxlUsPK4Eze3uxm4uUPl+1len61vwnsBpeZ
   +R0Js2PkVJ8jyqL8fOATXUVR9qPG6wTNF7SHQQha4Vteot/7aqPzuT91q
   QkgpxxFxDd/rnisV3fWLgGY7uJm3GcxaFmhqNv/zrG8yB6qJgmuDGG8VM
   CYd5aIPtdaprvPXC2Kpa86IUJVqtcRyQnZVep25PbNzVSO/o+h48+Z+3w
   nTaFfYjbGMz4Hq1rQcMBFQEV+TStNowIskqIimuoo2WsR4vFUG4V3REUo
   owW38KYpOiOALpzfjRN+JLHCsaQ5Mt4BW23Fz3luHdPE6klJ7h7GmnWz8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4174794"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="4174794"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 06:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="835754603"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="835754603"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2023 06:09:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3d3b-0001jn-00;
	Thu, 16 Nov 2023 14:09:23 +0000
Date: Thu, 16 Nov 2023 22:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wang <frank.wang@rock-chips.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Sebastian Reichel <sre@kernel.org>,
	Zhang Yubing <yubing.zhang@rock-chips.com>
Subject: [sre-misc:rk3588 14/37] kismet: WARNING: unmet direct dependencies
 detected for USB_COMMON when selected by EXTCON_RTK_TYPE_C
Message-ID: <202311162120.877lxBDq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 5c34bb1e195fbbcaccf42a04f56e8d035d0864bb [14/37] phy: rockchip: add usbdp combo phy driver
config: arm64-kismet-CONFIG_USB_COMMON-CONFIG_EXTCON_RTK_TYPE_C-0-0 (https://download.01.org/0day-ci/archive/20231116/202311162120.877lxBDq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311162120.877lxBDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162120.877lxBDq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for USB_COMMON when selected by EXTCON_RTK_TYPE_C
   
   WARNING: unmet direct dependencies detected for TYPEC
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_ROCKCHIP_USBDP [=y] && ARCH_ROCKCHIP [=y] && OF [=y]
   
   WARNING: unmet direct dependencies detected for USB_COMMON
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - EXTCON_RTK_TYPE_C [=y] && EXTCON [=y] && (ARCH_REALTEK [=y] || COMPILE_TEST [=n]) && TYPEC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
