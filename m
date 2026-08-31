Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514643ACA7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 05:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155663; cv=none; b=iHqNt+hnPs3Cy/lbAWiwll5ph5SuuXQ30tsnNspQQ0gyCSQiyibAY2/VGYnZxC4RyV4ZOQwI5vuRfk89nIbS05E+xnP0IZabPFLQY6+UITYRHjYKNP3eXFmAtIyfMNapiu0JJL61R6UazvSheHFBp+Vjd0dyXbS+NG3cfRuwNes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155663; c=relaxed/simple;
	bh=iRiUwRkzGbldLyGZMvKE8rjALb9rdJTacl4wKghteIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sONhpwJ1VUjNJj0+RRhLZsVmqmI6Qpssyq9uCBSW3+2S4ZtKkojr6hcRA2ADq4160khbqgx8WshjBu5JEujsXm2QYnr3ZAZ+M+DKRZqxXxNqOGbDNzP6R6E6xfOSIjSRG5zR7ocaHELiBcfTlUT3aPz6XUOH5DlWIEFKUHoILug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kv1FE5/J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kv1FE5/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788155661; x=1819691661;
  h=date:from:to:cc:subject:message-id;
  bh=iRiUwRkzGbldLyGZMvKE8rjALb9rdJTacl4wKghteIM=;
  b=Kv1FE5/JbZ10exHeyWNd2ah8dsHlAOXqkxZGCkNqrJCuXJtr13qM5MDg
   MmPx23eOrZlHNshQ7on95X1R0E08JJLgJb8d/RAPoDM2Sq917WX+LFzd8
   sf+mDelGxT2HKRzGTHQHp8Ro7S6/d8EfTD3EFngZb6pqS2BaXFH6KaobD
   76XwCIsDdAMr51dJkI42DGzPjoqtuXhfcOigf7kn7hnTeEgEdKr03HNSr
   vTh+9zg4/CvyPBEiU9sbAGUuLIt5iLYsobTPf4ITwLp8uNH2anox4F7Aw
   JaplwQ4K50yEnVFWTku60rZ9ET98dRk+QxDZ79L4tPSXjXcJxocpmRpn8
   w==;
X-CSE-ConnectionGUID: jXluCe3wSWetpKp8fepRxg==
X-CSE-MsgGUID: Mcj8xhJpSIu89XzmiKzTrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="91064886"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="91064886"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 22:54:21 -0700
X-CSE-ConnectionGUID: sxtO8BgBTGqc/J0E/txlTw==
X-CSE-MsgGUID: jS2QRavMQ8aIKcBtGk4h6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292199363"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 22:54:19 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0uyH-000000000PX-1yhZ;
	Mon, 31 Aug 2026 05:54:17 +0000
Date: Mon, 31 Aug 2026 07:53:23 +0200
From: kernel test robot <lkp@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c:528:30:
 warning: variable 'phal' set but not used
Message-ID: <202608310749.mheatdIW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cee9395acd8043be0644b25c34bfa86623f2b935
commit: e9b50a2821bbfb5395cc2b9f90e2af45a3137f19 staging: rtl8723bs: remove unused spinlock 'SdioTxFIFOFreePageLock'
date:   5 weeks ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260831/202608310749.mheatdIW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310749.mheatdIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e9b50a2821bb ("staging: rtl8723bs: remove unused spinlock 'SdioTxFIFOFreePageLock'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310749.mheatdIW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c: In function 'rtl8723bs_init_xmit_priv':
>> drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c:528:30: warning: variable 'phal' set but not used [-Wunused-but-set-variable=]
     528 |         struct hal_com_data *phal;
         |                              ^~~~


vim +/phal +528 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c

554c0a3abf216c Hans de Goede 2017-03-29  518  
554c0a3abf216c Hans de Goede 2017-03-29  519  /*
554c0a3abf216c Hans de Goede 2017-03-29  520   * Return
554c0a3abf216c Hans de Goede 2017-03-29  521   *_SUCCESS	start thread ok
554c0a3abf216c Hans de Goede 2017-03-29  522   *_FAIL		start thread fail
554c0a3abf216c Hans de Goede 2017-03-29  523   *
554c0a3abf216c Hans de Goede 2017-03-29  524   */
554c0a3abf216c Hans de Goede 2017-03-29  525  s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
554c0a3abf216c Hans de Goede 2017-03-29  526  {
554c0a3abf216c Hans de Goede 2017-03-29  527  	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
554c0a3abf216c Hans de Goede 2017-03-29 @528  	struct hal_com_data *phal;
554c0a3abf216c Hans de Goede 2017-03-29  529  
554c0a3abf216c Hans de Goede 2017-03-29  530  	phal = GET_HAL_DATA(padapter);
554c0a3abf216c Hans de Goede 2017-03-29  531  
09a8ea34cf431b Arnd Bergmann 2018-12-10  532  	init_completion(&xmitpriv->SdioXmitStart);
09a8ea34cf431b Arnd Bergmann 2018-12-10  533  	init_completion(&xmitpriv->SdioXmitTerminate);
554c0a3abf216c Hans de Goede 2017-03-29  534  
554c0a3abf216c Hans de Goede 2017-03-29  535  	return _SUCCESS;
554c0a3abf216c Hans de Goede 2017-03-29  536  }
554c0a3abf216c Hans de Goede 2017-03-29  537  

:::::: The code at line 528 was first introduced by commit
:::::: 554c0a3abf216c991c5ebddcdb2c08689ecd290b staging: Add rtl8723bs sdio wifi driver

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
