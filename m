Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E034B41C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761757205; cv=none; b=AcjdYe6A92b/sVfKW2w1pJ9TCNPYxTx1Prhz8vcZCLDG528bWR7pIFBsdIP+/xQd3hbgb0Dl8BKmlPuA8BneOh6qkfMnKxlLj+bNREfaN1mDDteCr4bJwTD1M2lSsCsCe4FYqdoyCAlsPgTV3FNQrw+GFKW2WNC2Nqd5Rkxp+uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761757205; c=relaxed/simple;
	bh=4ti0LYCLfjG587u3vG6H1GuDTptm80UE1d0vq8dabe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=theigroYrx8S17xcxS69ujh0pj87MBWPGkkexikY8FKHd7/FvVzuNsIsFgC2FPr8xTe3nn+Ky2Cm0N0vaDfnLUucNxv/rA1AfAVq4qqyF4EdL/zj0kZMM0zuGht/jNktM63UcMOzabZk8DBoDpcNcd+gfDjzqPLtG57tfo0Gpgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6/DAXoM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6/DAXoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761757204; x=1793293204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ti0LYCLfjG587u3vG6H1GuDTptm80UE1d0vq8dabe0=;
  b=T6/DAXoMXVUCkrw/dwht4e3X4S/APAMjf0ju9Je4ys3ciNd3T7LGoeTS
   x2w3kD9rFb2oFmKEeoLkVGgb66PJpXIfAmdEH5funvjIB7EEQdhkU91Zz
   k03W6/C1fEOjO4KbeQHVKqeXx2mS69rTWT1dxllI6LTGoM34so0Qj1LTS
   oIJ5pQZShPV+aiK8YrC+aizSXlGXAwyQIONEakNzX/Ipe0vWgvRe5mIfU
   jo7UdWcGmb9e96g6ASP2UP/EJlsth1FTRyvcp+sThCYvQcKnSozHEc4zy
   hjeaQoWlnyD5U6Vak6rys+E2dRS3bXqe+ob0DLKTzDn6ow2upn25m0c9d
   Q==;
X-CSE-ConnectionGUID: VSt0aidfQmaVeiTFSe67ag==
X-CSE-MsgGUID: 6QEJ0YPjT7mZ0A0Tg95afA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63925593"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63925593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:00:03 -0700
X-CSE-ConnectionGUID: mNCV2RoUS3qtRrwfzA/2cg==
X-CSE-MsgGUID: 1rEQKqLgTreMB2JdHw+Dcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186467653"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 10:00:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE9Wg-000Kop-2T;
	Wed, 29 Oct 2025 16:59:58 +0000
Date: Thu, 30 Oct 2025 00:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 4384/4731]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1250
 amdgpu_userq_start_sched_for_enforce_isolation() warn: inconsistent
 indenting
Message-ID: <202510300033.pwwkKnVb-lkp@intel.com>
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
commit: f18719ef4bb7b0e48dee92703b01e16f6c0d6318 [4384/4731] drm/amdgpu: Convert amdgpu userqueue management from IDR to XArray
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300033.pwwkKnVb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300033.pwwkKnVb-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1250 amdgpu_userq_start_sched_for_enforce_isolation() warn: inconsistent indenting

vim +1250 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c

94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1230  
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1231  int amdgpu_userq_start_sched_for_enforce_isolation(struct amdgpu_device *adev,
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1232  						   u32 idx)
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1233  {
42a66677805d03 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Alex Deucher 2025-04-16  1234  	u32 ip_mask = amdgpu_userq_get_supported_ip_mask(adev);
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1235  	struct amdgpu_usermode_queue *queue;
f18719ef4bb7b0 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Jesse.Zhang  2025-10-21  1236  	struct amdgpu_userq_mgr *uqm;
f18719ef4bb7b0 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Jesse.Zhang  2025-10-21  1237  	unsigned long queue_id;
e67b95f0cd5e8d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-12  1238  	int ret = 0, r;
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1239  
ba324ffb25999e drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-16  1240  	/* only need to stop gfx/compute */
ba324ffb25999e drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-16  1241  	if (!(ip_mask & ((1 << AMDGPU_HW_IP_GFX) | (1 << AMDGPU_HW_IP_COMPUTE))))
ba324ffb25999e drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-16  1242  		return 0;
ba324ffb25999e drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-16  1243  
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1244  	if (!adev->userq_halt_for_enforce_isolation)
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1245  		dev_warn(adev->dev, "userq scheduling already started!\n");
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1246  	adev->userq_halt_for_enforce_isolation = false;
f18719ef4bb7b0 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Jesse.Zhang  2025-10-21  1247  	xa_for_each(&adev->userq_doorbell_xa, queue_id, queue) {
f18719ef4bb7b0 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Jesse.Zhang  2025-10-21  1248  		uqm = queue->userq_mgr;
482d48533257fd drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Alex Deucher 2025-04-25  1249  		mutex_lock(&uqm->userq_mutex);
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10 @1250  			if (((queue->queue_type == AMDGPU_HW_IP_GFX) ||
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1251  			     (queue->queue_type == AMDGPU_HW_IP_COMPUTE)) &&
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1252  			    (queue->xcp_id == idx)) {
bb1d7f157e3d23 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Jesse.Zhang  2025-08-05  1253  				r = amdgpu_userq_restore_helper(uqm, queue);
e67b95f0cd5e8d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-12  1254  				if (r)
e67b95f0cd5e8d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-12  1255  					ret = r;
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1256  			}
482d48533257fd drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Alex Deucher 2025-04-25  1257  		mutex_unlock(&uqm->userq_mutex);
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1258  	}
f18719ef4bb7b0 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Jesse.Zhang  2025-10-21  1259  
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1260  	return ret;
94976e7e5ede65 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher 2025-04-10  1261  }
2e7ceac0ea4192 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Prike Liang  2025-09-19  1262  

:::::: The code at line 1250 was first introduced by commit
:::::: 94976e7e5ede65f9dfad669b1ea7170320f08399 drm/amdgpu/userq: add helpers to start/stop scheduling

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
