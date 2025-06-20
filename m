Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9421FF28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 20:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750450872; cv=none; b=eRUjz9WP1fIk1pL4/GhFE8qDO67ed1tFq3UjgXwjf2H0eJAZEwab4+ConDiFIO9RDThbcApNONHGAXnjiK3TVsUI1PlttABVvDgE/4DQy//pvGo0tCH7fTBxSP712zD5CtOcIvVBnyZK1tAL9IYSx+2lr4sZGBvdxdqIs86y9mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750450872; c=relaxed/simple;
	bh=XmUiSOtZw4pn2ngjIJk2cAWWl5KJ9Oejsw0garzKI/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bk3jE2rdMMLJriaRQqGCMDkL967dC2K6HQugQ7ejwJWu4ixaZf+8cQSTw9oaBSTf9cd2sLIfmcnd6WN6sf3w35OkIk37eOPQCJqTVb44/e4A5GH9BTOM9kEu9d69BFtA0YV4U3LSUT59XjOmimal6Jtag34akhkt3NmVY8v2jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKYXc46/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKYXc46/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750450871; x=1781986871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmUiSOtZw4pn2ngjIJk2cAWWl5KJ9Oejsw0garzKI/A=;
  b=eKYXc46//e6cSKj+HHLKZs488q77zJlP1GGYPC8SIKlr9asTSxLARqWr
   MZu2tAFqKBP8v2wBM67gqy1tpZf7OyYwG1nYtItVW5l/ZTPd3834rezao
   vTVayz/wuHqVVMPwTfC9j9xaJ0oXlHZ1i6auubDsmh83YPvuY6W5KizTF
   LJ5lqTS0vqGR5Vc3XbpFlpwLGDn4YurlUWD8xddcLKCaSoUwKdzedjPvt
   7CSligvMaNP11Uox3KzMm8GlgYC+0PJqpLX+qXK561VbdAKV760vZe2lu
   2NaAn9OMT3mD8N0Ew0CA7uCwN3Cs3/7nbhQw0WMYc0KxXToqDiprk3KYQ
   g==;
X-CSE-ConnectionGUID: H42DbUFqSsqBss0vNArp1Q==
X-CSE-MsgGUID: L8otHe9mTZCKtxDKMUa4oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52868826"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52868826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 13:21:10 -0700
X-CSE-ConnectionGUID: LMbJ9m9ORIaxpNjShKET9A==
X-CSE-MsgGUID: Y229qC4STUCF03I/PF+BZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151302079"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2025 13:21:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSiEV-000M8K-1d;
	Fri, 20 Jun 2025 20:21:07 +0000
Date: Sat, 21 Jun 2025 04:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [agd5f:kq_resets 12/35]
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:740: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202506210401.54n8AMH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git kq_resets
head:   913a6a46f5130fdd3baf24bc4425c81ac238070f
commit: 897a07925f1b164d513618042dcfcfdfaab43e4d [12/35] drm/amdgpu: track ring state associated with a fence
config: sparc64-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250621/202506210401.54n8AMH4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210401.54n8AMH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210401.54n8AMH4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:740: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Kernel queue reset handling


vim +740 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

   737	
   738	
   739	/**
 > 740	 * Kernel queue reset handling
   741	 *
   742	 * The driver can reset individual queues for most engines, but those queues
   743	 * may contain work from multiple contexts.  Resetting the queue will reset
   744	 * lose all of that state.  In order to minimize the collatoral damage, the
   745	 * driver will save the ring contents which are not associated with the guilty
   746	 * context prior to resetting the queue.  After resetting the queue the queue
   747	 * contents from the other contexts is re-emitted to the rings so that it can
   748	 * be processed by the engine.  To handle this, we save the queue's write
   749	 * pointer (wptr) in the fences associated with each context.  If we get a
   750	 * queue timeout, we can then use the wptrs from the fences to determine
   751	 * which data needs to be saved out of the queue's ring buffer.
   752	 */
   753	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
