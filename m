Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31344F9F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738074892; cv=none; b=vBrC966KUwt1Jyyfb451VP+pcXa284gv+O21pUAtTRQZqkBzwvd2HFnCVRGMQWQkiNNp+ddAXB2NS7pG4NoZFF0YyQCYiB4JWdzL64EdCCU/Le7dEjwRHx6uTFQMkboOvMlR7k+XI53KZ3Sio5yGW6/7ZV34qkbkhhPYI05uK80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738074892; c=relaxed/simple;
	bh=Vt8CgV+SjdgP8Oqlf9B4VGSZha/tcAVdDJz5TWt0Oto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AIbRJ68BE1/NA8Eql9yG60oc6VRUG5TG7CuodwJNnlq8uRb3Eyr/XFCqHTsfCt6IHQoecUPPR2ZBuYy0R1DH08hM8/AotEPka2BU3DFJA6kSAXksFRc5ocz0PvyQmUB34KCKB/y99scpRTeU51vdbwRD8Wb5IJkD8m0zOpoypnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpUUs4yp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpUUs4yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738074890; x=1769610890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vt8CgV+SjdgP8Oqlf9B4VGSZha/tcAVdDJz5TWt0Oto=;
  b=NpUUs4ypapHbBI0E1gjXrDtOOqsYBuEWmYTQKOIqL1Ub/uY8ezfaSPLa
   P8DPaBlp6HPgqsZZLY/H12q9DPewAuxX4TlFrwCZNUqG5eyyJPl924U3V
   FWqPn0iPHOJAhxbSOEe1aqdLxe8bhC26NhCtH8SMG5iQNTQ0t6OlZj1da
   xos3AWsBlS9xXxuYoz//t+fBsRHsLMLVyOV+r8vPe4FLSjVyQjsEEKtBn
   5o4Xf46k9GYM2ObjZpTkWU/SyynQqoYj3vT3fjQtEqEzHHBu+K8/OsLMK
   e4+RX2OPIZntfRx7Ss/2RbZKwi4EWVmJNx0ntUw+kVezFA/P2Rs0A/cGr
   g==;
X-CSE-ConnectionGUID: slKDlveIRHeZ7QmS5OKGVQ==
X-CSE-MsgGUID: w+NAtts9RjKWrJfjI7Lw/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38469157"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38469157"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 06:34:49 -0800
X-CSE-ConnectionGUID: Et0NBSBnTDaPKdC0wVXd8w==
X-CSE-MsgGUID: y9UFFgw3SSif+qyPfPivvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139612596"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2025 06:34:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcmfu-000hsj-2c;
	Tue, 28 Jan 2025 14:34:46 +0000
Date: Tue, 28 Jan 2025 22:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 31/82] psci.c:undefined reference to
 `psci_cpu_suspend_enter'
Message-ID: <202501282233.86ECbQek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   e6d3217a3466094dc0dc69823412b32f1343af57
commit: 8f5ac7a3bb201ee221c2c8dded806cf18eaba9de [31/82] firmware/psci: Allow specifying an S2RAM state through CPU_SUSPEND
config: arm64-randconfig-003-20250128 (https://download.01.org/0day-ci/archive/20250128/202501282233.86ECbQek-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501282233.86ECbQek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501282233.86ECbQek-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/firmware/psci/psci.o: in function `psci_cpu_suspend_s2ram_enter':
>> psci.c:(.text+0x7ac): undefined reference to `psci_cpu_suspend_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
