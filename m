Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9992517AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948081; cv=none; b=oJYYMybuqhB9vYqh6FxJ/r0V2716OKV9bMXYyma7ONGSEB0MhleRnesg/emj+3Il8jr7o2zfwGyK3gWYwxGopTpXdsykp7ysALI7Mdtp6ptn10kJZ5y7hAXWNczElbTeh1/cGotzSP+rUaf69h0F4YIc8Ch/ra0KWI30Ukc4Bkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948081; c=relaxed/simple;
	bh=eUeMjDBGXnEwBzBE2+CRts6apRj606KaVLCrTVQ2PLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rMBLam70HZUSNSmDoiV53JWbRE2m+H586Xd6f23U+tjbqJWCnVdAnwjSHqn866W0kj4LifuEf/xi9QUk0l/T2DEwafmFOjxHizKW5vnZih0EF4yjzZUTf4TA0+7HHKPWZ+k8PYlb0SmFQdYRg+u1p90g26J6lhK+QU0IM8ho33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhwi5Dzb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhwi5Dzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745948080; x=1777484080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eUeMjDBGXnEwBzBE2+CRts6apRj606KaVLCrTVQ2PLw=;
  b=hhwi5DzbugEiyJD2uuZC/1MC9UL8ebQna4c+QKap9iBShcHc90ldeo0g
   DAQfDmAe/Wz3Y1MLKqnjXw54K5TFTs/m8MfT57Z2tC1Q7PaFgOPZW0v6H
   gm5LKlpAJDLEWjtu4GUleAr3YjQA42ro2CilEzjqcYnvhE5QwLWAkvMho
   zbQHoIilVnaChdBW9zuIop5mdbLBKhNTCr8PO9F/cz7FchY3dIttmlMWs
   feV8Fm24bXkxBnbbnheYukxdIzFL24+0KWHqZQY9beX+UAAQ1GYGt3tLC
   mzDw6IrORW/mdVKoT5NMln7yX7hm5mJNoGr2OdAKrv3ncjD5j5nJglX3I
   A==;
X-CSE-ConnectionGUID: O0IeFvJyRf2EvRpRWXEQnA==
X-CSE-MsgGUID: Uo3UM9RPRuCqKi4Rbl2Ljw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64998501"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64998501"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:34:38 -0700
X-CSE-ConnectionGUID: uE6f45ebSsO8jHR8VOFMRw==
X-CSE-MsgGUID: haZktk4+Txy6LFKo+ulJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139075569"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2025 10:34:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9oqk-0001pP-0e;
	Tue, 29 Apr 2025 17:34:30 +0000
Date: Wed, 30 Apr 2025 01:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?L=E9o_Paill=E9?= <leo.paille@enseirb-matmeca.fr>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1161 161/195] warning: unresolved link to `sk_buff`
Message-ID: <202504300119.A15bTkJ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 3243ef7613ae49ea80ebfbf22ee5ea1c8665ae5d [161/195] logs emitted packets
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250430/202504300119.A15bTkJ0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300119.A15bTkJ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300119.A15bTkJ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `sk_buff`
   --> rust/kernel/net/dev.rs:494:22
   |
   494 |     /// Consumes a [`sk_buff`] object.
   |                      ^^^^^^^ no item named `sk_buff` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
