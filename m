Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4E1C0DC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 22:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727823133; cv=none; b=M1qUDbAnn+E4oMlLPIG9KFpqHbI5y/2ta34BdFm4uL6MaZ1s+NMzWxnjl38+qwwxi/JGr70ARamSYFAmQAp8QNo0svRX5uUl6OsRHkCoQ2BDHji7BoUfOpZosjHJlLTJc8TNWoT0FnnED9O17oD2Om08bkOqBn0kjzGbeTSZjp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727823133; c=relaxed/simple;
	bh=PqK9vRQ3FPHt2yEzIKuBcX4/v5ysva9iN6t6PTXlUzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EiIIyEstIBnuxd/61Jc+I7mn5RXBGfpxz8U5rFKEtHsFjc2F+/fw3FV/8gX30Q07nxR1VCjCCIu+79/yvM14lcGNUma2SpxGnqzu6/S1mZXrrxRvnhtuLFfro+Y1XGU93fErpeJDo1gReRBs0FMUs+LCuWKLvBh70KXCbeEG0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kr1bSoye; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kr1bSoye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727823131; x=1759359131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PqK9vRQ3FPHt2yEzIKuBcX4/v5ysva9iN6t6PTXlUzY=;
  b=Kr1bSoyeP0e6zjRo5F7/ZiQlsnRQQOpV/R0PWqX7/edZ1MRX3H//OUa3
   k9qYMzDH3JsejT+rdscq84OCzQhpDOGFEhhiGAWS8bAcGBKVZLLYrSjbD
   9i8WAPD9VpVBAqtSm2Y7Upqxhddt5zQIswu1GbJmK0eMtNw17mw5cq4ey
   cNg+x3+Ts1s0HPwQOzttW1S2IQJe0fMkptEp2G2iZCxPrXTTvEbD4zPeo
   fLVjWhgTyTf/m6VCedIVNXn3F67BDMip1PWIpWIKBFCYOxxyPkTL+qzok
   7ZUZKUYcvr5wmTB5ICRA/YeZn/bRXe7xcCagqgBjiZdNnfqINI58pAPqR
   g==;
X-CSE-ConnectionGUID: Fae7YadkRaCAcepmMRsuLA==
X-CSE-MsgGUID: R0s+MorHSZ2aIWOjIrrQfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30865892"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30865892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 15:52:10 -0700
X-CSE-ConnectionGUID: fcR1L2p8S/SN5Cr+SvJnfg==
X-CSE-MsgGUID: HNiZAc26SBeQLT/yP7vUAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="97172719"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 15:52:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svlix-000RFZ-0l;
	Tue, 01 Oct 2024 22:52:07 +0000
Date: Wed, 2 Oct 2024 06:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26381/30000]
 drivers/ub/urma/ubcore/ubcore_msg.c:264:15: warning: 'strncpy' output may be
 truncated copying 63 bytes from a string of length 63
