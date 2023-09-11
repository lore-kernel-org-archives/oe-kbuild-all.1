Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16815ACA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 19:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694461657; x=1725997657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMaU6W2s+9eEaJREx1n2rV8ajAQinUwfRUKbULTM1d0=;
  b=IFM75Or2D2adQrnm/Qt4AmmXEwVI6I5nhrLFNgp6wFvAAa+dVP0MhruE
   ZaPwPuo5kg48IUsHZm92BU/lKtXGCcexMI2GvDC6VT8rBFrPu3Dn23ebR
   xZHuekPc5sJcRRuzZ4pPfBg01NlsYR0zWRjoalgwtDES1uBsDKFV/fZGU
   mP7dTofzkUgtQT3Rkww0mIcXgF4iOEVKPatoaI4iW3G5CMCu2gFXJyoYF
   y1Vvt8dAKU/TzikvPrAfLTdDambnEg3nX0hEkGr0yGPrODBzTLSZTTZQG
   oS8E9K6uF3x2axq+a2S8GEHYJaVEsc5hqjIeljyJn4ALNeBjJYcxMYyca
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409147583"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="409147583"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 12:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743462162"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="743462162"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Sep 2023 12:47:35 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfmsf-0006fo-0s;
	Mon, 11 Sep 2023 19:47:33 +0000
Date: Tue, 12 Sep 2023 03:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 445/25020] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-rgba (if the link has no caption the label must precede a
 section header)
Message-ID: <202309120322.Np1CTnOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: ebe136fee8e4a4aef5ac4d77e90d2062802eab1c [445/25020] MLK-20724: uapi: add RGBA to exend V4L2 standard format for android usage
reproduce: (https://download.01.org/0day-ci/archive/20230912/202309120322.Np1CTnOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120322.Np1CTnOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-rgba (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
