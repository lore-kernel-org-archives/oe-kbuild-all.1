Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC33722579E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 03:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786073115; cv=none; b=qBpLgSccAJGOhUhSTMQlPd0Ge1N3aFrTtA7axati6xRDoQZ/xQCsOX0ZWVxqpy66b/9eybUqmdTa+1JhMBmkIDmqfdmhqwmchtomzAUT2UsqMHuKSOGPFnHDKcUcGMkbpKZnxq6G/twp8jnMCxgp7WXQ/ACAdCZp0OoMizlbJH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786073115; c=relaxed/simple;
	bh=G47CmSrJVvbj266YFv4rnVUg28V8oYdhrBbe+zett5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aKLUTzTbl/hMiqe2XAUm/dTwHwBbgSMDld3CC7/ZCrN5OeFKtaWRVEppvORXAM6DCQs40KO++VksAaAhymbH/H27CfmAZL4VqLSkmgqDZ1L04zt9EI39jp0SNcuEH/d215nwRdP1ye3In3sTVsZqbPUFAaH55P7VX0IX8MAwO5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/lxXV66; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/lxXV66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786073112; x=1817609112;
  h=date:from:to:cc:subject:message-id;
  bh=G47CmSrJVvbj266YFv4rnVUg28V8oYdhrBbe+zett5Q=;
  b=H/lxXV66TjDt8MLzQ6cvaZgrDsjNwrhsNdos+3tnRra66AVTCAaAH8RU
   A2WjjPeTE0lD24u6e4dXvrbaaAKk0ClBpJSNrzmzMopGaSLD38gTYI55S
   wHpp9dSGjkDONRr4DZqHyzuOD8bFFcfdfSrXTCOp1wKq0qjbFAxJ1TwOI
   AOsfFig0mQBWRbUgWZyh/U3f6ponBQjhkD1f5zeUnU6iKMZ4oqHvEeTpM
   sj0dwv4Ps2Qyh4edo8iqVhR71LL6KGpHPHGmGfNP8skiGGhD6xYEk6pYq
   /lyX70S/0Cs5RqRnelV+QVEWlwBa8CGwENHde/u/Nq/kfqRS0K2c4AGUM
   A==;
X-CSE-ConnectionGUID: cfrvZmCcSqepTan2MbJsGQ==
X-CSE-MsgGUID: 7m+VbNgLQUu1Mig7DSpyAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86530979"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86530979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 20:25:11 -0700
X-CSE-ConnectionGUID: 1Ft5zd4lQSm6YHcD4pIDtA==
X-CSE-MsgGUID: 5BFL+hS6SSSpbuZ8Z3Gryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="264271967"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2026 20:25:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsBCk-00000000H1d-0N7c;
	Fri, 07 Aug 2026 03:25:06 +0000
Date: Fri, 07 Aug 2026 11:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next-7.3 244/308] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c:619
 function parameter 'qos_model' not described in
 'dcn60_populate_utm_qos_model'
