Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CB489FBC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370539; cv=none; b=IIFsx+z9p8WQsq/+l6B/S2fFQbNYXpsDCfJs6MpCrdXSqRbRDgOf5jPiLurSpLXSl2SKxw1O3XDI7VwG/44jPaZ+k3DxsVyWnmwdptcSiH3ggdUfj0GxIDgH+eOzkue6zsG+fO/UjPsgs95NBQbyE4E+J3hcvLG/5wJce7yMU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370539; c=relaxed/simple;
	bh=7XPNiol0hWeyYHI2tnriwQsz7rSSPFgeWrJ/QPHWJhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U9R6T3x+xnXqWPWMLK2ZM3dpNCtXQS/j+Hox3DEqTLOaBTrXrEklZYDg+kWxS8S2O7zMiGNmRiC4DtN2L1QFvFn+0xFPNe3oSbe+Qo4UfWGwlsoKCdPyUVvQrll87QyOTrogmmvpLcK9VUfphpjuxzzo5FvXpkbn1gVdFXYNMYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJGuxFNO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJGuxFNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790370537; x=1821906537;
  h=date:from:to:cc:subject:message-id;
  bh=7XPNiol0hWeyYHI2tnriwQsz7rSSPFgeWrJ/QPHWJhI=;
  b=AJGuxFNOJR+yGgGg9TYgt/+CsYD1innilAfkm83mDeaUWtgOEBtHwwzX
   5eGzcJVfZxLu397IjgvL0tzG7pHNpTXFIDewtKcnSQmzmur7z8f3l/Y1f
   HMg3Vg5w6N8tvXdxuJjLf5ZmAMYIEdYWEV0P/O+8VwUa7yT2NhJXAFrnb
   mYOrImqoe0LDQq6c2Vj1Nd/dsGx2ffBZQu4UJozFZRIVKcAmQZYgXhQ6z
   LzRYz341ifc9sRV7GhCB9hs0QoclTv07LmFUqYFQ85AiXm+Abh6qweRA3
   1aWVD9nu8PQ3v1HD8QEgHQJODbTp60upoIxhppzNltRkEpTlF47Prrugj
   A==;
X-CSE-ConnectionGUID: pVrSEOJ+RJCQsd0KB35L7A==
X-CSE-MsgGUID: USJ4T1upSryyCY1YIq6TwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90289533"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90289533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:08:56 -0700
X-CSE-ConnectionGUID: lv/Yir5lSWKBnaYv1VdxIw==
X-CSE-MsgGUID: 9bM1pQ1LREmrXLuyQs8E+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="302363046"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 14:08:55 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADA5-000000000tK-2vLA;
	Fri, 25 Sep 2026 21:08:53 +0000
Date: Fri, 25 Sep 2026 23:07:54 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier'
 defined but not used
Message-ID: <202609252118.PMBZbjWw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: 72a3fd1408afa370643bca631b35d3bf25d30531 [214/214] net: ethernet: mediatek: mtkmux: harden mux/phylink lifecycle
config: s390-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252118.PMBZbjWw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252118.PMBZbjWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252118.PMBZbjWw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   include/linux/pcs/pcs.h:107:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
    fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:90:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int register_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/unregister_fwnode_pcs_notifier +95 include/linux/pcs/pcs.h

    94	
  > 95	static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
    96	{
    97		return -EOPNOTSUPP;
    98	}
    99	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
