Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF0386329
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766934; cv=none; b=svoWsbANsJ2KlvkclXtIeMsJtVI+SrOlMQzJsUSDtqZbNCo20hYmiHdKz6Qc57p2+sVop4ZXCceluF8OwrZsn5cbeGGSI3/hEdzX2nTCFwoD4wfo1trvR1uXqXN/a7Cg8N6XQiYfgnOFzR7U7wQC64h7+9Kcc3Q+88bnEgd4KiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766934; c=relaxed/simple;
	bh=Yf68X0tH6PRr438uZLf97lOy3VaGscdXefduYS5njjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dGLMaIHbFOs2Q1UQUXDKWOMJxp5X5SqDCcsa3nIw6+PINfkl4woF02XrK4bOPeTP3EjMRI6msklHcPtTlFk3vkKKS+UKc8hl6dY0BEWwXOs8Mz0NYEV9BbSt+wN3j6PzgbS6j6sRScUQZ9tD3d0OXftGyBhu/01N3UQg1aWuMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7eTrTWh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7eTrTWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777766934; x=1809302934;
  h=date:from:to:cc:subject:message-id;
  bh=Yf68X0tH6PRr438uZLf97lOy3VaGscdXefduYS5njjk=;
  b=B7eTrTWhhfbI+IM1vsDrau5cJWvSfjtmX1TO5R/Uf58o5zDxAZ8FaCTk
   XB02DqZNwVQJlnozb5PoX2g43fgOstdLC5LzwvujtTR5fZHD7ivBy6X86
   rJD4Mjve++Y64cBCYdjycg6JxYfOb0bjOjeMs5ss+xs4NSk3/MgLZja09
   0RVNMlB+K/ItC9afUPCkLcj95fZDEAO8aJrAT18baBwh/0RNg1RfyajmV
   K+P8aEEWI/DrFJMYcz8Jnwlw6ID4ZwK6r2RgwYcqQR5IuN6rwcxHZ+SNS
   VBcQNkRo8eJpBb0CNsoThHdkw6xUgh1D8YYCU0DXEHlvWsdKZ8bsouAk2
   Q==;
X-CSE-ConnectionGUID: 0JWnZNz7ScaQgv80JADHQg==
X-CSE-MsgGUID: CRSQe82VRjqaL+N17d+lCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77842292"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77842292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:08:49 -0700
X-CSE-ConnectionGUID: wpOh3HrMTbCC+Fg6L9zpcg==
X-CSE-MsgGUID: V/SSjkoUTrasB2rthGr1Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273281135"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 17:08:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKO4-000000001vZ-1EbQ;
	Sun, 03 May 2026 00:08:44 +0000
Date: Sun, 03 May 2026 08:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Li <Roman.Li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c:434:9: sparse:
 sparse: static assertion failed: "DMUB command size mismatch"
