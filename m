Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C541A08AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755213620; cv=none; b=joM5mVX29a471SfqXbSufF5Ohf0WYUwjSLFFC6i+XObhVIOH6UtlZC29JfV3HFpBL7rbixfhJ6YWNbuCZeuf+b+0xeMxvh7oSi1xhaZWwiyHS68rEDj6ZLPo8NO+MmpyYtFJ7knRWKJgwneTFLYgMv15jvTtWt2P+N9YXcE56NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755213620; c=relaxed/simple;
	bh=bjlspsgALF1F+mbj7U4jz3KDVtpTC45ftjBYFPRr2L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=glxL+H+A74QhjrCsGspPebaWF0KxWdjkzYfinPiG33gVr4unmtPinJNseQz8anCFwbrRNQu2n/PAu4V/8X5PlUHB8YjTkseTZAj1h+ulTHaTdxTQUtFs/TWGqnZUKXfRK/BsHj+XToOYchEiYFhl4DGovZq2ndzvx4ucRRgZzVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AScLWcX6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AScLWcX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755213618; x=1786749618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjlspsgALF1F+mbj7U4jz3KDVtpTC45ftjBYFPRr2L4=;
  b=AScLWcX6cn55LfIikBp8O4kL3KXoQBL3e6t9al5ZKXd/bwFW4zqEzXto
   6VwFpIItz08AwIwILPt4LNHxT/RhZaE5V4vXUuvL9VkTsKsBBRm7wjhir
   P31ISLCdJHrSxFsLAIpkDOwiFrHhPus8J2As8rOmNDEGKW6eGqMQlzYYY
   KIPm0yRz73lW5KkyGmKKPgq3C8MZc6ZNXODtTZ/Gt0RffTOO8+VaVCnuL
   Joirum6WKE7bi68scRs6hHVYg3pjMOL/3a1jchassZtFk8q/LmRhks97E
   FTWog/IZefgU+6Tcfe4kjQMgPtbTwJM//ZrbaF52ZH9dvx8hH6AfbwWnr
   Q==;
X-CSE-ConnectionGUID: Xrq9BZWWTPSwfRG+90Lzuw==
X-CSE-MsgGUID: YSAbw6FZR5uN1wKtLWVBCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="45118715"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="45118715"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 16:20:18 -0700
X-CSE-ConnectionGUID: 0O7QwIayRnK5PCidRywGQg==
X-CSE-MsgGUID: l2jVIG0MSBmNuAliBjqZ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171079805"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 14 Aug 2025 16:20:15 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umhEy-0000Mp-2z;
	Thu, 14 Aug 2025 23:20:12 +0000
Date: Fri, 15 Aug 2025 01:20:00 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 456/456]
 drivers/net/ethernet/intel/ice/ice_txrx_lib.c:359: warning: Excess function
 parameter 'first_idx' description in 'ice_finalize_xdp_rx'
Message-ID: <202508150142.XhkcaCRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   e61c4ff0d66782e41c3eebfc98cb8ea51f6fad45
commit: a9ed3db251b108581cb7a5de94be6f8c949506c6 [456/456] ice: fix W=1 headers mismatch
config: i386-buildonly-randconfig-2003-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150142.XhkcaCRb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150142.XhkcaCRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150142.XhkcaCRb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_txrx_lib.c:359: warning: Excess function parameter 'first_idx' description in 'ice_finalize_xdp_rx'
--
>> drivers/net/ethernet/intel/ice/ice_txrx.c:986: warning: Function parameter or member 'rx_buf' not described in 'ice_construct_skb'


vim +359 drivers/net/ethernet/intel/ice/ice_txrx_lib.c

0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  347  
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  348  /**
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  349   * ice_finalize_xdp_rx - Bump XDP Tx tail and/or flush redirect map
eb087cd828648d Maciej Fijalkowski     2021-08-19  350   * @xdp_ring: XDP ring
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  351   * @xdp_res: Result of the receive batch
a9ed3db251b108 Jesse Brandeburg       2023-03-13  352   * @first_idx: index to write from caller
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  353   *
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  354   * This function bumps XDP Tx tail and/or flush redirect map, and
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  355   * should be called when a batch of packets has been processed in the
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  356   * napi loop.
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04  357   */
eb087cd828648d Maciej Fijalkowski     2021-08-19  358  void ice_finalize_xdp_rx(struct ice_tx_ring *xdp_ring, unsigned int xdp_res)
0891d6d4b1fe1b Krzysztof Kazimierczak 2019-11-04 @359  {

:::::: The code at line 359 was first introduced by commit
:::::: 0891d6d4b1fe1becf1a77353b03449955820084b ice: Move common functions to ice_txrx_lib.c

:::::: TO: Krzysztof Kazimierczak <krzysztof.kazimierczak@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
