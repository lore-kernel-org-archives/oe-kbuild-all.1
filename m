Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE2155392
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 17:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295041; cv=none; b=D4SPKTO4neUSESfN+aI37IKtiQ+Z49s1fpIY8Zfqssbuzcskbk+uVglnFqtEUVyma9f8a58YVilGZBmcyzFHMrastwArP0urZRnniXA3GuDr4BaMvgx0JI6daC8PMBa8Esm3dF2NUIAD+SGy4VvNE8428AEIkcx4CGaIxXe3gJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295041; c=relaxed/simple;
	bh=2kvvGvfTa1KJwytCtGo77QIh0uie21EOLcMI4fD1ze8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ms9IaLRv6F605EcdAy0X8GZD444EUHlJ6N+dgwBwHNLr0m5BmISr1F41uA3Gm2USZP0ek7dy65d/g1xBMwcyLMJRpd6MofEwpSgod27Rtzk/7muaoVv8UFdpWXALOedNzDw3m3yISMmB4HwNDDBDTqzYzyYgtIcbwJzPPA86eDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2qv9MZO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2qv9MZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732295039; x=1763831039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2kvvGvfTa1KJwytCtGo77QIh0uie21EOLcMI4fD1ze8=;
  b=W2qv9MZOvtNXMVXe2RhfUlp8fzoPychM6B4OOypAbiVHQSdsPZmJ5D3v
   A4gYAN4qZq6BHJCvpyMhqjD+eCDEY8xhBwJsRP4tHtDEA4DHSCie6tPVZ
   AZ/RL87VVzjamSPVrKef78KdeA+iQlej2NiZf5sV2MvDO2Zj0wx6tSOz6
   FuFZ312+ujglMzFDfMiLh53k1RULduABo/zn196K5dH7LfrnMiw9vWaOk
   HLbpNOwlxq5wWpmtVpMEPT7563YDzp2Vlhxv89+aiTiiZrzz7FotT7abH
   kMu0tHDxmqqQhs5MMLFQUZiGxUg6hSVmRWwl1d/duTwas4sK9C/gGy9Vk
   A==;
X-CSE-ConnectionGUID: dtFl5sWxQhm7YgXnI/rw2g==
X-CSE-MsgGUID: C5CcErn8SHG6ObkK56ADvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43521541"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="43521541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 09:03:53 -0800
X-CSE-ConnectionGUID: c+r7cq2dSRySgSDyjoS7JA==
X-CSE-MsgGUID: r0gjlsJnQRav4/Z/47IQXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="95057395"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2024 09:03:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEX4P-00045L-1s;
	Fri, 22 Nov 2024 17:03:49 +0000
Date: Sat, 23 Nov 2024 01:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 6/6]
 drivers/media/v4l2-core/v4l2-loopback.c:791:14: warning: variable 'buf' set
 but not used
Message-ID: <202411230004.CGBUe184-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   6d4e4c8b2c8c3a3cc0af134d62691ef604b7b1d2
commit: 6d4e4c8b2c8c3a3cc0af134d62691ef604b7b1d2 [6/6] media: v4l2-loopback
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241123/202411230004.CGBUe184-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230004.CGBUe184-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230004.CGBUe184-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-loopback.c: In function 'inner_try_setfmt':
>> drivers/media/v4l2-core/v4l2-loopback.c:791:14: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
     791 |         char buf[5];
         |              ^~~


vim +/buf +791 drivers/media/v4l2-core/v4l2-loopback.c

   784	
   785	static struct v4l2_loopback_device *v4l2loopback_getdevice(struct file *f);
   786	static int inner_try_setfmt(struct file *file, struct v4l2_format *fmt)
   787	{
   788		int capture = V4L2_TYPE_IS_CAPTURE(fmt->type);
   789		struct v4l2_loopback_device *dev;
   790		int needschange = 0;
 > 791		char buf[5];
   792		buf[4] = 0;
   793	
   794		dev = v4l2loopback_getdevice(file);
   795	
   796		needschange = !(pix_format_eq(&dev->pix_format, &fmt->fmt.pix, 0));
   797		if (V4L2_LOOPBACK_IS_FIXED_FMT(dev)) {
   798			fmt->fmt.pix = dev->pix_format;
   799			if (needschange) {
   800				if (dev->active_readers > 0 && capture) {
   801					/* cannot call fmt_cap while there are readers */
   802					return -EBUSY;
   803				}
   804				if (dev->ready_for_capture > 0 && !capture) {
   805					/* cannot call fmt_out while there are writers */
   806					return -EBUSY;
   807				}
   808			}
   809		}
   810		if (v4l2l_fill_format(fmt, capture, dev->min_width, dev->max_width,
   811				      dev->min_height, dev->max_height) != 0) {
   812			return -EINVAL;
   813		}
   814	
   815		if (1) {
   816			char buf[5];
   817			buf[4] = 0;
   818			pr_info("capFOURCC=%s\n", fourcc2str(dev->pix_format.pixelformat, buf));
   819		}
   820		return 0;
   821	}
   822	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
