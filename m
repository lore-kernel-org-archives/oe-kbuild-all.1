Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C1800
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727555796; cv=none; b=Yaxy95VLw8O1594Lv6bxQLJivC8CsFRJ8Z7DIEUaZqzMJreZW1uGXb8ELVK9OVBaSySwaeDhgM38MhLv4dL9k4DVV2soAGApF9uwJipPFRZtuEFzSGycJwBbuj2zS9w8xS3juXypimZE3PX00la1G1EsjdJFHQuIQ8vnIUY4WeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727555796; c=relaxed/simple;
	bh=6ysN0Bfv314bmgUNzCZMmuGnsB9M/YGaxjuWVcGTvdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uxldx//elTXYr7FUm1N4XzY4PjpDPkTEE2C0YsryTxXgEmEmiZ8N4E2wGb1NkD1ogCsRx5+4FvgkQ5aBfpJCpLXK1pbOWUKTQsvHEERmjVDY4Ffu1IwV9+gl1BgoR+FqYDGsfVNYWMBVsHuEaYMeGhQexvXhGjpzBEziDnO8nS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayoPn0A+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayoPn0A+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727555794; x=1759091794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ysN0Bfv314bmgUNzCZMmuGnsB9M/YGaxjuWVcGTvdA=;
  b=ayoPn0A+6yiwG4k/dXZx+V6BLlNmbFCE/xZj6YEw+hF05Dexplh3YpsN
   ZdhNMnKmH1/mqzRZEt2rNFASv7l/Tk0RU/Lwka7D83Ml57WO+UEzldMvF
   NVN2BZWJ1IYFYAbU6JhO05OKyT0Go48QCpKkFp5xKX8p/fEe467VcvFzu
   3+Ij+MuImdfznfk3iFIlVLnv/Ie+14DdZHUbrqWQJVK7mrN/5lpcezc50
   ebY5ze/j0zK+VEs0T/6mfqe7zR9OhN6ZaLZVUvwqkfh2aYVtv0Okmg/+M
   EtoFqP35Fj9qL7NuLcbptWw6H5WF/IrsH3YUBZQcFP4ZZe32WZoWLhJwr
   g==;
X-CSE-ConnectionGUID: admqJs/GQaOiGC2u7v5L8g==
X-CSE-MsgGUID: fzV+5WpBTNm4uWp8mTCVow==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26853056"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26853056"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 13:36:33 -0700
X-CSE-ConnectionGUID: Yi3AFgGHRjynBkx6daY5Hg==
X-CSE-MsgGUID: BHQKRg5oT1i1LXWt3nb2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72449121"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 13:36:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sueB3-000Nap-2m;
	Sat, 28 Sep 2024 20:36:29 +0000
Date: Sun, 29 Sep 2024 04:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21485/30000]
 drivers/ub/urma/ubcore/ubcore_device.c:344:6: warning: no previous prototype
 for 'ubcore_destroy_upi_list'
Message-ID: <202409290428.ZYNCVbJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 84e122368ec3a37e074c9657bc09422b62f6ccd0 [21485/30000] ub: add new feature for urma
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290428.ZYNCVbJr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290428.ZYNCVbJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290428.ZYNCVbJr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_device.c:344:6: warning: no previous prototype for 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     344 | void ubcore_destroy_upi_list(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c: In function 'ubcore_uvs_cmd_channel_init':
>> drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:47:15: warning: 'strncpy' output truncated before terminating nul copying 10 bytes from a string of the same length [-Wstringop-truncation]
      47 |         (void)strncpy(arg.out.kernel_out, "Hello uvs!", strlen("Hello uvs!"));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_netdev.c:49:5: warning: no previous prototype for 'ubcore_check_port_state' [-Wmissing-prototypes]
      49 | int ubcore_check_port_state(struct ubcore_device *dev, uint8_t port_idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:73:5: warning: no previous prototype for 'ubcore_find_port_netdev' [-Wmissing-prototypes]
      73 | int ubcore_find_port_netdev(struct ubcore_device *dev, struct net_device *ndev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:90:5: warning: no previous prototype for 'ubcore_find_port_with_dev_name' [-Wmissing-prototypes]
      90 | int ubcore_find_port_with_dev_name(struct ubcore_device *dev, char *dev_name)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:113:5: warning: no previous prototype for 'ubcore_set_port_netdev' [-Wmissing-prototypes]
     113 | int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:149:6: warning: no previous prototype for 'ubcore_put_port_netdev' [-Wmissing-prototypes]
     149 | void ubcore_put_port_netdev(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:169:10: warning: no previous prototype for 'ubcore_sip_idx_alloc' [-Wmissing-prototypes]
     169 | uint32_t ubcore_sip_idx_alloc(uint32_t idx)
         |          ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:197:5: warning: no previous prototype for 'ubcore_sip_idx_free' [-Wmissing-prototypes]
     197 | int ubcore_sip_idx_free(uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:210:6: warning: no previous prototype for 'ubcore_sip_table_init' [-Wmissing-prototypes]
     210 | void ubcore_sip_table_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:216:6: warning: no previous prototype for 'ubcore_sip_table_uninit' [-Wmissing-prototypes]
     216 | void ubcore_sip_table_uninit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:230:5: warning: no previous prototype for 'ubcore_add_sip_entry' [-Wmissing-prototypes]
     230 | int ubcore_add_sip_entry(const struct ubcore_sip_info *sip, uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:250:5: warning: no previous prototype for 'ubcore_del_sip_entry' [-Wmissing-prototypes]
     250 | int ubcore_del_sip_entry(uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:264:5: warning: no previous prototype for 'ubcore_lookup_sip_idx' [-Wmissing-prototypes]
     264 | int ubcore_lookup_sip_idx(struct ubcore_sip_info *sip, uint32_t *idx)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:285:10: warning: no previous prototype for 'ubcore_get_sip_max_cnt' [-Wmissing-prototypes]
     285 | uint32_t ubcore_get_sip_max_cnt(void)
         |          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:290:25: warning: no previous prototype for 'ubcore_lookup_sip_info' [-Wmissing-prototypes]
     290 | struct ubcore_sip_info *ubcore_lookup_sip_info(uint32_t idx)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:301:5: warning: no previous prototype for 'ubcore_notify_uvs_del_sip' [-Wmissing-prototypes]
     301 | int ubcore_notify_uvs_del_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:343:5: warning: no previous prototype for 'ubcore_notify_uvs_add_sip' [-Wmissing-prototypes]
     343 | int ubcore_notify_uvs_add_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ubcore_destroy_upi_list +344 drivers/ub/urma/ubcore/ubcore_device.c

   343	
 > 344	void ubcore_destroy_upi_list(void)
   345	{
   346		struct ubcore_upi_entry *entry = NULL, *next;
   347	
   348		mutex_lock(&g_upi_lock);
   349		list_for_each_entry_safe(entry, next, &g_upi_list, node) {
   350			if (entry != NULL) {
   351				list_del(&entry->node);
   352				kfree(entry);
   353			}
   354		}
   355		mutex_unlock(&g_upi_lock);
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
