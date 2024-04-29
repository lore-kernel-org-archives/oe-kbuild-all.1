Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32794381C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714412641; cv=none; b=ZUyQGbbKdzzCNVSh8pmHy//XHABf3IY27eL43XDtT17CCWFYa2ut7NUkjuH3J/JLttprCvAce3dVFdb6yVpTUJQHpLKikuX36Y8qqkpYqoEnSNbAGk868Ge+vo4b/e38H2Sm4rM43vMYxCYab5TMv88PnUYhwWQcvtK5G5YKshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714412641; c=relaxed/simple;
	bh=VHYckSPs3DerC3dWXIwsb+ZAh1J+ggc5/swzMxjH9yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkkLLt9Ptj+3E8A7JstvCEt0Ei6sZ0MUzngbhKhBJWQxAx7poPnO5AIB1dTMInRJO1O6MYemuQtqm5bCZG5dXpDDXzCUFvITZjLiDKzt2xqNbkyk7JvOX4AJuM94VrblLz73pZjviUUa9Y5lYENadd/aOgqdZkmT6PWvlwJg/WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/vGjXIF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/vGjXIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714412639; x=1745948639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VHYckSPs3DerC3dWXIwsb+ZAh1J+ggc5/swzMxjH9yQ=;
  b=m/vGjXIFt6ZRoUVg9sXKp9ZQkwRP+VLbwMoWyaVT6TTMnkQaegZhRbxl
   7mrjO0hIF+ybfUd29qkldPS3cfiCftm2cOmaFo4Za1gLj7ar6x8J3kEGD
   5y4PxLs0xhpB8Ns3oQBqYL3F4kM3DLS1XtHsiYbpNYtyQJIp1mXK9ZfbW
   42LIJwE3p8UQ0cUw6veifpEPeiJA+nXAQxsUQPFXk7kBBB/Zsyn2jQsyW
   7Bwy/CUeG+WLVZAclzr8DU1jLX9AYMrDBtbE6gWE2S8zPP/TbaUPQI5Qn
   Gwl6rFphkozCxsGfIR9snYUlKQoeeNwGYKJHKjkPQpqX5dAEFVLTuYBrj
   Q==;
X-CSE-ConnectionGUID: ZGwZMy+EQMuj7uVqwrik2A==
X-CSE-MsgGUID: cNVU19pcSLidgim3u2d5Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20705488"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20705488"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 10:43:58 -0700
X-CSE-ConnectionGUID: +LyUMNk5QBWpsEY8WT3aJA==
X-CSE-MsgGUID: 9NLErs/IRb+ooY0AOZmdXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26173719"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2024 10:43:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1V2e-0007Lq-0g;
	Mon, 29 Apr 2024 17:43:52 +0000
Date: Tue, 30 Apr 2024 01:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <202404300113.eVfFJ5WC-lkp@intel.com>
References: <20240429153704.1005192-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429153704.1005192-3-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on 12e3384b874e9f67c3e98ce501561fe5a54a0add]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Support-passing-sub-device-argument-to-v4l2_get_link_freq/20240429-234508
base:   12e3384b874e9f67c3e98ce501561fe5a54a0add
patch link:    https://lore.kernel.org/r/20240429153704.1005192-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH v3 2/4] media: v4l: Support obtaining link frequency via get_mbus_config
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240430/202404300113.eVfFJ5WC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300113.eVfFJ5WC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300113.eVfFJ5WC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-common.c: In function '__v4l2_get_link_freq_pad':
>> drivers/media/v4l2-core/v4l2-common.c:512:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     512 |         ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
         |         ^~~
         |         net
   drivers/media/v4l2-core/v4l2-common.c:512:9: note: each undeclared identifier is reported only once for each function it appears in


vim +512 drivers/media/v4l2-core/v4l2-common.c

   504	
   505	s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
   506				      unsigned int div)
   507	{
   508		struct v4l2_mbus_config mbus_config = {};
   509		struct v4l2_subdev *sd;
   510	
   511		sd = media_entity_to_v4l2_subdev(pad->entity);
 > 512		ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
   513				       &mbus_config);
   514		if (ret < 0 && ret != -ENOIOCTLCMD)
   515			return ret;
   516	
   517		return mbus_config.link_freq ?:
   518			__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
   519	}
   520	EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
