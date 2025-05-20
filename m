Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F45D79CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759870; cv=none; b=cSKLZObnVbI4jWEOPdNpfUGdNxOyWqkZYV35YIhxayDeDrmYskyOaEo3c+xnYS9+aQd1+AvHMyMIqxaXcSKSYctrS7+S25WpLKjOmzwACqpAC90mnX7IsYFWJHj1ZhpQT4aBbztsp++kzWgPJ/uMX5EtTf106nlXLpOKIQYmtok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759870; c=relaxed/simple;
	bh=izt0ndj0kJS0aLONOt9MZ913RhTLLTvvgF7KcBvwetM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=opMJZ0yCuTI8YOfpYpWiZxKdilkPsA/q5aLe4LJoY/I6sS/p7dZiw8REKLKr6HLj+QN7AwB/lXnOnaUNXKBwmojyh+XfLOeWutBmEJa0KmYk7XgTDAqnEEQH3emkIxTrB6h0RgoQZsEWybsxiEzdu2fuVZxFwCSZ96jiYEjGH+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moFS2pX1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moFS2pX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747759866; x=1779295866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izt0ndj0kJS0aLONOt9MZ913RhTLLTvvgF7KcBvwetM=;
  b=moFS2pX11apFvovIRGMe+u7HuiSj0XwAAPZMd7XH3jxrSNDr6TrMlQNH
   gk7I1nNgdJSoC9/Zr4X/6VtBhA44VgPxKZQFgyK8eIdZYy/0zl1V7Cc4k
   U9Nz7HWhB8F2XYff5QzLNrzCwdnFqT+yjJX9kcM7nFe2SqcIrhlgNJCmH
   zbYnzil7ouZIO+0+y13QhvwVy7Lxn+aCHzCFoaZa7mzrNMpwy2gndSVn8
   HtohvnYybGpqEo2z4XdUIdyFDPZ9pMTEtFIY1YJ3z7yfR132Em/I3H/+B
   W2//+27Y1hFxfPHPeAEAtnygQiWuderWi8AaYf3yxF2GPNKdPkA4NC6o1
   A==;
X-CSE-ConnectionGUID: C3w/p5W4RE+BatL8Wp953A==
X-CSE-MsgGUID: mkibfyTMTES8vKVbpYt/vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52333615"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52333615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:51:05 -0700
X-CSE-ConnectionGUID: UfOC7JLqQTudNRXcb1djgQ==
X-CSE-MsgGUID: LSswtJ12T26Bgbz3/NBwQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144719874"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2025 09:51:05 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQBC-000107-0L;
	Tue, 20 May 2025 16:51:02 +0000
Date: Wed, 21 May 2025 00:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-04 0/1]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:285:6: warning:
 no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear'
Message-ID: <202505210054.bOakKmzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-04
head:   563a3050191027317f4c6206c4c69da9e9fc699e
commit: d919f493bb7dc4d0b568039b728eb44ca961ebaa [0/1] drm/amd/display: Do not commit pipe when updating DRR
config: x86_64-buildonly-randconfig-2004-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210054.bOakKmzc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210054.bOakKmzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210054.bOakKmzc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:285:6: warning: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Wmissing-prototypes]
     285 | void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:32:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/optc3_wait_drr_doublebuffer_pending_clear +285 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c

   284	
 > 285	void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
   286	{
   287		struct optc *optc1 = DCN10TG_FROM_TG(optc);
   288	
   289		REG_WAIT(OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_PENDING, 0, 2, 100000); /* 1 vupdate at 5hz */
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
