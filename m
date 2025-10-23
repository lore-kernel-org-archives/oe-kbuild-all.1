Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409E1B4138
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761185010; cv=none; b=e/1mH7EkhpES9Ggdf+QSAlQqj75uzdD6mSnju3ggxuLErQc/UjhK7MXwNxR+g9OFpVSv2wHN13PLKJfd5iDJnQuOpS33tEGyRPDKpvN33908r62/UMXs+sBbkEsRQLbnizI+7gVGGvVCAKgJLd4Ha9PTlb1MWHtxq6yfjiGu7wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761185010; c=relaxed/simple;
	bh=YwSrUGOxOaKXPdeTsvwuuKTRFdGcmVg+sPi5rrY3W8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWco86GMRl+KLV7zlr4zL3giCPzhADQkF6sl7pUCGPi2cpwdMk6iAg0mWF7Te0ibWWat94nCTLT9s2E29+bcpw6dAfDFNDIDaXNIhjrvBSTsSXylvK+KJlINT4pPHmDTuQ7iH2WpzGMU5GdjTnu/o9FW0CKFS/Cf9AZMOZ5MwC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAK79ET3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAK79ET3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761185008; x=1792721008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwSrUGOxOaKXPdeTsvwuuKTRFdGcmVg+sPi5rrY3W8g=;
  b=HAK79ET3RVAfxbu7uq5qGYg12sHWXxA+YFrrs3d3HhVrkqx2kfNszBTX
   7rlcpBSDdP6vEYsERkY1G7AeV/nyKKT51v67soAYZ7QVtf1SVuyq4bISA
   7oQLQDt206Nnwec1e6rwdV7Hz8axSv2npXISutkIRvnh1SoMDPrkaEgxD
   nyCmyOdJhKU25GynrwdF8rQyiHmu4Qs/luH4LmrP1aVKnBBCgezcTxBD+
   a/k8EZaAXLDM/SkWyJ63WcwBNnP4veKS+oUGf2rw5WNgBzqP9y48fcNC2
   IrokzrbCiRLVOXagHRb+sI0Z1TC0fvNt2ou7QRRT08Ls6EgLTdoNQ0b6/
   w==;
X-CSE-ConnectionGUID: 0CzqsDQ8Tl6Eajd5JOzM9A==
X-CSE-MsgGUID: CTuwa0p2Q5qKPB7xm6qEig==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63238890"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63238890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:03:27 -0700
X-CSE-ConnectionGUID: ZOnzMz2wQbG8PC8sssel7A==
X-CSE-MsgGUID: 8iXx2VtIQnapVrtkHT+3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="207687763"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 19:03:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkfj-000Cv3-0V;
	Thu, 23 Oct 2025 02:03:23 +0000
Date: Thu, 23 Oct 2025 10:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <202510230903.b7vsK8xg-lkp@intel.com>
References: <20251022102531.657147-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102531.657147-1-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kdump-Add-support-for-crashkernel-CMA-reservation/20251022-182711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251022102531.657147-1-sourabhjain%40linux.ibm.com
patch subject: [PATCH] powerpc/kdump: Add support for crashkernel CMA reservation
config: powerpc64-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230903.b7vsK8xg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230903.b7vsK8xg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230903.b7vsK8xg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kexec/core.c:136:13: error: redefinition of 'kdump_cma_reserve'
     136 | void __init kdump_cma_reserve(void)
         |             ^~~~~~~~~~~~~~~~~
   In file included from include/linux/kexec.h:38,
                    from arch/powerpc/kexec/core.c:10:
   arch/powerpc/include/asm/kexec.h:61:20: note: previous definition of 'kdump_cma_reserve' was here
      61 | static inline void kdump_cma_reserve(void) { }
         |                    ^~~~~~~~~~~~~~~~~


vim +/kdump_cma_reserve +136 arch/powerpc/kexec/core.c

   135	
 > 136	void __init kdump_cma_reserve(void)
   137	{
   138		if (cma_size)
   139			reserve_crashkernel_cma(cma_size);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
