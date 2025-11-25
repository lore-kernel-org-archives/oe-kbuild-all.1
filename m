Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286A821ABDC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082916; cv=none; b=mEDN9M1sOFWldj5bCJLXAK0NDOY+IuCE2M+FASFo3yA5M0WhBivEff1B2jw/A2MnawgTcK+O0Ct7OjJxbV7fdXOz2codzbWry2T1JiEEuQanRBnUJSu2xSiCxVc7ZV1QvQm6inQ2UNhGIifyzHWRGsnFDagtDahKtqTAQxQXz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082916; c=relaxed/simple;
	bh=7rtPjj+NX8Nq3Cy2ThWWciThsp26+C+VBT5lZPrySAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+pgieeEpDv9S6vpXSF7NHOlm4bpzSY/mQwkqBS38UQX31mtrg/2DNh3Sqr63HeUsupONbfVIhXmk6Vh/V68RpYidTwKMJn1JCx4c7HDbHO1zofo3hk1Em0duv/vcchSgZICsvm3GkZtWv+BckhcfK+5rHb4W18Ho9vos7WosWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwEaMh5t; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwEaMh5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764082914; x=1795618914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rtPjj+NX8Nq3Cy2ThWWciThsp26+C+VBT5lZPrySAI=;
  b=XwEaMh5tCo9lbXJ13dVVfKtf1xff2PMFXSBQLWlEqeo+LyuyeeNSWjGL
   OtMXwFOI1Uq6AuD4Pkcir4rzn8CcgHDawqczl/s+3t+ZfA6E1OIuXofNb
   8eU8bYniJvwvZoH2DsydiRhc+20eK0D/z8VKjlwS2MmdVHnl8blBUaVQ6
   iMpZT4/ga5yRTwFHqlPXp7zqvdelVOMU7RpBn1yqByaVwtI2TlV9OmoXk
   G2QOcGFNkyUFcpxgnLq/R6gHQjNYNJE4t843uueEBs+yhBLEy6hgXKLBf
   NovfpzAn6YYNCfCftgnjRPVdTT3j8AggmbPragNSSfzowavFizJF/dALn
   w==;
X-CSE-ConnectionGUID: eCvTp163QpaWgZeBmgK2Rg==
X-CSE-MsgGUID: Ml2D2fVlQv6g8+DJv7FzaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="91589844"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="91589844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 07:01:54 -0800
X-CSE-ConnectionGUID: fgp/uw8fRvC6kN/qxhzLLQ==
X-CSE-MsgGUID: Y3lPryN9Rhu0IHZ8ygZBQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="191801140"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2025 07:01:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNuY9-000000001un-3vlx;
	Tue, 25 Nov 2025 15:01:49 +0000
Date: Tue, 25 Nov 2025 23:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: error[E0609]: no field `driver_data` on type
 `bindings::acpi_device_id`
Message-ID: <202511252247.arj5yFVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
commit: a74931eb59cf6b914e1b9471d9abd4429176f6af rust: acpi: add `acpi::DeviceId` abstraction
date:   5 months ago
config: loongarch-randconfig-r061-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252247.arj5yFVn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252247.arj5yFVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252247.arj5yFVn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `driver_data` on type `bindings::acpi_device_id`
   --> rust/kernel/acpi.rs:22:87
   |
   22 |     const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::acpi_device_id, driver_data);
   |                                                                                       ^^^^^^^^^^^
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `driver_data` on type `bindings::acpi_device_id`
   --> rust/kernel/acpi.rs:25:16
   |
   25 |         self.0.driver_data as _
   |                ^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `id` on type `bindings::acpi_device_id`
   --> rust/kernel/acpi.rs:45:18
   |
   45 |             acpi.id[i] = src[i];
   |                  ^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
