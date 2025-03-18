Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92350D528
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 00:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742257920; cv=none; b=f+GPNq9jBLWDXJ/oS1ACADkP+M7YsNW+soQUwZ0pu+V12Yc8n7xUUplUdrIDmcNgsBBk2Eh/buvkpjY4qWaukYTE3OvhtKiH8M9RmPmSeg/8Bnhi7jlqZhtLIBGQafHDOg8tXaZ2KfeLBYGO7OQFEU54ReaEtwF/asfPdfQ0OnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742257920; c=relaxed/simple;
	bh=aeWmcuhPUbyc6atgHeNoaagUDJGpWk+V+qNynpYSbwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=opa8tzNVDx0G/y8C4g5Z0CvFsx84+fFVSmLzE40hXIcWL0/fenXndDX+ajfL3yGo62mVpCbGnXWgbrEDX6qH/9+SERlKhpPob+bCMtOGth+G/uSggObK7nB5vtEmic+0rvUL78XLgCQmvSn1LSlDatUd6RmSD2txLIOmfVpT8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eS1R0/d6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eS1R0/d6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742257918; x=1773793918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aeWmcuhPUbyc6atgHeNoaagUDJGpWk+V+qNynpYSbwk=;
  b=eS1R0/d6EbWz4pEka7NdLgrvQAAVcOphinr5YCoof06Sb0khZUdkQius
   l1QDetOIjXVCykqR3RqxRM1pdnsWHJyro2o1Bv3TzBQXcGPVa4CxOJnh2
   JWrtuA+XVTGmT4Sb3kWEsqkvjy4zDGZhuFvFZQ2sk4CnlkqJCyjNf3mb+
   4KAcy+uVi5HudDFjeZjdcdmI4oA8H7wKWheLrir5UxXtkwe7jF1f4JXNK
   M9Hah/Wa+7tv0uoSq/DRpe+A4afvfQ8veWL5Toghc1duiIsbnbEcrJ9Qg
   JpTiShDM4TOUF/XeBH24WtOsnTPvuhMXb9sfTU7v48I5ZwqAnatg/0fr1
   g==;
X-CSE-ConnectionGUID: qxauTWnkRdCK/ykLwVhGbg==
X-CSE-MsgGUID: evqmak95TC2PGDVKA2r+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43480535"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="43480535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 17:31:57 -0700
X-CSE-ConnectionGUID: TMMzjqF5ThqtnlVxTTABBw==
X-CSE-MsgGUID: jlKxjtGaRY+/pHJ5F5spGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="122604686"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2025 17:31:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuKs5-000DFn-1c;
	Tue, 18 Mar 2025 00:31:53 +0000
Date: Tue, 18 Mar 2025 08:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10764/11415]
 samples/hung_task/hung_task_mutex.c:25:15: sparse: sparse: symbol
 'hung_task_dir' was not declared. Should it be static?
Message-ID: <202503180827.4StpuFrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e94bd4ec45ac156616da285a0bf03056cd7430fc
commit: fb01916e3b56de4c9c6510202b446365082bdd3c [10764/11415] samples: add hung_task detector mutex blocking sample
config: i386-randconfig-r111-20250318 (https://download.01.org/0day-ci/archive/20250318/202503180827.4StpuFrD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180827.4StpuFrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180827.4StpuFrD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> samples/hung_task/hung_task_mutex.c:25:15: sparse: sparse: symbol 'hung_task_dir' was not declared. Should it be static?

vim +/hung_task_dir +25 samples/hung_task/hung_task_mutex.c

    22	
    23	static const char dummy_string[] = "This is a dummy string.";
    24	static DEFINE_MUTEX(dummy_mutex);
  > 25	struct dentry *hung_task_dir;
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
