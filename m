Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DA01FF1B0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738821996; cv=none; b=LBilUNogA3iNccemJv71cC/AiLZfiERL+Dibvuqz7Yx54iUz9oLvmOJpWLV6FUPnz1biTSJ6l5FyGCyw1xYu49rbc1vP0iiAyV7KZFEDcamH8+5VygNMaGzt9JouUvmhcLcecVAB4xSez2qbDTMnB4FqfYGUODiuI8NTsuIEUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738821996; c=relaxed/simple;
	bh=ueN5CBfBOj+51JiRCgX5tsAxKsQ0Ms4ymDKwYxJcozg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elvjIvSrhtWkY5c0t8KfthOE+qSIDeGyvgmqfyCEg9ZYsNNW7MFnHMnEQJy5SOS3DM/8LatPtOTdzMLkEB8CYEZb7JB9degOQTlytUCQg40vxgp+yMIlM9tDUqpnYsCiJiEPXNqgUWvdnJd9TSMQQIt9e42qF1Uxl2IsoQV+YFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcgaMOHE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcgaMOHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738821994; x=1770357994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueN5CBfBOj+51JiRCgX5tsAxKsQ0Ms4ymDKwYxJcozg=;
  b=YcgaMOHErlO5+lUxt6BC3MkDlCF3NypX34Mf8ViYc4c69tZMi+8jEq3o
   39N/NGMPdzEpNH9NYCZhAjxx7DXMRMrvJtg/4xZE0jY5O1H1SAE6nqbPc
   cyDnvN895ruXAvnybnDEqgdFMTEgbnUbQ0+Ll9PcMFsXiRM3x9jQ64ENR
   jGt+T3oI9gNKeJsr/2OOQKv6LHvg0TMrUwD/U8zJa5x12Or5bzv8ECIUh
   gTxKsw/c2vGRkXFTmdXezsWbyeI9ZC7mNRvz/mjn0WhdEzHJI4ho2h+Vp
   QvBO+2RQCQc/5ZnUieFqgwDr2EsKsafqJbfr7i1QzNqXGsH5ZdOSUBneW
   A==;
X-CSE-ConnectionGUID: gcFIab65RdGxudpnB+SCKg==
X-CSE-MsgGUID: l6DDy9PgSxKFQHrWJjjjfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43071795"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="43071795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 22:06:34 -0800
X-CSE-ConnectionGUID: Ak2ooW8QR2ezUxNvTvPoaw==
X-CSE-MsgGUID: VYH62MCjRO62o/h8X4GICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="116103460"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2025 22:06:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfv1y-000wVp-38;
	Thu, 06 Feb 2025 06:06:30 +0000
Date: Thu, 6 Feb 2025 14:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk-pm:rust/cpufreq-dt 6/19] error[E0425]: cannot find function
 `clk_get` in crate `bindings`
Message-ID: <202502061409.oi1zIjof-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git rust/cpufreq-dt
head:   e49f2c6f327cf0f2bd362db9d451696bbc6f68df
commit: 8f7f93a504ac6681c52a7f353ddafe28f1140030 [6/19] rust: Add bare minimal bindings for clk framework
config: x86_64-randconfig-071-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061409.oi1zIjof-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061409.oi1zIjof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061409.oi1zIjof-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 19.1.3
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error[E0425]: cannot find function `clk_get` in crate `bindings`
   --> rust/kernel/clk.rs:32:23
   |
   32 |             bindings::clk_get(dev.as_raw(), con_id)
   |                       ^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `clk_put` in crate `bindings`
   --> rust/kernel/clk.rs:46:28
   |
   46 |         unsafe { bindings::clk_put(self.0) };
   |                            ^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
