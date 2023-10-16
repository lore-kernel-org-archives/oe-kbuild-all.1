Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2534190
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VK4AeeGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697481554; x=1729017554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a6yoZM1v+XTQ/shKNsx6TOlY1Kmx1qQszZAnEGaJ8NM=;
  b=VK4AeeGS1Hk0uBNIe0XijDMzUPrryg0IAmL4I1XbkyCVs98eT1KfK/nn
   49UIYNBuOflvAh++tdErY3a45womcS7PCLYv/tPX4M6t7uXaDHRVXIkzg
   cEJA7KaQMdsArHiyOG6/81HzBe0/44HZLI7RLE8cOjK8Vyszd9LecL5fi
   vVKi9Rc4Jr1zJXpB3no313BZ+8oZTAV7RgvD2Y7mFQJdS2US8KXOb7yes
   C00Utt5DEWnWaiRuIwPLf9xyIypdAUoZ7SJFlWomuP5+ftqmMDFn/1QUw
   L9fN6Tz7zdOR/wWvVoQjR8gWdh2BftTZmHwfHER6K8NImbWbF256vZvJ4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370684120"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="370684120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 11:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="899619934"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="899619934"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2023 11:37:11 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsSUe-0008b9-0b;
	Mon, 16 Oct 2023 18:39:08 +0000
Date: Tue, 17 Oct 2023 02:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>, Jai Luthra <j-luthra@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [hverkuil-media-tree:tmp 128/185] undefined reference to
 `phy_mipi_dphy_get_default_config_for_hsclk'
Message-ID: <202310170258.UzSN4RUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   ec313b68c0f210f23f2641c7d3907b15e078e4b8
commit: a91d06f46bf725f97d2bf344294c54bc57686889 [128/185] media: cadence: csi2rx: Configure DPHY using link freq
config: parisc-randconfig-c034-20220918 (https://download.01.org/0day-ci/archive/20231017/202310170258.UzSN4RUB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170258.UzSN4RUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170258.UzSN4RUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/media/platform/cadence/cdns-csi2rx.o: in function `csi2rx_configure_ext_dphy':
>> (.text+0x1744): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
