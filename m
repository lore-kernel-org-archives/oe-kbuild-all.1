Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02304A11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 02:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753585166; cv=none; b=qrqauZgSX3LRUpuVW24pxJKpNhQ79cbh3ttXGFL+ulUlG8pglPv7DjzFDvYrW2528Im0v3sM0OLwXzZ+Ey5v8K2GG+ZqJOfYZpE2Y7nP7h7qrNVl4rDH8ZCAS8u7+3ycYC2mH7rsLGR/4ba6oVmTpj3So7y+btt91Av9K5Xxl4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753585166; c=relaxed/simple;
	bh=VruJsr/69K9WJER3hQ1HwQQqanunq4EPngfW5JSQAvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YVoKExL2STNdFmY1Pkc02DcLlBoCCkEItWaYqit/wDs0pk8cp/dl147XtlSbniFS/XFjPXvTTfMGlth/hCOghxUagmNgqtQiYDsY3EgdCEJpliF7MkElbB1WK5bvutDGznCJRX7JiZBmqczto3W+jk5SrIvyP9xNlaWAtqHz7EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTlZjAg/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTlZjAg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753585164; x=1785121164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VruJsr/69K9WJER3hQ1HwQQqanunq4EPngfW5JSQAvM=;
  b=kTlZjAg/0jFvtikHnvj+1B0ynkoqYoAWX5AXJENi8EVHrepaImynmOk4
   7JLeRcaJxipq6VTUFlc66MG5LVrzm+LF0vZM6ox6cTa00W94QK6PgGSpN
   Ja+8ozO+faYXB7UqEvJKLEVBy+orTVHw7IkS3PKhPB9yK1fVOyKCcTtYR
   oTBhJKnyPIWWEyrnuaH87m3WdTYBFKxruBr64y0t0HOune2YN9BxYT1Dj
   x3T4LlnRm5AJudEN+oygn7L0RTzzvq14JhkQWaeJQfa3aekyqulYJTDDD
   vbfaG1YRnVplG6iTxUsQznwtoeKe8LOhl6bMxHZlngrYHNYf2xuEQx0Gx
   g==;
X-CSE-ConnectionGUID: /fMozeMVSFKUnmr0/OJHIQ==
X-CSE-MsgGUID: rVQrgYz9RHeTPmaGyjwSWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55752386"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55752386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 19:59:24 -0700
X-CSE-ConnectionGUID: BUi4tya6Q6OdeYQkx9Knzw==
X-CSE-MsgGUID: uTRP0JUeQ3aWYK4fcdnG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161585604"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 26 Jul 2025 19:59:24 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufrbd-0000MF-0j;
	Sun, 27 Jul 2025 02:59:21 +0000
Date: Sun, 27 Jul 2025 04:58:33 +0200
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/irq-2 33/86] warning: missing documentation for a method
Message-ID: <202507270419.UItjfnc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/irq-2
head:   66760845172d63f85c4edfbe93a126e71d722105
commit: ec3aa243da9f43c028ed0bd96edde9e5249a4758 [33/86] rust: Add dma_set_mask() bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250727/202507270419.UItjfnc4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270419.UItjfnc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270419.UItjfnc4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: missing documentation for a method
   --> rust/kernel/pci.rs:397:5
   |
   397 |     pub fn dma_set_mask(&self, mask: u64) -> Result {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`
--
>> warning: missing documentation for a method
   --> rust/kernel/pci.rs:408:5
   |
   408 |     pub fn dma_set_coherent_mask(&self, mask: u64) -> Result {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
