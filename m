Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166624;
	b=XxUYP4sLI+FZlaAJYC2V7H0fzIZXYxJUnLO1OKmFQ9Rs3OB2jAne33C42+//sTD3cnWp
	 wtA8+X9CPpPgmI7czvZ2VL2nUOE7uDASH1cLf38bNj75KgdQ+DmmFBZxx7R8IdayI8mot
	 JfGeZKc/0/hIa6EUTZGik0sZX/iYFM8PIedcfbCxvBi2lcVjaT3EtcypJu5u4b/lY8HjH
	 x4F24xz5xwZSALgI8cBrErvIGQJLXsS8sLdRknV9gLWGB3JlSCe5HXsCeBGxxTlBu8RAK
	 dFpgiGyfXItaQuChVUvW8gbLaU+bIbOqUvwdiztz58cHu3THrdISTfAYMBAgNIJKsHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166624;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=j/Eff1e1hguVJKi2P+cSH1dspe6QmY9rcYS4W/DZnuw=;
	b=yAG/pwPmjdwQ+mHKJlThBjLGF0MJBsLclQXvy/I++zKGGs3Tc9kle46/kBC9LiQtRrcw
	 nbyXB3ayVECIrXfp4LjdurQ7zkwuCeypNm/+nv80bxKVPf0Rd/xfyyYsSjwdxeC2c8+wb
	 6kA+UXJbFdD34Ty7vAt3uSJQepTmfhGOxGBzQwHTp5tINrYa03AfW+Li78tcVw6e+OucU
	 E+SltrXi144ClnmkrzcHRKDjUJ0L64T0fLGKqH9blZpcEQzwEB/I1eA8tWnN+rhvz5uTT
	 MQqPU1LFReKTTY2gXbDIeIhtu249qFBS/QRzFdK2AgGfXe+sYcEBdPgxHqcb80Q9X6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cFxKcxv7;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B04606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 05:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B04606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cFxKcxv7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793166623; x=1824702623;
  h=date:from:to:cc:subject:message-id;
  bh=/esPTgxiOfcVW/gnNlhxbFxZUDekXO2bfj+G2pCdZUI=;
  b=cFxKcxv7MrwOFQPfWzgjclCRLix+bV06DwV8XZJZ7F6eN6hNkcYQErgz
   txe1ErZ1XuTMy1vUxcoeUk2R4beBCxyC8qwsv3HnHcAMQYrgPvn5IWcYi
   PtO2b2wrNITjeFcFp3uK2MWdXnRyATzDee3ZdgrNcVGGiAO910muolGW+
   GFcvMMWAz8Kwh8D9jXewHiibh8r0zjwE55Wyg7lfFK2bN2jnQE35f7rbT
   XajDHILau8b1t061ISlZ9Q7bAv6OgPREFvwuXX5gmdSUCJgZIwkX3P+HT
   k3e3Vr3XeayIlHHGh1iZQjVoR4d0phgRhR41EVEPOZIVx2dOuYRHPO9sk
   A==;
X-CSE-ConnectionGUID: CC4IKYPnRZeSoWXc+dNbig==
X-CSE-MsgGUID: qRnzN7ZhQke/vZiJ45jWDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1984068"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1984068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:50:23 -0700
X-CSE-ConnectionGUID: qdSCABcySrKpxjSCObdRIQ==
X-CSE-MsgGUID: HZMCRMaISO+1b+IwRCh1xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4684006"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2026 22:50:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLwYF-000000004lv-2MI0;
	Wed, 28 Oct 2026 05:50:19 +0000
Date: Wed, 28 Oct 2026 06:50:05 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2026-10 1/1]
 drivers/mmc/core/mmc.c:975:6: sparse: sparse: symbol 'mmc_set_bus_speed' was
 not declared. Should it be static?
Message-ID: <202610280657.oyn6DxTX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android12-5.10-2026-10
head:   69ab3fcf48c521f021298acd2647c5f3923a9c4f
commit: 072eded7ca22f1dff8f7e151c46274352a8bbf57 [1/1] FROMLIST: mmc: core: Export core functions required for clk scaling
config: i386-randconfig-r2306-20261018 (https://download.01.org/0day-ci/archive/20261028/202610280657.oyn6DxTX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280657.oyn6DxTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280657.oyn6DxTX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/core/mmc.c:975:6: sparse: sparse: symbol 'mmc_set_bus_speed' was not declared. Should it be static?

vim +/mmc_set_bus_speed +975 drivers/mmc/core/mmc.c

   971	
   972	/*
   973	 * Set the bus speed for the selected speed mode.
   974	 */
 > 975	void mmc_set_bus_speed(struct mmc_card *card)
   976	{
   977		unsigned int max_dtr = (unsigned int)-1;
   978	
   979		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   980		     max_dtr > card->ext_csd.hs200_max_dtr)
   981			max_dtr = card->ext_csd.hs200_max_dtr;
   982		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   983			max_dtr = card->ext_csd.hs_max_dtr;
   984		else if (max_dtr > card->csd.max_dtr)
   985			max_dtr = card->csd.max_dtr;
   986	
   987		mmc_set_clock(card->host, max_dtr);
   988	}
   989	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
