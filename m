Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143325D215
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jun 2026 04:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893002; cv=none; b=LportPkA1TVQV1XWbvveUCpKnJk86nrzV0TDaEhrLpCf6GsLlQMPPE18JgKWEyA61eBrEv2VbKlyelxUU2V3fT5N18WaLx/7NYeq8WKVoKbH5BwIgEgCzhlf2c0FW2d+Y8sSDTcC4fGoakqNzP9GLrRjsic8vc2xACA4P6YKlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893002; c=relaxed/simple;
	bh=+wEs5IJV5oO+EOWekZdDzdA8xuR2rCvRTidHA8gFWO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDk2/6YcL2UMBWJr9LQfRhxFa8JQk0PrFN77MSl1AH4psrCfm1/DhlHqpb+XwNN2273wKCK77y5+QMkivOKkDc5RgpWRXtwTN+iiyhF86FK2zjwktsM2bjm3215izgrSxKTFz2nfec/mCu7Rj1k4rEHL7y5dnGaWtMBiWpO2I0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkTzj3Fn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkTzj3Fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780893001; x=1812429001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+wEs5IJV5oO+EOWekZdDzdA8xuR2rCvRTidHA8gFWO8=;
  b=XkTzj3Fnp2ppb7klY/bbCMZ8i48jIhDpIk2E8s/zrcub4cuBNn6S8Uc6
   ihrwUBp7oytVNdYvaWaNmjJ2oQl3+h3tIjCu5itbwbSPcunddESGn3gt0
   aXkSsv429JoqK8A5Un4LwJCTa9RSqcPBpSEi+uUpNagwILOXP5uYfrpl2
   uyCh4fvhWtzvR7zI9OkmHBHI7+RbJ+bKPrkYm9MWqI8iAobbkwCv+qGv/
   OG2eGvG6/3VbPLli2yWAX4/ykSiJ9b48eipmdcOiY9fjyXSSfjM5TOOFR
   N2Tya1UDPyBkQI3wehrgz9Dy5Fx0hG4TWEaIF3ke5bsyG8Z/SBatfN+ey
   A==;
X-CSE-ConnectionGUID: ENrLEerCRfqqBXrmQRnfRA==
X-CSE-MsgGUID: 9VjVrRtrRJGzqveoz0Oc8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="69155653"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="69155653"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 21:30:00 -0700
X-CSE-ConnectionGUID: tcC0YU9KSgSdMLol4prcqA==
X-CSE-MsgGUID: +rOjwvoySaiiSnhAtuJn6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="244318747"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 07 Jun 2026 21:29:57 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWRcZ-000000003Bd-1F0f;
	Mon, 08 Jun 2026 04:29:55 +0000
Date: Mon, 8 Jun 2026 06:29:05 +0200
From: kernel test robot <lkp@intel.com>
To: yahia <yahia.a.abdrabou@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, david@kernel.org, ziy@nvidia.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	yahia <yahia.a.abdrabou@gmail.com>
Subject: Re: [PATCH] mm/migrate: Add native folio functions
Message-ID: <202606080649.AbjPE8ud-lkp@intel.com>
References: <20260608001251.66847-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608001251.66847-1-yahia.a.abdrabou@gmail.com>

Hi yahia,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/yahia/mm-migrate-Add-native-folio-functions/20260608-081741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260608001251.66847-1-yahia.a.abdrabou%40gmail.com
patch subject: [PATCH] mm/migrate: Add native folio functions
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260608/202606080649.AbjPE8ud-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606080649.AbjPE8ud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606080649.AbjPE8ud-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/bitmap.h:8,
                    from ./include/linux/cpumask.h:11,
                    from ./arch/x86/include/asm/paravirt.h:19,
                    from ./arch/x86/include/asm/irqflags.h:100,
                    from ./include/linux/irqflags.h:18,
                    from ./include/linux/spinlock.h:59,
                    from ./include/linux/swait.h:7,
                    from ./include/linux/completion.h:12,
                    from ./include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   ./include/linux/page-flags.h: In function 'folio_test_MovableOpsIsolated':
>> ./include/linux/page-flags.h:412:19: error: 'PG_MovableOpsIsolated' undeclared (first use in this function); did you mean 'PG_movable_ops_isolated'?
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                   ^~~
   ./include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   ./include/linux/page-flags.h:412:10: note: in expansion of macro 'test_bit'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |          ^~~~~~~~
   ./include/linux/page-flags.h:1113:1: note: in expansion of macro 'FOLIO_TEST_FLAG'
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         | ^~~~~~~~~~~~~~~
   ./include/linux/page-flags.h:412:19: note: each undeclared identifier is reported only once for each function it appears in
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                   ^~~
   ./include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   ./include/linux/page-flags.h:412:10: note: in expansion of macro 'test_bit'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |          ^~~~~~~~
   ./include/linux/page-flags.h:1113:1: note: in expansion of macro 'FOLIO_TEST_FLAG'
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         | ^~~~~~~~~~~~~~~
>> ./include/linux/page-flags.h:1113:37: error: 'movable_ops_isolated' undeclared (first use in this function); did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         |                                     ^~~~~~~~~~~~~~~~~~~~
   ./include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   ./include/linux/page-flags.h:412:10: note: in expansion of macro 'test_bit'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |          ^~~~~~~~
   ./include/linux/page-flags.h:1113:1: note: in expansion of macro 'FOLIO_TEST_FLAG'
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         | ^~~~~~~~~~~~~~~


vim +412 ./include/linux/page-flags.h

dfbac6dc68bae9 Matthew Wilcox (Oracle  2024-02-27  406) 
f94a62e910840b Christoph Lameter       2008-04-28  407  /*
f94a62e910840b Christoph Lameter       2008-04-28  408   * Macros to create function definitions for page flags
f94a62e910840b Christoph Lameter       2008-04-28  409   */
dfbac6dc68bae9 Matthew Wilcox (Oracle  2024-02-27  410) #define FOLIO_TEST_FLAG(name, page)					\
ce3467af6bded1 Matthew Wilcox (Oracle  2024-02-27  411) static __always_inline bool folio_test_##name(const struct folio *folio) \
ce3467af6bded1 Matthew Wilcox (Oracle  2024-02-27 @412) { return test_bit(PG_##name, const_folio_flags(folio, page)); }
dfbac6dc68bae9 Matthew Wilcox (Oracle  2024-02-27  413) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
