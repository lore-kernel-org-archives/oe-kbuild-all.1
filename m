Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885D2309AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195910; cv=none; b=KmkFYYoUW4s8c3BgahUiZ2kSbocIa1LLloPEmMA0196eD1WbLHpWfDgU6NpYQVd/M2zhEURKx0qEtK9eqp36qMVDwXwz1PXhgAsvGXtYfHNDIaxnwAsBXD5A7EfdiWct7Te2R5aJf6rqpW2WSPzlmlyyLIlJ5DDCRaKSFiWZ3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195910; c=relaxed/simple;
	bh=UGwO/bFqaojHA1cvkelalC2GX7lXAc1A55AXlqrKry4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTrm3wyOTsimMeNVGiF0M4xqUUVraV0UQiMqnhn2tT6OeP1WumWFCJnMII/INrOgTdtgDNK5kCDdfuSEohGlttEAs/PiLVrIk5CXlxTmUYa0SoYuzyqHmRz5cgIcJdu6MBTFmSoX8Mgv+b3vC4WKxixsDyDW4GcHebXorWbd+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arYhk81k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arYhk81k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739195909; x=1770731909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UGwO/bFqaojHA1cvkelalC2GX7lXAc1A55AXlqrKry4=;
  b=arYhk81kpGGP3ETPd+imtI0+6OQrvzzDfK0S5Rot/ZVTm66B4IolZK0N
   SW3iPX9hCeBNdPJ/jQGCzMc+/nlDYr0cg9vIzbNsWtszQ69y7P0rr8M4I
   yY1KIyTADRSd35Qte46WmVdCHIhwVUNAtVYnFebgbViDYmgEQmFd5oXQ6
   D967psa9AaEquOR2ezAQQKg2J8Gf5J2Do87ctLI69Mxb4WgVf/13ZTEIW
   XVLiLWuXhgGI7/PjLn1w2a2jI264sHnCvXJIaeGLgPV3eXxBnwG4pKn+u
   g9tEdif+E1LOCCkbe6Z7roVsbr/unWLGIiuDjd7qpSn9T7qm6SJ4ZWkcL
   A==;
X-CSE-ConnectionGUID: VWcAbF1JRjijmINcr3GJ0g==
X-CSE-MsgGUID: Fcxb0KvsSuWjmOE+yy8PVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40044621"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="40044621"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 05:58:28 -0800
X-CSE-ConnectionGUID: g4zW3PwQQ/y4x6/DFjGosw==
X-CSE-MsgGUID: 9durtbzBQDi8ifZqB5boSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112634957"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2025 05:58:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thUIn-0012ql-2c;
	Mon, 10 Feb 2025 13:58:21 +0000
Date: Mon, 10 Feb 2025 21:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v5] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202502102128.fEu1NOLZ-lkp@intel.com>
References: <20250210060923.2434047-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210060923.2434047-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20250210-141140
base:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
patch link:    https://lore.kernel.org/r/20250210060923.2434047-1-dongcheng.yan%40intel.com
patch subject: [PATCH v5] media: i2c: add lt6911uxe hdmi bridge driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502102128.fEu1NOLZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102128.fEu1NOLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102128.fEu1NOLZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/lt6911uxe.c: In function 'lt6911uxe_get_mbus_config':
>> drivers/media/i2c/lt6911uxe.c:444:12: error: 'struct v4l2_mbus_config' has no member named 'link_freq'
     444 |         cfg->link_freq = lt6911uxe->cur_mode.link_freq;
         |            ^~
   drivers/media/i2c/lt6911uxe.c: At top level:
>> drivers/media/i2c/lt6911uxe.c:106:32: warning: 'lt6911uxe_ev_stream_end' defined but not used [-Wunused-const-variable=]
     106 | static const struct v4l2_event lt6911uxe_ev_stream_end = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +444 drivers/media/i2c/lt6911uxe.c

   434	
   435	static int lt6911uxe_get_mbus_config(struct v4l2_subdev *sd,
   436					     unsigned int pad,
   437					     struct v4l2_mbus_config *cfg)
   438	{
   439		struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
   440		struct v4l2_subdev_state *state;
   441	
   442		state = v4l2_subdev_lock_and_get_active_state(sd);
   443		cfg->type = V4L2_MBUS_CSI2_DPHY;
 > 444		cfg->link_freq = lt6911uxe->cur_mode.link_freq;
   445		v4l2_subdev_unlock_state(state);
   446	
   447		return 0;
   448	}
   449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
