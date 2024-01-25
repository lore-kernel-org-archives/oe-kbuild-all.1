Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240A36B10
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706185178; cv=none; b=gIiK7DxirAhpSFMG6pAbVVIBdTjLsPWxP0TBMVSktyig24Z7+Aj2SMvFdeGQjaAJny3DBZhybbrdH6jffbIFGt+1tUVERndUj0j8S1ickqDG7ytfZ1FQozIayNuheBVuw+ZyLL4VXVjfocGqXsSrRsrCo+1nUPl2xEM3J+Tn15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706185178; c=relaxed/simple;
	bh=tsZXtWERdeWVdqynNap3XuXhw0MvaiWzdMoibjoyyS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGruvGCyfIuS+dnae0Xo6UZ9gg0LxhaIS/p75ePnM9QllXWKYHwRMDGD+pjWz31ATjLc6UxFXZFVsi7I+S7Y0NOv7Ujl/Fb19cDMdh10FVfT386i1NjG/mDT7zywiZTVhJAtGpmwTHLucs2xgXmgqjj6x3ZiGyCx2+RkaWbULNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YI8kKqJ8; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YI8kKqJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706185176; x=1737721176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tsZXtWERdeWVdqynNap3XuXhw0MvaiWzdMoibjoyyS0=;
  b=YI8kKqJ8Rn8C0GJG63w0C4F3AT58XHyyK79voEqlN5WtL/6WDaj5ym+/
   DgwtdpFxqmMa+/pS1xgA/nqdBjdizA8FZFEE5EvjhdwTtnRz3DlIPU+4p
   P+QqHsAtwRntMCb73SRduPeXX2zh3VjpAAGHAV8lhdooGzE9EYFgZnxiH
   /LT6e/C/jo+Qe6BjE1cxNoCQAg8Yp3M1ebzezYi2VIcG2M9j6Mrs7Nr3B
   qdVVMnO007f5pTyvai8pWnFiAQsFiUhw0tFAXSXt5o3uvTnAUWyaujpj0
   o/c9Gx8sC3sYi7KiusomNXWvknLkbKV3ksAYQGuUyov8t1mwdtKejCm5I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399307619"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="399307619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2395547"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2024 04:19:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSyhg-0008xp-0T;
	Thu, 25 Jan 2024 12:19:32 +0000
Date: Thu, 25 Jan 2024 20:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2629/2767] include/linux/resctrl.h:291: undefined
 reference to `lockdep_is_cpus_held'
Message-ID: <202401252038.VOiTn1TA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6188d51075eac8cf7cf6909fec1e73fbc51aa29b
commit: c054efea286659a6504fdeafc0a611c6a3b124cc [2629/2767] x86/resctrl: Claim get_domain_from_cpu() for resctrl
config: x86_64-randconfig-012-20240125 (https://download.01.org/0day-ci/archive/20240125/202401252038.VOiTn1TA-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401252038.VOiTn1TA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401252038.VOiTn1TA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `resctrl_get_domain_from_cpu':
>> include/linux/resctrl.h:291: undefined reference to `lockdep_is_cpus_held'
>> ld: include/linux/resctrl.h:291: undefined reference to `lockdep_is_cpus_held'
>> ld: include/linux/resctrl.h:291: undefined reference to `lockdep_is_cpus_held'


vim +291 include/linux/resctrl.h

   274	
   275	/*
   276	 * Caller must be in a RCU read-side critical section, or hold the
   277	 * cpuhp read lock to prevent the struct rdt_domain being freed.
   278	 */
   279	static inline struct rdt_domain *
   280	resctrl_get_domain_from_cpu(int cpu, struct rdt_resource *r)
   281	{
   282		struct rdt_domain *d;
   283	
   284		/*
   285		 * Walking r->domains, ensure it can't race with cpuhp.
   286		 * Because this is called via IPI by rdt_ctrl_update(), assertions
   287		 * about locks this thread holds will lead to false positives. Check
   288		 * someone is holding the CPUs lock.
   289		 */
   290		if (IS_ENABLED(CONFIG_LOCKDEP))
 > 291			lockdep_is_cpus_held();
   292	
   293		list_for_each_entry_rcu(d, &r->domains, list) {
   294			/* Find the domain that contains this CPU */
   295			if (cpumask_test_cpu(cpu, &d->cpu_mask))
   296				return d;
   297		}
   298	
   299		return NULL;
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
