Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B334813FD6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714127089; cv=none; b=rakpuTEJrDaXeqGuvma61n2PIQr2yTAdbbA+I5ueUWJpV3EP1usBo/l+YwW4Kf6731DSZUHAI/7WenxCACeatv/YcZn2dvlP4MMdLoX+67nZjMBU4aBx6X8CcNl1DA2MeUfWUchckJ5nIe8YWLoRKiXw3ipYLiNmCW4cdi/6Ses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714127089; c=relaxed/simple;
	bh=mWpj8k4SBbNDC/pKx9uwTeUPaJQ/tHNsASWd6FTkf+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UpKJcJvg+qQnU+Jw+ykzM8fIElA4rrPwFav4V8Ma9WIe02ExPVPKP50v/9rsJVeePvaigBmQKm8VlbAAFSktYGtunnEGBUDSUYe0fXeALtLWv1/7F/fHfV9Z65mg3XwJuKtO9XII1IBZCXz+fMAjHQiqfxNTP+X+EdbgkGqoZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3AernpZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3AernpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714127087; x=1745663087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWpj8k4SBbNDC/pKx9uwTeUPaJQ/tHNsASWd6FTkf+g=;
  b=C3AernpZoD0lwiNgUDVmri8gAOJ/mbjrJGTXv5I+fnEcWDlT5XyCD2rq
   Pa/fNXoydjrsrqlnyEHUtPeO1YKMSbVmSXz5cimagCt6ummBNSs6+G4z7
   uCxs4gCqvOlawR+NvxBCEK6G6sSunzM1QYIsI/q8CImzoH6utnojmcoZU
   yTc5nD8j3tgpMk4NE2zfhlhQ3m+S8jgXBjdC64E1hb9FL034HwvAirtBd
   HwqM/lmWTVc5/mkbiqxEvKlYJ+aHj6ovXZmWpaZqCeTZtApPrD75CzZz0
   ITfaFExoMG+D6fe3ON8gqUWKkPynEo5Dzek9R5Y/bKUeOKosLUljr9BfL
   g==;
X-CSE-ConnectionGUID: AhEglHvbSXSRMLUk4TY6Fg==
X-CSE-MsgGUID: +4GuPURuTqCMjiC6eXwZXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35245075"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="35245075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 03:24:46 -0700
X-CSE-ConnectionGUID: W6siUojPQD24DnFjHPaiSg==
X-CSE-MsgGUID: Pnwu3+hCSdWkJdQkFTOi8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30180920"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Apr 2024 03:24:45 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Il0-0003as-26;
	Fri, 26 Apr 2024 10:24:42 +0000
Date: Fri, 26 Apr 2024 18:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/spitz 4/4] include/linux/spi/pxa2xx_spi.h:53:52:
 warning: 'struct property_entry' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202404261804.6lkYMrCw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/spitz
head:   40c9c2538a37054ef2a1c56f3a41e64ba82cd6aa
commit: 40c9c2538a37054ef2a1c56f3a41e64ba82cd6aa [4/4] ARM: spitz: Use software nodes for the ADS7846 touchscreen
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240426/202404261804.6lkYMrCw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404261804.6lkYMrCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261804.6lkYMrCw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-pxa2xx-dma.c:15:
>> include/linux/spi/pxa2xx_spi.h:53:52: warning: 'struct property_entry' declared inside parameter list will not be visible outside of this definition or declaration
      53 | void pxa2xx_set_spi_node(unsigned id, const struct property_entry *props);
         |                                                    ^~~~~~~~~~~~~~


vim +53 include/linux/spi/pxa2xx_spi.h

    51	
    52	extern void pxa2xx_set_spi_info(unsigned id, struct pxa2xx_spi_controller *info);
  > 53	void pxa2xx_set_spi_node(unsigned id, const struct property_entry *props);
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
