Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85BC217F27
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763972305; cv=none; b=tFTvajwhfcwxzBVAEH0IyaMYw/SUGMIarnlU1BSwVJgrX6VC8gxf6gpOOe5vJPqB42bkSmWFsDsKWBy+EbHPcMLWNAhrdcFQNXCNw9dyaxClct6+zQ/2YwGoIcKtg3d8MCAGcz2aW5pQyBl8720kh3fyWL1CtlG65s6s174tesE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763972305; c=relaxed/simple;
	bh=ssd/81qyJwafTa4gNl49rsLJNMINKDBgn2Tx/2uEJXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ne26FoZgOmcxmBw0NofVcVvxjmcBzhx2LmBxr2RI9PH99U6br7NpjKAmwehsHDg0+dD//QNdmO+3xEN/rzNM2H7qD/adZXvwAzPuHSUcI8JfQmjSB/A0reajTX/XwQqQUqbiL18HDSE8iRR9hA7tBWpfnhR0QvBDMrhmjBIYKFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enF1hOkN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enF1hOkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763972303; x=1795508303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ssd/81qyJwafTa4gNl49rsLJNMINKDBgn2Tx/2uEJXk=;
  b=enF1hOkNjoxJD3vPnxmxJMWz5pfEtbPI7NTwS5GNU6lI3+jDv5eMItzD
   dcbmoXgCkzlaMvQTIJ2XV9Hy1Fs0aixG3TzKd009lOnlPt420O39pO6gB
   i3FKujY26aathnrPLwPkWPIQeadFfWRBEZJFfu+Y0vj1ZnnS7xN7iVSRP
   od2VmCMLK/ET+mLa90gn92PrrGN8idqNbmJepfF285EcSrGHEOjvDM5us
   g8ooALJ6V4uE2QLORhBvaziO8X/7nIk4GRG9b4GjThdzH/Sl6OTtCF0IX
   MZZqOCKvhsheM3SdTE/4dNBQEAFf/Ak0HCJMUc8qb9ka+WvebB7YMm7vM
   g==;
X-CSE-ConnectionGUID: Am6IOthrRE68lwXbIG+m2w==
X-CSE-MsgGUID: WlzU7ZjGTcCVzMs/A0d5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76291750"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76291750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:18:21 -0800
X-CSE-ConnectionGUID: 4mEdMVEQQsW00gxh2f8ZFQ==
X-CSE-MsgGUID: 93W6ZynoRTqezB7FmvxXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="197386869"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2025 00:17:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNRlf-000000000W9-1dQI;
	Mon, 24 Nov 2025 08:17:51 +0000
Date: Mon, 24 Nov 2025 16:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gent Binaku <binakugent@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1207 4/4] error[E0432]: unresolved import
 `kernel::io::PhysAddr`
Message-ID: <202511241658.bH7iOCws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1207
head:   e7aef6e52f9b91d0ff1045e996f36d1f503e37c6
commit: e7aef6e52f9b91d0ff1045e996f36d1f503e37c6 [4/4] rust: Convert PhysAddr type alias into newtype
config: x86_64-randconfig-161-20251123 (https://download.01.org/0day-ci/archive/20251124/202511241658.bH7iOCws-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241658.bH7iOCws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241658.bH7iOCws-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::io::PhysAddr`
   --> rust/doctests_kernel_generated.rs:4917:9
   |
   4917 |         PhysAddr,
   |         ^^^^^^^^ no `PhysAddr` in `io`
   |
   = help: consider importing this struct instead:
   kernel::phys_addr::PhysAddr
--
>> error[E0432]: unresolved import `kernel::io::PhysAddr`
   --> rust/doctests_kernel_generated.rs:7022:9
   |
   7022 |         PhysAddr,
   |         ^^^^^^^^ no `PhysAddr` in `io`
   |
   = help: consider importing this struct instead:
   kernel::phys_addr::PhysAddr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
