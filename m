Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC4CA59
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 05:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+xaTq0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700113818; x=1731649818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GMBkzYy5NEN+evKHpyzDunxaRlQoDiQitttcECF14c8=;
  b=c+xaTq0ik5//LZGzyLVDQlS8BKC3A2M2pB1/prPfUdslojle6jHhYRqU
   hS4OIPPgGpyb/qjjVxYWzRGdb9TyjtnP09M4X8oB4i5SiQ/cgyO50J88V
   pthCXnNGsQlgQIb99c60DJd3Ppl/98wNMO7oikemauLLXMNTaS0V51DUY
   2qe+LPL/IDMXM03KWXT8I3jJty+aC2JcXuAGoxjTLyV32SjyGO4w/qOTF
   mzEh9lP5ZMhI7+J1ug37/+vW2RQznQlzDQENRoTArpGekpeQnCckRIVMA
   JnyBBS4aOiI9CvgshSGUtJ3RkbBd5EsJZ928adn5JylrYnVV41OfrQDEN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389878216"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="389878216"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 21:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="909009541"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="909009541"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 21:50:15 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3VGU-0001Lq-1g;
	Thu, 16 Nov 2023 05:50:12 +0000
Date: Thu, 16 Nov 2023 13:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wang <frank.wang@rock-chips.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Sebastian Reichel <sre@kernel.org>,
	Zhang Yubing <yubing.zhang@rock-chips.com>
Subject: [sre-misc:rk3588 14/37] kismet: WARNING: unmet direct dependencies
 detected for TYPEC when selected by PHY_ROCKCHIP_USBDP
Message-ID: <202311161328.weFCZORO-lkp@intel.com>
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
config: arm64-kismet-CONFIG_TYPEC-CONFIG_PHY_ROCKCHIP_USBDP-0-0 (https://download.01.org/0day-ci/archive/20231116/202311161328.weFCZORO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161328.weFCZORO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161328.weFCZORO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TYPEC when selected by PHY_ROCKCHIP_USBDP
   
   WARNING: unmet direct dependencies detected for TYPEC
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_ROCKCHIP_USBDP [=y] && ARCH_ROCKCHIP [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
