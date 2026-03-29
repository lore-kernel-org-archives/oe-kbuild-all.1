Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986FE19A2A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 07:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768357; cv=none; b=qmozeGeOmHtYdKxeqTAldYdbHFzL0qewjJhePzA3Q4pjKVI3Wt9S9nJqZAUBtX8bOGpRC+Dp67cbeNaklJC02Jmh3ifczi5F4q3i7o6H/uT8gtQDFplOyAk1YLg2k4XMzMfdKV+b9oJM2e7gv9DNsPlbwD04rsxqjV2naUGonjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768357; c=relaxed/simple;
	bh=222N3yZc7l57S6b86csg8NsKTSFzJHiNy/SEUFMldsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q2zQpiUA8UYRCEfZgtyWgBLDCUKpkWXdt5NldSJ+cy5DWVqJqLJmfp03s0Gu07DW3MDFZ5gqLuHlofGlo9P3BdbUVIDeQQeURiUoxp5iDosKKSqj53C6qKzZG7Pxlsi56D2p4I7bfoVBTa6yOLIKttAyxI2AysJqY30julrTvqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fL8dkuh6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fL8dkuh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774768355; x=1806304355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=222N3yZc7l57S6b86csg8NsKTSFzJHiNy/SEUFMldsc=;
  b=fL8dkuh6GjRDq/ok3LKVZ5B4VDmdEO6GP4iYNn6J7NePUFBFUW1BwPah
   ahTHC2DJJBdZU7vHrVsTWDMyRyfh3eTEH6qWF/+vBP4IS4OYYS3EQzuXK
   p4rKsljn/BpHOc6wkSHYXDvE5TibZHOBXoq/qUAu0S3krCnGZ/KUbk1/K
   IB2QC4bMLRNFdUJdlfVtUs+HdX9GhH0ZtI0LemcxSGVbqjFbhYLu4znnN
   MzgxZWG60vIeG4yaT+ZR2KQ0FTCAVwxaJg9MN9D5NtetG3xEZKv2YSMCY
   ERrL1bo763CEAfub4JgCztJOMGai06ZjtvP67v/NfwwP3VJAUl1SD9RlC
   Q==;
X-CSE-ConnectionGUID: 7K0sAdTaRbKUO2u3GD7mKA==
X-CSE-MsgGUID: pjB7FHv1Q/CEA7zPX5Cgng==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79691746"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="79691746"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 00:12:35 -0700
X-CSE-ConnectionGUID: 3fhs/XkvRQijq+qMRVSuWQ==
X-CSE-MsgGUID: HqDIBv53QkiskDWWzsJorQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="256243570"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Mar 2026 00:12:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6kJz-00000000CBB-0hgv;
	Sun, 29 Mar 2026 07:12:31 +0000
Date: Sun, 29 Mar 2026 15:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 74/82] lib/dynamic_debug.c:1493:13:
 warning: 'ddebug_clear_range' defined but not used
Message-ID: <202603291542.tjCcRvDB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   f409704b5c87caf13b0b57711d45606be12d5572
commit: 36d5f5fb03554bcb2be5d68642ee6c165d8b83d4 [74/82] dyndbg: ddebug_clear_range - prune module's site info on rmmod
config: nios2-randconfig-002-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291542.tjCcRvDB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291542.tjCcRvDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291542.tjCcRvDB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:1571:12: warning: 'ddebug_remove_module' declared 'static' but never defined [-Wunused-function]
    1571 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:1493:13: warning: 'ddebug_clear_range' defined but not used [-Wunused-function]
    1493 | static void ddebug_clear_range(const struct _ddebug_info *di)
         |             ^~~~~~~~~~~~~~~~~~


vim +/ddebug_clear_range +1493 lib/dynamic_debug.c

  1492	
> 1493	static void ddebug_clear_range(const struct _ddebug_info *di)
  1494	{
  1495		unsigned long start = (unsigned long) di->descs.start;
  1496		unsigned long end = (unsigned long) &di->descs.start[di->descs.len - 1];
  1497	
  1498		MA_STATE(mod_mas, &dd_mod_map, start, end);
  1499		MA_STATE(file_mas, &dd_file_map, start, end);
  1500		MA_STATE(func_mas, &dd_func_map, start, end);
  1501	
  1502		v2pr_info("clearing %3d debugs of removed module %s\n",
  1503			  di->descs.len, di->mod_name);
  1504	
  1505		mas_lock(&mod_mas);
  1506		mas_erase(&mod_mas);
  1507		mas_unlock(&mod_mas);
  1508	
  1509		mas_lock(&file_mas);
  1510		mas_erase(&file_mas);
  1511		mas_unlock(&file_mas);
  1512	
  1513		mas_lock(&func_mas);
  1514		mas_erase(&func_mas);
  1515		mas_unlock(&func_mas);
  1516	}
  1517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
