Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765546;
	b=dclxhSlKgIpt6Cdi6SSF0GVJTp26bOJLbMdZysP+W7G0CXJbTeEnofDY4ocgVOCW9o3c
	 iCwbY1xfk2zPHL8DrSqNq7Qv20Reu8Hw2GHSfXapumlaNFDMK1PhFRhBUORLvGQWrOOqK
	 SX7Eh/qjTmpT/gNEQCOmRdfxS2IdLKnlql1q6Ckh68y/CqTRcOhwlz9CkHKJXmBIX7uFo
	 ruac5DLsO6lupMJ+E9QFoPF/aIeFTdt8YwFElqTXqrdLk7o0edZBDXGt2/hAuXPsWg34J
	 DrGHnRsUAY5JCiOxTYTqHUwxUtNYzkun4MLbc/m+CiLI64SsfPaGCzK8jclbKcgPLHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765546;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=AJ429x6PH9nVS5xvwg87JXr37afegp34hgE8/X1jdCE=;
	b=AKtoEs99cqZxszbuk+6cWzRRB3MqXOdPQaigESzcSAOK5nztoHh1VIHvk481Sn97Nd1V
	 XQYBrG6t7QHRTQcYqHbNwInCe0Oys3rngHfsyb3x9qrTwBb8beK0WbppHTEP1qfEZAZxH
	 rqzWuiocUqtlBhSG0l2n8Lr55AlDUCmIWOHEDgca3VXui31iDzFqtiWGo1i7gIpYAa6JI
	 zU3Npa/dya8/+OVLwt+MrnK0KKOz22JqoDmKo5wlBqzl7v+eNR4YWPw6KwWMeXt0nyAdH
	 fVmLf9YwRp9xtdvXxb4vW8xse2zW5DwBPVdtgc4Kga7lC8j0hdhxoruhYR4SGEEKNGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKEVovsl;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EEE606A31D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 14:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71EEE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKEVovsl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792765545; x=1824301545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLM9Jc6n7p3w+R8NmjW3Kik3dTMJseo5Mv6xkf7N63k=;
  b=oKEVovsln68ExvQh6AiHvbUom7jnIgw21du5h/3qJva7t20eRis7lEnm
   739/DsZvURPLioX6Qzs0kJSNghocnBMHzc9ZePBwlu76lDCdXcOiEE+9L
   ZyRSzhUB+1L1lh02oD5GkpqqtSrpSMz9n5nC+OmubvtLNb0VJyH+KZx8q
   YdmnuvzfuRFboq7xkfys45//GEzAetB922a+jwIdINchxNw+VJeg/Xn6h
   vs8DHUJMfhvvX+1760MroEGUCd3QSrco4dA3oZLX6vcvMCOsJ8WNTNFnr
   LIAfDVZR0qsuIVAguyVqwxoHTcZcvV7lXtTdll2shTIRc2qFOen8tO2rX
   w==;
X-CSE-ConnectionGUID: EbPVi/G6QCi6rHi3Yk7hmQ==
X-CSE-MsgGUID: OPYKX+BJT5+gIXb9451sfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1529532"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1529532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 07:25:45 -0700
X-CSE-ConnectionGUID: hH5NQYjZSdGif8fK9WP4kQ==
X-CSE-MsgGUID: nHaymieySpmLWaiKQkQZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3995217"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2026 07:25:43 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKGDE-00000000SoI-1Icc;
	Fri, 23 Oct 2026 14:25:40 +0000
Date: Fri, 23 Oct 2026 22:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Timur =?utf-8?Q?Krist=C3=B3f"?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 447/19853] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not
 described in 'amdgpu_ttm_map_buffer'
Message-ID: <202610232206.jTTTXj8l-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

Hi Timur,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
commit: 48c4aaeef6219f13804b6778b30ac8766cae57b7 [447/19853] drm/amdgpu/ttm: Make buffer copy source readonly
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610232206.jTTTXj8l-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610232206.jTTTXj8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610232206.jTTTXj8l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not described in 'amdgpu_ttm_map_buffer'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not described in 'amdgpu_ttm_map_buffer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
