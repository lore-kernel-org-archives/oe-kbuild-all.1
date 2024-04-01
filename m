Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11D1F5FD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711968734; cv=none; b=QrGL5o4lQjX3G2YYSnCVD723S0RnFHCtvEcIguyMScmE36IVC3Tar8IdMKlnB3Ew2pk5n2H03JVRWuFCmxlDCS9QNYOX+rHv59xVtTjaxX41RWTFjwT41+v/abAyT6g2epbk2/mpMVJYuLjIc0k6YoHbdEdwt1ubT0vfqP+yODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711968734; c=relaxed/simple;
	bh=i1lBSlIZ7T9eaTOu8KTM7peOrJfjbt8d6SJPlVUWHu8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=OyCs+Fwl3zV3o6FWax6/JdS6WtxIuD7RKpC1pw21onNZMoFjDsrQw+dCXERI0cIyXXlHRvoYxp7uv6rp4kTuESx9+jv/etMZvyyPNakXh6siHj7m7wS2+UfUmsMLpfHU/o5H03R7AmzKrECmw6w+T61/S11bxwWBI28mpAWH27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=low7JPwL; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="low7JPwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRq9+16QJIECbbhsaZvAutzCql4mMy5PjDV4G70aqzc=;
  b=low7JPwLJa1Fd2eGbW6i/1DuB0Gse2ma4Q6+cZPgXtbqfD78qQmEyNw5
   VR/ehVsBZAMegvaN7+Fst/pJ9VnODjRLVbA2nW3x2qVnoXWZutpKhPVpA
   sjak/4g6UFDTcufPFOBBAI+a9sBJbejDFAIQ6xC0gyM85e7Rfua5RnLK5
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,171,1708383600"; 
   d="scan'208";a="83568874"
Received: from 71-51-181-183.chvl.centurylink.net (HELO hadrien) ([71.51.181.183])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 12:51:59 +0200
Date: Mon, 1 Apr 2024 06:51:56 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Xi Liu <xi.liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
    Swapnil Patel <swapnil.patel@amd.com>
cc: Linux Memory Management List <linux-mm@kvack.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1011/2532] drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c:96:48-49:
 dram_clock_change_latency_us: first occurrence line 218, second occurrence
 line 240 (fwd)
Message-ID: <e7fa39a-9f19-9ef2-95f4-1c29678f2d5b@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check lines 218 and 240, which provide the same information.

julia

