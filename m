Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765216;
	b=wQFT0VARSBsmj2c5y2OhL8XPbMsSTtc4oyZzNVlXIl2sHOVg+02AkfT5BvWoGkqiL0JJ
	 jl+aK4ZRjWZMfTnKCUre7oa32IZ5FdQjxH46VinnT1K04Y3ttg/mGFLpRVzlOic4SQIVc
	 HK/fhZbwZK0RkYd/9P8aNDPZ/Yr3YtYHhw3YbGSjf/KBaRyROLW/ksCUyzIGRzLMMYwPH
	 /E/16d1dRT8fzLGGCS7PNLOwD1v+l+QjhCet1xy7mosQnwLaxlWfeeIyQWrAtaO7SdPsq
	 Oyd7rfe63csyOO2y2+6p4xxaybuMwCEPLMd97uzbiWPiIm+/nZI+kdkujIN3vpn5/Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765216;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oQ27IEgLT2orFZeJPj/4rgrn6HnFwJv883GIVLY4pjA=;
	b=h0ueyrgYAqOKtYqOfl+jq0wvVmjyu6X4CvSpqP/CD980NavW0HEU7QkIAHrk/M7nTsoG
	 dhOyacbtS5V6SBfXkRYyUekjIaKNCm3gJ0ql1o2HEFwoA32MvxYDg2zfw/kXCXdeHbrJI
	 AVz9xNVXxUUtPvS81ytn0wR5gjCtgzUJWcMrNgbePwM5/6o8KWDIdvcPoIizNcsLw3Qnd
	 +8Foe4euoULFVnwW6n8jM9J4tcdnQxbqtf7ip2IuKShDlGAliJ7gqCe0LJ9Y7dU3uhRAo
	 ydkg86ByFTxzstxIOJqlnifrT5AsaAWJnk4Osprfo6Pn/2k0uH2KPGxSSNAzSXWJFSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IghHfudE;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F13606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 04:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F13606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IghHfudE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793765214; x=1825301214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YMkQOtXosbqEbYC2r15SmEurgxLnD1iFp8vrE1jWeOU=;
  b=IghHfudElGkApc6N2FCxMUUUgTJ1He4EfnwPCgmODf3G7tz9veP0zw9i
   oQxwPqnOS/+C6KyUNIpYgof5v4AfQVRkKAU9Nyro8BGCIvAA6KXsEj6m/
   GHdWW6ipy2XuENk054xaJ9zNaZlJaqs38Zc7cGZiiEEIbq3iuabp3cpjc
   PUKy+t1FHIoolglPgyGTz8XXtZH9KDcymvcv8c+uxhDtR/kaei2tAbT1P
   dscSaR9yqq6Fc9xL+uwvc+M4GUcEXY+DqqrOqbg/objjsFqL2W02sBHsc
   zW0O/ldqqp6Yv82Cn/cdmY20Z6UPiy3GQuNSZoF7q3VGq0oWtTip0f840
   A==;
X-CSE-ConnectionGUID: Vi6/FSLHTr2Au00b5ptrjQ==
X-CSE-MsgGUID: ztriMYNtSQmObwwnkjHllg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2520897"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2520897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 20:06:53 -0800
X-CSE-ConnectionGUID: 0UUEofysSfG6aziW8MQrVg==
X-CSE-MsgGUID: 8VW0iU9iSvm+kOj7aY664A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6749052"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2026 20:06:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOSGr-00000000jkR-2fLp;
	Wed, 04 Nov 2026 04:06:45 +0000
Date: Wed, 4 Nov 2026 12:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Alexander Koskovich <akoskovich@pm.me>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
	Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/15] drm/msm/a8xx: devcoredump state capture support
Message-ID: <202611041142.JL4qtlIy-lkp@intel.com>
References: <20261102220405.30730-12-robin.clark@oss.qualcomm.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102220405.30730-12-robin.clark@oss.qualcomm.com>

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-tip/drm-tip linus/master next-20261030]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Import-adreno_snapshot-h/20261102-140245
base:   https://gitlab.freedesktop.org/drm/kernel.git drm-next
patch link:    https://lore.kernel.org/r/20261102220405.30730-12-robin.clark%40oss.qualcomm.com
patch subject: [PATCH v5 11/15] drm/msm/a8xx: devcoredump state capture support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20261104/202611041142.JL4qtlIy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041142.JL4qtlIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041142.JL4qtlIy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:9:
   drivers/gpu/drm/msm/adreno/adreno_snapshot.h: In function 'CD_WRITE':
>> drivers/gpu/drm/msm/adreno/adreno_snapshot.h:506:22: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     506 |         *(p->in++) = FIELD_PREP(GENMASK_U64(63, 44), reg) | BIT(21) | BIT(0);
         |                      ^~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c: In function 'gen8_dbgc_side_debug_bus_read':
>> drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:920:21: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     920 |         side_data = FIELD_GET(GENMASK(27, 24), reg);
         |                     ^~~~~~~~~


vim +/FIELD_PREP +506 drivers/gpu/drm/msm/adreno/adreno_snapshot.h

   502	
   503	static inline void CD_WRITE(struct cd_script *p, u32 reg, u32 val)
   504	{
   505		*(p->in++) = val;
 > 506		*(p->in++) = FIELD_PREP(GENMASK_U64(63, 44), reg) | BIT(21) | BIT(0);
   507		__cd_check_overflow(p);
   508	}
   509	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
