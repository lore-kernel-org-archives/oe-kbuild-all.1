Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA8170A23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726930379; cv=none; b=Ud5OnkVX7idXNqdXpkiGNNSd2DGO4emKyl4QPqyr++6iNvr2U26lftSpR9RcYcKHLDEUFn8vuSKNV5wMoaPmxf3SnxQ6Jd3K08Y4+PYhlk205iMFIVGuwp/UgMtb4OS6F27nBqi6fBWCkUvKxQkoCxVaquy6gZ1UQHOvp7DtbMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726930379; c=relaxed/simple;
	bh=lG1SRfaLD1UdbyIEUgDKyHqo7ZP/pLR83fqNtNPYI0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfYLU0nZETW5wJ+jIYvp3fOekZbHl4TI7+BKBqgr2N8qZf4zAVn/dwF2gjViUvzFH4+SF24334x165SuN9WE8qQVAHQPX0tmLq/MGbQ06t6lQ+aLR41BbSDteEp2xPSaPJa4AYZrLTMBkjrE/6iUCbBX5Fv+cCaisrx2gz+pEJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEVMQ7DB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEVMQ7DB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726930378; x=1758466378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lG1SRfaLD1UdbyIEUgDKyHqo7ZP/pLR83fqNtNPYI0Q=;
  b=nEVMQ7DB5gkv4MuBrKEObwocOkxsMzgN6SLG7APc/l0BqJGrins+xGvm
   ++Y79w24/iN85iBkYZUsAGfH0H6dNsH+UPBCwaG7XiC/jmD9r4zeH9z/s
   7zQDHt+bvhREvR6UX4yEh7syv4njwu09osVVO3xL91brwrnI9CsYgsU2+
   zIS1f3RPdwn6AbVVTW2Hks1uM9wlugQoZjVZZ35rU0dcLYIpj+KMmokbm
   gxJsKQYhZzfwGCs7v27VyqchaKM6QlckXvXU9V+PEXo6SW0kf3Ex062Rc
   ZMePwI5PGYU2HO/MUT845ZgrXXM5a9vS3pDpfRMgj9I8IRfdGCwFgK66H
   g==;
X-CSE-ConnectionGUID: VFb2DasWSialhqIQIMi2iA==
X-CSE-MsgGUID: LiehjqRfQBCmdFuiAVBF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25444898"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="25444898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 07:52:56 -0700
X-CSE-ConnectionGUID: scy/9CAcSzW/WW2J6fP1KA==
X-CSE-MsgGUID: OFFCUvr+TEG1zg49RKe03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="75379106"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2024 07:52:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1Td-000FVD-0O;
	Sat, 21 Sep 2024 14:52:49 +0000
Date: Sat, 21 Sep 2024 22:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
	airlied@redhat.com, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>
Subject: Re: [PATCH v2 1/1] rust: sync: Add Lock::from_raw() for Lock<(), B>
Message-ID: <202409212236.CKCTlTCJ-lkp@intel.com>
References: <20240916231817.643934-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916231817.643934-4-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a2f11547052001bd448ccec81dd1e68409078fbb]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/rust-sync-Add-Lock-from_raw-for-Lock-B/20240917-071956
base:   a2f11547052001bd448ccec81dd1e68409078fbb
patch link:    https://lore.kernel.org/r/20240916231817.643934-4-lyude%40redhat.com
patch subject: [PATCH v2 1/1] rust: sync: Add Lock::from_raw() for Lock<(), B>
config: x86_64-randconfig-104-20240921 (https://download.01.org/0day-ci/archive/20240921/202409212236.CKCTlTCJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212236.CKCTlTCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212236.CKCTlTCJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `mem`
   --> rust/kernel/sync/lock.rs:10:74
   |
   10 | use core::{cell::UnsafeCell, marker::PhantomData, marker::PhantomPinned, mem};
   |                                                                          ^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `prelude`
   --> rust/kernel/sync/lock.rs:9:38
   |
   9 | use crate::{init::PinInit, pin_init, prelude::*, str::CStr, types::Opaque, types::ScopeGuard};
   |                                      ^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
