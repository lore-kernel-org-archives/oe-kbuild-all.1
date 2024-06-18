Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA47916D9A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718740162; cv=none; b=V5o435kFmIZTHuBnWlVPjbriZtvq9J0DkI2qDgyPuHVe8NRbMX4mpMb8bwrMDZewDETDVjaWbt6yJ0Ke2MXcQ73acDfJktg2Unu1UuhPRwFA9CqZM674zF6kElWUM20fvx0a3gzM13I5dsf7OeG4oOzHt6Wzrk53nncEPARebNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718740162; c=relaxed/simple;
	bh=a8Htxg/75kwOzhRF/3fh8jq4LPd17JVTY7ZBnXyRME0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X2QntMEi2Gu7AUQdN+hBziI6C0NaThHpE5Inr8O0BwVJctxx+j9cIQRDm+j5YrofHwp1vnfmlkRRJX1koo8sCOiyMBPiHQTlkRliK4Dy6agIss0/FIkAdsIOQa/JilQUPXx3eKZW1arD4Xd/8xGTEer4gABHxdRy1dtmiODZGXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=np1P09sT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="np1P09sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718740161; x=1750276161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a8Htxg/75kwOzhRF/3fh8jq4LPd17JVTY7ZBnXyRME0=;
  b=np1P09sTr/6sVX8anJV3aXTrAFF8nseuZHddE52t1ixw4yW6l/uq8vCU
   YWzbYBAtRfOV8jzU8UK7Ae5DOUVo4U4/05q79mNTp0HPFxp9SCe1FaPVx
   JV48cTONwYbXSMWn+4fZ4HhvmRyqdYKrwDTca9pvtBWbf7LbV7zvyTAlu
   wnn2ydJqsrm6D1CI6/VqHb2zjqJ9m+2N5yC+Ao+fZvQs+LrCK3+dNK24a
   jF1i0/8QeSNPXmIJAD9TxstcJJ56q/76ndgYhxjzF9DGwO7vqgj/2uKQE
   rnUuVxRuhKM6+0U5/IxPfLY2RsR0x+5/VnWNrN5TypJ58hRDzoeTXpL77
   g==;
X-CSE-ConnectionGUID: +YljMXgTTCyJj4imUDSSVg==
X-CSE-MsgGUID: TP5PoaNURMS8fZpmN8fQ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="41054704"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41054704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 12:49:19 -0700
X-CSE-ConnectionGUID: vR6t1DalSfKPJG45+89k0w==
X-CSE-MsgGUID: /bwHiep9ScehJaBRDLsnJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="46792603"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jun 2024 12:49:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJepP-0005s2-1o;
	Tue, 18 Jun 2024 19:49:15 +0000
Date: Wed, 19 Jun 2024 03:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.1.94-2024-06-18-2 76/663]
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/phy@e6444000: failed
 to match any schema with compatible: ['renesas,r8a779f0-ether-serdes']
Message-ID: <202406190324.USkOEaOU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-18-2
head:   5e7236cba4333897587247b8cb1c26e5e90fb4c0
commit: 05caf0cfd7ff4ee1f78c5a4810ec40891a970cc4 [76/663] arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240619/202406190324.USkOEaOU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190324.USkOEaOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190324.USkOEaOU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/phy@e6444000: failed to match any schema with compatible: ['renesas,r8a779f0-ether-serdes']
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/ethernet@e6880000: failed to match any schema with compatible: ['renesas,r8a779f0-ether-switch']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
