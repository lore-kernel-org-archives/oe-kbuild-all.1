Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A8221FB8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169710; cv=none; b=n1kXGZIWMtxYo8hQk9ncnCm3jsdncn9XI41MwVWalWsuaRiR4e7w3LXKvWzhSFQwocBGTaaHQbp4hQFhbrVc0YFekvd0/w5l9eF3YAIRDAL3ogAMDuIqb94crM+LEbOvRGILB+7U01sunr+VQj556kDFpA3ALIXNM9fdoehN/CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169710; c=relaxed/simple;
	bh=O+pV/BdAK0CPXRc1l6VZYQ4kDVjxQevrbfyl8/unl3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ndP0X9QgCrfpnENF07nfD6xYQfns1WozV4nJxUtT/qS6+hxnLDFKAHnwCYyAq0aYMPUrIa7ThFLrmfPLTUZGN/gx9lR/ksyUFI2ov8ZV1ZCPknTqx1J/GFzwUaG60jRvDtk7r6M5KS9XomPew8W6mzMmmgn4YjdgRp2jwO7WAY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+rmiEp1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+rmiEp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746169707; x=1777705707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+pV/BdAK0CPXRc1l6VZYQ4kDVjxQevrbfyl8/unl3s=;
  b=R+rmiEp1dP/F/BcMKKTgYiIdLxg/0GE0OP7A5VhcrjLq4bdPY15MSd63
   RCZE6ghXt0fXjkT4sQyxcg2NJJI4rVt9H+B14qWqXPzrJR1UBVIl4gQX3
   znqYc1X6UOSjg38L6kMdJGjjlphutvidAtKblQ/UF9wV3BKydcv/pKSbe
   /H3w8i8hIrjL07kfL5qufxXyw1m/qZnJb0MtkRkNwzkl1QUQ2/y668nmj
   ZjdDcRGYsB5xClFl14a/iDaOUdE8rr+WI2Dh7yE3JkW6LxkSLHmDvAz4a
   GLEHu3oyGcRKOdDUV3S8unRNMQJRPrKVIyRanvJdEB1miVodZzpsHbjDG
   A==;
X-CSE-ConnectionGUID: d68nnR7ZTcyMWaQSZ2qW7A==
X-CSE-MsgGUID: lMw0ShbMQPC266I0KrSvoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58057513"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="58057513"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 00:08:27 -0700
X-CSE-ConnectionGUID: kQ6joqzhSmyghVV6zCMQRA==
X-CSE-MsgGUID: vA5SjuLUTtK7gZ2wGeuSXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134325700"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2025 00:08:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAkVT-0004b3-1C;
	Fri, 02 May 2025 07:08:23 +0000
Date: Fri, 2 May 2025 15:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 24/24] error: expected `;`, found keyword `self`
Message-ID: <202505021531.nIeqSHHm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   d4b7a9767da11daf9c95a73d457edeb0359f7c9a
commit: d4b7a9767da11daf9c95a73d457edeb0359f7c9a [24/24] fixup! rust: num: Add an upward alignment helper for usize
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250502/202505021531.nIeqSHHm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021531.nIeqSHHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021531.nIeqSHHm-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> error: expected `;`, found keyword `self`
   --> rust/kernel/num.rs:13:36
   |
   13 |         self = usize_align_up(self)
   |                                    ^ help: add `;` here
   14 |         self
   |         ---- unexpected token
--
>> error: expected `;`, found keyword `self`
   --> rust/kernel/num.rs:13:36
   |
   13 |         self = usize_align_up(self)
   |                                    ^ help: add `;` here
   14 |         self
   |         ---- unexpected token

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
