Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628DB3793AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229087; cv=none; b=KLC4Iu4hz94V+LDQd8Nlf/LNhKotYA/q4tZthxkezi6Zb+oZDNFhPSjZQd8wMFEZd29tk2yQZFr1KbmGQC8PYL2/wSvAlhGuX01lrcRrCxWB7xveSEplirceGjTJ7lUnVW2UuIhEm3KgFPhPT0gWJ8EjPCfAabstBpeQqh+SMQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229087; c=relaxed/simple;
	bh=ApuIZjizd150Sds1I58AN2d4LtlHwPfnYrCr07zZu8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2VedkHu+ZVv7vSpo8ZXdq9pXBf6QwuDrihcm6cxGNEW8Gr4mejnV8U+LvkI2rRyOt6Ub5IO37e5Lx2sifPnp4+xJoeLVqWO3rM6Yw1g5rLrRwl5600LXtXi3vBVl1cz34lCPAIlb0xv6I2qfksOFW+0iKC1e3sro/YaNrm7xDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tyfu8b6p; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tyfu8b6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779229085; x=1810765085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ApuIZjizd150Sds1I58AN2d4LtlHwPfnYrCr07zZu8k=;
  b=Tyfu8b6pj7nSEYZ082DBLaJEcDFVF7pJ78xIhYKdnjEKgZXDZMGUvNTf
   pGVjCktgWfVek3pmw3V6jow0p+HylbNFqa3nRBbK2L/zvk7ixL5uyG4+T
   DD6G912FJbVBVWiF/XTUeNOIU4uHZXrBTzPK3L+5fzmkGz6ug5ZONsjn5
   jnPX7b1f9ZpFzOLiUlv53uOTddzYcEg9IF5bhVWtcveQ+XFSg2A4gehEo
   nWvFHf71+DB9cpy+KMDyo/vjf0vyseNYXBXVuV65ZvTywY8fa9PBjnquV
   kkXm3hQoGQ3Lo91QoweSpjbcssv6p+U5XLjqfPV1shVngeZ7pDiAnM1yi
   A==;
X-CSE-ConnectionGUID: owMYVi7wSn+kqNZ5w+9elA==
X-CSE-MsgGUID: ukDf/DwoRpy0YqjrAbRAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80174232"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80174232"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 15:18:05 -0700
X-CSE-ConnectionGUID: +rqTif50SkOIfUZrZi19MA==
X-CSE-MsgGUID: +vEzlPaDSJSsP7Q018NdKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244883781"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 May 2026 15:18:02 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPSk0-0000000021R-2ewy;
	Tue, 19 May 2026 22:17:15 +0000
Date: Wed, 20 May 2026 06:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Sampath Kumar <nissampa@cisco.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org, nissampa@cisco.com
Subject: Re: [PATCH] regmap-i2c: fix sparse warning in
 regmap_smbus_word_write_reg16
Message-ID: <202605200654.DSWKrX9W-lkp@intel.com>
References: <20260519170836.1344260-1-nissampa@cisco.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519170836.1344260-1-nissampa@cisco.com>

Hi Nishanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regmap/for-next]
[also build test ERROR on linus/master v7.1-rc4 next-20260519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nishanth-Sampath-Kumar/regmap-i2c-fix-sparse-warning-in-regmap_smbus_word_write_reg16/20260520-011137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
patch link:    https://lore.kernel.org/r/20260519170836.1344260-1-nissampa%40cisco.com
patch subject: [PATCH] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
config: s390-randconfig-r071-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200654.DSWKrX9W-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200654.DSWKrX9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200654.DSWKrX9W-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/regmap/regmap-i2c.c: In function 'regmap_smbus_word_write_reg16':
>> drivers/base/regmap/regmap-i2c.c:340:33: error: expected ';' before ')' token
          ((u16)val << 8) | addr_lo));
                                    ^
                                    ;
>> drivers/base/regmap/regmap-i2c.c:340:33: error: expected statement before ')' token


vim +340 drivers/base/regmap/regmap-i2c.c

   305	
   306	/*
   307	 * SMBus byte/word reg16 support for adapters that have SMBUS_BYTE_DATA
   308	 * and SMBUS_WORD_DATA but lack I2C_FUNC_I2C and I2C_FUNC_SMBUS_I2C_BLOCK,
   309	 * such as the AMD PIIX4.
   310	 *
   311	 * READ:  set 16-bit EEPROM address via write_byte_data(addr_lo, addr_hi),
   312	 *        then sequentially read bytes via read_byte() (EEPROM auto-
   313	 *        increments the address pointer).  Same as the I2C-block reg16
   314	 *        read path above.
   315	 *
   316	 * WRITE: encode the low address byte and data into a word transaction:
   317	 *        write_word_data(addr_hi, (data_byte << 8) | addr_lo).
   318	 *        Only single-byte writes are supported (one value per transaction).
   319	 */
   320	static int regmap_smbus_word_write_reg16(void *context, const void *data,
   321						 size_t count)
   322	{
   323		struct device *dev = context;
   324		struct i2c_client *i2c = to_i2c_client(dev);
   325		u8 addr_hi, addr_lo, val;
   326	
   327		/*
   328		 * data layout: [addr_hi, addr_lo, val0, val1, ...].
   329		 * Only single-byte value writes are supported; multi-byte would
   330		 * require raw I2C (or repeated word writes with incrementing address).
   331		 */
   332		if (count != 3)
   333			return -EINVAL;
   334	
   335		addr_hi = ((u8 *)data)[0];
   336		addr_lo = ((u8 *)data)[1];
   337		val = ((u8 *)data)[2];
   338	
   339		return i2c_smbus_write_word_data(i2c, addr_hi,
 > 340						 ((u16)val << 8) | addr_lo));
   341	}
   342	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
