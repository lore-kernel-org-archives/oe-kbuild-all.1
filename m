Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3857233A03F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753447; cv=none; b=mvCn21tPx+IU4KewODlDfwjGL9xYWo5o2DFQplNooeIMmetUVVav004FlUVO9udPioa1pxquhJ9NAtw7vAXgOTHSXW/WhfIGjFdHgRnB4XOExTtsErZLB9sPsfE1MrjzC38VdPh6T26uctss9I+qxv+DHNfZzugWY9EFMQltIMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753447; c=relaxed/simple;
	bh=JcG6+642B+4/WDEzjtT6l1hy3wOQSOU1YPa6PD1lrw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzocRPzNjrkBwHE3Nl4BVKnA/PCXNPLodQCC6goP+HfSsLP+ln14K5hei6xN5fS81i9urITIN5wIknrx3nC/WWIesVDwGl7oSG1qUoZHNRyvNJcu5MJ34rm12lUNiwyBE+JKv4zTFqYY9PTteg0vus6pJUVz8jm61W/bz8ILddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ae4k+T+5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ae4k+T+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761753447; x=1793289447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JcG6+642B+4/WDEzjtT6l1hy3wOQSOU1YPa6PD1lrw8=;
  b=ae4k+T+5PQ9jwykjt3a/vZ34MA0xJRx2/lKvluMTADpGWZPZr2VzcTzN
   V/Y6ytgBfZsboCfEQTsF+QSGFoPIMpnQsqBLd6icWMSOnDWfv7yRQVlfE
   gdv4RDAJwr75ti09XCz1AWu0iKsoh/lgbPJiYvEaAT8DTd5L+4t3ky7Bw
   BbLg9y8J0Bku8miw8HJ+vgjyONH4iWXsPm7C+HtmqB7pWMLNueNemBRAE
   GGyKqwODgN2YhQGBkw53sgRYjcnBp2WaT1YVWgGXFR12Xlt6VgfPHRAxH
   NXdbzAC4KF4/HMDVy3NrP/3k92Jh6wmTsKxxA360qfNmNhKae7XwdO719
   w==;
X-CSE-ConnectionGUID: ksd8A55jQA23ElkbRnWWkg==
X-CSE-MsgGUID: s2x1+PFiTyiYlo+X6+w6Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67716243"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67716243"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:57:26 -0700
X-CSE-ConnectionGUID: 73cIQvWMSbWM6djmiDZcdw==
X-CSE-MsgGUID: cmci6+DETMOckj7/Oxb5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185784420"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2025 08:57:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE8Y0-000KkZ-2l;
	Wed, 29 Oct 2025 15:57:19 +0000
Date: Wed, 29 Oct 2025 23:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 4407/4731]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c:1571:69:
 error: positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202510292307.DmOaSI39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: deb072d241c906ae378bc88ff91dfcdc34ebe71a [4407/4731] drm/amd/display: Implement DCE analog stream encoders
config: x86_64-randconfig-005-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292307.DmOaSI39-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292307.DmOaSI39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292307.DmOaSI39-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c:1571:69: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1571 | static const struct stream_encoder_funcs dce110_an_str_enc_funcs = {0};
         |                                                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c:1571:69: note: (near initialization for 'dce110_an_str_enc_funcs')
   cc1: some warnings being treated as errors


vim +1571 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c

  1570	
> 1571	static const struct stream_encoder_funcs dce110_an_str_enc_funcs = {0};
  1572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
