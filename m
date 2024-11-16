Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C04A1A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768634; cv=none; b=Wjk48ORf9XvRV1D+3wqMr7P1QdIqZhmCW3EIlcBY3K3/MMH6u1eRo4aJqbeOBQyx5utO9WEzCO9jS8QKHxvpUZBNradqrr7qNrOfs9OPE8bAINRdK6UhlN73W5qM15oBTm07Bu9mFis3E+EW7sBrU8nARPv4URj3yxbQjFdHRX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768634; c=relaxed/simple;
	bh=B2RZIyi2rQWJMgZTFYpqh+knSQB1K+bGaKtNXaW3gNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cK46DlNBs7pDGvYSTmtpX5KVoe2ufqZ8GE6Unn9nd/ufrr9H0A0UX00WYYCWQtDKhEsGjFT8GysPBshH+qoEO0WlWhcn6YmsD7wAVeSkaAv/NFvjbcc0F/Cosio/ZWQ4s9oxgod9uuLORsexElbtLKZnBL58VGZhJjBV3ZPYnEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcotALDR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcotALDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768632; x=1763304632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2RZIyi2rQWJMgZTFYpqh+knSQB1K+bGaKtNXaW3gNE=;
  b=IcotALDRMAt8oWDkQ4xIFsI1cB4+dvLYZQbvdOLdR0DbPk6LA56bNZeR
   ufJyrSIxEXwP6Zp3rE52NiCJei3AYCmxXhEc8jr+6l4kenhIWHxC4PJ9G
   itXy9klqIs6RtkKsOSHPsTNq3r3tsC7GY7T9u9gwZ/0DgFDjANjEH0bQW
   zYaCyVPBfVhEd+3csuIixnPNN8+SB0Tk+nsl/gecIaRi0cuU8ZZnDRSzg
   gv6yueklpxX1iUM7+G9NF4NlOiPKYyO23YFeLxGN7vAC56H0UpxjP/r4r
   3LG6UB3hxr7dt4p3w5Z3CxA8+ZlY740odHE04WqhpGigdulZ+GdAmUWGl
   g==;
X-CSE-ConnectionGUID: FR9zPxV4SHasaMaYAOnakg==
X-CSE-MsgGUID: cqIpO75xTZGKJTimp5yODg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43162610"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="43162610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:50:32 -0800
X-CSE-ConnectionGUID: 6scu94Y2RA+Y0aoC03Agkg==
X-CSE-MsgGUID: /fI6tVoWRSKwaSXGksPdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88817529"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 06:50:31 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK85-0000he-1U;
	Sat, 16 Nov 2024 14:50:29 +0000
Date: Sat, 16 Nov 2024 22:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 18/28] drivers/fwctl/cxl/cxl.c:47:14: error:
 assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202411161425.RRb8nmL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   350392d25327a67c7299583a05481dfe524c7257
commit: 84e1063d463c904ba70516b5ef125e3e4be2b090 [18/28] fwctl/cxl: Add support for get driver information
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241116/202411161425.RRb8nmL7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161425.RRb8nmL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411161425.RRb8nmL7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_info':
   drivers/fwctl/cxl/cxl.c:47:16: error: implicit declaration of function 'kzalloc'; did you mean 'key_alloc'? [-Wimplicit-function-declaration]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^~~~~~~
         |                key_alloc
>> drivers/fwctl/cxl/cxl.c:47:14: error: assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^


vim +47 drivers/fwctl/cxl/cxl.c

    40	
    41	static void *cxlctl_info(struct fwctl_uctx *uctx, size_t *length)
    42	{
    43		struct cxlctl_uctx *cxlctl_uctx =
    44			container_of(uctx, struct cxlctl_uctx, uctx);
    45		struct fwctl_info_cxl *info;
    46	
  > 47		info = kzalloc(sizeof(*info), GFP_KERNEL);
    48		if (!info)
    49			return ERR_PTR(-ENOMEM);
    50	
    51		info->nr_commands = cxlctl_uctx->nr_commands;
    52	
    53		return info;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
