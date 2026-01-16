Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C883502BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558800; cv=none; b=Y6KZj4xo+73fZ1NspK47+3uOxroRP8yLTDp8pHgRHJxW4FOYCGpi8VOWE1AqiDGiuy2B9XjuxMAYCc2QgiKFEGsHF5KDQi+m6/77crdhGLuxb4c3vJ6ckD5TagECYv+G3oEagfUIcRvhl+5v8DdRuzsuUCcibZMnTnGVDOofBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558800; c=relaxed/simple;
	bh=Yj0A/qFyBPEdrZtXda+UsYGNG1cpYsJNZBPygZ4vIAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD3x7LL0i+Zp5VvBHkxXQr1xy4Db4o0ByPImqjGupi6SbNQCsifpkDlZqkE1wKnpoQesWRy5FVf/3lKiDmJc40aUmoUXaCeAAa6C+B5rJ1qmBUEpkOfjOiUBjhrWTgWgA+wCfJM7B4uPj7V3CL4NXAtNAKXtJ/4v//qTmMBSUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEFt/rzX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEFt/rzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768558797; x=1800094797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yj0A/qFyBPEdrZtXda+UsYGNG1cpYsJNZBPygZ4vIAk=;
  b=kEFt/rzXd8Hsu9wB1GTrxa68GHzYdcQtt7a0bdcv27S7iOgXNUKCrNTm
   pV/xoun3+oy70PTfl65qt5yKJQO1t596DN/M5tgLBTMwGf3CApXnE1Vvu
   9qQuX01mKLHXxqRgXPE7P/2lS9BbiozxcOfRtQRGRSvkP7H5+u3a8iIFM
   nK8U8QnIQ3/9K526XHHmP3YyVag0bEigW3ipPFoYGR5XiWtpC3FB7yoLw
   6lTaw344O3mdM6eAQRUEOc/ki3nIIPmIgxr4Nc5tIJjwOeHX2iwmLJRIe
   RKxPLIcvzFQaQvTUAO8PUisR2YAPHnV2qYZLRJAvo3h9tZaThafvJjAEp
   w==;
X-CSE-ConnectionGUID: UJ05NX5rQIe6t1jHGcaFFA==
X-CSE-MsgGUID: 0EPAHWaZQIKvzpU4XFr31Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="57426167"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="57426167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:19:56 -0800
X-CSE-ConnectionGUID: aBDSE68LR7CsrIJCLFB7jA==
X-CSE-MsgGUID: euCKmK32TIK8SRKQ0lD/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209691979"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jan 2026 02:19:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vggvm-00000000Khs-2uiY;
	Fri, 16 Jan 2026 10:19:50 +0000
Date: Fri, 16 Jan 2026 18:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] media: iris: Add ROI support framework for video
 encoder
Message-ID: <202601161846.hwVGW8W6-lkp@intel.com>
References: <20260113-iris_enc_roi-v1-3-6c86eba38587@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-iris_enc_roi-v1-3-6c86eba38587@oss.qualcomm.com>

Hi Deepa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepa-Guthyappa-Madivalara/media-uapi-Introduce-new-control-for-video-encoder-ROI/20260114-043625
base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
patch link:    https://lore.kernel.org/r/20260113-iris_enc_roi-v1-3-6c86eba38587%40oss.qualcomm.com
patch subject: [RFC PATCH 3/3] media: iris: Add ROI support framework for video encoder
config: m68k-randconfig-r073-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161846.hwVGW8W6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161846.hwVGW8W6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161846.hwVGW8W6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/qcom/iris/iris_ctrls.c: In function 'iris_set_roi_params':
>> drivers/media/platform/qcom/iris/iris_ctrls.c:961:48: warning: variable 'enc_roi_params' set but not used [-Wunused-but-set-variable]
     961 |         const struct v4l2_ctrl_enc_roi_params *enc_roi_params;
         |                                                ^~~~~~~~~~~~~~


vim +/enc_roi_params +961 drivers/media/platform/qcom/iris/iris_ctrls.c

   958	
   959	int iris_set_roi_params(struct iris_inst *inst, u32 plane)
   960	{
 > 961		const struct v4l2_ctrl_enc_roi_params *enc_roi_params;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
