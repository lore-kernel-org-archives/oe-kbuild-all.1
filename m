Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ABB26D4C3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 01:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777513406; cv=none; b=oen3AJjgyUEfXM7/sFd6GOvcdi+ZS6+nIO5AS/LWYP+3xjdD0dGw1LW42snUCDeK9uAs4itTUYPXZlAYGSsMhwztFZW7ke8neqHBUADvRNn2jTdxrzMegS/yLKt87230p1tgtRojP+uGlqX913dvk/iV9d2yA3KCQoX0CfF6wII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777513406; c=relaxed/simple;
	bh=DMMwX71W5njtCV48hCp4HWCaEVTrnwbN6m7AsCKkf+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXkQY3qs9W9kg30WDY/JFlJUpWSTHK02+jeqlexoPZsBOhwltpCWZwWb6CTJmot4cDqvc+8skH3u+WOjr9pVIYnG1ehI4n5F1315VIDJmNq8EShnMuU0k+F+gMoG4OHk0Tm0Kqs/MMKLEmBw8VxCQ3v4DN53vMbNnnoTvoF1JCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0m5RvEc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0m5RvEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777513404; x=1809049404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DMMwX71W5njtCV48hCp4HWCaEVTrnwbN6m7AsCKkf+w=;
  b=G0m5RvEcU+jq/aMfVEIZ6vabozMrML4SYO80UmjVdjHzBnzaPhS3q03Q
   eofoVaVVqYklg7M3FEehz9ugmJ+VJF2U0BDQHLtUWpUaKlXrLAiwwbkcx
   d5uHRSlodqaNsC8CtIftaXPCOX9ZSPwxyyUMjkmoEsVXtK+yExlnTJFFd
   xUrm2iumfBvC90p2GNDC0Pp0dsQ4K+pQWcyWK44pmwSVCEdyOazJmPqgk
   tusei2iKGwdlFl7hlwiCTxjR7hpCjmeqa7QzEHicYD49uBpsyQOSedD7r
   2tFVcLzF9tUI6eG7dDLQDEXW4d1raRyg1o7oD6ah9Vp41COZ42o4XUuVT
   g==;
X-CSE-ConnectionGUID: wWvEhroGQJqYqs91tYD3cw==
X-CSE-MsgGUID: qlipYc1AQz2f1S23ZiASRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78373816"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78373816"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 18:43:24 -0700
X-CSE-ConnectionGUID: 0FIBQk2mQP6lXkExHSsfRg==
X-CSE-MsgGUID: Tuci5ImdTOiccES9KrEnwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239460115"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2026 18:43:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIGQx-00000000Bma-3dVk;
	Thu, 30 Apr 2026 01:43:19 +0000
Date: Thu, 30 Apr 2026 09:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dudu Lu <phx0fer@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, Dudu Lu <phx0fer@gmail.com>
Subject: Re: [PATCH] nfc: nci: Add skb length validation in
 nci_core_init_rsp_packet
Message-ID: <202604300902.FjrlfrkQ-lkp@intel.com>
References: <20260413090102.77980-1-phx0fer@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413090102.77980-1-phx0fer@gmail.com>

Hi Dudu,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master horms-ipvs/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dudu-Lu/nfc-nci-Add-skb-length-validation-in-nci_core_init_rsp_packet/20260423-210923
base:   net/main
patch link:    https://lore.kernel.org/r/20260413090102.77980-1-phx0fer%40gmail.com
patch subject: [PATCH] nfc: nci: Add skb length validation in nci_core_init_rsp_packet
config: arm64-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300902.FjrlfrkQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300902.FjrlfrkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300902.FjrlfrkQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/nfc/nci/rsp.c:1:2: error: expected identifier or '(' before 'if'
     if (skb->len < sizeof(*rsp)) {
     ^~
   net/nfc/nci/rsp.c:5:2: error: expected identifier or '(' before 'if'
     if (skb->len < 6 + rsp_1->num_supported_rf_interfaces +
     ^~
   net/nfc/nci/rsp.c:10:2: error: expected identifier or '(' before 'if'
     if (skb->len < sizeof(*rsp_1))
     ^~


vim +1 net/nfc/nci/rsp.c

   > 1		if (skb->len < sizeof(*rsp)) {
     2			pr_err("short NCI_CORE_INIT_RSP v2 packet\n");
     3			return NCI_STATUS_SYNTAX_ERROR;
     4		}
     5		if (skb->len < 6 + rsp_1->num_supported_rf_interfaces +
     6				sizeof(*rsp_2)) {
     7			pr_err("short NCI_CORE_INIT_RSP v1 packet\n");
     8			return NCI_STATUS_SYNTAX_ERROR;
     9		}
    10		if (skb->len < sizeof(*rsp_1))
    11			return NCI_STATUS_SYNTAX_ERROR;
    12	// SPDX-License-Identifier: GPL-2.0-only
    13	/*
    14	 *  The NFC Controller Interface is the communication protocol between an
    15	 *  NFC Controller (NFCC) and a Device Host (DH).
    16	 *
    17	 *  Copyright (C) 2011 Texas Instruments, Inc.
    18	 *
    19	 *  Written by Ilan Elias <ilane@ti.com>
    20	 *
    21	 *  Acknowledgements:
    22	 *  This file is based on hci_event.c, which was written
    23	 *  by Maxim Krasnyansky.
    24	 */
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
