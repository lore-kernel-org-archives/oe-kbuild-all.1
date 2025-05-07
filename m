Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814384C9D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610262; cv=none; b=hg5oKb2xD9jVRzHQphKTfcGW1sVcvE7LjJ8q5cPnjQlRDaZipN7MzMb3jMgXxVaPw+LsaYAXQAJMYzQ3Haia3a7zV5xgofyThkNtGxu7ake+PoJOyE6SJWewVr8g4lyn6bi8MJqw0TsPZLvLKRl9k4d8muUcyBD8H97DjwOyWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610262; c=relaxed/simple;
	bh=qdJYH0CepHN/r0nFnr2mgOUWFSg/9SknGOeLctIB48g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFGZO7k1ot/5Ih/U10T7lbcMmWcZVQ30oPS+OJ7DYhHGdouQC88lSyL84/3xm8R3dDc3iV6zZvoUYJnjPauwkjKaWzxPh4DBSykHiXtXxSQoNHafi8LzSp0p83InOfNvKelU8jsTn2uLdB+yL7+V43ypbUkaPTzLj6aSbYhTYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5P3chYG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5P3chYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746610261; x=1778146261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdJYH0CepHN/r0nFnr2mgOUWFSg/9SknGOeLctIB48g=;
  b=Y5P3chYGcL1f2kdH4iFm3cw1xjSkBoCtJ8C0UD6eOiwOejU5eNy0q5TU
   kN8eax0KzG7tpu7M/4ne3Rv8PO4lCrah1vAUlLV24yqKITjkObx/IEcdx
   2yyBm3xHtdR40Oil7xFuRaL8RM2Ajkzc/AktvpT7h93qM8A8gn3KAcPvC
   HIu1IjoGzsI/yp8vjnAZ3OUmbmUvL/ODOsxBjOGbAgX86QaEEWrAuoLGV
   6hAwFllVycietGOToevMxaU8oEwSi4HrueJhfBrqqlMX1xLBbT0JVzpST
   /BqLqFzuvyxxfk35tzUkL6nnHjFkivttPqipByjDgc1JQp3pCj9cxwdNm
   A==;
X-CSE-ConnectionGUID: O8lkWzPjScuASAC5sNmK0Q==
X-CSE-MsgGUID: v+FiJG2UTxSf70kO2gqsPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58524520"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58524520"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:31:00 -0700
X-CSE-ConnectionGUID: yl2DZhzLTOGDqLNoqgh8UA==
X-CSE-MsgGUID: Db0BmBfaSra7ZvlhnqUJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136913431"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2025 02:30:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCb75-0007Vh-0X;
	Wed, 07 May 2025 09:30:51 +0000
Date: Wed, 7 May 2025 17:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, tony.luck@intel.com,
	reinette.chatre@intel.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, babu.moger@amd.com, corbet@lwn.net,
	x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
	paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com,
	ardb@kernel.org, gregkh@linuxfoundation.org,
	thomas.lendacky@amd.com, mario.limonciello@amd.com,
	perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
	xiaoyao.li@intel.com, kan.liang@linux.intel.com, riel@surriel.com,
	xin3.li@intel.com, xin@zytor.com, sohil.mehta@intel.com,
	ak@linux.intel.com, ebiggers@google.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v4 5/8] x86/resctrl: Add user interface to enable/disable
 io_alloc feature
Message-ID: <202505071703.3upyWMIB-lkp@intel.com>
References: <963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc5]
[cannot apply to tip/x86/core next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250422-064804
base:   linus/master
patch link:    https://lore.kernel.org/r/963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger%40amd.com
patch subject: [PATCH v4 5/8] x86/resctrl: Add user interface to enable/disable io_alloc feature
config: x86_64-randconfig-r131-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071703.3upyWMIB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071703.3upyWMIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071703.3upyWMIB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1975:42: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:1975:42: sparse:     expected char const *
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:1975:42: sparse:     got char const [noderef] __rcu *name

vim +1975 arch/x86/kernel/cpu/resctrl/rdtgroup.c

  1968	
  1969	static const char *rdtgroup_name_by_closid(int closid)
  1970	{
  1971		struct rdtgroup *rdtgrp;
  1972	
  1973		list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
  1974			if (rdtgrp->closid == closid)
> 1975				return rdtgrp->kn->name;
  1976		}
  1977	
  1978		return NULL;
  1979	}
  1980	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
