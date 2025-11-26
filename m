Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D82DCBE3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181100; cv=none; b=pQ+yRCFQEZBGIQiFaCVS77F+iXsB1ebuJdL+GggC9PSRWc6YrtY0tlKrN1EJUSPD2FrlvACvPBHsBBZe+xiIKwcB9EsoLCkzEZ5p43/e5RuoeoqP14hk+98xdBB95Z72sbSyO1qyvazXElXUvyd3EGYoC4dsRmZOzqOOD3hkbJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181100; c=relaxed/simple;
	bh=njmp+m4DsC+hwdnL7JN7gqy+5oSJ3bZ8m73cMcxPsHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuXv5m9GJFoYRMsQwwiM4B4ZL5R7Nmkyf9iFZJWeG0eULh/WZrKBq4JLypH57k/guymrNS26T6qnacL+iy436kqsRs68oocc1Wf59caXgXXSOxLmuzaMQaUKgcOBHDDXx6oVTrReArXFPdmqKbk0hDU2++FjjDQbqsrytcLogSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfQmH7X7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfQmH7X7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764181098; x=1795717098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=njmp+m4DsC+hwdnL7JN7gqy+5oSJ3bZ8m73cMcxPsHI=;
  b=hfQmH7X7gayXHNttt6a1PUef6vEWrsBE/zxtMO/l1JoTJyfoz0R0DC90
   tx3QO4hau3q8/Vp27GwohmgLz2Sgix+CzKAEdCLvGMX2QonoX4nZriDZ9
   4dgp9JvUQlqillPrKfiWyzp0ehik1Rxe7MCAgucER+48vIDezTB5zsuk0
   +tnEKcDJQGjQ56gpdPiYb3jBzKvJp7OPGPv+CbZv3x9XxISJ/MsXtkolx
   UqFsWIn0AzbyFK9G8zR/IC6iTfuyUWwIjmkDE5cA0qFSiwK1JVRXN0ZqU
   aeaxoQ98XdIJwaxPSkirum7Ls6P5eGiJrQLVvY7JGjytCpA039WvuwZ4i
   g==;
X-CSE-ConnectionGUID: hDAPMiBEQweRWBp6ZViitw==
X-CSE-MsgGUID: EPYldJqbRLSXPwux/dLi6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66174033"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66174033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:18:16 -0800
X-CSE-ConnectionGUID: fADk2YD5RCaBXiBFRMKr2Q==
X-CSE-MsgGUID: v1OGAzKVRKm+KDkVwpgGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193814210"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 10:18:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOK5j-000000003EZ-42SH;
	Wed, 26 Nov 2025 18:18:11 +0000
Date: Thu, 27 Nov 2025 02:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 2/2] net/core/netdev-genl.c:1135:32:
 error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID'; did
 you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
Message-ID: <202511270221.M7T2GCVU-lkp@intel.com>
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
config: i386-randconfig-r072-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270221.M7T2GCVU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270221.M7T2GCVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270221.M7T2GCVU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   net/core/netdev-genl.c:1133:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE'; did you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
    1133 |         if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QSTATS_QUEUE_TYPE
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:170:2: note: 'NETDEV_A_QSTATS_QUEUE_TYPE' declared here
     170 |         NETDEV_A_QSTATS_QUEUE_TYPE,
         |         ^
   net/core/netdev-genl.c:1134:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1134 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_IFINDEX) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QUEUE_IFINDEX
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
>> net/core/netdev-genl.c:1135:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1135 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QSTATS_QUEUE_ID
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
         |         ^
