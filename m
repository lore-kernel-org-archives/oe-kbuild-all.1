Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD3413211A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085687; cv=none; b=kQ0320cNrDi/78A8m+RMgp0clFyV3sQbLF+Treeu8i+kLE010M1l7soRh1527zKx8inmec9JgeeS5he8FPjEMfkedhR+/osmO0lqoXCJd6F28BQq+PYEcosNjnY3x+xLV87zbi8R+6edxWHf6ivuiIsQluQEb9i2QsCD7oaeZdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085687; c=relaxed/simple;
	bh=QK8O3VdMRAxTLTNkULZk4IBic2LrorxR0tGhcqQTdjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eypNK90Q1GGTufQfDKZsJL4pUA/0jhi4CBxoHadzsiINXdvSDd3423bNaTtaPZ7RQKnH8vWYPA4hVy1p1z5LF9w9a88/Pf1lUQbUkC2iyZwh/g96JWGB5lT1lZ4Jl6mTsWynGTURRtC4zHBspl6alnYLpLR7flsRWOvWGFXg9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lF0OzYiF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lF0OzYiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724085684; x=1755621684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QK8O3VdMRAxTLTNkULZk4IBic2LrorxR0tGhcqQTdjc=;
  b=lF0OzYiF896ooszf12/8pKB2dTiwMsul8BaAQU+y+XrGF0dkhjJUMCZg
   bt6XO5F7thuEne1dmu3Qq2+D043vfxXUcJ0KIQVP6+5/AiF8gNF08svvo
   OmRCE0lRLoxrFoauEarvckaIwYYXwwsSEDegWvohiQAJGaMD8CXAGSQwM
   FO+nwkY4UCJYIFnLoYZZ3ZReqhX/7OxwjaUa/9V39C/isI6rvd0RWsKXb
   8Nk4o5Df1lhxyzOHC7rBtPSktrBWr+eQz6nJ54yT+x18EC1+LOQz0weeZ
   UqMqtnE8opULpfQt7Ttj0qH3kJ8FWDLhFazlXxLRhrh2TMXZkKTyydpH8
   g==;
X-CSE-ConnectionGUID: VZ9wGfn4S3mNqdC3F0msgw==
X-CSE-MsgGUID: Q4MpkyIJRWeTttpmpuLVgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="39805618"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="39805618"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 09:40:51 -0700
X-CSE-ConnectionGUID: uR0TmNrSSmSJ4bC/hle3YQ==
X-CSE-MsgGUID: WvMjFni2SxSsmVbVSS2XQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="61002039"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Aug 2024 09:40:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg5R4-0009CZ-19;
	Mon, 19 Aug 2024 16:40:50 +0000
Date: Tue, 20 Aug 2024 00:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 15/34] ERROR: modpost:
 "cea_exception_stacks" [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <202408200055.RaKtAd1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   ae58d028f319b7fde38a21d188e30e46471e1e3c
commit: 4584c853845ae8950025fa5e40335060a2eec7a3 [15/34] KVM: VMX: Initialize VMCS FRED fields
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240820/202408200055.RaKtAd1q-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200055.RaKtAd1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200055.RaKtAd1q-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cea_exception_stacks" [arch/x86/kvm/kvm-intel.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
