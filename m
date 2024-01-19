Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D431E48F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669145; cv=none; b=MSAY2BXXbB4/o4iijC7ngvcKpnMv07248W3PmKXdw7sO98u4eRvIuwxV0zvGg4yiNn/FpPfsjmwC9KiUUMt3M7qoyOxXVA8+cICk4u2FXhechLgWjUQvsn2idGqBkdf3sHhwE4AZxyjYMsXc5thTbd8egvSy0e/lsn/6ojQOBE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669145; c=relaxed/simple;
	bh=LLPe8kEu/Y19bncEtS+Ia4U+mdQpmf292njCDpt3fRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UyJNXSpk5rG/TKg/H4lxPb08U8CJ7r0gCttEvrLauDruU2RsfULRe+zFrDLgQgWxV5pRBlKeNoEtHvttZQIp+DuAH8Vfw6zK9mceKSBBM33lrEDn1nCQ4FGIat1+g8o0vG5gA18GsctdCMl3OEAJAND3sd4TNLCqpdMPB58k5Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1LJGHgX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1LJGHgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705669143; x=1737205143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLPe8kEu/Y19bncEtS+Ia4U+mdQpmf292njCDpt3fRo=;
  b=I1LJGHgXSZC0V3oKfJ16gvAzNBkNki4F2fQxvdFruo9cjLPk/pkn1xJT
   mrmqPTdWV2ni0Cq2hWFu69laHqi/9VoOp98FPwrZAAAhMltXgGMB7mGxW
   UDhq+cbGgYaNAUihjxj98rE7XwNJ5qeXo8rjMGSAr5Gt22GFgM5FkBeaM
   TxU6JMMXRdIwCsHNNSzkVy3NXUCxZgFRmwRSb+qBRU5Y1YAVsU5+qd1bT
   pHfQZS5Ww9x9RWYsCcRAjdRcXI+2e5NlYlrL6pomhRGgS4OfeJuX50VtY
   KlClHBd/JL914+WPyxcvCTzCDZW23yrYRRFgBubntcuUbsrqc8JYM3bB+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7439991"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7439991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 04:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="785067924"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="785067924"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2024 04:59:01 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQoSY-00043o-21;
	Fri, 19 Jan 2024 12:58:58 +0000
Date: Fri, 19 Jan 2024 20:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 6/51] xsk_buff_pool.c:undefined reference to
 `__dma_sync_single_for_cpu'
Message-ID: <202401192041.KTLMPeQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   29cca1ea6c555a8b97694e38f18926da7969dcfe
commit: af9cc6ecff6613cff532105f6627b2e162bc4541 [6/51] xsk: use generic DMA sync shortcut instead of a custom one
config: i386-buildonly-randconfig-002-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192041.KTLMPeQe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192041.KTLMPeQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192041.KTLMPeQe-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/xdp/xsk_buff_pool.o: in function `xp_dma_sync_for_cpu_slow':
>> xsk_buff_pool.c:(.text+0x158): undefined reference to `__dma_sync_single_for_cpu'
   ld: net/xdp/xsk_buff_pool.o: in function `xp_dma_sync_for_device_slow':
>> xsk_buff_pool.c:(.text+0x16c): undefined reference to `__dma_sync_single_for_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
