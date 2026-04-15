Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4782C34B192
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252063; cv=none; b=lvZZ5+aMXRrtxKO8EEPMooN9VrpIXuWyVoW2FlpNJ0vi1mAYvk1NSkhsMbUGGEksyKqFltVcnqvznRnqUL5qXpFSZcriGEwlRUfJEaqgPCnUf/syiWfJwPoUkT+nsJ/rxnhSZPfDtRWotkbLDllrJ5BwSHvXc1bbJ0g1nuCiVeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252063; c=relaxed/simple;
	bh=GnUQiYR6RcFc756lrmlYngLn7X0Bum9ba/PdkJRoxdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDq17uLQRXyikGzncPQ8frlr4bUDzjOG3I37sGI1/eHPq5tIxyop34daqQO0dkhUgG5PcdMRjA9GpYZl0pJIuoJjFcTRBvQVXLVnKZFd9Q+vHrqSSXKPs/ClzkIC+/ez4j+Z9p7+uwokfyiXJ8EdTSdhz/+CUCnvAWPqgOVcEFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjOso0ez; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjOso0ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776252063; x=1807788063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GnUQiYR6RcFc756lrmlYngLn7X0Bum9ba/PdkJRoxdc=;
  b=fjOso0ezXGg9nq4TTesgjoKhirXQBfC/6sMFWXyOcYR1NKig36Hnhn8s
   XzONR+TOn+VfuoAi7tQe2Uld+m82KTuPgsbIcUjaptmxNBBVaeFDzsdKR
   P3qDUdlWWwUNI3BI+61CBhFIS+TNnhMztImnJHtj0HdoWG6y4wuj4p2FQ
   jYaKPU+MEDX38yxPwRXVV9CNMw/MXfMDbTj1hTLgiUenLHYLVrUYRGPBz
   /cAy9CBKZAgPhd+5U6pvsifm0wEDOzb21TdITzWpt973n28TVjQTgu4mP
   gizRzUfOE6Fv688CetJCPgR3e0etQTU9VMh1r1/9j/h7jyQBPMGkP0Rok
   A==;
X-CSE-ConnectionGUID: JzgL5byGSN+eUOauVYUD9g==
X-CSE-MsgGUID: JKNpcdHtTbCi24Hbwc8BMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="94626265"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94626265"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 04:21:02 -0700
X-CSE-ConnectionGUID: Zb3V2/GOTT+zfPANQRSClQ==
X-CSE-MsgGUID: oHspvkrHTTuKSCuGrvejug==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2026 04:20:58 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCyIi-000000000Qv-06QC;
	Wed, 15 Apr 2026 11:20:56 +0000
Date: Wed, 15 Apr 2026 19:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Yingliang <yangyingliang@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yangyingliang@huawei.com,
	hucool.lihua@huawei.com
Subject: Re: [PATCH -next] mm: make sure freeram is smaller than totalram
Message-ID: <202604151917.t6ckjppJ-lkp@intel.com>
References: <20260413115736.1237680-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413115736.1237680-1-yangyingliang@huawei.com>

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Yingliang/mm-make-sure-freeram-is-smaller-than-totalram/20260415-122059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260413115736.1237680-1-yangyingliang%40huawei.com
patch subject: [PATCH -next] mm: make sure freeram is smaller than totalram
config: arm64-randconfig-001-20260415 (https://download.01.org/0day-ci/archive/20260415/202604151917.t6ckjppJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151917.t6ckjppJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151917.t6ckjppJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmstat.c:884:13: warning: 'refresh_vm_stats' defined but not used [-Wunused-function]
     884 | static void refresh_vm_stats(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~


vim +/refresh_vm_stats +884 mm/vmstat.c

   883	
 > 884	static void refresh_vm_stats(struct work_struct *work)
   885	{
   886		refresh_cpu_vm_stats(true);
   887	}
   888	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
