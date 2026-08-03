Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF3A374169;
	Mon,  3 Aug 2026 09:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748587; cv=none; b=IjjzwRpmyqBZn1Paq4TO0S6ux0DWR6WQuLydMi4pZNRfDzzZc1/q9R3pcot2KumINRb9AVe2mogse0o3xgIiWbSFEvfPgS1fAhu58JZlIpdNd8vPBFY7jMC3g7BYjN+ulQ/HP5mvsjhc9YJswWoFL0j5VI1JI+48G/C+p9yw8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748587; c=relaxed/simple;
	bh=0AWkUrUKVJoqZ6CdD4ZAMmYbznLSh7I0O1/y40Szv8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BisHi7RKa0COUOQ3gFtKaAFZkg2J8sqyFB0fKA1CBoQ/i5b02XSTdqnVZ1nNB/riDxdrcdxyuR2SE3BF2ibt+2bRxrI6+5eVeREPiXXxVai5RNfdMWs86tP69uN0Ey3dkUH/eKgjf0Oc4+lImDRb1eOD/gzUwvw/x+QiQozcZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUWT59rX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUWT59rX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785748586; x=1817284586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0AWkUrUKVJoqZ6CdD4ZAMmYbznLSh7I0O1/y40Szv8c=;
  b=lUWT59rXhD3NrjlVQm0NWQJdj+bumVVzqzH0/pTw4XMI1aVn8ayLSl/b
   5+bUUpaR3jKc2hTjgaxaxlupA+C2nbbUwLtHW52wxysHHOLZwrNi8miaJ
   hZN/HI5kICHiwFP92/e59iHZqFcPqXobh7/Km8OE/G+GD0ef1iDO/sqqt
   JuF+DUpvfY/7dQMM0P1gQtezGajyEqa73Ldnwr9Pxt2O3CndG0mgkOKbL
   UoxdS98uTZkgfx+vek+LwrAfC6vLwZUUys+K7Ur52tgajJSeL+JdkG09t
   8l8Hl9r9MpXNeURaL3pwSf9LHK2G/IUngYpfYlnFg9KaSE1db+jF4NVic
   Q==;
X-CSE-ConnectionGUID: jAE/u3RjQJmFGde9k6pqAg==
X-CSE-MsgGUID: kVbOMdAhTyuzGT80L2mxPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="88809037"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="88809037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 02:16:25 -0700
X-CSE-ConnectionGUID: SNYpZugVRDGsN6PK9n75Ag==
X-CSE-MsgGUID: a2h6LZYISzqfsV60n/Zj8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="261767842"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Aug 2026 02:16:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqomS-000000006aP-2ed0;
	Mon, 03 Aug 2026 09:16:20 +0000
Date: Mon, 3 Aug 2026 17:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?=D3scar_Meg=EDa_L=F3pez?= <megia.oscar@gmail.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?=D3scar_Meg=EDa_L=F3pez?= <megia.oscar@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3] Memory leak error in qxl unbind
Message-ID: <202608031736.7YYw01c3-lkp@intel.com>
References: <20260727114155.69204-1-megia.oscar@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727114155.69204-1-megia.oscar@gmail.com>

Hi Óscar,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.2-rc5 next-20260731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/scar-Meg-a-L-pez/Memory-leak-error-in-qxl-unbind/20260803-140059
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260727114155.69204-1-megia.oscar%40gmail.com
patch subject: [PATCH v3] Memory leak error in qxl unbind
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260803/202608031736.7YYw01c3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031736.7YYw01c3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031736.7YYw01c3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_mgr_fini':
>> drivers/gpu/drm/ttm/ttm_pool.c:1510:9: error: 'backup_fault_inject' undeclared (first use in this function)
    1510 |     if (backup_fault_inject.dname) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:1510:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/backup_fault_inject +1510 drivers/gpu/drm/ttm/ttm_pool.c

  1502	
  1503	/**
  1504	 * ttm_pool_mgr_fini - Finalize globals
  1505	 *
  1506	 * Cleanup the global pools and unregister the MM shrinker.
  1507	 */
  1508	void ttm_pool_mgr_fini(void)
  1509	{
> 1510	    if (backup_fault_inject.dname) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
