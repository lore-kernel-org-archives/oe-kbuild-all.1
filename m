Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51992BEC41
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839481; cv=none; b=skU8j7e4XIjuFGawxHl3igl33gfJK0doD118/Yw3gRBfFw1TBOPNko82kk6TB8eNwhLFBXyhPUVMqRFtI9aNTFFahuesqZjkC+1xY23c1LLk8p9+W7hT9Q39JJ/8dIU8AbPxa1Qv644ruzo1/2G3tCBg/fkLnT3AcY6WKJ7i2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839481; c=relaxed/simple;
	bh=ZyyCSvAHsQZEnq3v70lc44LdXO7guHq1mCT0tNZVoTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JLZ6jg15wehx9zHb9Iz/6a32dru1pdXGrWgUIX9JQ8miwbfLY00GCxGYUNdljgkFW19JGru3MOrpVtBWnuTvbdrt4MnBMl74z+gvht2d1FPua7wKPlB8SOMvXPjhhVblfsMEgj1DhQQuPWfJtXa2NT1Mft6L5Nqug5u3/heHGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNYnmz6W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNYnmz6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768839480; x=1800375480;
  h=date:from:to:cc:subject:message-id;
  bh=ZyyCSvAHsQZEnq3v70lc44LdXO7guHq1mCT0tNZVoTw=;
  b=RNYnmz6Wan/yFPCXlox7KixhEzc93yEgDl0QlIhmhB9PE7+ePUIG9mkC
   GRGSIw9vepDAl6n79Io1tgXkbfjRZxzGNwczKs60xW2uukGWVu4EQl4Yi
   2M+KPxyp4ZfS1oEx8yqREqGTpaOak1JwrGJO2IoCi4u01JRV5Zkt9nxYF
   Ov8oqtg2U8c3Ve4sBrKL3B0uns3RemyitNoBlA2ZOkQbqGcygqMDwdgOy
   zk1dsZSkZZmb5uRMV6g1rTiLFcHetH9ak6SEq2cWgPbBgJkCO0IEkXoGx
   jHw/dhbSMaAhlJtGxUEPSc9wuWhNqw7386LlX6/xErg1H8JUvlxNgjWw8
   Q==;
X-CSE-ConnectionGUID: nQHrA5iySBC+KDnQtgzE1Q==
X-CSE-MsgGUID: 2iead2bMQLizoLhsPUO2ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69253695"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69253695"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:17:57 -0800
X-CSE-ConnectionGUID: pYus70LYSfe3NfvzXXWH/Q==
X-CSE-MsgGUID: FhsUkY/BSzOvp+cPOs481Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 08:17:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhrwv-00000000O1p-0QU5;
	Mon, 19 Jan 2026 16:17:53 +0000
Date: Tue, 20 Jan 2026 00:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 90/113]
 drivers/media/v4l2-core/v4l2-subdev.c:2675:55: warning: overlapping
 comparisons always evaluate to true
Message-ID: <202601200019.peMSxK0X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 50fcff1c16cac7152a1b5b56a71656e97d276857 [90/113] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
config: sparc64-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200019.peMSxK0X-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200019.peMSxK0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200019.peMSxK0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:2675:55: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
    2675 |         if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
    2676 |             desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2675 drivers/media/v4l2-core/v4l2-subdev.c

  2659	
  2660	int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  2661				       struct v4l2_mbus_frame_desc *desc)
  2662	{
  2663		if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
  2664			unsigned int type = desc->type;
  2665			int ret;
  2666	
  2667			ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
  2668	
  2669			if (desc->type != type)
  2670				return -EINVAL;
  2671	
  2672			return ret;
  2673		}
  2674	
> 2675		if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
