Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602F20ED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 00:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730679064; cv=none; b=AwoFBSCqAcdRa09bJXbVAFBt9yUlXLFm9NaRKT34ScNly0yx5zml4gZyu9/quV9bDsDQ5Zu2W7zwhRMRUXAQvOnhcnZ6SKiI8av71C4OpdTj7SQcDIhI6mUUqX3yMh6OaLasqDhXMMfvxkCJmvLJ7aVEop+4VbQ0+8ibFXja2Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730679064; c=relaxed/simple;
	bh=jd1Fsm71zC/Fr3VxrNemmpIM0t+e+bZSfhjq6KI/ZsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RuqaskVoyrgEnthxqOU732rqNwvDUuKwxU5XUBYLojq1jA9BONtkNzaONVUDeIMsTBRgUPdaCDGJhNRnwdl3OqDT4H6jWFEXotYFDyJAac7sOxYz0lsfmS/kNv8SihMDRMMX2OIUtxjSPuutiU4/fWLedym0tK8SOoBjw0pCGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W58V79TO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W58V79TO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730679062; x=1762215062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jd1Fsm71zC/Fr3VxrNemmpIM0t+e+bZSfhjq6KI/ZsI=;
  b=W58V79TOKNF1+8oU/HtgWyi5gDBPZNRH4BgJKZVXYOdqWCQh6ui7biBH
   oGolqn47x+xz3msHj+/SUOr7mGTigVCYl2U96f2WQ5dbD17bEYa/wcvnI
   xOlmDkqFgNJo9t9XK+Ij0xR4psb3bHR7HfEZIg0Qg3vRClbNP/2jHtDt9
   Zcptr8/1ooA3y9AvuNtOrg4PnC8f5972hRMyl5zN+XmF7/QKyjujCZ7Mc
   XPGKNszmTDHDIPAg4NHYAZ952rMUOY8DHcS9a/cz35IGJBmth7y8U9JL7
   lgeaj1vGGiFbgGAlA97bJZf3SKsMtb8SNBqVazN9JGwEplFUNu86oMSLt
   A==;
X-CSE-ConnectionGUID: lhYHWoD5TSGOXSKGuppxPA==
X-CSE-MsgGUID: PC9O9xGGSf+4C709vVAPKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30240322"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30240322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 16:11:01 -0800
X-CSE-ConnectionGUID: muA9ZNKtQPqGwjdNdKgG/w==
X-CSE-MsgGUID: W8YBwmIJTpCXnWqkSPMVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="87435752"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2024 16:11:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7kgL-000kIv-1r;
	Mon, 04 Nov 2024 00:10:57 +0000
Date: Mon, 4 Nov 2024 08:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284]
 drivers/ub/urma/uburma/uburma_mmap.c:29:6: warning: no previous prototype
 for 'uburma_umap_priv_init'
