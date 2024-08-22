Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4561CE70F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724347948; cv=none; b=lEG1rYwVvd32KJZa0OBsV3eZBPQ6xL1/5LOGBE881OHCGQFCAMF4BtstPBnZxY1qH1Ktu3umEvBJDCWZsCEiGI19Trmi1U1EreLKNW4lDDZbJU/77IeNZ7VDlV/1RTd1rbgzzCqqpJn2JAnJFlAY3aBWbSkUAd5lSftjTnD0rDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724347948; c=relaxed/simple;
	bh=OhUEH9zgrRVPg958wpMBNnOtHPbqOuVwH3ye3OCamBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qljr5n+++Ogd++mXy/72Cmrh03cdWeYDDrIgr1WzCU7aEvcBMLGLgGeFfOxVUSZC7g8HzbH12QZJWTMiqmbClklDG0EEzmW4ngaKojlQiWQRKyN1fHPV8x+RD42TZx36fsXWfqGDqsAQmI9vdFSB+CG6bnKGVQwh7mHb+uXvOr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbYdjf+6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbYdjf+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724347946; x=1755883946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OhUEH9zgrRVPg958wpMBNnOtHPbqOuVwH3ye3OCamBM=;
  b=HbYdjf+6/JVS4BHqu/rf2wL5ehvKqacASzhJPJb0wzcsxyGOn4+qwqiv
   SERxYezRGKOQP86EeIVVK/Cb9jLeMfvteuAR0ftT9kFcrZtIFRF39UKnb
   /o6V2P11Aa6KtxPiNmJM5Ip9syOHpFfDyqcoznGaQ9vJWqjxLF6CMNhNV
   7SyfYO2gWh6+Yzj2u6hCDRIb1a/hnMlhpOif/XgH5rVn3D2xprUHF1o9j
   RQ2gwGHL9cT4ZlXshC75MJWtnCMOybi+UKtbbQA1cZ2ZW/DTF1OFyfKh9
   iLSw+BgACTw8A33XJMS8JWvAkbjEsgr//VBTm2WTzzSlZTo1j/voaVTMb
   Q==;
X-CSE-ConnectionGUID: wqZkKwz5TWeZwdR3YgJy2g==
X-CSE-MsgGUID: MHxE0pH0TO2+I3PDoJ2xsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22595766"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22595766"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:32:24 -0700
X-CSE-ConnectionGUID: WkfekJqyTHmDB80ZVVu+VQ==
X-CSE-MsgGUID: aBGWHaQ2QceKzE+ddpza8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61552882"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2024 10:32:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shBfZ-000D2N-0b;
	Thu, 22 Aug 2024 17:32:21 +0000
Date: Fri, 23 Aug 2024 01:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/3] i2c: Remove obsolete members of i2c_adapter and
 i2c_client
Message-ID: <202408230156.SZSDmCCc-lkp@intel.com>
References: <01cef629-5650-4ef2-93db-9a16893ff5a0@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01cef629-5650-4ef2-93db-9a16893ff5a0@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/i2c-Replace-list-based-mechanism-for-handling-auto-detected-clients/20240822-044950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/01cef629-5650-4ef2-93db-9a16893ff5a0%40gmail.com
patch subject: [PATCH 3/3] i2c: Remove obsolete members of i2c_adapter and i2c_client
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240823/202408230156.SZSDmCCc-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230156.SZSDmCCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230156.SZSDmCCc-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/ppc/keywest.c: In function 'keywest_attach_adapter':
>> sound/ppc/keywest.c:68:43: error: 'struct i2c_client' has no member named 'detected'
      68 |         list_add_tail(&keywest_ctx->client->detected,
         |                                           ^~
   sound/ppc/keywest.c:69:70: error: 'struct i2c_driver' has no member named 'clients'
      69 |                       &to_i2c_driver(keywest_ctx->client->dev.driver)->clients);
         |                                                                      ^~


vim +68 sound/ppc/keywest.c

