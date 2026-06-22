Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB9D200110
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150375; cv=none; b=WR8iVtqKZtW++2biBwIK7nsu8tNsFv+3+a+f8+iU3nJO27s8e6ipkwnpi7XB2O0sKQuSDtNfEipYK9Og7VFeXmzsKzXacxjJ2E5/5MnkMP1/4/LvR1lfEysJ7VFSM6IXUxOOYkMkh1UclrXjAUhsxmI/HSwqkSlh+0yEjmKwxbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150375; c=relaxed/simple;
	bh=WdKLg4k7teoo6uSJP0FOj2RAoPcPp/kr+wfNSamzCe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JNd3eCE4fa7WuCTPnE4tcIFE02l/rkt808dpz/G0WQWx78rzqvNy8J+MxiDzThKlfllstLXzQ3sF1cN2fYUGaG/TDpoYE7VwAPfanr3RcKHMekCXVMWOGivynLpZCxplx6WMVeq7J1rM1Fd/imJfsmOtsU+3NQg4HhKvEC0KwwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDw5UCZx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDw5UCZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782150373; x=1813686373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WdKLg4k7teoo6uSJP0FOj2RAoPcPp/kr+wfNSamzCe8=;
  b=QDw5UCZxWErduyioJxBSD9fyXMNKnJwrH33T0OTbUlLgOSrKKQiFIxr8
   7qUu4kAG0di3vbYlM0wMfptsEtHdvHMKv0kOx+dHdpDr5sUgV9K/MAzVW
   pQpOVTebaS8RBjmXUfpjfX28gqZ1rJayYLynEcWt8vYpxg1r8vNxUW1A5
   WyWRB9SulahRfc2GbtUYJMtCcWgzDjus6GHvr8KVHxIu1khEJ17PhYhhf
   ft8pC3JiSurMf6CVZjCSVCbueY//W31qOaQIqBuLENSpmWT63fvgvPNDd
   HUvDdlSjM+T84m5DyT0r+XyoM8ASBhl1sMhmLtG/xirWEkc0sR2qKSbaM
   w==;
X-CSE-ConnectionGUID: p3vFyKhUSiaS5gYGQv79Bg==
X-CSE-MsgGUID: gjoMAiJoSbWpBh4P2gmUZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81867509"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="81867509"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:46:12 -0700
X-CSE-ConnectionGUID: 1SdgQRQgRiy9ChvQlI8vIg==
X-CSE-MsgGUID: 0k1WLQwjSCeVOYERrDjMHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273358181"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 10:46:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbiih-000000001eM-0aVu;
	Mon, 22 Jun 2026 17:46:05 +0000
Date: Tue, 23 Jun 2026 01:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 35/124]
 drivers/net/wireless/realtek/rtl8xxxu/core.c:2773:38: warning: variable 'vop'
 set but not used
Message-ID: <202606230136.7HZIbLDr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: c18787cd6393a0841707ab0d8877adecb1ba8f9b [35/124] rtl81xxx: Hack in SDIO.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230136.7HZIbLDr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230136.7HZIbLDr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230136.7HZIbLDr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtl8xxxu/core.c: In function 'rtl8xxxu_init_queue_priority':
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2773:38: warning: variable 'vop' set but not used [-Wunused-but-set-variable=]
    2773 |         int hip, mgp, bkp, bep, vip, vop;
         |                                      ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2773:33: warning: variable 'vip' set but not used [-Wunused-but-set-variable=]
    2773 |         int hip, mgp, bkp, bep, vip, vop;
         |                                 ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2773:28: warning: variable 'bep' set but not used [-Wunused-but-set-variable=]
    2773 |         int hip, mgp, bkp, bep, vip, vop;
         |                            ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2773:23: warning: variable 'bkp' set but not used [-Wunused-but-set-variable=]
    2773 |         int hip, mgp, bkp, bep, vip, vop;
         |                       ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2773:18: warning: variable 'mgp' set but not used [-Wunused-but-set-variable=]
    2773 |         int hip, mgp, bkp, bep, vip, vop;
         |                  ^~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:2773:13: warning: variable 'hip' set but not used [-Wunused-but-set-variable=]
    2773 |         int hip, mgp, bkp, bep, vip, vop;
         |             ^~~
   In file included from include/linux/device.h:15,
                    from include/linux/mmc/host.h:11,
                    from drivers/net/wireless/realtek/rtl8xxxu/core.c:18:
   drivers/net/wireless/realtek/rtl8xxxu/core.c: In function 'rtl8xxxu_probe':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:8109:27: error: 'udev' undeclared (first use in this function); did you mean 'cdev'?
    8109 |                 dev_info(&udev->dev, "hardware doesn't support HT40\n");
         |                           ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/net/wireless/realtek/rtl8xxxu/core.c:8109:17: note: in expansion of macro 'dev_info'
    8109 |                 dev_info(&udev->dev, "hardware doesn't support HT40\n");
         |                 ^~~~~~~~
   drivers/net/wireless/realtek/rtl8xxxu/core.c:8109:27: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/net/wireless/realtek/rtl8xxxu/core.c:8109:17: note: in expansion of macro 'dev_info'
    8109 |                 dev_info(&udev->dev, "hardware doesn't support HT40\n");
         |                 ^~~~~~~~


