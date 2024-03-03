Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C298BF3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 07:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709452057; cv=none; b=dI+gcGx0r7a4hnAXk0Ek6ebAEt3yPdDgr9au2wOaZkM2vFXPiPUAvYjezLwA5XCCSYBNHUICk3+Hw7qLho8blfpRdhb23PK/6S8038lODLQ4usbLP8qgXdIKtS+5gkXDhGNzT/yrdpNMFwY4Q5NWpDlNsBXv0sFl58LZQ4Cj7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709452057; c=relaxed/simple;
	bh=lfAf+4u+SK976nk8Zsv6eDAZXkprg9RqYe7hF1E/hAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzP9WlVYiL/2P9w8qzaCT+sfiFpli6kKqagCU4NrY/Y+xsfCkPw1yH0qZ9/PhOreiDo4LKdV5FwJERQsfWA7YiMNPgPNmrjuHe3ggC6Hc0wM0JdJNcdLxa06T/0eeOhryTN5Xs9//oANuhyZkSSak8k+jcPgNzagmCsiXZW53v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdwW0lkB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdwW0lkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709452055; x=1740988055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfAf+4u+SK976nk8Zsv6eDAZXkprg9RqYe7hF1E/hAs=;
  b=kdwW0lkBTvIq81DWOQQWly2poT9QN0HzdlnJcN3QtqWcvxztwjiQuio0
   YZOwwnBT4/EwxGl3l5pF17+JZHrPqVuDZCd2EL5atTnEMtzDqYjyq9ZOq
   xH4Wvrt9hr6vSuiCJmR5+LTy1kw7K9PdiQ52uGDDZgDuE8OI0zGIz36zi
   5mbxZ1EmHj32IIk6YoKwxqQvP/p+C8fB+eYvo8m4P8stOywp2aLD7D00q
   ZWpBMWM0vIGL6jN6cOgRtC7/xeX+D78BMg/GkVWGDKQdz/vQvCYRAtFC3
   ywJIyV//gOJNY4Pcwpc+tfoKxWOQnNBhjnINIY0/+sJw5t2HtNsEB7NWm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="21410041"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="21410041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 23:47:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="39484502"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2024 23:47:35 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rggZH-0001KC-1z;
	Sun, 03 Mar 2024 07:47:31 +0000
Date: Sun, 3 Mar 2024 15:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4263/27938]
 drivers/tty/serial/fsl_linflexuart.c:180:13: warning: 'linflex_string_write'
 used but never defined
Message-ID: <202403031513.avMTKobf-lkp@intel.com>
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
commit: 093375dfcc1c685b974c21cb9b50f44df4dcf29f [4263/27938] LF-631-7 tty: serial: linflexuart: Add support for FIFO with DMA
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403031513.avMTKobf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031513.avMTKobf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031513.avMTKobf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_linflexuart.c:180:13: warning: 'linflex_string_write' used but never defined
     180 | static void linflex_string_write(struct linflex_port *sport, const char *s,
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/linflex_string_write +180 drivers/tty/serial/fsl_linflexuart.c

   176	
   177	/* Forward declare this for the dma callbacks. */
   178	static void linflex_dma_tx_complete(void *arg);
   179	static void linflex_dma_rx_complete(void *arg);
 > 180	static void linflex_string_write(struct linflex_port *sport, const char *s,
   181					 unsigned int count);
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
