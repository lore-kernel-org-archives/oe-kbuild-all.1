Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC737B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 00:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1NC8x6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701130783; x=1732666783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQ+NFKsOkDoA1EiLaowbEcfukpX1OGXrj7ZBoW49vj0=;
  b=M1NC8x6jzD/PxB9ePjpmAH3bCqC6HBMSVRpYjfxc64VcoymIZNCgC07y
   oziu6RCYT0yfhyCc4uaPoh7UiIaa0MU4fFTIJz0/Qn9acQlm0mzZF5s/M
   MDKQJ/YOM3Ie/rj5TjobjnlF6obq5fi0QkkIrbcgwfNjxTStfZn/mfAbW
   5XwCPIZG3DuPtgTOAYjn14JBY5/Bx3mQozsu5RIrX4V6H/CW4mYX4L+kx
   ILc14AUjF9QqsMkIWh2YfqLQPkXMAYhnVx+8CYF8tf/7XFbOIIjYh2TQi
   SroPJ4p5oGGaFdCQJMOk5f9ov0BV697EHPlD462d0e9WiRWiGF4nSqORQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="14374364"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="14374364"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 16:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="941743833"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="941743833"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Nov 2023 16:19:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7lpC-0006nx-2F;
	Tue, 28 Nov 2023 00:19:38 +0000
Date: Tue, 28 Nov 2023 08:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:mtk/v6.7/intervals 3/4]
 drivers/media/v4l2-core/v4l2-subdev.c:1655:1: warning: no previous prototype
 for '__v4l2_subdev_state_get_interval'
Message-ID: <202311280400.rvR59MB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.7/intervals
head:   27b8839be04741c170c189d82a250535948a6f06
commit: a25f3c2e3c0acce21f4d465efc811c5801adbc41 [3/4] media: v4l2-subdev: Store frame interval in subdev state
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20231128/202311280400.rvR59MB0-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280400.rvR59MB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280400.rvR59MB0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:1655:1: warning: no previous prototype for '__v4l2_subdev_state_get_interval' [-Wmissing-prototypes]
    1655 | __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__v4l2_subdev_state_get_interval +1655 drivers/media/v4l2-core/v4l2-subdev.c

  1653	
  1654	struct v4l2_fract *
> 1655	__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
  1656					 unsigned int pad, u32 stream)
  1657	{
  1658		struct v4l2_subdev_stream_configs *stream_configs;
  1659		unsigned int i;
  1660	
  1661		if (WARN_ON(!state))
  1662			return NULL;
  1663	
  1664		lockdep_assert_held(state->lock);
  1665	
  1666		if (state->pads) {
  1667			if (stream)
  1668				return NULL;
  1669	
  1670			if (WARN_ON(pad >= state->sd->entity.num_pads))
  1671				pad = 0;
  1672	
  1673			return &state->pads[pad].interval;
  1674		}
  1675	
  1676		stream_configs = &state->stream_configs;
  1677	
  1678		for (i = 0; i < stream_configs->num_configs; ++i) {
  1679			if (stream_configs->configs[i].pad == pad &&
  1680			    stream_configs->configs[i].stream == stream)
  1681				return &stream_configs->configs[i].interval;
  1682		}
  1683	
  1684		return NULL;
  1685	}
  1686	EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_interval);
  1687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