5de4155bb3760fc Jean Delvare       2009-04-20  28  
5de4155bb3760fc Jean Delvare       2009-04-20  29  /*
5de4155bb3760fc Jean Delvare       2009-04-20  30   * This is kind of a hack, best would be to turn powermac to fixed i2c
5de4155bb3760fc Jean Delvare       2009-04-20  31   * bus numbers and declare the sound device as part of platform
5de4155bb3760fc Jean Delvare       2009-04-20  32   * initialization
5de4155bb3760fc Jean Delvare       2009-04-20  33   */
^1da177e4c3f415 Linus Torvalds     2005-04-16  34  static int keywest_attach_adapter(struct i2c_adapter *adapter)
^1da177e4c3f415 Linus Torvalds     2005-04-16  35  {
5de4155bb3760fc Jean Delvare       2009-04-20  36  	struct i2c_board_info info;
04a9af2e0384234 Wolfram Sang       2020-03-26  37  	struct i2c_client *client;
^1da177e4c3f415 Linus Torvalds     2005-04-16  38  
^1da177e4c3f415 Linus Torvalds     2005-04-16  39  	if (! keywest_ctx)
^1da177e4c3f415 Linus Torvalds     2005-04-16  40  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds     2005-04-16  41  
903dba1eae49270 Jean Delvare       2009-05-14  42  	if (strncmp(adapter->name, "mac-io", 6))
ac397c80de89509 Wolfram Sang       2015-05-09  43  		return -EINVAL; /* ignored */
^1da177e4c3f415 Linus Torvalds     2005-04-16  44  
5de4155bb3760fc Jean Delvare       2009-04-20  45  	memset(&info, 0, sizeof(struct i2c_board_info));
75b1a8f9d62e50f Joe Perches        2021-01-04  46  	strscpy(info.type, "keywest", I2C_NAME_SIZE);
5de4155bb3760fc Jean Delvare       2009-04-20  47  	info.addr = keywest_ctx->addr;
04a9af2e0384234 Wolfram Sang       2020-03-26  48  	client = i2c_new_client_device(adapter, &info);
04a9af2e0384234 Wolfram Sang       2020-03-26  49  	if (IS_ERR(client))
04a9af2e0384234 Wolfram Sang       2020-03-26  50  		return PTR_ERR(client);
04a9af2e0384234 Wolfram Sang       2020-03-26  51  	keywest_ctx->client = client;
04a9af2e0384234 Wolfram Sang       2020-03-26  52  
18c4078489fe064 Takashi Iwai       2009-10-01  53  	/*
18c4078489fe064 Takashi Iwai       2009-10-01  54  	 * We know the driver is already loaded, so the device should be
18c4078489fe064 Takashi Iwai       2009-10-01  55  	 * already bound. If not it means binding failed, and then there
18c4078489fe064 Takashi Iwai       2009-10-01  56  	 * is no point in keeping the device instantiated.
18c4078489fe064 Takashi Iwai       2009-10-01  57  	 */
a7cde6d25c494e1 Lars-Peter Clausen 2013-09-29  58  	if (!keywest_ctx->client->dev.driver) {
18c4078489fe064 Takashi Iwai       2009-10-01  59  		i2c_unregister_device(keywest_ctx->client);
18c4078489fe064 Takashi Iwai       2009-10-01  60  		keywest_ctx->client = NULL;
18c4078489fe064 Takashi Iwai       2009-10-01  61  		return -ENODEV;
18c4078489fe064 Takashi Iwai       2009-10-01  62  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  63  	
5de4155bb3760fc Jean Delvare       2009-04-20  64  	/*
5de4155bb3760fc Jean Delvare       2009-04-20  65  	 * Let i2c-core delete that device on driver removal.
5de4155bb3760fc Jean Delvare       2009-04-20  66  	 * This is safe because i2c-core holds the core_lock mutex for us.
5de4155bb3760fc Jean Delvare       2009-04-20  67  	 */
5de4155bb3760fc Jean Delvare       2009-04-20 @68  	list_add_tail(&keywest_ctx->client->detected,
a7cde6d25c494e1 Lars-Peter Clausen 2013-09-29  69  		      &to_i2c_driver(keywest_ctx->client->dev.driver)->clients);
^1da177e4c3f415 Linus Torvalds     2005-04-16  70  	return 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  71  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
