Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0361E3594A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784151; cv=none; b=ZlYxSYtScipHWvqDRfQJLXDu5wLugfAYNbtsk8/IoeyNqj9dZ68mlayKqPA1XkhYLiBffAUBI4oPR26kDHRwQaOLiwRoU9KjXK8gVBTMxVxoHARKBRTxtBH3mZrZQAl8Ki9+UUDwJKiseU/BUquILHnXx5Oey3AlCK/Kv7yyX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784151; c=relaxed/simple;
	bh=XYXePCuYtoMn6zgave+FTiKfxh89bOZmVAJ15I+iZvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzDoRZoZ2meFjbIJhqAXP7ax6cW788W/nS5a/brcCO5WuiIroMNKx65jPaXkmCOnlLn3cj6E5IXj36AkMjchOxobFmG1M+hqnU4Ht4lquVJ4IZaM2g0fttqcrkglU5IYCcLm6CMm5heUPIFTCn5U+QzgyNePghsEY3R9ozXnWhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfyGGmPy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfyGGmPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772784147; x=1804320147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XYXePCuYtoMn6zgave+FTiKfxh89bOZmVAJ15I+iZvQ=;
  b=RfyGGmPywE0iOIzI21jkmlGEoGkn5klJ81sqPDoeQA2/U7sLhJEnFMoi
   Pj0m2S9tQ0f7pu+nDSk1Y/eFPBIWCN54CBJxOYQ4fKOOxMiSmLCRDyvop
   tVpa4EfWkR8P74kJLD4/cVjCUiTPcGFUeTrsmHTZ17zjqG3rvUT5Fw7x0
   aFHLbdY1CNL9O+dVgmj6TEB5JCU219iBSZvClViSTHHznp7Y/8p4o+Mzo
   EjJTGDPPrNK8vBebXoALjjSFjZ66Ay0sRVorVapWUClDShxjvtaBWxCjN
   OfzGlKunvMJLPwuSrkOTWn53n9e3OiQctPq5ST49ro/xkbgm5FaIDUvKI
   A==;
X-CSE-ConnectionGUID: XrM6VR92TDicAmfpSPZbgw==
X-CSE-MsgGUID: gOyowZACQsOBXcwrFik5gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84522185"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84522185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:02:17 -0800
X-CSE-ConnectionGUID: i/G8HcP5TbGCsooB29xPGw==
X-CSE-MsgGUID: rd2dXeBiQUS5WXBRLnNLfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="219073484"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2026 00:02:12 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyQ8O-000000000Y5-01ip;
	Fri, 06 Mar 2026 08:02:08 +0000
Date: Fri, 6 Mar 2026 16:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
	kernel@collabora.com
Subject: Re: [PATCH v4 5/9] drm/panthor: Part ways with drm_gem_shmem_object
Message-ID: <202603061504.eTxNXzrU-lkp@intel.com>
References: <20260305124320.156606-6-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305124320.156606-6-boris.brezillon@collabora.com>

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20260305]
[cannot apply to linus/master v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-gem-Consider-GEM-object-reclaimable-if-shrinking-fails/20260305-215529
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260305124320.156606-6-boris.brezillon%40collabora.com
patch subject: [PATCH v4 5/9] drm/panthor: Part ways with drm_gem_shmem_object
config: arc-randconfig-r132-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061504.eTxNXzrU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061504.eTxNXzrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061504.eTxNXzrU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panthor/panthor_gem.c:708:35: sparse: sparse: symbol 'panthor_gem_vm_ops' was not declared. Should it be static?

vim +/panthor_gem_vm_ops +708 drivers/gpu/drm/panthor/panthor_gem.c

   707	
 > 708	const struct vm_operations_struct panthor_gem_vm_ops = {
   709		.fault = panthor_gem_fault,
   710		.open = panthor_gem_vm_open,
   711		.close = drm_gem_vm_close,
   712	};
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
