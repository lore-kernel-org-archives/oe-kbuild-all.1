Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FE30171D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009606; cv=none; b=rSQatRGgl4IQAJaefOq3CzyGRxLcVttYj1SSLEBTAj9qfnxoRlNNQvdNiVAf3v+rt31oBljLrEfi4ilMo1VhVhiy8V0aJ65lYLPk2UHRV74eAJdiGAvZTF68upe41aSzoKIt+ruK6qz/Bpp86GXqpN49Hq+2IS0U1IizKlYt9MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009606; c=relaxed/simple;
	bh=kjw5yZqQxs6PkADEbvJouZrtmzxazcnpWqOvtik3ZEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ong4zZYOr14FuW7eLdr9+FDVev9MqLxLhPpbyyCInbG1TVnTGHD90X6CxaOSMH5mz3JNLQbFIW5T/cb151w9k2tomV5ezF34tzmJGT52HPbNK7+MSvFzjKs6Ur/bErAvML6efin7U427t67IXSFG54K0Ib20jx4ip0zgKHxYKMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huEK6Qfr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huEK6Qfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009605; x=1794545605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjw5yZqQxs6PkADEbvJouZrtmzxazcnpWqOvtik3ZEo=;
  b=huEK6Qfr9Pxd9V0sWecH3wXerMJy2WakTAhXhpyoHi/whlTYz0jRD6xH
   RJVAdZWdHhhW4SQKb0e/H8kcO81R9RtfUjJKOhZxqavh/EVx0XMHWGfb8
   7FCMDMsGALA7LQ02b2eWIfhAce3Ggv96oVE4Lp53raS7dqrtHXz1LYKf5
   zDYbpOrEhD3V2tZBjHeCyZGhmguodDaxx+cMalmFSqRVLry4+xbX8X3Hu
   Le/xbxloed/jV3FiblSHUDfs89SysEnMQuuBZvJpFgot75inKSCuiZHDQ
   Yz7ZJRqkhEZEC+gzuTt5AwoxYMBmA3kkdLJ9hfazcARhXVKl5RlUx9tQ6
   g==;
X-CSE-ConnectionGUID: pBO5Mz5dSsm32ahMYqUKUA==
X-CSE-MsgGUID: rKSMjqjeQWGAsGVyiuf5fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82480066"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="82480066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:23 -0800
X-CSE-ConnectionGUID: b9LZzwp2QRGaIBbYKrYeyw==
X-CSE-MsgGUID: ajnAcPSeSRiudxvsOI/1xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189415462"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004uG-1j;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3163/3163] drivers/ub/ubfi/irq.c:18:26: error:
 'struct dev_msi_info' has no member named 'domain'
Message-ID: <202511130841.AMzPRIEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbfb361fe93de1a562df2ace860f64c4067abfdc
commit: 028a4161a77d2e15d331a13599a6f06cdd7490b6 [3163/3163] ub:ubfi: register ubc usi domain
config: x86_64-buildonly-randconfig-004-20251113 (https://download.01.org/0day-ci/archive/20251113/202511130841.AMzPRIEd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130841.AMzPRIEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130841.AMzPRIEd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ub/ubfi/irq.c: In function 'ub_update_msi_domain':
>> drivers/ub/ubfi/irq.c:18:26: error: 'struct dev_msi_info' has no member named 'domain'
      18 |         domain = dev->msi.domain;
         |                          ^


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
