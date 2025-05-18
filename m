Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB14A957
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560081; cv=none; b=eMc6CttWK0oh9KhHuQbVA31ZsiuhLW3DAyKEIyZ13M9Q9wa/WtQKXG32w0ZkVAAfjAidTulzH3LXlUMzPP2x6eJxiUsYsKUkJjEpjCjyauxOS2yJzH1RilDBdghPdkbyKtgv9akocQY6k+4x46/CPxtIR4GYaaDlPVOiSMtsjyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560081; c=relaxed/simple;
	bh=/rpF/UB703SBO2SiRhxkzVTwKc0l0m6a6Hll4eEK5MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXmpouG48gHr8edwvIEwT8tH9uPXTUWS7jQUtvkJqm9oM0Eym/iQCSFcryTXWkAkIhax5wVmZpwmjmahX3PXJhkdd8iVd9afTkYHymw7STdw1RWv+E4HAkdvgYPnSa4u2KWET9U5YcZoOhZqbaEZja/YQDqtS54U2gl3QxZhgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIBWWol0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIBWWol0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747560079; x=1779096079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/rpF/UB703SBO2SiRhxkzVTwKc0l0m6a6Hll4eEK5MQ=;
  b=kIBWWol0J5SkaC5hjKoLdVyUlnfANoZ4gxUMXDdy29snevVZxhgs31zy
   MSOHBhAlJwPfkPlU/gX5NnicLtOZ6BWbzz/K2J5ejdqxya3zKilElqAli
   Z4/3QlUWKAbBTuMDZ7gdpOcOZuu9t5O3TZDSSVIbHji6FHF6fQrgSZjtn
   PB03h/MP7U4bq9XYb5uFjE//9qbuEwLd8gdfrxqhjjnQbETw9XsYKqMyo
   ZiZjMZ+2QlVPywVnmrr90lInMgFvKREoCaU8uVVZLMC6b29WpyeqRY4lw
   nXGDMWsu+s9JG4hYUENBrlybB5p1C/9NBrlbU2KJFTAt4KVFA4sgZ+jtc
   g==;
X-CSE-ConnectionGUID: JsSjmWgOQL+3dfEcMPp1zA==
X-CSE-MsgGUID: dpUSqh6ARMqqT6IrqB/frQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="66886093"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="66886093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 02:21:17 -0700
X-CSE-ConnectionGUID: ppNNtQEbTfaqIggFj6VFEw==
X-CSE-MsgGUID: I8cm8OJ2ThajRfZmbuixyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139594353"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2025 02:21:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGaCm-000KiZ-0P;
	Sun, 18 May 2025 09:21:12 +0000
Date: Sun, 18 May 2025 17:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, naveen@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc/perf: make isa207_pmu_format_group struct
 static
Message-ID: <202505181711.k5ONrdnI-lkp@intel.com>
References: <20250518044107.39928-2-maddy@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518044107.39928-2-maddy@linux.ibm.com>

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master powerpc/topic/ppc-kvm v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-perf-make-isa207_pmu_format_group-struct-static/20250518-124244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250518044107.39928-2-maddy%40linux.ibm.com
patch subject: [PATCH v2 2/4] powerpc/perf: make isa207_pmu_format_group struct static
config: powerpc64-randconfig-002-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181711.k5ONrdnI-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181711.k5ONrdnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181711.k5ONrdnI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64-linux-ld: arch/powerpc/perf/power8-pmu.o:arch/powerpc/perf/power8-pmu.c:199: undefined reference to `isa207_pmu_format_group'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
