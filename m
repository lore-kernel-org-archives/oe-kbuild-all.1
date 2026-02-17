Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632602E040E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316731; cv=none; b=g/lg1PnsP7uTg1yhhkeA2mOPbYcGRLKbOewFf7AKQfyNTBsvRVVrjQlpEHW2I68y9liojhW7slyuDf37v87KsdztJ0XiuDgvzsftIFcejDPefMlLFAS0i/VPAqJFjMN9enbyyUX7DFFo1n73xkNuE5PW1VJ7C287vDYRn+7UF8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316731; c=relaxed/simple;
	bh=pQkHkYZ1NIDtuXjQUxfrFmR4hRGch1YYd/iG/SkIjEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkTK9C472arhJj+Xy/4weOoyuiEGj+lwyiuMdTfhlLWR9UQtbvP8bkX1iT2C3VYxFfiqys8sT6g9JpJ9/loCzrQM9PItbaZtQPu3M1Vz2N80ptzzOO+ewrExe5z5Dch9qNvbvc/888siBzGw8UpNoceo0MBDUPChE8LINSFfV2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSE25i3C; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSE25i3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771316730; x=1802852730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pQkHkYZ1NIDtuXjQUxfrFmR4hRGch1YYd/iG/SkIjEM=;
  b=MSE25i3C811j3yV0tuuAeIpmhr/8FC/ELuk6i0NR1+kIvL0JBrrMJksP
   eujcdx1G7ZqB69lfiDy9Gk0yhXdgf2LMsnGTvUf7b/441Jbp57MZZ9ysj
   QIeEsKvrsvLiq/ZgN0HTI4wW+vj6fdGJvUqrFo7eptWB4UqhHDAX1A6p2
   C0cxBSt7xzotCUPHabTu62GvGqEZkE/XPB+ifg11zicnoSJ7mCcNNOhtQ
   mYuGjr92fwSJC1UwN+kswy6dCJnIIMuxnup8pJrYQEvQm+YjaLmErBTOJ
   7o07QtE40RlWRttp7mw0ECinMiX73X4/G4Se7aNQvupJLJ9xId4xhB5Dh
   A==;
X-CSE-ConnectionGUID: 0BDE0Eb2SL6xz0pWw/EK2Q==
X-CSE-MsgGUID: 9sCi+WU9Q9e2fZNy9RtN7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71578839"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="71578839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:25:29 -0800
X-CSE-ConnectionGUID: JMXxD0GwRtaPLE+zhyDIaw==
X-CSE-MsgGUID: /14Jo4HgRKyx3O8Deh6sMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="244409259"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 00:25:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsGOb-000000010ky-3V9j;
	Tue, 17 Feb 2026 08:25:25 +0000
Date: Tue, 17 Feb 2026 16:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] kexec: optimize crash hotplug by filtering
 redundant FDT updates
Message-ID: <202602171625.BjsqUbLO-lkp@intel.com>
References: <20260216171456.527608-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216171456.527608-2-vishalc@linux.ibm.com>

Hi Vishal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes tip/x86/core akpm-mm/mm-everything linus/master v6.19 next-20260216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Chourasia/kexec-optimize-crash-hotplug-by-filtering-redundant-FDT-updates/20260217-012054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260216171456.527608-2-vishalc%40linux.ibm.com
patch subject: [RFC PATCH v1] kexec: optimize crash hotplug by filtering redundant FDT updates
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171625.BjsqUbLO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171625.BjsqUbLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171625.BjsqUbLO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kernel/crash.c:511 function parameter 'cpu' not described in 'arch_crash_handle_hotplug_event'
>> Warning: arch/x86/kernel/crash.c:511 function parameter 'cpu' not described in 'arch_crash_handle_hotplug_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