Message-ID: <202410020611.L9WVfDmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   084a6771cfb3ef307b750af8b7c35a07a725fc4c
commit: 5d130e2cfa3d2aaee4d10e18c075f6c3750600c5 [26381/30000] urma: upload kernel patch for 20240511_mig
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20241002/202410020611.L9WVfDmZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020611.L9WVfDmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020611.L9WVfDmZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_msg.c:519:28: warning: no previous prototype for 'ubcore_asyn_send_fe2tpf_msg' [-Wmissing-prototypes]
     519 | struct ubcore_msg_session *ubcore_asyn_send_fe2tpf_msg(struct ubcore_device *dev,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ubcore_migrate_req',
       inlined from 'ubcore_recv_req' at drivers/ub/urma/ubcore/ubcore_msg.c:368:16:
>> drivers/ub/urma/ubcore/ubcore_msg.c:264:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     264 |         (void)strncpy(mig_resp->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_umem.c:242:21: warning: no previous prototype for 'ubcore_umem_get' [-Wmissing-prototypes]
     242 | struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va,
         |                     ^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_umem.c:260:6: warning: no previous prototype for 'ubcore_umem_release' [-Wmissing-prototypes]
     260 | void ubcore_umem_release(struct ubcore_umem *umem)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_umem.c:284:10: warning: no previous prototype for 'ubcore_umem_find_best_page_size' [-Wmissing-prototypes]
     284 | uint64_t ubcore_umem_find_best_page_size(struct ubcore_umem *umem, uint64_t page_size_bitmap,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_netlink.c:192:5: warning: no previous prototype for 'ubcore_genl_unicast' [-Wmissing-prototypes]
     192 | int ubcore_genl_unicast(struct ubcore_nlmsg *req, uint32_t len)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netlink.c: In function 'ubcore_create_nl_session':
>> drivers/ub/urma/ubcore/ubcore_netlink.c:89:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
      89 |         (void)strncpy(s->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_netdev.c:41:25: warning: no previous prototype for 'ubcore_lookup_sip_info_without_lock' [-Wmissing-prototypes]
      41 | struct ubcore_sip_info *ubcore_lookup_sip_info_without_lock(
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:75:5: warning: no previous prototype for 'ubcore_notify_uvs_del_sip' [-Wmissing-prototypes]
      75 | int ubcore_notify_uvs_del_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:113:22: warning: no previous prototype for 'ubcore_new_sip_req_msg' [-Wmissing-prototypes]
     113 | struct ubcore_nlmsg *ubcore_new_sip_req_msg(struct ubcore_device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:145:5: warning: no previous prototype for 'ubcore_notify_uvs_add_sip' [-Wmissing-prototypes]
     145 | int ubcore_notify_uvs_add_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:177:5: warning: no previous prototype for 'ubcore_check_port_state' [-Wmissing-prototypes]
     177 | int ubcore_check_port_state(struct ubcore_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:204:6: warning: no previous prototype for 'ubcore_fill_port_netdev' [-Wmissing-prototypes]
     204 | void ubcore_fill_port_netdev(struct ubcore_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:268:5: warning: no previous prototype for 'ubcore_set_port_netdev' [-Wmissing-prototypes]
     268 | int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:353:5: warning: no previous prototype for 'ubcore_unset_port_netdev' [-Wmissing-prototypes]
     353 | int ubcore_unset_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:385:6: warning: no previous prototype for 'ubcore_put_port_netdev' [-Wmissing-prototypes]
     385 | void ubcore_put_port_netdev(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:412:5: warning: no previous prototype for 'ubcore_sip_table_init' [-Wmissing-prototypes]
     412 | int ubcore_sip_table_init(struct ubcore_sip_table *sip_table, uint32_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:431:6: warning: no previous prototype for 'ubcore_sip_table_uninit' [-Wmissing-prototypes]
     431 | void ubcore_sip_table_uninit(struct ubcore_sip_table *sip_table)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:442:5: warning: no previous prototype for 'ubcore_sip_idx_alloc' [-Wmissing-prototypes]
     442 | int ubcore_sip_idx_alloc(struct ubcore_sip_table *sip_table)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:458:5: warning: no previous prototype for 'ubcore_sip_idx_free' [-Wmissing-prototypes]
     458 | int ubcore_sip_idx_free(struct ubcore_sip_table *sip_table, uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:471:5: warning: no previous prototype for 'ubcore_add_sip_entry' [-Wmissing-prototypes]
     471 | int ubcore_add_sip_entry(struct ubcore_sip_table *sip_table, const struct ubcore_sip_info *sip,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:489:5: warning: no previous prototype for 'ubcore_del_sip_entry' [-Wmissing-prototypes]
     489 | int ubcore_del_sip_entry(struct ubcore_sip_table *sip_table, uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:519:5: warning: no previous prototype for 'ubcore_update_sip_entry' [-Wmissing-prototypes]
     519 | int ubcore_update_sip_entry(struct ubcore_sip_table *sip_table, struct ubcore_sip_info *new_sip,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:548:5: warning: no previous prototype for 'ubcore_lookup_sip_idx' [-Wmissing-prototypes]
     548 | int ubcore_lookup_sip_idx(struct ubcore_sip_table *sip_table, struct ubcore_sip_info *sip,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c: In function 'ubcore_set_port_netdev':
   drivers/ub/urma/ubcore/ubcore_netdev.c:275:17: warning: 'strnlen' specified bound 64 exceeds source size 21 [-Wstringop-overread]
     275 |                 strnlen(netdev_name(ndev), UBCORE_MAX_DEV_NAME) >= UBCORE_MAX_DEV_NAME) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c: In function 'ubcore_unset_port_netdev':
   drivers/ub/urma/ubcore/ubcore_netdev.c:360:17: warning: 'strnlen' specified bound 64 exceeds source size 21 [-Wstringop-overread]
     360 |                 strnlen(netdev_name(ndev), UBCORE_MAX_DEV_NAME) >= UBCORE_MAX_DEV_NAME) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_device.c:413:6: warning: no previous prototype for 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     413 | void ubcore_destroy_upi_list(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1666:5: warning: no previous prototype for 'ubcore_dispatch_event' [-Wmissing-prototypes]
    1666 | int ubcore_dispatch_event(struct ubcore_event *event)
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
   drivers/ub/urma/ubcore/ubcore_device.c:1874:17: note: in expansion of macro 'ubcore_log_err'
    1874 |                 ubcore_log_err("failed to add ueid, ret:%d\n",
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
   drivers/ub/urma/ubcore/ubcore_device.c:1896:17: note: in expansion of macro 'ubcore_log_err'
    1896 |                 ubcore_log_err("failed to add ueid, ret:%d\n",
         |                 ^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: At top level:
   drivers/ub/urma/ubcore/ubcore_device.c:2372:6: warning: no previous prototype for 'ubcore_net_exit' [-Wmissing-prototypes]
    2372 | void ubcore_net_exit(struct net *net)
         |      ^~~~~~~~~~~~~~~
   In function 'ubcore_send_remove_tpf_dev_info',
       inlined from 'uninit_ubcore_device' at drivers/ub/urma/ubcore/ubcore_device.c:1057:37:
>> drivers/ub/urma/ubcore/ubcore_device.c:823:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     823 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: In function 'ubcore_new_tpf_dev_msg':
   drivers/ub/urma/ubcore/ubcore_device.c:888:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     888 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:892:17: warning: 'strnlen' specified bound 64 exceeds source size 16 [-Wstringop-overread]
     892 |                 strnlen(dev->netdev->name, UBCORE_MAX_DEV_NAME) < UBCORE_MAX_DEV_NAME)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/ub/urma/ubcore/ubcore_device.c:32:
   include/linux/netdevice.h:1957:33: note: source object allocated here
    1957 |         char                    name[IFNAMSIZ];
         |                                 ^~~~
--
   drivers/ub/urma/ubcore/ubcore_tp.c:70:17: warning: no previous prototype for 'ubcore_get_mtu' [-Wmissing-prototypes]
      70 | enum ubcore_mtu ubcore_get_mtu(int mtu)
         |                 ^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:341:5: warning: no previous prototype for 'ubcore_modify_tp_state' [-Wmissing-prototypes]
     341 | int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c: In function 'ubcore_send_del_tp_req.isra':
>> drivers/ub/urma/ubcore/ubcore_tp.c:687:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     687 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c: In function 'ubcore_init_create_tp_req':
   drivers/ub/urma/ubcore/ubcore_tp.c:581:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     581 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_tpg.c:85:6: warning: no previous prototype for 'ubcore_tpg_kref_get' [-Wmissing-prototypes]
      85 | void ubcore_tpg_kref_get(struct ubcore_tpg *tpg)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tpg.c: In function 'ubcore_find_remove_tpg':
   drivers/ub/urma/ubcore/ubcore_tpg.c:100:42: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     100 |         if (&dev->ht[UBCORE_HT_TPG].head == NULL) {
         |                                          ^~
   In file included from drivers/ub/urma/ubcore/ubcore_hash_table.h:24,
                    from drivers/ub/urma/ubcore/ubcore_tpg.c:23:
   include/urma/ubcore_types.h:178:28: note: 'head' declared here
     178 |         struct hlist_head *head;
         |                            ^~~~
   drivers/ub/urma/ubcore/ubcore_tpg.c: In function 'ubcore_find_remove_tp_node':
   drivers/ub/urma/ubcore/ubcore_tpg.c:131:41: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     131 |         if (&dev->ht[UBCORE_HT_TP].head == NULL) {
         |                                         ^~
   include/urma/ubcore_types.h:178:28: note: 'head' declared here
     178 |         struct hlist_head *head;
         |                            ^~~~
--
   drivers/ub/urma/ubcore/ubcore_vtp.c:337:6: warning: no previous prototype for 'ubcore_hash_table_rmv_vtpn' [-Wmissing-prototypes]
     337 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ubcore_send_create_vtp_req',
       inlined from 'ubcore_connect_vtp' at drivers/ub/urma/ubcore/ubcore_vtp.c:419:8:
>> drivers/ub/urma/ubcore/ubcore_vtp.c:93:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
      93 |         (void)strncpy(create->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +264 drivers/ub/urma/ubcore/ubcore_msg.c

   239	
   240	static struct ubcore_req_host *ubcore_migrate_req(struct ubcore_device *dev,
   241		struct ubcore_req_host *req_host)
   242	{
   243		uint32_t len;
   244		struct ubcore_nl_function_mig_req *mig_resp;
   245		struct ubcore_function_mig_req *mig_msg;
   246		struct ubcore_req_host *req_copy;
   247	
   248		len = (uint32_t)sizeof(struct ubcore_req_host) +
   249			(uint32_t)sizeof(struct ubcore_nl_function_mig_req);
   250		mig_msg = (struct ubcore_function_mig_req *)req_host->req.data;
   251		req_copy = kzalloc(len, GFP_KERNEL);
   252		if (req_copy == NULL) {
   253			ubcore_log_err("Failed to kzalloc req_host req_copy!\n");
   254			return NULL;
   255		}
   256	
   257		req_copy->src_fe_idx = req_host->src_fe_idx;
   258		req_copy->req.opcode = req_host->req.opcode;
   259		req_copy->req.msg_id = req_host->req.msg_id;
   260		req_copy->req.len = sizeof(struct ubcore_nl_function_mig_req);
   261	
   262		mig_resp = (struct ubcore_nl_function_mig_req *)req_copy->req.data;
   263		mig_resp->mig_fe_idx = mig_msg->mig_fe_idx;
 > 264		(void)strncpy(mig_resp->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
   265	
   266		return req_copy;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
