Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AE614AA0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 03:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709696832; cv=none; b=XRUvtC1ueKKGZaaGunkfY5prsdG13nTe07iawqtClSLUB3cOZhzxybU6acy4pK6z+/E0nK7P0x44gqdJ0TlCFr+VOyelIWGQBio5hWu7BHosgLIA0KA4X6/phphAXrIx93c+tq/xqNNnx860GUXH8lzvRGSDPftv9BSnMPu87gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709696832; c=relaxed/simple;
	bh=GF5lI/m3JR/GKUMUEHCwkhm3Se74u46USn/L1fQ9szw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GD82C5ldrPpjNlaCASiKn0xiOAjRemd1e1rZa5HqQl9WZQgrQnAfYrtJbaQ1H3Cm2OnudHsAsWgnjIsFKjIG1BbIjLbzrEhLmQ8oBm0FnGptCUP7mnpoe1gD2Ts60nkgiUZPGGXhV0YI8UN4Elf4Nvg9MMHl1huLxST73ujrnD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrKFyD8o; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrKFyD8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709696830; x=1741232830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GF5lI/m3JR/GKUMUEHCwkhm3Se74u46USn/L1fQ9szw=;
  b=IrKFyD8oxK9NrDMT045wtp6bvyIAz1uPzHNa68HTo9VcIjg6p6X0e2yZ
   lH8AChTJbkdY3XoqqPZMbwthNgFZmgfTPl1N2pIPtXJuOID8fz7bLd+Bv
   eyw3OeIQMXzaOe+f4QWZoyQ9l0fcP8EjcsQPzR8x/YO7QJIpRSLC3EQ6m
   ib6FW/VTOfb25c1pqeXYcFYEyse/c3/hRg4CEedoKOAbLpob3s+TnHF/k
   lZf8IG7bbAnHB38GnEF750TE5ofdvAneKzcIcNix32NoRXTn5Qwm/523X
   Ge90AJk/qIwWG4CS4RLBe8EVK/gBkmnBn664iw5q7tbRftJeZIQka+e1J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15701616"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="15701616"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 19:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9585052"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2024 19:47:08 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhiFG-0003t1-0P;
	Wed, 06 Mar 2024 03:47:06 +0000
Date: Wed, 6 Mar 2024 11:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3156/27938]
 drivers/edac/synopsys_edac.c:295: warning: Function parameter or member
 'data_low' not described in 'ecc_error_info'
Message-ID: <202403061139.TeHIQF9q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: 074a8037ace1781be4492b18ee2eea115e723b75 [3156/27938] MLK-23333-2 EDAC: synopsys: Add more useful output information for CE/UE
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240306/202403061139.TeHIQF9q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061139.TeHIQF9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061139.TeHIQF9q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:295: warning: Function parameter or member 'data_low' not described in 'ecc_error_info'
>> drivers/edac/synopsys_edac.c:295: warning: Function parameter or member 'data_high' not described in 'ecc_error_info'
>> drivers/edac/synopsys_edac.c:295: warning: Function parameter or member 'syndrome' not described in 'ecc_error_info'


vim +295 drivers/edac/synopsys_edac.c

8b9d0f0d9ff708 Sherry Sun                2020-02-12  274  
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  275  /**
225af74d6312b2 Manish Narani             2018-10-04  276   * struct ecc_error_info - ECC error log information.
225af74d6312b2 Manish Narani             2018-10-04  277   * @row:	Row number.
225af74d6312b2 Manish Narani             2018-10-04  278   * @col:	Column number.
225af74d6312b2 Manish Narani             2018-10-04  279   * @bank:	Bank number.
225af74d6312b2 Manish Narani             2018-10-04  280   * @bitpos:	Bit position.
225af74d6312b2 Manish Narani             2018-10-04  281   * @data:	Data causing the error.
b500b4a029d577 Manish Narani             2018-10-25  282   * @bankgrpnr:	Bank group number.
b500b4a029d577 Manish Narani             2018-10-25  283   * @blknr:	Block number.
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  284   */
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  285  struct ecc_error_info {
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  286  	u32 row;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  287  	u32 col;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  288  	u32 bank;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  289  	u32 bitpos;
074a8037ace178 Sherry Sun                2020-02-17  290  	u32 data_low;
074a8037ace178 Sherry Sun                2020-02-17  291  	u32 data_high;
b500b4a029d577 Manish Narani             2018-10-25  292  	u32 bankgrpnr;
b500b4a029d577 Manish Narani             2018-10-25  293  	u32 blknr;
074a8037ace178 Sherry Sun                2020-02-17  294  	u32 syndrome;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06 @295  };
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  296  

:::::: The code at line 295 was first introduced by commit
:::::: ae9b56e3996dadbb59c727018f45486c06844261 EDAC, synps: Add EDAC support for zynq ddr ecc controller

:::::: TO: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
