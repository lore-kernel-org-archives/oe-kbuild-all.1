Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A114E1EB25
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728313501; cv=none; b=on0Ay6tQusXH+n5VVroCSgRWc7BZJhLG/rpowX0Hnm6PbfDbGAMLkJ0Sl1N6rZs3/kjzBsaWPPzfy6w/RbDA5plu/Ab1//DodGxi95tX8mHWqS2J24norcQwBrsNMG6sD9Jy8SZUNrDaXQ0PwUyPm+aRBQI9Y977LqrSOK8aSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728313501; c=relaxed/simple;
	bh=nF/Urj56JxKNwEUBoEMdWdBXzkSpDeslMznmwwpA6NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD86xhUR2tY/YdhmVmWHOKJt0YmXih0Rqzcc2yu0mzwoEsJ7diRtAzGrBlwQiG7hhNPdP0on0+ChIYUnioCh9TA0rf/aVKHPn+Mz5YwAlbrn15zwY8roAyTIiS4D1wJIXz6Wla2mU692s4b+l1Ze9r9RDmb/uU3vpgc7IOS5/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQTJ8CtW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQTJ8CtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728313499; x=1759849499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nF/Urj56JxKNwEUBoEMdWdBXzkSpDeslMznmwwpA6NY=;
  b=KQTJ8CtW/pbAgq3m/cELpKRLhfuqpgJSzWFGEqMkrW8Notf3agQPPpT9
   /zETmxLu6Jm7L0Fx5vabNVdOIjEInkatxfDQbYLDdrO3FPzyNbbD9Azr9
   hHjmsV6vlYjhxSF2kQxY/uV4ovZ8hWdrSrfgg5X84OaofITAHcAI7mNDt
   mOREDBgSrZ7Py7Jsokq85NoukUtwT6ybOa71gm0JrwC/12sec9KHNrcO3
   peZLaEGXprLpsW9OCYVoRN3RYH6dFRq/PZbIGOeVDO/lBvMjdWbOulO+P
   Y7iAxwEtYjJdQ5w8Aa2Lr33aEW4BObEYs3pESLtBN0w+hyRh+/70nQWEW
   A==;
X-CSE-ConnectionGUID: arwlb93LTuqNaIZWFn3PcQ==
X-CSE-MsgGUID: 9bc1ZJNUTO652wIVFj0kig==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27278114"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27278114"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 08:04:59 -0700
X-CSE-ConnectionGUID: JJUP96nqSv2o9qDNzvzcxQ==
X-CSE-MsgGUID: C4Ev2dMRQFqW3gfmRjrEhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="112966171"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Oct 2024 08:04:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxpI6-00058m-35;
	Mon, 07 Oct 2024 15:04:54 +0000
Date: Mon, 7 Oct 2024 23:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Fontenot <nathan.fontenot@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] cxl: Update Soft Reserved resources upon region creation
Message-ID: <202410072217.TJBadKhH-lkp@intel.com>
References: <20241004181754.8960-1-nathan.fontenot@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004181754.8960-1-nathan.fontenot@amd.com>

