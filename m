Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCAD25570
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 02:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591919; cv=none; b=SWCLmyw9guMq7B1wZg7bV08FLDjN7QbcA3wIhIYgA1rBHx1Z4ucuAh5ABtT8UyLQLGsGcGvpwOfe/2htnAT30wgLloC6dSVsJdotfMUMUO9d/YvmCkRfRbojMEFKsOEvBkFWmAB0c/oklvsCD57jis4LMCl8DeTIhkIHTMRytH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591919; c=relaxed/simple;
	bh=ob7Dw0D/vOEnEYWcBLJLwMZx0QsC/xNeW+fkmTtpCLQ=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=TmcD0/5XthHJv0OxacRw4CbWT3QamDzXHiRuYsnvCxf6TtTS9YF4HTfeCbCwos8fEQK+lMdfZtS6CqV2wp9z40C1ho1bpDQjZEGEGOi0SiDzQEjK/J89gcA3eZm9VJBwRKmCC69ed5p9wROYveOvCRKILC/az7TRkpjdp+hkEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=sT9+uzDI; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="sT9+uzDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x88/Mew3THfV6eZmUSA+KeI2rI5uIv/hkE/cE9yzz5I=;
  b=sT9+uzDI9gH+7wnRfDH6d3wRyZnd8y+xoSzkUAxkdYrIk9zO6U7ZgBqY
   COJOq8bXOc4stbZvn8QCRngjJBJcfBAVrSPHkwMVLoXOYs7n3QFQxjBwi
   GtSbW6Aj2CHeFwA9L1CjVG0HiJvg0rSjOQ5tIzFdbvThrys5KpA6lz/JU
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,160,1708383600"; 
   d="scan'208";a="158823952"
Received: from apn-pool1-239-pennnet048.nat.upenn.edu (HELO hnt-238.eduroam.wlan.private.upenn.edu) ([165.123.239.50])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 03:11:46 +0100
Date: Wed, 27 Mar 2024 22:11:42 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Revalla Hari Krishna <harikrishna.revalla@amd.com>
cc: Alex Deucher <alexander.deucher@amd.com>, 
    Martin Leung <martin.leung@amd.com>, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next 57/194] drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c:400:42-43:
 WARNING opportunity for min() (fwd)
Message-ID: <7070686c-9198-5fde-64c-ff3dbfda2d5@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Thu, 28 Mar 2024 06:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [agd5f:drm-next 57/194]
    drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c:400:42-43: WARNING
     opportunity for min()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Revalla Hari Krishna <harikrishna.revalla@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Martin Leung <martin.leung@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   d7f1487643552f18d1855474eba54a8ff3655935
commit: 88867807564e28409d8220419da7559364109a2a [57/194] drm/amd/display: Refactor DPP into a component directory
:::::: branch date: 16 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-102-20240326 (https://download.01.org/0day-ci/archive/20240328/202403280621.G7aFGUDp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403280621.G7aFGUDp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c:400:42-43: WARNING opportunity for min()
   drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c:402:46-47: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.c:269:42-43: WARNING opportunity for min()
   drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.c:271:46-47: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c:43:42-43: WARNING opportunity for min()
   drivers/gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c:45:46-47: WARNING opportunity for min()

vim +400 drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c

5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  390
dd93752b648309 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-10-10  391  void dpp1_dscl_calc_lb_num_partitions(
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  392  		const struct scaler_data *scl_data,
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  393  		enum lb_memory_config lb_config,
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  394  		int *num_part_y,
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  395  		int *num_part_c)
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  396  {
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  397  	int lb_memory_size, lb_memory_size_c, lb_memory_size_a, num_partitions_a,
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  398  	lb_bpc, memory_line_size_y, memory_line_size_c, memory_line_size_a;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  399
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15 @400  	int line_size = scl_data->viewport.width < scl_data->recout.width ?
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  401  			scl_data->viewport.width : scl_data->recout.width;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  402  	int line_size_c = scl_data->viewport_c.width < scl_data->recout.width ?
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  403  			scl_data->viewport_c.width : scl_data->recout.width;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  404
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  405  	if (line_size == 0)
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  406  		line_size = 1;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  407
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  408  	if (line_size_c == 0)
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  409  		line_size_c = 1;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  410
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  411
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  412  	lb_bpc = dpp1_dscl_get_lb_depth_bpc(scl_data->lb_params.depth);
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  413  	memory_line_size_y = (line_size * lb_bpc + 71) / 72; /* +71 to ceil */
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  414  	memory_line_size_c = (line_size_c * lb_bpc + 71) / 72; /* +71 to ceil */
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  415  	memory_line_size_a = (line_size + 5) / 6; /* +5 to ceil */
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  416
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  417  	if (lb_config == LB_MEMORY_CONFIG_1) {
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  418  		lb_memory_size = 816;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  419  		lb_memory_size_c = 816;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  420  		lb_memory_size_a = 984;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  421  	} else if (lb_config == LB_MEMORY_CONFIG_2) {
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  422  		lb_memory_size = 1088;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  423  		lb_memory_size_c = 1088;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  424  		lb_memory_size_a = 1312;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  425  	} else if (lb_config == LB_MEMORY_CONFIG_3) {
734a092b1fe407 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Eric Bernstein 2017-09-29  426  		/* 420 mode: using 3rd mem from Y, Cr and Cb */
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  427  		lb_memory_size = 816 + 1088 + 848 + 848 + 848;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  428  		lb_memory_size_c = 816 + 1088;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  429  		lb_memory_size_a = 984 + 1312 + 456;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  430  	} else {
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  431  		lb_memory_size = 816 + 1088 + 848;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  432  		lb_memory_size_c = 816 + 1088 + 848;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  433  		lb_memory_size_a = 984 + 1312 + 456;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  434  	}
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  435  	*num_part_y = lb_memory_size / memory_line_size_y;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  436  	*num_part_c = lb_memory_size_c / memory_line_size_c;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  437  	num_partitions_a = lb_memory_size_a / memory_line_size_a;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  438
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  439  	if (scl_data->lb_params.alpha_en
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  440  			&& (num_partitions_a < *num_part_y))
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  441  		*num_part_y = num_partitions_a;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  442
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  443  	if (*num_part_y > 64)
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  444  		*num_part_y = 64;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  445  	if (*num_part_c > 64)
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  446  		*num_part_c = 64;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  447

:::::: The code at line 400 was first introduced by commit
:::::: 5e9a81b2c465557adbaeef7231834e3ab40e4102 drm/amd/display: separate scl functions out from dcn10_dpp

:::::: TO: Yue Hin Lau <Yuehin.Lau@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
