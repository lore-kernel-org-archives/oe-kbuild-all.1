Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B93E2CA6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLh3vFx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705176618; x=1736712618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UGK9OK4fdrrR1TDykiA/t7PeCvcpKoRbrCxCKrwWIm0=;
  b=XLh3vFx8oT0ErIOa0ytgWU/DsrFEOPPhi9ast/qj5efVGH4It3e79plL
   /e4xIVN7bEAvjexbtkX3ESP8WJOs49CQgmLVMCGJGz2xoZe3DJ9Ex2TBg
   +TWrlRKBtSB7T1ZVBPUDG5bwo/AcS+AmCKAPB0p3DYkmz379ZQvRAYYO/
   EsC/Qn9t4VRcnQGIgUvir31Q4xCi2Njje/eu8g8OtgvzW8mZmkbPjQOzQ
   XA/SMfyN6y5h8hyR0pkaPy4UVtGOKVXl9p/tiynVoR3zV87aJkmxkwuZY
   rDfHVhFti3/2w+7yxD1wE5tvCvk7Kxu33vWs5t9rgDrDKk/aNLsW45Dxc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="396544088"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="396544088"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 12:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="786701351"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="786701351"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2024 12:10:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOkKc-000As0-0B;
	Sat, 13 Jan 2024 20:10:14 +0000
Date: Sun, 14 Jan 2024 04:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 7/9] percpu-rcuref: Add basic infrastructure
Message-ID: <202401140450.1tm7JftD-lkp@intel.com>
References: <20240110111856.87370-7-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110111856.87370-7-Neeraj.Upadhyay@amd.com>

Hi Neeraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ab27740f76654ed58dd32ac0ba0031c18a6dea3b]

url:    https://github.com/intel-lab-lkp/linux/commits/Neeraj-Upadhyay/doc-Add-document-for-apparmor-refcount-management/20240110-192850
base:   ab27740f76654ed58dd32ac0ba0031c18a6dea3b
patch link:    https://lore.kernel.org/r/20240110111856.87370-7-Neeraj.Upadhyay%40amd.com
patch subject: [RFC 7/9] percpu-rcuref: Add basic infrastructure
config: i386-buildonly-randconfig-003-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140450.1tm7JftD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140450.1tm7JftD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140450.1tm7JftD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/percpu-rcurefcount.c:112: warning: Excess function parameter 'release' description in 'percpu_rcuref_manage'
>> lib/percpu-rcurefcount.c:112: warning: Excess function parameter 'gfp' description in 'percpu_rcuref_manage'


vim +112 lib/percpu-rcurefcount.c

   102	
   103	/**
   104	 * percpu_rcuref_manage - Switch an unmanaged ref to percpu mode.
   105	 *
   106	 * @rcuref: percpu_rcuref to initialize
   107	 * @release: function which will be called when refcount hits 0
   108	 * @gfp: allocation mask to use
   109	 *
   110	 */
   111	int percpu_rcuref_manage(struct percpu_rcuref *rcuref)
 > 112	{
   113		if (WARN_ONCE(!percpu_rcuref_tryget(rcuref), "Percpu rcuref is not active\n"))
   114			return -1;
   115		if (WARN_ONCE(llist_on_list(&rcuref->node), "Percpu rcuref already managed\n")) {
   116			percpu_rcuref_put(rcuref);
   117			return -2;
   118		}
   119		percpu_ref_switch_to_percpu(&rcuref->pcpu_ref);
   120		/* Ensure ordering of percpu mode switch and node scan */
   121		smp_mb();
   122		llist_add(&rcuref->node, &pcpu_rcuref_head);
   123		return 0;
   124	}
   125	EXPORT_SYMBOL_GPL(percpu_rcuref_manage);
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
