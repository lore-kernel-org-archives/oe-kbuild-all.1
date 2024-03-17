Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B8524A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 03:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710645914; cv=none; b=j/XgcmcNAZVPtHwcWryhZA4bx3xvsDTv+GsVQ+JeBwsJRfU7NukjyHKm5Eyf3Qyo8pBqjZZtkx5y0+pvcfgyIPLmYPySFXbLjVCYstJu39EZy4NMR294jXG/FpVOWwBgs7/EDIebFRnS6adLwLI+bWKmmyykPbdV48ppvq8nY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710645914; c=relaxed/simple;
	bh=xShbkwY/aqFfd6TKOdir3+ejBBoA4tEc0b/bnvXV/VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WeqpnKwTXtS8kiquSXzNyowEWuk9Fv0tAHXbOrYmVEoeYyqB/5Rzd/o7fBlS+PbGp0NOSj3r45r1qDjrKbO971wni4ACY3wLorPnYIUEXsmB87ss1LdYu3bH3tDqv933pFv2BYVXAVCDDkU/vFi+tlte7VQxONVPu3ZqnNU9384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zz6n639d; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zz6n639d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710645912; x=1742181912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xShbkwY/aqFfd6TKOdir3+ejBBoA4tEc0b/bnvXV/VU=;
  b=Zz6n639dEsedRXAA6GYvC1uI4arBBgRuPOlDRic0Ixibsynmoh5t231b
   p06RSlbTT3+o9B/2A7eLP+qHfYTpAUwe2NvC4FU8E/VTRum2sWDsz+tHV
   tRtx9QKth0nF3Dh4DWKL7j/ZPPJ+gnVIZO2pIhO1/TMSa45kEsGQ2oq9X
   rOzDHR2xaykekP0e8E+RYJp7xfwMKiEdNWN7qcGiYlYCGA2ncWC3EL+JO
   1RaxYIbubOlYtmMBRWMx3S6Ar5Xgfo0Yz9JtwhJaernke8TTeQSXrlyHw
   XBK8R5JKMDq7VQ0/hMD/RsGAe4ldvZPqWhloQMdA4cx4drK5pb2XUGJb9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="5612611"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="5612611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 20:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13185757"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2024 20:25:10 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlh91-000Fyr-1V;
	Sun, 17 Mar 2024 03:25:07 +0000
Date: Sun, 17 Mar 2024 11:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 40/43] error[E0425]: cannot find function
 `dev_pm_opp_of_get_sharing_cpus` in crate `bindings`
Message-ID: <202403171131.PTR3Fqmt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   55e41b4e7955d261d26d167a0e9a847553a8ef55
commit: fcf31341da4f98caddb87658596502a9ca9fa3fa [40/43] rust: Add bindings for OPP framework
config: x86_64-randconfig-071-20240316 (https://download.01.org/0day-ci/archive/20240317/202403171131.PTR3Fqmt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171131.PTR3Fqmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171131.PTR3Fqmt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `dev_pm_opp_of_get_sharing_cpus` in crate `bindings`
   --> rust/kernel/opp.rs:708:38
   |
   708   |           let ret = unsafe { bindings::dev_pm_opp_of_get_sharing_cpus(dev.raw_device(), cpumask) };
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dev_pm_opp_get_sharing_cpus`
   |
   ::: rust/bindings/bindings_generated.rs:72780:5
   |
   72780 | /     pub fn dev_pm_opp_get_sharing_cpus(
   72781 | |         cpu_dev: *mut device,
   72782 | |         cpumask: *mut cpumask,
   72783 | |     ) -> core::ffi::c_int;
   | |_________________________- similarly named function `dev_pm_opp_get_sharing_cpus` defined here
--
>> error[E0425]: cannot find function `dev_pm_opp_of_register_em` in crate `bindings`
   --> rust/kernel/opp.rs:719:38
   |
   719 |         let ret = unsafe { bindings::dev_pm_opp_of_register_em(self.dev.raw_device(), cpumask) };
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `em_dev_unregister_perf_domain` in crate `bindings`
   --> rust/kernel/opp.rs:730:28
   |
   730 |         unsafe { bindings::em_dev_unregister_perf_domain(self.dev.raw_device()) };
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
