Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325EF26D4DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758703599; cv=none; b=tUsnOIq6TP9nmSB/SwsPdGJYvKjFVRiqD7u+fbRlzkgeIYf44bug40oJ84KPu9jRAXHbDDlprzQiTj7XP4f0s9PJABdRyNooJ2vUksvGcYraQEWYQEZdMvrvKygw8P9N3ceL1gUNZAwhY8WkoSO1nxgAhj5YMj3d6NrQJPd0EVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758703599; c=relaxed/simple;
	bh=5zURv/VkwJ7uwftpG82eT/JkNOOOUKHmFDMlNcbtWEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehk6tJWsINjYal6g+p8fHaBTKqEadhsfE9kJ8H+25Qvvz3x9xMLaraBW/Ta6GSvK8/GoEwyX25V6ABmkr4ZfP87WnHAqGsWOOToLtT9KukA2nTmSIeXOmSUaPsaAYXdwaY5ruQtuoRm/SL0SjEcHOZmniPWtYdQJqsrtglf2yD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lmh5blB2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lmh5blB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758703597; x=1790239597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5zURv/VkwJ7uwftpG82eT/JkNOOOUKHmFDMlNcbtWEg=;
  b=Lmh5blB23I9h4mP3HsZ6ZX/hSiXZvrFu/MEwuKgrx/812r1c2xZv2Ih/
   hON1kAgruZCcxPFUqV2D6Q+f13mp9La2hmd1mIakQc0XuTReEpXcrcWT8
   +8R4ueB6Ba/yrsUmTJOcnHDOTfAYpttQpw8XZv/isw9Begg/NdZnnAp4w
   P7kYJ/wQvXsFumfy1Pmd7EpPzTx4/HmCqT/HdSYoU5Tn8OxSwrFK3ASSN
   g5VEU506v0EuAUqvLDB2leBiK0Zd+zOzYU+6C8lMHGcSxqRznAEEApxsc
   tdz6rXJBq/S/f/+OAz12aqYDa9RoAPyR0N+EOLS/K5syjK00brGvAbw02
   g==;
X-CSE-ConnectionGUID: UrOP9zaoRaCkGFjtIL7FJA==
X-CSE-MsgGUID: bAcAkBh5QR+9qWXgQ/fzTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71618212"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="71618212"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 01:46:36 -0700
X-CSE-ConnectionGUID: 75A3mkAlQkO7AvUCGYr9YQ==
X-CSE-MsgGUID: 0VYw90Z7QwWqmMgwo+Gqmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="177762293"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2025 01:46:34 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1L8y-0003xJ-1K;
	Wed, 24 Sep 2025 08:46:32 +0000
Date: Wed, 24 Sep 2025 16:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	=?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/shmem-helper: Add huge page fault handler
Message-ID: <202509241654.qJk1H5kr-lkp@intel.com>
References: <20250923095634.50051-1-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923095634.50051-1-loic.molinari@collabora.com>

Hi Loïc,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.17-rc7 next-20250923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Add-huge-page-fault-handler/20250923-175753
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250923095634.50051-1-loic.molinari%40collabora.com
patch subject: [PATCH] drm/shmem-helper: Add huge page fault handler
config: alpha-randconfig-r073-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241654.qJk1H5kr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241654.qJk1H5kr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241654.qJk1H5kr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_huge_fault':
>> drivers/gpu/drm/drm_gem_shmem_helper.c:594:2: error: label at end of compound statement
     default:
     ^~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:548:21: warning: unused variable 'paddr' [-Wunused-variable]
     unsigned long pfn, paddr;
                        ^~~~~


vim +594 drivers/gpu/drm/drm_gem_shmem_helper.c

   593	
 > 594		default:
   595		}
   596	
   597	 out:
   598		dma_resv_unlock(shmem->base.resv);
   599	
   600		return ret;
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
