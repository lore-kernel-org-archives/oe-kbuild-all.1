Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D83195
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710547831; cv=none; b=F6oRnXhhkE+bkR9chizwVN3pcxwswY5Rc2vypnIKQUJhLpj3SeTrBTJo/MjmA8MD9tF5X33aiN9OS3vblwy4xEDglV3SYuZFZQb8NXWNB+5LmwmYbEIAELFuSuZDA/Ddl+W7gqlA2BtYoae9tVdfinkmKcy/e/2sV1IgehiYfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710547831; c=relaxed/simple;
	bh=s5yTbjD+WQkiXrmW488kIU19+yFayQ6GY55XihXO8+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2XJWrR5UjfyUTDQopNLfklO3F8zqjNv3nFiiOwiROBY51YNEi5e7jfFlViIf3i/Q6f7MD7V1ZyHKpTntggEUYiToc9eGLAa2+pzmRXGGGOwBhVpYCkRHFtTklNGgDBtguI3i7XUd4+ElCVEknCLjoJ98491eYMoXLrC7ao8WQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0+V4wwh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0+V4wwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710547829; x=1742083829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s5yTbjD+WQkiXrmW488kIU19+yFayQ6GY55XihXO8+I=;
  b=V0+V4wwhx692tBouwW3zSIvgB8i/3Yv+5KCwgZ2aNE7qEMJlAsrLocQw
   JP+q3ICe716AgxcWcx1P2XHSsjhL5Zk76hEgRf8z4d4DXUDcOIzT+C5fd
   CzclQ0AvTz6n3kguSsr+opDode91V2AClbEpMDXaTiCA6SyaRGjEu/RyX
   Q8tLlzSI7uFA8TW7qD8iDLfhhmfCVnS4wLloq+OkdhLP/9Dbrb5YW05TF
   27FbmarS6eUwSaLHCOzApF4g6QEMYdpy7iIp7p5vID3+OhOosx/NEin/M
   gs/CkKvKlLvlqHL7JNRX8eptO4ODMtLfryHcPithOSfwEljYvSvCZDXXx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16086248"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="16086248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 17:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="17549298"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Mar 2024 17:10:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlHd2-000Eub-06;
	Sat, 16 Mar 2024 00:10:24 +0000
Date: Sat, 16 Mar 2024 08:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 42/43] error: cannot determine resolution
 for the macro `define_of_id_table`
Message-ID: <202403160847.nzqy42nQ-lkp@intel.com>
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
commit: f7b58e210ad8271699903e301c4052fdcbeb24bd [42/43] rust: Add cpufreq-dt driver
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240316/202403160847.nzqy42nQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160847.nzqy42nQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160847.nzqy42nQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot determine resolution for the macro `define_of_id_table`
   --> drivers/cpufreq/rcpufreq_dt.rs:230:5
   |
   230 |     define_of_id_table! {(), [
   |     ^^^^^^^^^^^^^^^^^^
   |
   = note: import resolution is stuck, try simplifying macro imports
--
>> error: cannot find macro `pr_info` in this scope
   --> drivers/cpufreq/rcpufreq_dt.rs:219:9
   |
   219 |         pr_info!("cpufreq dt device dropped");
   |         ^^^^^^^
--
>> error: cannot determine resolution for the attribute macro `vtable`
   --> drivers/cpufreq/rcpufreq_dt.rs:69:3
   |
   69 | #[vtable]
   |   ^^^^^^
   |
   = note: import resolution is stuck, try simplifying macro imports
--
>> error: cannot determine resolution for the attribute macro `vtable`
   --> drivers/cpufreq/rcpufreq_dt.rs:66:3
   |
   66 | #[vtable]
   |   ^^^^^^
   |
   = note: import resolution is stuck, try simplifying macro imports
--
>> error: cannot determine resolution for the macro `fmt`
   --> drivers/cpufreq/rcpufreq_dt.rs:24:36
   |
   24 |         Some(CString::try_from_fmt(fmt!("cpu0")).ok()?)
   |                                    ^^^
   |
   = note: import resolution is stuck, try simplifying macro imports
--
>> error: cannot determine resolution for the macro `fmt`
   --> drivers/cpufreq/rcpufreq_dt.rs:19:38
   |
   19 |     let name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
   |                                      ^^^
   |
   = note: import resolution is stuck, try simplifying macro imports
--
>> error[E0412]: cannot find type `Option` in this scope
   --> drivers/cpufreq/rcpufreq_dt.rs:18:74
   |
   18 | fn find_supply_name_exact(np: *mut bindings::device_node, name: &str) -> Option<CString> {
   |                                                                          ^^^^^^ not found in this scope
--
>> error[E0425]: cannot find value `None` in this scope
   --> drivers/cpufreq/rcpufreq_dt.rs:22:9
   |
   22 |         None
   |         ^^^^ not found in this scope
--
>> error[E0412]: cannot find type `Option` in this scope
   --> drivers/cpufreq/rcpufreq_dt.rs:28:49
   |
   28 | fn find_supply_names(dev: &Device, cpu: u32) -> Option<Vec<CString>> {
   |                                                 ^^^^^^ not found in this scope
--
>> error[E0412]: cannot find type `Vec` in this scope
   --> drivers/cpufreq/rcpufreq_dt.rs:28:56
   |
   28 | fn find_supply_names(dev: &Device, cpu: u32) -> Option<Vec<CString>> {
   |                                                        ^^^ not found in this scope
--
>> error[E0425]: cannot find value `None` in this scope
   --> drivers/cpufreq/rcpufreq_dt.rs:33:16
   |
   33 |         return None;
   |                ^^^^ not found in this scope
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
