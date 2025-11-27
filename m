Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A730E0C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 20:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764274430; cv=none; b=X+ZUa6tJoZ7CKGl3I+AmAqfrIJy3+aXbboUJ5zO+2p8Rebss439Ew9OJ/eD+hvR4cbD3O7bpGWbYCmMam0DxU62ZtJjkVMyzR0OVC8t4yZ1TybbXZNMZtbb1gFzGk3XF5zmpMCbcb0mI/jePP86swXUGrWfz5OJke308yTJ6rYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764274430; c=relaxed/simple;
	bh=WdRoJV8uqT7Kqrq0xe3615myGKLxfYTUcZMxHS1mxPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKGz1HnWoi8SZHmyTSldY5bHQcF8+Wl7tLPCsws3megL8X6GBSSbKR0L14b/UrWFI2Mu/a2afkNmMH9pEBeRqmGss/l2xmPFRDssZnQ5AhD71GpuZgTMJQZ7+gYWWPLK0umPxzWD3FYex5pc0jE+aPqK3+5fxwcTEhY2uFqaqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXpQrbJo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXpQrbJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764274427; x=1795810427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WdRoJV8uqT7Kqrq0xe3615myGKLxfYTUcZMxHS1mxPQ=;
  b=VXpQrbJopROkSyUj4lYonb8Zw5joyEhtXPApEk50ZDu+SYFvn0EtlZ5v
   Rlk/0e6IlETgg9uXt7iy7R1Et/aiqc9QNZ+VxLE9iDRpvfwrCuvySWuoZ
   aEthwCK/mgsBeSxxZxfJblj0ds+hiAetXxz8+Hv1Wrqc7uJ/fZ4IFBDde
   Ig9yKpp+LlNea6Nk4MrAe8z79Msc++a3/y4VBPDR2O2R1Z41AvWyGQ5yB
   zS8FmeJQW2nNGrZQ1CXGs1qsW5u5Y3AMQDafmjJA8+PIdYkkMX2dgnIr5
   6VX8C9DQo/bQ4W7AehI2YalDQmnKJu7r9Q1dq2w2rVNRo1s0QS7LdUusl
   w==;
X-CSE-ConnectionGUID: mhKcOM+SRfKuPGrTCGXzjg==
X-CSE-MsgGUID: ZLP0oX14SCqx8+kcMkUC/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66266854"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66266854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 12:13:47 -0800
X-CSE-ConnectionGUID: GbvqB9EcT3aLMpZ7y4nwlw==
X-CSE-MsgGUID: m8L23IP+Rzer1WM8A8uFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="230582320"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 12:13:46 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOiN4-000000001pt-3A6k;
	Thu, 27 Nov 2025 20:13:42 +0000
Date: Thu, 27 Nov 2025 21:13:01 +0100
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 2/2] net/core/netdev-genl.c:1136:39:
 error: 'NETDEV_A_QUEUE_PAIR_DST_IFINDEX' undeclared; did you mean
 'NETDEV_A_QUEUE_IFINDEX'?
Message-ID: <202511272132.XDVCLFMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring6
head:   7bfb4fc5f460441d05b483647e4f4c59c4afaeb1
commit: 7bfb4fc5f460441d05b483647e4f4c59c4afaeb1 [2/2] net: Implement netdev_nl_bind_queue_doit
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251127/202511272132.XDVCLFMw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511272132.XDVCLFMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511272132.XDVCLFMw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   net/core/netdev-genl.c:1123:5: warning: no previous prototype for 'netdev_nl_bind_queue_doit' [-Wmissing-prototypes]
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from net/core/netdev-genl.c:3:
   net/core/netdev-genl.c: In function 'netdev_nl_bind_queue_doit':
   net/core/netdev-genl.c:1133:39: error: 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE' undeclared (first use in this function); did you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
    1133 |         if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:201:23: note: in definition of macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^~~~
   net/core/netdev-genl.c:1133:13: note: in expansion of macro 'GENL_REQ_ATTR_CHECK'
    1133 |         if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
         |             ^~~~~~~~~~~~~~~~~~~
   net/core/netdev-genl.c:1133:39: note: each undeclared identifier is reported only once for each function it appears in
    1133 |         if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:201:23: note: in definition of macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^~~~
   net/core/netdev-genl.c:1133:13: note: in expansion of macro 'GENL_REQ_ATTR_CHECK'
    1133 |         if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
         |             ^~~~~~~~~~~~~~~~~~~
   net/core/netdev-genl.c:1134:39: error: 'NETDEV_A_QUEUE_PAIR_SRC_IFINDEX' undeclared (first use in this function); did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1134 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_IFINDEX) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:201:23: note: in definition of macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^~~~
   net/core/netdev-genl.c:1134:13: note: in expansion of macro 'GENL_REQ_ATTR_CHECK'
    1134 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_IFINDEX) ||
         |             ^~~~~~~~~~~~~~~~~~~
   net/core/netdev-genl.c:1135:39: error: 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID' undeclared (first use in this function); did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1135 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:201:23: note: in definition of macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^~~~
   net/core/netdev-genl.c:1135:13: note: in expansion of macro 'GENL_REQ_ATTR_CHECK'
    1135 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID) ||
         |             ^~~~~~~~~~~~~~~~~~~