Message-ID: <202411040843.b0ebMozw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   170b758d064664f953e8f6de41dd4a3ef122443a
commit: 5d130e2cfa3d2aaee4d10e18c075f6c3750600c5 [2284/2284] urma: upload kernel patch for 20240511_mig
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241104/202411040843.b0ebMozw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040843.b0ebMozw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040843.b0ebMozw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_mmap.c:29:6: warning: no previous prototype for 'uburma_umap_priv_init' [-Wmissing-prototypes]
      29 | void uburma_umap_priv_init(struct uburma_umap_priv *priv,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_mmap.c:42:6: warning: no previous prototype for 'uburma_unmap_vma_pages' [-Wmissing-prototypes]
      42 | void uburma_unmap_vma_pages(struct uburma_file *ufile)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_mmap.c:157:36: warning: no previous prototype for 'uburma_get_umap_ops' [-Wmissing-prototypes]
     157 | const struct vm_operations_struct *uburma_get_umap_ops(void)
         |                                    ^~~~~~~~~~~~~~~~~~~
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
   drivers/ub/urma/ubcore/ubcore_netlink.c:192:5: warning: no previous prototype for 'ubcore_genl_unicast' [-Wmissing-prototypes]
     192 | int ubcore_genl_unicast(struct ubcore_nlmsg *req, uint32_t len)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netlink.c: In function 'ubcore_create_nl_session':
>> drivers/ub/urma/ubcore/ubcore_netlink.c:89:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
      89 |         (void)strncpy(s->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/ub/urma/ubcore/ubcore_tp.c: In function 'ubcore_init_create_tp_req':
>> drivers/ub/urma/ubcore/ubcore_tp.c:581:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     581 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c: In function 'ubcore_send_del_tp_req.isra':
   drivers/ub/urma/ubcore/ubcore_tp.c:687:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
     687 |         (void)strncpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/ub/urma/ubcore/ubcore_vtp.c:337:6: warning: no previous prototype for 'ubcore_hash_table_rmv_vtpn' [-Wmissing-prototypes]
     337 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ubcore_send_create_vtp_req',
       inlined from 'ubcore_connect_vtp' at drivers/ub/urma/ubcore/ubcore_vtp.c:419:8:
>> drivers/ub/urma/ubcore/ubcore_vtp.c:93:15: warning: 'strncpy' output may be truncated copying 63 bytes from a string of length 63 [-Wstringop-truncation]
      93 |         (void)strncpy(create->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME - 1);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/uburma_umap_priv_init +29 drivers/ub/urma/uburma/uburma_mmap.c

    28	
  > 29	void uburma_umap_priv_init(struct uburma_umap_priv *priv,
    30		struct vm_area_struct *vma)
    31	{
    32		struct uburma_file *ufile = vma->vm_file->private_data;
    33	
    34		priv->vma = vma;
    35		vma->vm_private_data = priv;
    36	
    37		mutex_lock(&ufile->umap_mutex);
    38		list_add(&priv->node, &ufile->umaps_list);
    39		mutex_unlock(&ufile->umap_mutex);
    40	}
    41	
  > 42	void uburma_unmap_vma_pages(struct uburma_file *ufile)
    43	{
    44		struct uburma_umap_priv *priv, *next_priv;
    45		struct mm_struct *mm = NULL;
    46		struct vm_area_struct *vma;
    47		int ret;
    48	
    49		lockdep_assert_held(&ufile->cleanup_rwsem);
    50	
    51		while (1) {
    52			mutex_lock(&ufile->umap_mutex);
    53			list_for_each_entry_safe(priv, next_priv, &ufile->umaps_list, node) {
    54				mm = priv->vma->vm_mm;
    55				ret = mmget_not_zero(mm);
    56				if (ret != 0) {
    57					list_del_init(&priv->node);
    58					mm = NULL;
    59					continue;
    60				}
    61				break;
    62			}
    63			mutex_unlock(&ufile->umap_mutex);
    64			if (!mm)
    65				return;
    66	
    67			mmap_read_lock(mm);
    68			mutex_lock(&ufile->umap_mutex);
    69			list_for_each_entry_safe(priv, next_priv, &ufile->umaps_list, node) {
    70				vma = priv->vma;
    71				if (vma->vm_mm != mm)
    72					continue;
    73				list_del_init(&priv->node);
    74				zap_vma_ptes(vma, vma->vm_start, vma->vm_end - vma->vm_start);
    75			}
    76			mutex_unlock(&ufile->umap_mutex);
    77			mmap_read_unlock(mm);
    78			mmput(mm);
    79		}
    80	}
    81	
    82	static void uburma_umap_open(struct vm_area_struct *vma)
    83	{
    84		struct uburma_file *ufile = vma->vm_file->private_data;
    85		struct uburma_umap_priv *priv;
    86	
    87		if (!down_read_trylock(&ufile->cleanup_rwsem))
    88			goto out_zap;
    89	
    90		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
    91		if (!priv)
    92			goto out_unlock;
    93	
    94		uburma_umap_priv_init(priv, vma);
    95	
    96		up_read(&ufile->cleanup_rwsem);
    97		return;
    98	
    99	out_unlock:
   100		up_read(&ufile->cleanup_rwsem);
   101	out_zap:
   102		vma->vm_private_data = NULL;
   103		zap_vma_ptes(vma, vma->vm_start, vma->vm_end - vma->vm_start);
   104	}
   105	
   106	static void uburma_umap_close(struct vm_area_struct *vma)
   107	{
   108		struct uburma_file *ufile = vma->vm_file->private_data;
   109		struct uburma_umap_priv *priv = vma->vm_private_data;
   110	
   111		if (!priv)
   112			return;
   113	
   114		mutex_lock(&ufile->umap_mutex);
   115		list_del(&priv->node);
   116		mutex_unlock(&ufile->umap_mutex);
   117		kfree(priv);
   118		vma->vm_private_data = NULL;
   119	}
   120	
   121	static vm_fault_t uburma_umap_fault(struct vm_fault *vmf)
   122	{
   123		struct uburma_file *ufile = vmf->vma->vm_file->private_data;
   124		struct uburma_umap_priv *priv = vmf->vma->vm_private_data;
   125		vm_fault_t ret = 0;
   126	
   127		if (!priv)
   128			return VM_FAULT_SIGBUS;
   129	
   130		if (!(vmf->vma->vm_flags & (VM_WRITE | VM_MAYWRITE))) {
   131			vmf->page = ZERO_PAGE(0);
   132			get_page(vmf->page);
   133			return 0;
   134		}
   135	
   136		mutex_lock(&ufile->umap_mutex);
   137		if (!ufile->fault_page)
   138			ufile->fault_page = alloc_pages(vmf->gfp_mask | __GFP_ZERO, 0);
   139	
   140		if (ufile->fault_page) {
   141			vmf->page = ufile->fault_page;
   142			get_page(vmf->page);
   143		} else {
   144			ret = VM_FAULT_SIGBUS;
   145		}
   146		mutex_unlock(&ufile->umap_mutex);
   147	
   148		return ret;
   149	}
   150	
   151	static const struct vm_operations_struct g_urma_umap_ops = {
   152		.open = uburma_umap_open,
   153		.close = uburma_umap_close,
   154		.fault = uburma_umap_fault,
   155	};
   156	
 > 157	const struct vm_operations_struct *uburma_get_umap_ops(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
