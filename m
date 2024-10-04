Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397011862
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027612; cv=none; b=LN5Rf7il1BI94uf9KJW3f0XienPlWiJxk7WcKbMnGOt3E8JQlibMo00GphfE05dl3dk2wset2ZMHlGyWgDu0Bm8DjH9Km15Up3GsYYSe9Ssc84nUrvePf/swWUy/B+v/h7dqOXD7V6/o7UDzqB/KILdfNxgoU6sa55DkBBpK3pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027612; c=relaxed/simple;
	bh=3B/La+KacEBmIhAFsF0Oa8dVXGaYrL/2BOVdf6/UKZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SnK3B87FesiFhUEFWlm2rCixCnRY4kIcjrBDuaNLb1t8E/2RG7c/Vk3KPaLYfVY4788oazgGLb8JPrJQTft1xxD5sxu5scfFp4T+dthc1QgooyMzeJ2I38PpF0uG5EBSoiIL28q+76czaqbVQrUmcviuO7kDiD2ZLLb/NcU4u4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sem+bIDi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sem+bIDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728027610; x=1759563610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3B/La+KacEBmIhAFsF0Oa8dVXGaYrL/2BOVdf6/UKZ0=;
  b=Sem+bIDiZWrV+68yhMpkZjoYP6eLAfBqd0IXyyLvhB/HUZaUOmywoIuM
   fnu8CA535zULCEUWg3oND+CygvD9BSoO3Zf/u4/thqHIl0dJdkfqfpFrJ
   dAocvwS2cw3GxGxJBXWIttWB3SOaQJpKk+4vha7vPUYH1WvRzhdSLuxmZ
   Lvdi4JAjCArZW8KBAlUK7cIKaDkB71paXjYDNGSyFoHP5Ck9rzhXjJT9v
   Rl7oJL7GsIkVnxn1loooZ/zqfBH39XGkSU/unr2egzOgoOfF2Lfh+Xziu
   XMW2Zeczr7cxppPTiShdY2RF20APIrVta+cqyutEl/G8lXPviKW4ZcFiv
   w==;
X-CSE-ConnectionGUID: yow6kNcwTGulnYzGS+DKKw==
X-CSE-MsgGUID: 2QMatR3kQPOQa9nG+oHx6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="49773654"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="49773654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 00:40:09 -0700
X-CSE-ConnectionGUID: d9ZoEw57QEaN7qt05+04+g==
X-CSE-MsgGUID: iTlhz6u/RGy2lw2mJ1cvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105368582"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2024 00:40:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swcv0-0001Kw-0o;
	Fri, 04 Oct 2024 07:40:06 +0000
Date: Fri, 4 Oct 2024 15:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1261/1491]
 sound/soc/intel/avs/icl.c:136:2: error: use of undeclared identifier
 'icl_enable_logs'; did you mean 'avs_icl_enable_logs'?
Message-ID: <202410041532.ndjIbxgH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 56155cdb22a6c002aa1caa3f84a7364ec06d7b03 [1261/1491] UPSTREAM: ASoC: Intel: avs: ICL-based platforms support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410041532.ndjIbxgH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041532.ndjIbxgH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041532.ndjIbxgH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/icl.c:136:2: error: use of undeclared identifier 'icl_enable_logs'; did you mean 'avs_icl_enable_logs'?
     136 |         AVS_SET_ENABLE_LOGS_OP(icl)
         |         ^
   sound/soc/intel/avs/avs.h:373:17: note: expanded from macro 'AVS_SET_ENABLE_LOGS_OP'
     373 |         .enable_logs = name##_enable_logs
         |                        ^
   <scratch space>:58:1: note: expanded from here
      58 | icl_enable_logs
         | ^
   sound/soc/intel/avs/icl.c:14:5: note: 'avs_icl_enable_logs' declared here
      14 | int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
         |     ^
   1 error generated.


vim +136 sound/soc/intel/avs/icl.c

   120	
   121	const struct avs_dsp_ops avs_icl_dsp_ops = {
   122		.power = avs_dsp_core_power,
   123		.reset = avs_dsp_core_reset,
   124		.stall = avs_dsp_core_stall,
   125		.irq_handler = avs_irq_handler,
   126		.irq_thread = avs_cnl_irq_thread,
   127		.int_control = avs_dsp_interrupt_control,
   128		.load_basefw = avs_hda_load_basefw,
   129		.load_lib = avs_hda_load_library,
   130		.transfer_mods = avs_hda_transfer_modules,
   131		.log_buffer_offset = avs_icl_log_buffer_offset,
   132		.log_buffer_status = avs_apl_log_buffer_status,
   133		.coredump = avs_apl_coredump,
   134		.d0ix_toggle = avs_icl_d0ix_toggle,
   135		.set_d0ix = avs_icl_set_d0ix,
 > 136		AVS_SET_ENABLE_LOGS_OP(icl)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
