Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB9532ED39
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734237; cv=none; b=nL/1cN6AKbUnsyt5F1h3EPOVLqjIER2tGVzVQOQz7a4Qa/LRqAVdOu1wfrx6D+fKoODovW8exqPiBzi3xFPHMBf06xNuzyvT+SMqN8TbJXfaByqfZhkvpvnQX1oPKcPiSLHFWxEYDPgSSiFv/O6xOeZUsMKM52rlBsZ5CCS1IK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734237; c=relaxed/simple;
	bh=5PxiFz82c0+B7DLDIFW7tbkSFyzFoMrLKz1rCS97ls8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAIJ4dEHmyheiyvJ7ZYVrVUKuZi0q3pWQE6tkm2RlpSz8J5EtijHOcFaUUPGNonGuEIG8G7uzffZIi6dlhnV4pg0Z9m2kamrctOAnupOI/S8Kb6S+ZsGE99/2HaP4vAo9UH01yDlJM2AVvhS8jNXYlDSubIQ1wutXgsydOdeeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McHEQPNI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McHEQPNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761734235; x=1793270235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5PxiFz82c0+B7DLDIFW7tbkSFyzFoMrLKz1rCS97ls8=;
  b=McHEQPNILJgg6onMZe9fr+C8pXoXQQITkBsO7PvRmP1z0Dn1csOvtt6b
   5UxAKQ6UaSzRdq8QncKc84L5CRgKkpfk4RKDVQaSLea2QBoaIT7kgQ2zE
   WQ5BuJv4YU58MkLna44kLGtr5v5k/K/ROAFfloRNce6WZqqJMRYgHT3fh
   qxVVvh1cxe83xL2o8bNrGUY8XjmB/BDORyH0F/QSAqL0Qpn8yhwgcA1Yw
   oIZ5MIUrWd9GI3FGcMPxBn79z/uTXuF88ptivMW/AgtYLwdH9n7ukNE9g
   EJJmlSPZmwZ8yghficG8S2RNthzCZCrSX65tqAvFaH/6WiwtRcLO6xfT5
   Q==;
X-CSE-ConnectionGUID: PkQxlvzxSKK7KH88dr5xjQ==
X-CSE-MsgGUID: JR0VJmXsTx2AxjnatbyS6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="74527382"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74527382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 03:37:13 -0700
X-CSE-ConnectionGUID: olt4S6ceSzKmhJKCKxD2wA==
X-CSE-MsgGUID: MlbFjBs2RRCXBUVKtFlbgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="189930234"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2025 03:37:12 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vE3YE-000000000uW-0GVy;
	Wed, 29 Oct 2025 10:37:10 +0000
Date: Wed, 29 Oct 2025 11:36:58 +0100
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 4410/4731] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:872 function
 parameter 'edid_header' not described in 'link_detect_evaluate_edid_header'
Message-ID: <202510291140.jqRSEDTv-lkp@intel.com>
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
commit: e45d60a76999a2128bd1bd3d2e1597eec8b49c78 [4410/4731] drm/amd/display: Add analog link detection (v2)
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251029/202510291140.jqRSEDTv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291140.jqRSEDTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291140.jqRSEDTv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:872 function parameter 'edid_header' not described in 'link_detect_evaluate_edid_header'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:890 function parameter 'link' not described in 'link_detect_ddc_probe'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1300 function parameter 'link' not described in 'link_detect_analog'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1300 function parameter 'type' not described in 'link_detect_analog'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
