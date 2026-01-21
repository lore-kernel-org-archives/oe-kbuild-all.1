Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0875038758A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 18:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769021640; cv=none; b=AX97UyTom6WgGRdMhC36Xlm7vn+xH/t+EiHHKbiwtbjGpDwatNf/mxblxOoW1Fq2dKZXb6EJrgiUEFUrAVsoxt2+X43/vJTLq0FFhjLi4BggaYVOsaLDY6bW5KXrNaWZ+IZZk3jRN/vIAAz6Abo9EZSfAe3bWEYJ3QPSOnN9mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769021640; c=relaxed/simple;
	bh=/fYUea/6uyuPg93kPfLFfQT80C0hMzO+u5v1AmhgPEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijivvIsBH+NmG28+9cZUzotF3o+bEdtbkl7alVrbhwlA409Tv1uZKy1ww+ZPyUPUjZdzX4YRHm30JxJrfieM04dc0/fKzJLA155xyHnR7xRMc1W3esVOMpyQVqrzLvuQhLYnSz9GNVYmQbJ5YqKgB37maLHdpCWRRm8ePBSwioM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDJiqwBJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDJiqwBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769021638; x=1800557638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/fYUea/6uyuPg93kPfLFfQT80C0hMzO+u5v1AmhgPEw=;
  b=QDJiqwBJnDyyAgyESYq1r2JXWD+NHVunXbv8r1GwwaAynqcaDdTOAaUU
   oJNHjIby5+L8l6zh9Y6z93LYGn9+n+yJa0pEU9c/EYcDIqhG1H85/nZRl
   Q9QWn3r/Bx8LEF7AzjufKDZR6H1yor615aoYgFQxGhK3QFz0kwM97yRIY
   c26i5pIH0k+KPAjTMZWPXRO+zy4lAFItfsTfdFE8Faf7g9VDCf4MXnr59
   QcKwCqNLaZhPfZY8v8HJ669imBlkWSMyGvVC1qrq4oXUJgCqai7fXHowD
   LcxiSvY0Kl8TmNCFZ3MwlNYuqAj5REb+XS9yw+UwkJYfBwOHX85JjGs+6
   w==;
X-CSE-ConnectionGUID: zWNd296sSyC6Ccg5JAdZHg==
X-CSE-MsgGUID: H0O3jOmeRmqkVtQf/hEISg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="95734097"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="95734097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:53:57 -0800
X-CSE-ConnectionGUID: 9JoZk+MSSo+0R1vaJzGirg==
X-CSE-MsgGUID: Oi6ZmijvSdCfRmYnSDguXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206771025"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jan 2026 10:53:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vidKz-00000000RbR-0sjS;
	Wed, 21 Jan 2026 18:53:53 +0000
Date: Thu, 22 Jan 2026 02:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jean Delvare <jdelvare@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [PATCH v4 6/6] x86/CPU/AMD: Print AGESA string from DMI
 additional information entry
Message-ID: <202601220139.ymxKIu3a-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v6.19-rc6 next-20260120]
[cannot apply to jdelvare-staging/dmi-for-next bp/for-next tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello-AMD/firmware-dmi-Correct-an-indexing-error-in-dmi-h/20260121-140800
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260121060431.432350-7-superm1%40kernel.org
patch subject: [PATCH v4 6/6] x86/CPU/AMD: Print AGESA string from DMI additional information entry
config: i386-buildonly-randconfig-003-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220139.ymxKIu3a-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220139.ymxKIu3a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220139.ymxKIu3a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/amd.c:6:
   include/linux/dmi.h: In function 'dmi_string_nosave':
   include/linux/dmi.h:173:71: error: 'dmi_empty_string' undeclared (first use in this function)
     173 |         dmi_string_nosave(const struct dmi_header *dm, u8 s) { return dmi_empty_string; }
         |                                                                       ^~~~~~~~~~~~~~~~
   include/linux/dmi.h:173:71: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/dmi.h:173:89: warning: control reaches end of non-void function [-Wreturn-type]
     173 |         dmi_string_nosave(const struct dmi_header *dm, u8 s) { return dmi_empty_string; }
         |                                                                                         ^


vim +173 include/linux/dmi.h

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
