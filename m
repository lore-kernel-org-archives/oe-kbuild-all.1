Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A02F5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723276221; cv=none; b=DrGSs74TtpSYU/A5lF0BEFYPOjTNqVaeEJUFME4IW05O4ZDuSgMILYDbuaDlO4sq9PHGiN3yxui8vd9tDDv/NGTXX7SsFh6kf9ePNzUVIdp/FtBqXp2NmtuQgb5l2J5cpneZjDE+vG6ibA4RXHzssMrIFtQcHcNXVleekCAM/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723276221; c=relaxed/simple;
	bh=edocdULpgF5HJaRhgPnrgnef395hqd54hh9cPZP4CIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASaJB1OnImR1wwkZkA5HdhecjHkFbMcPYkRYN0WotGCT41GTmD97dSFYNUq4dPoj+2v0Q1XSC5nk8q26wIoup9f5awxFqFZ7vqFhAcTGdKet1JaaHonD4+1oF/PkLWKLf3InCVsSs4dOLbBvsU+uneidMU872ktDWHZXq09y1gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUl1217s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUl1217s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723276219; x=1754812219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=edocdULpgF5HJaRhgPnrgnef395hqd54hh9cPZP4CIU=;
  b=jUl1217s4TbeH78+4XuNOWQcSAaSlAPVNdDQMyo7G+QxBSK6ggbAkRC+
   g0kOGWpmYLc5ZWoN/HCFiS7R5Y6T4mCEDtHd5qnuenifipMFgL9yGQFAd
   pihpjRXoxDn5cifOYlynLTSQTPPOmzonFjgyp1cNgY9gaZNyK7NPZMsb6
   QYWsPRh4K9Uro6/wlQPrh7mNZDFodjTUjDNWTXUlTloxmBgeguVC9MA8M
   5yx7mH7JTx22rh8/6MHL/aoq2gC+jj3G1R8kujTYGTGnnbhPTVQMMSSHQ
   phXVx5iaoMrAfhJ4jX4F8H4sFpblBKYv6TzYjippbTCKP9QHjIhJPMXYq
   Q==;
X-CSE-ConnectionGUID: y6cnJi6WTB+vn71mAHOrlQ==
X-CSE-MsgGUID: rt8Ituj5ThSAkNycJEaNhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32863284"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="32863284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 00:50:18 -0700
X-CSE-ConnectionGUID: H04a1xhjTQ6lTgFaNLBAkg==
X-CSE-MsgGUID: hMX0mUcrSzykNrakvdPl5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="58345714"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Aug 2024 00:50:17 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scgre-0009jb-1A;
	Sat, 10 Aug 2024 07:50:14 +0000
Date: Sat, 10 Aug 2024 15:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-cip 8886/23496] ERROR: "thermal_add_hwmon_sysfs"
 [drivers/thermal/rcar_thermal.ko] undefined!
Message-ID: <202408101513.G1eaLeJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip
head:   1c0b45a5d75c157a5d6fddc34a587ff83d924b1f
commit: be9ff718fdec05a8ae4643b4a038afdb604ca28c [8886/23496] thermal: rcar-thermal: enable hwmon when thermal_zone_of_sensor_register is used
config: sparc64-randconfig-001-20240810 (https://download.01.org/0day-ci/archive/20240810/202408101513.G1eaLeJf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101513.G1eaLeJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101513.G1eaLeJf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ERROR: "mctrl_gpio_init" [drivers/tty/serial/sh-sci.ko] undefined!
   ERROR: "mctrl_gpio_disable_ms" [drivers/tty/serial/sh-sci.ko] undefined!
>> ERROR: "thermal_add_hwmon_sysfs" [drivers/thermal/rcar_thermal.ko] undefined!
>> ERROR: "thermal_remove_hwmon_sysfs" [drivers/thermal/rcar_thermal.ko] undefined!
   ERROR: "__multi3" [drivers/md/dm-mod.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
