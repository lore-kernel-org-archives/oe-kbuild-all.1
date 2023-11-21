Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49B584D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 21:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfY3d0US"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700602067; x=1732138067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4oZu79ZLVpsJS10GL5Pf4VpuDeqY4wtlEYpTXwAp6rI=;
  b=TfY3d0USJdSnC3GdIG3Xrz+qAQuNhhs0j12PL3yYCxek+6w3WqCY5EwR
   F4qtqTISVg+Oun0Yyi8QbjRt7o8s8UhydPHa3vQqewrZw1dPfR5fYswne
   N7xqGyVN7eKrgCXRKLMCZ7k8GA+2qDdTry9xv5ULaiBUi9r5cIA9Oxah/
   lU7mpaMSKy5zgJ5VQZliwEy6t/oWHTPqEHw/1ZMlD3XlzumWyJOOKJR27
   viQG9euw2b8I1wBK5K+joIp3VtMaQXERAr8dVuZh5SKZlgYFsNhTfSjv1
   Jp35gXtNamGT0XIjCs58SeS4GsqiU6uOeDlC/jlefC6brsKtb33IN9gp+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390788285"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="390788285"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 13:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857442536"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="857442536"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 13:27:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5YHW-0008HV-1c;
	Tue, 21 Nov 2023 21:27:42 +0000
Date: Wed, 22 Nov 2023 05:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r4-dango 20/28]
 drivers/net/pcs/pcs-mtk-usxgmii.c:506: undefined reference to
 `phylink_decode_usxgmii_word'
Message-ID: <202311220533.Xe6vd9yP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r4-dango
head:   a5a598d7e673122a9029ab02546923a7e30ed809
commit: 7c89ca96e12ef4bfcab4b34456af66044061d12f [20/28] net: pcs: add driver for MediaTek USXGMII PCS
config: x86_64-randconfig-123-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220533.Xe6vd9yP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220533.Xe6vd9yP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220533.Xe6vd9yP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mtk_pcs_lynxi_get_state':
>> drivers/net/pcs/pcs-mtk-lynxi.c:112: undefined reference to `phylink_mii_c22_pcs_decode_state'
   ld: vmlinux.o: in function `mtk_pcs_lynxi_config':
>> drivers/net/pcs/pcs-mtk-lynxi.c:126: undefined reference to `phylink_mii_c22_pcs_encode_advertisement'
   ld: vmlinux.o: in function `mtk_usxgmii_pcs_get_an_state':
>> drivers/net/pcs/pcs-mtk-usxgmii.c:506: undefined reference to `phylink_decode_usxgmii_word'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHY_MTK_PEXTP
   Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=n]) && OF [=y] && OF_ADDRESS [=y] && HAS_IOMEM [=y]
   Selected by [y]:
   - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]


vim +506 drivers/net/pcs/pcs-mtk-usxgmii.c

   493	
   494	static void mtk_usxgmii_pcs_get_an_state(struct mtk_usxgmii_pcs *mpcs,
   495						 struct phylink_link_state *state)
   496	{
   497		u16 lpa;
   498	
   499		/* Refresh LPA by toggling LPA_LATCH */
   500		mtk_m32(mpcs, RG_PCS_AN_STS0, USXGMII_LPA_LATCH, USXGMII_LPA_LATCH);
   501		ndelay(1020);
   502		mtk_m32(mpcs, RG_PCS_AN_STS0, USXGMII_LPA_LATCH, 0);
   503		ndelay(1020);
   504		lpa = FIELD_GET(USXGMII_LPA, mtk_r32(mpcs, RG_PCS_AN_STS0));
   505	
 > 506		phylink_decode_usxgmii_word(state, lpa);
   507	}
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
