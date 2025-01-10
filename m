Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7820B217
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505464; cv=none; b=oPXOaN6S056V4Oeue7UbQgAoVBz8K5up9GmM6yXc/WrJJm9mZEExGv22h2xUuGIiRidlTSmM1FOmi5fbdOZFxte8j/HfNenCWHHapdyLbgvlNv4mo+OaHuoxEiKoA+h+VQMmh4lgOp014c0v4wspYZaBIvS62YhtxwWIofIxUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505464; c=relaxed/simple;
	bh=xJdA3RvMpjGkAhyH/0QV1D89tdv+dVvy/TNS7gGNDaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnTxkJqZWEpn+sOKRVlMLPERVIOc6PKgfoBoUTynmfAPD6XGpT2rFG02Zpk2yIV05EAixFwfyC71vdCQNyXV7MR82Ir/JMBBL9PLjtdq0w4xlT36WkM1bjQCEy1DuzB+vwi6TT/l1eAh/5SoN22aIXnAw685/uhKymyhY/7BLgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnVrES+C; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnVrES+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736505462; x=1768041462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xJdA3RvMpjGkAhyH/0QV1D89tdv+dVvy/TNS7gGNDaA=;
  b=VnVrES+CDMonqj8UsCvJG/2Y4OrRBpyLZR9jVmSBohQt9zWGZYu5gbK5
   IYnEWVN+JpSgB194vOhqH5apCyVU2gBKVMxWAUIvzblFWWgHKD6Uni8LQ
   viL+7v79EvPD0RONDj8Tqa8Q62AJGiaccPN5pV2mKrqH5jAv9ZAg1bT6Y
   pFjDZKeQZGMrQXCE4HhzlU4nMxIIzUjX8nHLoaQWtRYVq6ZpBekZCyrGb
   fVK33ZhY9GiN6LYuo1TKLyxSSSKfs+A7g3EQ+i+M/G5bNv4FHKVVM3C82
   fooOkJjTHzYOZDgYcuXlnX+D92x+EVq7DXr7uQua3Ub0ESTiEUamFp5eG
   A==;
X-CSE-ConnectionGUID: UC7bBoapQqOlzlMOMurwew==
X-CSE-MsgGUID: LpW3dyxOShmVowg1DBbgBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36011799"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36011799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:37:42 -0800
X-CSE-ConnectionGUID: kHZdEC/eTvSoieqZ7prrkQ==
X-CSE-MsgGUID: WHsEzLhTSZWae0q0VigZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134600421"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 02:37:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWCOZ-000J2J-0g;
	Fri, 10 Jan 2025 10:37:39 +0000
Date: Fri, 10 Jan 2025 18:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] media: i2c: ds90ub953: Add TPG support
Message-ID: <202501101823.2pdM9LEe-lkp@intel.com>
References: <20250109-ub953-tpg-v1-2-d7392375c243@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-ub953-tpg-v1-2-d7392375c243@ideasonboard.com>

Hi Tomi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 40ed9e9b2808beeb835bd0ed971fb364c285d39c]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/media-mc-Add-INTERNAL-pad-flag/20250109-181850
base:   40ed9e9b2808beeb835bd0ed971fb364c285d39c
patch link:    https://lore.kernel.org/r/20250109-ub953-tpg-v1-2-d7392375c243%40ideasonboard.com
patch subject: [PATCH RFC 2/2] media: i2c: ds90ub953: Add TPG support
config: csky-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101823.2pdM9LEe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101823.2pdM9LEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101823.2pdM9LEe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ds90ub953.c: In function 'ub953_enable_tpg':
>> drivers/media/i2c/ds90ub953.c:978:25: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     978 |                         FIELD_PREP(UB953_IND_PGEN_CFG_NUM_CBARS_MASK, 0) |
         |                         ^~~~~~~~~~


