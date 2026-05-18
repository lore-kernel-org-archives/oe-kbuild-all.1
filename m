Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72E380FF6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 04:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779079017; cv=none; b=Eed5N4g5iLnNDGcDbmp8UWni7lwQQIQurMUuuhUHBxMr0FhkW9ozCOLsAlaqOG8RuAHwrvajtBkOpwHn13GQf3VljGngjahb9UFKOS75i+Ei8ztqRgy5KlqY5PFkXRtivwGIamYlBraTFDtWiDD4q1mdwfhni0F54o8L5B0Z99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779079017; c=relaxed/simple;
	bh=gq6ywYy9Opb6lfmYnowZPEuCdvramDn9ioKcPSRhCUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IMwDWJb3ojlnQN/dz9UvpqynFU+WW5qC4dnNirDVwtTPqpJhERwi6755NXyvsOPMSYWlysqCIAZZyDR2k8RUVaumadJJiR6ShHe6kWeBuXa1Y6lAgrC/tNoLykaS860/07WrBZ0zl8eQLyC7zSoI0RZVhI/VpweemLVbHstg6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JukX3hGb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JukX3hGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779079015; x=1810615015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gq6ywYy9Opb6lfmYnowZPEuCdvramDn9ioKcPSRhCUc=;
  b=JukX3hGb0PhbopVI5dUjlKlzA21f3EtZm078q8eZL4gvuNC7ADEczBFk
   gUJFxoZjFPaiVTMf15emwbR5EZ9mUvbtQgTPic8I/+Ymxepm362bXOg/u
   cE1DXJA13nxmUICecwG2gl8Q7D6zejw3T4jlj/s3SHuXEAGwWVkHdOFgA
   rNKe7DlDEiz9JVP+BfiFEVrxHC+NQvd3V2hsrUCiyFHIXzFzfk77eV/me
   M1gTTQLhc+3nFyBSpLl8lYEl+xW55FgCeBB0HTJGgIpuYg5CTLIMSqjj5
   Df4zRBDivYt1ujmu4E14+wqOKGXbgOTx3uQqKhmyWIDOg8khee8F8S9p6
   g==;
X-CSE-ConnectionGUID: 2gfDsCKiS3OyW49bJ33Adg==
X-CSE-MsgGUID: MErb09OoRyOGIEHYp+fnkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79972578"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79972578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 21:36:54 -0700
X-CSE-ConnectionGUID: O9U2IgA/T7aiLgFIuW0x2A==
X-CSE-MsgGUID: AMrDhQMQRmGxcYI56Y/Dqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="238425251"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 17 May 2026 21:36:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOpik-000000009jd-22Xz;
	Mon, 18 May 2026 04:36:50 +0000
Date: Mon, 18 May 2026 06:35:59 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 21/52] lib/dynamic_debug.c:672:15:
 warning: unused variable 'nl'
Message-ID: <202605180603.6Cgslvw9-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260518/202605180603.6Cgslvw9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180603.6Cgslvw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180603.6Cgslvw9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'param_set_dyndbg_module_classes':
>> lib/dynamic_debug.c:672:15: warning: unused variable 'nl' [-Wunused-variable]
     672 |         char *nl;
         |               ^~


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