>> net/core/netdev-genl.c:1136:39: error: 'NETDEV_A_QUEUE_PAIR_DST_IFINDEX' undeclared (first use in this function); did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1136 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_DST_IFINDEX))
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:201:23: note: in definition of macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^~~~
   net/core/netdev-genl.c:1136:13: note: in expansion of macro 'GENL_REQ_ATTR_CHECK'
    1136 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_DST_IFINDEX))
         |             ^~~~~~~~~~~~~~~~~~~
>> net/core/netdev-genl.c:1231:20: error: 'struct netdev_rx_queue' has no member named 'peer'
    1231 |         if (src_rxq->peer) {
         |                    ^~
   net/core/netdev-genl.c:1239:20: error: 'struct netdev_rx_queue' has no member named 'peer'
    1239 |         if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
         |                    ^~
   net/core/netdev-genl.c:1239:37: error: 'struct netdev_rx_queue' has no member named 'peer'
    1239 |         if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
         |                                     ^~
   net/core/netdev-genl.c:1254:9: error: implicit declaration of function 'netdev_rx_queue_peer'; did you mean 'netdev_rx_queue_lease'? [-Wimplicit-function-declaration]
    1254 |         netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         netdev_rx_queue_lease
   net/core/netdev-genl.c:1256:26: error: 'NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID' undeclared (first use in this function); did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1256 |         nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          NETDEV_A_QSTATS_QUEUE_ID
--
>> net/core/netdev_rx_queue.c:21:6: warning: no previous prototype for 'netdev_rx_queue_peer' [-Wmissing-prototypes]
      21 | void netdev_rx_queue_peer(struct net_device *src_dev,
         |      ^~~~~~~~~~~~~~~~~~~~
>> net/core/netdev_rx_queue.c:34:6: warning: no previous prototype for 'netdev_rx_queue_unpeer' [-Wmissing-prototypes]
      34 | void netdev_rx_queue_unpeer(struct net_device *src_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   net/core/netdev_rx_queue.c: In function '__netif_get_rx_queue_peer':
>> net/core/netdev_rx_queue.c:55:16: error: 'struct netdev_rx_queue' has no member named 'peer'
      55 |         if (rxq->peer) {
         |                ^~
   net/core/netdev_rx_queue.c:58:26: error: 'struct netdev_rx_queue' has no member named 'peer'
      58 |                 rxq = rxq->peer;
         |                          ^~
   net/core/netdev_rx_queue.c: At top level:
>> net/core/netdev_rx_queue.c:66:1: warning: no previous prototype for 'netif_get_rx_queue_peer_locked' [-Wmissing-prototypes]
      66 | netif_get_rx_queue_peer_locked(struct net_device **dev, unsigned int *rxq_idx)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/netdev_rx_queue.c:81:6: warning: no previous prototype for 'netif_put_rx_queue_peer_locked' [-Wmissing-prototypes]
      81 | void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1136 net/core/netdev-genl.c

  1122	
  1123	int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
  1124	{
  1125		struct netdev_rx_queue *src_rxq, *dst_rxq, *tmp_rxq;
  1126		u32 src_ifidx, src_qid, dst_ifidx, dst_qid, q_type;
  1127		struct net_device *src_dev, *dst_dev;
  1128		netdevice_tracker dev_tracker;
  1129		struct sk_buff *rsp;
  1130		int err = 0;
  1131		void *hdr;
  1132	
  1133		if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
  1134		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_IFINDEX) ||
> 1135		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID) ||
> 1136		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_DST_IFINDEX))
  1137			return -EINVAL;
  1138	
  1139		src_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
  1140		src_qid = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
  1141		dst_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_DST_IFINDEX]);
  1142		q_type = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]);
  1143	
  1144		if (q_type != NETDEV_QUEUE_TYPE_RX) {
  1145			NL_SET_ERR_MSG(info->extack, "Only binding of RX queue supported");
  1146			return -EINVAL;
  1147		}
  1148		if (dst_ifidx == src_ifidx) {
  1149			NL_SET_ERR_MSG(info->extack,
  1150				       "Destination driver cannot be same as source driver");
  1151			return -EINVAL;
  1152		}
  1153	
  1154		rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
  1155		if (!rsp)
  1156			return -ENOMEM;
  1157	
  1158		hdr = genlmsg_iput(rsp, info);
  1159		if (!hdr) {
  1160			err = -EMSGSIZE;
  1161			goto err_genlmsg_free;
  1162		}
  1163	
  1164		/* Locking order is always from the virtual to the physical device
  1165		 * since this is also the same order when applications open the
  1166		 * memory provider later on.
  1167		 */
  1168		dst_dev = netdev_get_by_index_lock(genl_info_net(info), dst_ifidx);
  1169		if (!dst_dev) {
  1170			err = -ENODEV;
  1171			goto err_genlmsg_free;
  1172		}
  1173		if (dst_dev->dev.parent) {
  1174			err = -EINVAL;
  1175			NL_SET_ERR_MSG(info->extack,
  1176				       "Destination device is not a virtual device");
  1177			goto err_unlock_dst_dev;
  1178		}
  1179		if (!dst_dev->queue_mgmt_ops ||
  1180		    !dst_dev->queue_mgmt_ops->ndo_queue_create) {
  1181			err = -EOPNOTSUPP;
  1182			NL_SET_ERR_MSG(info->extack,
  1183				       "Destination driver does not support queue management operations");
  1184			goto err_unlock_dst_dev;
  1185		}
  1186		if (dst_dev->real_num_rx_queues < 1) {
  1187			err = -EINVAL;
  1188			NL_SET_ERR_MSG(info->extack,
  1189				       "Destination device must have at least one real RX queue");
  1190			goto err_unlock_dst_dev;
  1191		}
  1192	
  1193		src_dev = netdev_get_by_index(genl_info_net(info), src_ifidx,
  1194					      &dev_tracker, GFP_KERNEL);
  1195		if (!src_dev) {
  1196			err = -ENODEV;
  1197			goto err_unlock_dst_dev;
  1198		}
  1199		if (!src_dev->dev.parent) {
  1200			err = -EINVAL;
  1201			NL_SET_ERR_MSG(info->extack,
  1202				       "Source device is a virtual device");
  1203			goto err_unlock_dst_dev_src_dev_put;
  1204		}
  1205		if (!netif_device_present(src_dev)) {
  1206			err = -ENODEV;
  1207			NL_SET_ERR_MSG(info->extack,
  1208				       "Source device has been removed from the system");
  1209			goto err_unlock_dst_dev_src_dev_put;
  1210		}
  1211		if (!src_dev->queue_mgmt_ops) {
  1212			err = -EOPNOTSUPP;
  1213			NL_SET_ERR_MSG(info->extack,
  1214				       "Source driver does not support queue management operations");
  1215			goto err_unlock_dst_dev_src_dev_put;
  1216		}
  1217	
  1218		src_dev = netdev_put_lock(src_dev, &dev_tracker);
  1219		if (!src_dev) {
  1220			err = -ENODEV;
  1221			goto err_unlock_dst_dev;
  1222		}
  1223		if (src_qid >= src_dev->real_num_rx_queues) {
  1224			err = -ERANGE;
  1225			NL_SET_BAD_ATTR(info->extack,
  1226					info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
  1227			goto err_unlock_src_dev;
  1228		}
  1229	
  1230		src_rxq = __netif_get_rx_queue(src_dev, src_qid);
> 1231		if (src_rxq->peer) {
  1232			err = -EBUSY;
  1233			NL_SET_ERR_MSG(info->extack,
  1234				       "Source device queue is already bound");
  1235			goto err_unlock_src_dev;
  1236		}
  1237	
  1238		tmp_rxq = __netif_get_rx_queue(dst_dev, dst_dev->real_num_rx_queues - 1);
  1239		if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
  1240			err = -EOPNOTSUPP;
  1241			NL_SET_ERR_MSG(info->extack,
  1242				       "Binding multiple queues from different source devices not supported");
  1243			goto err_unlock_src_dev;
  1244		}
  1245	
  1246		err = dst_dev->queue_mgmt_ops->ndo_queue_create(dst_dev, &dst_qid);
  1247		if (err) {
  1248			NL_SET_ERR_MSG(info->extack,
  1249				       "Destination device is unable to create a new queue");
  1250			goto err_unlock_src_dev;
  1251		}
  1252	
  1253		dst_rxq = __netif_get_rx_queue(dst_dev, dst_qid);
  1254		netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
  1255	
  1256		nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
  1257		genlmsg_end(rsp, hdr);
  1258	
  1259		netdev_unlock(src_dev);
  1260		netdev_unlock(dst_dev);
  1261	
  1262		return genlmsg_reply(rsp, info);
  1263	
  1264	err_unlock_dst_dev_src_dev_put:
  1265		netdev_put(src_dev, &dev_tracker);
  1266		goto err_unlock_dst_dev;
  1267	err_unlock_src_dev:
  1268		netdev_unlock(src_dev);
  1269	err_unlock_dst_dev:
  1270		netdev_unlock(dst_dev);
  1271	err_genlmsg_free:
  1272		nlmsg_free(rsp);
  1273		return err;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
