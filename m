Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB81BF37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721301699; cv=none; b=BzXKGPjtf6bwzMJCjwTHJjGR7Rmu0Ro5KTucPZwkh7y6NvCHgCFRnKJdL8QdQ0aWZeXabhN04jxVcZqlXnfEXbsrD8Onr9U1AadIXKgA/6ajGvVmYFX7jtZWsB8Rmjymtpnficx9UbnsJcheOWntTSllzMGFIvWiJMyK1hoXp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721301699; c=relaxed/simple;
	bh=8JeZxw8gBvPmHFDM51++FYuLge4KZ5NILABlFoVCX8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoUE29oKfTeM0rFzAW6uDWVj7wledjr5piaYpDm3GGJFOjD72QZx0G4vKUqRxd5cANlQMa1VDEu6v3B6irxT29+qgkg9s/tLrdb+Nl8AfivKRAY4WEe9vxecOLoTOLa/3WtVY3rABMPdqdFjSpkjDjMMKboankxiRBWlRAAnC6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS9n0yvM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS9n0yvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721301698; x=1752837698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JeZxw8gBvPmHFDM51++FYuLge4KZ5NILABlFoVCX8o=;
  b=iS9n0yvMOP7ftYr9TWTd+v61uTjxVfDx2Q+mAf+bt2q4zfS9uyoMPZp3
   BTmQ3GPOfkff25MdWg2DDsgaTmGxFIGhDMboNg3/jL3g4TsPjccjwV5pp
   xnOnfTik9yhm6NoNTHuQ7VgttTBrnaV1jh71+dXhV3apHwF6zbWHv/a4d
   R/FOxAYkYwzYxxtrNU9cQaJRJG0DxBunShFvcs4wcrNCCvN1FuBoo7FI+
   c0qUAxUYrfGZAMKJvPMfDliuXYWXDo8grAo4PpaZWgnQAKXK4HGdPzV3A
   OibmxSo2B2DrZ6nu8iNQzJp76wE7hXOGsjmTEmQQfhMI/ptmAE3ZV9KYB
   w==;
X-CSE-ConnectionGUID: tJQUewleQg+o7UGK78vcEg==
X-CSE-MsgGUID: MX3OwMf7QNur8G+gZ71txQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30271359"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="30271359"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:21:37 -0700
X-CSE-ConnectionGUID: eT9kdyuNSYaZo2jfjKrMXw==
X-CSE-MsgGUID: /R2T+zAWTL6jrcy9OjNdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="73959812"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2024 04:21:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUPCX-000hBa-21;
	Thu, 18 Jul 2024 11:21:33 +0000
Date: Thu, 18 Jul 2024 19:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Vibhore Vardhan <vibhore@ti.com>,
	Dhruva Gole <d-gole@ti.com>
Subject: [khilman-omap:lpm-v6.10/constraints 9/15]
 drivers/pmdomain/ti/ti_sci_pm_domains.c:54: warning: Function parameter or
 struct member 'lat_constraint' not described in 'ti_sci_pm_domain'
Message-ID: <202407181930.oI3VBQFc-lkp@intel.com>
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
commit: 7a2a54738aa64954989f42a22bcc087bbc8b3c48 [9/15] pmdomain: ti_sci: add per-device latency constraint management
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240718/202407181930.oI3VBQFc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181930.oI3VBQFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181930.oI3VBQFc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/ti/ti_sci_pm_domains.c:54: warning: Function parameter or struct member 'lat_constraint' not described in 'ti_sci_pm_domain'
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:54: warning: Function parameter or struct member 'constraint_sent' not described in 'ti_sci_pm_domain'


vim +54 drivers/pmdomain/ti/ti_sci_pm_domains.c

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
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04 @54  };
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c      Dave Gerlach 2017-04-04  55  

:::::: The code at line 54 was first introduced by commit
:::::: 52835d59fc6cc7f3c3cfdb4a194ddc9ebd6c0c31 soc: ti: Add ti_sci_pm_domains driver

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Santosh Shilimkar <ssantosh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
