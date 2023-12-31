Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C595819
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 01:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R03fRuSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703986739; x=1735522739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JjLoRWZieswvZXJ0zAG7G0UiOrmhGIGrhEg1OUX+TYM=;
  b=R03fRuSnnCFFKKYvO6UpCauV6dGA+gqqUykh7HpuM+6jozVDH9/BqMyn
   6GHvZzmfE44MdBap+4ZVcLUVDCeJbI++lNMGDQRDFQg4pGMG7tEXAW+Fq
   VmOiSEdQlN8dFLGr3BxfFezTq+2NOkR8ILLO7ElvsnVySczU5TKnqE/HQ
   foxvcULRmVQobnmoFl7erX+96QzGAUYbqHg5TokeWYSTAFC/dSEYCdjJ7
   Etwd9LZDbjhYGvqagVN5rKhgGMrD9/nZGDM7wUitZKsRiaXZEhKuqyOw+
   dFtuSx9gV/OdHIy9SP6efMZXIyolYiT21tCGc27OULDCRQiupKkJHHSJL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="18277078"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="18277078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 17:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="21181429"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Dec 2023 17:34:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJkih-000ItJ-0s;
	Sun, 31 Dec 2023 01:34:27 +0000
Date: Sun, 31 Dec 2023 09:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps2-on-lukas-v3.1 40/55]
 lib/dynamic_debug.c:1692:35: error: 'struct ddebug_table' has no member
 named 'classes'
Message-ID: <202312310941.CycNxIMs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-classmaps2-on-lukas-v3.1
head:   4a9d672e048057e464e5bf65816cb57dd078fd62
commit: 71a33ce8ac4d6b9f6b675d5ac04a8b2dcd2e7747 [40/55] dyndbg: tighten ddebug_class_name() 1st arg type
config: x86_64-randconfig-003-20231230 (https://download.01.org/0day-ci/archive/20231231/202312310941.CycNxIMs-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312310941.CycNxIMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310941.CycNxIMs-lkp@intel.com/

Note: the jimc/dd-classmaps2-on-lukas-v3.1 HEAD 4a9d672e048057e464e5bf65816cb57dd078fd62 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c:621:7: warning: no previous prototype for 'skip_spaces_and_coma' [-Wmissing-prototypes]
     621 | char *skip_spaces_and_coma(const char *str)
         |       ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_class_name':
>> lib/dynamic_debug.c:1692:35: error: 'struct ddebug_table' has no member named 'classes'
    1692 |  struct ddebug_class_map *map = dt->classes;
         |                                   ^~
>> lib/dynamic_debug.c:1695:20: error: 'struct ddebug_table' has no member named 'num_classes'
    1695 |  for (i = 0; i < dt->num_classes; i++, map++)
         |                    ^~


vim +1692 lib/dynamic_debug.c

  1686	
  1687	#define class_in_range(class_id, map)					\
  1688		(class_id >= map->base && class_id < map->base + map->length)
  1689	
  1690	static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
  1691	{
> 1692		struct ddebug_class_map *map = dt->classes;
  1693		int i;
  1694	
> 1695		for (i = 0; i < dt->num_classes; i++, map++)
  1696			if (class_in_range(dp->class_id, map))
  1697				return map->class_names[dp->class_id - map->base];
  1698	
  1699		return NULL;
  1700	}
  1701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
