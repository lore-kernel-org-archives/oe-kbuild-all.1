Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D392594B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 01:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733966358; cv=none; b=YUmZwFv4QfztanqWcmXZsHgVSDeXfY3qj16mEgWqj+HF+dwZQIHks79HkrXMNHptUSpZdd+XBu+6XIc84d1CV+/xxhkuOjyJtMDQEuXEVg5epXLlJIJ3YjGDd/npWYI8S0m3VtE1UWLlftBN2q+Epam5d5ZiKJpl8shn9XB5qCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733966358; c=relaxed/simple;
	bh=h1t8ZT0ozy36TKfMtP0eWSemLFZZQSto/UKLaSI2XLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXWja61awMHHKUC7MXwjSfD2aIODHbhbQJ1f617At19x71JRXJGmTPb9SgecP49PP3Q21PsmPocIWGzMUb29j3Jd0rp0pBbvHRmKVnpONKZuNFHoPiM9x/NpL7zXKantuP1OqjgcxAy7xOfJ5BdtTOH7/XEbjXOG0iZfQVORPSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUwe7CXy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUwe7CXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733966358; x=1765502358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1t8ZT0ozy36TKfMtP0eWSemLFZZQSto/UKLaSI2XLQ=;
  b=hUwe7CXy+I68Agb7rDG8pSO8zVd4UcTFtWSCbAHtDdg62upaChX0Nb5h
   aHa3bz5Z5mi31Q54pjm+8f3ZunW77naR1r82h+nxjvDK6DSD+fm4ph5nF
   aeGg8Y97TSY3V+wzVd6JYJXwnrI45EFyqztdS4979pGzXIuN3CmVvEnbD
   D13oianFH26q+o2DIxRpO5YBqW26mQUQqkXFgOadFKt4TMVgFt+I8E7xh
   np92KVcNUAz/HuGkLg8eKVPyY5po1Iw9WsdiyXSmbU4ThptLX7drNP8nC
   cpuyJJtZh2EY0p+CC1pTj8om2/jy2IA26DUo1R5OBO+BBLp14ogpY+mAs
   Q==;
X-CSE-ConnectionGUID: a9cPtFZvSPavzff/+uw4lw==
X-CSE-MsgGUID: q1fPBZ9nSBiBRgKt4rjPMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="56844414"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="56844414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 17:19:17 -0800
X-CSE-ConnectionGUID: 8GzQrXykTtaPeT5HAMXDiw==
X-CSE-MsgGUID: 7+5JXseqS4W6VS9WhP7JyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96487668"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2024 17:19:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLXrF-0007Hj-2Y;
	Thu, 12 Dec 2024 01:19:13 +0000
Date: Thu, 12 Dec 2024 09:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:staging/rust-device 13/16] warning: unused import: `device_id`
Message-ID: <202412120905.QrayNQdB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-device
head:   f9d907c1751498630243b06d0896c516b1d94c46
commit: 96c8b5a5b896bdc21c2792c824e999abcf7113b7 [13/16] rust: driver: implement `Adapter`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20241212/202412120905.QrayNQdB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120905.QrayNQdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120905.QrayNQdB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `device_id`
   --> rust/kernel/driver.rs:10:13
   |
   10 |     device, device_id, init::PinInit, of, str::CStr, try_pin_init, types::Opaque, ThisModule,
   |             ^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
