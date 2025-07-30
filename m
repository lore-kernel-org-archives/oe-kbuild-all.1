Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84C22318
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 23:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753917812; cv=none; b=H7abhEN58ehE5aTGLc9NKEKmY4NvYwIS5MLS+ztLYyQiKg1klvPtKSBDBUqo1X7RbJzIF1avnZKDgl3JLikFVPiOYu1cpBcD2qtjovyN0Vrub9DmRMc70UQq4O2ek9KpxgDXZafj4Em5ishyR1Kb6FXinRzwZV8vK67FpiMU5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753917812; c=relaxed/simple;
	bh=97Gbm9D0f3wusMe6mUOiZ+E5OPLz50mBZP+eodJOiNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWEoIsn5G7oJFgJA1OFB/5v7Ej/BN74m6Nm2zyLcZo4EgzudIGdF75QMM1KRsjXOw/cl07gVUKC4cL/US1UZfY2VOsk3a56UNrVD2jJPgXzXTpZTx42+S3VVt3fbz/KJt21qtiDmoSa0Nh08YzAEjbsZmt6TjAKfFpwYyAa2AFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afX7mFn8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afX7mFn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753917810; x=1785453810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=97Gbm9D0f3wusMe6mUOiZ+E5OPLz50mBZP+eodJOiNI=;
  b=afX7mFn8zD5nUDVMLVQDn3C59rSc+wUlb89djz3Wifh1ccjOgNt4EmT0
   4YiFj9x/p7Gr8iQ0BZRHxQeqxA2q+jV2n9feo8dgHUQDvPmwnTBbKP+Y0
   sKOdwchmwIAAbsEfdJnMcX9/cy0lSq7GiNHdXTTc7WBoJ2wKoXP/hMb5b
   RID2KJEv4Pi7oSVxwLMUcXW6IsFPO1Fs5J/7QnAW0lk1bjkJeXaXRXqz1
   UHpmJLUqGDAqHn9LL5JPwr9vivAM70+oXS74If5837KMSSt04cRJjoAHs
   748P246pdNp6eCDOF4tugvRlKehfBe+wqzAZUllLtfijR6fqhJmZ1AeBA
   A==;
X-CSE-ConnectionGUID: WEj3U2tTSHWZ1nCQBnt49w==
X-CSE-MsgGUID: hWJR+ITGRoONfl/TD3J0dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56098811"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56098811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 16:23:29 -0700
X-CSE-ConnectionGUID: /Few2qVnRFeFNU1Mk9juaw==
X-CSE-MsgGUID: //L3RPHQTc+hVIEvIvOX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="167596178"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jul 2025 16:23:26 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhG8p-0003EK-2u;
	Wed, 30 Jul 2025 23:23:23 +0000
Date: Thu, 31 Jul 2025 07:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Caterina Shablia <caterina.shablia@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
Message-ID: <202507310715.d6MBnXvv-lkp@intel.com>
References: <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250730]
[cannot apply to drm-xe/drm-xe-next linus/master v6.16 v6.16-rc7 v6.16-rc6 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-gpuvm-Pass-map-arguments-through-a-struct/20250731-003813
base:   next-20250730
patch link:    https://lore.kernel.org/r/20250730130050.1001648-2-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
config: i386-buildonly-randconfig-002-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310715.d6MBnXvv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310715.d6MBnXvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310715.d6MBnXvv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gpuvm.c:2471 function parameter 'req' not described in 'drm_gpuvm_sm_map_exec_lock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
