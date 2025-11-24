Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5035965
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 01:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947899; cv=none; b=rUWlxsuBRYiXx26BTk1FT7yZuvzbj1PdZWcOfVcvqsixrRtFfCQihNwHpwM4DQFv5LRqZtcuSdYC6RrLXStelM8hd1DVcOXQrMT0ZTxJ5GJG7CSZnFHIYjo+WcB3h0qIJqT5xYOSuragqTJMmVBv2SGYSL2lBG2ULL5klibR5Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947899; c=relaxed/simple;
	bh=XakT98M1ITxIZIGi1fuKfB3OvfYRPpWp75/9FGiDi0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ApoAQVTqvh0A/uFd7AZuuZnAZ98cMXU7nVzrmU9l0v2kqbuQWvl+QSPWwXHWotRiWRZV2j7Tih6/3uFE/pLhbrXyX9hGqiPKYLGJyTXRZY3HuhiCUe/8K4sQ7RfbFf+j7IztrYU3z/OwTdtO8qPlhqMYpdZAP/L10lpYMGFDerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdXr3Ryr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdXr3Ryr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763947897; x=1795483897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XakT98M1ITxIZIGi1fuKfB3OvfYRPpWp75/9FGiDi0E=;
  b=OdXr3Ryrf4Ep5l2yESlUrhIcG/hGyhPcFs8LmsPcVgLe1g0FWbOE0Pgf
   03wHp9LMPOXMRojjdVYwLBWsZgw3xGmj/mvTet3OQwDyT+YGcvYF7YEtQ
   4jhMZhJPDOdsZLY+DibgTZDY2WBmuGDNQ747imezzmuk90Z2qjN+1iECP
   YkObIhjNod9Atyk9jS811WpOfBfuVFszVVeSfMiwRx3BCitCSUWbtWVQe
   AHIOoR0Z2YBjjfql6sU6vyV1N2Lub4c4BQAh3U0TDbAgvrFyaA3kLQlHp
   HguXALe220xr+mCusJEMHOw7P//UFBMkOr1cKxsvyXP9VcJT4sphvagJR
   g==;
X-CSE-ConnectionGUID: Zz3UQvvjRUWbFwSRU3sV9Q==
X-CSE-MsgGUID: 5a1i5PbtTuKTYCrxEDg1xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69807089"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69807089"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 17:31:37 -0800
X-CSE-ConnectionGUID: 7lIxcFiNSoSoAKqJVSd9tQ==
X-CSE-MsgGUID: +T1IEpz5SgGW+7LtJ2a8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191469819"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Nov 2025 17:31:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNLQS-000000000HZ-40zR;
	Mon, 24 Nov 2025 01:31:32 +0000
Date: Mon, 24 Nov 2025 09:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: drivers/android/binder/rust_binderfs.c:51:6: sparse: sparse: symbol
 'rust_binder_devices_param' was not declared. Should it be static?
Message-ID: <202511240909.vI2KZ96Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0e88704d96ca0df77717320fec4ebabe42c8a94
commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
date:   9 weeks ago
config: x86_64-randconfig-r131-20251123 (https://download.01.org/0day-ci/archive/20251124/202511240909.vI2KZ96Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511240909.vI2KZ96Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511240909.vI2KZ96Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder/rust_binderfs.c:51:6: sparse: sparse: symbol 'rust_binder_devices_param' was not declared. Should it be static?

vim +/rust_binder_devices_param +51 drivers/android/binder/rust_binderfs.c

    50	
  > 51	char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
    52	module_param_named(rust_devices, rust_binder_devices_param, charp, 0444);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
