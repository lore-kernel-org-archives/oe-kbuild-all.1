Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792829466;
	b=LZ8ZoSE+NLxpPeQp/DOqa6oiEMV05i8C4fhgLwU3RLa5L5yU7xyuNPmFqMIysvRg4/42
	 HrA5Mvpbx3iFqQ+6nGW1i1djFqKyZvWCMkXBG9KbnGQzqCFLnXPSqpuz1WDZdQE0Y5f9d
	 /2e+ZJMntDYZ2oqYBeOzLMGawakl7MDAytjdDpjRbLDojo9qcfLljLSsvzF+Dy38ICXsw
	 rGmj7BzSuQvhqExyWznoTWIDIbwfK3S/KgCJgCqGdyCA8MzaOtMKMs5t4XK1cLlKsW5ro
	 oNRYOQVMcAOOOYA8RM+r2iqMCUCVKU1kaGrROHZdrQOGWbgyU6jtbr+AWTNDen+DZjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829466;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VY4JWphJxYaQ1TPQpA1poTDjf+sWvsDsKtikS5JAHmY=;
	b=M6bsyli/oJdsaT56Ft2vB+OisSodpidDqf8X15GXmpjg71mceSczOsF9s7bpCEj6CP7I
	 zFyh9s+xZmL9+FNWVd5rzUdc9jsHvfIzCr/4aSzYp46ZuhFJMBp+cryUUljSIL2AaLzDs
	 wJjAg+QeNxloR5TaKkxUeCHcbPrXFA8u59pnUpRQYo7WO3KqV6GsLAK4Wz7vvqJ3MXxAG
	 4mUzHo6hSiuUZxvPmYdQr+EFkRJgaWXa9zrzdjHsgbLx35ZJu9q6yupwxtLRpZ84HTPxs
	 LkSvsEv9IZIYrDth/Z8ny9FySNgzyBjTxlR6AtMPmJs1e198XP7GMHP1jGKg2MMQs1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lOqbc8Jz;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F1606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 08:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F31F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lOqbc8Jz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792829465; x=1824365465;
  h=date:from:to:cc:subject:message-id;
  bh=f+BmjiyN4nuSDwih5u86b02rk38kqZEcJM6rXeGFJzE=;
  b=lOqbc8JzOPOCcH4Rm470k2mPuvew3l8K7c5jRPDYV0uiwOKK4ZfEm2Fc
   TpMG5mMxiOVOVS5jUXki4YAjNBs1HhEYAIpe1kF69no+MAhKdQOnPgs+q
   fMI1NiyiFCZm1KXvXUI91UOafh3lGy+JEJrR34GlIYai/gJ52GS8KCKul
   LLH53Qp25vJ/jofqriggY3ue9/zcQB5yg+riHakKSOcPsA1yz/enpoe7W
   6g/pGApuWv0rn+4CZ8KOxnXNLj7KnDd/NzN24nnkZ5HwQinK7gUK+H5jH
   rF9XErU68ADXR4QWzmWCcIYvoKCEaCh5CJZTvz/o1r8IjUh6Uu7P+zzAW
   w==;
X-CSE-ConnectionGUID: M05fjatGTIeLQUgzg/49ew==
X-CSE-MsgGUID: PqJhOX3rTkOUX4vk1Fzz6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1581657"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1581657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 01:11:05 -0700
X-CSE-ConnectionGUID: +V0E63giT0mdP2L5IZAYvw==
X-CSE-MsgGUID: ja1ziW4tQceTYhcD+1srSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3845323"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2026 01:11:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKWqB-00000000The-3tNW;
	Sat, 24 Oct 2026 08:10:59 +0000
Date: Sat, 24 Oct 2026 16:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 include/linux/skbuff.h:5005:16: error: implicit declaration of function
 'skb_ext_exist'; did you mean 'skb_ext_reset'?