>> net/core/netdev-genl.c:1136:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_DST_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1136 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_DST_IFINDEX))
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QUEUE_IFINDEX
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1139:38: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1139 |         src_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             NETDEV_A_QUEUE_IFINDEX
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1140:36: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1140 |         src_qid = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           NETDEV_A_QSTATS_QUEUE_ID
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
         |         ^
   net/core/netdev-genl.c:1141:38: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_DST_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1141 |         dst_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_DST_IFINDEX]);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             NETDEV_A_QUEUE_IFINDEX
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1142:35: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE'; did you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
    1142 |         q_type = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          NETDEV_A_QSTATS_QUEUE_TYPE
   include/uapi/linux/netdev.h:170:2: note: 'NETDEV_A_QSTATS_QUEUE_TYPE' declared here
     170 |         NETDEV_A_QSTATS_QUEUE_TYPE,
         |         ^
   net/core/netdev-genl.c:1226:17: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1226 |                                 info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             NETDEV_A_QSTATS_QUEUE_ID
   include/linux/netlink.h:150:70: note: expanded from macro 'NL_SET_BAD_ATTR'
     150 | #define NL_SET_BAD_ATTR(extack, attr) NL_SET_BAD_ATTR_POLICY(extack, attr, NULL)
         |                                                                      ^
   include/linux/netlink.h:145:25: note: expanded from macro 'NL_SET_BAD_ATTR_POLICY'
     145 |                 (extack)->bad_attr = (attr);            \
         |                                       ^
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
         |         ^
>> net/core/netdev-genl.c:1231:15: error: no member named 'peer' in 'struct netdev_rx_queue'
    1231 |         if (src_rxq->peer) {
         |             ~~~~~~~  ^
   net/core/netdev-genl.c:1239:15: error: no member named 'peer' in 'struct netdev_rx_queue'
    1239 |         if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
         |             ~~~~~~~  ^
   net/core/netdev-genl.c:1239:32: error: no member named 'peer' in 'struct netdev_rx_queue'
    1239 |         if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
         |                              ~~~~~~~  ^
>> net/core/netdev-genl.c:1254:2: error: call to undeclared function 'netdev_rx_queue_peer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1254 |         netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
         |         ^
   net/core/netdev-genl.c:1254:2: note: did you mean 'netdev_rx_queue_lease'?
   include/net/netdev_rx_queue.h:62:6: note: 'netdev_rx_queue_lease' declared here
      62 | void netdev_rx_queue_lease(struct net_device *src_dev,
         |      ^
>> net/core/netdev-genl.c:1256:19: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1256 |         nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          NETDEV_A_QSTATS_QUEUE_ID
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
         |         ^
   net/core/netdev-genl.c:1123:5: warning: no previous prototype for function 'netdev_nl_bind_queue_doit' [-Wmissing-prototypes]
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         |     ^
   net/core/netdev-genl.c:1123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         | ^
         | static 
   1 warning and 14 errors generated.
--
>> net/core/netdev_rx_queue.c:21:6: warning: no previous prototype for function 'netdev_rx_queue_peer' [-Wmissing-prototypes]
      21 | void netdev_rx_queue_peer(struct net_device *src_dev,
         |      ^
   net/core/netdev_rx_queue.c:21:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      21 | void netdev_rx_queue_peer(struct net_device *src_dev,
         | ^
         | static 
>> net/core/netdev_rx_queue.c:34:6: warning: no previous prototype for function 'netdev_rx_queue_unpeer' [-Wmissing-prototypes]
      34 | void netdev_rx_queue_unpeer(struct net_device *src_dev,
         |      ^
   net/core/netdev_rx_queue.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | void netdev_rx_queue_unpeer(struct net_device *src_dev,
         | ^
         | static 
>> net/core/netdev_rx_queue.c:55:11: error: no member named 'peer' in 'struct netdev_rx_queue'
      55 |         if (rxq->peer) {
         |             ~~~  ^
   net/core/netdev_rx_queue.c:58:14: error: no member named 'peer' in 'struct netdev_rx_queue'
      58 |                 rxq = rxq->peer;
         |                       ~~~  ^
>> net/core/netdev_rx_queue.c:66:1: warning: no previous prototype for function 'netif_get_rx_queue_peer_locked' [-Wmissing-prototypes]
      66 | netif_get_rx_queue_peer_locked(struct net_device **dev, unsigned int *rxq_idx)
         | ^
   net/core/netdev_rx_queue.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | struct netdev_rx_queue *
         | ^
         | static 
>> net/core/netdev_rx_queue.c:81:6: warning: no previous prototype for function 'netif_put_rx_queue_peer_locked' [-Wmissing-prototypes]
      81 | void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
         |      ^
   net/core/netdev_rx_queue.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
         | ^
         | static 
   4 warnings and 2 errors generated.


vim +1135 net/core/netdev-genl.c

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
> 1254		netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
  1255	
> 1256		nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
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
