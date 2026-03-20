Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2950936F43A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000679; cv=none; b=X2yaFe42E8C95dLTFq/tS/ew3AarD1lkOha9ZubfdI1eOEf/fpuehPfBDw1LQLfVyZI1TCEU2LAdXtz1f3mKhobFFiqnJ96tYP91whTQuWtK8ljBiTMtOZKqv3ANcnw2r3nVIWEkzu22HaIyO7q7hE74FqJlfHCj6b475KxK0ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000679; c=relaxed/simple;
	bh=d+qRl3xzrD6Fc73V86c+qsbiHFeGI0Jele3AfKEIqsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=faa222SGeeaOd9KsNIIKqS+OI3xcDsZugMQViD30MszYBod7gsVuQxZoVtSbJP9uJ/7ByZ5G6SisJss8HZuNF9jfl3WEUbv1/FHoLKeWSler48hyk4kFmJpZ5kq4jxPjefx7wWr00X+qFK0XI5vjFxQGwLLP198FboreecbqdQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjAA00bh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjAA00bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774000677; x=1805536677;
  h=date:from:to:cc:subject:message-id;
  bh=d+qRl3xzrD6Fc73V86c+qsbiHFeGI0Jele3AfKEIqsc=;
  b=KjAA00bhFhYwekDuD3A7GOGYilHCyFPvUZBuxugeVE537tt306mAMQa4
   WLKs3r1MV5LTzPkEiSux/PNpEJGWvlqNgZMqjmYqrsBEhPFsn8/r5D2uT
   7frworvZ+AL/JTjiyOpsi9DVkn30Zxu9sxKby62XgRgdbaA0cJnt45pZ4
   joKPlWKXDmrCgvdiPt7r0BMAaiXCoae87SuVqaSPXyQ2g8AeXBeSWIaYp
   Uo02XBzxsn18BLFy9a2RjcVZJU71vCXpfykJIRu+v/U/+oq8RndHOcWNy
   +LJhRUIl3pglVwhc2XS9foJwOhJd7odPrwtR9ASv8oZ8C9PcZA1WjqhiR
   g==;
X-CSE-ConnectionGUID: pQRUA3R8RDKXf0LU+nXZQw==
X-CSE-MsgGUID: ZFzJzjTFSGSTn6FB6xxvRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86558991"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86558991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:57:56 -0700
X-CSE-ConnectionGUID: YMrFu2SPSDSC4lt3ns5dKA==
X-CSE-MsgGUID: 9PPumoSoRSG2eb4lIJi/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223224625"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 02:57:56 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3WaW-000000002Ez-2dlt;
	Fri, 20 Mar 2026 09:56:27 +0000
Date: Fri, 20 Mar 2026 17:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:vfs-fixes 3/5]
 security/apparmor/apparmorfs.c:209:13: warning: 'aa_get_common_ref' defined
 but not used
Message-ID: <202603201736.4Hif1yve-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux vfs-fixes
head:   045aba2b089c3414b0cf3522a43dbfe4b83302ee
commit: f2b9cb55540b0f2da08380cd369a496542fcb717 [3/5] Merge remote-tracking branch 'vfs/vfs-7.1.directory' into next
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603201736.4Hif1yve-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201736.4Hif1yve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201736.4Hif1yve-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/apparmorfs.c:209:13: warning: 'aa_get_common_ref' defined but not used [-Wunused-function]
     209 | static void aa_get_common_ref(struct aa_common_ref *ref)
         |             ^~~~~~~~~~~~~~~~~


vim +/aa_get_common_ref +209 security/apparmor/apparmorfs.c

8e135b8aee5a06 John Johansen 2026-03-01  208  
8e135b8aee5a06 John Johansen 2026-03-01 @209  static void aa_get_common_ref(struct aa_common_ref *ref)
8e135b8aee5a06 John Johansen 2026-03-01  210  {
8e135b8aee5a06 John Johansen 2026-03-01  211  	kref_get(&ref->count);
8e135b8aee5a06 John Johansen 2026-03-01  212  }
8e135b8aee5a06 John Johansen 2026-03-01  213  

:::::: The code at line 209 was first introduced by commit
:::::: 8e135b8aee5a06c52a4347a5a6d51223c6f36ba3 apparmor: fix race between freeing data and fs accessing it

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
