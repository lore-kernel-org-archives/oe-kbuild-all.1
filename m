Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB6208239
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730237435; cv=none; b=U4QjC1s0UE5h8SK06MAvzBXNheyWrI+cRtcBF6xZKh6QGY2z12CD9zaHmWjeP72WkBD7CVTJaqzyL5d56G8vPDVIhRRLBv/YM59+77SB4pVH5HmK4Cudz6cGO8oGo8ezO87tazGW4VZajiX9jLPmidyZezUfkqipkjFL1fDkd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730237435; c=relaxed/simple;
	bh=Xdi2ioy8htzNIodl5tBHnXz9IuyT1cZ6oE4KWmErTNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxd3YITUg+HG1Yvmo/gnKvZFZOyWcy9aUP1B+kyddhYlMACdsGgfIJoeKqP3zCchSXjIFR145TgqTnsIzQ/wVuVrDrRPmeH4OxpsLFCGoJYtb9c5hlIXLtA8hcoHImmnA1I7k/Xl6hh5M6n8N1hY4nAZReW5Zm3e1G/sho1vzHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASBtTnJq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASBtTnJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730237432; x=1761773432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdi2ioy8htzNIodl5tBHnXz9IuyT1cZ6oE4KWmErTNo=;
  b=ASBtTnJqNw8ws1SNQtrjxHlK2oft0PK1uim9GGPCFt9KGLv245B8A6G5
   SL6bNe3WGfmxmXe9jRNlvhx2HmISxFJL8gU9x6qTYL78BcJm6ICsc4lm+
   LF4yMYmO56aJHrStMVSpCxZ3OZ0FFbtE1UziyGFWYjeavLQjLhB4fJg1n
   xiPXAkYR/KLT7mXP24WbV5WgZTEOTzn14ip4AtCJF7DR97fa6K7z7AWO4
   5c4V90/gMv7l4N9+QVlXfPtZfq5keNa8UZ2Agzg/9ti4lS7HwGXnBkc/w
   TQnGtlIv9+qdn1jqsHvCM8O1Br9ReUTzWGSckytcs7kR5A7ZGsJolFSO5
   w==;
X-CSE-ConnectionGUID: c0+GB+SjSY+w8txm70/1ZA==
X-CSE-MsgGUID: Fo/Zz/XsQEy16QWl1quCnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29358479"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="29358479"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 14:30:32 -0700
X-CSE-ConnectionGUID: vL8fsOlZQJCb8cVezYBlng==
X-CSE-MsgGUID: Zc9wCfNKQ3CxHP4wpMMi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="86862703"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Oct 2024 14:30:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5tnI-000eAe-0B;
	Tue, 29 Oct 2024 21:30:28 +0000
Date: Wed, 30 Oct 2024 05:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4d 77/82] lib/dynamic_debug.c:1420:13: warning:
 'ddebug_clear_range' defined but not used
Message-ID: <202410300507.PWcBsqXP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4d
head:   98a15f4b1948cdaabac1f0fc008c79870c4d4672
commit: 258c09446f7441ccdbdeb1f9c32d97bd27064d25 [77/82] dyndbg: ddebug_clear_range - prune module's site info on rmmod
config: x86_64-buildonly-randconfig-003-20241030 (https://download.01.org/0day-ci/archive/20241030/202410300507.PWcBsqXP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300507.PWcBsqXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300507.PWcBsqXP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_mt_scan':
   lib/dynamic_debug.c:94:9: error: implicit declaration of function 'mt_dump'; did you mean 'xa_dump'? [-Werror=implicit-function-declaration]
      94 |         mt_dump(mt, mt_dump_hex);
         |         ^~~~~~~
         |         xa_dump
   lib/dynamic_debug.c:94:21: error: 'mt_dump_hex' undeclared (first use in this function)
      94 |         mt_dump(mt, mt_dump_hex);
         |                     ^~~~~~~~~~~
   lib/dynamic_debug.c:94:21: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:1480:12: warning: 'ddebug_remove_module' used but never defined
    1480 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:1420:13: warning: 'ddebug_clear_range' defined but not used [-Wunused-function]
    1420 | static void ddebug_clear_range(const struct _ddebug *_start, const int len)
         |             ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ddebug_clear_range +1420 lib/dynamic_debug.c

  1419	
> 1420	static void ddebug_clear_range(const struct _ddebug *_start, const int len)
  1421	{
  1422		void *ret;
  1423		unsigned long start = (unsigned long) _start;
  1424		MA_STATE(file_mas, &mt_files, start, start);
  1425		MA_STATE(func_mas, &mt_funcs, start, start);
  1426	
  1427		v2pr_info("clearing %3d debugs %px\n", len, _start);
  1428		ret = mtree_erase(&mt_mods, start);
  1429		v2pr_info("mods:  %px %s\n", ret, (char*)ret);
  1430	
  1431		mas_lock(&file_mas);
  1432		for (; mas_erase(&file_mas); file_mas.index = file_mas.last + 1)
  1433			;
  1434		mas_unlock(&file_mas);
  1435	
  1436		mas_lock(&func_mas);
  1437		for (; mas_erase(&func_mas); func_mas.index = func_mas.last + 1)
  1438			;
  1439		mas_unlock(&func_mas);
  1440	}
  1441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