Message-ID: <202605030731.tMtKYMQ3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Roman,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: 083a1638330951dd57be201fc53a4b86e3115960 drm/amd/display: Enable dcn42 DMUB
date:   10 weeks ago
config: arc-randconfig-r131-20260501 (https://download.01.org/0day-ci/archive/20260503/202605030731.tMtKYMQ3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030731.tMtKYMQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 083a16383309 ("drm/amd/display: Enable dcn42 DMUB")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030731.tMtKYMQ3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c:434:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c:510:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"

vim +434 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c

7c4757c20e9f1b7 Roman Li 2026-02-02  427  
7c4757c20e9f1b7 Roman Li 2026-02-02  428  void dmub_dcn42_send_reg_inbox0_cmd_msg(struct dmub_srv *dmub,
7c4757c20e9f1b7 Roman Li 2026-02-02  429  		union dmub_rb_cmd *cmd)
7c4757c20e9f1b7 Roman Li 2026-02-02  430  {
7c4757c20e9f1b7 Roman Li 2026-02-02  431  	uint32_t *dwords = (uint32_t *)cmd;
7c4757c20e9f1b7 Roman Li 2026-02-02  432  	int32_t payload_size_bytes = cmd->cmd_common.header.payload_bytes;
7c4757c20e9f1b7 Roman Li 2026-02-02  433  	uint32_t msg_index;
7c4757c20e9f1b7 Roman Li 2026-02-02 @434  	static_assert(sizeof(*cmd) == 64, "DMUB command size mismatch");
7c4757c20e9f1b7 Roman Li 2026-02-02  435  
7c4757c20e9f1b7 Roman Li 2026-02-02  436  	/* read remaining data based on payload size */
7c4757c20e9f1b7 Roman Li 2026-02-02  437  	for (msg_index = 0; msg_index < 15; msg_index++) {
7c4757c20e9f1b7 Roman Li 2026-02-02  438  		if (payload_size_bytes <= msg_index * 4) {
7c4757c20e9f1b7 Roman Li 2026-02-02  439  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  440  		}
7c4757c20e9f1b7 Roman Li 2026-02-02  441  
7c4757c20e9f1b7 Roman Li 2026-02-02  442  		switch (msg_index) {
7c4757c20e9f1b7 Roman Li 2026-02-02  443  		case 0:
7c4757c20e9f1b7 Roman Li 2026-02-02  444  			REG_WRITE(DMCUB_REG_INBOX0_MSG0, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  445  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  446  		case 1:
7c4757c20e9f1b7 Roman Li 2026-02-02  447  			REG_WRITE(DMCUB_REG_INBOX0_MSG1, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  448  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  449  		case 2:
7c4757c20e9f1b7 Roman Li 2026-02-02  450  			REG_WRITE(DMCUB_REG_INBOX0_MSG2, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  451  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  452  		case 3:
7c4757c20e9f1b7 Roman Li 2026-02-02  453  			REG_WRITE(DMCUB_REG_INBOX0_MSG3, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  454  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  455  		case 4:
7c4757c20e9f1b7 Roman Li 2026-02-02  456  			REG_WRITE(DMCUB_REG_INBOX0_MSG4, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  457  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  458  		case 5:
7c4757c20e9f1b7 Roman Li 2026-02-02  459  			REG_WRITE(DMCUB_REG_INBOX0_MSG5, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  460  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  461  		case 6:
7c4757c20e9f1b7 Roman Li 2026-02-02  462  			REG_WRITE(DMCUB_REG_INBOX0_MSG6, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  463  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  464  		case 7:
7c4757c20e9f1b7 Roman Li 2026-02-02  465  			REG_WRITE(DMCUB_REG_INBOX0_MSG7, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  466  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  467  		case 8:
7c4757c20e9f1b7 Roman Li 2026-02-02  468  			REG_WRITE(DMCUB_REG_INBOX0_MSG8, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  469  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  470  		case 9:
7c4757c20e9f1b7 Roman Li 2026-02-02  471  			REG_WRITE(DMCUB_REG_INBOX0_MSG9, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  472  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  473  		case 10:
7c4757c20e9f1b7 Roman Li 2026-02-02  474  			REG_WRITE(DMCUB_REG_INBOX0_MSG10, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  475  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  476  		case 11:
7c4757c20e9f1b7 Roman Li 2026-02-02  477  			REG_WRITE(DMCUB_REG_INBOX0_MSG11, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  478  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  479  		case 12:
7c4757c20e9f1b7 Roman Li 2026-02-02  480  			REG_WRITE(DMCUB_REG_INBOX0_MSG12, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  481  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  482  		case 13:
7c4757c20e9f1b7 Roman Li 2026-02-02  483  			REG_WRITE(DMCUB_REG_INBOX0_MSG13, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  484  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  485  		case 14:
7c4757c20e9f1b7 Roman Li 2026-02-02  486  			REG_WRITE(DMCUB_REG_INBOX0_MSG14, dwords[msg_index + 1]);
7c4757c20e9f1b7 Roman Li 2026-02-02  487  			break;
7c4757c20e9f1b7 Roman Li 2026-02-02  488  		}
7c4757c20e9f1b7 Roman Li 2026-02-02  489  	}
7c4757c20e9f1b7 Roman Li 2026-02-02  490  
7c4757c20e9f1b7 Roman Li 2026-02-02  491  	/* writing to INBOX RDY register will trigger DMUB REG INBOX0 RDY
7c4757c20e9f1b7 Roman Li 2026-02-02  492  	 * interrupt.
7c4757c20e9f1b7 Roman Li 2026-02-02  493  	 */
7c4757c20e9f1b7 Roman Li 2026-02-02  494  	REG_WRITE(DMCUB_REG_INBOX0_RDY, dwords[0]);
7c4757c20e9f1b7 Roman Li 2026-02-02  495  }
7c4757c20e9f1b7 Roman Li 2026-02-02  496  

:::::: The code at line 434 was first introduced by commit
:::::: 7c4757c20e9f1b74a42a23ae450610c140e1224f drm/amd/display: Add DMUB support for dcn42

:::::: TO: Roman Li <Roman.Li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
