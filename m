Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E791BC58
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 03:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756871008; cv=none; b=HfuhpaW4MmhY/pel/J2xa7GM8A1HvjI5ok1rzMj7o6zQXPmo+/KokX5i1SyHVLqOQpN92F8ChvCusG7vHEiBfZY10geJkamA1De6FiT8EvjRVLXzchR3mjOcwfzvCd9BYRWJm8vHL3YcP/4j/uxH9cMNKZBg2VlDZF6By/K9W4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756871008; c=relaxed/simple;
	bh=rnm2UNqoDEROliaBHR5iVGfc4ZfvT29n42crz2qIQdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPMdq2XeoxWAgyF5yVWv7Uu6f0onYZVRUBPNjxo2qcPEg7O4NkNkHvqLkH0gMgM9RMd4MPm1IvFBw+KdQgo9dQFQG4kfaXoDBUVZG+xaP2I4RyYMBVBrvjeVHITapPR8gc3QHB3Hr5VY0Y0NUVa5kaD/XOF4mh68AGU6/UOIJas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqARbQmo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqARbQmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756871006; x=1788407006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rnm2UNqoDEROliaBHR5iVGfc4ZfvT29n42crz2qIQdY=;
  b=TqARbQmouxZkrZf2d4uLT4fBdEgOuVXFKeYUEY/5fHRo6iq9tX/yfpQB
   z6nHD7ZfCEDwcZQhUM0zo8Xs3JGAeg95AxZJD1ACGbBMVddECA5pqO/W0
   4ynNGLsSAq4bFlt+HJBfjRY45AxUkuPlDaEDGPqUS1mvje8TtawndkYfF
   qOPBr5OF631L589oul8NG+vP4zDr/yII8LfKeMDFMcioLDMeTEilROp4Z
   7ftmVnHbJc2l+6avqXB85k+QDAE4Hj8F7ykEJH2nbnuAOb7wmHmeZmQHO
   VwYIGr8YcDCLCc25zbioyw+gxeA3zY3TzYoFNndDIue4pcDJ8jsT/UTP4
   w==;
X-CSE-ConnectionGUID: 2mfzeibETBe9gt7P2HamgA==
X-CSE-MsgGUID: uw2aaOPER+K2Sh5WytUpNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58871352"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="58871352"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 20:43:24 -0700
X-CSE-ConnectionGUID: 6zkq3T5iSH+aLOrCQS4xcA==
X-CSE-MsgGUID: hMSNeAj3QBS1oclfRQEXAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="202362596"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Sep 2025 20:43:23 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uteP2-0003KN-2B;
	Wed, 03 Sep 2025 03:43:20 +0000
Date: Wed, 3 Sep 2025 11:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Shashank A P <shashank.ap@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fs: quota: create dedicated workqueue for
 quota_release_work
Message-ID: <202509031153.0ACADDn6-lkp@intel.com>
References: <20250901092905.2115-1-shashank.ap@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901092905.2115-1-shashank.ap@samsung.com>

Hi Shashank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.17-rc4 next-20250902]
[cannot apply to jack-fs/for_next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shashank-A-P/fs-quota-create-dedicated-workqueue-for-quota_release_work/20250901-173749
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250901092905.2115-1-shashank.ap%40samsung.com
patch subject: [PATCH] fs: quota: create dedicated workqueue for quota_release_work
config: loongarch-randconfig-r112-20250903 (https://download.01.org/0day-ci/archive/20250903/202509031153.0ACADDn6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce: (https://download.01.org/0day-ci/archive/20250903/202509031153.0ACADDn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509031153.0ACADDn6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/quota/dquot.c:166:25: sparse: sparse: symbol 'quota_unbound_wq' was not declared. Should it be static?

vim +/quota_unbound_wq +166 fs/quota/dquot.c

   164	
   165	/* workqueue for work quota_release_work*/
 > 166	struct workqueue_struct *quota_unbound_wq;
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
