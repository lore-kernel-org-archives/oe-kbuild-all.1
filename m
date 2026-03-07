Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1857138B7B5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772913490; cv=none; b=na/YHDfgnPrtB0qSnXDmee1IIetLT0IWvnLUJPaLAmab1lvc7YIvQXFZ5Tl+jlwHFY7Tk7B1LiftnUe7EqlirGLzP3rItfAkBTdift/2ePrDHFOgiLyYgVL5SS+lXklwJgY1tnPd5+eCOFj6xB6nimM43zgzpEOF4rXxtxSpcZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772913490; c=relaxed/simple;
	bh=vpK34jiavOf+wUMryDBJi/NV9WUWupPS9ZThQGAPlxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wg4rnimmDe/ZKzwkbuidXR0C+UGdL+9ntlpzSZWK/2DsFjiF1fxNe9K7lRE+W9K2RXBYUnO+Xwy4nJl3hw+wo1TdobJYo7TcX5S9y4JJKg3oFmaF0rOlE3wJZ9oUKpHEXdC98QNMZxnoI55GQskezxDRkGg3AARPBo9IEycuJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbqrSDX9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbqrSDX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772913489; x=1804449489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vpK34jiavOf+wUMryDBJi/NV9WUWupPS9ZThQGAPlxY=;
  b=QbqrSDX9rxDvd2IZIzn91X7XmTWJ175uycTJ35f8MKv7RukFtI37Fm/T
   HOGKrww9+GN8yT6bDwBfuDcvz2ybZHU6KAuYd50JQtdoZ3qwslsApTmyW
   Q8Zm1aiShigoAI9syE4EIlLAVGQbwAh0Eyn+/dDD2wJVR9SiJ3VqoCj1d
   aGSFeT4uOL6NE6efk3V1uAAmdb68GnrqY0NU/3jDfWOXSuThVGLk2MSm1
   9BzYO6riN6Nb814qxtZcPm6VYbmeMZt6t/DTBCJnX+334+g3eqGRwERFf
   0oF/OCT3ucIh7yWch2QFMf+3ZTMQLhNbHEsHahsC4Q1qiaGT6LGNUaB2Q
   g==;
X-CSE-ConnectionGUID: k2h3y9tCQD6R4aJOExa/JQ==
X-CSE-MsgGUID: Mn9RsoAxTTK300toGVr0qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77869827"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="77869827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 11:58:08 -0800
X-CSE-ConnectionGUID: 5rWMSpbATBKAzYYozik7zQ==
X-CSE-MsgGUID: JSmY/5QtSHS2UCmjdOGBHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="224286777"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2026 11:58:05 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyxmj-000000002b3-0qaW;
	Sat, 07 Mar 2026 19:58:01 +0000
Date: Sun, 8 Mar 2026 03:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
Message-ID: <202603080314.XeqyRZ7A-lkp@intel.com>
References: <20260306163255.215456-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306163255.215456-1-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/drm-msm-dsi-fix-pclk-rate-calculation-for-bonded-dsi/20260307-010943
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260306163255.215456-1-mitltlatltl%40gmail.com
patch subject: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603080314.XeqyRZ7A-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080314.XeqyRZ7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080314.XeqyRZ7A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/dsi/dsi_host.c:590 function parameter 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'
>> Warning: drivers/gpu/drm/msm/dsi/dsi_host.c:590 function parameter 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
