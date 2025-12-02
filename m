Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE8156678
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 00:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764636292; cv=none; b=rsh0lT8c9S6mBkZjRvhB4ZBNWTvqPrPDvMUQqkCY+qAOQe+xJABZrle1t+kDVykakAjzYUr37plCoMQV+wA+VsA/b4xWxPrG9Lw3rx4BYX74cushc8MJBHWxXCrzity5x2oh/DamOv5Kg37EvbLVSWXlNIbMcFWZAyDEP5oOoe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764636292; c=relaxed/simple;
	bh=ahYHoAHLy/S529n0IMKuiDKbU4uic7IDh42n+XLJVbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT+/QKDRU3G8mWUAEufN2Cc/UYUudjrTwjPD90Tln8FcGEPr1DTV3mbDTtTeGJZNb8h8SRyQnHwPQvLLBnLHZLjuIOMslz/Es9ZKcH9RaHiuV80X863ACU/p7hYGKAzXvjk77EccAKtJQpxQ70PgDxI5ose6rnXYsMyuIQJe5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RppwYRTZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RppwYRTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764636291; x=1796172291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ahYHoAHLy/S529n0IMKuiDKbU4uic7IDh42n+XLJVbk=;
  b=RppwYRTZFwaDXg/095EX2kMnnnqAzMMrovRIDjDo4GDPVnLCiH6+3zcf
   +ChDYDDvqM8+JTDLeGRtLGGuLX95LmYBZ/8nTp9GoLy3YUoUdMUt0wrgY
   R2UV3D2e+J6LgTCxEcKAv+9DgDgV+XSHaPZbqwoTeni9obJ+LBkNBFS2+
   /UA2oyn0bYvgAz2x9BhdgQyvcGeg9nFiY5IulSl4CXf6TCx0jwz+zfFlS
   zYTwILObMRG8abz4DHOWkTnF4NHheKU29VykIObmVrtChE14sRaAQfC1j
   +30zFVUtTgcxTYTQENhKBA8xIPReMjQZz/nQ3sYnTqvF0niP0KMTpSFLS
   w==;
X-CSE-ConnectionGUID: oVq5nADkSGqgrdqolIMNHQ==
X-CSE-MsgGUID: thYKzDt+T3yegxvThgiSXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76912581"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="76912581"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 16:44:49 -0800
X-CSE-ConnectionGUID: zZIUSAGtTW2e7IOt8s8cdg==
X-CSE-MsgGUID: mVThrixTRBqXdkx7IN+Xrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193498844"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 16:44:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQEVX-000000009GT-1zK7;
	Tue, 02 Dec 2025 00:44:43 +0000
Date: Tue, 2 Dec 2025 08:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: Re: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Message-ID: <202512020810.KrwjSbJ9-lkp@intel.com>
References: <20251201105700.832715-4-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201105700.832715-4-joakim.zhang@cixtech.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.18 next-20251201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/joakim-zhang-cixtech-com/ALSA-hda-dt-bindings-add-CIX-IPBLOQ-HDA-controller-support/20251201-185859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20251201105700.832715-4-joakim.zhang%40cixtech.com
patch subject: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512020810.KrwjSbJ9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020810.KrwjSbJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020810.KrwjSbJ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/hda/controllers/cix-ipbloq.c: In function 'cix_ipbloq_hda_create':
>> sound/hda/controllers/cix-ipbloq.c:23:57: warning: conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned int'} changes value from '18446744071293632512' to '1879048192' [-Woverflow]
      23 | #define CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET        (-0x90000000ULL)
         |                                                         ^
   sound/hda/controllers/cix-ipbloq.c:224:38: note: in expansion of macro 'CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET'
     224 |         chip->bus.core.addr_offset = CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +23 sound/hda/controllers/cix-ipbloq.c

    22	
  > 23	#define CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET	(-0x90000000ULL)
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
