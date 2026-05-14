Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FFC3BF66E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788290; cv=none; b=NndiU51j3aR7AZt1AIM8TfJqnRn+PGyzz+uD3cG/4d4ADKyMjA30O7wLA8D8lbUcPXRd6gjZKZOF/jSWTq2yjaYBqWDoUhuewRW91zcARiCT8OBE4Ybz+ApCxV51LthdcxLY3db3RZdUFaBEvZ3AdZJ71nXoJsouYOXk9TBHPUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788290; c=relaxed/simple;
	bh=70BheNyJT8125WCTR3NpAzIYdFP4p9MJvVfyHXhl0c8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k2r15uHVHwuzfhJZUY2u29xfgo16sekL6858fgX6iOm/QTm9OUNNXhAaHbrld9nAnHV+ilyLxudNJ2ttpKKD6oLn/zkP31xNxiAJpd09x/iFd0XxX4BeK0W30Y8Y/EP99Ma2l4dTa3DIzl/favckV35NBB0zOJCcGxUMdjwk2aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zi9UxM77; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi9UxM77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778788289; x=1810324289;
  h=date:from:to:cc:subject:message-id;
  bh=70BheNyJT8125WCTR3NpAzIYdFP4p9MJvVfyHXhl0c8=;
  b=Zi9UxM778kdJ0Fn5q12+JS0onEf5IZ7SD6/OaXjqlB+xJbD+o6xBQckL
   gdAl/kPXEQ5mtH9HcdyUBITDZLjVQuo/06/t7tSo8p3vQHoz1QWYiwdh3
   bo0QkPCNt4VTHP2w1kN5C403daf/oTiXHjv5smb3Yu7lea6XO991EoaeL
   GDKYKUD50RPIXiAqAS/uqqn16zl9wGyVpLom9dxpDTGbYJJQPNC4JdoiB
   CceN7vgDK4rV8QLTH4MaS40qQw+GgAoNS3e8vHxbaJ65wOCOiThpo+q06
   JP+Lh3iwDmoeXQrvnbPqzaRv/pa66zMXW2J042ppi2ePJx2AyfQBKsc2D
   Q==;
X-CSE-ConnectionGUID: /FAMqLFYRKWC9J2JTqGdtw==
X-CSE-MsgGUID: mqoTvFCfTDawaGXnh6poyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78877760"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78877760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:51:27 -0700
X-CSE-ConnectionGUID: A/9yQ/bHTw6W5fWFoxCo2Q==
X-CSE-MsgGUID: 3dyi6w76TweMAGpUzXiddA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238740671"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 12:51:25 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNc5a-0000000072p-24ex;
	Thu, 14 May 2026 19:51:22 +0000
Date: Fri, 15 May 2026 03:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Kishon <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [phy:next 47/52] Warning:
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c:184 struct member
 'clkout_ctl_phy' not described in 'rockchip_usb2phy_cfg'
Message-ID: <202605150315.MyBNQOPB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   fd6cd05ceabdf67635a4cef5145f79d1217bf11b
commit: 2775541de0580ab1cd077dfef710e6316563d567 [47/52] phy: rockchip: inno-usb2: Add clkout_ctl_phy support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605150315.MyBNQOPB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150315.MyBNQOPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150315.MyBNQOPB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/phy/rockchip/phy-rockchip-inno-usb2.c:184 struct member 'clkout_ctl_phy' not described in 'rockchip_usb2phy_cfg'
>> Warning: drivers/phy/rockchip/phy-rockchip-inno-usb2.c:184 struct member 'clkout_ctl_phy' not described in 'rockchip_usb2phy_cfg'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
