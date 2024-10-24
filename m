Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCE51D6DA8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729795216; cv=none; b=LAE3wX+qsv3lUDzdVI1BzVogiscZajfL/OC2B436JVbDNncBA6BOUGGBTpt4eiYiR1fbiM42l7a9Wb+neZxAUKndmSKuufy4JI63Fue9pOMqR5qzNTU7i24CJNDDBdmlg662/uM13opZIYhJfzcbwTWoctcLEhtTK0badZeyuAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729795216; c=relaxed/simple;
	bh=CR4WNTDHLJBOu5odmy1Ki/Ce64N6UqxT0RpnTsLNKf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E5F+C2oVeH0jY13h0z9YNhpnOylw2YbfVdXScOj3GD4gK+QjL+m5xGp4HZNjF4HuKVPIV8y0OjTz7K9n2suMQgcD8xSlGdtZRfRRLeWT5Ei/PFWZJ0E8u865tkEvT0PGfGi7ZXfBPWdD9IJyUgadnjoHN+cA69bHcQxaWn663Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+v+MTuW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+v+MTuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729795215; x=1761331215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CR4WNTDHLJBOu5odmy1Ki/Ce64N6UqxT0RpnTsLNKf0=;
  b=P+v+MTuWhnuxOmN5CzT6QEunb5oEMsYLKDxs0hXp0yqRgtQKgvDgWd7i
   UPiwCkW0FOZ2e/r4Z9sEUZM2D4wkizU5V4E7Dj9CL2rZ+DwZ5E2PhPJKz
   IeF7QYWj8QSMZSPKuldofHSepYLn8Wnp39LLePzKm3lD9BQDtG3yM+oFg
   BdpscAh2uE2o8ZzoA/XG8nMwGvj6k40KwJGflo+AblZJ+1xiWYwrG+pjf
   Fo4RgXLMTYLwlxcyrGq9fkstiD2JPK65FkYWId2WR60+ELOmfNcLYvHV4
   NzmRgMUx/dB5T978Zc5Gb+CDFzFkqxd/7Az6KjLFlP3IcCEgK+1bXANFP
   A==;
X-CSE-ConnectionGUID: /jDBTLX1RSiIBLX9v08BvQ==
X-CSE-MsgGUID: yICMp96OSUibJvRqO//zCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29217885"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29217885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 11:40:13 -0700
X-CSE-ConnectionGUID: 9Nz6xc9rT4mO/ITa55sR1A==
X-CSE-MsgGUID: +jau5nbLSRWMUCtXBo03Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80668959"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2024 11:40:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t42kk-000WrY-0A;
	Thu, 24 Oct 2024 18:40:10 +0000
Date: Fri, 25 Oct 2024 02:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15045/23857]
 drivers/clocksource/arm_arch_timer.c:554:44: error:
 'hisi_161010101_read_cntvct_el0' undeclared
Message-ID: <202410250213.xpJhjcfg-lkp@intel.com>
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
head:   fc5b1a61061cb6d640f3336024fb616182ef2614
commit: e63b4759933f6a5c5ce6cdc1d11c7bf2201d0612 [15045/23857] arm64: arch_timer: only do cntvct workaround on VDSO path on D05
config: arm64-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250213.xpJhjcfg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250213.xpJhjcfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250213.xpJhjcfg-lkp@intel.com/

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
