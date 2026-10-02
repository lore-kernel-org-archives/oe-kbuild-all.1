Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838CE43C7BF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926507; cv=none; b=MmEYGzsyWv3kDKeKRjLT7lsz+JoEF8q32CziQVCPfI8Z4kqqtYlnbecaRXCXQQk4M/aa2pkBIk+iiNYZbuGx3/9IazoOLpje7yTdenlK+QBePE8tQuokKBGMtJuD2Fnu1V8xFgGruaR369xTdMVp0Z8EixxqXbm5vENQvqDX+XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926507; c=relaxed/simple;
	bh=Ll2XlaZaKj9rRjYBnprYXHHcw4EJTUYPRJCxjD+9h/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ligme+SI9jXa23xfLRmsZtEz7WWiWP2sgZzv/rZo3zwWB0SSSKPT7XpI3QU3SgO4ZzENNadRV5uMBPZ2k7CZIUlHTLP3W5Z1z40BNrmhHI04UAIAm5DTQe1t02VoDzp3cXBNDg2AgaEDc31d2a8kXL0+224B6Dnk3vD86eBk+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVe5tF3m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVe5tF3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790926506; x=1822462506;
  h=date:from:to:cc:subject:message-id;
  bh=Ll2XlaZaKj9rRjYBnprYXHHcw4EJTUYPRJCxjD+9h/M=;
  b=nVe5tF3mrxqPLJZO8M+pIdt9eKx6cSWTU/Kunw/+Sb8Z6Sdtt3qVRNhb
   viy2TFMMbJZun0W/YMSZbYN+WVOT5UNhh7sm2a3RaTrUOYEFehKL09xV9
   5fiB/JgwQ1GkBtoWFM58Qj0XzG8ZlBfliDpanVHotxbqryf03nYxmb5vK
   +d880flru+EmlLd+yh4HCYFkKdnxuqL0bKpYxVFKa03S4dmt1UXuTy2cc
   /vUMMfw1Be/Rts+jbFEc0xcqc0bLcrYomaquu0VglGURfYMbI5ECBIP/c
   c56DcUCruzRyImV6+nGmbE/UBR4OMRVRWeHUWMt7aqZGpdAevFUwz8oo2
   w==;
X-CSE-ConnectionGUID: 867CxrlSTz+EpWbxgZ3r7w==
X-CSE-MsgGUID: pCNG+cGFRFu8i4JyjbPtxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90829485"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90829485"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:35:05 -0700
X-CSE-ConnectionGUID: yn7NNFWfSYqBsG2F1Hwfdg==
X-CSE-MsgGUID: i1pPaMXASi6fRpvNAMvAUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="204899"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 02 Oct 2026 00:35:04 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCXnG-000000000SN-3gy6;
	Fri, 02 Oct 2026 07:34:59 +0000
Date: Fri, 02 Oct 2026 09:34:31 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:dev/selfref 29/49] warning: using `clone` on type
 `Variance` which implements the `Copy` trait
Message-ID: <202610020927.eNvWSFQ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux dev/selfref
head:   63b01fa5c495532c8f631cce076471a89c78001e
commit: d79b92740f4d9ff9d9f4fb214f0c055e108b6340 [29/49] rust: pin-init: internal: pin_data: infer self-referential struct
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610020927.eNvWSFQ2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020927.eNvWSFQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020927.eNvWSFQ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: using `clone` on type `Variance` which implements the `Copy` trait
   --> rust/pin-init/internal/src/pin_data.rs:277:31
   |
   277 |                     variance: wildcard_variance.clone(),
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^ help: try removing the `clone` call: `wildcard_variance`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#clone_on_copy
   = note: `-W clippy::clone-on-copy` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::clone_on_copy)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
