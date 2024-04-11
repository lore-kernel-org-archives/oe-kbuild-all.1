Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D01A142E65
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826862; cv=none; b=QO/0rNdZoqB7k7Y1MhYQaz/wlsKWtUixlpb7FrjFAHTfQUwx9WMm6h/vb4zXXt97rc06gz03N2mVYVlbsroarPdCSQpPuu5bcSE4Xm2drtdoJMF/MCnN5Gy8Vp54JLmC/NV/JkMPKxtl5HWUBWrk1Er21s8VlK8ire/JGs7NUeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826862; c=relaxed/simple;
	bh=3uX3GFWzDLl6267GVE8v7d0doLrNu1J+qslvHHONhYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T5ns3p1S+8f8mgFRdzJiOlAfIV8V2xkeulatc/asvOvJS/o1UR+zIfaxo2X1k3GgDq7ecVWCwYzBSj4AoQR9Z11GO2hpxz9jJsTJ1+1sImhzjfMaD/S2v3pfW43gzYuinlzfk7c8P5ofHQpV7yWPRGz2t6MRcNxsiyEoD2QXHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj+VYR7Y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj+VYR7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826861; x=1744362861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3uX3GFWzDLl6267GVE8v7d0doLrNu1J+qslvHHONhYA=;
  b=Bj+VYR7Y2FmM61Q0O8/wOdl882Z0/pE3grC9a7DZRbkGqkAlR9C7xjQN
   X1kqZO87ntoocpWVIDC5pUp8UYQVOrmWhwt6hQhfw6WJp0TDRKtEHu0Jg
   m9rjXkuAgG5+Yv0kwastesx8uhU5zeulUGyVrIIYgVZGe+PW5D51+aQzw
   EF4jdq5Mu65iVkElCenI0IoEg9ChnAzDGkgkMH5lVgxwe0Ymu+aPAqTFB
   DTmY2tzCrs7SkIqnhYrjvbwx1iskUulGPwEIO5Qb61H/9RiMYm5bTQhFo
   BKAvDOit/iJLFDmSQ8J+c0+FmNPIo2cWWL72W2C+12TvzdborvtjkyDkn
   w==;
X-CSE-ConnectionGUID: MavmC55MTEuaLz1TZNP6OQ==
X-CSE-MsgGUID: lL8iFeZnRv+Dv2CZgNoBTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11187510"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="11187510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:14:18 -0700
X-CSE-ConnectionGUID: qIKrCevcRF2jYuULV2nQ1Q==
X-CSE-MsgGUID: JCbX8wh8T/OXGSR/aSyRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20803520"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2024 02:14:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruqVb-0008SL-0L;
	Thu, 11 Apr 2024 09:14:15 +0000
Date: Thu, 11 Apr 2024 17:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 15863/18110]
 drivers/mxc/hantro_v4l2/vsi-v4l2.c:510:6: warning: no previous prototype for
 'vsi_v4l2_dec_in_source_change'
Message-ID: <202404111707.1eeJCqd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   2bfda7392e6621dd9060f87d7f9d601bb1906dbf
commit: 08feac38b33193a4e5ba8cac337f83a5f5c1329f [15863/18110] LF-10193: vpu: hantro_v4l2: initiate a drain of the capture queue in dynamic resolution change
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111707.1eeJCqd2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111707.1eeJCqd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111707.1eeJCqd2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/hantro_v4l2/vsi-v4l2.c: In function 'release_ctx':
   drivers/mxc/hantro_v4l2/vsi-v4l2.c:109:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     109 |         int ret = 0;
         |             ^~~
   drivers/mxc/hantro_v4l2/vsi-v4l2.c: At top level:
>> drivers/mxc/hantro_v4l2/vsi-v4l2.c:510:6: warning: no previous prototype for 'vsi_v4l2_dec_in_source_change' [-Wmissing-prototypes]
     510 | bool vsi_v4l2_dec_in_source_change(struct vsi_v4l2_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/hantro_v4l2/vsi-v4l2.c:522:6: warning: no previous prototype for 'vsi_v4l2_dec_handle_last_empty_buffer' [-Wmissing-prototypes]
     522 | void vsi_v4l2_dec_handle_last_empty_buffer(struct vsi_v4l2_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2.c:804:42: warning: 'v4l2_platform_info' defined but not used [-Wunused-const-variable=]
     804 | static const struct platform_device_info v4l2_platform_info = {
         |                                          ^~~~~~~~~~~~~~~~~~


vim +/vsi_v4l2_dec_in_source_change +510 drivers/mxc/hantro_v4l2/vsi-v4l2.c

   509	
 > 510	bool vsi_v4l2_dec_in_source_change(struct vsi_v4l2_ctx *ctx)
   511	{
   512		if (test_bit(CTX_FLAG_DELAY_SRCCHANGED_BIT, &ctx->flag))
   513			return true;
   514		if (ctx->reschanged_need_notify)
   515			return true;
   516		if (ctx->reschange_notified)
   517			return true;
   518	
   519		return false;
   520	}
   521	
 > 522	void vsi_v4l2_dec_handle_last_empty_buffer(struct vsi_v4l2_ctx *ctx)
   523	{
   524		if (vsi_v4l2_dec_in_source_change(ctx))
   525			return;
   526		if (ctx->status == DEC_STATUS_DRAINING ||
   527		    test_bit(CTX_FLAG_PRE_DRAINING_BIT, &ctx->flag)) {
   528			ctx->status = DEC_STATUS_ENDSTREAM;
   529			set_bit(CTX_FLAG_ENDOFSTRM_BIT, &ctx->flag);
   530			clear_bit(CTX_FLAG_PRE_DRAINING_BIT, &ctx->flag);
   531		}
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
