Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B567E7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoZs3xcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702577570; x=1734113570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SdUzfDoQ+S/OJZsOm8JVIWfF0SsNDzHb/b9ovKtFcXk=;
  b=HoZs3xcOs45vkCFEgNOK8ySZskVxOmX6UxIa8SYDfdtUct3dMdoMP5Gi
   pN1MLLY2+ND16HdN2My1oAiioHXHh+tuxQq7QI3kaXD/jYyeDgcNeJy72
   VisEig+lyUnKMh4hRg3onKGMC7YiUUlgXHjyqcMGETshVfgYVGU9PpiTN
   udNRIW/0IMa8lRvE6B0z4cPXdb+XAsSkn35+Xz6+FJrxAvObJdidQld3r
   Mw70FDlgB4Wzh2d/ktpCiKLEolK4TXSRdq8Z+7xAbnrywI08UpoKd10Gy
   a43yTDowG9g7ApiI97QG/+9kkcq6cPgsYjEkHl5VNOUpOvm/hlqh9n9W6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="481356450"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="481356450"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918135596"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="918135596"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Dec 2023 10:09:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDq8j-000MSG-37;
	Thu, 14 Dec 2023 18:09:03 +0000
Date: Fri, 15 Dec 2023 02:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix a short packet issue of gen1
 isoc-in transfer
Message-ID: <202312150146.ffBFCrhf-lkp@intel.com>
References: <20231213063543.12435-2-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213063543.12435-2-chunfeng.yun@mediatek.com>

Hi Chunfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next krzk/for-next linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunfeng-Yun/usb-xhci-mtk-fix-a-short-packet-issue-of-gen1-isoc-in-transfer/20231213-143959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231213063543.12435-2-chunfeng.yun%40mediatek.com
patch subject: [PATCH 2/3] usb: xhci-mtk: fix a short packet issue of gen1 isoc-in transfer
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231215/202312150146.ffBFCrhf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150146.ffBFCrhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150146.ffBFCrhf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/xhci-mtk.c: In function 'xhci_mtk_rxfifo_depth_set':
>> drivers/usb/host/xhci-mtk.c:184:26: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     184 |                 value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK, 2);
         |                          ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +184 drivers/usb/host/xhci-mtk.c

   170	
   171	/*
   172	 * workaround: usb3.2 gen1 isoc rx hw issue
   173	 * host send out unexpected ACK afer device fininsh a burst transfer with
   174	 * a short packet.
   175	 */
   176	static void xhci_mtk_rxfifo_depth_set(struct xhci_hcd_mtk *mtk)
   177	{
   178		struct usb_hcd *hcd = mtk->hcd;
   179		u32 value;
   180	
   181		if (mtk->rxfifo_depth_quirk) {
   182			value = readl(hcd->regs + HSCH_CFG1);
   183			value &= ~SCH3_RXFIFO_DEPTH_MASK;
 > 184			value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK, 2);
   185			writel(value, hcd->regs + HSCH_CFG1);
   186		}
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
