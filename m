Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74833CEA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 23:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779058803; cv=none; b=EOqc14dOh1/FWOXhwwh4azzc/EbHKF2b0TFbxlyoRSzOVuegAgfJ8dOEh/sD/yoTH3Mu6xPSmU6N+nU2wKXs8hjXpv6w4JwdLqTFOY3Bz83KQrnquF5p2YKTW6kSiwbzlRXq28490maboNCGilqrDkMjcceCHtV63OB+AJ6MDaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779058803; c=relaxed/simple;
	bh=iNG65YFo02bfAtMK1VkZmM7GgFu2dw36HnUeimLv8QY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FXPGdhhQUb29tJwyvpHX/DRHLCLDLg8v0apsDXmzQ0XnRQ2qL/spydrHnXKIK0DYL3Y3SsiEXz6TsyRQQMizqepmKuGRTyskNZ9tIysw9/aeVI09lJZn3wkD5H4jMow/3P7xSF5SYjlrCFOIWy0keJlT8VTPPIWq7EZ9//F8OK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7WEsZqe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7WEsZqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779058801; x=1810594801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iNG65YFo02bfAtMK1VkZmM7GgFu2dw36HnUeimLv8QY=;
  b=l7WEsZqekONsuZTonx5nqqyRj/qH0CxS/sA7Fq6Iqyo8wn62RVAC3GWd
   A1F63d33ZVGfplrCQYucjiCC1aOrXD1OR0HKqh73bX5ecRdBjVWeWlbn6
   zRZzcsdaw5vJC6jljYrG2evPGwL0ZwK8/M4XXTu9Y5bTPEd71fTmkB5rw
   MWf86hdln0djgIUpxyl3u7Gny0G1faey13sSb3AC03+ij7hUuulI7zqD9
   bi1UixpdxwK6grGxPdMOIhDLYhHhd9UeAQNg7F1pGbMOrCHBqhpPjx8cD
   ecio+Z74ZpuyQ5HFJs6up1rf1psBCH4NOvy93SiQ5nmqIcjK23G6HcgaA
   A==;
X-CSE-ConnectionGUID: q84JQGxyQA2O+deFvMBKNw==
X-CSE-MsgGUID: mpjarnUcQ6qmWLg70wBAOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90611730"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="90611730"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 16:00:00 -0700
X-CSE-ConnectionGUID: 1gem5MOJRTS6e25yWywFiQ==
X-CSE-MsgGUID: 548P3J0rTNyj/ZFgh+h4ag==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 May 2026 15:59:58 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOkSi-0000000020y-1SBH;
	Sun, 17 May 2026 22:59:56 +0000
Date: Mon, 18 May 2026 06:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 21/52] lib/dynamic_debug.c:672:8:
 warning: unused variable 'nl'
Message-ID: <202605180645.JpPYShIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   270053dc597e59c9ffc0b5f17c8863076b56c7cf
commit: 3396a18f65a16d0586c4d59987dfb23a01ddbd06 [21/52] dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
config: arm-randconfig-002-20260518 (https://download.01.org/0day-ci/archive/20260518/202605180645.JpPYShIf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180645.JpPYShIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180645.JpPYShIf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'param_set_dyndbg_module_classes':
>> lib/dynamic_debug.c:672:8: warning: unused variable 'nl' [-Wunused-variable]
     char *nl;
           ^~


vim +/nl +672 lib/dynamic_debug.c

   663	
   664	static int param_set_dyndbg_module_classes(const char *instr,
   665						   const struct kernel_param *kp,
   666						   const char *mod_name)
   667	{
   668		const struct _ddebug_class_param *dcp = kp->arg;
   669		const struct _ddebug_class_map *map = dcp->map;
   670		unsigned long inrep, new_bits, old_bits;
   671		int rc, totct = 0;
 > 672		char *nl;
   673	
   674		rc = kstrtoul(instr, 0, &inrep);
   675		if (rc) {
   676			int len = strcspn(instr, "\n"); /* Finds length up to \n or \0 */
   677			pr_err("expecting numeric input, not: %.*s > %s\n", len, instr, KP_NAME(kp));
   678			return -EINVAL;
   679		}
   680	
   681		switch (map->map_type) {
   682		case DD_CLASS_TYPE_DISJOINT_BITS:
   683			/* expect bits. mask and warn if too many */
   684			if (inrep & ~CLASSMAP_BITMASK(map->length)) {
   685				pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
   686					KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
   687				inrep &= CLASSMAP_BITMASK(map->length);
   688			}
   689			v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
   690			totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
   691			*dcp->bits = inrep;
   692			break;
   693		case DD_CLASS_TYPE_LEVEL_NUM:
   694			/* input is bitpos, of highest verbosity to be enabled */
   695			if (inrep > map->length) {
   696				pr_warn("%s: level:%lu exceeds max:%d, clamping\n",
   697					KP_NAME(kp), inrep, map->length);
   698				inrep = map->length;
   699			}
   700			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
   701			new_bits = CLASSMAP_BITMASK(inrep);
   702			v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
   703			totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
   704			*dcp->lvl = inrep;
   705			break;
   706		default:
   707			pr_warn("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
   708			return -EINVAL;
   709		}
   710		vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
   711		return 0;
   712	}
   713	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
