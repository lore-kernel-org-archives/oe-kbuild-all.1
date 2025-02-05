Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E922A1CA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747396; cv=none; b=PWX1qNf2DRiKE3G0d12O6LOAxkcmPq/TDenUjF3hqQVAqXcS+xggok4UH8oSDsBbdcdSHYzQ6Yq3zj9zL9+1A8HURF4ZRtXBK41O6FBWYv1c8yI7zmcbtqqXTvuUff6Y/S3VK5ZkO2MOhSsYBFPRPFfoaxgu9WMmrPJvAZa/eIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747396; c=relaxed/simple;
	bh=OblW3Mp4fh7xQsVzCRzyDI2gtgcU4yI5JabENeciShM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mkv40jcSeFxbyXTkfTv2HefcLx6Fn6TXhipovNdaf0BRkbDECCLrZjrq6Cck4BUTcsEJegocuzpdpnOIY0qs81QDoDYP4CGEUQQEw74azrDV4xAu/yEluH0cWexZf1d98YgQRGCLuQMxxr00gt/p/sR9GA37fMMU4EJykWUCF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnEwFwtN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnEwFwtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747395; x=1770283395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OblW3Mp4fh7xQsVzCRzyDI2gtgcU4yI5JabENeciShM=;
  b=fnEwFwtN5tVqa8GOQa7pLOJxAS6hYdFTBhbHzKMm6JX/gYH9mQN+nHV6
   KJJnRc8haHwE1o0qOV1m2B4OpW8WUhhdnxjEPSZ06QRp/t1LEpWBKjpSY
   KUYXhIGDVG0rETZ7kOMgcpTqz+0oIQUsYEvp7lo0o94No5gyG0Q+cmyqk
   VB6DC2gGhWNYlbbhxO1MP+QxrqN0Ad9fVmVjA3eAVTJdBgmsK90uxiWr9
   t4oLkTugM74D2TBPxpd0wjf4eGz31y0cU7x9SkdL14ZdtzjhwmAesmcan
   fgHAi9x5qstd/WTcWxGVfY+TcBxTIJGt4oeVACDW+hTzsG48Wg9RN/u7B
   Q==;
X-CSE-ConnectionGUID: s9BZ67HkTOCVt1Pov5aKUQ==
X-CSE-MsgGUID: pyDkSkmBRNKHyHwy6lQZvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39198842"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39198842"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:23:14 -0800
X-CSE-ConnectionGUID: jXadj6TIQreGtih+WD5saQ==
X-CSE-MsgGUID: uiPKJoajRZKSo15QnBqroA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110826750"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 01:23:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfbcl-000tgv-2B;
	Wed, 05 Feb 2025 09:23:11 +0000
Date: Wed, 5 Feb 2025 17:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/firmware/arm_scmi/tinysys-scmi-drv.c:71:5: warning: no previous
 prototype for function 'scmi_tinysys_notifier_fn'
Message-ID: <202502051753.LxJdjtY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: f1e104ed61ffbb353b91e2a25e09f96ac805bd4c [192/192] CHROMIUM: firmware: arm_scmi: Porting tinysys_scmi driver
config: i386-buildonly-randconfig-006-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051753.LxJdjtY4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051753.LxJdjtY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051753.LxJdjtY4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/tinysys-scmi-drv.c:71:5: warning: no previous prototype for function 'scmi_tinysys_notifier_fn' [-Wmissing-prototypes]
      71 | int scmi_tinysys_notifier_fn(struct notifier_block *nb,
         |     ^
   drivers/firmware/arm_scmi/tinysys-scmi-drv.c:71:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      71 | int scmi_tinysys_notifier_fn(struct notifier_block *nb,
         | ^
         | static 
   1 warning generated.


vim +/scmi_tinysys_notifier_fn +71 drivers/firmware/arm_scmi/tinysys-scmi-drv.c

    70	
  > 71	int scmi_tinysys_notifier_fn(struct notifier_block *nb,
    72				unsigned long action, void *data)
    73	{
    74		struct scmi_tinysys_notifier_report *r = data;
    75		struct scmi_tinysys_report_st *report = (struct scmi_tinysys_report_st *)&(r->f_id);
    76		f_handler_t func;
    77	
    78		dev_dbg(&(t_info->sdev->dev), "scmi notify report ktime:%lld f_id:%d p1:%d %d %d %d\n",
    79			r->timestamp, r->f_id, r->p1_status, r->p2_status, r->p3_status,
    80			r->p4_status);
    81	
    82		if (r->f_id < SCMI_TINYSYS_CB_MAX) {
    83	
    84			func = cb_array[r->f_id];
    85			if (func)
    86				func(r->f_id, report);
    87		}
    88		return NOTIFY_OK;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
