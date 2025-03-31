Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF02D1EEF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 05:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743398971; cv=none; b=YHfN/vGThwyaQAqiul5r910017jzcC4ub1BuAZGyeHn64ExNpBC3GmwFYr2QQbDvE/cJqOsTJPFLeiLP/2J4PfqWQJVVhLXnWk+HNN6HL8fIVzAXxrtjBB556sglImwybLfH3ZRMpHLjH8PpRpu2nHcwpGJ/mHU03iFFGGgjH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743398971; c=relaxed/simple;
	bh=bIphfphQqkYilq1I+YS9kAb6oSMlMRZCOrm70rQ74VY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRnxzUqBD35668RgNKMXg4Yha7VsgsEY8TPgsnZV2JIbJmnQnV83YFzLpHYPg3QDT5pxb6aWpRTXkmGok3RFpyOdv4lwKWLWN+ws+RQHE3rziIUW4+x6E6Er5zc89KZeMzbmu94y9CwcdNHuWXOcqWalulWeHRxyHlFkSgeioLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqg9qcg6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqg9qcg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743398970; x=1774934970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bIphfphQqkYilq1I+YS9kAb6oSMlMRZCOrm70rQ74VY=;
  b=kqg9qcg6btR8joDVdRwtq+S+Rtw/El4pRmw1VSbZ9U/8wanbZFr28YRa
   hakgiyfv5Rzop4IT1Y3A7rV2qPfvogv1djzosVaOs6jY3m63K5eerlVu6
   GzEaEuTe25IUaqmZAcJzQu6hFY2IXQfAnBfbxCrdJMkIUDBg+142WuLTc
   WwY7Hog1AUe5z0/Zl1KIht3LrrfkULn8UvBXpfXiuMSXw5ElKp6Fax5Yx
   dKd/726igni30UyicEif2HK+x3uTJvrs/XpLh8i3qFU7sGGxUki3oENMp
   de589Gg5ytwbBoZRhIhs5XiNfattEMioFNO8Cet7yljH0+qQCOheROOFH
   w==;
X-CSE-ConnectionGUID: TbxgbzQeSSeP/oVZ4QAzng==
X-CSE-MsgGUID: btZglYk+Qsef+fTOciyweQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="56048376"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="56048376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 22:29:29 -0700
X-CSE-ConnectionGUID: YSPsafpJTY2oqjmCpd+Ijw==
X-CSE-MsgGUID: 7x/u3ZlXTdKbjAV/ebP7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="149171870"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2025 22:29:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz7iA-00094C-0e;
	Mon, 31 Mar 2025 05:29:26 +0000
Date: Mon, 31 Mar 2025 13:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-614 28/54] lib/dynamic_debug.c:1249:24: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202503311351.KokFhGHK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-614
head:   fccfc200e018f02f848d51e0bff6bf5ea4c88de5
commit: dd17dc5dd81956ecbac7b184addc4a66d65d8990 [28/54] dyndbg: restore classmap protection when theres a controlling_param
config: hexagon-randconfig-r122-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311351.KokFhGHK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce: (https://download.01.org/0day-ci/archive/20250331/202503311351.KokFhGHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311351.KokFhGHK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:1249:24: sparse: sparse: Using plain integer as NULL pointer

vim +1249 lib/dynamic_debug.c

  1241	
  1242	static struct _ddebug_class_param *
  1243	ddebug_get_classmap_kparam(const struct kernel_param *kp,
  1244				   const struct _ddebug_class_map *map)
  1245	{
  1246		struct _ddebug_class_param *dcp;
  1247	
  1248		if (kp->ops != &param_ops_dyndbg_classes)
> 1249			return false;
  1250	
  1251		dcp = (struct _ddebug_class_param *)kp->arg;
  1252	
  1253		return (map == dcp->map) ? dcp : NULL;
  1254	}
  1255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
