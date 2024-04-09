Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01C12EBEF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712668749; cv=none; b=GnRpA8BTpkvGY/HwRkR81/dkZH38gFwZMLy6dGQ+kiqd+VC5aS+MWFtfKnCRhwbSkwRNMq6QhTxV3Tiq+y6jSK3etRvT52nvEhIT1WavCqYzJF3SuLOqeZa1rTEj+cpOEXzIxQBIf4c4BpQ8bjF4q0C1lD7HuLuGE81NFWwpE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712668749; c=relaxed/simple;
	bh=aZedw2b4LT7GilcwbfsoYa4nux7SRJrnKxKquaIln74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGGIuUZJLk9/JSAKErr5TW/RPRE/CC/U5clgW1cfUQRGSJLAZtqSSN7UnvfJO8DN2sFLtrthm1FwdcRL9ZIhQrWaVabe9VpWrqAL7HH+wg/FO5BCIuckNBf3YEX5eYMrT7Ms/OlQbo0yVO4qDzbyM0K6a7LKovDoFOjrYti5+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdIynFia; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdIynFia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712668748; x=1744204748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZedw2b4LT7GilcwbfsoYa4nux7SRJrnKxKquaIln74=;
  b=XdIynFiasDtQlAngdl/wwOoEU0TP22Ei+Q6LDMiXhTZnYG+PLXXxN0kW
   2XBN8LcA0ys7p5K7WZ+Hj8jcprD1DTi1xVYMY05UqPHc9okVHcCuwQz8D
   5mlR4R6mB1xdzwVuJS+TY2Qnqor0dcGPYYptwNOJCVUug+9LqRybR+YJW
   YP/oBlXoHdiF1/1ThzceGV6a7zKkmGpPNox5mvBnBOhlAVtDzFVi6AV1+
   cHZtWVFT6cMQlobzRcrxpso8chg3qZj5kalVVmmLZURGiTsJEutXJAlFY
   U24E0yosp+5ZE0OIYmJ6WxNKRpEowWxU+X8jtyv7zUN1+utxi8QoZL7um
   g==;
X-CSE-ConnectionGUID: epXcxQ0sTkKC1S5Q9c5PUw==
X-CSE-MsgGUID: CtBUj4zjSFi9mxRnHDZ+Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7824845"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7824845"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 06:19:07 -0700
X-CSE-ConnectionGUID: BhfxjqR5QHWtBsGsks5bkg==
X-CSE-MsgGUID: 2k3FdExJRy2o4bGHpBhfxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="24852130"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2024 06:19:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruBNP-00066c-32;
	Tue, 09 Apr 2024 13:19:03 +0000
Date: Tue, 9 Apr 2024 21:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7226/7334]
 drivers/net/ethernet/mucse/rnp/rnp_main.c:5739: warning: Function parameter
 or member 'netdev' not described in 'rnp_netpoll'
Message-ID: <202404092155.wk6wC2Wu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   830c644d6e307456c2e77e6ce8bd6f1cf1ddc351
commit: bc0e7c9b35e0290125847e322dce4609f83f2dc9 [7226/7334] RNP: Fix warnings
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240409/202404092155.wk6wC2Wu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404092155.wk6wC2Wu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404092155.wk6wC2Wu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mucse/rnp/rnp_main.c:5739: warning: Function parameter or member 'netdev' not described in 'rnp_netpoll'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:5739: warning: expecting prototype for Polling 'interrupt'(). Prototype was for rnp_netpoll() instead
--
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:65: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * force firmware report link event to driver


vim +5739 drivers/net/ethernet/mucse/rnp/rnp_main.c

455d45ae080810 Dong Yibo 2024-02-22  5731  
455d45ae080810 Dong Yibo 2024-02-22  5732  #ifdef CONFIG_NET_POLL_CONTROLLER
bc0e7c9b35e029 Dong Yibo 2024-03-29  5733  /**
455d45ae080810 Dong Yibo 2024-02-22  5734   * Polling 'interrupt' - used by things like netconsole to send skbs
455d45ae080810 Dong Yibo 2024-02-22  5735   * without having to re-enable interrupts. It's not called while
455d45ae080810 Dong Yibo 2024-02-22  5736   * the interrupt routine is executing.
455d45ae080810 Dong Yibo 2024-02-22  5737   */
455d45ae080810 Dong Yibo 2024-02-22  5738  static void rnp_netpoll(struct net_device *netdev)
455d45ae080810 Dong Yibo 2024-02-22 @5739  {
455d45ae080810 Dong Yibo 2024-02-22  5740  	struct rnp_adapter *adapter = netdev_priv(netdev);
455d45ae080810 Dong Yibo 2024-02-22  5741  	int i;
455d45ae080810 Dong Yibo 2024-02-22  5742  
455d45ae080810 Dong Yibo 2024-02-22  5743  	/* if interface is down do nothing */
455d45ae080810 Dong Yibo 2024-02-22  5744  	if (test_bit(__RNP_DOWN, &adapter->state))
455d45ae080810 Dong Yibo 2024-02-22  5745  		return;
455d45ae080810 Dong Yibo 2024-02-22  5746  
455d45ae080810 Dong Yibo 2024-02-22  5747  	adapter->flags |= RNP_FLAG_IN_NETPOLL;
455d45ae080810 Dong Yibo 2024-02-22  5748  	for (i = 0; i < adapter->num_q_vectors; i++)
455d45ae080810 Dong Yibo 2024-02-22  5749  		rnp_msix_clean_rings(0, adapter->q_vector[i]);
455d45ae080810 Dong Yibo 2024-02-22  5750  	adapter->flags &= ~RNP_FLAG_IN_NETPOLL;
455d45ae080810 Dong Yibo 2024-02-22  5751  }
455d45ae080810 Dong Yibo 2024-02-22  5752  

:::::: The code at line 5739 was first introduced by commit
:::::: 455d45ae080810ae554f5e586adb9004230f9f70 drivers: initial support for rnp drivers from Mucse Technology

:::::: TO: Dong Yibo <dong100@mucse.com>
:::::: CC: Dong Yibo <dong100@mucse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
