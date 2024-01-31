Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634381366
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 01:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706665010; cv=none; b=hMWgBmRFJ5Kh25mSffWl2u//iKEbBK2NDKKt77/668LlG4f4mn/UEQhaIC/Warytfqprv+9bVYg/OKtZ1GbTImYoD0ioj0GU6w9qJ3bBQYptIXk6dbjOeqUmtltYcPb+TcilglnovryuqCgnU2VEjL3k97coZijQaFoJvlQwtng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706665010; c=relaxed/simple;
	bh=ZFkHdUUI319V2H1pyz/sKQ4g2qWXXZwhSPYcGsiR5Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWZPEdQ5L7eNtZq4AWw/omXlhm8rgIlDnFqpO6WpeRCTwjWbz2vm/2lYt/91ugmY88C2K6kTSvbW8yPD+qR3mqNFvIMrLnQ+EpayXjcMr7InH1VbrzawM50xrq4KY0yBgPM0nResduQn6H5+zs8Vf5WVmKloXaEBGPW2E9DhEG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExrYsjGf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExrYsjGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706665008; x=1738201008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZFkHdUUI319V2H1pyz/sKQ4g2qWXXZwhSPYcGsiR5Ac=;
  b=ExrYsjGf775ZE7Sc64aKMUejlhR2Ff/JqR63QOLmJ4oByr6Rr9gRCs5Y
   9DlV/z7oH8+QOrwjxN+BeG4SdnkTGupXiG3nhop+X9UErCN6YeE2n+BIF
   9NVc7aBssnPosVVMgQ162aQDG/pEkFc7ddlYE3Tzk7NWxd2B82CRB4X6F
   msqZsCAyv23K9V6guaywWHBrIeqR+g2oWz1vySdJ5Oi2y0XyFp6OmqzWt
   xjdgt80WaLs+f9UjHAEthfHS6ryJXwdtdri4U4jxq5CS8FCfsmPm/9uJp
   SKOLvbKtc3S+kIT197Xut7atUcX8sCv8vbz/kNclt7gX6AvzGA8bZoL0r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10831242"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10831242"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788389162"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788389162"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 17:36:46 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUzWt-00011I-10;
	Wed, 31 Jan 2024 01:36:43 +0000
Date: Wed, 31 Jan 2024 09:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1546/26476]
 drivers/net/dsa/mt7530.c:2151:6: warning: no previous prototype for function
 'mt7531_sgmii_restart_an'
Message-ID: <202401310945.5roViXaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: a5f7cc192993935d0bc3edcca566684364e66785 [1546/26476] net: dsa: mt7530: Add the support of MT7531 switch
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240131/202401310945.5roViXaG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310945.5roViXaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310945.5roViXaG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/mt7530.c:2151:6: warning: no previous prototype for function 'mt7531_sgmii_restart_an' [-Wmissing-prototypes]
    2151 | void mt7531_sgmii_restart_an(struct dsa_switch *ds, int port)
         |      ^
   drivers/net/dsa/mt7530.c:2151:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2151 | void mt7531_sgmii_restart_an(struct dsa_switch *ds, int port)
         | ^
         | static 
   1 warning generated.


vim +/mt7531_sgmii_restart_an +2151 drivers/net/dsa/mt7530.c

  2150	
> 2151	void mt7531_sgmii_restart_an(struct dsa_switch *ds, int port)
  2152	{
  2153		struct mt7530_priv *priv = ds->priv;
  2154		u32 val;
  2155	
  2156		val = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
  2157		val |= MT7531_SGMII_AN_RESTART;
  2158		mt7530_write(priv, MT7531_PCS_CONTROL_1(port), val);
  2159	}
  2160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
