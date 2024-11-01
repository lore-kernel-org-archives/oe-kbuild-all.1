Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7501509A5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445676; cv=none; b=SjuewWqwSPKreZZj/hpDSyGlBZEWyy4DdauR6VPT5ze7hKYUgNxiRww6yLjXfqVqd8JygmngSGT+xvBMHpZH4ka9pQbjN8QNhMWftO32ennOfXYY5F3iaG7gR8gON8bybbjzp3flJk07zjT/Q0v9X5u9AoRbkeK1IKbhOsWMQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445676; c=relaxed/simple;
	bh=whY2LxGhULxDDuh0Pp/ymn4sNwzFdhSu7FjqvOyEa4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qvb7EI9Jef0hxPH2NF0Foi+jahYoDipFoOsDfMw9y+/xaE7ueqkKNsZ6kuv++ZsLzIgQbY0w49a1sYk49xfZaJ+TOXgYUPbi61CD77HC/R99M/oqm0r7W6AoMoLw0UhgBg5+Rx47qCin5WMC1UchhFCEyTsxkFCrXlio9qY6fVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djX6wYR5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djX6wYR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730445674; x=1761981674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whY2LxGhULxDDuh0Pp/ymn4sNwzFdhSu7FjqvOyEa4E=;
  b=djX6wYR5G4jOVsVqHbEyH1/rjyRcwKxxA5a+FHbpEOCsi8G4YgaTa/7v
   L17hNrFxnGDQ1CrBXUxBuLtJANV4XTgF6tnQONvMqcZMzAdTWvDlpP+if
   OVEgDwcobcJJE7HEa1nQiEUYv7T3I5I50xCn5JgWcORUI49cPvPrLtY9A
   8zsLWlhbtoPtBRLhT1I4FVYoA7/IXDKkcqXt04NtbEwhEH8AqLznB69JF
   5+q8E6Pj0JxPBHktt/1+lZI2ZC3ZtzE3qutwiTsnYI40vnCPZNby+Vw58
   QOAXKBEKQdbgU9x21sm8vO2zZ1TfIG4VpEpqKEe1pdr5nCaQkTP62DtvF
   g==;
X-CSE-ConnectionGUID: 15AzWeRLTamNyj80lcDvEA==
X-CSE-MsgGUID: PIjA0dOnQOe83ffh2DkeIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47671096"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47671096"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:21:13 -0700
X-CSE-ConnectionGUID: bRY9+3VKRzSBmiDfrKOA+Q==
X-CSE-MsgGUID: YMvUIKSNSVyUYrfKiKcR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82406282"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 00:21:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6ly1-000hGH-0e;
	Fri, 01 Nov 2024 07:21:09 +0000
Date: Fri, 1 Nov 2024 15:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20942/30000]
 drivers/ub/urma/ubcore/ubcore_device.c:344:6: warning: no previous prototype
 for 'ubcore_destroy_upi_list'
Message-ID: <202411011536.eEAXaPtt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dd58efc15c73794d1a8bc2e16ed4319c93c1ad56
commit: 84e122368ec3a37e074c9657bc09422b62f6ccd0 [20942/30000] ub: add new feature for urma
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241101/202411011536.eEAXaPtt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011536.eEAXaPtt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011536.eEAXaPtt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:315:6: warning: no previous prototype for 'uburma_jfc_event_cb' [-Wmissing-prototypes]
     315 | void uburma_jfc_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:327:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     327 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:339:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     339 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:351:6: warning: no previous prototype for 'uburma_jetty_event_cb' [-Wmissing-prototypes]
     351 | void uburma_jetty_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:363:6: warning: no previous prototype for 'uburma_jetty_grp_event_cb' [-Wmissing-prototypes]
     363 | void uburma_jetty_grp_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_device.c:344:6: warning: no previous prototype for 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     344 | void ubcore_destroy_upi_list(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
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
--
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c: In function 'ubcore_uvs_cmd_channel_init':
>> drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:47:15: warning: 'strncpy' output truncated before terminating nul copying 10 bytes from a string of the same length [-Wstringop-truncation]
      47 |         (void)strncpy(arg.out.kernel_out, "Hello uvs!", strlen("Hello uvs!"));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
