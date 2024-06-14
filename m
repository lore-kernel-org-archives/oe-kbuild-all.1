Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D90019ADB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718390479; cv=none; b=MZvHM0xdCuDl53oHL/iUrq/8/4KyZ/fSGf+ezRX455q9cSChqwxB94Wrbe5xKHxQS/kO8SIzImwP44eEE7fAzVChOrV7Sqs0mbydk4L4Zrfleksw4TurqWgqQFTjiLbHzwVLtfclSMKTAUshBk/fJv5/br/3RBIctERd0v8+tRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718390479; c=relaxed/simple;
	bh=xcgqXB+fFDVnW44QLUSGc/aOCG4sU5iQfMpsp1YcmSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bE0rxBiT8/L+2PWtmAl1iXb7gw7CeX9khqM66Yq4AVMTupjQmw6gvGQPUqvKuEfxSCkwyY7QtJOh8pfmp/UyseLteKJrJLMpbgTa+0NeTjujLc7fxi/0F9agzb6/NYgyKc5WmwpDioYTdWDvebWLqRcVZ5ODP/JGXyZfXHr1tSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShtMLdkA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShtMLdkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718390478; x=1749926478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcgqXB+fFDVnW44QLUSGc/aOCG4sU5iQfMpsp1YcmSY=;
  b=ShtMLdkAu4E/nrlkRIN0LOc3qqOELfd0BAxNUyrFiKoR4GUn7q1+dkIN
   1Exha17qogyLcGpHZTPmVJEnI7B5hIitDAbpdkH44XEPPPQo60wSMbzBy
   ILVwPJcVcmGtvP6NbHZSKtM1kOC9ZzkfStvfKmueF6QvTx0J7pKUbJhpL
   UonmaXEbmn79ffOfatD4m8JqZKa2I88wxvog43OYGf0k6W5FSj2BaAuJv
   KKop8AmbvKvQEnrCa4nXWTSrd8ABx8R0QEpEHq7fe6F+JNHyH3e8KyX+G
   l65qZ0XW4bGrC37G9R02ywMM/3VQQFRjj2CEsBn7qKJEL+dIiItogj8Pw
   w==;
X-CSE-ConnectionGUID: 3JTogHqJTE6uvLxXQufRRg==
X-CSE-MsgGUID: /sJ73weyTbOKmeGQXZr6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15168869"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15168869"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 11:41:17 -0700
X-CSE-ConnectionGUID: ECg+ImR2TcuWfvnnr/zy5w==
X-CSE-MsgGUID: wS/16icIRJ2MwPRLlhCsqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40673832"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2024 11:41:16 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIBrN-0001ev-1j;
	Fri, 14 Jun 2024 18:41:13 +0000
Date: Sat, 15 Jun 2024 02:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3958/9999]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406150208.OekUsAB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 5d63770a26dcbf9965903c2df51f1aaf176c53f8 [3958/9999] arm64: dts: renesas: r8a774c0: Add PCIe EP node
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240615/202406150208.OekUsAB9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150208.OekUsAB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150208.OekUsAB9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
