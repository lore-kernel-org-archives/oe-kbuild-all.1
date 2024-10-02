Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E341D12E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727896236; cv=none; b=Y3gIlKPsPVypxoPwJahFP3ONmP3UwjQWan8dszvGAetWltQsw284X7rVYQErxWNQpwopqnB7fG3Xw6kGSnI1TyYDakbNikWnZfDq9EG+oRgG/eZvQJ040D8wm1rHx+SG1JtQVM/7/FM5Gp839UE5Fs46dqIH25Wl18SgWJQME6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727896236; c=relaxed/simple;
	bh=cEgHVz/o3JsabIy+VSiQaMQJpbel8njVP4+OgQ3x7xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FoX6gZBFKWbdfjY5ZPNKK8tfhpVIOflv+HKrx6LXLJULVEvWBE5SG/pN5XYsBgdZH4taFQ0Cfs+J1l1vzPb7LObNv7U+HWXNtTaIbmmMjuieHYDgUhDuhyMDt+/t1+g0gVcuSxBq+Negyap+Tvn3VmiRIVOpI5In+XdV6f44Pt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSBLBgBl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSBLBgBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727896234; x=1759432234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEgHVz/o3JsabIy+VSiQaMQJpbel8njVP4+OgQ3x7xE=;
  b=PSBLBgBlnMJeC3dGGQVazSFJncAOTKuZOwJjHjAuTEasyydVouxYy1nl
   v72On0cIo7D2meZ8N5DEUJ3DiHQhYgdn5PLKfhfaNs/a2Vs2H3L6EyW2a
   9aX9r5SIlRpitXwNnztys3hz/hclM+3XiMDqSLCCPxK2cfBgrZ4Nz0tG+
   TBwGFXjvxvPMJK1k7zIWgUdE1c/IoqXTfzCP2aHVRRA+i5A3/18RvUhvy
   Yhm2Mb7e0tkInqZ21bnuWe574kH3IitLo/UoJZ7xR4cvpUQlrSFmfgkIH
   vhhmGHE+Q4frDnbKTX59WC1wvkAY8S3BshR6Yx8OGJC7+7WcMR04faDvD
   A==;
X-CSE-ConnectionGUID: H2q47AI2RACIkqSwEKrFIA==
X-CSE-MsgGUID: ogHlqGdoRJWQcPXPpzkfoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38211322"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="38211322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 12:10:33 -0700
X-CSE-ConnectionGUID: 8uvAPXbGRm2rmnX2+xd/Dw==
X-CSE-MsgGUID: WK1iXiE7TQSmK/OU3e1HFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="73778081"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2024 12:10:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw4k2-000USr-0X;
	Wed, 02 Oct 2024 19:10:30 +0000
Date: Thu, 3 Oct 2024 03:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1262/1491]
 sound/soc/intel/avs/tgl.c:53:32: error: 'icl_enable_logs' undeclared here
 (not in a function); did you mean 'avs_icl_enable_logs'?
Message-ID: <202410030319.MCFA876Q-lkp@intel.com>
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
commit: 6da61689a4e7a301ea3db2ecc1b5f37dd464478f [1262/1491] UPSTREAM: ASoC: Intel: avs: TGL-based platforms support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241003/202410030319.MCFA876Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030319.MCFA876Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030319.MCFA876Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/intel/avs/tgl.c:9:
>> sound/soc/intel/avs/tgl.c:53:32: error: 'icl_enable_logs' undeclared here (not in a function); did you mean 'avs_icl_enable_logs'?
      53 |         AVS_SET_ENABLE_LOGS_OP(icl)
         |                                ^~~
   sound/soc/intel/avs/avs.h:374:24: note: in definition of macro 'AVS_SET_ENABLE_LOGS_OP'
     374 |         .enable_logs = name##_enable_logs
         |                        ^~~~


vim +53 sound/soc/intel/avs/tgl.c

    37	
    38	const struct avs_dsp_ops avs_tgl_dsp_ops = {
    39		.power = avs_tgl_dsp_core_power,
    40		.reset = avs_tgl_dsp_core_reset,
    41		.stall = avs_tgl_dsp_core_stall,
    42		.irq_handler = avs_irq_handler,
    43		.irq_thread = avs_cnl_irq_thread,
    44		.int_control = avs_dsp_interrupt_control,
    45		.load_basefw = avs_hda_load_basefw,
    46		.load_lib = avs_hda_load_library,
    47		.transfer_mods = avs_hda_transfer_modules,
    48		.log_buffer_offset = avs_icl_log_buffer_offset,
    49		.log_buffer_status = avs_apl_log_buffer_status,
    50		.coredump = avs_apl_coredump,
    51		.d0ix_toggle = avs_icl_d0ix_toggle,
    52		.set_d0ix = avs_icl_set_d0ix,
  > 53		AVS_SET_ENABLE_LOGS_OP(icl)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
