Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257018AFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765657718; cv=none; b=oU6T0vAeRAz4ivo+l95brjdeKGppSEjrQnrprNt2xQx7+BXmLxkcHk19NZ5Cfr55wKHqX2bOo9XdfixMhI3PYBQjXacxow3p3y3uRGGxHER/vXw/0HDgnggWD2IrHMlNO/ET55yThqbq/rl2uWBcolwcpqdqxzPQfb9g6L8UW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765657718; c=relaxed/simple;
	bh=C/3Bb+9bRmekJeON1XVXZuRf7vEsjAyYFhC5/gLUZsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ak97eNWvYrdOHR1T7QOeTu0xe+uHME2anH+jUhwSRA5xHSi4+m12K7V1kb3XNQPuAEyETVvHZdzwls5S7OzmBVLJlxYqgNqbGZUhTw9btX48l521VBNrXzE1OBew8KATbJTdN5+ggimmKyZn2lQ9KicQqJuHS/bE464H2X4pbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frcgoxTl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frcgoxTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765657717; x=1797193717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/3Bb+9bRmekJeON1XVXZuRf7vEsjAyYFhC5/gLUZsU=;
  b=frcgoxTlde/0PEske2GYIq6v98xdZqRkHUBfkeIyphUzDhEUU/C69ose
   kei0Hu51NG4tDx1jBv9hynyJvgVhOuXQD00Mbj3S+0R6wqbMJTUMjL7gD
   2fR9qi4go4tGUydOttSmX149FLjMhi9NsGancDE+26i5p6zANqWIIbGtS
   XoZGsYxqjgyB4C2DpGfhXD6NYDrqwAUD2RONFCqR/BsP5nRAhcG5mHKPj
   nWICqgwwOvVvT/IVWiFMV9EGMXvrZmGvFI6fWe8+BVP+u5F0Agz6wdvln
   XNhFo/Cjp6H1H7KBNsWGRf/Qtl7/DG9Mj6dWgyly8u0xcXiUCYHkc1xup
   Q==;
X-CSE-ConnectionGUID: kWf9ao85SUWc1MyfUYZgkg==
X-CSE-MsgGUID: +mJQIdFoROqG9zbn3IdE5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70203797"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70203797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:28:36 -0800
X-CSE-ConnectionGUID: hkPSSdKwScG33tqDZLDAag==
X-CSE-MsgGUID: A7bE3BpCQBe/aDHjiDfnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197637655"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 12:28:35 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUWED-000000002Am-1Ptg;
	Sat, 13 Dec 2025 20:28:33 +0000
Date: Sat, 13 Dec 2025 21:28:17 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40] htmldocs:
 ./drivers/gpu/drm/amd/display/dc/dc.h:509: warning: cannot understand
 function prototype: 'struct dc_clocks '
Message-ID: <202512132143.ufaqV9Vy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 6cd736272165d7a6a7d62fb0a40536ed3741ed02 [0/40] drm/amd/display: Expand kernel doc for DC
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512132143.ufaqV9Vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132143.ufaqV9Vy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/jbd2.h
   Error: Cannot open file ./include/linux/jbd2.h
   Error: Cannot open file ./include/linux/netfs.h
   Error: Cannot open file ./include/linux/pipe_fs_i.h
   Error: Cannot open file ./include/linux/pipe_fs_i.h
>> ./drivers/gpu/drm/amd/display/dc/dc.h:509: warning: cannot understand function prototype: 'struct dc_clocks '
   ./drivers/gpu/drm/amd/display/dc/dc.h:474: warning: Enum value 'MPC_SPLIT_AVOID' not described in enum 'pipe_split_policy'
   ./drivers/gpu/drm/amd/display/dc/dc.h:474: warning: Enum value 'MPC_SPLIT_AVOID_MULT_DISP' not described in enum 'pipe_split_policy'
>> ./drivers/gpu/drm/amd/display/dc/dc.h:509: warning: cannot understand function prototype: 'struct dc_clocks '
   ./drivers/gpu/drm/amd/display/dc/dc.h:876: warning: Function parameter or member 'native422_support' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:876: warning: Function parameter or member 'disable_dsc' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:876: warning: Function parameter or member 'visual_confirm' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:876: warning: Function parameter or member 'visual_confirm_rect_height' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:876: warning: Function parameter or member 'sanity_checks' not described in 'dc_debug_options'


vim +509 ./drivers/gpu/drm/amd/display/dc/dc.h

