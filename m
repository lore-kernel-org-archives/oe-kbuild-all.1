Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815592153D2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613598; cv=none; b=SQm2e3olcHP9lgzYQjo9gdt9wP0kpMXYrHLlpUKA530Z7/gjq8J6UdCvD0IuhKjUEZR+m9NyLiRGwVhRoX92DPwAunyCKwf2/XLefq02jdSJq/LxfbycBVy6lWg2n4/Bt4hjnR/AswJGmUqmg7g4DPiIqSDBDYpGUjTXLJ8+JuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613598; c=relaxed/simple;
	bh=VMDAaRv49Pn2CU3Twm7LhYZwvYteakniDBT4Tl3skVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO+H2uy2uV/LWe92EQhKcokrNERayN4nkmi2ES2b8eglF4ymyP/1l7eT0Tku3yYUloxslyKiXMXLKqt+M/g9kzrpQ5a3gnSBkoT3kYLK5/Mcf78UX/h615E4VKuafcipS3f0tAktsgzdt41Lw3+v4onabKgrY9k32lvg0ItwYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXyaNU4Q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXyaNU4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746613596; x=1778149596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VMDAaRv49Pn2CU3Twm7LhYZwvYteakniDBT4Tl3skVQ=;
  b=lXyaNU4QeetnQqinNtXpl3bHwnZCI+hnmyEhmw4DKwLaxYZkSG2lDnh7
   MRiSXjgPnNgRiyg2OwAJH/ZWQO0qKKRpRy9QPT5wlHa72b7x9uqAkKq/K
   doc/MdT4N4jKVnGdU/okRw5CSm6BcNf4A8mDIB+HAgt5DU7z56yFzhhAw
   zW+A6QyuWQtkASSHW7DPsOdsIuUVrF01fnuuLLFHnXSSTRvfYiu9Jtktv
   u5LgwJuXTtywArmoOXcc4Cp/rbcelksEs0cMc2XMHU7k99D9LDm+H/+wB
   j+FGHxbq8l/dTyqlRcRE0x2mKAZDH548b1uQQn7aTMU+eodTKP+jeVrkC
   Q==;
X-CSE-ConnectionGUID: GGINNEbZQZ2yUQdCVvQzCg==
X-CSE-MsgGUID: YKvYuz4sSRyTMKUfLuAoHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48484157"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48484157"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:26:16 -0700
X-CSE-ConnectionGUID: /VK66a+1TXKIlUWEgTMI3w==
X-CSE-MsgGUID: JaCHj4UKRg6O+yu8ewa7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135819761"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 03:26:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbyc-0007av-1f;
	Wed, 07 May 2025 10:26:10 +0000
Date: Wed, 7 May 2025 18:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Dhaval Giani (AMD)" <dhaval@gianis.ca>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dhaval Giani <dhaval.giani@amd.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: Re: [PATCH 2/3] sched/fair: Add a test to test that a task selected
 to run has positive lag
Message-ID: <202505071826.dQRr4AyC-lkp@intel.com>
References: <20250422-b4-eevdf-tests-v1-post-v1-2-35d158254c72@gianis.ca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-b4-eevdf-tests-v1-post-v1-2-35d158254c72@gianis.ca>

Hi Dhaval,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c70fc32f44431bb30f9025ce753ba8be25acbba3]

url:    https://github.com/intel-lab-lkp/linux/commits/Dhaval-Giani-AMD/sched-fair-Introduce-a-new-debugfs-directory-for-EEVDF-tests/20250423-082221
base:   c70fc32f44431bb30f9025ce753ba8be25acbba3
patch link:    https://lore.kernel.org/r/20250422-b4-eevdf-tests-v1-post-v1-2-35d158254c72%40gianis.ca
patch subject: [PATCH 2/3] sched/fair: Add a test to test that a task selected to run has positive lag
config: mips-randconfig-r121-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071826.dQRr4AyC-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071826.dQRr4AyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071826.dQRr4AyC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/eevdf-tests.c:24:6: sparse: sparse: symbol 'eevdf_positive_lag_test' was not declared. Should it be static?
>> kernel/sched/eevdf-tests.c:25:4: sparse: sparse: symbol 'eevdf_positive_lag_count' was not declared. Should it be static?

vim +/eevdf_positive_lag_test +24 kernel/sched/eevdf-tests.c

    20	
    21	/*
    22	 * Test parameters
    23	 */
  > 24	bool eevdf_positive_lag_test;
  > 25	u8 eevdf_positive_lag_count = 10;
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
