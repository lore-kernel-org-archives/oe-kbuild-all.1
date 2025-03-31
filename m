Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA107E107
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414615; cv=none; b=GNr3tcjQm0A5QkZTclpv65HzpcfyhTFUxvnohy6lQRJMPE0K1emXyUGjsm6zfp/LcNfm9nRV4e1TtriIf5JdsRlp7mgvDo9xbK/0lriW1a4/WmyW/uQG3pkPlhNrk6WEyCamWwxkNxPIH8qF5EUaddBlRC45a8c0Xi8ODGIfvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414615; c=relaxed/simple;
	bh=SN5uDCZslbUkC7SAWIYyohvyqVW1+erxpSyEyEpMFNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KO7YPCBKOwsmJRlr9WIUvSWLp6utN4E8dTQxv7KLynkUB8oUdfGijuzxoRRgtXcc5JshokF0bqSAy0+m9EhF8io+J2YGiqriUjEDscznEaO4uYLF9+rFgrjkbXMoH8RfEUeaPRXirIbqHC30IWuv0ISWCRXtI08KeFLvYHU1AWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XykmlEFP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XykmlEFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743414613; x=1774950613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SN5uDCZslbUkC7SAWIYyohvyqVW1+erxpSyEyEpMFNQ=;
  b=XykmlEFP3ES1yRMhxpM6660v2tj5yum25ANMZDgXoA5ti65Bjuak3cr9
   WRC2j6hKruTQ4nsmisDSfhe2CWNAVRixHuN8lnqW131ZplOFds98oq7js
   XPTK7dRaOQRRSrEK92tyj9EZWmYFJQ7PrXOkS/2HMd4rhOHOK0v44biLk
   0TGgNj+FqZPXZ5RkA9If2NBBokjWlzSQeFqv06/kFL6gKt57wI0G+BLZ+
   NuWzUjWKWPK33NWJqqmo/lTAQjmPrYwdH6xSs6kVuRu8IRixKNkPCugCX
   T3fnKl4Z+uh0ViPaSWaCsqmLkw554jW6Rh0JIFFkj8Mwq9zQNvoxWxEdh
   Q==;
X-CSE-ConnectionGUID: TULCVM5tTY+n2AmEoeLmDQ==
X-CSE-MsgGUID: GT3BDgNORBWUu0Kt1Dcwgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43945944"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="43945944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 02:50:12 -0700
X-CSE-ConnectionGUID: 32bTkP6xS9GQyi9gpU3AiQ==
X-CSE-MsgGUID: C9bGVWIeSBeStz3lBLUocw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="131144801"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2025 02:50:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzBmT-00099u-0N;
	Mon, 31 Mar 2025 09:50:09 +0000
Date: Mon, 31 Mar 2025 17:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2829/2829]
 drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6057:62: sparse: sparse:
 incorrect type in argument 4 (different base types)
