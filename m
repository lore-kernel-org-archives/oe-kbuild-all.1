Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530848;
	b=0FmbLcFgDJmDz0Ep+C6tJdjB/mX1OYOuPu6Mc0fFqrZ9gpN833uyCy5B8zJsmHNImkx2
	 0D9skIhlNpZ76O/+gftql9YX7p0j/39GW9vmyz/BZcLudeIr5P/gZw6ABpYcs5x2h7xuO
	 RX/P93mNdIfTgbXmm+2RvInJjQzZsoOUoS0Rwl06CyMUp/Ai2MzuPRpcO7Xqijp1rEl9t
	 ItUZuySev1gyY6MGj3BjcRd/yte9LxLiElKvZ9IULcRAIe+8IwPxq2DnDS8ULcbr+RK99
	 euG8EvkzGhr1ykdX/kg1P/ktUW2wIZzIdUUn11TQyaKs8NOuGX8Sqr0MfAEXqG5JZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530848;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/GDwq/ARKQHedSeMJd3kkgCUMh1hNKmb8oWM7xOMd/4=;
	b=zA1LmhX+k9hhpum13OfHKF9zUlp/M48hDy7Li1pIwwQMhuOZ7SGe3sLRXc5T8trwY8DQ
	 jPvEs4WaLdNvBSgzBhpOpTFmr49/41QYlGD4lTCvxrmCbY3EPCnLFugybH21RzZWbD7BN
	 MUeQ8mwZFBrkq0CZjIv1aeaeievXrU2rvAtXO8KMUIeqNnQ6rXn/miBL843DMpm+ky8Mb
	 JysZIKx+lq3I0GO6UILKgwNvBttEF79SHFDKzH0E14yzQ0CSkX+MYpM7xE5ZMBBhOkdI9
	 +joNxJvM1ks12BAXUmrYPnAa6QDZLBqYqRmdmzbxri5gU2L8InebbO0rZUqiYv9599Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KFR5Y89r;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CEA606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 00:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6CEA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KFR5Y89r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794530847; x=1826066847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z2IIwLMBfb76IqEwt1TzObfTQGpxfBAvFBFzFSSzjXI=;
  b=KFR5Y89rl9Pn4ucPW0qeKA2ULJXA5pQrs0Hq9Rvu9GvME6JCMtydlFpg
   0a23LLGgmObSDU4d5SuxF0IqkSC2/sfFNaVpFHKrpLjWiqRZ4gdcu9FqM
   OVdXDR+sg0zpIfOpDUyAkQWwNCtD0Qoj1JYAGuhBrhoi3N+QyGIbDYAWd
   ym0kKhRl9DASClIq8g0LC/gNbarPVYDC2+lNQ9XOoJgMt6q5tidzxRqfO
   g0Fhtj3FaHFOfiiPBCIbiJ7BT008k53ssmNQ4923gRIWa71gFNruzDN0c
   Y6jPGCTome8uiTSEmZGAZYHe8nnT1zl2g7Nd7Ey3aCl8nDIzPQ7LspjgS
   Q==;
X-CSE-ConnectionGUID: aeVJuLDHQ5SigYabPd3iQg==
X-CSE-MsgGUID: NiyxdNp3R1iCtAS9IQ7asg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3188953"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3188953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:47:27 -0800
X-CSE-ConnectionGUID: /KYf7x+XTue4LhuUKbZVNw==
X-CSE-MsgGUID: RP7q2otqRQ28Cu+T+vh9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8686108"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Nov 2026 16:47:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRfRq-000000012G9-00H0;
	Fri, 13 Nov 2026 00:47:22 +0000
Date: Fri, 13 Nov 2026 08:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Shih <michael.shih@mediatek.com>, nbd@nbd.name,
	lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kun.wu@mediatek.com,
	deren.wu@mediatek.com, sean.wang@mediatek.com,
	quan.zhou@mediatek.com, ryder.lee@mediatek.com,
	leon.yen@mediatek.com, litien.chang@mediatek.com,
	jb.tsai@mediatek.com, eason.Lai@mediatek.com,
	Michael Shih <michael.shih@mediatek.com>
Subject: Re: [PATCH v5 1/2] wifi: mt76: mt7928: Add debugfs for stats to
 provide debug purpose
Message-ID: <202611130804.q5nHCDSw-lkp@intel.com>
References: <20261112075558.1813785-2-michael.shih@mediatek.com>
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
Content-Disposition: inline
In-Reply-To: <20261112075558.1813785-2-michael.shih@mediatek.com>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Shih/wifi-mt76-mt7928-Add-debugfs-for-stats-to-provide-debug-purpose/20261112-155556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261112075558.1813785-2-michael.shih%40mediatek.com
patch subject: [PATCH v5 1/2] wifi: mt76: mt7928: Add debugfs for stats to provide debug purpose
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130804.q5nHCDSw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130804.q5nHCDSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130804.q5nHCDSw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/net/wireless/mediatek/mt76/mt7925/mt7925-common.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
