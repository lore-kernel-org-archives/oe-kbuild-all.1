Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A9E37C107
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069033; cv=none; b=DKyVBiWkRsuSJBe2rvrQ6jiOZsIm/1xdgKZBIukxGyVJhr0MttrHtQ/+ipJUDZC1HCnOuBT4Yd5OFeCrXpi2QYBtgwCo7NXTswBKEBTPGsIV3QdmpFJmINvw7nRIZ45DfGta3aCT44H+nue3a9c+KwG0rqwj3ye6zCcYCTvKMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069033; c=relaxed/simple;
	bh=0VKSfNiUmKtrIeOBo7KMx6lixgKtQjoHR61H+sGdhDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnLSo4VAVp+F8WlwTihWBHX7jHv7tR6G8Yn88XOWTGSo1sn8Rcqy/6lWobtVgvkUyM1MY0Iz5W5yDdl755BCdR4RrRGMXPoxp0LE1xpIAj8s4RAt+ubhHyIMeIfjfbe/ZCAQPLhsvKBE6HYcTWwSW5/bqtCWr9dbUV/gSXNx7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFJALPD4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFJALPD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776069031; x=1807605031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0VKSfNiUmKtrIeOBo7KMx6lixgKtQjoHR61H+sGdhDU=;
  b=iFJALPD4UNqVN/4/R2RKzz5EVxd+F1cMitMjtcOamDm+RJ8EAVey7rOE
   CcDltQnILYQXIH7SY2cVwqrfse8Ct4j7SvQXQe8f1gzf7hgnFJZPp+Ee4
   1Z11hVyrj5/WAIzAVvUbQlk7QO/cfrVVnlnpf7JSUyuj6dspqF1zI0RZ6
   08R6WnpDddwiHnEI8ut0RJM5yqUBnOnWgFlQkUdc1eb8tanVfI0wOQn97
   rcuTgu3ufQ0d65Bf2bz5VFWj2jBiV+Nyp7Mr0bxQLHMJ1KyZPub7HHpVs
   DK74uXGyisWKRC90Dei/0htf/W+PtlyhVbDuvWot1NaPVtrI0/tNyFqmU
   g==;
X-CSE-ConnectionGUID: bLmYtrMDSja35NXzwsS2og==
X-CSE-MsgGUID: N1r0Y/kuQdCtoHoLEsy/ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76959702"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76959702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:30:31 -0700
X-CSE-ConnectionGUID: F8EEcBKuSZmbHetxK8sLPg==
X-CSE-MsgGUID: H8mclYpXR5yRmsLkx5U29Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="226559250"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Apr 2026 01:30:28 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCCgX-000000000DB-3gNg;
	Mon, 13 Apr 2026 08:30:23 +0000
Date: Mon, 13 Apr 2026 16:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fs: drop_caches: introduce per-node drop_caches
 interface
Message-ID: <202604130021.6XBx1HsE-lkp@intel.com>
References: <20260409063503.3475420-1-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409063503.3475420-1-wangkefeng.wang@huawei.com>

Hi Kefeng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on brauner-vfs/vfs.all driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/fs-drop_caches-introduce-per-node-drop_caches-interface/20260412-192452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260409063503.3475420-1-wangkefeng.wang%40huawei.com
patch subject: [PATCH RFC] fs: drop_caches: introduce per-node drop_caches interface
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260413/202604130021.6XBx1HsE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130021.6XBx1HsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130021.6XBx1HsE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/filemap.c:2167 function parameter 'nid' not described in '__find_lock_entries'
>> Warning: mm/filemap.c:2167 function parameter 'nid' not described in '__find_lock_entries'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
