Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164994;
	b=EgmNgpuOtLOL4GVYO/KyIZM9aXQTgWP4fue+h2z8CihOsKa+mjR0cd2uYQe3s15d+OkZ
	 EccUtnnQGokbDd9CDTea86zXJgmKNqUHJkR/La4ykw8Zw8qYlMe25zOkTEtfYNFRXlT5j
	 gnqEIGw5OT0ZBSfjbU92wdY+Deo6WsHJfZ35yPRSEEnSLUXlAuZdyrXSFJet5Kuy7qttw
	 bIDbo7iaQ/j40o8S8VFgh0rycJ806u0Wutn6QoXIuhp9QNznt7kTXeDbf923gHCDrXA2S
	 GffgOPZUy0WsZhkyxylEGf8VbKenUeMQhsdsJgw6YFCbJh+XG6MmdL2u+dxxYyTeTWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164994;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=5XC8Y9tG3BXpSQK71vOn5x4+Q0Mc8gUkz67PXXqyG2c=;
	b=cH6c+iwaQrtxWxtNRLFNDInDKVj1jU2pxW725aiCzC78BNUk95N7rwDcqMrMpkujX6KW
	 Q8NMsVl7bs9JEpEd78SvW75TzsLu4fWsRxBEYYflx6KXwJqlwrp6t6x3vIVHMF51Y7KNg
	 DohpCn0W6o7CFj+eZp9yW7v+zVaI99s8GyVKwDUMYdd0kju1oX0vB/BFqw4RwbDtDa+h5
	 7PhSMziuXPoAt0uuz3D4PVZiFVPefqXgjBiFvcvu8lC4vqdOMiqL8AfsBkrdNK/798t3g
	 sCplm4oMSgF08iBR7ru5y483spel1GwKhaR22wkRItBlFVeTVRVUJqX68Bt4EpHfUiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5XvvQXf;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E48C606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 08:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E48C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5XvvQXf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795164993; x=1826700993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Bzfr/2KmfrLMO6x8XSKGNkXnIDHqwye9E8mf+MMs+I=;
  b=S5XvvQXf9RtjJYd3B36Ndmg0PvQjv94CCAZmU45YEw18IHvQOLBK9N6h
   H/jhWbr4cgXLscxZs/E9vcxWTLWxtw0ywZKqj87UFRp/Fp5Q+Xrmw+HNF
   15JXRNjbwwACZ6HVYhyy8mGQKuLL7o2cxAsyL5sL/dQqgJzzM6NJODz/d
   /4TUd7fJO+ZhcX8JvE1aE7TYt9ftwC5p4sx+U8hzqHqcSoAPLnsBrfJML
   lNSX24TI3NKEgmn5ISp0qqpxmiciXwohGUGGCDPybLtKZTEuEqQW+vva8
   pr/TU1DHExyh+dKxqDMVmmapdKYNh50kXevifkyiMtwp6GbCnp+UAU8GC
   Q==;
X-CSE-ConnectionGUID: frNNCoPcSsKn1GSUmntSyA==
X-CSE-MsgGUID: OP6GLLGlRjmHRgW3YZm1aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4047158"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4047158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:56:32 -0800
X-CSE-ConnectionGUID: Z8uhc60sSCCJvE5ZYWkjBw==
X-CSE-MsgGUID: CEpJcVYeT4+XAmXtJyRlVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11084544"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2026 00:56:30 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUKQ0-00000000401-1ROK;
	Fri, 20 Nov 2026 08:56:28 +0000
Date: Fri, 20 Nov 2026 09:55:44 +0100
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 33/133]
 drivers/net/wireless/realtek/rtl8xxxu/core.c:2774:38: warning: variable 'vop'
 set but not used
Message-ID: <20261120095129.SQqNDLGR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   f2fe901fe0cb5952494ce713de8f894d013f3603
commit: 97d18fe2b2ef830a77c1080b81ef616053e88200 [33/133] rtl81xxx: Hack in SDIO.
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261120/20261120095129.SQqNDLGR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120095129.SQqNDLGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120095129.SQqNDLGR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtl8xxxu/core.c: In function 'rtl8xxxu_init_queue_priority':
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2774:38: warning: variable 'vop' set but not used [-Wunused-but-set-variable]
    2774 |         int hip, mgp, bkp, bep, vip, vop;
         |                                      ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2774:33: warning: variable 'vip' set but not used [-Wunused-but-set-variable]
    2774 |         int hip, mgp, bkp, bep, vip, vop;
         |                                 ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2774:28: warning: variable 'bep' set but not used [-Wunused-but-set-variable]
    2774 |         int hip, mgp, bkp, bep, vip, vop;
         |                            ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2774:23: warning: variable 'bkp' set but not used [-Wunused-but-set-variable]
    2774 |         int hip, mgp, bkp, bep, vip, vop;
         |                       ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2774:18: warning: variable 'mgp' set but not used [-Wunused-but-set-variable]
    2774 |         int hip, mgp, bkp, bep, vip, vop;
         |                  ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2774:13: warning: variable 'hip' set but not used [-Wunused-but-set-variable]
    2774 |         int hip, mgp, bkp, bep, vip, vop;
         |             ^~~


