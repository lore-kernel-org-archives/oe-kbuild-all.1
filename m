Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7202D2495
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 22:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787090753; cv=none; b=mEWncp/557exr7KIe/rx2FYHXkkvrLT/e20wDzIKBlBtSCpn5ou1rAosqvhGT6Tn0uVlCnYAIjDt1H1LLwHRm3Gn8+UUT5KdtftN50AulVBI7F5XZBrXVomdqxBugrq8f78aEq22Mz3cmT8At4CdAdkFAfGnj/PmB/LUG9ebRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787090753; c=relaxed/simple;
	bh=npjXiA/jKj3l/CxQsQyScphUmJSkdp+k6qr9XAA+tEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OUQjmpRovK19xuvgXlbB3t0RXBEKoUJE028FxWmD+iZb1slUTK7LCjTXMUGAI6YTPPFnRC6faSTe5y0QRvPbIlEX63WITVcBnjkH1tfXh7q/5PAyVjgCbMYHB6IrHaW9NRx7AdckBst5DFrdZwHJf37tJaf6uS035KbN7UabvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDEXSevs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDEXSevs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787090752; x=1818626752;
  h=date:from:to:cc:subject:message-id;
  bh=npjXiA/jKj3l/CxQsQyScphUmJSkdp+k6qr9XAA+tEY=;
  b=oDEXSevsEDmVhKtyddug8l3jQRcGGPr8DjAE8+oVeGzhthwW6jNmuPs9
   OQHkDRiGDdXdo3IqtKeOFrl+OlYrj/hxa8wc8kYM6YpMCYtPCKN3UnjL8
   6Xg7pjeh3uOIYKCKp6TckbudDf+G1TT81pVEgMjWSpfUjFQEqWEavGzIq
   576/0w2rVWNYawi7iTIRNRwVnurTfHjgV9WUUjETO67HoZPWBxj50YylI
   o2fAA7PfK4yLmhJe8wY7ZkqRJbxB6i52d1R8HW5FjCTBqQK+Jy3/eYlfS
   rDIiqMoB8dMnvgF1cKlBq2a2X56RwU0TNhuqcImZtgIbJGt9yEfDIlXra
   g==;
X-CSE-ConnectionGUID: Nh7Y5cCQRfi+qdlse/+3+A==
X-CSE-MsgGUID: E6x2OHgDSfG3Byi2OH4N4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87615658"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87615658"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 15:05:51 -0700
X-CSE-ConnectionGUID: VUIgdRwiQxyAxJaMfsQ9lA==
X-CSE-MsgGUID: 7eLClg2YS7uQDJwpbTdaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="295271688"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Aug 2026 15:05:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwRwJ-00000000edq-0zFc;
	Tue, 18 Aug 2026 22:05:47 +0000
Date: Wed, 19 Aug 2026 06:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>
Subject: [linux-next:master 10759/15982] ld.lld: error: undefined
 symbol: kunit_mem_assert_format
Message-ID: <202608190536.d9qCkWWc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
commit: 83df7b5fa6735b5084ecd296a0f67208650ba497 [10759/15982] HID: hyperv: add KUnit coverage for device info bounds
config: i386-randconfig-r123-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190536.d9qCkWWc-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190536.d9qCkWWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190536.d9qCkWWc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_mem_assert_format
   >>> referenced by hid-hyperv.c:697 (drivers/hid/hid-hyperv.c:697)
   >>>               drivers/hid/hid-hyperv.o:(mousevsc_device_info_valid_descriptor) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
