Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC97171B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687354937; x=1718890937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U1yHnpMVn6kBBWsPMNDBne8qgNBQqXGPQxotH9TyQro=;
  b=WqB3WKAUX+sdSJxGWDuCuESvp4OClzrJEZN8ERDK0v16no5miXKCrgbr
   W8NcmNAoOxZCfT8XPFecQTLubgV24Usgv4z2l/mZkYpI9kXn3ipvQEn46
   +t+hOj0e62b7G4W9RU7NsUr5qIZULMO0ZXKgiTwBjuI40uOsmy6Fzxp5O
   VTLkN+ZmdifOySaIfF7aodeNXwEg/1BlZXRjU7JUV1kJ2keu0drrHYEv+
   ecn4Hw4HLHfrNv/3WXcEV489AjMKEskRYdyPDpAffPKGnXYI4a8zb5SGM
   Xj3wldRMDw5TVC493q+r/1aCMKu3H3rIp/H46HQkRCY9GCvDx3Obdj7A/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="359044222"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="359044222"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 06:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784503124"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="784503124"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2023 06:42:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBy63-0006rV-2T;
	Wed, 21 Jun 2023 13:42:07 +0000
Date: Wed, 21 Jun 2023 21:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 18038/27779]
 include/trace/hooks/net.h:26:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202306212118.IyNw9Z2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   29b74661c49e8dd78b13878e23f6e20910e52e39
commit: 48b03352a3bd46c2aec1804fd36fc78b4270e3d0 [18038/27779] ANDROID: GKI: net: add vendor hooks for 'struct sock' lifecycle
config: i386-randconfig-s003-20230620 (https://download.01.org/0day-ci/archive/20230621/202306212118.IyNw9Z2c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212118.IyNw9Z2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306212118.IyNw9Z2c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/sock.c: note: in included file:
>> include/trace/hooks/net.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/net.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:26:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/net.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/net.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:28:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/net.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/net.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:28:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   net/core/sock.c:1910:9: sparse: sparse: context imbalance in 'sk_clone_lock' - wrong count at exit
   net/core/sock.c:1914:6: sparse: sparse: context imbalance in 'sk_free_unlock_clone' - unexpected unlock
   net/core/sock.c:3003:6: sparse: sparse: context imbalance in 'lock_sock_fast' - different lock contexts for basic block
   net/core/sock.c:3502:13: sparse: sparse: context imbalance in 'proto_seq_start' - wrong count at exit
   net/core/sock.c:3514:13: sparse: sparse: context imbalance in 'proto_seq_stop' - wrong count at exit

vim +26 include/trace/hooks/net.h

    11	
    12	struct packet_type;
    13	struct list_head;
    14	struct sk_buff;
    15	struct nf_conn;
    16	struct sock;
    17	DECLARE_HOOK(android_vh_ptype_head,
    18		TP_PROTO(const struct packet_type *pt, struct list_head *vendor_pt),
    19		TP_ARGS(pt, vendor_pt));
    20	DECLARE_HOOK(android_vh_kfree_skb,
    21		TP_PROTO(struct sk_buff *skb), TP_ARGS(skb));
    22	DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_alloc,
    23		TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
    24	DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_free,
    25		TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
  > 26	DECLARE_RESTRICTED_HOOK(android_rvh_sk_alloc,
    27		TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
    28	DECLARE_RESTRICTED_HOOK(android_rvh_sk_free,
    29		TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
