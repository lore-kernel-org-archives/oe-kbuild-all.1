Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51C1420A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 22:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734992477; cv=none; b=YAAPMuG0kKeByJxTB/9T2mHrqkK/zOk7FZUZyH3nV+rDwxDMsCT7QByocnMStXA3acPsiiWaexi/ndBOntoEn+TQ4B7IYKbQoXAjEGOBjnj5ZQznF9ZZGJwnS4cyqS15d9g5oFCe2VbuL0LCIQ2FMoJT+4G1Y33PmcL+7HTAKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734992477; c=relaxed/simple;
	bh=nsAkAhqzarC6U1ZZHOKJFeHILyVc05PZ1B0BHkrXTvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Anicho2zsc18ywkyXVhJgSgSz8ZoKJZyXldptOtWRJO5HtX5SBPQo+MOv9oyO5YKNqjPWbh/NH4nO46Qz+K/DGLbGqkHUDX76O41ByZClU8e81d3GAPTXtYrcZFlldSw4UqXMmBDeVDkoLdlrtNAubtx2UZEe3L5YLm6xhnbakg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMmDWOsy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMmDWOsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734992475; x=1766528475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nsAkAhqzarC6U1ZZHOKJFeHILyVc05PZ1B0BHkrXTvA=;
  b=JMmDWOsyIMINrE4BO5AbULXzT8o2xHHsI3tCjjadrSo5qH3ST462ZUaH
   t1Mv4niovKJS0FJqVRbTjoVft1i47ieyzC4Fx96CW3uj7bCicmBMw9rca
   GY+2ufRbXx1YZQMSk3k16pRJzvph0VMYgtqXLH8r2TWSvqk0z6A90bEc6
   Am+kOQPuEt6HZOjKywCAxY6lUMfFsPvaRylIl454TsXEMrUz8ZizLLmaC
   GLFCnwZi3qTyoEg9i0N5F2G0GFPNzW6WtcLrRMaTWaba5Hi23jwDnPxZq
   +/o0fpI/TglZvd0jcj5ykUabP+OG3p3ju0aIzcfxPLyJObmFA+QGYSvje
   A==;
X-CSE-ConnectionGUID: p7ofKz+wTqSeo0D4pQFauQ==
X-CSE-MsgGUID: bga/FFHoQsq5GjjowO93pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35601051"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35601051"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 14:21:15 -0800
X-CSE-ConnectionGUID: IOWqmUKgQ5OIQPNXMivrIQ==
X-CSE-MsgGUID: ybIbxBh7TiyszUIXEkkQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99174290"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2024 14:21:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPqnX-0000eZ-2R;
	Mon, 23 Dec 2024 22:21:11 +0000
Date: Tue, 24 Dec 2024 06:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 19/19] drivers/gpu/drm/drm_auth.c:241:49:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202412240609.SjN0goOR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   8decd833dcf6e8e368c99562c3437b9113fcffad
commit: f507c4c70b9fc2100b92cc4168f4adfdb8360d7b [19/19] CHROMIUM: drm: Add drm_master_relax debugfs file (non-root set/drop master ioctls)
config: arm-randconfig-r113-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240609.SjN0goOR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241224/202412240609.SjN0goOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240609.SjN0goOR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_auth.c:241:49: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/drm_auth.c:241:49: sparse:    struct pid [noderef] __rcu *
   drivers/gpu/drm/drm_auth.c:241:49: sparse:    struct pid *
   drivers/gpu/drm/drm_auth.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +241 drivers/gpu/drm/drm_auth.c

   189	
   190	/*
   191	 * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
   192	 * CAP_SYS_ADMIN was not set. This was used to prevent rogue applications
   193	 * from becoming master and/or failing to release it.
   194	 *
   195	 * At the same time, the first client (for a given VT) is _always_ master.
   196	 * Thus in order for the ioctls to succeed, one had to _explicitly_ run the
   197	 * application as root or flip the setuid bit.
   198	 *
   199	 * If the CAP_SYS_ADMIN was missing, no other client could become master...
   200	 * EVER :-( Leading to a) the graphics session dying badly or b) a completely
   201	 * locked session.
   202	 *
   203	 *
   204	 * As some point systemd-logind was introduced to orchestrate and delegate
   205	 * master as applicable. It does so by opening the fd and passing it to users
   206	 * while in itself logind a) does the set/drop master per users' request and
   207	 * b)  * implicitly drops master on VT switch.
   208	 *
   209	 * Even though logind looks like the future, there are a few issues:
   210	 *  - some platforms don't have equivalent (Android, CrOS, some BSDs) so
   211	 * root is required _solely_ for SET/DROP MASTER.
   212	 *  - applications may not be updated to use it,
   213	 *  - any client which fails to drop master* can DoS the application using
   214	 * logind, to a varying degree.
   215	 *
   216	 * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MASTER.
   217	 *
   218	 *
   219	 * Here we implement the next best thing:
   220	 *  - ensure the logind style of fd passing works unchanged, and
   221	 *  - allow a client to drop/set master, iff it is/was master at a given point
   222	 * in time.
   223	 *
   224	 * Note: DROP_MASTER cannot be free for all, as an arbitrator user could:
   225	 *  - DoS/crash the arbitrator - details would be implementation specific
   226	 *  - open the node, become master implicitly and cause issues
   227	 *
   228	 * As a result this fixes the following when using root-less build w/o logind
   229	 * - startx
   230	 * - weston
   231	 * - various compositors based on wlroots
   232	 */
   233	static int
   234	drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
   235	{
   236		/*
   237		 * Despite the above explanation and reasoning, we still have to check
   238		 * drm_master_relax. With frecon, the was_master flag is true, but the
   239		 * file pid and the task pid pointers (and the actual PIDs) don't match.
   240		 */
 > 241		if ((drm_master_relax || file_priv->pid == task_pid(current)) && file_priv->was_master)
   242			return 0;
   243	
   244		if (!capable(CAP_SYS_ADMIN))
   245			return -EACCES;
   246	
   247		return 0;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
