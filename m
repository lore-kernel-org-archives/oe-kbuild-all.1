Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C0E2FABEB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120536; cv=none; b=N18d9mhnYBBC+IBDT8gsbdJeWle1ernJ7mwQxFVhQFtO01jueo3bwcqJQF8lT69cou5U3kQA3K8qabiwzScRMxo8My6ei3J0Q/F3h1tfCJsjC92tsCuu90mJqmE91iOWjgYCfJY/gl5B4ECVusyKM95b15CGkEYCuhzTbaTRhZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120536; c=relaxed/simple;
	bh=zzqiWB87FyQa0pN6w8XPlzfV0xfLBOYTNruWpuHpnm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbxtktRQkJa5nu+rZQDhEOR3o6d52hH2UzJVeCEG1w04KFyefXazC7314k0T53gl7+3B5hIknjW3OOFgNPnpGtRUR09MPIgwo3NZdNEu7o6pYKGj/P92M5ziWdop+ct3hPbZCgVtj8xzNq+DHrYWGUKVZDBSVtB51Vrun+CXiXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eD2OWw6K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eD2OWw6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755120535; x=1786656535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zzqiWB87FyQa0pN6w8XPlzfV0xfLBOYTNruWpuHpnm4=;
  b=eD2OWw6Kh5xoG8BC19MCY8XgxJOyavueynbqUPeiCU1gzDggx88hj8M+
   /WwbQElx5ekbF4hCcH39TWWaLYMbiqbFJtCV1TJ6y++2j113DV6zhuAKm
   YBed4IeagZfS8YzvsHL6vMBwSjSjn3Uj6lzrziJiQrDXRDO4EiabfuRAD
   4WvVzA1454aq+T50QWh2kQuvuVhpNTEZ7w4HauTWmR6g4vo0WgkN/LAZM
   hLXM5sY8VJROE/jgIxW6d7lj2TDwjJ9S/iViwnZGtF5m48DIZDONy/vWx
   w14f14fV5Dv8T+8YMWbjVNWPANsNOzFLYeo3VJ+FV7o73uPRn2o65iT4d
   A==;
X-CSE-ConnectionGUID: MjSGQ3T/TgO53whEgvL+rg==
X-CSE-MsgGUID: lKnSrbt9Rfm0LYpz3nfKUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56642687"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="56642687"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 14:28:54 -0700
X-CSE-ConnectionGUID: 48PBhMurSmOLe5EQRyQu2g==
X-CSE-MsgGUID: +Ffc00+5TZuZ8Q0pPlYbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166957056"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 14:28:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umJ1d-000AKe-0f;
	Wed, 13 Aug 2025 21:28:49 +0000
Date: Thu, 14 Aug 2025 05:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, longman@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, lujialin4@huawei.com,
	chenridong@huawei.com, christophe.jaillet@wanadoo.fr
Subject: Re: [-next v2 3/4] cpuset: separate tmpmasks and cpuset allocation
 logic
Message-ID: <202508140524.S2O4D57k-lkp@intel.com>
References: <20250813082904.1091651-4-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813082904.1091651-4-chenridong@huaweicloud.com>

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/cpuset-remove-redundant-CS_ONLINE-flag/20250813-164651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20250813082904.1091651-4-chenridong%40huaweicloud.com
patch subject: [-next v2 3/4] cpuset: separate tmpmasks and cpuset allocation logic
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250814/202508140524.S2O4D57k-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140524.S2O4D57k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140524.S2O4D57k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/cgroup/cpuset.c:422 function parameter 'pmasks' not described in 'alloc_cpumasks'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
