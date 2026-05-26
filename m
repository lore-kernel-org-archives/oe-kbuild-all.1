Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94A34B1A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792444; cv=none; b=ZpoyKcvTRgrcBYi5Euf5Lhwf9qdKahUmxKz3DrlXi4tQNb1gP68tLy4SIjQ8t2aHmSlEyPuG8s9Bm1pSBeqQsmpS/yD/bJw2BhFse1uqit+AOO/2Ucw5bKUUSBreytbq2JO3YbtdWRZqb9jIcSb/YYr7FCYnCj17aw4bg7VgZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792444; c=relaxed/simple;
	bh=me9jSoMsrjaTqBF8D5KqnqM07rIMqRLppp7yoR9hmSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mBDHN00Pv3oqotPXzNVYZ7YQxN1MouSyPm/ZfazZEQJGocSNHM4OrJhxUdz/3JObAdez5KsAPuteotZ0agY0Dy2Oqh0MjBpwgGlqKUJwzw15VvpIx1IbyBLbSZAfWM4HeY7uZj5gBKOUpVUKOD4esYP8UKFiwm5YgmcZESGC31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2gl9J/W; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2gl9J/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779792443; x=1811328443;
  h=date:from:to:cc:subject:message-id;
  bh=me9jSoMsrjaTqBF8D5KqnqM07rIMqRLppp7yoR9hmSk=;
  b=I2gl9J/WIKEbkBqwl8alzL2g5EDvyBth6zO6iSQSUJjHBgXGkc80AF1P
   HZab+Z5UFm6IOAVCCPvpE3NmhoQ/28zFsqXkKVYjibmGe2fUzjTBilxBs
   8DckW/a+w0+K+/Bm+SY4uoEGS3lXSqcDjgmDZHkCg+LrlSHY8uu/B2/oQ
   3oogWe+p/MRXeYDPkc2/Mlx1d5jW2Y/6o2qCzAbx6S15oRhKpyp1Q4fSM
   jTUx2v2mHFnNt0nDt5a8cW4A5VWxKawv+3D+JVpMgx2P/TbCgvsFHJsxh
   s4NTJe0K4owSDH3DiUM7iQARumueu1yYY7Ue0TACJAsTytqLilrRhFWJh
   g==;
X-CSE-ConnectionGUID: dqFMUIktQd2ZkGQk8aZ8zw==
X-CSE-MsgGUID: 9QJsOdKkQe2q3x+GffZYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98025969"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="98025969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:47:22 -0700
X-CSE-ConnectionGUID: H03l/Q0yRtiTvCC0MCbT5w==
X-CSE-MsgGUID: 4+FQgC54RjKR22yE6jdb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="243713846"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2026 03:47:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRpJd-000000002MU-1EHz;
	Tue, 26 May 2026 10:47:17 +0000
Date: Tue, 26 May 2026 18:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/acpi/x86/s2idle.c:165:51: warning: '%s' directive
 argument is null
