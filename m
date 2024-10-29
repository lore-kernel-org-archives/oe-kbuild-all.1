Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ECF197A9E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229326; cv=none; b=s1dkipvZzPmV+h/wi9mbQ8FMnPqhpDBmZPFRH2F6o4WlQ5R06e/7zvjvULcVC2lZTAyRYariQ9tgq/zMKqvyddRpVXpjQ4p9ewiyzkcWdpmCJfNSn/x+nEyp9eHv8VvC4O0DhKmVsH75sOMwq8qGNrggJJ71wVsgQGIvEDp77fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229326; c=relaxed/simple;
	bh=oyDp/GGNXgQqWPKx76wwzCYdIpGXiROkN80SRoPx6AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLMK0xJg20akVs9Dts/LdSIpj76ObMa3l6uf/WmXfH7GcIIK76JDNk+RjnmSB5bnqLpBUKKlAytLk+nxjA/HakiIB9atWDt7P3lEODr0wtk1vdGmrujb/t28Oa1Pe91r1yKhH2MjR/WyN7EPBY5LWfaX8RbhwBePBP4D1OCBS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBG/6c52; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBG/6c52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730229325; x=1761765325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyDp/GGNXgQqWPKx76wwzCYdIpGXiROkN80SRoPx6AQ=;
  b=jBG/6c528dep+QQuyWj2Hd3mEZuy9M3Qh2WRPWDybWYEzg6/3/1JV/tY
   FlJ6JfAzwQU2l042UXiDstxndmNLMHXrN7npp4JsZSjTfoIP7pWqBo4bx
   CbOz+hTawfK17OvV1CiQ5S0hE0+hmvYDtb+aRl0RyNgFB6PPZ5wXV2BJl
   BRew1i71f4liYF5A1ELIZp1F7b4SiA5s6T9DfSG6vFVT4kO4VJNdc9z8v
   mU5w49guAHbCyysyWus8rW3VvU7eHoHf/ecEgVF07VnGiAXoifsDNmBQe
   BG3iuoep/JCGFDFdK45cOeD866z3eaIP5/8t3h7fotfNNWkeFP7cy4Ybf
   A==;
X-CSE-ConnectionGUID: ZQsTDHFnQK2l6kEfpS8TAw==
X-CSE-MsgGUID: 9NdC3LWlRMuY1HWzvSZOQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33824685"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33824685"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 12:15:24 -0700
X-CSE-ConnectionGUID: pFGx13TMRd+eB/Dv6w4Yxg==
X-CSE-MsgGUID: GoWamREWQnS87ChQB3DYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="112869668"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2024 12:15:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rgW-000e29-11;
	Tue, 29 Oct 2024 19:15:20 +0000
Date: Wed, 30 Oct 2024 03:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4d 25/82] lib/dynamic_debug.c:1280:12: warning:
 'ddebug_remove_module' used but never defined
Message-ID: <202410300334.tcccCQR9-lkp@intel.com>
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
commit: c70ec701d1c5650abf6fceaaf9a86f8dd3facff9 [25/82] ddebug: cleanup-range-overlap fails
config: xtensa-xip_kc705_defconfig (https://download.01.org/0day-ci/archive/20241030/202410300334.tcccCQR9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300334.tcccCQR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300334.tcccCQR9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1280:12: warning: 'ddebug_remove_module' used but never defined
    1280 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/ddebug_remove_module +1280 lib/dynamic_debug.c

  1279	
> 1280	static int ddebug_remove_module(const char *mod_name);
  1281	/*
  1282	 * Allocate a new ddebug_table for the given module
  1283	 * and add it to the global list.
  1284	 */
  1285	static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
  1286	{
  1287		struct ddebug_table *dt;
  1288		struct ddebug_class_map *cm;
  1289		struct ddebug_class_user *cli;
  1290		u64 reserved_ids = 0;
  1291		int rc, i;
  1292	
  1293		if (!di->descs.len)
  1294			return 0;
  1295	
  1296		v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
  1297	
  1298		dt = kzalloc(sizeof(*dt), GFP_KERNEL);
  1299		if (dt == NULL) {
  1300			pr_err("error adding module: %s\n", modname);
  1301			return -ENOMEM;
  1302		}
  1303		/*
  1304		 * For built-in modules, name lives in .rodata and is
  1305		 * immortal. For loaded modules, name points at the name[]
  1306		 * member of struct module, which lives at least as long as
  1307		 * this struct ddebug_table.
  1308		 */
  1309		dt->mod_name = modname;
  1310		dt->info.descs = di->descs;
  1311	
  1312		INIT_LIST_HEAD(&dt->link);
  1313		/*
  1314		 * for builtin modules, ddebug_init() insures that the di
  1315		 * cursor marks just the module's descriptors, but it doesn't
  1316		 * do so for the builtin class _maps & _users.  find the
  1317		 * start,len of the vectors by mod_name, save to dt.
  1318		 */
  1319		dd_mark_vector_subrange(i, dt, cm, di, maps);
  1320		dd_mark_vector_subrange(i, dt, cli, di, users);
  1321	
  1322		for_subvec(i, cm, &dt->info, maps) {
  1323			rc = ddebug_class_range_overlap(cm, &reserved_ids);
  1324			if (rc)
  1325				goto cleanup;
  1326		}
  1327		for_subvec(i, cli, &dt->info, users) {
  1328			rc = ddebug_class_range_overlap(cli->map, &reserved_ids);
  1329			if (rc)
  1330				goto cleanup;
  1331		}
  1332	
  1333		if (dt->info.maps.len) {
  1334			rc = ddebug_module_apply_class_maps(dt, &reserved_ids);
  1335			if (rc)
  1336				goto cleanup;
  1337		}
  1338		mutex_lock(&ddebug_lock);
  1339		list_add_tail(&dt->link, &ddebug_tables);
  1340		mutex_unlock(&ddebug_lock);
  1341	
  1342		if (dt->info.users.len) {
  1343			/* this needs to find the ref'd class on the ddebug-tables list */
  1344			rc = ddebug_module_apply_class_users(dt, &reserved_ids);
  1345			if (rc)
  1346				return ddebug_remove_module(dt->mod_name);
  1347		}
  1348		vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
  1349		return 0;
  1350	cleanup:
  1351		kfree(dt);
  1352		return rc; /* tbd might conflict w notify chain */
  1353	}
  1354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
