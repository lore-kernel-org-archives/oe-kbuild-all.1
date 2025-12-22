Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6A327202
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 06:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383426; cv=none; b=AVXgoGLlNAYm52Wf1+sdfLo7wBhKptW4S/bY8FpH0yfqqs/pJSVyoyxPT5CJE6f+W6xBJ5cO3dNwOT4jXuDxiYP8oHtl0fTleHyN5xFTBleplAhXWS9cSWRbGlHcey7vY4GVpcIxWMNqnWfRIGgEFHJne41vCxM14pc2U55ESfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383426; c=relaxed/simple;
	bh=DeXJFvUtQjifbHXag9iy9rR4e/Q+3Oz5cbtqjlJVOfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efTDiQ2fAwv9M9Fw/sNsuH4c7TI4QyuXUybJRgWDI5+aYIfYywM17EEY/Vh5tZsgYe2VUZxjFWycM2vZkiLDBnwXpjr/s9LyEYpBGu1CFMj6YvkroteyKqbsHW260Xz28b1Ke6RjLfUaXciukGeO7M1koytFITE390XVV0emftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAo/kkce; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAo/kkce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766383424; x=1797919424;
  h=date:from:to:cc:subject:message-id;
  bh=DeXJFvUtQjifbHXag9iy9rR4e/Q+3Oz5cbtqjlJVOfg=;
  b=DAo/kkcehqOeKMqPEIzE5lo6Xpf9Zg/nA9cGpceHnG7BuxMhN9gwUQxS
   GDPyytrMv2iaXicO30fpNQHnQ6PXCiLqzwqbN6HolCb26w+57js/oLKgg
   JKGdT+CGSBOVp1OMK4fr/ueayw6W9cxFtQEVrCy6ZjZURM3Zl213uXGaz
   7qZm5krj+Q884IAzClX8gj10LwyXVvsLcvS2Ol0xgxrpk1+3AujGHwhPi
   QmHfUrLyvEQZog4p9PNsbn6OvVz9nGTG6RjOPfT7ZRceWTVciHqGJipBj
   pYmvZEH9B7C2gA98GPHQbzq5hhEDj/nSWCvISQ4wwOaczoLPDactlaqjE
   w==;
X-CSE-ConnectionGUID: Vo/qGGOqSeeWUIg43zGhow==
X-CSE-MsgGUID: onVE9eK+QrygYJFukVz4Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72086250"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72086250"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 22:03:43 -0800
X-CSE-ConnectionGUID: HSVwRfMpTKmzBdrIsAaswQ==
X-CSE-MsgGUID: 9A1EJTJXRPWKxhNzfZnEnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230461037"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2025 22:03:41 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXZ11-0000000009N-1ZMy;
	Mon, 22 Dec 2025 06:03:35 +0000
Date: Mon, 22 Dec 2025 14:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202512221330.ccHryQEs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 814ef095f12c9fa142043ee689500f3a41bb6dab powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
date:   3 months ago
config: powerpc64-randconfig-r113-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221330.ccHryQEs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 789845e319bbf346d42ee2c0090a9b8e153797a2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221330.ccHryQEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221330.ccHryQEs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     expected restricted __poll_t
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     got int

vim +121 arch/powerpc/platforms/pseries/papr-hvpipe.c

   108	
   109	/*
   110	 * The user space waits for the payload to receive.
   111	 * The hypervisor sends HVPIPE event message to the partition
   112	 * when the payload is available. The event handler wakeup FD
   113	 * depends on the source ID in the message event.
   114	 */
   115	static __poll_t papr_hvpipe_handle_poll(struct file *filp,
   116			struct poll_table_struct *wait)
   117	{
   118		struct hvpipe_source_info *src_info = filp->private_data;
   119	
   120		if (!src_info)
 > 121			return POLLNVAL;
   122	
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
