Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF32F44
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741757425; cv=none; b=C08L4iIlgTkh65RUCgNNNQojSgjI3U/9v7BPAANXuT2jQ25dBZG9pbC07nWvYCBxzzj2vazecmyGgcB7W6PYEURGPMzQEAtEo+IVBR0yHXU0SdkI27HEjzKvhM4hXV8ZiW5W15Eq6R8p4cVLKxZGnZQtYwUs1+A2fm8oft5Bh20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741757425; c=relaxed/simple;
	bh=DrHH+KFdlHjZdeBDSuadlTDbgKRg6KVZ/QqcBdNLVdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+ZiklkgucZi+Ybox2ZAEDGLtQ+kLRtN7+ZKKuMVDtaAlwvmekFRx4dQHa/uzmLN+FeOh9pgyzw6Buyj4Eipm9sOr0W5RI0q56Qw6XCJf4RME+E2UvA8cT+g+CAboVCc0r5e5o+sT4LI+8uL0hOpzswVm73NlJQVQ5/4JwOUpbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGZv8fUu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGZv8fUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741757423; x=1773293423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DrHH+KFdlHjZdeBDSuadlTDbgKRg6KVZ/QqcBdNLVdU=;
  b=LGZv8fUuBB/SwxMNtBZdMCZbitAmkXj3XmN5rcn4r0n73An4K1NfUIvf
   6DTM9MvyKXcQEJo3kxIcswKBK0AK6QIIMwxYL7b9K0dUXpW/ThbbYJknz
   IjDaakzSU45cdakq/6aECI5qQclpFa0qbE/+/p8StOs78lnmf29UgMjR3
   Le/YGayROiR9PKLu7jf5eT9LF6FzXJnigRpn18vJZv8Fnh691+8EeM3KT
   ppQr4dxMWAceJR+t0fRpPYwFgpTg5E2qOLWMWyIby5ItdHAG+fqMeiHym
   wKHBOk7tTTgMDgSfEOVE9l+aLkmNmtO5PRv4bV3XXyeONrkOi4X0ulLJ2
   Q==;
X-CSE-ConnectionGUID: OF+n4l+uTyOUK5oloI+mQw==
X-CSE-MsgGUID: TLe30AtaTBiZ+QYIR6GJig==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54207701"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="54207701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 22:30:23 -0700
X-CSE-ConnectionGUID: VrQaS800Q0GygM7pF/fLKA==
X-CSE-MsgGUID: TuiXwKUTRbeN52Ga41Q6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125426155"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2025 22:30:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsEfb-00089k-20;
	Wed, 12 Mar 2025 05:30:19 +0000
Date: Wed, 12 Mar 2025 13:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6/6] kismet: WARNING: unmet direct
 dependencies detected for ASYMMETRIC_KEY_TYPE when selected by
 INCREMENTAL_FS
Message-ID: <202503121336.4iHqfUhS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   196e23be873afbb2901b85db8be99549a8cbd0f4
commit: 1be052b20ba04b635cf87bcff80de5314697953e [6/6] ANDROID: Initial commit of Incremental FS
config: arm-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20250312/202503121336.4iHqfUhS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250312/202503121336.4iHqfUhS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121336.4iHqfUhS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for UIO
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - CNIC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && PCI [=y] && (IPV6 [=n] || IPV6 [=n]=n)
   
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=y] && KEYS [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
