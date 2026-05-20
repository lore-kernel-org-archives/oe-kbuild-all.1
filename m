Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4623242BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 03:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779248581; cv=none; b=sAUG2grGLnzunFbWasJb9SzjdyehtsV9kiVa8V9Hb3ZB2Ih7CPwUcpA5ACy/ZeywfKyxQz0/s6VNNvqT9mCZsAeonGCVKYqM35s2KurfrcVnsOIlGz9TnLVhBcAU8hXRE2opJNsj/uNoarXZuZkq+0ujntsUvVlF4ctOFEvHaik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779248581; c=relaxed/simple;
	bh=Ihj3+URI/hZ0ULqVhAlDGYeGrHMDeP60TfKPm/Sc/Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXXnAIqUnVCk2xVC3dMfqxqbpyHdR1oj9uDLmQ9zdfvYb9vXuhc0+W+zNfSJGo46c3s11P9MzDM30qYkg8jw8Ce1mrRPgIs83nV/LjI0ooWAZONejIEBMNJE7zDBDTVPdYpyTCvOieNCGeMl6NY09gCG28mmvVLeYJxfGfff+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpCtcTNR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpCtcTNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779248574; x=1810784574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ihj3+URI/hZ0ULqVhAlDGYeGrHMDeP60TfKPm/Sc/Ao=;
  b=QpCtcTNRWoN96gnxsL6pRs1Mv1HKDWrsNSd0Ifty2u15R9Aq//uuIZ+a
   D/LV82TUYzQLleEz3hjw6tS1Yx2le9+tQAdKaImKEZyhvmoefSBszY4LR
   0AgExgnou8TULSyJlemu6MlHKhB9uM3VLDGw1Ko6UvDXk06gnARWz3Cgx
   ASTYj8vn6EVv+tHlM/5Pl5JkYk3o6PdRRmZfSX9gMUQwrnLcrGiX42+5q
   vQPxm6T0YBMpgB8OYnAfBJkiw8ffIvC0u5OfiOtPyy7de4VBddBr3N4DJ
   yMZa128VRNaZrmYBrpDISYdfEtn9vXx0cAT2p7AQcmNz94qwDcmYukCD0
   A==;
X-CSE-ConnectionGUID: yDDtFaMmT5ePblb7q1bplg==
X-CSE-MsgGUID: 5xWTCTK6RbmUakkxgPdnGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83757159"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83757159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:42:50 -0700
X-CSE-ConnectionGUID: DCVbD3efQj2rP/hzmD7rcQ==
X-CSE-MsgGUID: C62bt9eATeOyV+fytCxVTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237382770"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2026 20:42:43 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPXoH-000000002OP-3QqR;
	Wed, 20 May 2026 03:41:43 +0000
Date: Wed, 20 May 2026 11:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alex Williamson <alex@shazbot.org>,
	Steffen Eiden <seiden@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM, SEV: fix merge conflict
Message-ID: <202605201112.NU8iRNQm-lkp@intel.com>
References: <20260519202851.1339906-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519202851.1339906-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next linus/master v7.1-rc4 next-20260519]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/KVM-SEV-fix-merge-conflict/20260520-043413
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260519202851.1339906-1-arnd%40kernel.org
patch subject: [PATCH] KVM, SEV: fix merge conflict
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260520/202605201112.NU8iRNQm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201112.NU8iRNQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201112.NU8iRNQm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/sev.c:117:27: error: no member named 'rc' in 'struct kvm'
     117 |         if (!refcount_read(&kvm->rc.users_count))
         |                             ~~~  ^
   1 error generated.


vim +117 arch/x86/kvm/svm/sev.c

   109	
   110	static __always_inline void kvm_lockdep_assert_sev_lock_held(struct kvm *kvm)
   111	{
   112	#ifdef CONFIG_PROVE_LOCKING
   113		/*
   114		 * Querying SEV+ support is safe if there are no other references, i.e.
   115		 * if concurrent initialization of SEV+ is impossible.
   116		 */
 > 117		if (!refcount_read(&kvm->rc.users_count))
   118			return;
   119	
   120		/*
   121		 * Querying SEV+ support from vCPU context is always safe, as vCPUs can
   122		 * only be created after SEV+ is initialized (and KVM disallows all SEV
   123		 * sub-ioctls while vCPU creation is in-progress).
   124		 */
   125		if (kvm_get_running_vcpu())
   126			return;
   127	
   128		lockdep_assert_held(&kvm->lock);
   129	#endif
   130	}
   131	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
