Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A21D5CC2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733393332; cv=none; b=DAjOmXjKYpBU+FUdNF0wU5QzqtsSvG4wLOTEgBjmaQ2NNMneL9Y+ofRil8qLZoPQVJaWYXISt6IyVxzuvP/9Ex7fYJLGlVWGgA3wXa2w7O13mqxyfHRvPWxep0cFdPhAbjuA6Wm5MEJuadgdYmG3OV/7OyECDngXKCmNpyjXFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733393332; c=relaxed/simple;
	bh=ZWZRe29/RMT9D/p43K6+e2gH1n0Sl2sp3hfIHUfIu0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkEEBxB0nLRbz3SinQ/viG9MIyrdcKwaZIHEGbahS+qVv87MpZxOlYMZiCsq4vVO3ui8AYQThfuFp26MgJGsr6euGu59C7/NVhoSR34BJehvg5xx9b8Fnh59fsgtTuixRGM4ZTyzMrz7qAth73Igxb9cZPkdTiOoHWNSaGW5A7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rr7D5ZDP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rr7D5ZDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733393326; x=1764929326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWZRe29/RMT9D/p43K6+e2gH1n0Sl2sp3hfIHUfIu0w=;
  b=Rr7D5ZDPvQ/EXOooilmVjfSYxlcgAVwO+j9T+pD4xyhX2u5jtyu+w29Z
   ALp0L19H9P//zoSGiTpisaVUPUcOYqEqA/L93e/RnQD6DSFFEzchlCZDq
   c/wa2zT9W7oCzwggK1vJHApmpjcwW/FGyozbK9o/q3hQ/OUUZksUZqtBf
   CM3Ztv9b//7bAmEpJQcneKE06+fX/e509++L7Q3Eg2f2jCOWq+anjLRum
   T8efY2PsmiaaRQFjAXmMkysOEFM5kw8bwfP/jX8+bF2Onq1+q6mFcg++D
   g/KkonwITXy7afrkEGznyK7qtZ1oB7CWGEJPiDro/ubaoyiWyevPvvltO
   w==;
X-CSE-ConnectionGUID: tjStJm//SviY2ldQumE9Ow==
X-CSE-MsgGUID: LY/rV+bdTQiNczOzZWSHqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45077028"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="45077028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 02:08:46 -0800
X-CSE-ConnectionGUID: 8/CjfRcwQG6LDR9ul7cZTw==
X-CSE-MsgGUID: +oErdOjrQQiisBN525QWcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="131478561"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2024 02:08:44 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ8mo-00043l-08;
	Thu, 05 Dec 2024 10:08:42 +0000
Date: Thu, 5 Dec 2024 18:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_netlink.c:89:15: warning: 'strncpy' output may
 be truncated copying 63 bytes from a string of length 63
Message-ID: <202412051837.t5BmEbw0-lkp@intel.com>
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
head:   fdc4bca5e9e486a894194c2b6a956492b11d8cc5
commit: 5d130e2cfa3d2aaee4d10e18c075f6c3750600c5 [2516/2516] urma: upload kernel patch for 20240511_mig
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241205/202412051837.t5BmEbw0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051837.t5BmEbw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051837.t5BmEbw0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_netlink.c:192:5: warning: no previous prototype for 'ubcore_genl_unicast' [-Wmissing-prototypes]
     192 | int ubcore_genl_unicast(struct ubcore_nlmsg *req, uint32_t len)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netlink.c: In function 'ubcore_create_nl_session':
