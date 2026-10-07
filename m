Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA04E5329
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400822; cv=none; b=DjOBFZP8uRNQEiX06y0nLfYmSVbSOcHQbuViJ6fn3PHM0vkHAmkSPniMYBIctd3i6r9jmosZ9IJLMSPA8HULH9BTD4m79+IdpvH6TX8H8zpLKdormwjVLXSSB1KCC3/FrM+NveFElBB/nx8i4wr9e+AaK6k0cW1FstVUGD3ju0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400822; c=relaxed/simple;
	bh=rYh8In9gixPi2HGwUrNj34SvJvAT2vc2FgxovexQ5Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S/r4AyRYOuT4CiJifM15pfMZiJweVzIQ4WEsiXMN1Hc0SxSlMj/Fk9JlbkFCucadV3ZColS+iCYCLF5B94KBoTiov3Bsl+Ud6LmfjxF/NzkFwciV/cPx7fpy8jI2aQ5aSf6hk05/+Lsx8UCZhsH4zghNnfvkre8rb+PjmWd0Bl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrXnPYL/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrXnPYL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791400815; x=1822936815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rYh8In9gixPi2HGwUrNj34SvJvAT2vc2FgxovexQ5Qw=;
  b=mrXnPYL/vL/HfdL1pf16HqR2/JKaI6nEWrnjJiNGKxP5ahoNIdxQTdBW
   qoftUrBPAbFJocT9tbMlmIOL//IU+cra5+y9lp2yarKL+WOZLAbPhD9Hg
   QsQ35Q5GXXqzWW9khlJURBgnp4X3+zwixec1F9W+0SU7Zfy6/xzBgRq5B
   B4cVnW28YipMZ0da3whtjYRxWT6kX4Q2GXDJJWFiwPARDwSIHRY17Vwbw
   +20ZMXqlwG6AVjMH70HxfByBuZpRA2s/yvPOUr+PGjDt1JnVUepTezLwt
   znSh8fEo73YPK2j2r8Gp4x69gu0hdt3Her0FkzpYVcZKt8XPckNhUa0UN
   g==;
X-CSE-ConnectionGUID: Jp6572qqSXquJ4/WYP78sw==
X-CSE-MsgGUID: RG5UAQ+/RhKqpqAa4pbSUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="182419"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="182419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 12:20:14 -0700
X-CSE-ConnectionGUID: dm49ma5zTPygHV/pWRIzvA==
X-CSE-MsgGUID: z9J8t+u8QZSpEBlvXerGaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="233465"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Oct 2026 12:20:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEXBS-000000003S8-30NK;
	Wed, 07 Oct 2026 19:20:10 +0000
Date: Thu, 08 Oct 2026 03:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 43/142]
 drivers/net/wireless/realtek/rtl8xxxu/core.c:2772:38: warning: variable 'vop'
 set but not used
Message-ID: <202610080355.soz7YjmW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 651fc18b5a8c3fa4dc39586a4f1aca0b9e2e11d8 [43/142] rtl81xxx: Hack in SDIO.
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261008/202610080355.soz7YjmW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080355.soz7YjmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080355.soz7YjmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtl8xxxu/core.c: In function 'rtl8xxxu_init_queue_priority':
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2772:38: warning: variable 'vop' set but not used [-Wunused-but-set-variable]
    2772 |         int hip, mgp, bkp, bep, vip, vop;
         |                                      ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2772:33: warning: variable 'vip' set but not used [-Wunused-but-set-variable]
    2772 |         int hip, mgp, bkp, bep, vip, vop;
         |                                 ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2772:28: warning: variable 'bep' set but not used [-Wunused-but-set-variable]
    2772 |         int hip, mgp, bkp, bep, vip, vop;
         |                            ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2772:23: warning: variable 'bkp' set but not used [-Wunused-but-set-variable]
    2772 |         int hip, mgp, bkp, bep, vip, vop;
         |                       ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2772:18: warning: variable 'mgp' set but not used [-Wunused-but-set-variable]
    2772 |         int hip, mgp, bkp, bep, vip, vop;
         |                  ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2772:13: warning: variable 'hip' set but not used [-Wunused-but-set-variable]
    2772 |         int hip, mgp, bkp, bep, vip, vop;
         |             ^~~


vim +/vop +2772 drivers/net/wireless/realtek/rtl8xxxu/core.c

