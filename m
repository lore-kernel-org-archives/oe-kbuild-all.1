Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6883A1A5BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwmmlKl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698411886; x=1729947886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZsIo1p4hmiusNC6zF5Q0ZXKjtBmqoBFQLoiGFahVW4=;
  b=TwmmlKl23TqIHXjKKNmas95Kk6+Ph1ZVczjl1iFG4rJRzPthb8l86ekw
   JIQy5Fueo7n1feB04J8O9QzgeK/bi2zZleQzAS076ZraCF1xj6QNC0DDA
   r9ORFPOqv4oFA2ncFPP4GAltsg0QXOp4O7nOJtZntK3fUfij5yex/pxff
   vlquseu6sOlIwVL9XEgEOVTBdD1iWuzxSutGsSbEtruA/dS1Z3QmT5ZI5
   /H2VgcaApQHC2mJsg4hh8H8aodTCswO/qZChXmjEVgZZwrnvcO2O/SqcT
   FitdRA7Un5k2S/i4RsALKRUb53ZuzY12cnccpx6C0sLUYq/JqpLvqkVXe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="386656240"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="386656240"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 06:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876332340"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="876332340"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2023 06:04:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwMVs-000ArO-1d;
	Fri, 27 Oct 2023 13:04:32 +0000
Date: Fri, 27 Oct 2023 21:04:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 18038/29903]
 include/trace/hooks/net.h:26:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202310272007.np0kadbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: 48b03352a3bd46c2aec1804fd36fc78b4270e3d0 [18038/29903] ANDROID: GKI: net: add vendor hooks for 'struct sock' lifecycle
config: x86_64-randconfig-122-20231027 (https://download.01.org/0day-ci/archive/20231027/202310272007.np0kadbV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310272007.np0kadbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310272007.np0kadbV-lkp@intel.com/

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