Hi Nathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Fontenot/cxl-Update-Soft-Reserved-resources-upon-region-creation/20241005-021920
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20241004181754.8960-1-nathan.fontenot%40amd.com
patch subject: [RFC] cxl: Update Soft Reserved resources upon region creation
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20241007/202410072217.TJBadKhH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072217.TJBadKhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410072217.TJBadKhH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1242:17: note: in expansion of macro 'pr_err'
    1242 |                 pr_err("CXL DEBUG Couldn't add Soft Reserved %llx (%llx)\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1242:17: note: in expansion of macro 'pr_err'
    1242 |                 pr_err("CXL DEBUG Couldn't add Soft Reserved %llx (%llx)\n",
         |                 ^~~~~~
   arch/x86/kernel/e820.c: In function 'e820__trim_soft_reserve':
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1274:17: note: in expansion of macro 'pr_err'
    1274 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1274:17: note: in expansion of macro 'pr_err'
    1274 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1285:17: note: in expansion of macro 'pr_err'
    1285 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n", res,
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1285:17: note: in expansion of macro 'pr_err'
    1285 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n", res,
         |                 ^~~~~~
   arch/x86/kernel/e820.c: At top level:
>> arch/x86/kernel/e820.c:1311:42: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
    1311 | static int __init e820_parse_cfmws(union acpi_subtable_headers *hdr, void *arg,
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/e820.c: In function 'e820_parse_cfmws':
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1331:17: note: in expansion of macro 'pr_err'
    1331 |                 pr_err("CXL DEBUG Found SOFT RESERVE intersection %llx - %llx : %llx - %llx\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1331:17: note: in expansion of macro 'pr_err'
    1331 |                 pr_err("CXL DEBUG Found SOFT RESERVE intersection %llx - %llx : %llx - %llx\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1331:17: note: in expansion of macro 'pr_err'
    1331 |                 pr_err("CXL DEBUG Found SOFT RESERVE intersection %llx - %llx : %llx - %llx\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1331:17: note: in expansion of macro 'pr_err'
    1331 |                 pr_err("CXL DEBUG Found SOFT RESERVE intersection %llx - %llx : %llx - %llx\n",
         |                 ^~~~~~
   arch/x86/kernel/e820.c: In function 'e820__reserve_resources_late':
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1358:17: note: in expansion of macro 'pr_err'
    1358 |                 pr_err("CXL DEBUG Checking e820 iomem resource %llx - %llx\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1358:17: note: in expansion of macro 'pr_err'
    1358 |                 pr_err("CXL DEBUG Checking e820 iomem resource %llx - %llx\n",
         |                 ^~~~~~
>> arch/x86/kernel/e820.c:1361:30: error: implicit declaration of function 'acpi_table_parse_cedt'; did you mean 'acpi_table_parse'? [-Werror=implicit-function-declaration]
    1361 |                         rc = acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS,
         |                              ^~~~~~~~~~~~~~~~~~~~~
         |                              acpi_table_parse
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1368:17: note: in expansion of macro 'pr_err'
    1368 |                 pr_err("CXL DEBUG Inserting %llx - %llx\n", res->start, res->end);
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kernel/e820.c:1368:17: note: in expansion of macro 'pr_err'
    1368 |                 pr_err("CXL DEBUG Inserting %llx - %llx\n", res->start, res->end);
         |                 ^~~~~~
   cc1: some warnings being treated as errors


vim +1361 arch/x86/kernel/e820.c

  1252	
  1253	static void e820__trim_soft_reserve(struct resource *res,
  1254					    const struct resource *cxl_res)
  1255	{
  1256		resource_size_t new_start, new_end;
  1257		int rc;
  1258	
  1259		pr_err("CXL DEBUG Trimming Soft Reserves for %pr\n", cxl_res);
  1260	
  1261		if (res->start == cxl_res->start && res->end == cxl_res->end) {
  1262			pr_err("CXL DEBUG Releasing resource %pr\n", res);
  1263			release_resource(res);
  1264			kfree(res);
  1265		} else if (res->start == cxl_res->start || res->end == cxl_res->end) {
  1266			if (res->start == cxl_res->start) {
  1267				new_start = cxl_res->end + 1;
  1268				new_end = res->end;
  1269			} else {
  1270				new_start = res->start;
  1271				new_end = cxl_res->start - 1;
  1272			}
  1273	
  1274			pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n",
  1275			       res, new_start, new_end);
  1276			rc = adjust_resource(res, new_start, new_end - new_start + 1);
  1277			if (rc)
  1278				pr_debug("Cannot adjust soft reserved resource %pr\n",
  1279					 res);
  1280		} else {
  1281			new_start = res->start;
  1282			new_end = res->end;
  1283	
  1284			/*Adjust existing to beginning resource */
> 1285			pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n", res,
  1286			       new_start, cxl_res->start);
  1287			adjust_resource(res, new_start, cxl_res->start - new_start + 1);
  1288	
  1289			/* Add new resource for end piece */
  1290			e820__add_soft_reserve(cxl_res->end + 1, new_end - cxl_res->end,
  1291					       res->flags);
  1292		}
  1293	}
  1294	
  1295	void e820__trim_soft_reserves(const struct resource *cxl_res)
  1296	{
  1297		struct resource *res, *next;
  1298	
  1299		pr_err("CXL DEBUG Trimming Soft Reserves\n");
  1300		for (res = e820_sr_res.child; res; res = next) {
  1301			next = res->sibling;
  1302	
  1303			if (resource_contains(res, cxl_res)) {
  1304				e820__trim_soft_reserve(res, cxl_res);
  1305				break;
  1306			}
  1307		}
  1308	}
  1309	EXPORT_SYMBOL_GPL(e820__trim_soft_reserves);
  1310	
> 1311	static int __init e820_parse_cfmws(union acpi_subtable_headers *hdr, void *arg,
  1312					   const unsigned long unused)
  1313	{
  1314		struct acpi_cedt_cfmws *cfmws;
  1315		struct resource *res = arg;
  1316		struct resource cfmws_res;
  1317	
  1318		/* Validation check, remove when finished debugging */
  1319		if (!res->parent && res->end)
  1320			pr_err("CXL DEBUG Should insert %pr\n", res);
  1321	
  1322		if (res->parent || !res->end)
  1323			return 0;
  1324	
  1325		cfmws = (struct acpi_cedt_cfmws *)hdr;
  1326		cfmws_res = DEFINE_RES_MEM(cfmws->base_hpa,
  1327					   cfmws->base_hpa + cfmws->window_size);
  1328		pr_err("CXL DEBUG Found CFMWS: %pr\n", &cfmws_res);
  1329	
  1330		if (resource_overlaps(&cfmws_res, res)) {
  1331			pr_err("CXL DEBUG Found SOFT RESERVE intersection %llx - %llx : %llx - %llx\n",
  1332			       res->start, res->end, cfmws_res.start, cfmws_res.end);
  1333			e820__add_soft_reserve(res->start, resource_size(res),
  1334					       res->flags);
  1335			return 1;
  1336		}
  1337	
  1338		return 0;
  1339	}
  1340	
  1341	void __init e820__reserve_resources_late(void)
  1342	{
  1343		int i, rc;
  1344		struct resource *res;
  1345	
  1346		/*
  1347		 * Prior to inserting SOFT_RESERVED resources we want to check for an
  1348		 * intersection with potential CXL resources. Any SOFT_RESERVED resources
  1349		 * that do intersect a potential CXL resource are set aside so they
  1350		 * can be trimmed to accommodate CXL resource intersections and added to
  1351		 * the iomem resource tree after the CXL drivers have completed their
  1352		 * device probe.
  1353		 */
  1354		pr_err("CXL DEBUG Checking e820 iomem resources\n");
  1355	
  1356		res = e820_res;
  1357		for (i = 0; i < e820_table->nr_entries; i++) {
> 1358			pr_err("CXL DEBUG Checking e820 iomem resource %llx - %llx\n",
  1359			       res->start, res->end);
  1360			if (res->desc == IORES_DESC_SOFT_RESERVED) {
> 1361				rc = acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS,
  1362							   e820_parse_cfmws, res);
  1363				if (rc) {
  1364					res++;
  1365					continue;
  1366				}
  1367			}
  1368			pr_err("CXL DEBUG Inserting %llx - %llx\n", res->start, res->end);
  1369			insert_resource_expand_to_fit(&iomem_resource, res);
  1370			res++;
  1371		}
  1372	
  1373		/*
  1374		 * Try to bump up RAM regions to reasonable boundaries, to
  1375		 * avoid stolen RAM:
  1376		 */
  1377		for (i = 0; i < e820_table->nr_entries; i++) {
  1378			struct e820_entry *entry = &e820_table->entries[i];
  1379			u64 start, end;
  1380	
  1381			if (entry->type != E820_TYPE_RAM)
  1382				continue;
  1383	
  1384			start = entry->addr + entry->size;
  1385			end = round_up(start, ram_alignment(start)) - 1;
  1386			if (end > MAX_RESOURCE_SIZE)
  1387				end = MAX_RESOURCE_SIZE;
  1388			if (start >= end)
  1389				continue;
  1390	
  1391			printk(KERN_DEBUG "e820: reserve RAM buffer [mem %#010llx-%#010llx]\n", start, end);
  1392			reserve_region_with_split(&iomem_resource, start, end, "RAM buffer");
  1393		}
  1394	}
  1395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
