Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71968153BF8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 05:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413624; cv=none; b=AfKnIRoEhqyKY9qMerbjipeCQX3PJrzC0LDqw9FNt/WtA0WldpfPki0rlOmLvPce5ZxN7thsraH5RV1yp33HsWdqzhwpHKyPHCFhK9dSJqq+YSdHk3zVulQG+K8GZLpT7s2vDoK76Lcl1Ko+sDc6NUHTlJy8FtpTr6yKnLOQ2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413624; c=relaxed/simple;
	bh=+AWI7FaG4qbX5QvSYqjUEh2IcC0EDl7pyuA7QI8TW40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkjHDm/8MLzdwUyo5Z0VVFYUQEbeHFZWTVV8yRrtdn6q4k43SPRoxZAnicAVMiffK9xYXHUdTzTOpvfAYD56TAnxLE1xxK+R9Tyggi3DrrOM2onUUSw/MMVHCBvB3Szej+0PwcnjSRwELmtc4tLhz7WqWaXJ7MTho6hyLj1s3NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRCA0/ET; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRCA0/ET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734413622; x=1765949622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+AWI7FaG4qbX5QvSYqjUEh2IcC0EDl7pyuA7QI8TW40=;
  b=gRCA0/ETJAzkEXlv+alQyZMkXhkV9hhyj/vplXDxaGknm1bbqr7QlalV
   IvjAOONgpoOWOiuUEwsXlQLe1tfk/ZkPQ/jLNSNx8d6bZbXIQlSy6RZ6r
   sW269g1xm4jxVjTQk9qUJaE0CApXEYrz3GxRASbOPu6wzlfFJ7MdnDMV1
   DkL5TKPfF7UxDfvj0khI3l7ANVheW/47cSvruCenA18EFrAszRZG53UmG
   YfHK+cZjGhxNvfLhSGMh+aWBt9oObKCujcQGbpZnWkV9/DZaNs73jW5z6
   mrCl3ztbGEUL1CO8kL6gPB/sxXk4jiPXsCccWhoS6Uew6RvugnpKEsstU
   A==;
X-CSE-ConnectionGUID: FspbyCs0T+SctP9lOhQwyg==
X-CSE-MsgGUID: k1IU79x3Ri2nABz0UJLS0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45518812"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="45518812"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 21:33:40 -0800
X-CSE-ConnectionGUID: 2zP5uYJMSyaPLVPaOiY37w==
X-CSE-MsgGUID: 0TJTHG9cSoKj1I9aXs2PoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134762001"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 21:33:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNQDA-000Eju-1n;
	Tue, 17 Dec 2024 05:33:36 +0000
Date: Tue, 17 Dec 2024 13:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1328/1328]
 drivers/clocksource/arm_arch_timer.c:554:44: error:
 'hisi_161010101_read_cntvct_el0' undeclared
Message-ID: <202412171325.Cz4KRdST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   400eaf3b33d125cc5fae6b621d5a6ff6be0b8892
commit: e63b4759933f6a5c5ce6cdc1d11c7bf2201d0612 [1328/1328] arm64: arch_timer: only do cntvct workaround on VDSO path on D05
config: arm64-randconfig-004-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171325.Cz4KRdST-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171325.Cz4KRdST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171325.Cz4KRdST-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/arm_arch_timer.c: In function 'arch_timer_enable_workaround':
>> drivers/clocksource/arm_arch_timer.c:554:44: error: 'hisi_161010101_read_cntvct_el0' undeclared (first use in this function)
     554 |                 if (wa->read_cntvct_el0 == hisi_161010101_read_cntvct_el0) {
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:554:44: note: each undeclared identifier is reported only once for each function it appears in


vim +/hisi_161010101_read_cntvct_el0 +554 drivers/clocksource/arm_arch_timer.c

   527	
   528	static
   529	void arch_timer_enable_workaround(const struct arch_timer_erratum_workaround *wa,
   530					  bool local)
   531	{
   532		int i;
   533	
   534		if (local) {
   535			__this_cpu_write(timer_unstable_counter_workaround, wa);
   536		} else {
   537			for_each_possible_cpu(i)
   538				per_cpu(timer_unstable_counter_workaround, i) = wa;
   539		}
   540	
   541		/*
   542		 * Use the locked version, as we're called from the CPU
   543		 * hotplug framework. Otherwise, we end-up in deadlock-land.
   544		 */
   545		static_branch_enable_cpuslocked(&arch_timer_read_ool_enabled);
   546	
   547		/*
   548		 * Don't use the vdso fastpath if errata require using the
   549		 * out-of-line counter accessor. We may change our mind pretty
   550		 * late in the game (with a per-CPU erratum, for example), so
   551		 * change both the default value and the vdso itself.
   552		 */
   553		if (wa->read_cntvct_el0) {
 > 554			if (wa->read_cntvct_el0 == hisi_161010101_read_cntvct_el0) {
   555				clocksource_counter.archdata.vdso_direct = true;
   556				vdso_default = true;
   557				vdso_fix = true;
   558			} else {
   559				clocksource_counter.archdata.vdso_direct = false;
   560				vdso_default = false;
   561			}
   562		}
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
