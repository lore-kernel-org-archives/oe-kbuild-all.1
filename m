Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035FD53F6A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181450; cv=none; b=YdqdADWBJi39ElUmP/C8fPtmaHiifYv0VfnFFeU7Pja+9VVFH49O2Y373LlVD9PXcR1pzZrjOt/JiU+EoNWfojn6gB/jKAqUkcesgCuhC/+0g5jZjVjld3ZFwHdLmuUy2Vil37pPU8guRrtKaK6L6S4sURTFSfMcOJPA27waq0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181450; c=relaxed/simple;
	bh=XDGx2K7o7KK6A9qyNoSmZrbh5Dw1fKGgd8/Sf7zrmYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lf8moWRbKuVgTFYgTYeitme97wyf2gx7fbg/pRJ2V+UlwdWWfL/bX2HKjRe95GGYJJ653oBdgVd1bBuMzJMZavNCFh5hQ/qk422TYu2i0a6qGDLA3evqVhVQva5wC1A+yutVDrDxsGQael8ZAILEQ2KmIR4oL2SlHzxz1mDqPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZr73tvn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZr73tvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790181441; x=1821717441;
  h=date:from:to:cc:subject:message-id;
  bh=XDGx2K7o7KK6A9qyNoSmZrbh5Dw1fKGgd8/Sf7zrmYU=;
  b=gZr73tvnX+uZL/QxeDt/8cPe5xpEUzQndkugQjad84XPEMBfPefkb3DK
   JHgXdO+xAjUo50f1QAiQ1KK35bfmvDwVRbRROdL5DebQQ1DKu9ttS3Gp4
   cKocX/vpuroBAwRD71lS8O/FrcMAA/tUPFvcH/acsEMomCK/ErdntM9NM
   n7kEPv93AtWGI2Ep0dOkR1Le74mn9ZxK4uosFOyPNAN0NMHHH04VIxd6O
   B3zEGcUpOIq0jM7qMhX0eW2X1mHoh3GcPuNxekRLawkk4iqNTH9A4jGxP
   NR/7mbyfsjckszxiwB4ZQpDJd4ZnCQWiHVK8qJFS6fWUqxLhGCApqaEFN
   w==;
X-CSE-ConnectionGUID: 5CI6mzUVSfagdBXXO3elSA==
X-CSE-MsgGUID: rzL4jqO3SPC9cd1LotZB6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116421979"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="116421979"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:37:03 -0700
X-CSE-ConnectionGUID: YS+5q49tSe6hLP2pOKnryg==
X-CSE-MsgGUID: 6Lf8HgvQRRm1cVGB5n/czQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272281522"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 09:37:01 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Pxr-000000000kS-1BZj;
	Wed, 23 Sep 2026 16:36:59 +0000
Date: Wed, 23 Sep 2026 18:36:36 +0200
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: include/dt-bindings/phy/phy.h:15:33: error: expected
 identifier before numeric constant
Message-ID: <202609231859.j8cxTVIk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/dt-bindings-phy-Add-PHY_TYPE_EUSB2-definition/20260913-201044
head:   94be58d611587db4c015497cc512605004a90c37
commit: e6ba7e9c925fc463907e90e8c43c5c3ac994e55c include: linux: phy: Add phy attribute "type" and associated helpers
date:   10 days ago
config: arm64-randconfig-r2106-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231859.j8cxTVIk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231859.j8cxTVIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231859.j8cxTVIk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/phy/phy.h:24,
                    from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
>> include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
      15 | #define PHY_TYPE_PCIE           2
         |                                 ^
   drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
      47 |         PHY_TYPE_PCIE = 1,
         |         ^~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
     127 |         .phy_type       = PHY_TYPE_PCIE_GEN2,
         |                           ^~~~~~~~~~~~~~~~~~
         |                           PHY_TYPE_PCIE
>> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
     135 |         .phy_type       = PHY_TYPE_PCIE_GEN3,
         |                           ^~~~~~~~~~~~~~~~~~
         |                           PHY_TYPE_PCIE


vim +15 include/dt-bindings/phy/phy.h

2fbbc96d160092 Gabriel FERNANDEZ    2014-11-04  12  
eee47538ec1f26 Gregory CLEMENT      2014-11-13  13  #define PHY_NONE		0
2fbbc96d160092 Gabriel FERNANDEZ    2014-11-04  14  #define PHY_TYPE_SATA		1
2fbbc96d160092 Gabriel FERNANDEZ    2014-11-04 @15  #define PHY_TYPE_PCIE		2
2fbbc96d160092 Gabriel FERNANDEZ    2014-11-04  16  #define PHY_TYPE_USB2		3
2fbbc96d160092 Gabriel FERNANDEZ    2014-11-04  17  #define PHY_TYPE_USB3		4
55b20e8de9b25d Vivek Gautam         2017-10-12  18  #define PHY_TYPE_UFS		5
8a79db5e83a5d5 Jyri Sarha           2020-01-08  19  #define PHY_TYPE_DP		6
c5d3cdad688ed7 Dilip Kota           2020-05-19  20  #define PHY_TYPE_XPCS		7
cea0f76a483d12 Anurag Kumar Vulisha 2020-06-29  21  #define PHY_TYPE_SGMII		8
51862859fb7483 Swapnil Jakhade      2020-09-17  22  #define PHY_TYPE_QSGMII		9
bb5b94f5bbe754 Jonathan Marek       2021-06-17  23  #define PHY_TYPE_DPHY		10
bb5b94f5bbe754 Jonathan Marek       2021-06-17  24  #define PHY_TYPE_CPHY		11
288440de9e5fdb Swapnil Jakhade      2022-06-28  25  #define PHY_TYPE_USXGMII	12
a632a2a0db8b4d Swapnil Jakhade      2026-01-12  26  #define PHY_TYPE_XAUI		13
00448cd72af031 Krishna Kurapati     2026-09-13  27  #define PHY_TYPE_EUSB2		14
2fbbc96d160092 Gabriel FERNANDEZ    2014-11-04  28  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
