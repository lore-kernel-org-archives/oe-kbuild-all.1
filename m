Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755913B290
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306862; cv=none; b=cAdMrWIq67moQbOEG8hxYeQs+NhSkncthEN8MTYrcr1YHpM1q7jNiQvvi+XaJyaVUIwy/iOEWqtsNOmobGGy8HyZnYx/9uXzuiNmaXo6JM4b2FSw8oG3mmr17TCSnbivRieLpEAEljh/yyw86doLEBBbcJTNo1bZ/sccx42nEhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306862; c=relaxed/simple;
	bh=SV6nIG17fgccoT4PFN7vLIxnAEhXAMzqVgyCDbL3hAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V59KNduzbxMLCEg6y/vF4/ZNygzV8+wdkT2C6C+KkQSYkkdKJPR6rL8VMzvrs10QVmTgK2s1WlfEDO9EWtnIUZJKrRggpQxMNF84AXPGXkfYX2BJenuwooH6fK4V7JBU6FwYJcVx1qX6oXwtzumxiH0xLxb5vzpED4iW9/KMZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHcGlTJE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHcGlTJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721306861; x=1752842861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SV6nIG17fgccoT4PFN7vLIxnAEhXAMzqVgyCDbL3hAM=;
  b=lHcGlTJEy3yqGJFG7WQYuqYLs6eAVx6fFBNv95kr2P5f34UEyBl2sZXB
   5fv4KfNjYylbba97p7bBnkU5e5O6LtLMY62yQl/aa2q+N6uyqIAbwgGC4
   DGqxJ5jZMgL2EIKCzkQrCur+AfCEF5oG2YDjstw2Jy7tdaWzX0NfFLV2K
   MOyrQXEt685ROgqFuqijFrPgO6bL4spkIH6etuAtd5pIbJ27cCZIGbtZY
   ve97QPwGbp7bmCR1BQFXZSPD+LESDJywqXYFDeq1YfYe9wzweKswr0j9V
   a0Whyk8QdhUo+HlT2ThRYZTGHyIuH3c1YhCXkEpFi6YQPqpJ+filiU13A
   A==;
X-CSE-ConnectionGUID: mHJ5ku6ySLaaEMnzUUmlYQ==
X-CSE-MsgGUID: ztCAdr3cS2euu/KFsyDJWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="21768317"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="21768317"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 05:47:40 -0700
X-CSE-ConnectionGUID: lO9RsAfdTW+2XEupua0I5g==
X-CSE-MsgGUID: aTAKC5PqRomFdelUBI5hcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="55277642"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jul 2024 05:47:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUQXo-000hG5-0z;
	Thu, 18 Jul 2024 12:47:36 +0000
Date: Thu, 18 Jul 2024 20:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Vibhore Vardhan <vibhore@ti.com>,
	Dhruva Gole <d-gole@ti.com>
Subject: [khilman-omap:lpm-v6.10/constraints 10/15]
 drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or
 struct member 'wkup_constraint' not described in 'ti_sci_pm_domain'
Message-ID: <202407182034.EZmulx6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git lpm-v6.10/constraints
head:   e2d1fd7e6367d7aa0db506b7d3794eb61553d29c
commit: 2bc8cceca35bdd49ed1a30a3df6345ba6085d291 [10/15] pmdomain: ti_sci: add wakeup constraint management
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240718/202407182034.EZmulx6t-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407182034.EZmulx6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407182034.EZmulx6t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or struct member 'lat_constraint' not described in 'ti_sci_pm_domain'
   drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or struct member 'constraint_sent' not described in 'ti_sci_pm_domain'
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:55: warning: Function parameter or struct member 'wkup_constraint' not described in 'ti_sci_pm_domain'


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
7a2a54738aa649 drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-17  52  	s32 lat_constraint;
7a2a54738aa649 drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-17  53  	bool constraint_sent;
2bc8cceca35bdd drivers/pmdomain/ti/ti_sci_pm_domains.c Kevin Hilman 2024-07-17  54  	bool wkup_constraint;
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04 @55  };
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  56  

:::::: The code at line 55 was first introduced by commit
:::::: 52835d59fc6cc7f3c3cfdb4a194ddc9ebd6c0c31 soc: ti: Add ti_sci_pm_domains driver

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Santosh Shilimkar <ssantosh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