vim +/vop +2773 drivers/net/wireless/realtek/rtl8xxxu/core.c

74b99bed874f5a drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2016-02-29  2768  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2769  static int rtl8xxxu_init_queue_priority(struct rtl8xxxu_priv *priv)
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2770  {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2771  	u16 val16, hi, lo;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2772  	u16 hiq, mgq, bkq, beq, viq, voq;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14 @2773  	int hip, mgp, bkp, bep, vip, vop;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2774  	int ret = 0;
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2775  	u32 val32;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2776  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2777  	switch (priv->ep_tx_count) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2778  	case 1:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2779  		if (priv->ep_tx_high_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2780  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2781  		} else if (priv->ep_tx_low_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2782  			hi = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2783  		} else if (priv->ep_tx_normal_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2784  			hi = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2785  		} else {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2786  			hi = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2787  			ret = -EINVAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2788  		}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2789  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2790  		hiq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2791  		mgq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2792  		bkq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2793  		beq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2794  		viq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2795  		voq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2796  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2797  		hip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2798  		mgp = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2799  		bkp = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2800  		bep = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2801  		vip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2802  		vop = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2803  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2804  	case 2:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2805  		if (priv->ep_tx_high_queue && priv->ep_tx_low_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2806  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2807  			lo = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2808  		} else if (priv->ep_tx_normal_queue && priv->ep_tx_low_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2809  			hi = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2810  			lo = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2811  		} else if (priv->ep_tx_high_queue && priv->ep_tx_normal_queue) {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2812  			hi = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2813  			lo = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2814  		} else {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2815  			ret = -EINVAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2816  			hi = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2817  			lo = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2818  		}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2819  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2820  		hiq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2821  		mgq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2822  		bkq = lo;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2823  		beq = lo;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2824  		viq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2825  		voq = hi;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2826  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2827  		hip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2828  		mgp = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2829  		bkp = 1;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2830  		bep = 1;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2831  		vip = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2832  		vop = 0;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2833  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2834  	case 3:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2835  		beq = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2836  		bkq = TRXDMA_QUEUE_LOW;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2837  		viq = TRXDMA_QUEUE_NORMAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2838  		voq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2839  		mgq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2840  		hiq = TRXDMA_QUEUE_HIGH;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2841  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2842  		hip = hiq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2843  		mgp = mgq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2844  		bkp = bkq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2845  		bep = beq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2846  		vip = viq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2847  		vop = viq ^ 3;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2848  		break;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2849  	default:
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2850  		ret = -EINVAL;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2851  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2852  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2853  	/*
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2854  	 * None of the vendor drivers are configuring the beacon
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2855  	 * queue here .... why?
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2856  	 */
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2857  	if (!ret) {
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2858  		/* Only RTL8192F seems to do it like this. */
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2859  		if (priv->rtl_chip == RTL8192F) {
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2860  			val32 = rtl8xxxu_read32(priv, REG_TRXDMA_CTRL);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2861  			val32 &= 0x7;
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2862  			val32 |= (voq << TRXDMA_CTRL_VOQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2863  				 (viq << TRXDMA_CTRL_VIQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2864  				 (beq << TRXDMA_CTRL_BEQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2865  				 (bkq << TRXDMA_CTRL_BKQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2866  				 (mgq << TRXDMA_CTRL_MGQ_SHIFT_8192F) |
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2867  				 (hiq << TRXDMA_CTRL_HIQ_SHIFT_8192F);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2868  			rtl8xxxu_write32(priv, REG_TRXDMA_CTRL, val32);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2869  		} else {
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2870  			val16 = rtl8xxxu_read16(priv, REG_TRXDMA_CTRL);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2871  			val16 &= 0x7;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2872  			val16 |= (voq << TRXDMA_CTRL_VOQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2873  				 (viq << TRXDMA_CTRL_VIQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2874  				 (beq << TRXDMA_CTRL_BEQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2875  				 (bkq << TRXDMA_CTRL_BKQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2876  				 (mgq << TRXDMA_CTRL_MGQ_SHIFT) |
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2877  				 (hiq << TRXDMA_CTRL_HIQ_SHIFT);
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2878  			rtl8xxxu_write16(priv, REG_TRXDMA_CTRL, val16);
c98411dc8cf6c1 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Bitterblue Smith 2023-05-13  2879  		}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2880  	}
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2881  
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2882  	return ret;
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2883  }
26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen     2015-10-14  2884  

:::::: The code at line 2773 was first introduced by commit
:::::: 26f1fad29ad973b0fb26a9ca3dcb2a73dde781aa New driver: rtl8xxxu (mac80211)

:::::: TO: Jes Sorensen <Jes.Sorensen@redhat.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
