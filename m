Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663288F6E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 04:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714364848; cv=none; b=RoQdNMVRA1DdmF1Fn8/z/ULz21h2LFFTagf4tHD79r5FZ9LNxLg1aDCr8Ltfi12PhHUOg6Mz/B3CwCj/CaZIVZO/Mj+LE50jxS43VekZg13AMfIBly3j4QuxIYSUgVvoWir55kT/bdZqljqb/4UJ9qs/+S5VGWX/VLGg1rbsk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714364848; c=relaxed/simple;
	bh=EGdGZcnsuJW5OOq/KzdWCZF6WxcK6oCNQb5zQpmiI1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbDJ8ywwD1ewZy2e7jJLNruujTJRrtDJd6tuudCIjLvS628BO8Polr3nDBIPQq5g7bvVZjfzMpADKLevlRaL/e1eLolNfCuXGroXZJmNAKifF4tRT1rQxtyW9IUkyBYVMDzXJOEwXCYBlgmyCyenzGomI7j5hCD/U/xY3lVMHXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NX0MdlCy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NX0MdlCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714364846; x=1745900846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGdGZcnsuJW5OOq/KzdWCZF6WxcK6oCNQb5zQpmiI1Y=;
  b=NX0MdlCyPN7FclRmhWt5QP2H8ComNqd9padfTReHlS3acar5gClViOut
   QP6OzfmXY9DwadDGb0zoBrXgf92CM8Q3K2ye/6v1ioYrJBLcxqDoSuSgT
   mD1LWepm+oDHgoUPa0Q0ttoE4EioR4RCYRaNha3+kRWXyXLL8R+C+8/f2
   nHWk1ZpAWMRgaZLsKYng9K6n73mm4sxq6UoMuVwP/cZeLwmjAgzf0oXEm
   QJR8MSwa92431S6rgiC11N05ekP1Ty5rZ6AO8HmhfJ+K+5S3UXMH05OVz
   4kv0qJ9fZGma+p5Rh3VhvZtlVwatmtIkHcYPZDq+cOrWEuptYYFte0fI7
   Q==;
X-CSE-ConnectionGUID: B4Bu8fxrSBK3XYA3lgDHng==
X-CSE-MsgGUID: 2GHGxICyT7CfKELiKrisGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10179956"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10179956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 21:27:25 -0700
X-CSE-ConnectionGUID: KMrZ84MlTZObfOcKvHoGbg==
X-CSE-MsgGUID: UuMcVWEaSeinxdpTBcrezA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="30807852"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Apr 2024 21:27:25 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Ibq-0006wg-2S;
	Mon, 29 Apr 2024 04:27:22 +0000
Date: Mon, 29 Apr 2024 12:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 15/18] arch/x86/kvm/x86.c:2521:13: warning:
 'kvm_use_master_clock' defined but not used
Message-ID: <202404291211.NcBsuP0Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   9b3418ddb073f505731f36864180ae4661d91b91
commit: 9b561076f0af69cf41125c6b85f3dbbf6a6d1f45 [15/18] KVM: x86: Factor out kvm_use_master_clock()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404291211.NcBsuP0Q-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291211.NcBsuP0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291211.NcBsuP0Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:2521:13: warning: 'kvm_use_master_clock' defined but not used [-Wunused-function]
    2521 | static bool kvm_use_master_clock(struct kvm *kvm)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/kvm_use_master_clock +2521 arch/x86/kvm/x86.c

  2520	
> 2521	static bool kvm_use_master_clock(struct kvm *kvm)
  2522	{
  2523		struct kvm_arch *ka = &kvm->arch;
  2524	
  2525		/*
  2526		 * The 'old kvmclock' check is a workaround (from 2015) for a
  2527		 * SUSE 2.6.16 kernel that didn't boot if the system_time in
  2528		 * its kvmclock was too far behind the current time. So the
  2529		 * mode of just setting the reference point and allowing time
  2530		 * to proceed linearly from there makes it fail to boot.
  2531		 * Despite that being kind of the *point* of the way the clock
  2532		 * is exposed to the guest. By coincidence, the offending
  2533		 * kernels used the old MSR_KVM_SYSTEM_TIME, which was moved
  2534		 * only because it resided in the wrong number range. So the
  2535		 * workaround is activated for *all* guests using the old MSR.
  2536		 */
  2537		return ka->all_vcpus_matched_tsc &&
  2538			!ka->backwards_tsc_observed &&
  2539			!ka->boot_vcpu_runs_old_kvmclock;
  2540	}
  2541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
