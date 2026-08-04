Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4B71B4138
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860337; cv=none; b=MckhIZ6QAff5hOOz1IfAzhqOiMXsexDasPZD0P+5NRaA19kMrV2jzhHDSb90mN77pEtz6sgYmqed1ZY3zjn+H2kDEc8atXCQPorqB7/4fLXmp77l19nloYTgqvKnKnTY+/R38OzdH1f24ZLrAt34OYtG0ntVX5M1S3hdZpNdYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860337; c=relaxed/simple;
	bh=e2fVSQudZ8pwRBM4kRNt70cikoSelmId+nmvR+63QXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iQKNeS5zWdI6DIvY8dRNUQ/f2rh3EEPDf1/1Ja2QdHFypo7WWxTpj4S2cJ4hq46Wl13SRi70BxTKSbVIbK+K4g7gjmPRbMjK/moyuwzQVe9Q/qjFAECy5UR2XdK/pcS1DtPt5FgOVvXRPdsAdca3MbcUEAqo2uJD1WJ8akT6scI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaKrDZaF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaKrDZaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785860335; x=1817396335;
  h=date:from:to:cc:subject:message-id;
  bh=e2fVSQudZ8pwRBM4kRNt70cikoSelmId+nmvR+63QXo=;
  b=UaKrDZaF3HBdftDjjbs5zj3Q0Qqc8wiv+v1manYuTWe+ejVuc4SqoCFs
   efaLe9HL3yU69LRB/68q+Q7fM3dWPcjINVQv9/q82buv7HJ08EIsCtvng
   e4zlNDHNNbeU6DY8yRMTC4/tgii9bBWUxTHnLU+9p3viqDVfF44u/wN0k
   iSsXK76avIU8F9g1c/4okt8iRNjnrqOEX2EqAHVZVd2ZmGrQ+xNNyBhHm
   NNrsfmTrc/VlJW120F7r+V2wnhewfh7esB37IWp77HnbF9lsFD8SyPxTE
   B0MqKWiMG9PRVg/YGBaCVN0kfu5HD/O/r+wzUsXQle6kEiLRARwffU+uC
   g==;
X-CSE-ConnectionGUID: 3bXkxtq+SrWxNYLASgZPzA==
X-CSE-MsgGUID: aktxs1bHRJWWyZc8Y0tvMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109208796"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="109208796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:18:54 -0700
X-CSE-ConnectionGUID: Kuyz6md5S6O0jCepQ+3bxw==
X-CSE-MsgGUID: GVwlnbtGTS21JP5hnt8OGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="266670241"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2026 09:18:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrHqs-00000000ACH-0ZBa;
	Tue, 04 Aug 2026 16:18:50 +0000
Date: Wed, 05 Aug 2026 00:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 560/700]
 drivers/tty/serial/8250/8250_dw.c:773:42: warning:
 'dw8250_starfive_jh7100_data' defined but not used
Message-ID: <202608042308.CC4ZLVsO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: add6d38b470e2d6763780bb8f4cf970abf5b7402 [560/700] serial: 8250_dw: Reduce useless compatibles
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608042308.CC4ZLVsO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608042308.CC4ZLVsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608042308.CC4ZLVsO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_dw.c:773:42: warning: 'dw8250_starfive_jh7100_data' defined but not used [-Wunused-const-variable=]
     773 | static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_dw.c:767:42: warning: 'dw8250_renesas_rzn1_data' defined but not used [-Wunused-const-variable=]
     767 | static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_dw.c:762:42: warning: 'dw8250_armada_38x_data' defined but not used [-Wunused-const-variable=]
     762 | static const struct dw8250_platform_data dw8250_armada_38x_data = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_dw.c:757:42: warning: 'dw8250_octeon_3860_data' defined but not used [-Wunused-const-variable=]
     757 | static const struct dw8250_platform_data dw8250_octeon_3860_data = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~


vim +/dw8250_starfive_jh7100_data +773 drivers/tty/serial/8250/8250_dw.c

4a218b277fdba3 Emil Renner Berthing 2022-04-22  756  
4a218b277fdba3 Emil Renner Berthing 2022-04-22 @757  static const struct dw8250_platform_data dw8250_octeon_3860_data = {
ffd381445eac2a Miquel Raynal        2022-04-22  758  	.usr_reg = OCTEON_UART_USR,
4a218b277fdba3 Emil Renner Berthing 2022-04-22  759  	.quirks = DW_UART_QUIRK_OCTEON,
4a218b277fdba3 Emil Renner Berthing 2022-04-22  760  };
4a218b277fdba3 Emil Renner Berthing 2022-04-22  761  
4a218b277fdba3 Emil Renner Berthing 2022-04-22 @762  static const struct dw8250_platform_data dw8250_armada_38x_data = {
ffd381445eac2a Miquel Raynal        2022-04-22  763  	.usr_reg = DW_UART_USR,
4a218b277fdba3 Emil Renner Berthing 2022-04-22  764  	.quirks = DW_UART_QUIRK_ARMADA_38X,
4a218b277fdba3 Emil Renner Berthing 2022-04-22  765  };
4a218b277fdba3 Emil Renner Berthing 2022-04-22  766  
4a218b277fdba3 Emil Renner Berthing 2022-04-22 @767  static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
ffd381445eac2a Miquel Raynal        2022-04-22  768  	.usr_reg = DW_UART_USR,
070e246217230c Phil Edworthy        2022-04-22  769  	.cpr_val = 0x00012f32,
070e246217230c Phil Edworthy        2022-04-22  770  	.quirks = DW_UART_QUIRK_IS_DMA_FC,
4a218b277fdba3 Emil Renner Berthing 2022-04-22  771  };
4a218b277fdba3 Emil Renner Berthing 2022-04-22  772  
4a218b277fdba3 Emil Renner Berthing 2022-04-22 @773  static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
ffd381445eac2a Miquel Raynal        2022-04-22  774  	.usr_reg = DW_UART_USR,
4a218b277fdba3 Emil Renner Berthing 2022-04-22  775  	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
4a218b277fdba3 Emil Renner Berthing 2022-04-22  776  };
4a218b277fdba3 Emil Renner Berthing 2022-04-22  777  

:::::: The code at line 773 was first introduced by commit
:::::: 4a218b277fdba357d8e9022ae675c94e59d64b4e serial: 8250: dw: Create a generic platform data structure

:::::: TO: Emil Renner Berthing <kernel@esmil.dk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
