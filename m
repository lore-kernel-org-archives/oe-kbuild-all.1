Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819016;
	b=jsf10fhUwF7j0Dy5/5Eq47fESFB3H52pQqAy7Rr4KlZ0fQwwwtz5IvPO/flNc5dUKHpK
	 vpkTitCKvEqRsoA1kveDlxm7HnXxos6YMPu7DM5j8WF8gzeJ/EW6DqFFTuh08+aR83DDY
	 Gb9U2YE0BjQPzkunArhY6Zl9cYWPNJRSdiYACzMgDZxWibVK8OtCezD55tZHCcvVDMzlB
	 WCq37+h0qzQe+yYzy7gLT28fXQ5rSAtWNJqhkvaClxw82G+5SUTwhm/xD87wrk7tFSg2W
	 A2v/dPJOcrSYp/G5Li/bpOkKfcdDOdnfFTJ8XHZqf/0aiShRXiNDDEiX4hTcP1sHsEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819016;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SIXTyF0Oz8+Gz9Yqr/A7azLvLEZ2lNbF1I1pKmdAJH0=;
	b=oK+0xtaXEEsDkmE7DAHor+JZmTtbEiC5gntFjjRCJu9QJT5prsyrYaUXtCVynSp7KVRi
	 SOmaO446CylHfpM7m7XE477Fniz1TRlj+S1ZNdSi6ZFpP5KkWjVU49WZqUHGj4Izjsnsf
	 eKiX/7W6u+Otyeb3DEVipuYzn0d6SqbeEK02UXCXKTwaiSLItHVHx/Pl3la/+er02AQyQ
	 APc8HoXzjBSFt5t5gq6AV50t6mpNiOmgIBKcx0gqSIsuMxoHSyt7YlK8wVN60DhT1bCun
	 sM9vYkLngQwBdqolm1kn/tAli/b7fEVZf9kyH8COPrz8u2NWvw+6syJxZs1nXnOETRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VZGXBBt0;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2054A606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 05:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2054A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VZGXBBt0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792819015; x=1824355015;
  h=date:from:to:cc:subject:message-id;
  bh=SPWjWzGb//z8dHpBbczo3BQXMkVGEcO/au5RMuUkTnU=;
  b=VZGXBBt023Qna/1gqoxQiHx5UzYdte7bus3TBmKgQkP+hpRrxGsTYJj9
   up1S4ovaVc5a5XlVQiyjlx9/el2oF0KBlio2XU5IhP3zWk9biPbDbuM/p
   x8wFBOXXxJhAYpMvf52LSgfJF4TdvzzalP2pkjQQeF9e6ofX8mLUmQXEq
   KF99oC1NVDSYurnFLX1AVlKIcqcxu91MnxbxmyEciLOWlr/IJJiZWpkVF
   ExLUB9OMpZeE1ORcdJVqB/8nIYJsOOKt17Ok84tFp0b9bZHkLK3el2CCJ
   OsBkmMuBa8gJqVLbUh9jxpAltsYmvHL07yx5536wsEFYJ85YH+YSiYwf8
   g==;
X-CSE-ConnectionGUID: R/E3cUrxT4iJP437/RekNg==
X-CSE-MsgGUID: /qFd9RHgRMajZHPfph2X1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1576056"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1576056"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 22:16:55 -0700
X-CSE-ConnectionGUID: rxfZbkk7RtGAPJ+DPdKiSQ==
X-CSE-MsgGUID: /HP/StVcRUeajD8Z9/1tZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3817598"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2026 22:16:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKU7e-00000000TbY-3d2J;
	Sat, 24 Oct 2026 05:16:50 +0000
Date: Sat, 24 Oct 2026 13:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 include/linux/skbuff.h:5067:1: warning: control reaches end of non-void
 function
