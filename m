Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04361B65B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UOm1sVFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ai2sJ4kW8AEZbluZAzMgviMNnR4B0wbu4nqZefRqF/A=;
  b=UOm1sVFGa5qFwRbDqjtG1H5/2Rskxe7VP3vs3nIlpH5ORGXRQCnMMvyf
   tuhBTK5b9eeretGpfQ0/CiKFGU8hSn3MJcn/sxi13R4v3ZNyD3+jlbU1N
   FbQHa92rYb7LoAAfNqcK5uuQ+yee3L2YpxqLYgFJNRtCte6hb/4nivqfr
   c=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,320,1695679200"; 
   d="scan'208";a="75577742"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 20:43:25 +0100
Date: Sun, 31 Dec 2023 20:43:24 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Alain Volmat <alain.volmat@foss.st.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Linux Memory Management List <linux-mm@kvack.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3789/10295] drivers/media/i2c/st-mipid02.c:396:1-7:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_s64
 instead. (fwd)
Message-ID: <alpine.DEB.2.22.394.2312312042450.3410@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Mon, 1 Jan 2024 03:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 3789/10295] drivers/media/i2c/st-mipid02.c:396:1-7:
    WARNING: do_div() does a 64-by-32 division,
    please consider using div64_s64 instead.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alain Volmat <alain.volmat@foss.st.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 046ee0e2a4d602268a49be0d77df8c85559015e3 [3789/10295] media: i2c: st-mipid02: add usage of v4l2_get_link_freq
:::::: branch date: 10 days ago
:::::: commit date: 4 weeks ago
config: hexagon-randconfig-r052-20231228 (https://download.01.org/0day-ci/archive/20240101/202401010329.u5sLmCCj-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401010329.u5sLmCCj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/i2c/st-mipid02.c:396:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

vim +396 drivers/media/i2c/st-mipid02.c

642bb5e88fed89 Mickael Guene  2019-04-09  369
642bb5e88fed89 Mickael Guene  2019-04-09  370  /*
642bb5e88fed89 Mickael Guene  2019-04-09  371   * We need to know link frequency to setup clk_lane_reg1 timings. Link frequency
046ee0e2a4d602 Alain Volmat   2023-11-25  372   * will be retrieve from connected device via v4l2_get_link_freq, bit per pixel
642bb5e88fed89 Mickael Guene  2019-04-09  373   * and number of lanes.
642bb5e88fed89 Mickael Guene  2019-04-09  374   */
642bb5e88fed89 Mickael Guene  2019-04-09  375  static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge)
642bb5e88fed89 Mickael Guene  2019-04-09  376  {
642bb5e88fed89 Mickael Guene  2019-04-09  377  	struct i2c_client *client = bridge->i2c_client;
642bb5e88fed89 Mickael Guene  2019-04-09  378  	struct v4l2_subdev *subdev = bridge->s_subdev;
046ee0e2a4d602 Alain Volmat   2023-11-25  379  	struct v4l2_fwnode_endpoint *ep = &bridge->rx;
046ee0e2a4d602 Alain Volmat   2023-11-25  380  	u32 bpp = bpp_from_code(bridge->fmt.code);
046ee0e2a4d602 Alain Volmat   2023-11-25  381  	/*
046ee0e2a4d602 Alain Volmat   2023-11-25  382  	 * clk_lane_reg1 requires 4 times the unit interval time, and bitrate
046ee0e2a4d602 Alain Volmat   2023-11-25  383  	 * is twice the link frequency, hence ui_4 = 1000000000 * 4 / 2
046ee0e2a4d602 Alain Volmat   2023-11-25  384  	 */
046ee0e2a4d602 Alain Volmat   2023-11-25  385  	u64 ui_4 = 2000000000;
046ee0e2a4d602 Alain Volmat   2023-11-25  386  	s64 link_freq;
642bb5e88fed89 Mickael Guene  2019-04-09  387
046ee0e2a4d602 Alain Volmat   2023-11-25  388  	link_freq = v4l2_get_link_freq(subdev->ctrl_handler, bpp,
046ee0e2a4d602 Alain Volmat   2023-11-25  389  				       2 * ep->bus.mipi_csi2.num_data_lanes);
046ee0e2a4d602 Alain Volmat   2023-11-25  390  	if (link_freq < 0) {
6a381d1072f174 Hugues Fruchet 2019-06-17  391  		dev_err(&client->dev, "Failed to get link frequency");
642bb5e88fed89 Mickael Guene  2019-04-09  392  		return -EINVAL;
642bb5e88fed89 Mickael Guene  2019-04-09  393  	}
642bb5e88fed89 Mickael Guene  2019-04-09  394
046ee0e2a4d602 Alain Volmat   2023-11-25  395  	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
046ee0e2a4d602 Alain Volmat   2023-11-25 @396  	do_div(ui_4, link_freq);
046ee0e2a4d602 Alain Volmat   2023-11-25  397  	bridge->r.clk_lane_reg1 |= ui_4 << 2;
642bb5e88fed89 Mickael Guene  2019-04-09  398
642bb5e88fed89 Mickael Guene  2019-04-09  399  	return 0;
642bb5e88fed89 Mickael Guene  2019-04-09  400  }
642bb5e88fed89 Mickael Guene  2019-04-09  401

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
