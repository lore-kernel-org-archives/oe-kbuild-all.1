Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D431F95C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761437018; cv=none; b=OdT14PtucL7WDNICZzS0CKYgAtPFkveC60C9HO7Wh5TYKG22TpNy1XUYZUmh7DOFcDuR/F+tUUJVCpUYK4ZGEo2LsmfncQcwTVtvSWLcyjNyxezIfFQn/enhNZG/DH8ENnIBS/XN+LIR+RFJFFLB7U6SqcK5UUQ1uPshLQ3q9j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761437018; c=relaxed/simple;
	bh=PqOy7FvDy1jZp7ziw/uZi/Usa6m2evpgVthM1R1jVjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4RSCA0vi0LR7/U467bJtL+iT/3PHKwzPYGX8yw1UU05piYaJIkmx6+RV8kbxMI0aUhzsbYRuLTTdRBVR4SiFolmrOCwyQz1Ow8HLlFrAKmEMfqsvWn6kfPsxAmX4Nikw1hwJN7vkQyBaihTDclzFZUkkzNYQGc7rECrizbYCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cm3oGMBK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cm3oGMBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761437017; x=1792973017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PqOy7FvDy1jZp7ziw/uZi/Usa6m2evpgVthM1R1jVjg=;
  b=cm3oGMBK/abgRlfoj2YX16isgD4iYo6OAx0M3Gu+qXvvktkm7dgHSX3m
   yjrwe6KM4WrfWZy1HhDP5GRJSe5lLFyaJFvMpJLPD6JH78MauebX7bUG3
   SjFYLVCO5ocYmU+RsBMqpXIB1wy8zkFBdsmXHy1T84CJRMoW3jgZS6GsB
   ysv1zT3BKub4RnAG3sYu0FjED18pzj/z+KfhSDBqMxZkjfl2bqmfbQNqq
   xAJldMn485uzaFs5WEpgnAp4PTrpF69R1+vwA2ZXWAx1O+w47kTWsG4pT
   f5Y4mN59tlWnmQvB78///1G3yUpAebjXq0SVwMD8ZnLlrBElE4woyewvO
   Q==;
X-CSE-ConnectionGUID: OFCgmNqLQYqN7qVx20qiYA==
X-CSE-MsgGUID: IEx1hH+PQmq+8viOs1eFgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73856291"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="73856291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 17:03:36 -0700
X-CSE-ConnectionGUID: KfyquxaFQ5CiaANqjUM/jw==
X-CSE-MsgGUID: GnZ+hsMpTOmyutUiJ3VRag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185482340"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2025 17:03:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCoEP-000FiM-15;
	Sun, 26 Oct 2025 00:03:33 +0000
Date: Sun, 26 Oct 2025 08:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-6a5 24/51] lib/dynamic_debug.c:1094:7: error: call
 to undeclared function 'class_in_range'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202510260709.sP8681DF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-6a5
head:   a2f8b47e22fa6a1a9852e392166bc9adf45cc17d
commit: 0b97c67ff7508553279207f049005e69875b9d81 [24/51] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
config: x86_64-randconfig-074-20251025 (https://download.01.org/0day-ci/archive/20251026/202510260709.sP8681DF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260709.sP8681DF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260709.sP8681DF-lkp@intel.com/

Note: the jimc/dd-shrink-6a5 HEAD a2f8b47e22fa6a1a9852e392166bc9adf45cc17d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/dynamic_debug.c:1094:7: error: call to undeclared function 'class_in_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1094 |                 if (class_in_range(dp->class_id, cli->map))
         |                     ^
   1 error generated.


vim +/class_in_range +1094 lib/dynamic_debug.c

  1082	
  1083	static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
  1084	{
  1085		struct _ddebug_class_map *map;
  1086		struct _ddebug_class_user *cli;
  1087		int i;
  1088	
  1089		for_subvec(i, map, di, maps)
  1090			if (ddebug_class_in_range(dp->class_id, map))
  1091				return map->class_names[dp->class_id - map->base];
  1092	
  1093		for_subvec(i, cli, di, users)
> 1094			if (class_in_range(dp->class_id, cli->map))
  1095				return cli->map->class_names[dp->class_id - cli->map->base];
  1096	
  1097		return NULL;
  1098	}
  1099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