Message-ID: <202503311730.Gkig2fxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2d7a642a3b89c993676c887941944d0f932d2052
commit: abd5078bcd21063944ed133282ee3fafdc92092c [2829/2829] net: wangxun: fix resolving ipv6 pakets extension header errors
config: x86_64-randconfig-122-20250330 (https://download.01.org/0day-ci/archive/20250331/202503311730.Gkig2fxG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311730.Gkig2fxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311730.Gkig2fxG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:177:6: sparse: sparse: symbol 'txgbe_service_event_schedule' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:940:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] vlan_proto @@     got unsigned short [usertype] @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:940:40: sparse:     expected restricted __be16 [usertype] vlan_proto
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:940:40: sparse:     got unsigned short [usertype]
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2647:6: sparse: sparse: symbol 'txgbe_disable_tx_queue' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2792:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2792:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2792:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2796:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2796:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2796:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2807:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2807:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2807:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2811:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2811:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2811:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2873:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2873:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2873:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2928:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2928:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2928:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3336:5: sparse: sparse: symbol 'txgbe_add_cloud_switcher' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3351:5: sparse: sparse: symbol 'txgbe_del_cloud_switcher' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3671:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3671:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3671:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3701:6: sparse: sparse: symbol 'txgbe_configure_isb' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3715:6: sparse: sparse: symbol 'txgbe_configure_port' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3964:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3964:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3964:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4291:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4291:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4291:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4368:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4368:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4368:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4386:5: sparse: sparse: symbol 'txgbe_init_shared_code' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4476:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4476:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4476:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4905:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4905:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4905:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5037:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5037:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5037:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6047:40: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6057:62: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] *frag_offp @@     got unsigned short * @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6057:62: sparse:     expected restricted __be16 [usertype] *frag_offp
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6057:62: sparse:     got unsigned short *
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6075:36: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6079:67: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6089:32: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6090:36: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6094:67: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6108:37: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6119:61: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] *frag_offp @@     got unsigned short * @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6119:61: sparse:     expected restricted __be16 [usertype] *frag_offp
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6119:61: sparse:     got unsigned short *
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6136:40: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6148:61: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] *frag_offp @@     got unsigned short * @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6148:61: sparse:     expected restricted __be16 [usertype] *frag_offp
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6148:61: sparse:     got unsigned short *
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6292:62: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] *frag_offp @@     got unsigned short * @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6292:62: sparse:     expected restricted __be16 [usertype] *frag_offp
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6292:62: sparse:     got unsigned short *
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6388:70: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] *frag_offp @@     got unsigned short * @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6388:70: sparse:     expected restricted __be16 [usertype] *frag_offp
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6388:70: sparse:     got unsigned short *
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6448:61: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] *frag_offp @@     got unsigned short * @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6448:61: sparse:     expected restricted __be16 [usertype] *frag_offp
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6448:61: sparse:     got unsigned short *
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6774:33: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6774:33: sparse:    left side has type unsigned short
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6774:33: sparse:    right side has type restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6776:33: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6776:33: sparse:    left side has type unsigned short
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6776:33: sparse:    right side has type restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6778:38: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6779:25: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6779:25: sparse:    left side has type unsigned short
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6779:25: sparse:    right side has type restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6783:27: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6783:27: sparse:    left side has type unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6783:27: sparse:    right side has type restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6793:27: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6793:27: sparse:    left side has type unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6793:27: sparse:    right side has type restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6813:5: sparse: sparse: symbol 'txgbe_skb_pad_nonzero' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6855:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] protocol @@     got restricted __be16 [usertype] protocol @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6855:30: sparse:     expected unsigned short [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6855:30: sparse:     got restricted __be16 [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6902:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] protocol @@     got restricted __be16 [usertype] h_vlan_encapsulated_proto @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6902:26: sparse:     expected unsigned short [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6902:26: sparse:     got restricted __be16 [usertype] h_vlan_encapsulated_proto
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6903:29: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6915:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] protocol @@     got restricted __be16 [usertype] h_vlan_encapsulated_proto @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6915:26: sparse:     expected unsigned short [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6915:26: sparse:     got restricted __be16 [usertype] h_vlan_encapsulated_proto
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6948:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] h_vlan_TCI @@     got unsigned short [usertype] @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6948:42: sparse:     expected restricted __be16 [usertype] h_vlan_TCI
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6948:42: sparse:     got unsigned short [usertype]
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7327:23: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7393:46: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7395:37: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7403:47: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7405:37: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7497:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] type @@     got restricted __be16 [usertype] protocol @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7497:26: sparse:     expected unsigned short [usertype] type
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7497:26: sparse:     got restricted __be16 [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7513:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] type @@     got restricted __be16 [usertype] h_vlan_encapsulated_proto @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7513:22: sparse:     expected unsigned short [usertype] type
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7513:22: sparse:     got restricted __be16 [usertype] h_vlan_encapsulated_proto
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7540:35: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *ndo_vlan_rx_add_vid )( ... ) @@     got int ( * )( ... ) @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7540:35: sparse:     expected int ( *ndo_vlan_rx_add_vid )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7540:35: sparse:     got int ( * )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7541:35: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *ndo_vlan_rx_kill_vid )( ... ) @@     got int ( * )( ... ) @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7541:35: sparse:     expected int ( *ndo_vlan_rx_kill_vid )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7541:35: sparse:     got int ( * )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7698:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7698:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7698:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7901:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7901:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7901:17: sparse:    int