Message-ID: <202610241524.HMTc8Bv0-lkp@intel.com>
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
config: arm-randconfig-1002-20261020 (https://download.01.org/0day-ci/archive/20261024/202610241524.HMTc8Bv0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241524.HMTc8Bv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241524.HMTc8Bv0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/bpf-cgroup.h:11,
                    from net/socket.c:55:
   include/linux/skbuff.h: In function 'secpath_exists':
>> include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
>> include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/netfilter.h:6,
                    from net/netfilter/utils.c:3:
   include/linux/skbuff.h: In function 'secpath_exists':
>> include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
>> include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from include/net/tcp.h:45,
                    from include/linux/netfilter_ipv6.h:11,
                    from net/netfilter/utils.c:5:
   include/net/xfrm.h: In function 'secpath_reset':
>> include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/xfrm.h:9,
                    from net/xfrm/xfrm_replay.c:10:
   include/linux/skbuff.h: In function 'secpath_exists':
>> include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
>> include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_replay.c:10:
   include/net/xfrm.h: In function 'secpath_reset':
>> include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   In file included from include/net/xfrm.h:9,
                    from net/xfrm/xfrm_replay.c:10:
   include/linux/skbuff.h: In function 'skb_sec_path':
   include/linux/skbuff.h:5067:1: warning: control reaches end of non-void function [-Wreturn-type]
    5067 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_input.c:16:
   include/linux/skbuff.h: In function 'secpath_exists':
>> include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
>> include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_input.c:20:
   include/net/xfrm.h: In function 'secpath_reset':
>> include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   net/xfrm/xfrm_input.c: In function 'secpath_set':
>> net/xfrm/xfrm_input.c:122:55: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
     122 |         struct sec_path *sp, *tmp = skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                                       ^~~~~~~~~~~~~~~~
>> net/xfrm/xfrm_input.c:124:14: error: implicit declaration of function 'skb_ext_add'; did you mean 'skb_ext_del'? [-Werror=implicit-function-declaration]
     124 |         sp = skb_ext_add(skb, SKB_EXT_SEC_PATH);
         |              ^~~~~~~~~~~
         |              skb_ext_del
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_input.c:16:
   include/linux/skbuff.h: In function 'skb_sec_path':
   include/linux/skbuff.h:5067:1: warning: control reaches end of non-void function [-Wreturn-type]
    5067 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_output.c:10:
   include/linux/skbuff.h: In function 'secpath_exists':
>> include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
>> include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_output.c:19:
   include/net/xfrm.h: In function 'secpath_reset':
>> include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   net/xfrm/xfrm_output.c: In function 'xfrm4_tunnel_encap_add':
>> net/xfrm/xfrm_output.c:313:9: error: implicit declaration of function 'ip_select_ident'; did you mean 'ipv6_select_ident'? [-Werror=implicit-function-declaration]
     313 |         ip_select_ident(dev_net(dst->dev), skb, NULL);
         |         ^~~~~~~~~~~~~~~
         |         ipv6_select_ident
   net/xfrm/xfrm_output.c: In function 'xfrm4_tunnel_check_size':
>> net/xfrm/xfrm_output.c:841:49: error: implicit declaration of function 'ip_skb_dst_mtu' [-Werror=implicit-function-declaration]
     841 |              !skb_gso_validate_network_len(skb, ip_skb_dst_mtu(skb->sk, skb)))) {
         |                                                 ^~~~~~~~~~~~~~
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/xfrm/xfrm_output.c:10:
   include/linux/skbuff.h: In function 'skb_sec_path':
   include/linux/skbuff.h:5067:1: warning: control reaches end of non-void function [-Wreturn-type]
    5067 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/core/netpoll.c:17:
   include/linux/skbuff.h: In function 'secpath_exists':
>> include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
>> include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   In file included from include/net/tcp.h:45,
                    from net/core/netpoll.c:32:
   include/net/xfrm.h: In function 'secpath_reset':
>> include/net/xfrm.h:1179:26: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    1179 |         skb_ext_del(skb, SKB_EXT_SEC_PATH);
         |                          ^~~~~~~~~~~~~~~~
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/core/netpoll.c:17:
   include/linux/skbuff.h: In function 'secpath_exists':
   include/linux/skbuff.h:5009:1: warning: control reaches end of non-void function [-Wreturn-type]
    5009 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from net/wireless/wext-proc.c:23:
   include/linux/skbuff.h: In function 'secpath_exists':
>> include/linux/skbuff.h:5005:16: error: implicit declaration of function 'skb_ext_exist'; did you mean 'skb_ext_reset'? [-Werror=implicit-function-declaration]
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~~
         |                skb_ext_reset
>> include/linux/skbuff.h:5005:35: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5005 |         return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:5005:35: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_sec_path':
>> include/linux/skbuff.h:5063:16: error: implicit declaration of function 'skb_ext_find'; did you mean 'skb_ext_copy'? [-Werror=implicit-function-declaration]
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                ^~~~~~~~~~~~
         |                skb_ext_copy
   include/linux/skbuff.h:5063:34: error: 'SKB_EXT_SEC_PATH' undeclared (first use in this function)
    5063 |         return skb_ext_find(skb, SKB_EXT_SEC_PATH);
         |                                  ^~~~~~~~~~~~~~~~
   At top level:
   net/wireless/wext-proc.c:122:36: warning: 'wireless_seq_ops' defined but not used [-Wunused-const-variable=]
     122 | static const struct seq_operations wireless_seq_ops = {
         |                                    ^~~~~~~~~~~~~~~~
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


vim +5005 include/linux/skbuff.h

984bc16cc92ea3c James Morris          2006-06-09  5001  
7af8f4ca314a592 Florian Westphal      2018-12-18  5002  static inline int secpath_exists(const struct sk_buff *skb)
7af8f4ca314a592 Florian Westphal      2018-12-18  5003  {
7af8f4ca314a592 Florian Westphal      2018-12-18  5004  #ifdef CONFIG_XFRM
4165079ba328dd4 Florian Westphal      2018-12-18 @5005  	return skb_ext_exist(skb, SKB_EXT_SEC_PATH);
7af8f4ca314a592 Florian Westphal      2018-12-18  5006  #else
7af8f4ca314a592 Florian Westphal      2018-12-18  5007  	return 0;
7af8f4ca314a592 Florian Westphal      2018-12-18  5008  #endif
7af8f4ca314a592 Florian Westphal      2018-12-18  5009  }
7af8f4ca314a592 Florian Westphal      2018-12-18  5010  
574f7194f693cd8 Eric W. Biederman     2014-04-01  5011  static inline bool skb_irq_freeable(const struct sk_buff *skb)
574f7194f693cd8 Eric W. Biederman     2014-04-01  5012  {
574f7194f693cd8 Eric W. Biederman     2014-04-01  5013  	return !skb->destructor &&
7af8f4ca314a592 Florian Westphal      2018-12-18  5014  		!secpath_exists(skb) &&
cb9c68363efb6d1 Florian Westphal      2017-01-23  5015  		!skb_nfct(skb) &&
574f7194f693cd8 Eric W. Biederman     2014-04-01  5016  		!skb->_skb_refdst &&
574f7194f693cd8 Eric W. Biederman     2014-04-01  5017  		!skb_has_frag_list(skb);
574f7194f693cd8 Eric W. Biederman     2014-04-01  5018  }
574f7194f693cd8 Eric W. Biederman     2014-04-01  5019  
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5020  static inline void skb_set_queue_mapping(struct sk_buff *skb, u16 queue_mapping)
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5021  {
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5022  	skb->queue_mapping = queue_mapping;
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5023  }
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5024  
9247744e5eaa29a Stephen Hemminger     2009-03-21  5025  static inline u16 skb_get_queue_mapping(const struct sk_buff *skb)
4e3ab47a547616e Pavel Emelyanov       2007-10-21  5026  {
4e3ab47a547616e Pavel Emelyanov       2007-10-21  5027  	return skb->queue_mapping;
4e3ab47a547616e Pavel Emelyanov       2007-10-21  5028  }
4e3ab47a547616e Pavel Emelyanov       2007-10-21  5029  
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5030  static inline void skb_copy_queue_mapping(struct sk_buff *to, const struct sk_buff *from)
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5031  {
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5032  	to->queue_mapping = from->queue_mapping;
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5033  }
f25f4e44808f0f6 Peter P Waskiewicz Jr 2007-07-06  5034  
d5a9e24afb4ab38 David S. Miller       2009-01-27  5035  static inline void skb_record_rx_queue(struct sk_buff *skb, u16 rx_queue)
d5a9e24afb4ab38 David S. Miller       2009-01-27  5036  {
d5a9e24afb4ab38 David S. Miller       2009-01-27  5037  	skb->queue_mapping = rx_queue + 1;
d5a9e24afb4ab38 David S. Miller       2009-01-27  5038  }
d5a9e24afb4ab38 David S. Miller       2009-01-27  5039  
9247744e5eaa29a Stephen Hemminger     2009-03-21  5040  static inline u16 skb_get_rx_queue(const struct sk_buff *skb)
d5a9e24afb4ab38 David S. Miller       2009-01-27  5041  {
d5a9e24afb4ab38 David S. Miller       2009-01-27  5042  	return skb->queue_mapping - 1;
d5a9e24afb4ab38 David S. Miller       2009-01-27  5043  }
d5a9e24afb4ab38 David S. Miller       2009-01-27  5044  
9247744e5eaa29a Stephen Hemminger     2009-03-21  5045  static inline bool skb_rx_queue_recorded(const struct sk_buff *skb)
d5a9e24afb4ab38 David S. Miller       2009-01-27  5046  {
a02cec2155fbea4 Eric Dumazet          2010-09-22  5047  	return skb->queue_mapping != 0;
d5a9e24afb4ab38 David S. Miller       2009-01-27  5048  }
d5a9e24afb4ab38 David S. Miller       2009-01-27  5049  
4ff0620354f2b39 Julian Anastasov      2017-02-06  5050  static inline void skb_set_dst_pending_confirm(struct sk_buff *skb, u32 val)
4ff0620354f2b39 Julian Anastasov      2017-02-06  5051  {
4ff0620354f2b39 Julian Anastasov      2017-02-06  5052  	skb->dst_pending_confirm = val;
4ff0620354f2b39 Julian Anastasov      2017-02-06  5053  }
4ff0620354f2b39 Julian Anastasov      2017-02-06  5054  
4ff0620354f2b39 Julian Anastasov      2017-02-06  5055  static inline bool skb_get_dst_pending_confirm(const struct sk_buff *skb)
4ff0620354f2b39 Julian Anastasov      2017-02-06  5056  {
4ff0620354f2b39 Julian Anastasov      2017-02-06  5057  	return skb->dst_pending_confirm != 0;
4ff0620354f2b39 Julian Anastasov      2017-02-06  5058  }
4ff0620354f2b39 Julian Anastasov      2017-02-06  5059  
2294be0f11e22b6 Florian Westphal      2018-12-18  5060  static inline struct sec_path *skb_sec_path(const struct sk_buff *skb)
def8b4faff5ca34 Alexey Dobriyan       2008-10-28  5061  {
0b3d8e087bbee2a Denis Kirjanov        2013-10-02  5062  #ifdef CONFIG_XFRM
4165079ba328dd4 Florian Westphal      2018-12-18 @5063  	return skb_ext_find(skb, SKB_EXT_SEC_PATH);
def8b4faff5ca34 Alexey Dobriyan       2008-10-28  5064  #else
def8b4faff5ca34 Alexey Dobriyan       2008-10-28  5065  	return NULL;
def8b4faff5ca34 Alexey Dobriyan       2008-10-28  5066  #endif
0b3d8e087bbee2a Denis Kirjanov        2013-10-02  5067  }
def8b4faff5ca34 Alexey Dobriyan       2008-10-28  5068  

:::::: The code at line 5005 was first introduced by commit
:::::: 4165079ba328dd47262a2183049d3591f0a750b1 net: switch secpath to use skb extension infrastructure

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
