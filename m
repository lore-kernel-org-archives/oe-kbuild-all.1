Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B114F9E9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730663625; cv=none; b=cxbdR3u4SgxtZ0L+Lk3an10/y/IgEMb3QmvecD0Jlv8WV1dbaWXoWKUWZuqlIfW0nWUvCRNPtDpQDr+UEuh0E3TDx+/xBfHWUPPZrVHHl0KrZxyBB8JDZheRNRzlO5yIhyLCgW2ffcE+Ls4Q15OqZ8ynipp9iyJoU/aDfv3qN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730663625; c=relaxed/simple;
	bh=mkfcV+hLFGM+lsAiUg8LsMsKPnFVoP8ixlvWxMztf5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAa+u4JT46a/8yvbCmJfB/Kg6WQ3VF8JMol7SN7mEDiuzfbyj/EqbW6SE8LEcnk7/nT04BbaDf2yg3OgT2lhVAmG0EkcOOy4Ve0mWhvaVyqClVHtToqC/pDRp11Q5OBI08GY5xm32M+iDqENsajqjzKuZ//3ykcgSqn9P/vjMwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dtb438Jy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dtb438Jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730663623; x=1762199623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mkfcV+hLFGM+lsAiUg8LsMsKPnFVoP8ixlvWxMztf5o=;
  b=Dtb438Jy85y1UgCU9CiaFGWllzJJUvefKb3JXBX6Zlhdl2CSbhR8S1E8
   ipVmbhnETI++U4Krmj76rQuvhlAa5ecnHlBSUPt9iLv6wizUdAXfwq1mA
   biJtGQkMr51Mtt/rJw39MxtGtfY6z3zstJZ0BCwweuJnBvbOOXVZB7Lbr
   kaqjiqMGr1Srl68vDX7hm7/qx8XxzOjr7BBx/FzZc+2rDNNImyqP770kV
   w61XLCfFNrm4GjO6OQlT5EZh7DOpjszIPO8rYZGQsq3Bdi8HPSUNBnJRk
   nQupuSpQhQ/HXK8UE00UPb1TCD9lIO3uoaImode/oEJi8tkErNF9p+QH3
   w==;
X-CSE-ConnectionGUID: 4SCufluvQCODvW1EktMpjg==
X-CSE-MsgGUID: B82v7+4PSFGvb/M9enAsOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47821096"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47821096"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 11:53:42 -0800
X-CSE-ConnectionGUID: Q1bU3GfhQk6jMQMIFt5aKA==
X-CSE-MsgGUID: k/ELwIdPQL6p39s/JUrnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="87405713"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2024 11:53:41 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7gfK-000kBN-2f;
	Sun, 03 Nov 2024 19:53:38 +0000
Date: Mon, 4 Nov 2024 03:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284]
 drivers/ub/urma/ubcore/ubcore_tpg.c:113:42: warning: the comparison will
 always evaluate as 'false' for the address of 'head' will never be NULL
