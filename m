Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF61210940
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710585347; cv=none; b=G/F9YYVbiD1odpiNatvDODwkc74KCMlyGxGvxEMbiNasEKeLniN1jnw4B65yJM4qVfns6JcRlieqSob7PBw91cbeqPNWXrEe5IptkcCiqR2y9YiU0q1XegabzhR5pSehdby6Xdy1WLP8kg7ba8Mf1rHKRM21umuyZAft+UCow/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710585347; c=relaxed/simple;
	bh=32HuGXoBlG8da+Q7BgL3HwaTXlMrxg0e3CehclSTba8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCPvH+/fkaM2GJALZ1scZTWzy2/LxzqiUWkKfFsFm/TcJL8sKELaRjZNHUMwQQzze1asHgxovsU3k7XNl8kv38gmZAEF5RV6tBG9F87AOFQiWOVvF29zIy+HhCS4g0ADDa6Fj39wqooyV2SQvMpc8IGJLkAyNzRs8FAU2brqOXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4Hzbznb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4Hzbznb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710585345; x=1742121345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32HuGXoBlG8da+Q7BgL3HwaTXlMrxg0e3CehclSTba8=;
  b=Q4HzbznbhTBzDcnRoopN58UOPD6KFqikPlqU/DWpLrQ0R65PNOIDnLC5
   TEGQUBb62vjhBfTSXTnVg/2TtOUdA/It5Vhk/Yzsc5PsfWBTHh9txvLDg
   BPS6cocWPckg39IyKFusWNuVoDP1u4FDyWRUao3WUmiVZxP/74GHJlzWs
   Z3sHyhVJyKISF6zSA9ga+7nlOTvHeTNOlF9FKO4ilpzElDIziNju8C361
   DLMu7zaS1G4/2MhBfIhpEqkJapEG7VVH9sZPlgoRJuVtQgl6OhBgV2me6
   CwIArGqdLOUN0lDRS9xoSTdXft3JCAgxdF+e0sFnwvep6b7d/1GyvGtcY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16178262"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="16178262"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 03:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="17541611"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Mar 2024 03:35:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlRO8-000FKN-2e;
	Sat, 16 Mar 2024 10:35:40 +0000
Date: Sat, 16 Mar 2024 18:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 41/43] error[E0599]: no method named
 `as_mut_ptr` found for raw pointer `*mut bindings::cpumask` in the current
 scope
Message-ID: <202403161829.u12DIvRX-lkp@intel.com>
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
commit: 1776fbd4494c787f94fba8c37f6fe3b2d85bd98b [41/43] rust: Add bindings for cpufreq framework
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240316/202403161829.u12DIvRX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161829.u12DIvRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161829.u12DIvRX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `as_mut_ptr` found for raw pointer `*mut bindings::cpumask` in the current scope
   --> rust/kernel/cpufreq.rs:251:35
   |
   251 |         unsafe { (*self.ptr).cpus.as_mut_ptr() }
   |                                   ^^^^^^^^^^ help: there is a method with a similar name: `as_mut`
   |
   = note: try using `<*const T>::as_ref()` to get a reference to the type behind the pointer: https://doc.rust-lang.org/std/primitive.pointer.html#method.as_ref
   = note: using `<*const T>::as_ref()` on a pointer which is unaligned or points to invalid or uninitialized memory is undefined behavior
--
>> error[E0599]: no method named `as_mut_ptr` found for raw pointer `*mut bindings::cpumask` in the current scope
   --> rust/kernel/cpufreq.rs:256:66
   |
   256 |         unsafe { bindings::cpumask_set_cpu(cpu, (*self.ptr).cpus.as_mut_ptr()) };
   |                                                                  ^^^^^^^^^^ help: there is a method with a similar name: `as_mut`
   |
   = note: try using `<*const T>::as_ref()` to get a reference to the type behind the pointer: https://doc.rust-lang.org/std/primitive.pointer.html#method.as_ref
   = note: using `<*const T>::as_ref()` on a pointer which is unaligned or points to invalid or uninitialized memory is undefined behavior
--
>> error[E0599]: no method named `as_mut_ptr` found for raw pointer `*mut bindings::cpumask` in the current scope
   --> rust/kernel/cpufreq.rs:261:60
   |
   261 |         unsafe { bindings::cpumask_setall((*self.ptr).cpus.as_mut_ptr()) };
   |                                                            ^^^^^^^^^^ help: there is a method with a similar name: `as_mut`
   |
   = note: try using `<*const T>::as_ref()` to get a reference to the type behind the pointer: https://doc.rust-lang.org/std/primitive.pointer.html#method.as_ref
   = note: using `<*const T>::as_ref()` on a pointer which is unaligned or points to invalid or uninitialized memory is undefined behavior

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
