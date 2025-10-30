Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F02032AAC9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761791962; cv=none; b=aNhJVBwuj8i7x3jqbiIC0LikH4dfmoVFsB9uRbjpMel4lRv8gHG0L7eZwasa+vItRAMncbaHGmlOqjKm+IdSMpDtwVbS+YVyh/HIJJTvko3wfnDVLwcR2ziUV+lO4BLVTYGUGs+oNyinJDFM8abmg0VW48HpCzTUnAFyQbgRkjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761791962; c=relaxed/simple;
	bh=SfpBZ6CVpZXF/GXYV/TpDRZlqfoZjj7nl2OoDwqykP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbzME/IyPJjzSqbccujfwiPtzVxN1uv527ICjGSOkzWCeX0T5qwPDwjiEU9wVYrGi6pLcLs/wxtXFRtrOKuBIiIDGTstv8qgTn8Ki7e4CBhCCXca6mUqCbB+GUDyieqp08mIuHBzFCEDVP01rbJqD3R5qT61/aUzuCloLHaj4KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JY0e5vGI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JY0e5vGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761791960; x=1793327960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfpBZ6CVpZXF/GXYV/TpDRZlqfoZjj7nl2OoDwqykP8=;
  b=JY0e5vGIWpgvjjq+GwbjzY9cfW/XLPXHV+zXtT0Fk55h+l7zyf8BfVfM
   SAKDbXeLj7ZXPD0KyUMxTf9wmYPHpklhdUr8KuPMHKE/gxyNbH6MkZ/lT
   X5iVmp3yr1z3WycU3eEgljuvHZZ0AxUEXfbqIDYqiSfnE0J86UDdCUnch
   y7o4qltSaCsfYf+3XumzTx22EE/rALCt1cbcd00mrvULypoBIwl0OoMVQ
   fzr1tnGUgIMPktP9rVf3B3r83CdD+5bgzr0kuDxz6oObKrMiLu4IpbNX/
   eqo3uj86cqZns+jqAichJUrWppmP3RHuzwaMuieYUWpVNhgDqtav2qOxr
   Q==;
X-CSE-ConnectionGUID: btP3pH8yTQKLkpBNhmWxCQ==
X-CSE-MsgGUID: wBnFFLI7QYCYc4i9ue+KTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89393636"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="89393636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 19:39:18 -0700
X-CSE-ConnectionGUID: z4fwEn6KTiGLasHoMRRpBg==
X-CSE-MsgGUID: LHLmSS4lS1Obji/3nDGauQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185920129"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2025 19:39:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEIYO-000LNe-30;
	Thu, 30 Oct 2025 02:38:52 +0000
Date: Thu, 30 Oct 2025 10:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-next-6.19 228/235] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:914 function
 parameter 'link' not described in 'link_detect_dac_load_detect'
Message-ID: <202510301022.52ernnfa-lkp@intel.com>
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
config: parisc-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301022.52ernnfa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301022.52ernnfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301022.52ernnfa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:872 function parameter 'edid_header' not described in 'link_detect_evaluate_edid_header'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:890 function parameter 'link' not described in 'link_detect_ddc_probe'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:914 function parameter 'link' not described in 'link_detect_dac_load_detect'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1354 function parameter 'link' not described in 'link_detect_analog'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1354 function parameter 'type' not described in 'link_detect_analog'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