74b99bed874f5a drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2016-02-29  2767  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2768  static int rtl8xxxu_init_queue_priority(struct rtl8xxxu_priv *priv)
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2769  {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2770  	u16 val16, hi, lo;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2771  	u16 hiq, mgq, bkq, beq, viq, voq;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14 @2772  	int hip, mgp, bkp, bep, vip, vop;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2773  	int ret = 0;
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2774  	u32 val32;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2775  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2776  	switch (priv->ep_tx_count) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2777  	case 1:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2778  		if (priv->ep_tx_high_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2779  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2780  		} else if (priv->ep_tx_low_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2781  			hi = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2782  		} else if (priv->ep_tx_normal_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2783  			hi = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2784  		} else {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2785  			hi = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2786  			ret = -EINVAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2787  		}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2788  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2789  		hiq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2790  		mgq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2791  		bkq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2792  		beq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2793  		viq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2794  		voq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2795  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2796  		hip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2797  		mgp = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2798  		bkp = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2799  		bep = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2800  		vip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2801  		vop = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2802  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2803  	case 2:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2804  		if (priv->ep_tx_high_queue && priv->ep_tx_low_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2805  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2806  			lo = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2807  		} else if (priv->ep_tx_normal_queue && priv->ep_tx_low_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2808  			hi = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2809  			lo = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2810  		} else if (priv->ep_tx_high_queue && priv->ep_tx_normal_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2811  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2812  			lo = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2813  		} else {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2814  			ret = -EINVAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2815  			hi = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2816  			lo = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2817  		}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2818  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2819  		hiq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2820  		mgq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2821  		bkq = lo;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2822  		beq = lo;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2823  		viq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2824  		voq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2825  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2826  		hip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2827  		mgp = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2828  		bkp = 1;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2829  		bep = 1;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2830  		vip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2831  		vop = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2832  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2833  	case 3:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2834  		beq = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2835  		bkq = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2836  		viq = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2837  		voq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2838  		mgq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2839  		hiq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2840  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2841  		hip = hiq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2842  		mgp = mgq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2843  		bkp = bkq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2844  		bep = beq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2845  		vip = viq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2846  		vop = viq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2847  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2848  	default:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2849  		ret = -EINVAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2850  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2851  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2852  	/*
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2853  	 * None of the vendor drivers are configuring the beacon
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2854  	 * queue here .... why?
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2855  	 */
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2856  	if (!ret) {
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2857  		/* Only RTL8192F seems to do it like this. */
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2858  		if (priv->rtl_chip == RTL8192F) {
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2859  			val32 = rtl8xxxu_read32(priv, REG_TRXDMA_CTRL);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2860  			val32 &= 0x7;
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2861  			val32 |= (voq << TRXDMA_CTRL_VOQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2862  				 (viq << TRXDMA_CTRL_VIQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2863  				 (beq << TRXDMA_CTRL_BEQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2864  				 (bkq << TRXDMA_CTRL_BKQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2865  				 (mgq << TRXDMA_CTRL_MGQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2866  				 (hiq << TRXDMA_CTRL_HIQ_SHIFT_8192F);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2867  			rtl8xxxu_write32(priv, REG_TRXDMA_CTRL, val32);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2868  		} else {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2869  			val16 = rtl8xxxu_read16(priv, REG_TRXDMA_CTRL);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2870  			val16 &= 0x7;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2871  			val16 |= (voq << TRXDMA_CTRL_VOQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2872  				 (viq << TRXDMA_CTRL_VIQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2873  				 (beq << TRXDMA_CTRL_BEQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2874  				 (bkq << TRXDMA_CTRL_BKQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2875  				 (mgq << TRXDMA_CTRL_MGQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2876  				 (hiq << TRXDMA_CTRL_HIQ_SHIFT);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2877  			rtl8xxxu_write16(priv, REG_TRXDMA_CTRL, val16);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2878  		}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2879  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2880  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2881  	return ret;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2882  }
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2883  

:::::: The code at line 2772 was first introduced by commit
:::::: 26f1fad29ad973b0fb26a9ca3dcb2a73dde781aa New driver: rtl8xxxu (mac80211)

:::::: TO: Jes Sorensen <Jes.Sorensen@redhat.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
