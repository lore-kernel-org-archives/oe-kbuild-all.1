Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F818BC0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 23:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732317757; cv=none; b=cNKIlF1F14gXpCOXMEXIXJkFHyLU2N3lfYtgksRI71bhldoAj63zOrU/g1W3A1LdEA3OUQWF10Q8egu/cmEZjEQy54sNsLCjL3ToRTbSOuh86ZycHZh94y4IdsajspTrSxOzsr0SvUSW2l/CrO45fCBvXvnVobL1hlrbKKnP3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732317757; c=relaxed/simple;
	bh=U98wfntccPutDTlKagkU14dVLlxOGgoUdEYQN8xJfWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QxP8TJTB39lPL7x/KjWVEIeM83PkAHbfYvYSnp3F96xiokAhHHopzkg71e395TCTxONxI31Ulb2v1fwPQtRSaPsBoAWfqOyUKCOp8VG5ez7WZIND9lMCyU5QOeKFaWSEL+3aJgbRpnmnKdgWeCd3AoXIwjoDdGxsXRGWSNMHpLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZ3f3ZlG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZ3f3ZlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732317755; x=1763853755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U98wfntccPutDTlKagkU14dVLlxOGgoUdEYQN8xJfWM=;
  b=JZ3f3ZlG9V9w4qziVXRspS1tgdunOQeqZDU37B9yOrAftkQHD3An37N0
   ViHV8kiS5VQFX0D6ZYnpmtMmEu0JQyqViLXWRovcgkDkLfIgoS3/a+HNg
   SSsLixtBZzvYCPrHNVEtbDdr4dmMUZK/F9dkluSQzy2ICRr8MjSVRYX+o
   uFc38sU538PZGY8y95QelwtUeYjLdyIgpfxhf7b1DfZNh6wKXw9RuhwOr
   gikhtKNFmnsrgUAovJ+c/CKFFmjtBRkxOv0ZPHGuzilBa0NQiI6egaOhE
   +v2Kh5pQnGYCWyf9YKnbuGLTN6XQUW0McM2FvsBsra+5ear1dBB7L5wB9
   A==;
X-CSE-ConnectionGUID: aON2GlF1RriKfTWZndJmOg==
X-CSE-MsgGUID: e+85twcyRheLiAYbZsumtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43886550"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="43886550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 15:22:33 -0800
X-CSE-ConnectionGUID: YMnW+3mJR/6kZIZydMCv/g==
X-CSE-MsgGUID: 3JcAPek2S7mSYx3GNLqffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="91507957"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2024 15:22:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEcys-0004HY-0D;
	Fri, 22 Nov 2024 23:22:30 +0000
Date: Sat, 23 Nov 2024 07:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rafael Aquini <aquini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Justin M. Forbes" <jforbes@fedoraproject.org>
Subject: [snitzer:snitm-kernel-6.12/delstid-localio 4482/4957]
 include/linux/rh_flags.h:32:13: warning: 'rh_add_flag' defined but not used
Message-ID: <202411230701.lGVAj9XM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git snitm-kernel-6.12/delstid-localio
head:   f102a32db07d849c674ad967119239239a8730f8
commit: 1baa000aa84781047970328da555bdbe3bb878f7 [4482/4957] redhat: rh_flags: declare proper static methods when !CONFIG_RHEL_DIFFERENCES
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411230701.lGVAj9XM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230701.lGVAj9XM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230701.lGVAj9XM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/module/main.c:68:
>> include/linux/rh_flags.h:32:13: warning: 'rh_add_flag' defined but not used [-Wunused-function]
      32 | static void rh_add_flag(const char *flag_name) { }
         |             ^~~~~~~~~~~
>> include/linux/rh_flags.h:31:13: warning: 'rh_print_flags' defined but not used [-Wunused-function]
      31 | static void rh_print_flags(void) { }
         |             ^~~~~~~~~~~~~~


vim +/rh_add_flag +32 include/linux/rh_flags.h

    20	
    21	#define rh_add_flag(flag_name)						\
    22	({									\
    23		static bool __mark_once __read_mostly;				\
    24		bool __ret_mark_once = !__mark_once;				\
    25										\
    26		if (!__mark_once)						\
    27			__mark_once = __rh_add_flag(flag_name);			\
    28		unlikely(__ret_mark_once);					\
    29	})
    30	#else
  > 31	static void rh_print_flags(void) { }
  > 32	static void rh_add_flag(const char *flag_name) { }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