vim +/vop +2774 drivers/net/wireless/realtek/rtl8xxxu/core.c

74b99bed874f5a1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2016-02-29  2769  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2770  static int rtl8xxxu_init_queue_priority(struct rtl8xxxu_priv *priv)
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2771  {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2772  	u16 val16, hi, lo;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2773  	u16 hiq, mgq, bkq, beq, viq, voq;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14 @2774  	int hip, mgp, bkp, bep, vip, vop;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2775  	int ret = 0;
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2776  	u32 val32;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2777  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2778  	switch (priv->ep_tx_count) {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2779  	case 1:
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2780  		if (priv->ep_tx_high_queue) {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2781  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2782  		} else if (priv->ep_tx_low_queue) {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2783  			hi = TRXDMA_QUEUE_LOW;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2784  		} else if (priv->ep_tx_normal_queue) {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2785  			hi = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2786  		} else {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2787  			hi = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2788  			ret = -EINVAL;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2789  		}
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2790  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2791  		hiq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2792  		mgq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2793  		bkq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2794  		beq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2795  		viq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2796  		voq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2797  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2798  		hip = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2799  		mgp = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2800  		bkp = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2801  		bep = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2802  		vip = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2803  		vop = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2804  		break;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2805  	case 2:
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2806  		if (priv->ep_tx_high_queue && priv->ep_tx_low_queue) {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2807  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2808  			lo = TRXDMA_QUEUE_LOW;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2809  		} else if (priv->ep_tx_normal_queue && priv->ep_tx_low_queue) {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2810  			hi = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2811  			lo = TRXDMA_QUEUE_LOW;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2812  		} else if (priv->ep_tx_high_queue && priv->ep_tx_normal_queue) {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2813  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2814  			lo = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2815  		} else {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2816  			ret = -EINVAL;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2817  			hi = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2818  			lo = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2819  		}
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2820  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2821  		hiq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2822  		mgq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2823  		bkq = lo;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2824  		beq = lo;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2825  		viq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2826  		voq = hi;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2827  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2828  		hip = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2829  		mgp = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2830  		bkp = 1;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2831  		bep = 1;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2832  		vip = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2833  		vop = 0;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2834  		break;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2835  	case 3:
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2836  		beq = TRXDMA_QUEUE_LOW;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2837  		bkq = TRXDMA_QUEUE_LOW;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2838  		viq = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2839  		voq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2840  		mgq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2841  		hiq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2842  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2843  		hip = hiq ^ 3;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2844  		mgp = mgq ^ 3;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2845  		bkp = bkq ^ 3;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2846  		bep = beq ^ 3;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2847  		vip = viq ^ 3;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2848  		vop = viq ^ 3;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2849  		break;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2850  	default:
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2851  		ret = -EINVAL;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2852  	}
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2853  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2854  	/*
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2855  	 * None of the vendor drivers are configuring the beacon
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2856  	 * queue here .... why?
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2857  	 */
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2858  	if (!ret) {
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2859  		/* Only RTL8192F seems to do it like this. */
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2860  		if (priv->rtl_chip == RTL8192F) {
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2861  			val32 = rtl8xxxu_read32(priv, REG_TRXDMA_CTRL);
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2862  			val32 &= 0x7;
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2863  			val32 |= (voq << TRXDMA_CTRL_VOQ_SHIFT_8192F) |
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2864  				 (viq << TRXDMA_CTRL_VIQ_SHIFT_8192F) |
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2865  				 (beq << TRXDMA_CTRL_BEQ_SHIFT_8192F) |
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2866  				 (bkq << TRXDMA_CTRL_BKQ_SHIFT_8192F) |
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2867  				 (mgq << TRXDMA_CTRL_MGQ_SHIFT_8192F) |
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2868  				 (hiq << TRXDMA_CTRL_HIQ_SHIFT_8192F);
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2869  			rtl8xxxu_write32(priv, REG_TRXDMA_CTRL, val32);
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2870  		} else {
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2871  			val16 = rtl8xxxu_read16(priv, REG_TRXDMA_CTRL);
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2872  			val16 &= 0x7;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2873  			val16 |= (voq << TRXDMA_CTRL_VOQ_SHIFT) |
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2874  				 (viq << TRXDMA_CTRL_VIQ_SHIFT) |
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2875  				 (beq << TRXDMA_CTRL_BEQ_SHIFT) |
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2876  				 (bkq << TRXDMA_CTRL_BKQ_SHIFT) |
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2877  				 (mgq << TRXDMA_CTRL_MGQ_SHIFT) |
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2878  				 (hiq << TRXDMA_CTRL_HIQ_SHIFT);
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2879  			rtl8xxxu_write16(priv, REG_TRXDMA_CTRL, val16);
c98411dc8cf6c15 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2880  		}
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2881  	}
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2882  
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2883  	return ret;
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2884  }
26f1fad29ad973b drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2885  

:::::: The code at line 2774 was first introduced by commit
:::::: 26f1fad29ad973b0fb26a9ca3dcb2a73dde781aa New driver: rtl8xxxu (mac80211)

:::::: TO: Jes Sorensen <Jes.Sorensen@redhat.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
