Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0948F56
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707102556; cv=none; b=sEb7RgcKyjZgQjgtMeAa9zXFCNdgJOgkQtmKxkn5Qb0aqRgeflcDNyeL0xu5w7XmAzwtdcmigp/g5aHCSVcC/k14yvsjfGKjpULde7eWFEtB04TxX3D/yxzvwCFlE+g6BoI73mj+NZKyLx5QL0Bpt/cwjLqN+uBn5Kjg/mUlbD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707102556; c=relaxed/simple;
	bh=SZyMPSgOZ56GBwOPXTzYASZ88ieNjvabixYu2gwArKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6lWggAFzUiPS56ciS9Z8KLoQq2rlWMSqEvqY+o4Akw5N9mRR2bOG48WkbqdlfEeHQOC1LeHK/ik18IABgu9ieSGRCVkwZk4Tyu0JWgbMkfDQl+XO6atqbTQx85o4F661n7MMpckzGGAqb+mY3gyxoCJYUUGA35rmGZQp7LbEqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2vcNqSO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2vcNqSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707102555; x=1738638555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SZyMPSgOZ56GBwOPXTzYASZ88ieNjvabixYu2gwArKk=;
  b=R2vcNqSOgZdnovNJWjuFsGUmFMav7vcOePOqfAqvZQCS+R6fVCI2m4HM
   WFCjCPWZy0m2i5BoCLssl7bFV44BHCQdmr5nJUDZsmAZZ0ANgcFSSNZne
   fOwP+UknTYOBBv93TFmNFGKKEqKfqv3B4u4Y3fZefehZWLB5fkP+tpC2e
   SSFUmmAyCnkFpKYHUyrz8yzoSj/2krJ+JK3O4clWIw6wNSJ25TJj+/1Yw
   a7zGiRe2FbrFA20HVuWDpfUSswAaNgszgkx+keBEO6t8PutUpNGxmzptg
   /u8g7LMIfCUOkh+GzrofhRZHTwFEWIIqdFvL5Y2DUhOunWJtcCBXfxGPB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="594809"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="594809"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 19:09:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="895179"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2024 19:09:10 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWpM3-00006K-2p;
	Mon, 05 Feb 2024 03:09:07 +0000
Date: Mon, 5 Feb 2024 11:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>, ast@kernel.org,
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, tj@kernel.org, void@manifault.com
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: Re: [PATCH v5 bpf-next 4/4] selftests/bpf: Add selftests for cpumask
 iter
Message-ID: <202402051121.y4w06atm-lkp@intel.com>
References: <20240131145454.86990-5-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131145454.86990-5-laoar.shao@gmail.com>

Hi Yafang,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Add-bpf_iter_cpumask-kfuncs/20240131-232406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240131145454.86990-5-laoar.shao%40gmail.com
patch subject: [PATCH v5 bpf-next 4/4] selftests/bpf: Add selftests for cpumask iter
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051121.y4w06atm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051121.y4w06atm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/cpumask_iter_success.c:61:2: error: incomplete definition of type 'struct psi_group_cpu'
      61 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/cpumask_iter_success.c:39:27: note: expanded from macro 'READ_PERCPU_DATA'
      39 |                 psi_nr_running += groupc->tasks[NR_RUNNING];                                    \
         |                                   ~~~~~~^
   progs/cpumask_iter_success.c:13:21: note: forward declaration of 'struct psi_group_cpu'
      13 | extern const struct psi_group_cpu system_group_pcpu __ksym __weak;
         |                     ^
>> progs/cpumask_iter_success.c:61:2: error: use of undeclared identifier 'NR_RUNNING'; did you mean 'T_RUNNING'?
      61 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
         |         ^
   progs/cpumask_iter_success.c:39:35: note: expanded from macro 'READ_PERCPU_DATA'
      39 |                 psi_nr_running += groupc->tasks[NR_RUNNING];                                    \
         |                                                 ^
   /tools/include/vmlinux.h:28263:3: note: 'T_RUNNING' declared here
    28263 |                 T_RUNNING = 0,
          |                 ^
   progs/cpumask_iter_success.c:80:2: error: incomplete definition of type 'struct psi_group_cpu'
      80 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/cpumask_iter_success.c:39:27: note: expanded from macro 'READ_PERCPU_DATA'
      39 |                 psi_nr_running += groupc->tasks[NR_RUNNING];                                    \
         |                                   ~~~~~~^
   progs/cpumask_iter_success.c:13:21: note: forward declaration of 'struct psi_group_cpu'
      13 | extern const struct psi_group_cpu system_group_pcpu __ksym __weak;
         |                     ^
   progs/cpumask_iter_success.c:80:2: error: use of undeclared identifier 'NR_RUNNING'; did you mean 'T_RUNNING'?
      80 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
         |         ^
   progs/cpumask_iter_success.c:39:35: note: expanded from macro 'READ_PERCPU_DATA'
      39 |                 psi_nr_running += groupc->tasks[NR_RUNNING];                                    \
         |                                                 ^
   /tools/include/vmlinux.h:28263:3: note: 'T_RUNNING' declared here
    28263 |                 T_RUNNING = 0,
          |                 ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
