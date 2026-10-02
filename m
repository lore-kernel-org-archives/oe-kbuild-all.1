Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E13749F7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944505; cv=none; b=EkoUNlqlgSx0NjYdrhKvbJUEc4zyEwhl0yOVxEW6TCtfGcE8da0FGDlERzitW3qGE1AXtrYxIfk7WwMiL2y0TePyqK3fkV8lPf75oodzzw5xCkQgrSYfBTGqd37vrSASF3c0NoUZYZV2ObzjUlrbHudqq3cof0GZrP8hG8UZ+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944505; c=relaxed/simple;
	bh=55uqquefT7wuE6dDcsDWJfqHcmHVWSrJMWYos+tPwAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nknCa6x0G3L0L44/mOGp7o6V9WMJZfZm5Cv2Rj+v95HLb0UBU67g2Jv7/zvBy33cX7jutPUQ6bxj5ZhA8qW5wL2pTsgoSCaKL4n7vO8h9FYCznYc4vPWGpHLGTTu3Y1ZLAAkFZJJBYa05DUKkruNhf3AF4ua6zsJePOrmD2b2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXjG6spp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXjG6spp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790944503; x=1822480503;
  h=date:from:to:cc:subject:message-id;
  bh=55uqquefT7wuE6dDcsDWJfqHcmHVWSrJMWYos+tPwAU=;
  b=mXjG6spp9cHQCqChlMXFCxKucxbzpAJwRrQeL0+b2l9ZBb6qEhdoUXTo
   iqNUYLd3AkwMGmiKOdGYBi4lA/iqPdQprnXpUeG1Q7Z4O9DrUgi2AFfCZ
   UDNl88+YnagWtegkXEo9+4tTLJqPn56DA0N6342oXqKBeE1Yg8ur13+S/
   HZglT6ziRuKICYI1oK1GJXGVNXptUAE/wuuIksJxmYurvsIg3LIb5hGYc
   zAGmm10bNZL5o3nMDYvCDaZevYe2hewIZqHD/3/8ZlrNuOc4jRs4AtnMQ
   AEpQo8emdrLy5FRKds3lFlmyOhgFrvDsz+T8lU9TP4o4SeJ7wGrTzasdr
   A==;
X-CSE-ConnectionGUID: 0hQcGdLBQiusmEjmemiGbg==
X-CSE-MsgGUID: 5d1uDjdBRXGqGTXW+HSzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="113491871"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="113491871"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 05:35:03 -0700
X-CSE-ConnectionGUID: V6/Tu9xYRQiAc3dL8vVleQ==
X-CSE-MsgGUID: 6ZZ6G5TtS9SYt2FH5ncmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="265831"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 02 Oct 2026 05:35:01 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCcTY-000000000XD-3WuS;
	Fri, 02 Oct 2026 12:34:56 +0000
Date: Fri, 02 Oct 2026 14:34:22 +0200
From: kernel test robot <lkp@intel.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 George Zhang <george.zhang@amd.com>, linux-doc@vger.kernel.org
Subject: [drm-amdgpu:drm-amdgpu-next 3/171] htmldocs:
 Documentation/gpu/amdgpu/display/display-manager:44:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6222: WARNING: Error in
 declarator or parameters
Message-ID: <202610021405.aouP0UDa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Albert,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   b6b1d97218518003107d4446fac278fa3e0a19a0
commit: 7e9fca772695c65f97493272e2e7cd475f202965 [3/171] drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261002/202610021405.aouP0UDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021405.aouP0UDa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ---------------------^
   Documentation/gpu/amdgpu/display/display-manager:29: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c:2271: WARNING: Error in declarator or parameters
   Invalid C declaration: Expected identifier in nested name, got keyword: void [error at 21]
   VISIBLE_IF_KUNIT void dm_dmub_outbox1_low_irq (void *interrupt_params)
   ---------------------^
>> Documentation/gpu/amdgpu/display/display-manager:44: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6222: WARNING: Error in declarator or parameters
   Invalid C declaration: Expected identifier in nested name, got keyword: int [error at 20]
   VISIBLE_IF_KUNIT int amdgpu_dm_atomic_check (struct drm_device *dev, struct drm_atomic_commit *state)
   --------------------^
   Documentation/gpu/amdgpu/display/display-manager:50: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:64: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