---------- Forwarded message ----------
Date: Mon, 1 Apr 2024 10:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1011/2532]
    drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c:96:48-49:
    dram_clock_change_latency_us: first occurrence line 218,
    second occurrence line 240

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Xi Liu <xi.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Swapnil Patel <swapnil.patel@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 398a16e1f03b6b583b94c7ab080aa38432fb0502 [1011/2532] drm/amd/display: increase bb clock for DCN351
:::::: branch date: 4 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-102-20240326 (https://download.01.org/0day-ci/archive/20240401/202404011051.SJMGi4zh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404011051.SJMGi4zh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c:96:48-49: dram_clock_change_latency_us: first occurrence line 218, second occurrence line 240

vim +96 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c

2728e9c7c84235 Hamza Mahfooz     2024-02-23   95
2728e9c7c84235 Hamza Mahfooz     2024-02-23  @96  struct _vcs_dpi_soc_bounding_box_st dcn3_51_soc = {
2728e9c7c84235 Hamza Mahfooz     2024-02-23   97  		/*TODO: correct dispclk/dppclk voltage level determination*/
2728e9c7c84235 Hamza Mahfooz     2024-02-23   98  	.clock_limits = {
2728e9c7c84235 Hamza Mahfooz     2024-02-23   99  		{
2728e9c7c84235 Hamza Mahfooz     2024-02-23  100  			.state = 0,
398a16e1f03b6b Xi Liu            2024-03-07  101  			.dcfclk_mhz = 400.0,
398a16e1f03b6b Xi Liu            2024-03-07  102  			.fabricclk_mhz = 400.0,
398a16e1f03b6b Xi Liu            2024-03-07  103  			.socclk_mhz = 600.0,
398a16e1f03b6b Xi Liu            2024-03-07  104  			.dram_speed_mts = 3200.0,
398a16e1f03b6b Xi Liu            2024-03-07  105  			.dispclk_mhz = 600.0,
398a16e1f03b6b Xi Liu            2024-03-07  106  			.dppclk_mhz = 600.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  107  			.phyclk_mhz = 600.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  108  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  109  			.dscclk_mhz = 200.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  110  			.dtbclk_mhz = 600.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  111  		},
2728e9c7c84235 Hamza Mahfooz     2024-02-23  112  		{
2728e9c7c84235 Hamza Mahfooz     2024-02-23  113  			.state = 1,
398a16e1f03b6b Xi Liu            2024-03-07  114  			.dcfclk_mhz = 600.0,
398a16e1f03b6b Xi Liu            2024-03-07  115  			.fabricclk_mhz = 1000.0,
398a16e1f03b6b Xi Liu            2024-03-07  116  			.socclk_mhz = 733.0,
398a16e1f03b6b Xi Liu            2024-03-07  117  			.dram_speed_mts = 6400.0,
398a16e1f03b6b Xi Liu            2024-03-07  118  			.dispclk_mhz = 800.0,
398a16e1f03b6b Xi Liu            2024-03-07  119  			.dppclk_mhz = 800.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  120  			.phyclk_mhz = 810.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  121  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  122  			.dscclk_mhz = 266.7,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  123  			.dtbclk_mhz = 600.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  124  		},
2728e9c7c84235 Hamza Mahfooz     2024-02-23  125  		{
2728e9c7c84235 Hamza Mahfooz     2024-02-23  126  			.state = 2,
398a16e1f03b6b Xi Liu            2024-03-07  127  			.dcfclk_mhz = 738.0,
398a16e1f03b6b Xi Liu            2024-03-07  128  			.fabricclk_mhz = 1200.0,
398a16e1f03b6b Xi Liu            2024-03-07  129  			.socclk_mhz = 880.0,
398a16e1f03b6b Xi Liu            2024-03-07  130  			.dram_speed_mts = 7500.0,
398a16e1f03b6b Xi Liu            2024-03-07  131  			.dispclk_mhz = 800.0,
398a16e1f03b6b Xi Liu            2024-03-07  132  			.dppclk_mhz = 800.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  133  			.phyclk_mhz = 810.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  134  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  135  			.dscclk_mhz = 266.7,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  136  			.dtbclk_mhz = 600.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  137  		},
2728e9c7c84235 Hamza Mahfooz     2024-02-23  138  		{
2728e9c7c84235 Hamza Mahfooz     2024-02-23  139  			.state = 3,
398a16e1f03b6b Xi Liu            2024-03-07  140  			.dcfclk_mhz = 800.0,
398a16e1f03b6b Xi Liu            2024-03-07  141  			.fabricclk_mhz = 1400.0,
398a16e1f03b6b Xi Liu            2024-03-07  142  			.socclk_mhz = 978.0,
398a16e1f03b6b Xi Liu            2024-03-07  143  			.dram_speed_mts = 7500.0,
398a16e1f03b6b Xi Liu            2024-03-07  144  			.dispclk_mhz = 960.0,
398a16e1f03b6b Xi Liu            2024-03-07  145  			.dppclk_mhz = 960.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  146  			.phyclk_mhz = 810.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  147  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  148  			.dscclk_mhz = 320.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  149  			.dtbclk_mhz = 600.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  150  		},
2728e9c7c84235 Hamza Mahfooz     2024-02-23  151  		{
2728e9c7c84235 Hamza Mahfooz     2024-02-23  152  			.state = 4,
398a16e1f03b6b Xi Liu            2024-03-07  153  			.dcfclk_mhz = 873.0,
398a16e1f03b6b Xi Liu            2024-03-07  154  			.fabricclk_mhz = 1600.0,
398a16e1f03b6b Xi Liu            2024-03-07  155  			.socclk_mhz = 1100.0,
398a16e1f03b6b Xi Liu            2024-03-07  156  			.dram_speed_mts = 8533.0,
398a16e1f03b6b Xi Liu            2024-03-07  157  			.dispclk_mhz = 1066.7,
398a16e1f03b6b Xi Liu            2024-03-07  158  			.dppclk_mhz = 1066.7,
398a16e1f03b6b Xi Liu            2024-03-07  159  			.phyclk_mhz = 810.0,
398a16e1f03b6b Xi Liu            2024-03-07  160  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  161  			.dscclk_mhz = 355.6,
398a16e1f03b6b Xi Liu            2024-03-07  162  			.dtbclk_mhz = 600.0,
398a16e1f03b6b Xi Liu            2024-03-07  163  		},
398a16e1f03b6b Xi Liu            2024-03-07  164  		{
398a16e1f03b6b Xi Liu            2024-03-07  165  			.state = 5,
398a16e1f03b6b Xi Liu            2024-03-07  166  			.dcfclk_mhz = 960.0,
398a16e1f03b6b Xi Liu            2024-03-07  167  			.fabricclk_mhz = 1700.0,
398a16e1f03b6b Xi Liu            2024-03-07  168  			.socclk_mhz = 1257.0,
398a16e1f03b6b Xi Liu            2024-03-07  169  			.dram_speed_mts = 8533.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  170  			.dispclk_mhz = 1200.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  171  			.dppclk_mhz = 1200.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  172  			.phyclk_mhz = 810.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  173  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  174  			.dscclk_mhz = 400.0,
398a16e1f03b6b Xi Liu            2024-03-07  175  			.dtbclk_mhz = 600.0,
398a16e1f03b6b Xi Liu            2024-03-07  176  		},
398a16e1f03b6b Xi Liu            2024-03-07  177  		{
398a16e1f03b6b Xi Liu            2024-03-07  178  			.state = 6,
398a16e1f03b6b Xi Liu            2024-03-07  179  			.dcfclk_mhz = 1067.0,
398a16e1f03b6b Xi Liu            2024-03-07  180  			.fabricclk_mhz = 1850.0,
398a16e1f03b6b Xi Liu            2024-03-07  181  			.socclk_mhz = 1257.0,
398a16e1f03b6b Xi Liu            2024-03-07  182  			.dram_speed_mts = 8533.0,
398a16e1f03b6b Xi Liu            2024-03-07  183  			.dispclk_mhz = 1371.4,
398a16e1f03b6b Xi Liu            2024-03-07  184  			.dppclk_mhz = 1371.4,
398a16e1f03b6b Xi Liu            2024-03-07  185  			.phyclk_mhz = 810.0,
398a16e1f03b6b Xi Liu            2024-03-07  186  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  187  			.dscclk_mhz = 457.1,
398a16e1f03b6b Xi Liu            2024-03-07  188  			.dtbclk_mhz = 600.0,
398a16e1f03b6b Xi Liu            2024-03-07  189  		},
398a16e1f03b6b Xi Liu            2024-03-07  190  		{
398a16e1f03b6b Xi Liu            2024-03-07  191  			.state = 7,
398a16e1f03b6b Xi Liu            2024-03-07  192  			.dcfclk_mhz = 1200.0,
398a16e1f03b6b Xi Liu            2024-03-07  193  			.fabricclk_mhz = 2000.0,
398a16e1f03b6b Xi Liu            2024-03-07  194  			.socclk_mhz = 1467.0,
398a16e1f03b6b Xi Liu            2024-03-07  195  			.dram_speed_mts = 8533.0,
398a16e1f03b6b Xi Liu            2024-03-07  196  			.dispclk_mhz = 1600.0,
398a16e1f03b6b Xi Liu            2024-03-07  197  			.dppclk_mhz = 1600.0,
398a16e1f03b6b Xi Liu            2024-03-07  198  			.phyclk_mhz = 810.0,
398a16e1f03b6b Xi Liu            2024-03-07  199  			.phyclk_d18_mhz = 667.0,
398a16e1f03b6b Xi Liu            2024-03-07  200  			.dscclk_mhz = 533.3,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  201  			.dtbclk_mhz = 600.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  202  		},
2728e9c7c84235 Hamza Mahfooz     2024-02-23  203  	},
398a16e1f03b6b Xi Liu            2024-03-07  204  	.num_states = 8,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  205  	.sr_exit_time_us = 28.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  206  	.sr_enter_plus_exit_time_us = 30.0,
414998f2a017b2 Natanel Roizenman 2024-03-06  207  	.sr_exit_z8_time_us = 250.0,
414998f2a017b2 Natanel Roizenman 2024-03-06  208  	.sr_enter_plus_exit_z8_time_us = 350.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  209  	.fclk_change_latency_us = 24.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  210  	.usr_retraining_latency_us = 2,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  211  	.writeback_latency_us = 12.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  212
2728e9c7c84235 Hamza Mahfooz     2024-02-23  213  	.dram_channel_width_bytes = 4,/*not exist in dml2*/
2728e9c7c84235 Hamza Mahfooz     2024-02-23  214  	.round_trip_ping_latency_dcfclk_cycles = 106,/*not exist in dml2*/
2728e9c7c84235 Hamza Mahfooz     2024-02-23  215  	.urgent_latency_pixel_data_only_us = 4.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  216  	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  217  	.urgent_latency_vm_data_only_us = 4.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23 @218  	.dram_clock_change_latency_us = 11.72,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  219  	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  220  	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  221  	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  222
2728e9c7c84235 Hamza Mahfooz     2024-02-23  223  	.pct_ideal_sdp_bw_after_urgent = 80.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  224  	.pct_ideal_fabric_bw_after_urgent = 80.0, /*new to dml2*/
2728e9c7c84235 Hamza Mahfooz     2024-02-23  225  	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 65.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  226  	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  227  	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 30.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  228  	.max_avg_sdp_bw_use_normal_percent = 60.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  229  	.max_avg_dram_bw_use_normal_percent = 60.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  230  	.fabric_datapath_to_dcn_data_return_bytes = 32,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  231  	.return_bus_width_bytes = 64,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  232  	.downspread_percent = 0.38,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  233  	.dcn_downspread_percent = 0.5,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  234  	.gpuvm_min_page_size_bytes = 4096,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  235  	.hostvm_min_page_size_bytes = 4096,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  236  	.do_urgent_latency_adjustment = 0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  237  	.urgent_latency_adjustment_fabric_clock_component_us = 0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  238  	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
398a16e1f03b6b Xi Liu            2024-03-07  239  	.num_chans = 4,
398a16e1f03b6b Xi Liu            2024-03-07 @240  	.dram_clock_change_latency_us = 11.72,
398a16e1f03b6b Xi Liu            2024-03-07  241  	.dispclk_dppclk_vco_speed_mhz = 2400.0,
2728e9c7c84235 Hamza Mahfooz     2024-02-23  242  };
2728e9c7c84235 Hamza Mahfooz     2024-02-23  243

:::::: The code at line 96 was first introduced by commit
:::::: 2728e9c7c84235d2d7bc1403174d071ffc82d6d2 drm/amd/display: add DC changes for DCN351

:::::: TO: Hamza Mahfooz <hamza.mahfooz@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