Message-ID: <202610241313.lzRTTVmS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1c132d615b94090d2788af4407b21c6d319731e2
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [1/1] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
config: arm-randconfig-1002-20261020 (https://download.01.org/0day-ci/archive/20261024/202610241313.lzRTTVmS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241313.lzRTTVmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241313.lzRTTVmS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/xfrm.h:9,
                    from net/xfrm/xfrm_replay.c:10:
   include/linux/skbuff.h: In function 'secpath_exists':
   include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
   include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
   include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_replay.c:10:
   include/net/xfrm.h: In function 'secpath_reset':
   include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   In file included from include/net/xfrm.h:9,
                    from net/xfrm/xfrm_replay.c:10:
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5067:1: warning: control reaches end of non-void function [-Wreturn-type]
    5067 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_input.c:16:
   include/linux/skbuff.h: In function 'secpath_exists':
   include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
   include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
   include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_input.c:20:
   include/net/xfrm.h: In function 'secpath_reset':
   include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   net/xfrm/xfrm_input.c: In function 'secpath_set':
   net/xfrm/xfrm_input.c:122:55: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
     122 |         struct sec_path *sp, *tmp = skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                                       ^~~~~~~~~~~~~~~~
   net/xfrm/xfrm_input.c:124:14: error: implicit declaration of function 'skb_ext_add'; did you mean 'skb_ext_del'? [-Werror=implicit-function-declaration]
     124 |         sp = skb_ext_add(skb, SKB_EXT_SEC_PATH);
         |              ^~~~~~~~~~~
         |              skb_ext_del
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_input.c:16:
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5067:1: warning: control reaches end of non-void function [-Wreturn-type]
    5067 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_output.c:10:
   include/linux/skbuff.h: In function 'secpath_exists':
   include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
   include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
   include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_output.c:19:
   include/net/xfrm.h: In function 'secpath_reset':
   include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   net/xfrm/xfrm_output.c: In function 'xfrm4_tunnel_encap_add':
   net/xfrm/xfrm_output.c:313:9: error: implicit declaration of function 'ip_select_ident'; did you mean 'ipv6_select_ident'? [-Werror=implicit-function-declaration]
     313 |         ip_select_ident(dev_net(dst->dev), skb, NULL);
         |         ^~~~~~~~~~~~~~~
         |         ipv6_select_ident
   net/xfrm/xfrm_output.c: In function 'xfrm4_tunnel_check_size':
   net/xfrm/xfrm_output.c:841:49: error: implicit declaration of function 'ip_skb_dst_mtu' [-Werror=implicit-function-declaration]
     841 |              !skb_gso_validate_network_len(skb, ip_skb_dst_mtu(skb->sk, skb)))) {
         |                                                 ^~~~~~~~~~~~~~
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_output.c:10:
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5067:1: warning: control reaches end of non-void function [-Wreturn-type]
    5067 | }
         | ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for XFRM
   Depends on [n]: NET [=y] && INET [=n]
   Selected by [y]:
   - XFRM_ALGO [=y] && NET [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +5067 include/linux/skbuff.h

4ff0620354f2b3 Julian Anastasov 2017-02-06  5059  
2294be0f11e22b Florian Westphal 2018-12-18  5060  static inline struct sec_path *skb_sec_path(const struct sk_buff *skb)
def8b4faff5ca3 Alexey Dobriyan  2008-10-28  5061  {
0b3d8e087bbee2 Denis Kirjanov   2013-10-02  5062  #ifdef CONFIG_XFRM
4165079ba328dd Florian Westphal 2018-12-18  5063  	return skb_ext_find(skb, SKB_EXT_SEC_PATH);
def8b4faff5ca3 Alexey Dobriyan  2008-10-28  5064  #else
def8b4faff5ca3 Alexey Dobriyan  2008-10-28  5065  	return NULL;
def8b4faff5ca3 Alexey Dobriyan  2008-10-28  5066  #endif
0b3d8e087bbee2 Denis Kirjanov   2013-10-02 @5067  }
def8b4faff5ca3 Alexey Dobriyan  2008-10-28  5068  

:::::: The code at line 5067 was first introduced by commit
:::::: 0b3d8e087bbee2a4e3f479d538a7edd3f1d2950c include/linux/skbuff.h: move CONFIG_XFRM check inside the skb_sec_path()

:::::: TO: Denis Kirjanov <kda@linux-powerpc.org>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
