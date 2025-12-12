Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E35277819
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765572262; cv=none; b=dy9m4KqdXDd7fASMFkGgLniYw3uPz86XZwgSpRERXozbg8WnTbm+1vohTpROUWxVYDJvT/EfiK5fZOnYzOMHnQQJ61d3DxF3yb3b3KxkAia54VC5yhJdC/X4n9m1Md4b8PU0Q60Pmjf4fVRC0YeY1BGIJTMtKdcZLG+0qDrriFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765572262; c=relaxed/simple;
	bh=kjRtIPiOxLB5x2R3j8DmdvLs8mAroe9qjI7e9whoDC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K85qCuUW9YgZzrGFWu1fYjy05oaAwmPASIjfehZCPuW5J/Vev9a0x0qxEEF9E40du2BHWSXvYbNojn/8vF+rQZ0EhX+bAC9p/elt+CqGXZZAvtLKBdcf8z8PMtqmRSqA5XGYCHFuzg6yElv8ZqhXp1Tqv6iL4BLWfFHtN1bUq7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pc4pOFoQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pc4pOFoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765572261; x=1797108261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjRtIPiOxLB5x2R3j8DmdvLs8mAroe9qjI7e9whoDC0=;
  b=Pc4pOFoQgU9uTlDs7Pk+p2TkTpRz7+fF9fm5y++qsitYQtBMzWlAi3vY
   tgMsOwJPNDdTTRyBA0e4wBPNtfNzTcECbz53lt60Q6GOHGatKPKYvG8+j
   ox6NEqxRxS0zMsBhasAXRNXNrUZurHxlX58/EiIYVKeQRgZui4QZvo9WU
   8JoQ/HxJqa1nOXYG3vvnqWfi88/o6WwtWYhsIAnUTx/mpV+N5IHL3g4Pq
   ZJ7YFYJR3XuaWfXwSaECP3ck2H+ZoWvJemtjBnnGQyZKjrpS4O80vV0om
   tjh91tnkiCRvRKL/l9XNSS/qmyY7Zg7RctBwlwlOBqfSzrCH1gMIRYG7u
   A==;
X-CSE-ConnectionGUID: zKVRY5qXSoOPCahf/BN0Kw==
X-CSE-MsgGUID: DCkkvWxhSQmQ6bnxnS1fiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66570349"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66570349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:44:20 -0800
X-CSE-ConnectionGUID: dzArCp25Rk+mbctLdp4QRQ==
X-CSE-MsgGUID: x92aSsPJRlOL06mrHZs2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202102586"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 12:44:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9zt-000000001q8-1Hnu;
	Fri, 12 Dec 2025 20:44:17 +0000
Date: Fri, 12 Dec 2025 21:43:52 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/1] htmldocs:
 Documentation/trace/debugging.rst: WARNING: document isn't included in any
 toctree [toc.not_included]
Message-ID: <202512122111.3AkgQBgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   2f3054161cdd6f1c7a3f205a60e538b7f022f602
commit: 2fcd5aff92aab479a9a89cfce2dbc9c6a9455b4f [0/1] tracing/Documentation: Start a document on how to debug with tracing
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512122111.3AkgQBgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122111.3AkgQBgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/peci.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/energy_model.h' failed with return code 2
   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
>> Documentation/trace/debugging.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
