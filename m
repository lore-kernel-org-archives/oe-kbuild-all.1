Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A41865B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720366962; cv=none; b=eb9hB1VyxWbvcMP+XYSu69cNsylxKqdYVUIs7th76QqjKmfmZkxlyuE2gt2JMo1HBMAM67QoZVKBYeVV610RGkcQqjHVyRdpeM7F5W2l1jbD1e0+Kroe9GMlQb5NZRpwaRQfkOq4jPOeWBfh+OkhP1ELvU+0CJZNNf2IuxmKUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720366962; c=relaxed/simple;
	bh=TOjveuk8gNTJzypDoLoiB6jfK1c/IGHgQF4rLPNLmK4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t6qRePj15CAyj57AVCiW7IEP0Qb2fvqoaXZ/jEhDeonch5GLt47BiCQMoHy/+dSmc4JRejVORjhxPiCVYmrbr3R6XTpPhV7PQ2jxh0agfA+uW0/EwSYegBivR5YgSfWLfuinBU0ZJOV90G8paOxN1+nBuKOh3WD9dJ+DF9g3kcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/Vkd1/F; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/Vkd1/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720366960; x=1751902960;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TOjveuk8gNTJzypDoLoiB6jfK1c/IGHgQF4rLPNLmK4=;
  b=H/Vkd1/FyBAy5FqcbqGm8ym68H045b9rhRxbcOY8jq3ZMmD3YNLCgM4f
   CIMU7Lw61IvlbG0xKHNLN8SnzsdzE/ZNApiBV+FiFRD/sy0vBJJNKIHI2
   MJhaOV8qfRK05SI6OR3U6pV4mpX8ZJmFEk3a6wXNl4pisVoSPta6BI/5I
   WAbyDBYbN1CbJ6Ro71qMyIzEfu9KLvuaol9fNcgnXWhOqv92ve4ikfCSF
   AZTGbt9OlrT/We1Xa75Hh7MSNIpa9bOT+C9mpul9pmFShxQJpFrCRX+ij
   +Rlu+ml18I0mKSwC4acVIYIrddcho0kNy+edrS0z3wG5O9xmx8CjN6YXP
   w==;
X-CSE-ConnectionGUID: nclucQZ7QxOUooDVzyu5ew==
X-CSE-MsgGUID: 2yi92n4eTH6it3v0ou6MYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17446470"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17446470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 08:42:39 -0700
X-CSE-ConnectionGUID: oGaMaBRgTm+uJ+xqaQ0CHA==
X-CSE-MsgGUID: vFo61zv5QKO++M08CDpkbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47052011"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jul 2024 08:42:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQU27-000V3Z-2X;
	Sun, 07 Jul 2024 15:42:35 +0000
Date: Sun, 7 Jul 2024 23:42:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 31/42]
 drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or
 member 'wkup_constraint' not described in 'ti_sci_pm_domain'
Message-ID: <202407072320.12w1A07v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   fb89cd4d622ce6cc1b7b254ae21298570d437a08
commit: 5c852e970e3823547eaeb9c49e0a8ae4a9dd6679 [31/42] pmdomain: ti_sci: add wakeup constraint management
config: arm64-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240707/202407072320.12w1A07v-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072320.12w1A07v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407072320.12w1A07v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or member 'lat_constraint' not described in 'ti_sci_pm_domain'
   drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or member 'constraint_sent' not described in 'ti_sci_pm_domain'
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or member 'wkup_constraint' not described in 'ti_sci_pm_domain'


vim +55 drivers/pmdomain/ti/ti_sci_pm_domains.c

52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  35  
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  36  /**
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  37   * struct ti_sci_pm_domain: TI specific data needed for power domain
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  38   * @idx: index of the device that identifies it with the system
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  39   *	 control processor.
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  40   * @exclusive: Permissions for exclusive request or shared request of the
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  41   *	       device.
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  42   * @pd: generic_pm_domain for use with the genpd framework
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  43   * @node: link for the genpd list
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  44   * @parent: link to the parent TI SCI genpd provider
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  45   */
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  46  struct ti_sci_pm_domain {
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  47  	int idx;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  48  	u8 exclusive;
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  49  	struct generic_pm_domain pd;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  50  	struct list_head node;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c      Tero Kristo  2020-09-11  51  	struct ti_sci_genpd_provider *parent;
ca11e100862310 drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-03  52  	s32 lat_constraint;
ca11e100862310 drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-03  53  	bool constraint_sent;
5c852e970e3823 drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-03  54  	bool wkup_constraint;
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04 @55  };
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  56  

:::::: The code at line 55 was first introduced by commit
:::::: 52835d59fc6cc7f3c3cfdb4a194ddc9ebd6c0c31 soc: ti: Add ti_sci_pm_domains driver

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Santosh Shilimkar <ssantosh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