vim +6057 drivers/net/ethernet/netswift/txgbe/txgbe_main.c

  6030	
  6031	static txgbe_dptype encode_tx_desc_ptype(const struct txgbe_tx_buffer *first)
  6032	{
  6033		struct sk_buff *skb = first->skb;
  6034		u8 tun_prot = 0;
  6035		u8 l4_prot = 0;
  6036		u8 ptype = 0;
  6037		unsigned char *exthdr;
  6038		unsigned char *l4_hdr;
  6039		__be16 frag_off;
  6040	
  6041		if (skb->encapsulation) {
  6042			union network_header hdr;
  6043	
  6044			switch (first->protocol) {
  6045			case __constant_htons(ETH_P_IP):
  6046				tun_prot = ip_hdr(skb)->protocol;
  6047				if (ip_hdr(skb)->frag_off & htons(IP_MF | IP_OFFSET))
  6048					goto encap_frag;
  6049				ptype = TXGBE_PTYPE_TUN_IPV4;
  6050				break;
  6051			case __constant_htons(ETH_P_IPV6):
  6052				l4_hdr = skb_transport_header(skb);
  6053				exthdr = skb_network_header(skb) + sizeof(struct ipv6hdr);
  6054				tun_prot = ipv6_hdr(skb)->nexthdr;
  6055				if (l4_hdr != exthdr)
  6056					ipv6_skip_exthdr(skb, exthdr - skb->data,
> 6057							 &tun_prot, &frag_off);
  6058				if (tun_prot == NEXTHDR_FRAGMENT)
  6059					goto encap_frag;
  6060				ptype = TXGBE_PTYPE_TUN_IPV6;
  6061				break;
  6062			default:
  6063				goto exit;
  6064			}
  6065	
  6066			if (tun_prot == IPPROTO_IPIP ||
  6067			    tun_prot == IPPROTO_IPV6) {
  6068				hdr.raw = (void *)inner_ip_hdr(skb);
  6069				ptype |= TXGBE_PTYPE_PKT_IPIP;
  6070			} else if (tun_prot == IPPROTO_UDP) {
  6071				hdr.raw = (void *)inner_ip_hdr(skb);
  6072				/* fixme: VXLAN-GPE neither ETHER nor IP */
  6073	
  6074				if (skb->inner_protocol_type != ENCAP_TYPE_ETHER ||
  6075					skb->inner_protocol != htons(ETH_P_TEB)) {
  6076					ptype |= TXGBE_PTYPE_PKT_IG;
  6077				} else {
  6078					if (((struct ethhdr *)
  6079						skb_inner_mac_header(skb))->h_proto
  6080						== htons(ETH_P_8021Q)) {
  6081						ptype |= TXGBE_PTYPE_PKT_IGMV;
  6082					} else {
  6083						ptype |= TXGBE_PTYPE_PKT_IGM;
  6084					}
  6085				}
  6086	
  6087			} else if (tun_prot == IPPROTO_GRE) {
  6088				hdr.raw = (void *)inner_ip_hdr(skb);
  6089				if (skb->inner_protocol ==  htons(ETH_P_IP) ||
  6090					skb->inner_protocol ==  htons(ETH_P_IPV6)) {
  6091					ptype |= TXGBE_PTYPE_PKT_IG;
  6092				} else {
  6093					if (((struct ethhdr *)
  6094						skb_inner_mac_header(skb))->h_proto
  6095						== htons(ETH_P_8021Q)) {
  6096						ptype |= TXGBE_PTYPE_PKT_IGMV;
  6097					} else {
  6098						ptype |= TXGBE_PTYPE_PKT_IGM;
  6099					}
  6100				}
  6101			} else {
  6102				goto exit;
  6103			}
  6104	
  6105			switch (hdr.ipv4->version) {
  6106			case IPVERSION:
  6107				l4_prot = hdr.ipv4->protocol;
  6108				if (hdr.ipv4->frag_off & htons(IP_MF | IP_OFFSET)) {
  6109					ptype |= TXGBE_PTYPE_TYP_IPFRAG;
  6110					goto exit;
  6111				}
  6112				break;
  6113			case 6:
  6114				l4_hdr = skb_inner_transport_header(skb);
  6115				exthdr = skb_inner_network_header(skb) + sizeof(struct ipv6hdr);
  6116				l4_prot = inner_ipv6_hdr(skb)->nexthdr;
  6117				if (l4_hdr != exthdr)
  6118					ipv6_skip_exthdr(skb, exthdr - skb->data,
  6119							 &l4_prot, &frag_off);
  6120				ptype |= TXGBE_PTYPE_PKT_IPV6;
  6121				if (l4_prot == NEXTHDR_FRAGMENT) {
  6122					ptype |= TXGBE_PTYPE_TYP_IPFRAG;
  6123					goto exit;
  6124				}
  6125				break;
  6126			default:
  6127				goto exit;
  6128			}
  6129		} else {
  6130	encap_frag:
  6131	
  6132			switch (first->protocol) {
  6133			case __constant_htons(ETH_P_IP):
  6134				l4_prot = ip_hdr(skb)->protocol;
  6135				ptype = TXGBE_PTYPE_PKT_IP;
  6136				if (ip_hdr(skb)->frag_off & htons(IP_MF | IP_OFFSET)) {
  6137					ptype |= TXGBE_PTYPE_TYP_IPFRAG;
  6138					goto exit;
  6139				}
  6140				break;
  6141	#ifdef NETIF_F_IPV6_CSUM
  6142			case __constant_htons(ETH_P_IPV6):
  6143				l4_hdr = skb_transport_header(skb);
  6144				exthdr = skb_network_header(skb) + sizeof(struct ipv6hdr);
  6145				l4_prot = ipv6_hdr(skb)->nexthdr;
  6146				if (l4_hdr != exthdr)
  6147					ipv6_skip_exthdr(skb, exthdr - skb->data,
  6148							 &l4_prot, &frag_off);
  6149	
  6150				ptype = TXGBE_PTYPE_PKT_IP | TXGBE_PTYPE_PKT_IPV6;
  6151				if (l4_prot == NEXTHDR_FRAGMENT) {
  6152					ptype |= TXGBE_PTYPE_TYP_IPFRAG;
  6153					goto exit;
  6154				}
  6155				break;
  6156	#endif /* NETIF_F_IPV6_CSUM */
  6157			case __constant_htons(ETH_P_1588):
  6158				ptype = TXGBE_PTYPE_L2_TS;
  6159				goto exit;
  6160			case __constant_htons(ETH_P_FIP):
  6161				ptype = TXGBE_PTYPE_L2_FIP;
  6162				goto exit;
  6163			case __constant_htons(TXGBE_ETH_P_LLDP):
  6164				ptype = TXGBE_PTYPE_L2_LLDP;
  6165				goto exit;
  6166			case __constant_htons(TXGBE_ETH_P_CNM):
  6167				ptype = TXGBE_PTYPE_L2_CNM;
  6168				goto exit;
  6169			case __constant_htons(ETH_P_PAE):
  6170				ptype = TXGBE_PTYPE_L2_EAPOL;
  6171				goto exit;
  6172			case __constant_htons(ETH_P_ARP):
  6173				ptype = TXGBE_PTYPE_L2_ARP;
  6174				goto exit;
  6175			default:
  6176				ptype = TXGBE_PTYPE_L2_MAC;
  6177				goto exit;
  6178			}
  6179	
  6180		}
  6181	
  6182		switch (l4_prot) {
  6183		case IPPROTO_TCP:
  6184			ptype |= TXGBE_PTYPE_TYP_TCP;
  6185			break;
  6186		case IPPROTO_UDP:
  6187			ptype |= TXGBE_PTYPE_TYP_UDP;
  6188			break;
  6189		case IPPROTO_SCTP:
  6190			ptype |= TXGBE_PTYPE_TYP_SCTP;
  6191			break;
  6192		default:
  6193			ptype |= TXGBE_PTYPE_TYP_IP;
  6194			break;
  6195		}
  6196	
  6197	exit:
  6198		return txgbe_decode_ptype(ptype);
  6199	}
  6200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
