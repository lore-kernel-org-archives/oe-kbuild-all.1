Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F92741AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762842777; cv=none; b=CnWqNjdjEvZ0w/w0Uwx4FEyzc29C+bAfYf//J5DTuk/BxcbWg6tmkxDHpQWB7rdJv5H9ahgKs/eikAZntDWSWcQ+p8n5D5azqdBQR+JM2bF1ShKfZe5G6ui1vTMvy2Q/yHl1NkmqCD9zk6I/MYFcUWlsHJu5a0g0x3yL7hCtfUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762842777; c=relaxed/simple;
	bh=56ix2SKBOEA+H8mdFDt19V+JlCXK1l7Ec+VjbUBBekc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHVdpJOjrMUxALc5BRCazgD8RYxW6utY65Lg8cyC5qEBWpR/ONJSeiOirT938wNs4MHaCp8u1YNWGGTeHsRV0LSqYS/6byGRGzgV1/S2W7LOgOHmSRfuU4lyeOvl0CZwRjpBZMDDbqtGS7oGOe+2ay08okOk9l5W+kmZrafWXII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijdazM7m; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijdazM7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762842776; x=1794378776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56ix2SKBOEA+H8mdFDt19V+JlCXK1l7Ec+VjbUBBekc=;
  b=ijdazM7mZdJpopeWppoS1o0gYIXRPUoViih2u3pgqpbzS5hvxIJj9fE7
   QqbNGlkrjuCa0A9HVn5hppFebTPpHZHq1ZjgTkLUbNqeKiTmYYeakLvpe
   D2ymhHbEG90nqgGEbP37NloLPxOuX4S71Sq84n7+crC0GKnHPafK+b9Hr
   4f8CU3362TCvJ2u4c/7fU7vE121f9eKs0c5Z+6svvAj0DGv7e0bZn0Y1T
   9MIlbD722WJVJhGH2zpKcjtHlKTuZ32VJUnNnz0sEA7LUx1C0u7/PoxF5
   eG/KTzn5Sj757o45s81B06VGHuYjCMzlqhKYsqdMfrryMv5dJgJtNdO2z
   g==;
X-CSE-ConnectionGUID: zGHh2xD3QR2+V6Ic3AvKBg==
X-CSE-MsgGUID: fjC+p7W8QliBTnAdmPb87A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64816950"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64816950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 22:32:55 -0800
X-CSE-ConnectionGUID: GyuOgP5QR3murIda1x89Lg==
X-CSE-MsgGUID: FQVkXb04RjiRktHqeeadWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="188520250"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2025 22:32:53 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIhvv-0002rB-0Y;
	Tue, 11 Nov 2025 06:32:51 +0000
Date: Tue, 11 Nov 2025 14:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3129/3129] drivers/ub/ubfi/irq.c:18:20: error: no
 member named 'domain' in 'struct dev_msi_info'
Message-ID: <202511111409.5wQwlEc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be4908c3dd5d15795275b738fbadd71ff8f0fbaa
commit: 028a4161a77d2e15d331a13599a6f06cdd7490b6 [3129/3129] ub:ubfi: register ubc usi domain
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251111/202511111409.5wQwlEc6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111409.5wQwlEc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111409.5wQwlEc6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ub/ubfi/irq.c:18:20: error: no member named 'domain' in 'struct dev_msi_info'
      18 |         domain = dev->msi.domain;
         |                  ~~~~~~~~ ^
   1 error generated.


vim +18 drivers/ub/ubfi/irq.c

    11	
    12	int ub_update_msi_domain(struct device *dev,
    13				 enum irq_domain_bus_token bus_token)
    14	{
    15		struct fwnode_handle *fwnode;
    16		struct irq_domain *domain;
    17	
  > 18		domain = dev->msi.domain;
    19		if (!domain) {
    20			dev_err(dev, "find base irq domain failed!\n");
    21			return -ENODEV;
    22		}
    23	
    24		fwnode = domain->fwnode;
    25		if (!fwnode) {
    26			dev_err(dev, "find fwnode failed!\n");
    27			return -ENODEV;
    28		}
    29	
    30		domain = irq_find_matching_fwnode(fwnode, bus_token);
    31		if (!domain) {
    32			dev_err(dev, "find irq domain failed!\n");
    33			return -ENODEV;
    34		}
    35	
    36		/* Update msi domain with new bus_token */
    37		dev_set_msi_domain(dev, domain);
    38	
    39		return 0;
    40	}
    41	EXPORT_SYMBOL_GPL(ub_update_msi_domain);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
