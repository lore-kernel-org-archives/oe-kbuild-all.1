Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47B54C0428
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001183; cv=none; b=eAox/GZwqPjJDEYqZVLXkoDD9bdP5225dJntCH0FZkdUAvQrx+IBk52cTaHNhTcL8FLn/ooUNOudu4sFp4T8Di8KcnA5zjYVuqoTgrXel4sJYxE7T6x/OCLvZ8evkV2rbIlHjlZP8MQDL+JbUpwBun8+yRTl79kucPiH5RQ0x0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001183; c=relaxed/simple;
	bh=eY5mTsIy2QqAaF4zjzKkGA237xSd/ocD7I+hUaf4ksw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UjLcllaKhm93YohQ7EC0HmXmeN5+jtRnq8vRi0+sjutpirnPOyEKxEJtiyPYwHR8YgKyPPoXVFVzVSTekzwGDGss3BxBlBcp8NfJ0Ms5kdTv9/AjIb3tTpBG1YyD1U0MD/wlKJ9SOd1iXgGxQi/X9qz90cjNGvCWpyrvE/frYiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AM77w/7q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AM77w/7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783001182; x=1814537182;
  h=date:from:to:cc:subject:message-id;
  bh=eY5mTsIy2QqAaF4zjzKkGA237xSd/ocD7I+hUaf4ksw=;
  b=AM77w/7qakLwUbYICkK0RD3xJPX5DcqLT8cR7BpoGmYgz+nwBPxT9tpo
   V1QxsgOFhURroej537OnssAIUyXhAX2jAL6mHCCWhSUC0TTjhgDQmeYxR
   k4c8ldnsT/VClX5Tq3LWfPWJCB/+DUm+QcYwwUpi5nYiqz29nZnZ4RCFF
   YB5oxCSI7kHRz/YAjRUD2+VN0VDa+SXdRd5MsA6lwIxa0OvuoWR0jBfPM
   7Rm+w8zAvRQOx2p4eo675Wv5vGDhQBVGB+X3gxReFdEg7x2qV3Q/dvFm9
   lcekYqilW67HHIyxrhsnkaC2O70UTlJ6KEwQ9y0kKOfVsogR9LVHc+V9y
   g==;
X-CSE-ConnectionGUID: K2JoF8k6TRCW2fWjfOGptw==
X-CSE-MsgGUID: ANhv8BoxTt+ZfkwqRdfB3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94410970"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94410970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:06:06 -0700
X-CSE-ConnectionGUID: SOOLmyYoQfmWgyrwFLalpg==
X-CSE-MsgGUID: BKQ/lnXDRH2132kkCOvBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256459927"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2026 07:06:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfI3G-00000000Aq3-0s7x;
	Thu, 02 Jul 2026 14:06:02 +0000
Date: Thu, 02 Jul 2026 22:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sonny Jiang <sonjiang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:274
 jpeg_v5_0_2_hw_fini() warn: inconsistent indenting
Message-ID: <202607022154.oRgbWKS5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 855e3e19f69c0133a98dfae3ec9d26089cd50e77 drm/amdgpu: Add JPEG_v5_0_2 IP block
date:   4 months ago
config: sparc-randconfig-r071-20260702 (https://download.01.org/0day-ci/archive/20260702/202607022154.oRgbWKS5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 855e3e19f69c ("drm/amdgpu: Add JPEG_v5_0_2 IP block")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022154.oRgbWKS5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:274 jpeg_v5_0_2_hw_fini() warn: inconsistent indenting

vim +274 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c

   259	
   260	/**
   261	 * jpeg_v5_0_2_hw_fini - stop the hardware block
   262	 *
   263	 * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
   264	 *
   265	 * Stop the JPEG block, mark ring as not ready any more
   266	 */
   267	static int jpeg_v5_0_2_hw_fini(struct amdgpu_ip_block *ip_block)
   268	{
   269		struct amdgpu_device *adev = ip_block->adev;
   270		int ret = 0;
   271	
   272		cancel_delayed_work_sync(&adev->jpeg.idle_work);
   273	
 > 274			if (adev->jpeg.cur_state != AMD_PG_STATE_GATE)
   275				ret = jpeg_v5_0_2_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
   276	
   277		return ret;
   278	}
   279	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
