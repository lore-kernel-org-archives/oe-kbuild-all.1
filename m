Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967ED231857
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669646; cv=none; b=j42WudvUR4esk3bbbJ8h9RfJhpNAY2grfIIzS5fmEFS4riy8arAUh+50v6jRROmQYFXVg9+Q7hx+MDCmMGeCrVUX3QOWs8h5346Fr1+SebgaONx3z3If9YWzCD+z/4dW9Ltvgn7Z7GoZu9brSAFC02Fuse6xRbM+z1mW31jkgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669646; c=relaxed/simple;
	bh=sSy3oSVHZoopfQCCKzpLnVTV2ehP2tf+PqZ6MlggMSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjvydAW1nJ8kDTKJ3cCZGxd5+zMn/xY1rlj07ZvoM0T8pdBTtnXBpr8rUY5lYeNwAHRYGDWoWZrbgSZz9HOh6h3PnzzeHTfiKNXfmiTThdyfbqlgxrfKs+T1Jr2XmPzHxHNDWBzcnVs/9F57xFqMvg6XGpjHQe7KWiIFKD1DG9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wyp8Cq2O; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wyp8Cq2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750669645; x=1782205645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sSy3oSVHZoopfQCCKzpLnVTV2ehP2tf+PqZ6MlggMSE=;
  b=Wyp8Cq2OWNtTT5OJEzvn07l7vQ2w8wrqktlEzTBNDAWK2F7MgI3GVZLe
   XJTGGdu5HOqfMpHY6B+4z+Wng/dhiSRsr22KD0j0AZ/Dy6ffEGLS/qD5L
   mBhPq+xesj8xpjGdSwb6z0KOPYbYZiTaHhzdPex+rz4TUl7s30QqEFkHv
   JxWnH0LIHZp+M/gaHIx8imPFrS89Pn6vsSZZRwra0OT6cq1OdjbTp7J9O
   NQIA2/47ftUx1yzhfSsJHF7eoDXPadKM0wrETinrJLtZUnduCCszKNfdX
   iUNbxI820qdc708ByvZG3XeyprDnmmh1zGa5GD2TI+vS/vNeApQEiQ0xN
   A==;
X-CSE-ConnectionGUID: H3BtREm8TdaQwKZ2UAQ85g==
X-CSE-MsgGUID: wbGOyyAJSOWXL2l+lsOuGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="55501708"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="55501708"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:07:24 -0700
X-CSE-ConnectionGUID: SL18HV/QSpWj8XIRSLXV1w==
X-CSE-MsgGUID: lKG5jC65SB2lB6QQlsWv6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151828506"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2025 02:07:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTd97-000Nt3-0B;
	Mon, 23 Jun 2025 09:07:21 +0000
Date: Mon, 23 Jun 2025 17:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/5] rust: convert `Arc` to use `Refcount`
Message-ID: <202506231608.YC1IO3iA-lkp@intel.com>
References: <20250622125802.3224264-4-gary@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622125802.3224264-4-gary@kernel.org>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e04c78d86a9699d136910cfc0bdcf01087e3267e]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-implement-kernel-sync-Refcount/20250622-210132
base:   e04c78d86a9699d136910cfc0bdcf01087e3267e
patch link:    https://lore.kernel.org/r/20250622125802.3224264-4-gary%40kernel.org
patch subject: [PATCH v4 3/5] rust: convert `Arc` to use `Refcount`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250623/202506231608.YC1IO3iA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231608.YC1IO3iA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231608.YC1IO3iA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: this URL is not a hyperlink
   --> rust/kernel/sync/refcount.rs:81:9
   |
   81 |     /// https://github.com/rust-lang/rust/issues/55005.
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use an automatic link instead: `<https://github.com/rust-lang/rust/issues/55005.>`
   |
   = note: bare URLs are not automatically turned into clickable links
   = note: `#[warn(rustdoc::bare_urls)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