Message-ID: <202608071110.JqMLQrz3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: 992694ad28584188725751f695a85661e8e3797a [244/308] drm/amd/display: Enable DCN6 sources compilation
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260807/202608071110.JqMLQrz3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071110.JqMLQrz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071110.JqMLQrz3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c:619 function parameter 'qos_model' not described in 'dcn60_populate_utm_qos_model'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c:619 function parameter 'init_table' not described in 'dcn60_populate_utm_qos_model'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c:619 expecting prototype for dcn60_fetch_dal_init_table(). Prototype was for dcn60_populate_utm_qos_model() instead
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1032 function parameter 'type' not described in 'is_probe_measurement_type_for_hubbub'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1032 function parameter 'type' not described in 'is_probe_measurement_type_for_hubbub'
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:646 Cannot find identifier on line:
    * @brief Resets the performance monitor for the DCN 6.0 hubbub.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:647 Cannot find identifier on line:
    *
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:648 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function resets the performance monitoring counters and related
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:669 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Starts measuring memory latencies (maximum, minimum, and average) in
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:791 Cannot find identifier on line:
    * @brief Reads the current performance monitor results and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:792 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * memory latencies in nanoseconds.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:857 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Starts measuring urgent assertion and deassertion counts using
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:949 Cannot find identifier on line:
    * @brief Reads the urgent assertion and deassertion counts from the
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:950 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * performance monitor.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1003 Cannot find identifier on line:
    * @brief Configures the performance monitor to measure the urgent ramp
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1004 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * latency.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1250 Cannot find identifier on line:
    * @brief Reads the current performance monitor result and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1251 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * the urgent ramp latency in nanoseconds.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1462 Cannot find identifier on line:
    * @brief Configures the performance monitor to measure in-order
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1463 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * bandwidth in megabits per second (Mbps).
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1543 Cannot find identifier on line:
    * @brief Reads the current performance monitor result and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1544 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * the in-order bandwidth in Mbps.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1602 Cannot find identifier on line:
    * @brief Configures the performance monitor to measure prefetch data size.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1603 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1604 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function sets up performance monitoring counter 0 to measure
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1656 Cannot find identifier on line:
    * @brief Reads the current performance monitor result and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1657 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * the prefetch data size in bytes.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1682 Cannot find identifier on line:
    * @brief Forces the display to use the nominal QoS profile.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1683 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1684 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function configures the hubbub to force the display to use
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1699 Cannot find identifier on line:
    * @brief Forces the display to use the urgent QoS profile.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1700 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1701 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function configures the hubbub to force the display to use
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1716 Cannot find identifier on line:
    * @brief Resets the display QoS profile to default.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1717 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1718 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function resets the display QoS profile by disabling any
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:17 Cannot find identifier on line:
    * ***********************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:25 function parameter 'start' not described in 'in_circular_range'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:25 function parameter 'end' not described in 'in_circular_range'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:25 function parameter 'value' not described in 'in_circular_range'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:90 Cannot find identifier on line:
    * *******************************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'svp0_start_sw_idx_next' not described in 'apply_svp1_workaround'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'svp0_num_swaths_next' not described in 'apply_svp1_workaround'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'svp1_num_swaths_next' not described in 'apply_svp1_workaround'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'viewport_start' not described in 'apply_svp1_workaround'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'viewport_size' not described in 'apply_svp1_workaround'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'swath_height' not described in 'apply_svp1_workaround'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'access_direction' not described in 'apply_svp1_workaround'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:109 function parameter 'svp1_start_line' not described in 'apply_svp1_workaround'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:115 Cannot find identifier on line:
    * ***********************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_start_sw_idx_curr' not described in 'calculate_start_line_and_height_from_swath'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_num_swaths_curr' not described in 'calculate_start_line_and_height_from_swath'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_start_sw_idx_next' not described in 'calculate_start_line_and_height_from_swath'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_num_swaths_next' not described in 'calculate_start_line_and_height_from_swath'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp1_start_sw_idx_curr' not described in 'calculate_start_line_and_height_from_swath'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp1_num_swaths_curr' not described in 'calculate_start_line_and_height_from_swath'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp1_start_sw_idx_next' not described in 'calculate_start_line_and_height_from_swath'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp1_num_swaths_next' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'rec_start_dst' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_start_dst' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_frame_count' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'program_go_line' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'program_go_frame_count' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'viewport_start' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'viewport_size' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'access_direction' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'vstartup' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'swath_height' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_start_line' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_height' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp0_height_next' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp1_start_line' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp1_height' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:149 function parameter 'svp1_height_next' not described in 'calculate_start_line_and_height_from_swath'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:186 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:201 function parameter 'p' not described in 'get_swath_deadlines'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:201 Excess function parameter 'output' description in 'get_swath_deadlines'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:231 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:244 function parameter 'swath_index' not described in 'calculate_swath_deadline_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:244 function parameter 'prefetch_swaths' not described in 'calculate_swath_deadline_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:244 function parameter 'pre_first_hdl_x1000' not described in 'calculate_swath_deadline_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:244 function parameter 'rec_first_hdl_x1000' not described in 'calculate_swath_deadline_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:244 function parameter 'pre_hdl_delta_x1000' not described in 'calculate_swath_deadline_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:244 function parameter 'rec_hdl_delta_x1000' not described in 'calculate_swath_deadline_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:256 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:280 function parameter 'curr_otg_line' not described in 'is_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:280 function parameter 'curr_frame_count' not described in 'is_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:280 function parameter 'dst_line' not described in 'is_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:280 function parameter 'target_frame_count' not described in 'is_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:280 function parameter 'frame_boundary' not described in 'is_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:280 Excess function parameter 'input' description in 'is_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:288 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:313 function parameter 'target_frame_count' not described in 'is_end_swath_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:313 function parameter 'curr_frame_count' not described in 'is_end_swath_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:313 function parameter 'curr_line' not described in 'is_end_swath_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:313 function parameter 'dst_line' not described in 'is_end_swath_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:313 function parameter 'frame_boundary' not described in 'is_end_swath_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:313 function parameter 'vstartup' not described in 'is_end_swath_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:313 Excess function parameter 'input' description in 'is_end_swath_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:326 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'swath_index' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'pre_swath_incl_boundary' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'prefetch_swaths' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'pre_first_hdl_x1000' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'rec_first_hdl_x1000' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'pre_hdl_delta_x1000' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'rec_hdl_delta_x1000' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'curr_otg_line' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'curr_frame_count' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'dst_line' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'target_frame_count' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:346 function parameter 'vstartup' not described in 'is_svp_dst_in_next_frame'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:365 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'curr_otg_line' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'curr_frame_count' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'target_frame_count' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'vstartup' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'dst_line' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'pre_swath_incl_boundary' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'rec_swath_incl_boundary' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'prefetch_swaths' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'total_swaths' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'pre_first_hdl_dst_x1000' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'pre_last_hdl_dst' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'earliest_rec_req' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'rec_first_hdl_dst_x1000' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'rec_last_hdl_dst' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'pre_hdl_delta_x1000' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'rec_hdl_delta_x1000' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'round_up' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:393 function parameter 'start' not described in 'calculate_swath_idx_from_dst'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:434 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:453 function parameter 'prefetch_swaths' not described in 'populate_svp_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:453 function parameter 'total_swaths' not described in 'populate_svp_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:453 function parameter 'svp_start_swath_idx' not described in 'populate_svp_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:453 function parameter 'svp_end_swath_idx' not described in 'populate_svp_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:453 function parameter 'svp_start_sw_idx' not described in 'populate_svp_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:453 function parameter 'svp_num_swaths' not described in 'populate_svp_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:453 Excess function parameter 'output' description in 'populate_svp_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:482 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'svp_start_swath_idx' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'svp_end_swath_idx' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'prefetch_swaths' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'total_swaths' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'svp_start_sw_idx_curr' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'svp_num_swaths_curr' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'svp_start_sw_idx_next' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 function parameter 'svp_num_swaths_next' not described in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:505 Excess function parameter 'output' description in 'populate_start_index_num_swaths_helper'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_standalone_libraries/alternate_pstate_shared_lib.c:535 Cannot find identifier on line:
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:98 Cannot find identifier on line:
    * *****************************************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'p' not described in 'get_plane_params'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'plane_idx' not described in 'get_plane_params'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'chroma' not described in 'get_plane_params'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'out' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:131 Cannot find identifier on line:
    * *****************************************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'p' not described in 'compute_pre_rec_first_hdl'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'chroma' not described in 'compute_pre_rec_first_hdl'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'stream_idx' not described in 'compute_pre_rec_first_hdl'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'plane_idx' not described in 'compute_pre_rec_first_hdl'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'pre_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'rec_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:169 Cannot find identifier on line:
    * ************************************************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_first_hdl' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_first_hdl' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_hdl_delta' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_hdl_delta' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'prefetch_swaths' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'total_swaths' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp0_dst_lines' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp1_dst_lines' not described in 'calculate_copy_swaths'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'vtotal' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:280 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:293 function parameter 'p' not described in 'calculate_alt_copy_time_us'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:326 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'p' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'svp_dst_lines' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'plane_idx' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'chroma' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 Excess function parameter 'input' description in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:378 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'p' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'plane_idx' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'chroma' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'out' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:98 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'p' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'plane_idx' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'chroma' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'out' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:131 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'p' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'chroma' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'stream_idx' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'plane_idx' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'pre_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'rec_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:169 Cannot find identifier on line:
    * ************************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_first_hdl' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_first_hdl' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_hdl_delta' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_hdl_delta' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'prefetch_swaths' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'total_swaths' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp0_dst_lines' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp1_dst_lines' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'vtotal' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:280 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:293 function parameter 'p' not described in 'calculate_alt_copy_time_us'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:326 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'p' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'svp_dst_lines' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'plane_idx' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 function parameter 'chroma' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:346 Excess function parameter 'input' description in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:378 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'p' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'plane_idx' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'chroma' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:392 function parameter 'out' not described in 'calculate_swath_params'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
