Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167E41369AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 19:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708025153; cv=none; b=qs/JfMeHQW8ag8X66ycc9RoiBLKOY/Lo/tnOwKOSdxPhT9jttZdNUnPTqU0y4vB04Qn+ZYPh3rkpwXtkgNHyAIUsGtjakuFtvFCSqIe+QzF0KA1niC91nXjra7WpkCVo1EXjYBHLKP3X0SYMb/svoReIqu3q2/KqW+6kbnDKw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708025153; c=relaxed/simple;
	bh=Eq9TnRz9r/l+lZsQkaaYBfo2rmNfT7a/hMwAPjE5QM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WsoK09W9WEkqIUkKKgI48qwVogA3hFQTl0d6qkpzb6pQUTzEDRMkuyRcCTOrKsybs+62GetKq07VTgHEmeWG3roaQFU4n9SloT+vylaQ4+OzpOOmvYqNjZSC+41XTi2QlhWb+ZSpcPDBg12Rk5AgIw6Blh2Inn41DXJsc7/EQzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpekHvu+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpekHvu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708025152; x=1739561152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eq9TnRz9r/l+lZsQkaaYBfo2rmNfT7a/hMwAPjE5QM0=;
  b=TpekHvu+/84csgHK+nJx+Qem0F4FKWVvvbeGIZOuOVxB2zTi9ZJMnCBe
   7uZWUWi2ZG0RWxMeDcSxvaQYekwx7vjqOzkw1J/64psX/RcVTL1d70BAm
   FemdwbR9fXgteHyTvGq5Y6tLgFl+Y3HX33K37s9l1Gnv6kinq+C3YHrw1
   saCW1KGfz8xx8vsJK1/kcj2obxE+RrSraEn6koB/sKqe1I0jf7/Wj65h6
   QrZscl190gcTzJdwNwVNrBlsaURf0PU+swT4wZKStfUsKkKfrNRNODF1P
   NzbiufcpBGO+zW7M1tafKeQNGmdbqcA185ZrZ+UhaXfmQlTPIQx+omrfe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2286945"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2286945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 11:25:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8291522"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Feb 2024 11:25:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rahMh-0000ia-1J;
	Thu, 15 Feb 2024 19:25:47 +0000
Date: Fri, 16 Feb 2024 03:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/3] error: unreachable `pub` item
Message-ID: <202402160328.zlEm4UcF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3ed8a86bc8a0933fa5cae5d9d718f729b5e96905
commit: 3629eb70a63350b6286be8104be25dd64410a3ce [1/3] FROMLIST: rust: uaccess: add userspace pointers
config: x86_64-randconfig-016-20240215 (https://download.01.org/0day-ci/archive/20240216/202402160328.zlEm4UcF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160328.zlEm4UcF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160328.zlEm4UcF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unreachable `pub` item
   --> rust/doctests_kernel_generated.rs:4713:1
   |
   4713 | pub fn bytes_add_one(uptr: *mut c_void, len: usize) -> Result<()> {
   | ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   | |
   | help: consider restricting its visibility: `pub(crate)`
   |
   = help: or consider exporting it for use by other crates
   = note: requested on the command line with `-D unreachable-pub`
--
>> error: unreachable `pub` item
   --> rust/doctests_kernel_generated.rs:4789:1
   |
   4789 | pub fn get_bytes_if_valid(uptr: *mut c_void, len: usize) -> Result<Vec<u8>> {
   | ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   | |
   | help: consider restricting its visibility: `pub(crate)`
   |
   = help: or consider exporting it for use by other crates

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
