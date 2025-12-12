Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662CE293C4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 05:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765518272; cv=none; b=vDKASwsxWt/fJVFSgfyC4r4IN8Aj8rHbeBFLgnSApX5cVhWODlhANbPkZ7aPqUl4VUihdhE/ib4Rzc2KcT7l8ElKMlfAUxlCjtAm7znRM4QxzVd6/1ZoOe7Ralrd8DSCGdfFwNNGonH4pgaVl2AjMNWqlhC/LnOxnWSmoKp+k1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765518272; c=relaxed/simple;
	bh=LrNF5DrQSh+4XqIUsuFId/SlEK1N9x7cQIE4illQNiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNGiGo7FUhV1Nc5bTKraZJfH9kYxYlXRofSe186Yjx9Zzw6QMivFcsNF99/3hgHfuRC/lebTtE69cF0ikA9HV46IiLnA5qSDXLaI4QIm9YpMROqlzMXSsFEB8pZsuaY5RzvaJL8lB2VB/1sjN9uTqzF5gZQgOL63z2JUd+n1SrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pu5rvHq+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pu5rvHq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765518270; x=1797054270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrNF5DrQSh+4XqIUsuFId/SlEK1N9x7cQIE4illQNiA=;
  b=Pu5rvHq+8Ai0tmjJRfqlksG6Cgf48R314dbLgVWslyX8QPju2SCmURll
   i3/jojJWYxLMnQ9HSrda5/vO7nZdniHFq7U6G/UzLFO3zrwaEKXK1bbsF
   OdUghzmdQJMXkYUpVJU8Brdy0f/iaGUF+fj+w1pmQbbKEkYXQTVjJ6Gxw
   ZfiIudapiL9Dc4p+Tw9TuJWB7yNgrif67Y0JIkNqVlIPKVRXXxr0PtkdR
   QGyLkWRDkNhe/QknK6QAK39SCI85civh0BTbGh21/Ni+KNCYefDJ34x7n
   s5ZW2JtyGyYFN46tqwQlHni0f5Etr+2c26tYI5aWqI5NZzoga+ljAIok9
   A==;
X-CSE-ConnectionGUID: VQliQeO7QjScn2wyUpDlyg==
X-CSE-MsgGUID: HcfmvAkhT/yow+MRp3FURA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78129705"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78129705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 21:44:29 -0800
X-CSE-ConnectionGUID: yfKMBBVgQDqwA3wcvc2g1g==
X-CSE-MsgGUID: wjG8O3yjR7ypI2ndY381Ug==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 21:44:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTvx2-000000005bl-22Rs;
	Fri, 12 Dec 2025 05:44:24 +0000
Date: Fri, 12 Dec 2025 13:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] kernel/time/hrtimer.c:120:1:
 sparse: sparse: symbol '__pcpu_scope_hrtimer_base_csd' was not declared.
 Should it be static?
Message-ID: <202512121333.FX9Ntqe2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eed7f8d4a5572c294712b683d6b4890a3b5e1267
commit: 33f3d212e8d80da8f8fb647de5199976d1fc93dd [0/1] ANDROID: KMI: hrtimers: move out hrtimer csd
config: i386-randconfig-061-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121333.FX9Ntqe2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121333.FX9Ntqe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121333.FX9Ntqe2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:120:1: sparse: sparse: symbol '__pcpu_scope_hrtimer_base_csd' was not declared. Should it be static?

vim +/__pcpu_scope_hrtimer_base_csd +120 kernel/time/hrtimer.c

   119	
 > 120	DEFINE_PER_CPU(call_single_data_t, hrtimer_base_csd) =
   121		CSD_INIT(retrigger_next_event, NULL);
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
