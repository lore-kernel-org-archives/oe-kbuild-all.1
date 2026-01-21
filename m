Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9883D3D14
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995099; cv=none; b=jHVnffV6+3iyqdh7twllxltd3w3LsIvGzWVLk8DgtLo1C3C4bS2nni6w4tjcQfJqRbvImjJOrWZfRVh9y+73LbeG9an7sG5AKw1NP00PlpyI6P5rYzi7PhdjKe+F+O93cf3JpqHlbqB9uhM2JwBPMLmpi9MuwefTxpWu5QUjuJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995099; c=relaxed/simple;
	bh=0r9pEhB4ZvwhM/YaYay49XDR+nSQmJDC21MiAl0tknQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/9+0uhQQqJsN4dmeTqNAieoke9BKDO6VZ323DmTE/xjGafeu1fD4JXan3NiKF5yG1hdC/cxEIAyzHmfAQrb5/ScnVqJYFvuVDFb7M/d7gKFcVhnbIZKUOW03CMZ8d7xHB0nAsFWbuTbWxgTfhqm546VdxtPTzJe8qY1RTf+EsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW/HJuga; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW/HJuga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768995098; x=1800531098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0r9pEhB4ZvwhM/YaYay49XDR+nSQmJDC21MiAl0tknQ=;
  b=JW/HJugafPwGwbAHVCKOiut1ROUDu/zJm4guMSYbxdOfePGEjC0wEMXf
   oEKOcJmaGsq0kjDaaM6Kmrr0R0dvTajUjeb5Any28GTqTeD6v6jeD7H+O
   VhPBecOshV/x9ptWKnaIqr0FbK85bFGcVGEm9KhXmulTGUSD5GdOZsfzG
   LdlRFTesWyLa7fTwjm8AL8yGmj16dZZCtXAG31Y1CVaMStFftqLsxnWT9
   sOk9BeuZprXNHpbfGtqnxZY1w68hXuNSN5uzCLfaqkLHUeu20eymnNqvF
   1TqkIOX4BVSMhIR7CkkkLTMedSZLLy61WAiLbOJ/AX1eKCaixHONL6yFg
   g==;
X-CSE-ConnectionGUID: HPT/qhjuSqamIVGK2wttMw==
X-CSE-MsgGUID: hIOlhojzTVW6NyC7+yuQAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92887961"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="92887961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 03:31:35 -0800
X-CSE-ConnectionGUID: Sj0ZP2z8TlanbBD4QENQxg==
X-CSE-MsgGUID: 8JDd0r9cSV68Nwcaqbnwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206343787"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:31:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viWQs-00000000RC5-1qis;
	Wed, 21 Jan 2026 11:31:30 +0000
Date: Wed, 21 Jan 2026 19:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jean Delvare <jdelvare@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [PATCH v4 6/6] x86/CPU/AMD: Print AGESA string from DMI
 additional information entry
Message-ID: <202601211912.0hwXBwKQ-lkp@intel.com>
References: <20260121060431.432350-7-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121060431.432350-7-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.19-rc6 next-20260120]
[cannot apply to jdelvare-staging/dmi-for-next bp/for-next tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello-AMD/firmware-dmi-Correct-an-indexing-error-in-dmi-h/20260121-140800
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260121060431.432350-7-superm1%40kernel.org
patch subject: [PATCH v4 6/6] x86/CPU/AMD: Print AGESA string from DMI additional information entry
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20260121/202601211912.0hwXBwKQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211912.0hwXBwKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211912.0hwXBwKQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:14:
   include/linux/dmi.h: In function 'dmi_string_nosave':
>> include/linux/dmi.h:173:71: error: 'dmi_empty_string' undeclared (first use in this function)
     173 |         dmi_string_nosave(const struct dmi_header *dm, u8 s) { return dmi_empty_string; }
         |                                                                       ^~~~~~~~~~~~~~~~
   include/linux/dmi.h:173:71: note: each undeclared identifier is reported only once for each function it appears in


vim +/dmi_empty_string +173 include/linux/dmi.h

   141	
   142	static inline int dmi_check_system(const struct dmi_system_id *list) { return 0; }
   143	static inline const char * dmi_get_system_info(int field) { return NULL; }
   144	static inline const struct dmi_device * dmi_find_device(int type, const char *name,
   145		const struct dmi_device *from) { return NULL; }
   146	static inline void dmi_setup(void) { }
   147	static inline bool dmi_get_date(int field, int *yearp, int *monthp, int *dayp)
   148	{
   149		if (yearp)
   150			*yearp = 0;
   151		if (monthp)
   152			*monthp = 0;
   153		if (dayp)
   154			*dayp = 0;
   155		return false;
   156	}
   157	static inline int dmi_get_bios_year(void) { return -ENXIO; }
   158	static inline int dmi_name_in_vendors(const char *s) { return 0; }
   159	static inline int dmi_name_in_serial(const char *s) { return 0; }
   160	#define dmi_available 0
   161	static inline int dmi_walk(void (*decode)(const struct dmi_header *, void *),
   162		void *private_data) { return -ENXIO; }
   163	static inline bool dmi_match(enum dmi_field f, const char *str)
   164		{ return false; }
   165	static inline void dmi_memdev_name(u16 handle, const char **bank,
   166			const char **device) { }
   167	static inline u64 dmi_memdev_size(u16 handle) { return ~0ul; }
   168	static inline u8 dmi_memdev_type(u16 handle) { return 0x0; }
   169	static inline u16 dmi_memdev_handle(int slot) { return 0xffff; }
   170	static inline const struct dmi_system_id *
   171		dmi_first_match(const struct dmi_system_id *list) { return NULL; }
   172	static inline const char *
 > 173		dmi_string_nosave(const struct dmi_header *dm, u8 s) { return dmi_empty_string; }
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
