Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895EC268FD5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 00:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476811; cv=none; b=PLUUfEsmm5Xsd9FuRjnmAk8cjKCYSUkJFFwm57wXc5HStP+SCSWFLnMNeqgznQR6Rociy1wcsnsIgX9UhgwpFJF+zxmtB8llsyKETGO1s8atjz9RiZsvqv5VcUFJ50YkxohIdE23Vh8MtNDexsL7LHIY/TpmAKTMKvt1D3S3g1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476811; c=relaxed/simple;
	bh=aZqOxp92Ys+aIo+jdyqdVvFWBEXiUqE+1611Mk1Hygg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8HUw8f+MnX6t6K9CDrfAdHTYCBpqA+RofrvWJghWGxqAHR2FVhimumpWG4voKqxjK7JYaX4M5qSXybJ3r17mZW90Bt8tXFaSkCTFMR/R0trLujFMhYLxj+zL91qsd2ij99mbdRU3HTeRgN9F89GMiWKS2cIIcKbL2WJ8Ixvhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kF509BhD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kF509BhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748476810; x=1780012810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aZqOxp92Ys+aIo+jdyqdVvFWBEXiUqE+1611Mk1Hygg=;
  b=kF509BhDLKUM4jzRjKARGGFpfNI01q4QwuQDrM1sNa/NeKTmZR68ZIYw
   q6zd9sM3R8v/X+tA0RmAEDh9sX0j5xphc1jt2ifoopN3UWfK6O7/JTjF9
   YfQ/eXZ3ff6FB3IGP1yXHV7wh78i/q4ndTsBhSYXjSapbgZUA3RJNL149
   i4C5VHbx1CMneaccAPzvzUijLHflxKV0hlOp//ExN6IM3L3/app8sLJMG
   X/ZzQc0O6bf20C1IR+pMQDQ8KCirQZgT7LR/bnhn09yCUXejF40CNTy37
   qaJBex5sj22Qb6sb0kK2OZ4iGxYkwpi+0nZCdqczK/bSX2joYYF05vX1h
   Q==;
X-CSE-ConnectionGUID: ZG9ObzwUT5SwpTJjl65a9A==
X-CSE-MsgGUID: +fpF8hP2S+ecpJC+2c3MKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61577732"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61577732"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 17:00:08 -0700
X-CSE-ConnectionGUID: 1z5J1C5zSuWrDEBzOv7fyQ==
X-CSE-MsgGUID: MOGkxtCZQeeIz1BS4roItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143372266"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 17:00:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKQgl-000WAi-0E;
	Thu, 29 May 2025 00:00:03 +0000
Date: Thu, 29 May 2025 07:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
Subject: Re: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write
 Disable
Message-ID: <202505290728.VsNgBfDO-lkp@intel.com>
References: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>

Hi Yo-Jung,

kernel test robot noticed the following build errors:

[auto build test ERROR on 176e917e010cb7dcc605f11d2bc33f304292482b]

url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin/i2c-i801-Do-not-instantiate-spd5118-under-SPD-Write-Disable/20250528-163253
base:   176e917e010cb7dcc605f11d2bc33f304292482b
patch link:    https://lore.kernel.org/r/20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918%40canonical.com
patch subject: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write Disable
config: loongarch-randconfig-001-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290728.VsNgBfDO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290728.VsNgBfDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290728.VsNgBfDO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-i801.c: In function 'i801_notifier_call':
>> drivers/i2c/busses/i2c-i801.c:1304:9: error: implicit declaration of function '__i801_register_spd' [-Wimplicit-function-declaration]
    1304 |         __i801_register_spd(priv);
         |         ^~~~~~~~~~~~~~~~~~~


vim +/__i801_register_spd +1304 drivers/i2c/busses/i2c-i801.c

  1291	
  1292	static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
  1293				      void *data)
  1294	{
  1295		struct i801_priv *priv = container_of(nb, struct i801_priv, mux_notifier_block);
  1296		struct device *dev = data;
  1297	
  1298		if (action != BUS_NOTIFY_ADD_DEVICE ||
  1299		    dev->type != &i2c_adapter_type ||
  1300		    i2c_root_adapter(dev) != &priv->adapter)
  1301			return NOTIFY_DONE;
  1302	
  1303		/* Call i2c_register_spd for muxed child segments */
> 1304		__i801_register_spd(priv);
  1305	
  1306		return NOTIFY_OK;
  1307	}
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