6cd736272165d7 Rodrigo Siqueira    2022-10-20  502  
6cd736272165d7 Rodrigo Siqueira    2022-10-20  503  /**
6cd736272165d7 Rodrigo Siqueira    2022-10-20  504   * dc_clocks - DC pipe clocks
6cd736272165d7 Rodrigo Siqueira    2022-10-20  505   *
6cd736272165d7 Rodrigo Siqueira    2022-10-20  506   * For any clocks that may differ per pipe only the max is stored in this
6cd736272165d7 Rodrigo Siqueira    2022-10-20  507   * structure
765b26836430e9 Dmytro Laktyushkin  2018-05-23  508   */
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13 @509  struct dc_clocks {
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13  510  	int dispclk_khz;
4b0b1d05265b04 Yongqiang Sun       2020-10-30  511  	int actual_dispclk_khz;
17ac50368f83ea Dmytro Laktyushkin  2018-02-16  512  	int dppclk_khz;
4b0b1d05265b04 Yongqiang Sun       2020-10-30  513  	int actual_dppclk_khz;
b4d5ce7a502409 Brandon Syu         2020-06-08  514  	int disp_dpp_voltage_level_khz;
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13  515  	int dcfclk_khz;
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13  516  	int socclk_khz;
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13  517  	int dcfclk_deep_sleep_khz;
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13  518  	int fclk_khz;
765b26836430e9 Dmytro Laktyushkin  2018-05-23  519  	int phyclk_khz;
8ab2180f96f533 Eryk Brol           2018-09-07  520  	int dramclk_khz;
33e0a44583281a Jun Lei             2019-02-06  521  	bool p_state_change_support;
550ff7ad37fab8 Eric Yang           2021-06-30  522  	enum dcn_zstate_support_state zstate_support;
118a331516581c Nicholas Kazlauskas 2021-05-19  523  	bool dtbclk_en;
0ec744084793db Leung, Martin       2022-05-10  524  	int ref_dtbclk_khz;
265280b99822e5 Aurabindo Pillai    2022-02-21  525  	bool fclk_p_state_change_support;
9ae1b27f31d0e8 Joseph Gravenor     2019-09-04  526  	enum dcn_pwr_state pwr_state;
057fc695e934a7 Jun Lei             2019-07-08  527  	/*
057fc695e934a7 Jun Lei             2019-07-08  528  	 * Elements below are not compared for the purposes of
057fc695e934a7 Jun Lei             2019-07-08  529  	 * optimization required
057fc695e934a7 Jun Lei             2019-07-08  530  	 */
057fc695e934a7 Jun Lei             2019-07-08  531  	bool prev_p_state_change_support;
265280b99822e5 Aurabindo Pillai    2022-02-21  532  	bool fclk_prev_p_state_change_support;
d3dfceb58de5f8 Aurabindo Pillai    2022-02-23  533  	int num_ways;
6cd736272165d7 Rodrigo Siqueira    2022-10-20  534  
6cd736272165d7 Rodrigo Siqueira    2022-10-20  535  	/**
6cd736272165d7 Rodrigo Siqueira    2022-10-20  536  	 * @fw_based_mclk_switching
6cd736272165d7 Rodrigo Siqueira    2022-10-20  537  	 *
6cd736272165d7 Rodrigo Siqueira    2022-10-20  538  	 * DC has a mechanism that leverage the variable refresh rate to switch
6cd736272165d7 Rodrigo Siqueira    2022-10-20  539  	 * memory clock in cases that we have a large latency to achieve the
6cd736272165d7 Rodrigo Siqueira    2022-10-20  540  	 * memory clock change and a short vblank window. DC has some
6cd736272165d7 Rodrigo Siqueira    2022-10-20  541  	 * requirements to enable this feature, and this field describes if the
6cd736272165d7 Rodrigo Siqueira    2022-10-20  542  	 * system support or not such a feature.
6cd736272165d7 Rodrigo Siqueira    2022-10-20  543  	 */
bbb6e5ae7ccfed Alvin Lee           2022-04-19  544  	bool fw_based_mclk_switching;
00fa7f031dd4b8 Rodrigo Siqueira    2022-06-16  545  	bool fw_based_mclk_switching_shut_down;
d3dfceb58de5f8 Aurabindo Pillai    2022-02-23  546  	int prev_num_ways;
ce10a0f39b1949 Charlene Liu        2019-09-17  547  	enum dtm_pstate dtm_level;
3a4d180d4a9df6 Wesley Chalmers     2019-08-30  548  	int max_supported_dppclk_khz;
3a4d180d4a9df6 Wesley Chalmers     2019-08-30  549  	int max_supported_dispclk_khz;
3a4d180d4a9df6 Wesley Chalmers     2019-08-30  550  	int bw_dppclk_khz; /*a copy of dppclk_khz*/
3a4d180d4a9df6 Wesley Chalmers     2019-08-30  551  	int bw_dispclk_khz;
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13  552  };
15cf3974eb06e7 Dmytro Laktyushkin  2018-02-13  553  

:::::: The code at line 509 was first introduced by commit
:::::: 15cf3974eb06e7b6be1f8f02581759b5f3d9f1e4 drm/amd/display: add diags clock programming

:::::: TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
