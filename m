Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBF4312831
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 02:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761792561; cv=none; b=d6Ge3aecTlH/9+/rsxuNpHN4uJiwDPN4POyBaXCESwbTDqgpg7VZjiXPkPqXiH1dDUP5+v+3IJEEQhariBq2zJ501+Q44/WGiJQRc6L1/mGt4e4X9S1DG+NARr26+NsVmmWjWlMPCu2+reqsUtDm4m7Ir0dwX5YvP3vMjVwRAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761792561; c=relaxed/simple;
	bh=+HBy6Drq/vWVwyj5VXBCMfaHOIJ22Zl3eG6tEu16gxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdLpeelxYJavuHnMdJYppMsz0GRoTKMy/kU52Ict6fNuI3tds+fK1WIOcS02Uucek3zFdLPOAPnEkUQ2CHr70bWDt4PmxeG4n4pzC7qRaa5p7WdEYqVXM76lz523gDlD0cn4Pl/82Vu045TIkgBj+cqLHEFPivCEZR4LT0MrcXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhzo97N0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhzo97N0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761792559; x=1793328559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+HBy6Drq/vWVwyj5VXBCMfaHOIJ22Zl3eG6tEu16gxY=;
  b=fhzo97N0zLJCZ7GhCLW8eHSsbUT1RDFQYKp1Le7CqRB1kShd82oh7CHX
   HSvb0jqwnIKq62mZLLjsDFlWVwQ3zDzyoLAM/ch9ZDFcO9p2sE5xaRSyd
   +11FkuYFD7uI2WyYSYDq8HBmzNkdwNe/5AxEJOy3p0PALIHBC+K8UcluM
   Xr0ZXlIm5VLRIyNd42Xd9eSwQxblf+IRPoBe+qFVYYLQWSm//z6wg7QAG
   +f9uZmYkGEs4XdLX9FM0wUIsuqq3V6imQRSXAQoD8465s86ldpVO7w0AW
   eygyjfyzwYsCP74QSj/Y2oYUQA3FUmEES7Yd5f/I4QbgSSBg5V8sqhUNB
   w==;
X-CSE-ConnectionGUID: S5n7fhHfTUaYhoKIWrzjTA==
X-CSE-MsgGUID: CrR/eVoDQJqJt4kkf44gDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89394025"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="89394025"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 19:49:18 -0700
X-CSE-ConnectionGUID: 1wZ1IIdjQiSi6LNiyYiM3Q==
X-CSE-MsgGUID: 1W8hsP+LQRuV0aQN/cvXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="216493775"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2025 19:49:17 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vEIiw-000000000z6-3c7I;
	Thu, 30 Oct 2025 02:49:14 +0000
Date: Thu, 30 Oct 2025 03:48:46 +0100
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-next-6.19 228/235] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:914 function
 parameter 'link' not described in 'link_detect_dac_load_detect'
Message-ID: <202510300317.X4sKP4lT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.19
head:   1bc9d39275e08853ff15410b4d530b46b546affb
commit: ac1bb49522676dfbd83c323376f8d5daa5b1ba84 [228/235] drm/amd/display: Use DAC load detection on analog connectors (v2)
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251030/202510300317.X4sKP4lT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300317.X4sKP4lT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300317.X4sKP4lT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:872 function parameter 'edid_header' not described in 'link_detect_evaluate_edid_header'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:890 function parameter 'link' not described in 'link_detect_ddc_probe'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:914 function parameter 'link' not described in 'link_detect_dac_load_detect'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1354 function parameter 'link' not described in 'link_detect_analog'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1354 function parameter 'type' not described in 'link_detect_analog'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
