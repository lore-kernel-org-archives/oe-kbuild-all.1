Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022441DA4C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727553815; cv=none; b=KZLCcKSvPj+3CG6TVlXlLrUCnvF6qRMLVpChQfUDR+Y50uNebcPvSasB4Vmay5UbkPwR0mgt+O2PftQDn9ATI9xdjBxT8svVAuzPeXO4xtZOAVEPjH7B4uqmlf05AEcySttAj0sfa/G0SZCu7OrtN4ZeSppr8ryzFiRkXXW+jgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727553815; c=relaxed/simple;
	bh=MAIWv3MVXkl0KB95DORZmRhwmG1Lyh9owtRolD4CE18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GO37NPpQcZX+zIA4x1oWrPhWDGe/rXQijxoDPDqbLF+CUsq4hgSbSRHE4O0NssoKJC+0ahB6zvaaI2qQnRis401nzO1u1tT/7DGt1g+xKdRCefGrscTg7TTimDq9tWOCJAJi5YqicIkz6RuvvtVL3i0avw1EHi8z4tC3hg+URgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9JlfieY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9JlfieY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727553813; x=1759089813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAIWv3MVXkl0KB95DORZmRhwmG1Lyh9owtRolD4CE18=;
  b=V9JlfieYRCkx4z8YmiYkmppYmc2N6nE+2n4YmLMmbSpxekel3rBU56+3
   TbqyqKwM/9UXhzfBQOwMyN6zMtsaEIqOJz7lfYADwWqJIfQ0fZSstCKbl
   aYYPy+iYFRgVTwDoPZTcPR8/bLkNdIW/6vkYcEk7JXqZO92ZmMO/vOQ3Y
   WxGnBy5Z9tk+HPHbZCGJaNujgc4hUKuM2MYRVhcww+dP0ygRfONnEppmx
   8RNQQyC0ciUXhaY+mdv4MWxB6gsrOJboaYTrWwcW1zPNhZOydfUg6mfJi
   0qz9JISCVRBTLe4KxfdwgIJgZ6dqWM3vp3fecec67zIVXO5TWS3woUjIZ
   Q==;
X-CSE-ConnectionGUID: pAf5q4XCTyK4qFVgIFSwkQ==
X-CSE-MsgGUID: jFsz5zMiRJ2QyeTRx6aK7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="38065101"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="38065101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 13:03:32 -0700
X-CSE-ConnectionGUID: 3TKPSJOhSLmK19e43tD8PA==
X-CSE-MsgGUID: Qy8eWXPGRxm64L79DmlHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72737719"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 13:03:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sudf7-000NZg-1E;
	Sat, 28 Sep 2024 20:03:29 +0000
Date: Sun, 29 Sep 2024 04:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 159/16788]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 'fsl_easrc_get_status'
Message-ID: <202409290439.Ls81IezG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 719a8ccd080c197dfe5f8373fbacc3928626300e [159/16788] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240929/202409290439.Ls81IezG-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290439.Ls81IezG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290439.Ls81IezG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:1754:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for 'fsl_easrc_get_status' [-Wmissing-prototypes]
      19 | void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
         |      ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/fsl/fsl_easrc_m2m.c:282:5: warning: no previous prototype for 'fsl_easrc_process_buffer_pre' [-Wmissing-prototypes]
     282 | int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/fsl/fsl_easrc_m2m.c:415:6: warning: no previous prototype for 'fsl_easrc_submit_dma' [-Wmissing-prototypes]
     415 | void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/fsl_easrc_get_status +19 sound/soc/fsl/fsl_easrc_m2m.c

    18	
  > 19	void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
    20				  struct asrc_status_flags *flags)
    21	{
    22		flags->overload_error = 0;
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
