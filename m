Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5085227E95
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765655600; cv=none; b=jWayS1t5SylSREm9KD+qCjFaPDue28dH3dy7vtejYBitJfb9Xa13MMxXA0uvSl4gvQ3xxRx555V2YQwDafuf38CJvUvxaOLawtZBLJaKv8IHnVH+oYVzri7FLXIyr4EJU3emaquhC+6V7eRoKsfCZXlnzfDK/z3E6LOy0UbF6T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765655600; c=relaxed/simple;
	bh=Xen3QA6Jd6Zl6Pj/xcolCeh1UDGwJ4KcZgiGXw/YFgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YCMxg224naeX6W/5PmaoePKUf9tj6LbIcHkb/ViUuL3IEdC90uAAMdvHni0LjunS0m4ckIZQbQXg2ZCYG56oiKy0duyFtr885GSLmDLz+puDKOFOZ9oRiUDsyRy7vTxSZ+xzCG05BLUNmdeHUBuO/huj1XCpdTM8oOmRBonGcQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckSjBo+/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckSjBo+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765655598; x=1797191598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xen3QA6Jd6Zl6Pj/xcolCeh1UDGwJ4KcZgiGXw/YFgU=;
  b=ckSjBo+/yDAg/3GnkeSYOvp/bf82N/px2yR77XV5aKOY2RE8DnWeHCDE
   7Jvmlu67v0XK56cql136FFIp2I5jPTPk8UN+J//+RiqDoEowvihFb3oGA
   LKdfdQoj0U2yXLJNWC1JSxb3Zm4O9aU9uraQXLIdDOzqewQHLapWsS4xh
   ooszL/cnKBXgSt0uCPyHWmwQs9zbfDYpXYrhV1ymxUUc8Fdd7LkbNNRR6
   KZUfjLfuB7eq7ab81X12+HAJlrmEW0HoH0/Tvw+e6vBr8IqmSI8ddNEqs
   j3XT9QEczYS6yPwtEDIx6LecoLZyoPzV7jOPghtHlEEEGggXLL3Rf4FqZ
   g==;
X-CSE-ConnectionGUID: FQtEbgDsRG+oa0LKLam+gw==
X-CSE-MsgGUID: XdgQlj8iTQy+LeHTbbjmWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67502944"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67502944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:53:17 -0800
X-CSE-ConnectionGUID: hXH+Bzn8Qj6Qb2ut51p63g==
X-CSE-MsgGUID: 838Ya1UFRaSyneQF7MnrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="234756931"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2025 11:53:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVg1-0000000088V-1uxY;
	Sat, 13 Dec 2025 19:53:13 +0000
Date: Sun, 14 Dec 2025 03:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: security/landlock/fs.c:1339:18: sparse: sparse: Initializer entry
 defined twice
Message-ID: <202512140315.QRNaYare-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: c56f649646ecec3dd1a2e400e6e5ec83439d940f landlock: Log mount-related denials
date:   9 months ago
config: arm64-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140315.QRNaYare-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140315.QRNaYare-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140315.QRNaYare-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/fs.c:1339:18: sparse: sparse: Initializer entry defined twice
   security/landlock/fs.c:1340:26: sparse:   also defined here
   security/landlock/fs.c:1353:18: sparse: sparse: Initializer entry defined twice
   security/landlock/fs.c:1354:26: sparse:   also defined here

vim +1339 security/landlock/fs.c

  1333	
  1334	static void
  1335	log_fs_change_topology_path(const struct landlock_cred_security *const subject,
  1336				    size_t handle_layer, const struct path *const path)
  1337	{
  1338		landlock_log_denial(subject, &(struct landlock_request) {
> 1339			.type = LANDLOCK_REQUEST_FS_CHANGE_TOPOLOGY,
  1340			.audit = {
  1341				.type = LSM_AUDIT_DATA_PATH,
  1342				.u.path = *path,
  1343			},
  1344			.layer_plus_one = handle_layer + 1,
  1345		});
  1346	}
  1347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
