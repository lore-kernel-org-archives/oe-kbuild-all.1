Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5715A22B8A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 23:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751154025; cv=none; b=qxKyymx9Frk0Qp1LvUIM387x0rL1Fj12vF2FszeR3rwOFS/YmRRzD01kjG1xLoi+HRQTJwImfQSY69az/FVs64Hy6L6c3YIeLScR7hFeDEfaZfX/QPpo+Hk64nhG/t4t/EVO3BUXRZ+olaJ08k8WC+Nqf2zis65DErZi/tufonI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751154025; c=relaxed/simple;
	bh=UhU1IO1cb15dVTrBJ46CgfvRJH0rlvL5y0NJdEg/N4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4L1fvsjNHA3pNtGPieGstC9jfvXTSjQH6+McF+2KhS32MUis2r8wVUuYMyRhaP5hoB3wOXT/9onnb2rsoQhaqq/mvVgVlVTnUZZr/PVnLa7LwhQZwNu0tOggaZisGLIuIVBW5v0jRG1sJ4e9rFPQt+63Nvcnnjrf9RuIDtRmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEp404Zq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEp404Zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751154022; x=1782690022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UhU1IO1cb15dVTrBJ46CgfvRJH0rlvL5y0NJdEg/N4w=;
  b=NEp404ZqboJW42T7f8icUo+CcmCAwKxHjwmlWgFWPgnLXyimyHvIXM3s
   HicY/dFkIbPRBciDE9knmI6wLh+sqBR7oJRvfcdR624F7m0iXR8I59t0Z
   iwG7XCiB7v/RYpV4Nhx+fUcvUwf7w2ab7rjlmTmvDHpx/shxHIjW1vHkG
   b9RP2btATW+z9xG5ZYnB2fLxx/aP9OiLh2eRGsUMT1ZGlPSp3Zlg3pZZZ
   ZKctPyynGjTQgfX/C7WzD4OGcNC+i1K4TBD6exYDZy5Fa2fzIaNs3HbSy
   RleDuRyoCsZq5He5OTOqVOJNdUOFp4b1yHPT0ptop93SMOKTECwl+ca8x
   g==;
X-CSE-ConnectionGUID: m1SDCOmFQVKa2hRzJ+tgYQ==
X-CSE-MsgGUID: 3f58rXC5S4G7qqNyK0KXLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57201733"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="57201733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 16:40:22 -0700
X-CSE-ConnectionGUID: y7CHE3sVRXqqYgAkswKIxw==
X-CSE-MsgGUID: 3vUyENppQg2EV4EmDvSYSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="153208750"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jun 2025 16:40:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVf9e-000XUQ-0P;
	Sat, 28 Jun 2025 23:40:18 +0000
Date: Sun, 29 Jun 2025 07:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Rui <rui.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [rafael-pm:fixes 3/5]
 drivers/powercap/intel_rapl_common.c:357:50-54: opportunity for
 str_enabled_disabled(mode)
Message-ID: <202506290745.i7nfrR7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git fixes
head:   e962f723d1420ff8ac720a80fa2b65abc7ece1ff
commit: 3b2cebf28cac6dc375be5be675dd767b400cd294 [3/5] powercap: intel_rapl: Do not change CLAMPING bit if ENABLE bit cannot be changed
config: x86_64-randconfig-104-20250629 (https://download.01.org/0day-ci/archive/20250629/202506290745.i7nfrR7D-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290745.i7nfrR7D-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/powercap/intel_rapl_common.c:357:50-54: opportunity for str_enabled_disabled(mode)

vim +357 drivers/powercap/intel_rapl_common.c

   339	
   340	static int set_domain_enable(struct powercap_zone *power_zone, bool mode)
   341	{
   342		struct rapl_domain *rd = power_zone_to_rapl_domain(power_zone);
   343		struct rapl_defaults *defaults = get_defaults(rd->rp);
   344		u64 val;
   345		int ret;
   346	
   347		cpus_read_lock();
   348		ret = rapl_write_pl_data(rd, POWER_LIMIT1, PL_ENABLE, mode);
   349		if (ret)
   350			goto end;
   351	
   352		ret = rapl_read_pl_data(rd, POWER_LIMIT1, PL_ENABLE, false, &val);
   353		if (ret)
   354			goto end;
   355	
   356		if (mode != val) {
 > 357			pr_debug("%s cannot be %s\n", power_zone->name, mode ? "enabled" : "disabled");
   358			goto end;
   359		}
   360	
   361		if (defaults->set_floor_freq)
   362			defaults->set_floor_freq(rd, mode);
   363	
   364	end:
   365		cpus_read_unlock();
   366	
   367		return ret;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
