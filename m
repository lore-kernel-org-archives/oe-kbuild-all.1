Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F22494F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764636; cv=none; b=oOdsimIUhlwoUbo5mg9yl63zGNQxQ/Bhichj8CKZZa6MGM6OMDVK60gDharIontvE08RQVyLfI/NFGPrzu+sJ75UvOAcgwWq7hhcY4y/obVu8kNZh7eZKEncNiABjktdzPq5+pcR4R0BJS3T5DNSA/WVuEV+mWVxC6p1cEns2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764636; c=relaxed/simple;
	bh=BCOlUukX+93yWISGU1yGG3mGYMAtaEHmJ809fIDBUe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DhPscY1QQ8bqO2IASqXUGJZ7pywYO2/RPMTA6YzQEqZRnMCcE7np2XNx93MtGm19u3whLMHJ40/Qb0x1BVpr2iEfpJsojsNVbHf+lmF3UEdV31A2t+WXbEBqy9snfapFu3NLKKo+OWCYUlVmFZdzq9/wHaf1ljQ2HGOAYHYYiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ci2gyYEU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ci2gyYEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774764635; x=1806300635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BCOlUukX+93yWISGU1yGG3mGYMAtaEHmJ809fIDBUe0=;
  b=ci2gyYEUD3xaw6rTJF/wnv9AnzcyidLxc3Gk1YjZmPH6iEBIi3loHBel
   nPk4syUJ0TpbT/k09LeSc0IYhS5mOK2Hrtg8tRD2VzMivpnx9JdHvCg12
   4r68wQu7BHiaxnZjj+qhU4eAH4aPCh6E8xmkEkclNkOAolIcUeAeOiUaf
   ciYcLvt9HA3whgmHtoQYfr5w2vy87azcIQamScRXtbLdOyzonyu7/pv1H
   1B9nBpBIocMz3t3T7dtf2lUGe1ZFXJrtOFfzs2u2m4ISM+D8erD0P3Yok
   jQ8MbkoaKWP+td5mTBMaEB6NSBeGJogyfJl5wIvLyXaSMdXYjp2d6/6Da
   Q==;
X-CSE-ConnectionGUID: uk/uH93sT46Irio4mW5Ubw==
X-CSE-MsgGUID: BA/e6b95TyGgBOYAO2eYFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63339198"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="63339198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 23:10:34 -0700
X-CSE-ConnectionGUID: 90C5BMxeQMiIv1aE28+SzQ==
X-CSE-MsgGUID: 3589d/OiQmyN16ofz0gGTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="225730275"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2026 23:10:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6jLx-00000000C8T-0vYk;
	Sun, 29 Mar 2026 06:10:29 +0000
Date: Sun, 29 Mar 2026 14:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 76/82] lib/dynamic_debug.c:1816:11:
 warning: variable 'mod_ct' set but not used
Message-ID: <202603291410.mVNO96A1-lkp@intel.com>
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
commit: 6455569678fb41a832964dcef4ac61f3bbc809fe [76/82] dyndbg: walk dd_mod_map intervals in dynamic_debug_init()
config: hexagon-randconfig-001-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291410.mVNO96A1-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291410.mVNO96A1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291410.mVNO96A1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1816:11: warning: variable 'mod_ct' set but not used [-Wunused-but-set-variable]
    1816 |         int ret, mod_ct = 0;
         |                  ^
   lib/dynamic_debug.c:1486:13: warning: unused function 'ddebug_clear_range' [-Wunused-function]
    1486 | static void ddebug_clear_range(const struct _ddebug_info *di)
         |             ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1569:12: warning: unused function 'ddebug_remove_module' [-Wunused-function]
    1569 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/mod_ct +1816 lib/dynamic_debug.c

  1813	
  1814	static int __init dynamic_debug_init(void)
  1815	{
> 1816		int ret, mod_ct = 0;
  1817		void *mod_name;
  1818		char *cmdline;
  1819	
  1820		struct _ddebug_info di = {
  1821			.descs.start = __start___dyndbg_descs,
  1822			.sites.start = __start___dyndbg_sites,
  1823			.maps.start  = __start___dyndbg_class_maps,
  1824			.users.start = __start___dyndbg_class_users,
  1825			.descs.len = __stop___dyndbg_descs - __start___dyndbg_descs,
  1826			.sites.len = __stop___dyndbg_sites - __start___dyndbg_sites,
  1827			.maps.len  = __stop___dyndbg_class_maps - __start___dyndbg_class_maps,
  1828			.users.len = __stop___dyndbg_class_users - __start___dyndbg_class_users,
  1829		};
  1830	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
