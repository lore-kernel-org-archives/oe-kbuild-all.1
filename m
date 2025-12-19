Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1C71F94A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766108143; cv=none; b=QzxSl0cRQ9m+mz9vp6fJ+AChDUw7tWYHO3HNpRnlSs/VKEb+oP6JZvkSdR/fVt6P7oTmGT1GjofGnJ9abm0/8aa2jxEyiBfsu6/5Gpv0h+2V5cDBhNM8wtHiVA/+5eqH4ojTe3+4kWJzO/onguzxjz4tByZ4+8xNmpYlQxLEfqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766108143; c=relaxed/simple;
	bh=p2TMNeMRIRcW10zVFRFdmXrp+74yfVlID/N68tON+80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vd9F6aGCX3azuzV8g+9Rd3EV56lDnuSKRBcD7Q7ErM0vEHgZNDfyPizj3/fY3da5FXIe6rqls0zGOiV9cnLBVokdTb5xEzRciwgPHjjxBo8KZ1/6UQn6UiWn6C8MEMHUYZwjTuYJqMrzhkzq10TkYEooylVoSxxrBKPmIEJrMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPhg+vAa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPhg+vAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766108142; x=1797644142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p2TMNeMRIRcW10zVFRFdmXrp+74yfVlID/N68tON+80=;
  b=SPhg+vAaQopUBK2zKq2GQouWNHb/6x1AMphBmxXTyJtWxiPvd/FxWlyV
   VeXr9kWyPKj5khfgmnMOVBB1wAzdmFTTSyBz5dOV9m1wfKJ3HH2jVF8qF
   Wc+rCOYnSp9jK4RapWEJG0+9Zt/tKw4DEnKjZjNoUYS+7/TogC0Ai0333
   DmfDovMIesmewiUGjcORxtZ5gromfw5ItBIIA03obzNW8C8ZQi7hmdu+0
   5LrWgSiOnLe/fUv/D/YXPzochD4aICLbg9nPqCMviiS4dTBlGpkBWLQb0
   eTKuK5m/sa03eH0HRXNmRDspXP5owOZx+DIMNTfpB6d0lNk6x7jytRCwF
   w==;
X-CSE-ConnectionGUID: bYVVtKm4T0GlwoBYAeWKsg==
X-CSE-MsgGUID: raPzDUqMRhOI0I1UEMa9Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68005721"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68005721"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:35:42 -0800
X-CSE-ConnectionGUID: yj1KiQ0gRtyAYUaADnUbvA==
X-CSE-MsgGUID: Qa9eli8iQsaPebJQ0MNX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="197989948"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 17:35:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWPP8-000000002rJ-250n;
	Fri, 19 Dec 2025 01:35:38 +0000
Date: Fri, 19 Dec 2025 09:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 22/36]
 arch/um/include/shared/skas/mm_id.h:25:29: error: '__get_turnstile' declared
 'static' but never defined
Message-ID: <202512190936.fF2iv4Gl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marco,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   5950df0508b3b151758cb1d1d965713d93200c47
commit: 984de4f8d618b9302bf2f459e217768752f39a69 [22/36] um: Fix incorrect __acquires/__releases annotations
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512190936.fF2iv4Gl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190936.fF2iv4Gl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190936.fF2iv4Gl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/include/asm/mmu.h:12,
                    from include/linux/mm_types.h:26,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/test_bitops.c:10:
>> arch/um/include/shared/skas/mm_id.h:25:29: error: '__get_turnstile' declared 'static' but never defined [-Werror=unused-function]
      25 | static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
         |                             ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +25 arch/um/include/shared/skas/mm_id.h

    23	
    24	/* Internal linkage; declared here for below context analysis annotations. */
  > 25	static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
