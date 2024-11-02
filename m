Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB33149E17
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730535691; cv=none; b=W6G1n1rX6oq+yjeNLll137LjLeTvp3jKsLpUTdypVttX+oBt8qn0GbumF5Rsl64X3hQ0/T2eU1hqwOaoY9WiAmbjY0zx48XXwZJT8ZMugzAFxSf1/Hcu2dqNbZlJXKkWpd73UQ46ZL7HN3pg104J09C/aftqdHhrymfzfHzF9zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730535691; c=relaxed/simple;
	bh=KBGGG4ps2+XCQnuHwUVOJehaeCXZTEyLQywH+X53v9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFZjwSjGDQP64+6eljj662wpvK1vNQhh76YMfMEpswY4Or7tUiNDJCeS9VH7FnhaJXCQkMuw9x4Ax+sdOxjMGm4NzBI2xS6g7uDuDeMk+zuSDZOyVBfzW5hAB8wC6sTeZODHtihpuHAPTeOMbL4FHyEEcTdRKAc/x+EwDunhJPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSM9pz/d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSM9pz/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730535690; x=1762071690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KBGGG4ps2+XCQnuHwUVOJehaeCXZTEyLQywH+X53v9s=;
  b=NSM9pz/dlloQUixeR/lrpxLOTkfCWX1wYiWlvm8ezOR7mZN8QpnnSxT8
   JbMjflcnVKD9ORIcxf8+hK9FfVT7y4P6EtdgfxKIDBlPzPY55mTe6ThFy
   YxupNhUmPtooZAbEpKJd7W7JMQdZfxHios+22D/VP84TRHBMxSPFhY7Ej
   yUwQVg7bFkqyyTU2umSwQMcmdYAd6kNOpQOCq5JUd3r4vzWpNBIbsnEuS
   4CWaYFc6vpKB+ZG079vkgUCfuqyjkCcihMGS/9QdJ1opi2J5+xZKpFtu0
   VpG8SLE7ktoLnoXa5tAAUnL0nGMWokaad9GB8Vmx5Es10r+jQTqHkCqJm
   A==;
X-CSE-ConnectionGUID: Z24uoVbrSliasybBvh+KMQ==
X-CSE-MsgGUID: R0dfI+J6SvmyE9ZltsC8GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30410205"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="30410205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 01:21:26 -0700
X-CSE-ConnectionGUID: bRObYEN3RPWlbAwvv2kNoA==
X-CSE-MsgGUID: 9jofhIBUTYa2wxFZgwLMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83999715"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2024 01:21:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t79Np-000ibF-0h;
	Sat, 02 Nov 2024 08:21:21 +0000
Date: Sat, 2 Nov 2024 16:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Gur Stavi <gur.stavi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v01 1/1] net: hinic3: Add a driver for Huawei 3rd
 gen NIC
Message-ID: <202411021606.s7YoVfRW-lkp@intel.com>
References: <ebb0fefe47c29ffed5af21d6bd39d19c2bcddd9c.1730290527.git.gur.stavi@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebb0fefe47c29ffed5af21d6bd39d19c2bcddd9c.1730290527.git.gur.stavi@huawei.com>

Hi Gur,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on b8ee7a11c75436b85fa1641aa5f970de0f8a575c]

url:    https://github.com/intel-lab-lkp/linux/commits/Gur-Stavi/net-hinic3-Add-a-driver-for-Huawei-3rd-gen-NIC/20241030-201518
base:   b8ee7a11c75436b85fa1641aa5f970de0f8a575c
patch link:    https://lore.kernel.org/r/ebb0fefe47c29ffed5af21d6bd39d19c2bcddd9c.1730290527.git.gur.stavi%40huawei.com
patch subject: [RFC net-next v01 1/1] net: hinic3: Add a driver for Huawei 3rd gen NIC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241102/202411021606.s7YoVfRW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021606.s7YoVfRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021606.s7YoVfRW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/net/ethernet/huawei/hinic3/hinic3_wq.c:5:
   drivers/net/ethernet/huawei/hinic3/hinic3_wq.c: In function 'wq_init_wq_block':
>> drivers/net/ethernet/huawei/hinic3/hinic3_wq.c:34:37: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
      34 |                 dev_err(hwdev->dev, "wq num_pages exceed limit: %lu\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_wq.c:34:17: note: in expansion of macro 'dev_err'
      34 |                 dev_err(hwdev->dev, "wq num_pages exceed limit: %lu\n",
         |                 ^~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_wq.c:34:67: note: format string is defined here
      34 |                 dev_err(hwdev->dev, "wq num_pages exceed limit: %lu\n",
         |                                                                 ~~^
         |                                                                   |
         |                                                                   long unsigned int
         |                                                                 %u
--
   drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c: In function 'cmdq_set_db':
>> drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c:438:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     438 |         writeq(*((u64 *)&db), CMDQ_DB_ADDR(db_base, prod_idx));
         |         ^~~~~~
         |         writel
   In file included from include/linux/device.h:15,
                    from drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c:6:
   drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c: In function 'create_cmdq_wq':
>> drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c:965:45: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
     965 |                         dev_err(hwdev->dev, "Cmdq number of wq pages exceeds limit: %lu\n",
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c:965:25: note: in expansion of macro 'dev_err'
     965 |                         dev_err(hwdev->dev, "Cmdq number of wq pages exceeds limit: %lu\n",
         |                         ^~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c:965:87: note: format string is defined here
     965 |                         dev_err(hwdev->dev, "Cmdq number of wq pages exceeds limit: %lu\n",
         |                                                                                     ~~^
         |                                                                                       |
         |                                                                                       long unsigned int
         |                                                                                     %u
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h:17,
                    from drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c:14:
   drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h: In function 'hinic3_write_db':
>> drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h:102:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     102 |         writeq(*((u64 *)&db), DB_ADDR(queue, pi));
         |         ^~~~~~
         |         writel
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h:17,
                    from drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:16:
   drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h: In function 'hinic3_write_db':
>> drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h:102:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     102 |         writeq(*((u64 *)&db), DB_ADDR(queue, pi));
         |         ^~~~~~
         |         writel
   drivers/net/ethernet/huawei/hinic3/hinic3_rx.c: In function 'rq_associate_cqes':
>> drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:146:13: warning: variable 'cqe_len' set but not used [-Wunused-but-set-variable]
     146 |         int cqe_len;
         |             ^~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_rx.c: In function 'recv_one_pkt':
>> drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:493:32: warning: variable 'nic_dev' set but not used [-Wunused-but-set-variable]
     493 |         struct hinic3_nic_dev *nic_dev;
         |                                ^~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +438 drivers/net/ethernet/huawei/hinic3/hinic3_cmdq.c

   429	
   430	static void cmdq_set_db(struct hinic3_cmdq *cmdq,
   431				enum hinic3_cmdq_type cmdq_type, u16 prod_idx)
   432	{
   433		u8 __iomem *db_base = cmdq->hwdev->cmdqs->cmdqs_db_base;
   434		struct hinic3_cmdq_db db;
   435	
   436		cmdq_fill_db(&db, cmdq_type, prod_idx);
   437	
 > 438		writeq(*((u64 *)&db), CMDQ_DB_ADDR(db_base, prod_idx));
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
