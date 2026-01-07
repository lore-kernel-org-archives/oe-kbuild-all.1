Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0026C344030
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804551; cv=none; b=NML/HM+h9b8mdgE+E06FtKw+lkYIn/Ibfgb1VVWhWZe2eOFZjN9U5S8fTJT+hvNO+JhfUNdDJjArq8utVoc7Dpu04OUmg7IfrMcKpXTZl4NFk+tjRAVturpHrrsDk4HTJMolyalbnvvsQuOrzZo6lSoeY78gexUzi+D6rVGimc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804551; c=relaxed/simple;
	bh=inZ7e/LbKWKCBMJeF0jdqCGb48ue0bSiQkjDj/xImH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcHXpTWUHu8drUygt6x+sil69M++Sa67Y3lKA8Cj9nYYy7F9Dj9NTATxSnKsgSy/3Y0tWyxLWwtw1uIm5oaY/Rl+dCv0chB0+TOUAAqlyx6G3Oxcs3+5+TL+BLHI2BHfqqa+IDYAhRlqCoEUiBpH6z1giilH/88g06/Aarbbn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYfDI6aW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYfDI6aW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767804547; x=1799340547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=inZ7e/LbKWKCBMJeF0jdqCGb48ue0bSiQkjDj/xImH0=;
  b=XYfDI6aWKVVzXlPraj0u04Gtud9StaDclR+vZDQjF96wGVmTjy//q2Nl
   y/QbP1bVIGoqBYbe2DwQUmBcdsg32z5eTP7+lYz+vQbpgFnsonBF4xHIk
   DQ8Vv97mkA6YJoBqIS6aNWdMNZY7WuhSaJEKSC4hagS+nXKJ2i+x9SbD8
   sUs3cfytlwd45nyiHMTzpppgJOQtkDUaE27K56MpLWVkig4oDEXKr6YUE
   JW8mTXWgEJOCfQIoP8GM8G2LUopI4nvs9Uv1BG8r+nT4ev8LCTN55AO5Y
   Rwx++UPVsp07l+2YntAqBtQV+tMBdVcDi8psbuRTvgy1G3J6k8MXJPton
   g==;
X-CSE-ConnectionGUID: eoYcCgM9SQO5hN42DlrZMg==
X-CSE-MsgGUID: df96Ll5DTlO+1wrWllF3zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79481765"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="79481765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:49:03 -0800
X-CSE-ConnectionGUID: EDvKlPTaQwO9Ja5o9oEAhQ==
X-CSE-MsgGUID: IYy4spkqSx2auKsyvSfkXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="234117394"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jan 2026 08:49:00 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdWiP-000000001bY-3wzv;
	Wed, 07 Jan 2026 16:48:57 +0000
Date: Wed, 7 Jan 2026 17:48:47 +0100
From: kernel test robot <lkp@intel.com>
To: Vasileios Amoiridis <vassilisamir@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux@roeck-us.net
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: Re: [PATCH v1 2/2] hwmon: Add support for HiTRON HAC300S PSU
Message-ID: <202601071730.jz3sGdba-lkp@intel.com>
References: <20260106160353.14023-3-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106160353.14023-3-vassilisamir@gmail.com>

Hi Vasileios,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on groeck-staging/hwmon-next linus/master v6.19-rc4 next-20260107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vasileios-Amoiridis/dt-bindings-trivial-devices-Add-hitron-hac300s/20260107-000618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260106160353.14023-3-vassilisamir%40gmail.com
patch subject: [PATCH v1 2/2] hwmon: Add support for HiTRON HAC300S PSU
reproduce: (https://download.01.org/0day-ci/archive/20260107/202601071730.jz3sGdba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071730.jz3sGdba-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/hwmon/hac300s.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
