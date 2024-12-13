Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371141C1F03
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085992; cv=none; b=nhm4Nek2qk7bXSHlIbDT2DeZOKyw0NUfD4jEikv2Z2/OagH1VPmfS8td5eWfP2Mhc+mvfqj6B56i1ibSOx0kYeINmnqvTeYgZH/aMo5WlLL+4B1d/w8P8i7Ue8Dc4IRR1d5bVtbdwqe1+qcT8/bu2J19ShOtx9gcMYxIqUGPQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085992; c=relaxed/simple;
	bh=eBqnCQpyIofIy8zpn9KXOsAtkOVkAULONNqZQeGKkDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdmWCLhXtvJ0F4wG/NXPmtccVybf1vRZHOrWNjDvj2jD0uon2OvSLINFzILkCcN9eN0TEGxngIzNwxor9W4dSZUBbOS3HuYMhpKifOuAna3b+g56spM3tR6yk8qv81+MVKvKFz5pYDwTwk8LwoB9tKMPAGxA1a7N3zNGXACNoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGzHh6Kj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGzHh6Kj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734085990; x=1765621990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBqnCQpyIofIy8zpn9KXOsAtkOVkAULONNqZQeGKkDk=;
  b=iGzHh6KjnRQTrJdt3iy1ugNsDEWOkFcBKvBghEPhm5X4tJqaa1OcW4Lh
   VNi85jf+vU0S1u7TmMsETb1Alz8xm6TEoKo6bplLHc9Lk8nMR+pEAqgYL
   yd5pr57fq0sDACmHtI2X2nSho0Ecw5SxWnInDOrZeq0+nE64ow3f3DoUI
   tc0XLzyviOF70MCVdDiZawJYPxpZFnyYMaf2htvx09JjMCdwTJDYnzBcv
   N4nRpXom2OhmuGceYeynSO7f6tefEQ7jMh9FWZw6Z6YBAJVSh61bn6aLc
   nCrm09HLQssDDhT3y19pnrTU8nsQE7V3IZacsb9EYdCX2dmUkb/pbst7b
   A==;
X-CSE-ConnectionGUID: Z5HMNzsxTl2G0IrKcWa3YA==
X-CSE-MsgGUID: o+uKIYbtR2y0Hye9tanRAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34449657"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="34449657"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:33:03 -0800
X-CSE-ConnectionGUID: O7rvJ4BbQTCMKFj5YSlYjg==
X-CSE-MsgGUID: /U8RXO5WTd+9DdZ8I/BR6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="97062693"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 02:33:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM2yh-000BwH-27;
	Fri, 13 Dec 2024 10:32:59 +0000
Date: Fri, 13 Dec 2024 18:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2071/3764] {standard input}:1771: Error: register
 save offset not a multiple of 4
Message-ID: <202412131848.p71aDjqP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
commit: e240d57b1011dace567a4fa59d8f42427a1ba56f [2071/3764] bcachefs: Plumb bkey_validate_context to journal_entry_validate
config: m68k-randconfig-r064-20241213 (https://download.01.org/0day-ci/archive/20241213/202412131848.p71aDjqP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131848.p71aDjqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131848.p71aDjqP-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1771: Error: register save offset not a multiple of 4
   {standard input}:1772: Error: register save offset not a multiple of 4
   {standard input}:1773: Error: register save offset not a multiple of 4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
