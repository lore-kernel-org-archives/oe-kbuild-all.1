Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BA372605
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 04:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749788386; cv=none; b=FWQklVdVOguzaYGltgZZ7zW8uvSr155+sawS4ygEcKhYXgi0PkT7gi5A+hLAyh57RqKkAnEF4PGzX0IhUuJdekv+dfQpkfeEZSEeC/PhhsRoPWIhxB7oSbfe64+WZ0fIy8F+RhB+r7zcgvpgTr2dDrVNTBm7OPBVLf64hsUhxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749788386; c=relaxed/simple;
	bh=annr5287KVQy3aX+3oqINn+98t2bIxY2DpLxsg1KcN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lplv/H1G/4tOSXXGjwtbeFBEdWH/cFhF50YXq0EhCi92LTjeWILFR4eAosZW0BcXcKBJlKxQqf6CyMZiJJ3OVEtzubZcIZ/akXf5RLg6m6uBcT1F+1XtXu4qEw+qy2uHGonkOYZxaXV+gy49IZBANyQKnhf4qv8aM+AZCZs3gXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQouWto5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQouWto5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749788385; x=1781324385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=annr5287KVQy3aX+3oqINn+98t2bIxY2DpLxsg1KcN4=;
  b=UQouWto5y/KAcZupahP+lcaupT1udUZwiZ2zFAS9YAfZtDteZMvVgj4k
   vNKiQxCUKRgrYqtml/zWku6bmrZgzJXKFqTWX9EuJK9MlUJ2VoK/26y3v
   TnCNxVgsWQv8/bpqCH0NebusxA4KRKNZZrm2kH281730jmnEWHw6jbTcv
   f6pB0ZoG2pJ4OR5tuo4DxGuKLqOGkItTrtDw36vUrY7FUS9RDpIIt5GLA
   tDWcZKnY5TW3EzpvPFjU7laUooFGLsoAoaQP96ZJA/TMlFfabOOhrfO29
   jI04pVp40oJAPmjFEzz+MLemw3Cw1JvSn7xRNcYpUbAgacjVZFAh4n0N/
   A==;
X-CSE-ConnectionGUID: ocZToYZdTOuAREP9K6tI2Q==
X-CSE-MsgGUID: wDtSRK5jR+OSVYF20z4z4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="74523573"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="74523573"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 21:19:44 -0700
X-CSE-ConnectionGUID: MSjaM6+rQPqsH8DUv+NFXA==
X-CSE-MsgGUID: e5kCg890SoyuQ3e83DZWLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="147594808"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2025 21:19:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPvt9-000CEI-0g;
	Fri, 13 Jun 2025 04:19:35 +0000
Date: Fri, 13 Jun 2025 12:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
	reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, paulmck@kernel.org, rostedt@goodmis.org,
	thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org,
	seanjc@google.com, thomas.lendacky@amd.com,
	pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
	yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
	peterz@infradead.org, kan.liang@linux.intel.com,
	mario.limonciello@amd.com, xin3.li@intel.com, sohil.mehta@intel.com
Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable
 io_alloc feature
Message-ID: <202506131104.d1oo8NWe-lkp@intel.com>
References: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc1 next-20250612]
[cannot apply to tip/x86/core aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250612-053050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger%40amd.com
patch subject: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable io_alloc feature
config: i386-randconfig-061-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131104.d1oo8NWe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131104.d1oo8NWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131104.d1oo8NWe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/resctrl/rdtgroup.c: note: in included file:
>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition

vim +553 include/linux/resctrl.h

48e63934badb71 Babu Moger 2025-06-11  545  
48e63934badb71 Babu Moger 2025-06-11  546  /**
48e63934badb71 Babu Moger 2025-06-11  547   * resctrl_arch_get_io_alloc_enabled() - Get io_alloc feature state.
48e63934badb71 Babu Moger 2025-06-11  548   * @r:		The resctrl resource.
48e63934badb71 Babu Moger 2025-06-11  549   *
48e63934badb71 Babu Moger 2025-06-11  550   * Return:
48e63934badb71 Babu Moger 2025-06-11  551   * true if io_alloc is enabled or false if disabled.
48e63934badb71 Babu Moger 2025-06-11  552   */
48e63934badb71 Babu Moger 2025-06-11 @553  inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
48e63934badb71 Babu Moger 2025-06-11  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
