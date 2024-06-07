Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E915532B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 21:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717795186; cv=none; b=eGyeYzBJL9P1r4nIxAH0QwtCg9j7oo4Q804xILwvHonBjXSo0L6SsEBlJkMjQr84ctJnknCnlYyf6SAwZ1XmroLRshEKGk6bZESGQOBlSed26mK0Z9mut0g5Vhc9htMgY+BfpcBN004NavheVLTr4xusvEYlFjbba0ts29eZxsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717795186; c=relaxed/simple;
	bh=15rADfCZBNyDrniEDzBbasY053Fj55Qv1fSdZ0xU4fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MsuPhfcFxFKtF1QBoh+MtQWnq6ddnggF4TrJZ0VwsOYVvX4Oa/Ed7EEf/v8OKWGlnN5KsZqPfzwAFjrindlVWr9bhy1p7AyOm9LM+PfiRAayt0Kl4kla+WnvZcBTiECc2Zh00G2n5Irg70XLofE0BeJZ3wegW72pbla4FiY0CR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWfS+se7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWfS+se7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717795185; x=1749331185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15rADfCZBNyDrniEDzBbasY053Fj55Qv1fSdZ0xU4fA=;
  b=eWfS+se7JbeZyUjRNTe2+5lolbALG4EOQv0R82Vqp1DhCDsXCaVnqhK1
   ExAhQo5bgiLKgeWo69v3GIk0CN6FJo/uT8YB0vx5tP/BNYie/o0QPuOI8
   Uhy35ij1RbdJgAgsiUZq81Y/19WWg/TIdCKtgLPx4jHCCpuVNkKvxzpjW
   tPJjpc/+jwyZXgGW44VPfN/vJHbUNqx0Gnw89HDI3AcninrhiL6Wk5Yx+
   r+iXbesdeBJOOFOplUl021Sx6yDJbJS+5TR6bUgY52DoMsOxHnrtzXYVu
   GHFfUxNhrvUSiB9K9QwKMIdR4SdeKmI+NZXDO9FOl7fTRnrQsmD2bTwzu
   Q==;
X-CSE-ConnectionGUID: 9NJAU44sT4WBdN4n257H6w==
X-CSE-MsgGUID: y0fU3q9MQS+HuwCgsIp08g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25938666"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25938666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 14:19:45 -0700
X-CSE-ConnectionGUID: Prcicg3TSeaVDN21weDv6g==
X-CSE-MsgGUID: +9MBqCs0RgKJLxAnZd/SrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="69621043"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2024 14:19:44 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFgzt-0000YC-2C;
	Fri, 07 Jun 2024 21:19:41 +0000
Date: Sat, 8 Jun 2024 05:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 18/25] error: you should consider adding a
 `Default` implementation for `TableBuilder`
Message-ID: <202406080500.UHna7x4b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   aca334cdc747f90b4a1051a3e570cbfa56f10a35
commit: 8a53d1e0bf52f02027ff4be2296bf59088bbd163 [18/25] rust: Add initial bindings for cpufreq framework
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240608/202406080500.UHna7x4b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080500.UHna7x4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080500.UHna7x4b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: you should consider adding a `Default` implementation for `TableBuilder`
   --> rust/kernel/cpufreq.rs:134:5
   |
   134 | /     pub fn new() -> Self {
   135 | |         Self {
   136 | |             entries: Vec::new(),
   137 | |         }
   138 | |     }
   | |_____^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#new_without_default
   = note: `-D clippy::new-without-default` implied by `-D clippy::style`
   = help: to override `-D clippy::style` add `#[allow(clippy::new_without_default)]`
   help: try adding this
   |
   132 + impl Default for TableBuilder {
   133 +     fn default() -> Self {
   134 +         Self::new()
   135 +     }
   136 + }
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
