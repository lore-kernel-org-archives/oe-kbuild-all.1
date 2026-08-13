Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B085247A879
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627342; cv=none; b=pUevqZtGjzg6WjTvZ2VjGD6AYqec0xTysOG3r8a8Z7cLtPJwS1oAc/0xcXqBx22b3CyjTHE2h3bNov5ZBPiAbL3D9+47G4mJm2ph/eQWWKKZZ3p0oDqS71JUSkPKig75ijV/v7/6CF9y0j2if+/Qwt8n7YGdnmIAcUTxK9lNVYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627342; c=relaxed/simple;
	bh=/HLqfCri9WeZXw7lh0Qu1R56BwKobCDnH3yCaY3Pejo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lpzOf8Dv5ES1dA/L88umxKa5r315RL9MR/0q5QWVe1M5pVbq0GoISnCZ9htfpzIvIXTclyuRaFJhZccpkwJFUNyfJO07+BO2Qo4XNF1cEIKaU7DjGI/hCFyIdO51y3WboO/1sUVfXt+t6G3Y0bGm+2T4PQ8UP9k80VbKNbu/QuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOokZYbw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOokZYbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786627340; x=1818163340;
  h=date:from:to:cc:subject:message-id;
  bh=/HLqfCri9WeZXw7lh0Qu1R56BwKobCDnH3yCaY3Pejo=;
  b=LOokZYbwtoifJmJ6IoylHMFusw1L7h3TzxrGSgfaTpv83QGeJl/2GeAP
   rgKNfPmr4HRgNVsyVZqC0mX9UPIBEYNBxhtALk+Inm9KzJMJMVppVhGf3
   giK7KTQJ8CTWJn45QbS++X+te+QuKR9rKO1hdeqeX5aKBy4GOlhLBOuCD
   jTOHyD1uq4/0on1uERNm5z6Tv5470WMJQ3oCEQamsRsH+0LryoHdWgY0y
   jYwTGWAecrHG6tU/vyNLXPVLalOBi3Pn6MuffCMfeB//PEeV2R8Fa3YoC
   7AUgqxSB4iS5U8Zd9vWaC4utgm/EcvHqovoBdF/FFC8qnPh/3d8MFGr3t
   Q==;
X-CSE-ConnectionGUID: 4LwrMO6aQNmrthr8BDy2pw==
X-CSE-MsgGUID: eMaVXUvXT9SreU8bNZIe8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112743506"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="112743506"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 06:22:20 -0700
X-CSE-ConnectionGUID: TuvQYz/NSq2/N5eIjhUNAw==
X-CSE-MsgGUID: 9ge63Vp2Qe2+gEex3aZjNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264521240"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2026 06:22:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuVNw-00000000UAO-2nbU;
	Thu, 13 Aug 2026 13:22:16 +0000
Date: Thu, 13 Aug 2026 21:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/platform/x86/thinkpad_acpi.c:10608:10: error: 'struct
 platform_profile_handler' has no member named 'profile_get'
Message-ID: <202608132106.ol7XPznV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: ea909ed70c5c85d9c3f781b4a009e6a6ddbb133a [1/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Add `ops` member to handlers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608132106.ol7XPznV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132106.ol7XPznV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608132106.ol7XPznV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_refresh':
   drivers/platform/x86/thinkpad_acpi.c:10603:17: error: too few arguments to function 'platform_profile_notify'
   10603 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/thinkpad_acpi.c:60:
   include/linux/platform_profile.h:51:6: note: declared here
      51 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: At top level:
>> drivers/platform/x86/thinkpad_acpi.c:10608:10: error: 'struct platform_profile_handler' has no member named 'profile_get'
   10608 |         .profile_get = dytc_profile_get,
         |          ^~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10608:24: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct platform_profile_handler *, enum platform_profile_option *)' [-Wincompatible-pointer-types]
   10608 |         .profile_get = dytc_profile_get,
         |                        ^~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10608:24: note: (near initialization for 'dytc_profile.name')
>> drivers/platform/x86/thinkpad_acpi.c:10609:10: error: 'struct platform_profile_handler' has no member named 'profile_set'
   10609 |         .profile_set = dytc_profile_set,
         |          ^~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10609:24: error: initialization of 'struct device *' from incompatible pointer type 'int (*)(struct platform_profile_handler *, enum platform_profile_option)' [-Wincompatible-pointer-types]
   10609 |         .profile_set = dytc_profile_set,
         |                        ^~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10609:24: note: (near initialization for 'dytc_profile.dev')
   drivers/platform/x86/thinkpad_acpi.c: In function 'tpacpi_dytc_profile_init':
   drivers/platform/x86/thinkpad_acpi.c:10681:15: error: too few arguments to function 'platform_profile_register'
   10681 |         err = platform_profile_register(&dytc_profile);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:47:5: note: declared here
      47 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_exit':
   drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to function 'platform_profile_remove'
   10701 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:48:5: note: declared here
      48 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +10608 drivers/platform/x86/thinkpad_acpi.c

