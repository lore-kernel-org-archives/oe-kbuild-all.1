Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AE8472
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 02:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721354645; cv=none; b=Vv7ka0TJsRc8EA8MUg+76Nry1RzJZjf16IwK/L6Ie7NY+A4BTmQM+NUsZutlEZNMYyBlGqJwrGegVEXNPBHopN6RsiRING0pA1U3wMXlfdd8b8YjnDFV3KfHg/RHkzXRnmR1GzJb18yId/VBE1W+jZjGKXwccym/HgeIVVvTZi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721354645; c=relaxed/simple;
	bh=OHfvLlLdOosJ+cDS1EmIRMkAiGTisVz4MG1EHRZEF5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kaXviPfrNanSk0paorjDntArP9aHVpJJWmA5Y83mIHiewxJILkI6PS87dlBCQ8VC4RxpWudT71RqYzJU3LDj1yggv1tuJ37udUMWHJUfhv5rW4trmG6RR2IZj4b2NkINUirzm4gwaBDnBVMCFf1gGs4k0zWUGmk/cH87Q/r0WVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyC0D/s8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyC0D/s8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721354644; x=1752890644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OHfvLlLdOosJ+cDS1EmIRMkAiGTisVz4MG1EHRZEF5g=;
  b=PyC0D/s85Ya0AJEG82Ya39A+G09dgSkyzkMUlnCBtbBKtm9FqMtwGGH8
   OIpDI1WhdQuUE7rLOQbil/H+HE+Zv63IIUb5x8xmc+E+sZrSqPbnZ4l0c
   REijXkFQd16I6mcw6vYof5rTzvcV0U5x29sBJ3nXSnjoVtY3JBGKZAH51
   MBMOnb2UkQRY5ldtHFYmxX9UnNq6oAolNwS30JTfFERlLh7RnpqMSysrh
   6lJ7eEipXHlWQRydUs5zYRQbgVDEil8vuKWj8U6/2PnXZKWtRvQB9Yrrc
   ZLFc8/UGHZ+RYC/u28SaZaHpoYwbuyzY6Lgm0gshxQpYXrzq7zWmAsLlZ
   Q==;
X-CSE-ConnectionGUID: Oa+4QevxSZykSmB1lTfleA==
X-CSE-MsgGUID: /j95UZcXQqy0DDVCbqh9fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="12617312"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="12617312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 19:04:03 -0700
X-CSE-ConnectionGUID: rwRj6P0PRamVP0lXd63QUg==
X-CSE-MsgGUID: 3LdYCp5fRC+pL3ZpRDcZ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="51002352"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2024 19:04:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUcyU-000hlC-2D;
	Fri, 19 Jul 2024 02:03:58 +0000
Date: Fri, 19 Jul 2024 10:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Vibhore Vardhan <vibhore@ti.com>,
	Dhruva Gole <d-gole@ti.com>
Subject: [khilman-omap:lpm-v6.10/constraints 9/15]
 drivers/pmdomain/ti/ti_sci_pm_domains.c:176:1: warning: control reaches end
 of non-void function
Message-ID: <202407190930.pMVXRVPP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git lpm-v6.10/constraints
head:   e2d1fd7e6367d7aa0db506b7d3794eb61553d29c
commit: 7a2a54738aa64954989f42a22bcc087bbc8b3c48 [9/15] pmdomain: ti_sci: add per-device latency constraint management
config: arm64-randconfig-003-20240719 (https://download.01.org/0day-ci/archive/20240719/202407190930.pMVXRVPP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407190930.pMVXRVPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407190930.pMVXRVPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:71,
                    from include/linux/compiler.h:299,
                    from include/linux/err.h:5,
                    from drivers/pmdomain/ti/ti_sci_pm_domains.c:10:
   drivers/pmdomain/ti/ti_sci_pm_domains.c: In function 'ti_sci_pd_resume':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm.h:886:41: note: in expansion of macro 'NULL'
     886 | #define pm_generic_resume               NULL
         |                                         ^~~~
   drivers/pmdomain/ti/ti_sci_pm_domains.c:135:16: note: in expansion of macro 'pm_generic_resume'
     135 |         return pm_generic_resume(dev);
         |                ^~~~~~~~~~~~~~~~~
   drivers/pmdomain/ti/ti_sci_pm_domains.c: In function 'ti_sci_pd_suspend':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm.h:883:41: note: in expansion of macro 'NULL'
     883 | #define pm_generic_suspend              NULL
         |                                         ^~~~
   drivers/pmdomain/ti/ti_sci_pm_domains.c:156:16: note: in expansion of macro 'pm_generic_suspend'
     156 |         return pm_generic_suspend(dev);
         |                ^~~~~~~~~~~~~~~~~~
   drivers/pmdomain/ti/ti_sci_pm_domains.c: In function 'ti_sci_pd_suspend_late':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm.h:881:41: note: in expansion of macro 'NULL'
     881 | #define pm_generic_suspend_late         NULL
         |                                         ^~~~
   drivers/pmdomain/ti/ti_sci_pm_domains.c:175:16: note: in expansion of macro 'pm_generic_suspend_late'
     175 |         return pm_generic_suspend_late(dev);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:176:1: warning: control reaches end of non-void function [-Wreturn-type]
     176 | }
         | ^
   drivers/pmdomain/ti/ti_sci_pm_domains.c: In function 'ti_sci_pd_suspend':
   drivers/pmdomain/ti/ti_sci_pm_domains.c:157:1: warning: control reaches end of non-void function [-Wreturn-type]
     157 | }
         | ^
   drivers/pmdomain/ti/ti_sci_pm_domains.c: In function 'ti_sci_pd_resume':
   drivers/pmdomain/ti/ti_sci_pm_domains.c:136:1: warning: control reaches end of non-void function [-Wreturn-type]
     136 | }
         | ^


vim +176 drivers/pmdomain/ti/ti_sci_pm_domains.c

   158	
   159	static int ti_sci_pd_suspend_late(struct device *dev)
   160	{
   161		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
   162		struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
   163	
   164		if (pm_runtime_suspended(dev)) {
   165			if (genpd && genpd->status == GENPD_STATE_OFF)
   166				dev_warn(dev, "%s: RPM suspended but genpd %s still on.\n",
   167					 __func__, genpd->name);
   168		}
   169	
   170		if (ti_sci_pd_is_valid_constraint(pd->lat_constraint) &&
   171		    !pd->constraint_sent)
   172			dev_warn(dev, "%s: %s: valid constraint (%d), but NOT sent!\n",
   173				 genpd->name, __func__, pd->lat_constraint);
   174	
   175		return pm_generic_suspend_late(dev);
 > 176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
