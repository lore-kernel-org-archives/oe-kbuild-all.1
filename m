Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452FA3451A9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294220; cv=none; b=DpfVjS0xDPqiqirq+6x08BNHm3HCwlT4XO6EyIUo/+opCdabS3GgRIfNY5wRzVF/KCsf5Fh6TtDOoGR7qN9naqdQLTtn2Zp7vbQvaFqsT88Hk5p27hKQP6UOgxvIg1+eorhBZvOmASDDHpn+vQzKFcqCJlid/BZOpizpPOmuIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294220; c=relaxed/simple;
	bh=JK6pTv4ncQW6TAjv6JmIeVfudv1sH/Ynj38QdpK883k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eYTIFiiSqQlUmDHA1CIFeTfi3JAABsL9+lIMyQFZaZZd4rHRHUfHq762s1gqlRUisJ5GsbKR0uKj/40U5QffS0YenqKGkzjKIkcDmZa5pIcYLDu+HF1XtNNNgd6pbw+K4swvtHRS+3qbkyKyLJ2nuDj9FICOhBuKCONh03sDajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YncEB+yN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YncEB+yN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780294218; x=1811830218;
  h=date:from:to:cc:subject:message-id;
  bh=JK6pTv4ncQW6TAjv6JmIeVfudv1sH/Ynj38QdpK883k=;
  b=YncEB+yN9nN20WaUg/FdYQMK0I1eNZIUUT22jnH6V9y3z2WuLUmJ4VYh
   U33qAa5wPWe+CUTqP2wt1BNdV0kBYTzQzEDFYmpCGNNM/ZefErOQA9OdH
   XOyezksANzMB7UjbzbeY9Ow1ZTvEO+puvl4fXnaiari4M+2P0iOMWuYHI
   IcdSihjZ1lLiSG3a6QKqO5R3TqKV+GfnU1xmsB3C2qebRUBi3kvj6xiGO
   adaOaAwptAnw5IC+lblC3r+FeNbCY0JLMXSebG2WEwNHOHro9ZjpdKJn2
   beHpSCNPUsYiRd3vJVf2TFlIaerRRPVotxqkONPbOo9ZWUzC1HMrmuCdC
   g==;
X-CSE-ConnectionGUID: +F1KlzJGTL2T0LGcsq5Hzw==
X-CSE-MsgGUID: RAnrOnxQSaqA0ezklC2ilg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="98611987"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="98611987"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 23:10:18 -0700
X-CSE-ConnectionGUID: DDmYhEV/Tfmj9yNE3zrz9Q==
X-CSE-MsgGUID: JWbCfrzdR2y1BY5zV1nf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="281604335"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2026 23:10:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTvqn-00000000AF6-33oS;
	Mon, 01 Jun 2026 06:10:13 +0000
Date: Mon, 01 Jun 2026 14:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [superm1:superm1/backlight-property-v5 9/21] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function
 parameter 'adev' not described in 'amdgpu_dm_set_vline_irq_state'
Message-ID: <202606011424.PaP0dRem-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/backlight-property-v5
head:   5f2330560c00d587cd173ee4222011b62e1ac567
commit: 4dbf62273708e62ea3d1532671b4e5c26f722b8b [9/21] drm/amd/display: Use vline2 interrupt on DCN instead of vstartup
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260601/202606011424.PaP0dRem-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011424.PaP0dRem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606011424.PaP0dRem-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'adev' not described in 'amdgpu_dm_set_vline_irq_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'source' not described in 'amdgpu_dm_set_vline_irq_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'vline_crtc_id' not described in 'amdgpu_dm_set_vline_irq_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'state' not described in 'amdgpu_dm_set_vline_irq_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'adev' not described in 'amdgpu_dm_set_vline_irq_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'source' not described in 'amdgpu_dm_set_vline_irq_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'vline_crtc_id' not described in 'amdgpu_dm_set_vline_irq_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:805 function parameter 'state' not described in 'amdgpu_dm_set_vline_irq_state'
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:662 function parameter 'otg_inst' not described in '__dm_crtc_high_irq'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:662 expecting prototype for dm_crtc_high_irq(). Prototype was for __dm_crtc_high_irq() instead
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:803 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Same as dm_crtc_high_irq, but driven by the vline2 interrupt instead.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
