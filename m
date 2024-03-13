Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BA2E822
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710327228; cv=none; b=VaDDQ/6vbu/AlmDHoCTmf5AU8/uSzXCX1ifQwKsJvvuOYc0fwZV3UphRJQrx/mq87Epy6mZPeViSp9ptVSkAwNFKq8u3Jpn8mEx4O4jaY4aghH9g85QKjZBlp+Hj/lhB9egbVP9Cyv+X6aI0z2u+9mUnB16rNsUUBmcgGo5+QHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710327228; c=relaxed/simple;
	bh=wdo1XU5MJdoNFnrBpJVhyZhq1ICnAJvHlEoi8df+cb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gm1acWTtKbT/pqElGkX7/yXzA3GrbnM+cmLta+13VlkJcabB8YWyRh3kNsdEE1229DO1RudRBXggc448sn8kmoxSeW6JnRiGCqoKZd/4eWsL7sUTtUBJlt7E5GFCh/C9vBVF3zsTAQ2VFeur72NYPd+Wg29Uus18lh6rLep8tPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPN6X4VV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPN6X4VV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710327227; x=1741863227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wdo1XU5MJdoNFnrBpJVhyZhq1ICnAJvHlEoi8df+cb0=;
  b=FPN6X4VVKwcfTVDA1nO5Z2j5VPvAJdDrwqyEoZEJMnwTsPRsRb8tqHQM
   TJYt/8Z0qOLbqAX04TPHT4j8J2+WnU9YPJYX5TBRzzxZblzWrql13+Bcg
   UYAicIUqfaFxj9H5Wc0aWYckGTlxLaZAKmxxLoD2dHn6cNGWpoQuC87rH
   QNmTDYeEOxoT8+a/ZJDqM3JvZu2qOVQ+9eLm/foZltuQIUG4ThJGApm/c
   et7BqRiNyUMu3hzhhKaU2aJSf39ZVM8GKPHRcOOsuBRqJ5X4a6gV5Es8R
   P8nZz+ScdH2BpcUCNu1d8dA6zRveBOYB6k6Hw3jhR28AZpsXVAgU7n06+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8901382"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8901382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 03:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="49313071"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Mar 2024 03:53:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkMEx-000CHz-0C;
	Wed, 13 Mar 2024 10:53:43 +0000
Date: Wed, 13 Mar 2024 18:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16901/30000] mm/clear_freelist_page.c:141:50:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202403131805.usWE0GjN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   caa1ae20bcc64a80625a9449240580f5190ed3a0
commit: 426b9efea56f9b065151d165caab2ebd32906505 [16901/30000] mm: Add sysctl to clear free list pages
config: x86_64-randconfig-r121-20240313 (https://download.01.org/0day-ci/archive/20240313/202403131805.usWE0GjN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131805.usWE0GjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131805.usWE0GjN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/clear_freelist_page.c:141:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/clear_freelist_page.c:141:50: sparse:     expected void *
   mm/clear_freelist_page.c:141:50: sparse:     got void [noderef] __user *buffer
>> mm/clear_freelist_page.c:155:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/clear_freelist_page.c:155:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/clear_freelist_page.c:155:36: sparse:     got int ( * )( ... )

vim +141 mm/clear_freelist_page.c

   133	
   134	static int sysctl_clear_freelist_handler(struct ctl_table *table, int write,
   135			void __user *buffer, size_t *lenp, loff_t *ppos)
   136	{
   137		int ret;
   138		int val;
   139	
   140		table->data = &val;
 > 141		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   142	
   143		if (!ret && write)
   144			clear_freelist_pages();
   145	
   146		return ret;
   147	}
   148	
   149	static struct ctl_table clear_freelist_table[] = {
   150		{
   151			.procname   = "clear_freelist_pages",
   152			.data       = NULL,
   153			.maxlen     = sizeof(int),
   154			.mode       = 0200,
 > 155			.proc_handler   = &sysctl_clear_freelist_handler,
   156			.extra1     = SYSCTL_ONE,
   157			.extra2     = SYSCTL_ONE,
   158		},
   159		{ }
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
