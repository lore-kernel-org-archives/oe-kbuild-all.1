Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870362741DA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753722863; cv=none; b=nTk4QSBhmcv3VCBWCP5vmNtHwzXQFOMc3hnq8UG6pDLP3XsMnewYUePolOejYlpeOU2DbuqlXpxVpnUiErPMtBxNz2SjGJ1P3Vbjk5jeP54dHmtQV/KQAQfgmjXGm/TN+sx252RLjbUMM1jpBdK9QuL6gjgeiKMF1578Zz1xLXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753722863; c=relaxed/simple;
	bh=8tWSz4wBtr5H9A7ejdhUY8vu1H+/BEOOoLwDoDAF1+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OejWwY3vi/Rsz34B6kDyOcNesjN2LT36+g2TbM3n4gi+bxorqzZnlnCQmuulyG+sm0jTOgsd3IOZfcVW4qdEotSvvhRy5QCZRDYVpVbWdteuT8yw3e7gjAYMQS/4BCldXk97cjMvCUL/i/8sHdM+ggba5rwl9mgAo5ZqroZZwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DebUs4yy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DebUs4yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753722861; x=1785258861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tWSz4wBtr5H9A7ejdhUY8vu1H+/BEOOoLwDoDAF1+4=;
  b=DebUs4yyHSiays4MXjwF+ujOXw3TTTCsg4YNO7RdGMQRtG+rCnR6+fNc
   X+Z2TIBGcMorc2jzoYs4RRN/fHXKFIwU3kAJdtwSF9hgqFup9uSC1TfaR
   rrsLj+OTYJlcjK8anhgQMrGjtOBBKjM5BiYaenTHJkbyjWu08ADyn3WHG
   JCSse3LfJLv+zhOCgA2sPIFKB9DC1cfx5hVpP1TryIyk9I38chkGVhrSm
   Nw4qlnZUyo5MFQcFTQOfekcOeKXKu8HFhq/E+oKYU29BRMCPeuyUaBfYm
   uQJ/g5xQ9LT+mlAdSrIAGRLKutQXc2XslzKWDP0cLRN65/WCPPkFW0WuZ
   g==;
X-CSE-ConnectionGUID: UNrb+TQKQF6mL7zlb1ENWg==
X-CSE-MsgGUID: RwcvFA7rRaKgT5KMCeqOiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66682543"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66682543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 10:14:20 -0700
X-CSE-ConnectionGUID: Yugh+c89QQ6BR48nJE/rXA==
X-CSE-MsgGUID: IBltd7PPRSKq8WgCZfQE5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167781282"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2025 10:14:20 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugRQX-0000cl-2h;
	Mon, 28 Jul 2025 17:14:17 +0000
Date: Tue, 29 Jul 2025 01:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 427/427]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425):
 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202507290121.THVLdEOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   68af9937285b9223a767cb84a6436b93447b1764
commit: 92bc4b7810ed97a7fa9d5d461a33a67b9af3d617 [427/427] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
config: arm64-randconfig-053-20250726 (https://download.01.org/0day-ci/archive/20250729/202507290121.THVLdEOS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290121.THVLdEOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290121.THVLdEOS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: wifi@0,0 (pci14e4,4425): 'local-mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
