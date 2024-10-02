Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D157198A1A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727887588; cv=none; b=RRK51a83nb2XMnXhsj0XWXfVU6N5+m2MLSu+lQpXJoOtZgFkAlFpZvKChM45wjPAWo+grNs70ACA6UIBEIeG+a7Bs0RHejaXk3TaLAlCaYLzTxaTTdyFe7MBunpHqo/lvLCxb1ioKIsjrySQyTpwwINL/7R4MVvG9FXU2jxQhlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727887588; c=relaxed/simple;
	bh=yEWL21qrxkYSHWI5qGkejrpMpHgfzMeeL/94F/shyMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTmKkjaBnoGERv21qK/14znzIgc2qMX6ixainavpfcL/1SYK3J4TkfQS0lHh5bYvgtRiBWaJm6KCdmezjpvTZJDX5fnYi951/gzzJz7/nIk/nHNJm3Iz0gGHBFOv515oYq8ZckbLYOrMHCuvNsEhj+D7iyNmDCRNvLbvbErbG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQa8foMb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQa8foMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727887587; x=1759423587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEWL21qrxkYSHWI5qGkejrpMpHgfzMeeL/94F/shyMw=;
  b=RQa8foMb6/4bLhBLgMmvRJqEkkm/y3g26n9U546sXt+1lJpnNFuCfcwk
   /VKY9UYIlaRGd5T9Sd2evX8RRbrc5cIOZ8Gi6I6tcglXjgHHKw/PrI2Za
   Lt9w/jT8BSkW0YU1yPYE3QufO/3wUbuZ57oepqjR0uGAIERRpwi9VcuXO
   2mScsFMFAWLwMoAR6CgqGuOaSvm8zK3mnhPIiY9HW4SKBUrmRIUUbDqcA
   bd7ij3cmhcUjvHFniNmlgO2zQa0nkmqWgHibY0T81/N+n7bvNkP6yAc4l
   4ClEqIby8+B3vvkYShzZljb2ju/WPWC20gpvUuG7/cMywU5TYb7c0DMlP
   g==;
X-CSE-ConnectionGUID: siuBpA9tQCu3sTlWVwj5fg==
X-CSE-MsgGUID: IU14iolaTx+7ERn6pEfvuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37651372"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="37651372"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 09:37:24 -0700
X-CSE-ConnectionGUID: YrpCtKsYSgiWYVBLxfjqag==
X-CSE-MsgGUID: NQZNhBdLRMGXqJgfAxbE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74054932"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2024 09:37:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw2Lo-000UFU-1c;
	Wed, 02 Oct 2024 16:37:20 +0000
Date: Thu, 3 Oct 2024 00:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1261/1491]
 sound/soc/intel/avs/icl.c:136:32: error: 'icl_enable_logs' undeclared here
 (not in a function); did you mean 'avs_icl_enable_logs'?
Message-ID: <202410030013.Tja4XFpX-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241003/202410030013.Tja4XFpX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030013.Tja4XFpX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030013.Tja4XFpX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/intel/avs/icl.c:10:
>> sound/soc/intel/avs/icl.c:136:32: error: 'icl_enable_logs' undeclared here (not in a function); did you mean 'avs_icl_enable_logs'?
     136 |         AVS_SET_ENABLE_LOGS_OP(icl)
         |                                ^~~
   sound/soc/intel/avs/avs.h:373:24: note: in definition of macro 'AVS_SET_ENABLE_LOGS_OP'
     373 |         .enable_logs = name##_enable_logs
         |                        ^~~~


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
