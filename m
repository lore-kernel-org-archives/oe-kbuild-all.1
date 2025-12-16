Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD25270568
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929203; cv=none; b=E2hdju+urSwiErp48QUwTBHFZ2paRW473cwi7NTJYunbv/t2ITPd2CGqLT+EKbdVEKVBZNzibwH+TXKAxSVsvhQKOrXudXwcyuAQLkVupRsqFCIvBm4TrrWBlf/+3Qf6XCAzPdx4FALm0bMA3Bx6+ujuMGDa5/A3az/3CPzG2i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929203; c=relaxed/simple;
	bh=PgBuoupMXSboEfRRIoBVVSJb2asLLwP/Bj+MZ7aA54g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5sUjhpdyPLayd+eAhZD2IZiHzYjztbxz3Ux1xaMbyYCVakv3VBiy0e79Rq5VEeCSDH34qv+tGPr7P+iQiozbPMPdNJEGlU+gjmKasHhvHR1Z6HfLH/B64WkVIQx2mbF2M2vyISml/SPYyaW4OvGnQxR6SyqwZGKx/niYgwaiu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXynQH0e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXynQH0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765929201; x=1797465201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PgBuoupMXSboEfRRIoBVVSJb2asLLwP/Bj+MZ7aA54g=;
  b=JXynQH0eq+HeSjP5wFxZrXsohTzLUU6wbjw5OoSJXu3r00cG5zbzH1Zn
   /MZGTeTgnARhN54OlY8lGCwr2m9CO75+iTr4uC8Sf+pEf8pQumMkmQzGC
   6TAYjRU7gRmTglOlEmRserugB/VCVwg257IV8GSLw/KZFW6EBZUmq+aCU
   LTXkTmHJ8ZQe14hxRwhN/ONZUUtfzwEfCk40sxFIJX84nIZv14vPVeLdu
   sIG2+n+7CdQDDvOo3HaMp0pYCoFnBLZuz46IhPnRNtf/3QGb8NT00RCy1
   A5PRqiE9jv+mS1uhEeggH2uUDmWORRrPXqKAnrcEYmzrYt0EnmVzfyUbI
   g==;
X-CSE-ConnectionGUID: W39zz2scSo+S6heWU/fWrQ==
X-CSE-MsgGUID: X+gVzRvdTiyha4/uLCkpXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="66847421"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="66847421"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 15:53:20 -0800
X-CSE-ConnectionGUID: yvrcuOFsSOyUvcfxxCAl9A==
X-CSE-MsgGUID: pNVeeXiuTfqRIxTVBqHgJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="197895338"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 15:53:19 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVeqy-000000003x2-2LxF;
	Tue, 16 Dec 2025 23:53:16 +0000
Date: Wed, 17 Dec 2025 07:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <Dillon.Varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Fangzhi Zuo <jerry.zuo@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:862
 dmub_srv_fb_cmd_execute() warn: inconsistent indenting
Message-ID: <202512170744.uf0ZH7hV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: a3b7dc4a1ec4e184f48c2f8205d2ec88d31310fe drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs
date:   8 months ago
config: alpha-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251217/202512170744.uf0ZH7hV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170744.uf0ZH7hV-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:862 dmub_srv_fb_cmd_execute() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:961 dmub_srv_wait_for_pending() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:994 dmub_srv_wait_for_idle() warn: inconsistent indenting

vim +862 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c

   842	
   843	enum dmub_status dmub_srv_fb_cmd_execute(struct dmub_srv *dmub)
   844	{
   845		struct dmub_rb flush_rb;
   846	
   847		if (!dmub->hw_init)
   848			return DMUB_STATUS_INVALID;
   849	
   850		if (dmub->power_state != DMUB_POWER_STATE_D0)
   851			return DMUB_STATUS_POWER_STATE_D3;
   852	
   853		/**
   854		 * Read back all the queued commands to ensure that they've
   855		 * been flushed to framebuffer memory. Otherwise DMCUB might
   856		 * read back stale, fully invalid or partially invalid data.
   857		 */
   858		flush_rb = dmub->inbox1.rb;
   859		flush_rb.rptr = dmub->inbox1_last_wptr;
   860		dmub_rb_flush_pending(&flush_rb);
   861	
 > 862			dmub->hw_funcs.set_inbox1_wptr(dmub, dmub->inbox1.rb.wrpt);
   863	
   864		dmub->inbox1_last_wptr = dmub->inbox1.rb.wrpt;
   865	
   866		return DMUB_STATUS_OK;
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