Message-ID: <202411040331.VqatFZsL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WenChen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   170b758d064664f953e8f6de41dd4a3ef122443a
commit: 6d14be01fcb032c478cd4669b32526fda0393195 [2284/2284] urma: upload kernel patch for 20240318_happy_birthday
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241104/202411040331.VqatFZsL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040331.VqatFZsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040331.VqatFZsL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_tpg.c: In function 'ubcore_find_remove_tpg':
>> drivers/ub/urma/ubcore/ubcore_tpg.c:113:42: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     113 |         if (&dev->ht[UBCORE_HT_TPG].head == NULL) {
         |                                          ^~
   In file included from drivers/ub/urma/ubcore/ubcore_hash_table.h:24,
                    from drivers/ub/urma/ubcore/ubcore_tpg.c:23:
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~
   drivers/ub/urma/ubcore/ubcore_tpg.c: In function 'ubcore_find_remove_tp_node':
   drivers/ub/urma/ubcore/ubcore_tpg.c:149:44: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     149 |         if (&dev->ht[UBCORE_HT_UB_TP].head == NULL) {
         |                                            ^~
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~
--
>> drivers/ub/urma/ubcore/ubcore_netlink.c:185:5: warning: no previous prototype for 'ubcore_genl_unicast' [-Wmissing-prototypes]
     185 | int ubcore_genl_unicast(struct ubcore_nlmsg *req, uint32_t len)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netlink.c: In function 'ubcore_create_nl_session':
   drivers/ub/urma/ubcore/ubcore_netlink.c:87:15: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
      87 |         (void)strncpy(s->dev_name, dev->dev_name, strlen(dev->dev_name));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netlink.c:87:15: note: length computed here
      87 |         (void)strncpy(s->dev_name, dev->dev_name, strlen(dev->dev_name));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_msg.c:433:28: warning: no previous prototype for 'ubcore_asyn_send_fe2tpf_msg' [-Wmissing-prototypes]
     433 | struct ubcore_msg_session *ubcore_asyn_send_fe2tpf_msg(struct ubcore_device *dev,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ubcore_migrate_req',
       inlined from 'ubcore_recv_req' at drivers/ub/urma/ubcore/ubcore_msg.c:282:16:
   drivers/ub/urma/ubcore/ubcore_msg.c:261:15: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     261 |         (void)strncpy(mig_resp->dev_name, dev->dev_name, strlen(dev->dev_name));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_msg.c:261:15: note: length computed here
     261 |         (void)strncpy(mig_resp->dev_name, dev->dev_name, strlen(dev->dev_name));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_utp.c: In function 'ubcore_find_remove_utp':
>> drivers/ub/urma/ubcore/ubcore_utp.c:139:42: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     139 |         if (&dev->ht[UBCORE_HT_UTP].head == NULL) {
         |                                          ^~
   In file included from drivers/ub/urma/ubcore/ubcore_hash_table.h:24,
                    from drivers/ub/urma/ubcore/ubcore_utp.c:23:
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~
--
   drivers/ub/urma/ubcore/ubcore_ctp.c: In function 'ubcore_find_remove_ctp':
>> drivers/ub/urma/ubcore/ubcore_ctp.c:114:42: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     114 |         if (&dev->ht[UBCORE_HT_CTP].head == NULL) {
         |                                          ^~
   In file included from drivers/ub/urma/ubcore/ubcore_hash_table.h:24,
                    from drivers/ub/urma/ubcore/ubcore_ctp.c:23:
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~
--
   drivers/ub/urma/ubcore/ubcore_device.c:409:6: warning: no previous prototype for 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     409 | void ubcore_destroy_upi_list(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:504:23: warning: no previous prototype for 'ubcore_find_tpf_device_legacy' [-Wmissing-prototypes]
     504 | struct ubcore_device *ubcore_find_tpf_device_legacy(void)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1637:5: warning: no previous prototype for 'ubcore_dispatch_event' [-Wmissing-prototypes]
    1637 | int ubcore_dispatch_event(struct ubcore_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:17,
                    from include/asm-generic/bug.h:20,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/refcount.h:96,
                    from include/net/net_namespace.h:9,
                    from drivers/ub/urma/ubcore/ubcore_device.c:21:
   drivers/ub/urma/ubcore/ubcore_device.c: In function 'ubcore_add_ueid':
   include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:392:16: note: in expansion of macro 'KERN_ERR'
     392 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/ub/urma/ubcore/ubcore_log.h:46:16: note: in expansion of macro 'pr_err'
      46 |         ((void)pr_##l("%s|%s:[%d]|" format, UBCORE_LOG_TAG, __func__, __LINE__, ##args))
         |                ^~~
   drivers/ub/urma/ubcore/ubcore_log.h:57:17: note: in expansion of macro 'ubcore_default_log'
      57 |                 ubcore_default_log(err, __VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1857:17: note: in expansion of macro 'ubcore_log_err'
    1857 |                 ubcore_log_err("failed to add ueid, ret:%d\n",
         |                 ^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: In function 'ubcore_delete_ueid':
   include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:392:16: note: in expansion of macro 'KERN_ERR'
     392 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/ub/urma/ubcore/ubcore_log.h:46:16: note: in expansion of macro 'pr_err'
      46 |         ((void)pr_##l("%s|%s:[%d]|" format, UBCORE_LOG_TAG, __func__, __LINE__, ##args))
         |                ^~~
   drivers/ub/urma/ubcore/ubcore_log.h:57:17: note: in expansion of macro 'ubcore_default_log'
      57 |                 ubcore_default_log(err, __VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1885:17: note: in expansion of macro 'ubcore_log_err'
    1885 |                 ubcore_log_err("failed to add ueid, ret:%d\n",
         |                 ^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: At top level:
   drivers/ub/urma/ubcore/ubcore_device.c:2389:6: warning: no previous prototype for 'ubcore_net_exit' [-Wmissing-prototypes]
    2389 | void ubcore_net_exit(struct net *net)
         |      ^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: In function 'ubcore_new_tpf_dev_msg':
>> drivers/ub/urma/ubcore/ubcore_device.c:913:21: warning: 'strnlen' specified bound 64 exceeds source size 16 [-Wstringop-overread]
     913 |                 if (strnlen(dev->netdev->name, UBCORE_MAX_DEV_NAME) >= UBCORE_MAX_DEV_NAME) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/ub/urma/ubcore/ubcore_device.c:32:
   include/linux/netdevice.h:1957:33: note: source object allocated here
    1957 |         char                    name[IFNAMSIZ];
         |                                 ^~~~
--
>> drivers/ub/urma/ubcore/ubcore_netdev.c:40:25: warning: no previous prototype for 'ubcore_lookup_sip_info_without_lock' [-Wmissing-prototypes]
      40 | struct ubcore_sip_info *ubcore_lookup_sip_info_without_lock(
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:74:5: warning: no previous prototype for 'ubcore_notify_uvs_del_sip' [-Wmissing-prototypes]
      74 | int ubcore_notify_uvs_del_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:112:22: warning: no previous prototype for 'ubcore_new_sip_req_msg' [-Wmissing-prototypes]
     112 | struct ubcore_nlmsg *ubcore_new_sip_req_msg(struct ubcore_device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:144:5: warning: no previous prototype for 'ubcore_notify_uvs_add_sip' [-Wmissing-prototypes]
     144 | int ubcore_notify_uvs_add_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:176:5: warning: no previous prototype for 'ubcore_check_port_state' [-Wmissing-prototypes]
     176 | int ubcore_check_port_state(struct ubcore_device *dev, uint8_t port_idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:200:6: warning: no previous prototype for 'ubcore_find_port_netdev' [-Wmissing-prototypes]
     200 | void ubcore_find_port_netdev(struct ubcore_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:291:5: warning: no previous prototype for 'ubcore_set_port_netdev' [-Wmissing-prototypes]
     291 | int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:377:5: warning: no previous prototype for 'ubcore_unset_port_netdev' [-Wmissing-prototypes]
     377 | int ubcore_unset_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:408:6: warning: no previous prototype for 'ubcore_put_port_netdev' [-Wmissing-prototypes]
     408 | void ubcore_put_port_netdev(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:435:5: warning: no previous prototype for 'ubcore_sip_table_init' [-Wmissing-prototypes]
     435 | int ubcore_sip_table_init(struct ubcore_sip_table *sip_table, uint32_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:454:6: warning: no previous prototype for 'ubcore_sip_table_uninit' [-Wmissing-prototypes]
     454 | void ubcore_sip_table_uninit(struct ubcore_sip_table *sip_table)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:465:5: warning: no previous prototype for 'ubcore_sip_idx_alloc' [-Wmissing-prototypes]
     465 | int ubcore_sip_idx_alloc(struct ubcore_sip_table *sip_table)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:481:5: warning: no previous prototype for 'ubcore_sip_idx_free' [-Wmissing-prototypes]
     481 | int ubcore_sip_idx_free(struct ubcore_sip_table *sip_table, uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:494:5: warning: no previous prototype for 'ubcore_add_sip_entry' [-Wmissing-prototypes]
     494 | int ubcore_add_sip_entry(struct ubcore_sip_table *sip_table, const struct ubcore_sip_info *sip,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:512:5: warning: no previous prototype for 'ubcore_del_sip_entry' [-Wmissing-prototypes]
     512 | int ubcore_del_sip_entry(struct ubcore_sip_table *sip_table, uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:542:5: warning: no previous prototype for 'ubcore_lookup_sip_idx' [-Wmissing-prototypes]
     542 | int ubcore_lookup_sip_idx(struct ubcore_sip_table *sip_table, struct ubcore_sip_info *sip,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c: In function 'ubcore_set_port_netdev':
>> drivers/ub/urma/ubcore/ubcore_netdev.c:298:17: warning: 'strnlen' specified bound 64 exceeds source size 21 [-Wstringop-overread]
     298 |                 strnlen(netdev_name(ndev), UBCORE_MAX_DEV_NAME) >= UBCORE_MAX_DEV_NAME) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c: In function 'ubcore_unset_port_netdev':
   drivers/ub/urma/ubcore/ubcore_netdev.c:384:17: warning: 'strnlen' specified bound 64 exceeds source size 21 [-Wstringop-overread]
     384 |                 strnlen(netdev_name(ndev), UBCORE_MAX_DEV_NAME) >= UBCORE_MAX_DEV_NAME) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +113 drivers/ub/urma/ubcore/ubcore_tpg.c

   107	
   108	struct ubcore_tpg *ubcore_find_remove_tpg(struct ubcore_device *dev, uint32_t tpgn)
   109	{
   110		struct ubcore_tpg *tpg;
   111	
   112		spin_lock(&dev->ht[UBCORE_HT_TPG].lock);
 > 113		if (&dev->ht[UBCORE_HT_TPG].head == NULL) {
   114			spin_unlock(&dev->ht[UBCORE_HT_TPG].lock);
   115			return NULL;
   116		}
   117		tpg = ubcore_hash_table_lookup_nolock(&dev->ht[UBCORE_HT_TPG], tpgn, &tpgn);
   118		if (tpg == NULL) {
   119			spin_unlock(&dev->ht[UBCORE_HT_TPG].lock);
   120			return NULL;
   121		}
   122		if (atomic_read(&tpg->use_cnt) > 0) {
   123			spin_unlock(&dev->ht[UBCORE_HT_TPG].lock);
   124			ubcore_log_err("Failed to remove tpg");
   125			return NULL;
   126		}
   127		ubcore_hash_table_remove_nolock(&dev->ht[UBCORE_HT_TPG], &tpg->hnode);
   128		spin_unlock(&dev->ht[UBCORE_HT_TPG].lock);
   129	
   130		return tpg;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
