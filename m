Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2718D15BB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 04:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711858699; cv=none; b=rCQHDO64J4pfIF/d+r+mKtDjO3wiNnlAcoH8VFPTe2qMMlmB8eljMJ7s7WzxpuVqYRw50xujmglMmE/o7Ha16LDJaEYoUIl53IsLFZl45dPb5hXwuYXP8Kw3ykL7EZ+YfTguxy/0oeyYkp9lLh69zfgRU5UnupfVTU1B46xpg0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711858699; c=relaxed/simple;
	bh=yZDrmQOB6STL7la15YxThKzPYkq0xrVEvKdJZojqt9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HFmYkZo+bfHWVegGj1Om3YiCh7+Byfm1kf9oanZEdgQsquq9bn7hZN69xc9NqKRCGhKxSMIaUA1FQxj/zVVFqFt3oOWFWmqbA+WBg8uQctWS8jbQEDHt0G+uxeA/juCDyFWHB996OQM10H1GM69TedSfh1eIWpMFRtSP7ua33ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lW6uPPue; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lW6uPPue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711858697; x=1743394697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZDrmQOB6STL7la15YxThKzPYkq0xrVEvKdJZojqt9s=;
  b=lW6uPPueV59SwMPH4sHguxNXzAbVccC5gNcWRKhkCMYri+DE5V9n4nr0
   ZtTNB+P7pM8hHZ2KZ6ne3007k5efr+jCss2KqJcyjYCS+I46Rj6pqN3Jd
   zFnWRjf4QiimGxLYmygzg3ycYyhTsctKRxJ57xYUUwfbBLLuDD1XzuL6f
   SvUyHuazvnlyExOUDyCHi6itzUC+9W6NeIHt7NNk0DpXxdt3Q+Y/Dbl6A
   Y0Tsn8UG1HgYo9yKx0fXBLZHPppb5q+AyQZoFkQu7PU3N9t5JjXLtbt61
   4y8ndoS91grrcUQfCDPj0QS28JLQbEbGzOZ+l7Y2OrPR2joza6imGjbZn
   w==;
X-CSE-ConnectionGUID: OObhIGTITe6B0Xl6tZWwYw==
X-CSE-MsgGUID: SqbWo/W1Tam2y7gQytC8WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="29483431"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="29483431"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 21:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17339084"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2024 21:18:15 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqme4-0000n4-2m;
	Sun, 31 Mar 2024 04:18:12 +0000
Date: Sun, 31 Mar 2024 12:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3968/7193]
 drivers/net/ethernet/huawei/hinic/hinic_lld.c:2138:24: error:
 'disable_vf_load' undeclared
Message-ID: <202403311206.m7mb4WNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   99b7d010bc99397e22dbc589f60511582651d2a7
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [3968/7193] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-randconfig-072-20240331 (https://download.01.org/0day-ci/archive/20240331/202403311206.m7mb4WNC-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311206.m7mb4WNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311206.m7mb4WNC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_lld.c:36:
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:447:6: warning: no previous prototype for 'hinic_init_syncfw_timer' [-Wmissing-prototypes]
     447 | void hinic_init_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:462:6: warning: no previous prototype for 'hinic_destroy_syncfw_timer' [-Wmissing-prototypes]
     462 | void hinic_destroy_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:550:5: warning: no previous prototype for 'hinic_version_cmp' [-Wmissing-prototypes]
     550 | int hinic_version_cmp(char *ver1, char *ver2)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1139:7: warning: no previous prototype for 'hinic_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
    1139 | void *hinic_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1296:6: warning: no previous prototype for 'hinic_get_card_func_info_by_card_name' [-Wmissing-prototypes]
    1296 | void hinic_get_card_func_info_by_card_name(const char *chip_name,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1896:6: warning: no previous prototype for 'hinic_event_process' [-Wmissing-prototypes]
    1896 | void hinic_event_process(void *adapter, struct hinic_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c: In function 'hinic_get_vf_load_state':
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:2138:24: error: 'disable_vf_load' undeclared (first use in this function)
    2138 |                 return disable_vf_load;
         |                        ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2138:24: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/huawei/hinic/hinic_lld.c: In function 'hinic_ovs_set_vf_load_state':
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2198:46: error: 'disable_vf_load' undeclared (first use in this function)
    2198 |         hinic_set_vf_load_state(pci_adapter, disable_vf_load);
         |                                              ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2352:6: warning: no previous prototype for 'cfg_order_reg' [-Wmissing-prototypes]
    2352 | void cfg_order_reg(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c: In function 'hinic_func_init':
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2419:32: error: 'disable_vf_load' undeclared (first use in this function)
    2419 |                         true : disable_vf_load;
         |                                ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2127:13: warning: 'hinic_get_vf_load_state' defined but not used [-Wunused-function]
    2127 | static bool hinic_get_vf_load_state(struct pci_dev *pdev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/disable_vf_load +2138 drivers/net/ethernet/huawei/hinic/hinic_lld.c

  2126	
  2127	static bool hinic_get_vf_load_state(struct pci_dev *pdev)
  2128	{
  2129		unsigned char parent_bus_number;
  2130		struct card_node *chip_node;
  2131		u8 id;
  2132	
  2133		if (!pdev->is_virtfn)
  2134			return false;
  2135	
  2136		/* vf used in vm */
  2137		if (pci_is_root_bus(pdev->bus))
> 2138			return disable_vf_load;
  2139	
  2140		parent_bus_number = pdev->bus->parent->number;
  2141	
  2142		lld_dev_hold();
  2143		list_for_each_entry(chip_node, &g_hinic_chip_list, node) {
  2144			if (chip_node->dp_bus_num == parent_bus_number) {
  2145				for (id = 0; id < HINIC_MAX_PF_NUM; id++) {
  2146					if (chip_node->pf_bus_num[id] ==
  2147					    pdev->bus->number) {
  2148						lld_dev_put();
  2149						return chip_node->disable_vf_load[id];
  2150					}
  2151				}
  2152			}
  2153		}
  2154		lld_dev_put();
  2155	
  2156		return disable_vf_load;
  2157	}
  2158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