Message-ID: <202605261839.UwogX950-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ye,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7
commit: 6c2e6e2c1af1809d1d9cdbd50ac80f54f5995bdb dynamic_debug: add support for print stack
date:   7 months ago
config: x86_64-randconfig-007-20250922 (https://download.01.org/0day-ci/archive/20260526/202605261839.UwogX950-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261839.UwogX950-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2e6e2c1af1 ("dynamic_debug: add support for print stack")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261839.UwogX950-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:13,
                    from drivers/acpi/x86/s2idle.c:18:
   drivers/acpi/x86/s2idle.c: In function 'lpi_device_get_constraints_amd':
>> drivers/acpi/x86/s2idle.c:165:51: warning: '%s' directive argument is null [-Wformat-overflow=]
     165 |                                                   "Name:%s, Enabled: %d, States: %d, MinDstate: %d\n",
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:402:21: note: in definition of macro 'pr_fmt'
     402 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:259:9: note: in expansion of macro '__dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1268:9: note: in expansion of macro '_dynamic_func_call'
    1268 |         _dynamic_func_call(fmt, __acpi_handle_debug,                    \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/acpi/x86/s2idle.c:164:33: note: in expansion of macro 'acpi_handle_debug'
     164 |                                 acpi_handle_debug(lps0_device_handle,
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/acpi/x86/s2idle.c:165:57: note: format string is defined here
     165 |                                                   "Name:%s, Enabled: %d, States: %d, MinDstate: %d\n",
         |                                                         ^~


vim +165 drivers/acpi/x86/s2idle.c

fef98671194be0 Rafael J. Wysocki  2020-12-17   96  
41233988112f0f Andy Shevchenko    2023-08-18   97  #define for_each_lpi_constraint(entry)						\
41233988112f0f Andy Shevchenko    2023-08-18   98  	for (int i = 0;								\
41233988112f0f Andy Shevchenko    2023-08-18   99  	     entry = &lpi_constraints_table[i], i < lpi_constraints_table_size;	\
41233988112f0f Andy Shevchenko    2023-08-18  100  	     i++)
41233988112f0f Andy Shevchenko    2023-08-18  101  
fef98671194be0 Rafael J. Wysocki  2020-12-17  102  static void lpi_device_get_constraints_amd(void)
fef98671194be0 Rafael J. Wysocki  2020-12-17  103  {
fef98671194be0 Rafael J. Wysocki  2020-12-17  104  	union acpi_object *out_obj;
fef98671194be0 Rafael J. Wysocki  2020-12-17  105  	int i, j, k;
fef98671194be0 Rafael J. Wysocki  2020-12-17  106  
fef98671194be0 Rafael J. Wysocki  2020-12-17  107  	out_obj = acpi_evaluate_dsm_typed(lps0_device_handle, &lps0_dsm_guid,
904d4a6c074b9d Pratik Vishwakarma 2021-06-17  108  					  rev_id, ACPI_LPS0_GET_DEVICE_CONSTRAINTS,
fef98671194be0 Rafael J. Wysocki  2020-12-17  109  					  NULL, ACPI_TYPE_PACKAGE);
fef98671194be0 Rafael J. Wysocki  2020-12-17  110  
fef98671194be0 Rafael J. Wysocki  2020-12-17  111  	acpi_handle_debug(lps0_device_handle, "_DSM function 1 eval %s\n",
fef98671194be0 Rafael J. Wysocki  2020-12-17  112  			  out_obj ? "successful" : "failed");
fef98671194be0 Rafael J. Wysocki  2020-12-17  113  
4a012dc82d504f Pratik Vishwakarma 2021-06-17  114  	if (!out_obj)
4a012dc82d504f Pratik Vishwakarma 2021-06-17  115  		return;
4a012dc82d504f Pratik Vishwakarma 2021-06-17  116  
fef98671194be0 Rafael J. Wysocki  2020-12-17  117  	for (i = 0; i < out_obj->package.count; i++) {
fef98671194be0 Rafael J. Wysocki  2020-12-17  118  		union acpi_object *package = &out_obj->package.elements[i];
fef98671194be0 Rafael J. Wysocki  2020-12-17  119  
aa7a1bb02bb443 Rafael J. Wysocki  2021-01-05  120  		if (package->type == ACPI_TYPE_PACKAGE) {
883cf0d4cf2883 Mario Limonciello  2023-08-18  121  			if (lpi_constraints_table) {
883cf0d4cf2883 Mario Limonciello  2023-08-18  122  				acpi_handle_err(lps0_device_handle,
883cf0d4cf2883 Mario Limonciello  2023-08-18  123  						"Duplicate constraints list\n");
883cf0d4cf2883 Mario Limonciello  2023-08-18  124  				goto free_acpi_buffer;
883cf0d4cf2883 Mario Limonciello  2023-08-18  125  			}
883cf0d4cf2883 Mario Limonciello  2023-08-18  126  
fef98671194be0 Rafael J. Wysocki  2020-12-17  127  			lpi_constraints_table = kcalloc(package->package.count,
fef98671194be0 Rafael J. Wysocki  2020-12-17  128  							sizeof(*lpi_constraints_table),
fef98671194be0 Rafael J. Wysocki  2020-12-17  129  							GFP_KERNEL);
fef98671194be0 Rafael J. Wysocki  2020-12-17  130  
fef98671194be0 Rafael J. Wysocki  2020-12-17  131  			if (!lpi_constraints_table)
fef98671194be0 Rafael J. Wysocki  2020-12-17  132  				goto free_acpi_buffer;
fef98671194be0 Rafael J. Wysocki  2020-12-17  133  
fef98671194be0 Rafael J. Wysocki  2020-12-17  134  			acpi_handle_debug(lps0_device_handle,
fef98671194be0 Rafael J. Wysocki  2020-12-17  135  					  "LPI: constraints list begin:\n");
fef98671194be0 Rafael J. Wysocki  2020-12-17  136  
3c6b1212d20bbb Mario Limonciello  2023-08-18  137  			for (j = 0; j < package->package.count; j++) {
fef98671194be0 Rafael J. Wysocki  2020-12-17  138  				union acpi_object *info_obj = &package->package.elements[j];
fef98671194be0 Rafael J. Wysocki  2020-12-17  139  				struct lpi_device_constraint_amd dev_info = {};
fef98671194be0 Rafael J. Wysocki  2020-12-17  140  				struct lpi_constraints *list;
fef98671194be0 Rafael J. Wysocki  2020-12-17  141  				acpi_status status;
fef98671194be0 Rafael J. Wysocki  2020-12-17  142  
9cc8cd086f05d9 Mario Limonciello  2023-08-18  143  				list = &lpi_constraints_table[lpi_constraints_table_size];
9cc8cd086f05d9 Mario Limonciello  2023-08-18  144  
3c6b1212d20bbb Mario Limonciello  2023-08-18  145  				for (k = 0; k < info_obj->package.count; k++) {
fef98671194be0 Rafael J. Wysocki  2020-12-17  146  					union acpi_object *obj = &info_obj->package.elements[k];
fef98671194be0 Rafael J. Wysocki  2020-12-17  147  
fef98671194be0 Rafael J. Wysocki  2020-12-17  148  					switch (k) {
fef98671194be0 Rafael J. Wysocki  2020-12-17  149  					case 0:
fef98671194be0 Rafael J. Wysocki  2020-12-17  150  						dev_info.enabled = obj->integer.value;
fef98671194be0 Rafael J. Wysocki  2020-12-17  151  						break;
fef98671194be0 Rafael J. Wysocki  2020-12-17  152  					case 1:
fef98671194be0 Rafael J. Wysocki  2020-12-17  153  						dev_info.name = obj->string.pointer;
fef98671194be0 Rafael J. Wysocki  2020-12-17  154  						break;
fef98671194be0 Rafael J. Wysocki  2020-12-17  155  					case 2:
fef98671194be0 Rafael J. Wysocki  2020-12-17  156  						dev_info.function_states = obj->integer.value;
fef98671194be0 Rafael J. Wysocki  2020-12-17  157  						break;
fef98671194be0 Rafael J. Wysocki  2020-12-17  158  					case 3:
fef98671194be0 Rafael J. Wysocki  2020-12-17  159  						dev_info.min_dstate = obj->integer.value;
fef98671194be0 Rafael J. Wysocki  2020-12-17  160  						break;
fef98671194be0 Rafael J. Wysocki  2020-12-17  161  					}
9cc8cd086f05d9 Mario Limonciello  2023-08-18  162  				}
fef98671194be0 Rafael J. Wysocki  2020-12-17  163  
a879058d01e2f6 Mario Limonciello  2023-08-18  164  				acpi_handle_debug(lps0_device_handle,
a879058d01e2f6 Mario Limonciello  2023-08-18 @165  						  "Name:%s, Enabled: %d, States: %d, MinDstate: %d\n",
a879058d01e2f6 Mario Limonciello  2023-08-18  166  						  dev_info.name,
a879058d01e2f6 Mario Limonciello  2023-08-18  167  						  dev_info.enabled,
a879058d01e2f6 Mario Limonciello  2023-08-18  168  						  dev_info.function_states,
a879058d01e2f6 Mario Limonciello  2023-08-18  169  						  dev_info.min_dstate);
a879058d01e2f6 Mario Limonciello  2023-08-18  170  
fef98671194be0 Rafael J. Wysocki  2020-12-17  171  				if (!dev_info.enabled || !dev_info.name ||
fef98671194be0 Rafael J. Wysocki  2020-12-17  172  				    !dev_info.min_dstate)
fef98671194be0 Rafael J. Wysocki  2020-12-17  173  					continue;
fef98671194be0 Rafael J. Wysocki  2020-12-17  174  
9cc8cd086f05d9 Mario Limonciello  2023-08-18  175  				status = acpi_get_handle(NULL, dev_info.name, &list->handle);
fef98671194be0 Rafael J. Wysocki  2020-12-17  176  				if (ACPI_FAILURE(status))
fef98671194be0 Rafael J. Wysocki  2020-12-17  177  					continue;
fef98671194be0 Rafael J. Wysocki  2020-12-17  178  
fef98671194be0 Rafael J. Wysocki  2020-12-17  179  				list->min_dstate = dev_info.min_dstate;
fef98671194be0 Rafael J. Wysocki  2020-12-17  180  
fef98671194be0 Rafael J. Wysocki  2020-12-17  181  				lpi_constraints_table_size++;
fef98671194be0 Rafael J. Wysocki  2020-12-17  182  			}
fef98671194be0 Rafael J. Wysocki  2020-12-17  183  		}
fef98671194be0 Rafael J. Wysocki  2020-12-17  184  	}
fef98671194be0 Rafael J. Wysocki  2020-12-17  185  
fef98671194be0 Rafael J. Wysocki  2020-12-17  186  	acpi_handle_debug(lps0_device_handle, "LPI: constraints list end\n");
fef98671194be0 Rafael J. Wysocki  2020-12-17  187  
fef98671194be0 Rafael J. Wysocki  2020-12-17  188  free_acpi_buffer:
fef98671194be0 Rafael J. Wysocki  2020-12-17  189  	ACPI_FREE(out_obj);
fef98671194be0 Rafael J. Wysocki  2020-12-17  190  }
fef98671194be0 Rafael J. Wysocki  2020-12-17  191  

:::::: The code at line 165 was first introduced by commit
:::::: a879058d01e2f6e324cc98ff2ffbe4f574c100a6 ACPI: x86: s2idle: Add more debugging for AMD constraints parsing

:::::: TO: Mario Limonciello <mario.limonciello@amd.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