>> drivers/ub/urma/ubcore/ubcore_netlink.c:89:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
      89 |         (void)strncpy(s->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_tp.c:70:17: warning: no previous prototype for 'ubcore_get_mtu' [-Wmissing-prototypes]
      70 | enum ubcore_mtu ubcore_get_mtu(int mtu)
         |                 ^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:341:5: warning: no previous prototype for 'ubcore_modify_tp_state' [-Wmissing-prototypes]
     341 | int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c: In function 'ubcore_send_del_tp_req':
>> drivers/ub/urma/ubcore/ubcore_tp.c:687:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     687 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c: In function 'ubcore_init_create_tp_req':
   drivers/ub/urma/ubcore/ubcore_tp.c:581:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     581 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/ub/urma/ubcore/ubcore_vtp.c:337:6: warning: no previous prototype for 'ubcore_hash_table_rmv_vtpn' [-Wmissing-prototypes]
     337 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ubcore_send_create_vtp_req',
       inlined from 'ubcore_connect_vtp' at drivers/ub/urma/ubcore/ubcore_vtp.c:419:8:
>> drivers/ub/urma/ubcore/ubcore_vtp.c:93:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
      93 |         (void)strncpy(create->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/ub/urma/ubcore/ubcore_msg.c:519:28: warning: no previous prototype for 'ubcore_asyn_send_fe2tpf_msg' [-Wmissing-prototypes]
     519 | struct ubcore_msg_session *ubcore_asyn_send_fe2tpf_msg(struct ubcore_device *dev,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ubcore_migrate_req',
       inlined from 'ubcore_recv_req' at drivers/ub/urma/ubcore/ubcore_msg.c:368:16:
>> drivers/ub/urma/ubcore/ubcore_msg.c:264:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     264 |         (void)strncpy(mig_resp->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/uburma/uburma_mmap.c:29:6: warning: no previous prototype for 'uburma_umap_priv_init' [-Wmissing-prototypes]
      29 | void uburma_umap_priv_init(struct uburma_umap_priv *priv,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_mmap.c:42:6: warning: no previous prototype for 'uburma_unmap_vma_pages' [-Wmissing-prototypes]
      42 | void uburma_unmap_vma_pages(struct uburma_file *ufile)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_mmap.c:157:36: warning: no previous prototype for 'uburma_get_umap_ops' [-Wmissing-prototypes]
     157 | const struct vm_operations_struct *uburma_get_umap_ops(void)
         |                                    ^~~~~~~~~~~~~~~~~~~


vim +/strncpy +89 drivers/ub/urma/ubcore/ubcore_netlink.c

    72	
    73	static struct ubcore_nl_session *ubcore_create_nl_session(struct ubcore_device *dev,
    74		struct ubcore_nlmsg *req)
    75	{
    76		struct ubcore_nl_session *s;
    77		unsigned long flags;
    78	
    79		s = kzalloc(sizeof(struct ubcore_nl_session), GFP_KERNEL);
    80		if (s == NULL)
    81			return NULL;
    82	
    83		s->req = req;
    84		spin_lock_irqsave(&g_nl_session_lock, flags);
    85		list_add_tail(&s->node, &g_nl_session_list);
    86		spin_unlock_irqrestore(&g_nl_session_lock, flags);
    87		kref_init(&s->kref);
    88		init_completion(&s->comp);
  > 89		(void)strncpy(s->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
    90	
    91		return s;
    92	}
    93	
    94	static void ubcore_free_nl_session(struct kref *kref)
    95	{
    96		struct ubcore_nl_session *s = container_of(kref, struct ubcore_nl_session, kref);
    97		unsigned long flags;
    98	
    99		spin_lock_irqsave(&g_nl_session_lock, flags);
   100		list_del(&s->node);
   101		spin_unlock_irqrestore(&g_nl_session_lock, flags);
   102		kfree(s);
   103	}
   104	
   105	static inline void ubcore_destroy_nl_session(struct ubcore_nl_session *s)
   106	{
   107		(void)kref_put(&s->kref, ubcore_free_nl_session);
   108	}
   109	
   110	static struct ubcore_nl_session *ubcore_find_nl_session(uint32_t nlmsg_seq)
   111	{
   112		struct ubcore_nl_session *tmp, *target = NULL;
   113		unsigned long flags;
   114	
   115		spin_lock_irqsave(&g_nl_session_lock, flags);
   116		list_for_each_entry(tmp, &g_nl_session_list, node) {
   117			if (tmp->req->nlmsg_seq == nlmsg_seq) {
   118				target = tmp;
   119				kref_get(&target->kref);
   120				break;
   121			}
   122		}
   123		spin_unlock_irqrestore(&g_nl_session_lock, flags);
   124		return target;
   125	}
   126	
   127	static struct ubcore_nlmsg *ubcore_get_genlmsg_data(struct genl_info *info)
   128	{
   129		struct ubcore_nlmsg *msg;
   130		uint32_t payload_len = 0;
   131	
   132		if (!info->attrs[UBCORE_MSG_SEQ] || !info->attrs[UBCORE_PAYLOAD_LEN])
   133			return NULL;
   134	
   135		payload_len = nla_get_u32(info->attrs[UBCORE_PAYLOAD_LEN]);
   136		if (payload_len > UBCORE_MAX_NL_MSG_BUF_LEN) {
   137			ubcore_log_err("Invalid payload len: %d", payload_len);
   138			return NULL;
   139		}
   140	
   141		msg = kzalloc((size_t)(sizeof(struct ubcore_nlmsg) + payload_len), GFP_KERNEL);
   142		if (msg == NULL)
   143			return NULL;
   144	
   145		msg->payload_len = payload_len;
   146		msg->nlmsg_seq = nla_get_u32(info->attrs[UBCORE_MSG_SEQ]);
   147		if (info->attrs[UBCORE_MSG_TYPE])
   148			msg->msg_type = nla_get_u32(info->attrs[UBCORE_MSG_TYPE]);
   149	
   150		if (info->attrs[UBCORE_TRANSPORT_TYPE])
   151			msg->transport_type = (enum ubcore_transport_type)
   152			nla_get_u32(info->attrs[UBCORE_TRANSPORT_TYPE]);
   153	
   154		if (info->attrs[UBORE_SRC_ID])
   155			(void)memcpy(&msg->src_eid,
   156			nla_data(info->attrs[UBORE_SRC_ID]), UBCORE_EID_SIZE);
   157	
   158		if (info->attrs[UBORE_DST_ID])
   159			(void)memcpy(&msg->dst_eid,
   160			nla_data(info->attrs[UBORE_DST_ID]), UBCORE_EID_SIZE);
   161	
   162		if (info->attrs[UBCORE_PAYLOAD_DATA]) {
   163			(void)memcpy(msg->payload,
   164			nla_data(info->attrs[UBCORE_PAYLOAD_DATA]), payload_len);
   165		}
   166	
   167		return msg;
   168	}
   169	
   170	int ubcore_tp_resp_ops(struct sk_buff *skb, struct genl_info *info)
   171	{
   172		struct ubcore_nl_session *s;
   173		struct ubcore_nlmsg *resp;
   174	
   175		resp = ubcore_get_genlmsg_data(info);
   176		if (resp == NULL) {
   177			ubcore_log_err("Failed to calloc and copy response");
   178			return -1;
   179		}
   180		s = ubcore_find_nl_session(resp->nlmsg_seq);
   181		if (s == NULL) {
   182			ubcore_log_err("Failed to find nl session with seq %u", resp->nlmsg_seq);
   183			kfree(resp);
   184			return -1;
   185		}
   186		s->resp = resp;
   187		(void)kref_put(&s->kref, ubcore_free_nl_session);
   188		complete(&s->comp);
   189		return 0;
   190	}
   191	
 > 192	int ubcore_genl_unicast(struct ubcore_nlmsg *req, uint32_t len)
   193	{
   194		struct sk_buff *nl_skb;
   195		struct nlmsghdr *nlh;
   196	
   197		if (req == NULL || g_genl_port == UBCORE_NL_INVALID_PORT) {
   198			ubcore_log_err("There are illegal parameters.\n");
   199			return -1;
   200		}
   201	
   202		/* create sk_buff */
   203		nl_skb = genlmsg_new(NLMSG_DEFAULT_SIZE,  GFP_KERNEL);
   204		if (nl_skb == NULL) {
   205			ubcore_log_err("failed to alloc.\n");
   206			return -1;
   207		}
   208		/* set genl head */
   209		nlh = genlmsg_put(nl_skb, g_genl_port, req->nlmsg_seq, &ubcore_genl_family, 0,
   210			(uint8_t)req->msg_type);
   211		if (nlh == NULL) {
   212			ubcore_log_err("Failed to nlmsg put.\n");
   213			nlmsg_free(nl_skb);
   214			return -1;
   215		}
   216		if (nla_put_u32(nl_skb, UBCORE_MSG_SEQ, req->nlmsg_seq) ||
   217			nla_put_u32(nl_skb, UBCORE_MSG_TYPE, (uint32_t)req->msg_type) ||
   218			nla_put_u32(nl_skb, UBCORE_TRANSPORT_TYPE, (uint32_t)req->transport_type) ||
   219			nla_put_u32(nl_skb, UBCORE_PAYLOAD_LEN, req->payload_len) ||
   220			nla_put(nl_skb, UBCORE_PAYLOAD_DATA, (int)req->payload_len, req->payload)) {
   221			nlmsg_free(nl_skb);
   222			return -1;
   223		}
   224	
   225		genlmsg_end(nl_skb, nlh);
   226		ubcore_log_info("send genl msg type %d seq:%u payload_len %u",
   227			(int)req->msg_type, req->nlmsg_seq, req->payload_len);
   228		return nlmsg_unicast(g_genl_sock, nl_skb, g_genl_port);
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
