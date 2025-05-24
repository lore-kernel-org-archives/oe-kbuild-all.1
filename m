Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930427A933
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748115515; cv=none; b=Lscq3PqcXfBnabhkfN6CIKNvgv1glp2p9Diy44zP+1gvCJXtGxFby+ocnhUJe9In224FS6xApx5QaFQb49ikYGgMMAti+EU3bLhXhRMl0dIdXpamZJjFF/+ibo07myPP8aewBLf4mKj204B/Ebp+ob8ZZgHZthEZF0dcUHKUkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748115515; c=relaxed/simple;
	bh=SBixqu5RzSc/v5CYvUQLlehQIVlTh7K+PiZHsEzggTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMHmaGoNpguzSd4RWPYjyUMYJDBszJDQhhxtAaLfvhU/v3q01Wp3OpXh3xaPptLbCQG8Rh850OTe9f7HZsYNcgUTZBJqkNaubmbnSMY1pNrqqFd6PmK3EneotSnakXFNtN05/C3E1Z2+glJZ3FR9c0KWqeozxyQsDfMbrpBw5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJucEOpw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJucEOpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748115514; x=1779651514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SBixqu5RzSc/v5CYvUQLlehQIVlTh7K+PiZHsEzggTM=;
  b=bJucEOpwl/at13hxuBI/W7xcvrJGigSogdnVWv6kINDlx8qXDZQqUURL
   gTNr1swsfLIxCsHIS0uPYRDLsXnDpH+lY1QYUEYLven1X9FrhKv3ZxhAT
   iNEbZUmQtiRmkuY0VRRavPW8t/NuR7aeHuonUezlNL7GlIiiBFd8lg6qc
   hMrnRwhnHswMK2GwXsLwsU7JzCflBnqKZKmeUaU8429aXjW9VicCE0OKT
   WbeMxEjDGsv2cPgolTaukdW9QEOxuu+iGzjiy+aUr0BsEoGrG5EczglSG
   +wpJwC0h8WdlVYS4jAtzBcBfZH/R+3vGlZi5v32lpa8HrKWXg7ozSYcwX
   A==;
X-CSE-ConnectionGUID: TnI5fej5S764EU2bdlhWGg==
X-CSE-MsgGUID: f2qj4umRTdiA8vGKtkJ4xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="60394874"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="60394874"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 12:38:31 -0700
X-CSE-ConnectionGUID: fdlzOKBVSmi/dD6cVOD62A==
X-CSE-MsgGUID: xiAwSJCWRBuH9rtvjf3yZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="145599404"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2025 12:38:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIuhP-000RQe-0s;
	Sat, 24 May 2025 19:38:27 +0000
Date: Sun, 25 May 2025 03:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Aron Silverton <aron.silverton@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Qing Huang <qing.huang@oracle.com>,
	Sharath Srinivasan <sharath.srinivasan@oracle.com>,
	Mark Haywood <mark.haywood@oracle.com>
Subject: [jlayton:uek-localio 1992/2262] include/linux/kern_levels.h:5:25:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 5 has type 'unsigned int'
Message-ID: <202505250351.6OveeJbb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: a45cb1526ebd3fc9c0438d4885c26291743b49e5 [1992/2262] mstflint_access: Enable the mstflint_access module
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250525/202505250351.6OveeJbb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250351.6OveeJbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250351.6OveeJbb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:36:
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c: In function 'print_opcode':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:751:9: note: in expansion of macro 'mst_info'
     751 |         mst_info("MST_PARAMS=%lx\n", MST_PARAMS);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:753:9: note: in expansion of macro 'mst_info'
     753 |         mst_info("PCICONF_READ4=%lx\n", PCICONF_READ4);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:754:9: note: in expansion of macro 'mst_info'
     754 |         mst_info("PCICONF_WRITE4=%lx\n", PCICONF_WRITE4);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:755:9: note: in expansion of macro 'mst_info'
     755 |         mst_info("PCIMEM_READ4=%lx\n", PCIMEM_READ4);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:756:9: note: in expansion of macro 'mst_info'
     756 |         mst_info("PCIMEM_WRITE4=%lx\n", PCIMEM_WRITE4);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:758:9: note: in expansion of macro 'mst_info'
     758 |         mst_info("PCIMEM_READ_BLOCK=%lx\n", PCIMEM_READ_BLOCK);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:759:9: note: in expansion of macro 'mst_info'
     759 |         mst_info("PCIMEM_WRITE_BLOCK=%lx\n", PCIMEM_WRITE_BLOCK);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:761:9: note: in expansion of macro 'mst_info'
     761 |         mst_info("PCICONF_INIT=%lx\n", PCICONF_INIT);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:764:9: note: in expansion of macro 'mst_info'
     764 |         mst_info("PCIMEM_INIT=%lx\n", PCIMEM_INIT);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:767:9: note: in expansion of macro 'mst_info'
     767 |         mst_info("PCI_CONNECTX_WA=%lx\n", PCI_CONNECTX_WA);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:769:9: note: in expansion of macro 'mst_info'
     769 |         mst_info("PCICONF_VPD_READ4=%lx\n", PCICONF_VPD_READ4);
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_kernel.h:49:9: note: in expansion of macro 'pr_info'
      49 |         pr_info("%s: %s %d: " format, MST_PREFIX, __func__, __LINE__, ## arg)
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mstflint_access/mst_main.c:770:9: note: in expansion of macro 'mst_info'
     770 |         mst_info("PCICONF_VPD_WRITE4=%lx\n", PCICONF_VPD_WRITE4);
         |         ^~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
