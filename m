Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58954A2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716004371; cv=none; b=jlbM2dEW7kI8MDQsQ6R3kvizQjBokrZWB5b1ltSoKUY7sxvsxdRkYhiABoQJ9uSNbT6IJ5Y6E6UqFZ1Ia5Dsg/BNkmqe24yzILRhb8gHEMrLAsyMZ3NKwORDV8TIoMWHbTqbSuTf8dU98NoiuOiC/O7JcePn7/ZWb+akyAUYRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716004371; c=relaxed/simple;
	bh=ab6MQkKmf/FpFVjYsqm0i/fTOZrW9aKA/pnX5yb138c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diE7103v9XEH9XIv1cuYXVoJsTs0bb9E8pOi3JT7KLIYzMkuYVRFbxMB7qq7Zljje5P6aBRADd5ArqTu/A9Ga8YkAJMSg969zvG+dG+jCEecAP6da7uJVYDyYAradKGWVegdA6bBchFRfi4jmML8WHjUJ42GwVYtjDv4u4WHDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1nHVcrn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1nHVcrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716004369; x=1747540369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ab6MQkKmf/FpFVjYsqm0i/fTOZrW9aKA/pnX5yb138c=;
  b=b1nHVcrn68yI7gSwlIZUXlMGie7MAMKvvGhbpYjMueDKZeem4LDueqae
   86W+O9ODWsyen7MA3F2gPz52s/et7N4CjBLt4iMD3YUeRqC7ji0RCY8qm
   r483WHs0oCblWOC0SDBFRn+/RAdsfg4oSwitkrKVBUy7NnIl8eW9nfhUJ
   KR7m4ZrksWnafoamUZRETc3lKok+sKTQw0+NEf5jHXkOKA16aknRjmRuo
   8cXj05Q6l3QPrWNUO11OGhyVOWGs4cjO2dZp9xo5IAq3xp45fKYEO5VBC
   Zrx9C9Ow3wp90yw4tf7kyScmTqr7d6Sew5KpkXmzBdLS5XW+WdxhBpObx
   g==;
X-CSE-ConnectionGUID: +35z8oDrSaaV7e+KWTVPoQ==
X-CSE-MsgGUID: kkHiNAAPQAGJIy0B804cgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22811539"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="22811539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 20:52:48 -0700
X-CSE-ConnectionGUID: fB8ulryDSsmV9gw4qhzAQw==
X-CSE-MsgGUID: JIKEBwkfR+Ssv7slZ8UuUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="36731169"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 May 2024 20:52:45 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8B7h-0001bE-2F;
	Sat, 18 May 2024 03:52:42 +0000
Date: Sat, 18 May 2024 11:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: Re: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
Message-ID: <202405181143.nHERYo41-lkp@intel.com>
References: <6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh@melexis.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh@melexis.com>

Hi Volodymyr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8771b7f31b7fff91a998e6afdb60650d4bac59a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Volodymyr-Kharuk/media-uapi-ctrls-Add-camera-trigger-controls/20240517-004536
base:   8771b7f31b7fff91a998e6afdb60650d4bac59a5
patch link:    https://lore.kernel.org/r/6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh%40melexis.com
patch subject: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
config: csky-randconfig-r123-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181143.nHERYo41-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240518/202405181143.nHERYo41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181143.nHERYo41-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/mlx7502x.c:480:12: warning: 'mlx7502x_read' defined but not used [-Wunused-function]
     480 | static int mlx7502x_read(struct v4l2_subdev *sd, u16 reg, u8 *val, int val_size)
         |            ^~~~~~~~~~~~~


vim +/mlx7502x_read +480 drivers/media/i2c/mlx7502x.c

   479	
 > 480	static int mlx7502x_read(struct v4l2_subdev *sd, u16 reg, u8 *val, int val_size)
   481	{
   482		int ret;
   483		unsigned char data_w[2];
   484		struct i2c_client *client = v4l2_get_subdevdata(sd);
   485	
   486		struct i2c_msg msg[] = {
   487			{
   488				.addr = client->addr,
   489				.flags = 0,
   490				.len = 2,
   491				.buf = data_w,
   492			}, {
   493				.addr = client->addr,
   494				.flags = I2C_M_RD,
   495				.len = val_size,
   496				.buf = val,
   497			}
   498		};
   499	
   500		/* write reg address into first msg */
   501		put_unaligned_be16(reg, data_w);
   502	
   503		/* Using transfer allows skip STOP between messages
   504		 * so we have repeated Start here
   505		 */
   506		ret = i2c_transfer(client->adapter, msg, 2);
   507	
   508		return ret != 2 ? -EIO : 0;
   509	}
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