c3bfcd4c676238e Mark Pearson      2021-01-11  10574  
c3bfcd4c676238e Mark Pearson      2021-01-11  10575  static void dytc_profile_refresh(void)
c3bfcd4c676238e Mark Pearson      2021-01-11  10576  {
c3bfcd4c676238e Mark Pearson      2021-01-11  10577  	enum platform_profile_option profile;
f999e23ce66c155 Mark Pearson      2023-06-06  10578  	int output = 0, err = 0;
f999e23ce66c155 Mark Pearson      2023-06-06  10579  	int perfmode, funcmode = 0;
c3bfcd4c676238e Mark Pearson      2021-01-11  10580  
c3bfcd4c676238e Mark Pearson      2021-01-11  10581  	mutex_lock(&dytc_mutex);
42504af775361ca Mark Pearson      2022-06-03  10582  	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
7a47f86bba748b3 Mark Pearson      2021-04-06  10583  		if (dytc_mmc_get_available)
7a47f86bba748b3 Mark Pearson      2021-04-06  10584  			err = dytc_command(DYTC_CMD_MMC_GET, &output);
7a47f86bba748b3 Mark Pearson      2021-04-06  10585  		else
c3bfcd4c676238e Mark Pearson      2021-01-11  10586  			err = dytc_cql_command(DYTC_CMD_GET, &output);
1bc5d819f0b9784 Mark Pearson      2023-01-24  10587  		funcmode = DYTC_FUNCTION_MMC;
1bc5d819f0b9784 Mark Pearson      2023-01-24  10588  	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
e1c21608e3cfc4b Mark Pearson      2022-02-25  10589  		err = dytc_command(DYTC_CMD_GET, &output);
1bc5d819f0b9784 Mark Pearson      2023-01-24  10590  		/* Check if we are PSC mode, or have AMT enabled */
1bc5d819f0b9784 Mark Pearson      2023-01-24  10591  		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
f999e23ce66c155 Mark Pearson      2023-06-06  10592  	} else { /* Unknown profile mode */
f999e23ce66c155 Mark Pearson      2023-06-06  10593  		err = -ENODEV;
1bc5d819f0b9784 Mark Pearson      2023-01-24  10594  	}
c3bfcd4c676238e Mark Pearson      2021-01-11  10595  	mutex_unlock(&dytc_mutex);
c3bfcd4c676238e Mark Pearson      2021-01-11  10596  	if (err)
c3bfcd4c676238e Mark Pearson      2021-01-11  10597  		return;
c3bfcd4c676238e Mark Pearson      2021-01-11  10598  
c3bfcd4c676238e Mark Pearson      2021-01-11  10599  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
427c70dec738318 Mario Limonciello 2024-02-16  10600  	err = convert_dytc_to_profile(funcmode, perfmode, &profile);
427c70dec738318 Mario Limonciello 2024-02-16  10601  	if (!err && profile != dytc_current_profile) {
c3bfcd4c676238e Mark Pearson      2021-01-11  10602  		dytc_current_profile = profile;
c3bfcd4c676238e Mark Pearson      2021-01-11 @10603  		platform_profile_notify();
c3bfcd4c676238e Mark Pearson      2021-01-11  10604  	}
c3bfcd4c676238e Mark Pearson      2021-01-11  10605  }
c3bfcd4c676238e Mark Pearson      2021-01-11  10606  
c3bfcd4c676238e Mark Pearson      2021-01-11  10607  static struct platform_profile_handler dytc_profile = {
c3bfcd4c676238e Mark Pearson      2021-01-11 @10608  	.profile_get = dytc_profile_get,
c3bfcd4c676238e Mark Pearson      2021-01-11 @10609  	.profile_set = dytc_profile_set,
c3bfcd4c676238e Mark Pearson      2021-01-11  10610  };
c3bfcd4c676238e Mark Pearson      2021-01-11  10611  

:::::: The code at line 10608 was first introduced by commit
:::::: c3bfcd4c676238e198d5a798b50e5d424bf05497 platform/x86: thinkpad_acpi: Add platform profile support

:::::: TO: Mark Pearson <markpearson@lenovo.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
