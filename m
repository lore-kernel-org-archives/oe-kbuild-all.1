Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D242BE7BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948959; cv=none; b=DGbcLFiUI4QRCq1TpRkthZBJv6M/XVaUt/lcFwcV6IlfUSvj7uI+YdqtRVZD1t9ELLR0mb3pY/3rcYK2AfTvST+W00p0Ejk7TX8LknCsEkatNYYsiETqKFi/IgWj6CEVPXnxHrAd6wYt506jvguGOeSisE3ImBUD1OyUxuv3MjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948959; c=relaxed/simple;
	bh=NYW/PgnTXeFfdpQ4jOEdzfB4bwLYS8qx2Tohk7uPTYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gAMxN/thCsNFs8Ht9ARCABq9LBCmRrfx8w7Zn2lktLLvgE/4JWaelNQ3z8FFIvRn6F3Q0CL+YNHp5bLm9Mq8rjwx/QRp4evGS4Vo6ZtBY2xfuVK4SieZnecJWN+mf6qULefzOj99Po43OnzW3bFwe3vn/S/7OChtrqDo79OWZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1xuTvsn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1xuTvsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948957; x=1806484957;
  h=date:from:to:cc:subject:message-id;
  bh=NYW/PgnTXeFfdpQ4jOEdzfB4bwLYS8qx2Tohk7uPTYE=;
  b=Z1xuTvsne6rvQiMJGH3deWGdJkO0ZhKtlel0tNgo+60xprvKJBAbZ6+7
   zAQODrYNmRL+41SwTVtiFQeBLynz25DhNGGQmeFjaV6WDAruHxfJxWxvU
   sougu1HHf+NWsd2ybtdFm6H5kjhRLSyTat1ckV3kLZ2z/YdnoOlYnYzuF
   Qxu/DAGFj3QXsHtSE2MqZZrWA0fpf+kZaeBwjv0w/zqlpeca8Sz3vQB3K
   8pH5E6wYRAbo/ID3rfAiyyVRPm35sn5UYuuNJMm8T9iryA61gNLPsNfQq
   EfnDD/nXeUDgKBvg7foiv6SgTnOF0j5YoAMhFCRq6ouYRQsGjIzWE8nfy
   g==;
X-CSE-ConnectionGUID: nPA5w15rS2SrBR+9C7dxHQ==
X-CSE-MsgGUID: 55QjQv68RfKYOlZA5LZ6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79556598"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79556598"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:22:37 -0700
X-CSE-ConnectionGUID: aPjd+e/3SNmeZMcpBh/5+g==
X-CSE-MsgGUID: 5ghivsf7RHe2m5nX5FA/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230379274"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 02:22:35 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7VIu-000000002Sx-2er9;
	Tue, 31 Mar 2026 09:22:32 +0000
Date: Tue, 31 Mar 2026 17:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 157/186] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-ID: <202603311743.uZYPu1Gn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   24e341657c283c965e3bfee0baa9ed0376127973
commit: d310bb41720b8e81d704444fec89e62c286dc9c7 [157/186] userfaultfd: introduce vm_uffd_ops
config: x86_64-randconfig-r133-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311743.uZYPu1Gn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311743.uZYPu1Gn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311743.uZYPu1Gn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   --> drivers/android/binder/page_range.rs:146:23
   |
   146   | static BINDER_VM_OPS: bindings::vm_operations_struct = pin_init::zeroed();
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   |
   = help: within `kernel::bindings::vm_operations_struct`, the trait `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
   note: required because it appears within the type `kernel::bindings::vm_operations_struct`
   --> rust/bindings/bindings_generated.rs:73862:12
   |
   73862 | pub struct vm_operations_struct {
   |            ^^^^^^^^^^^^^^^^^^^^
   = note: shared static variables must have a type that implements `Sync`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