vim +/FIELD_PREP +978 drivers/media/i2c/ds90ub953.c

   896	
   897	static int ub953_enable_tpg(struct ub953_data *priv,
   898				    enum ub953_tpg_pattern pattern)
   899	{
   900		const struct ub953_format_info *fmt_info;
   901		struct device *dev = &priv->client->dev;
   902		struct v4l2_subdev *sd = &priv->sd;
   903		struct v4l2_subdev_state *state;
   904		struct v4l2_mbus_framefmt *fmt;
   905		struct v4l2_fract *ival;
   906		const u8 num_cbars = 8;
   907		const u8 vc = 0; /* Always VC 0 for now */
   908		const u8 vbp = 33;
   909		const u8 vfp = 10;
   910		const u16 tot_blanking = vbp + vfp + 2;
   911		u16 line_size; /* in bytes */
   912		u16 bar_size; /* in bytes */
   913		u16 act_lpf; /* active lines/frame */
   914		u16 tot_lpf; /* tot lines/frame */
   915		u64 line_pd; /* Line period in 10-ns units */
   916	
   917		state = v4l2_subdev_get_locked_active_state(sd);
   918	
   919		fmt = v4l2_subdev_state_get_format(state, UB953_PAD_TPG, 0);
   920		if (!fmt)
   921			return -EINVAL;
   922	
   923		ival = v4l2_subdev_state_get_interval(state, UB953_PAD_TPG, 0);
   924		if (!ival)
   925			return -EINVAL;
   926	
   927		fmt_info = ub953_find_format(fmt->code);
   928		if (!fmt_info) {
   929			dev_err(dev, "unsupported TPG format %#x\n", fmt->code);
   930			return -EINVAL;
   931		}
   932	
   933		line_size = fmt->width * fmt_info->bitspp / 8;
   934		bar_size = rounddown(line_size / num_cbars, fmt_info->block_size);
   935		act_lpf = fmt->height;
   936		tot_lpf = act_lpf + tot_blanking;
   937		line_pd = div_u64((u64)NANO / 10 * ival->numerator,
   938				  ival->denominator * tot_lpf);
   939	
   940		if (line_pd > 0xffff) {
   941			dev_err(dev, "Line period over the limit: %llu\n", line_pd);
   942			return -EINVAL;
   943		}
   944	
   945		if (fmt->width * fmt_info->bitspp % 8 != 0) {
   946			dev_err(dev, "Invalid TPG width\n");
   947			return -EINVAL;
   948		}
   949	
   950		if (line_size % fmt_info->block_size != 0) {
   951			dev_err(dev, "Invalid TPG line size\n");
   952			return -EINVAL;
   953		}
   954	
   955		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CSI_DI,
   956				(vc << 6) | (fmt_info->dt << 0));
   957		ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
   958				  UB953_IND_PGEN_LINE_SIZE1, line_size);
   959		ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
   960				  UB953_IND_PGEN_BAR_SIZE1, bar_size);
   961		ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
   962				  UB953_IND_PGEN_ACT_LPF1, act_lpf);
   963		ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
   964				  UB953_IND_PGEN_TOT_LPF1, tot_lpf);
   965		ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
   966				  UB953_IND_PGEN_LINE_PD1, line_pd);
   967		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VBP,
   968				vbp);
   969		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VFP,
   970				vfp);
   971	
   972		for (unsigned int i = 0; i < 3; ++i)
   973			ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
   974					UB953_IND_PGEN_COLOR(i), 0x0);
   975	
   976		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CFG,
   977				UB953_IND_PGEN_CFG_FIXED_COLOR_MODE |
 > 978				FIELD_PREP(UB953_IND_PGEN_CFG_NUM_CBARS_MASK, 0) |
   979				FIELD_PREP(UB953_IND_PGEN_CFG_BLOCK_SIZE_MASK,
   980					   fmt_info->block_size));
   981	
   982		switch (pattern) {
   983		case UB953_TPG_RED:
   984			ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
   985					UB953_IND_PGEN_COLOR(2), 0xff);
   986			break;
   987		case UB953_TPG_GREEN:
   988			ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
   989					UB953_IND_PGEN_COLOR(1), 0xff);
   990			break;
   991		case UB953_TPG_BLUE:
   992			ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
   993					UB953_IND_PGEN_COLOR(0), 0xff);
   994			break;
   995		default:
   996			break;
   997		}
   998	
   999		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
  1000				UB953_IND_PGEN_CTL_PGEN_ENABLE);
  1001	
  1002		return 0;
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
