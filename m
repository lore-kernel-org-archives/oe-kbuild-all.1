Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B672E62C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767283625; cv=none; b=l+DiyoBDl7d2x00wDZgBdIbvIbKU64P16+sRWO9szQ+/CT48xvUNXmeqwwu5/3fYNq1uuJl3d8BpaBc0FEUSmWu1b5cqijEFEl8eDwQd4BV3cFB/eGmS7EWI9nfOVASvqMqCopzPvxkX+NnT7xxRh23xFiNFUGy/zy60vEhNmxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767283625; c=relaxed/simple;
	bh=oJ9sBYlTn/8Fa+VPi7fyxVjIStWrfWY8C0ewMPLvEPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZfVBFY/C3Wy8L1HTh8+pVddG/c/YZhLKB4+Lx5WBI6l85a6m4CBIfAXI4WmBzjkwVYnBTsKweAl2kLsbooQ50Z+ijkUj3C+hFq12H8XpOpigrWZUJh8kveGEqc8v32c0gEcpfjReyAf5GFXur4Mc5FdrBinfufD3hWkxnbETz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enDs18Er; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enDs18Er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767283622; x=1798819622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oJ9sBYlTn/8Fa+VPi7fyxVjIStWrfWY8C0ewMPLvEPg=;
  b=enDs18ErWqmyHzFushxeudkL9VNq3UeAwWuCI2qpXiaP8Yk5TphskEM+
   ryUuOCmmiNESJygFwt7C1DtylwJinsXW6mPRySM7Mp3d2CehMdn9pVGM3
   4m7n9HsJDWZX9MmZxMlM39vVCgp3K70GnWP/4SApceB4bF+GAQN4YGtTv
   eHa2XlMwG0yhWiajI9fdrbI9ifuS/yYQaEdoZS/YYwO7CgznE7qq2jlZf
   fTYdTFOyHPaR71PKx4A83gVju/Z65JBxBuu36+i+Ex/APQx0oSfJV3wBd
   aMo1r8FyBifwDOBrcwrrGJEvP0ntg4k1hBXrFz87/n6fDIqTl8YYxHcXH
   g==;
X-CSE-ConnectionGUID: 0OqLwkpkQBir7kzfApEslQ==
X-CSE-MsgGUID: ziKCms46SROl76PjaxQ6PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72663063"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="72663063"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 08:07:00 -0800
X-CSE-ConnectionGUID: JD1x4bwpS1ql3ntYiVZyTQ==
X-CSE-MsgGUID: v6FG23oTQKWJ5KRKqoSWgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201547218"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jan 2026 08:06:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbLCT-000000000IT-30fH;
	Thu, 01 Jan 2026 16:06:57 +0000
Date: Thu, 1 Jan 2026 17:06:54 +0100
From: kernel test robot <lkp@intel.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/6] rust: debugfs: WIP: Use owner for file_operations
Message-ID: <202601011701.WuRTPROc-lkp@intel.com>
References: <20260101-this_module_fix-v1-5-46ae3e5605a0@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101-this_module_fix-v1-5-46ae3e5605a0@gmail.com>

Hi Kari,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kari-Argillander/rust-Enable-const_refs_to_static-feature/20260101-172411
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20260101-this_module_fix-v1-5-46ae3e5605a0%40gmail.com
patch subject: [PATCH RFC 5/6] rust: debugfs: WIP: Use owner for file_operations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260101/202601011701.WuRTPROc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011701.WuRTPROc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011701.WuRTPROc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: method `create_file` is never used
   --> rust/kernel/debugfs.rs:522:8
   |
   508 | impl<'data, 'dir> ScopedDir<'data, 'dir> {
   | ---------------------------------------- method in this implementation
   ...
   522 |     fn create_file<T: Sync>(&self, name: &CStr, data: &'data T, vtable: &'static FileOps<T>) {
   |        ^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: associated function `file` is never used
   --> rust/kernel/debugfs/entry.rs:103:19
   |
   83  | impl<'a> Entry<'a> {
   | ------------------ associated function in this implementation
   ...
   103 |     pub(crate) fn file<T>(
   |                   ^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
