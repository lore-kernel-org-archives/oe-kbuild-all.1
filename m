Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510AA136351
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741553952; cv=none; b=ezJSLaZTqMUUh7xStoLNeiKE5pNO8UYWqygEMZmW9/rq0z/3EXc4GxK1bMcK8kQaTiRQai6GYhbY8mMVLY2tQGi5d/C1V4CNQFtNueVb0CvNa33A7+hWIIUtYTRsLCguoR1etk3Ec2Li0c+fNBEtXch47UutScbVqQ7zX09fIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741553952; c=relaxed/simple;
	bh=QMXTXf/7OKrhqygJJWwGGKtjUh1/chXVQQLfxIvJPS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHFIRltdRY87zFZI9hj9uA6DHRkEZwS+JqE3SYGb41qgXhLnumdx1/beX6XfYnRL0chmobWa0ETFlo16+yF8LPC6EjJA8RSmnWVsKNZfs2y0uRhg55Ure/FC1PfJNyUlEAQZJORBUZ3g8umBrAywkyPNQG9spEIr9P1R10uj22s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/+cBNdj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/+cBNdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741553950; x=1773089950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QMXTXf/7OKrhqygJJWwGGKtjUh1/chXVQQLfxIvJPS0=;
  b=a/+cBNdjrs7qOZ8rBlRRI2gTHq8WVuBsp+l9cBmQ90Yk85frlbIT2xQK
   XRTURs2GAtbJ9cAgbuCem15McxgmWxO7RpjFFd4TY2OVhQj77mkMi6MWJ
   SZ9G1MV9gsAYCOBZl9FihnzLa8PMUoS2JY+q3qvnECCMgAektRcq4KSid
   v+lxkb1bL61spDHOdnmv99chCIdC9J8Zhlf0JCXb8bYSed2LB4OrFLYZ1
   PHg0AU0bGSpo4/4XDylExOj9hXB2/5utrWPBpoNKBsSfvZhNgvqWmjsQR
   cAWSrzxh6IjKjDzrvawOASQnlyPAQfAfmSH3tg49wzOimMn9HkosEbI0e
   A==;
X-CSE-ConnectionGUID: VCiAS68pTmq7FQAj9++Jdg==
X-CSE-MsgGUID: XiOExFZGQc+Nsm38B4WCnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="67904811"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="67904811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 13:59:07 -0700
X-CSE-ConnectionGUID: D4/mEpKYQAS2YbykMQDsvA==
X-CSE-MsgGUID: yb/4xIY7RHu8OMHIL7f6+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="120527788"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Mar 2025 13:59:06 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trNjk-0003SU-03;
	Sun, 09 Mar 2025 20:59:04 +0000
Date: Mon, 10 Mar 2025 04:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer
 and deserializer drivers
Message-ID: <202503100452.ao5ysWtI-lkp@intel.com>
References: <20250309084814.3114794-13-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-13-demonsingur@gmail.com>

Hi Cosmin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/dt-bindings-media-i2c-max96717-add-myself-as-maintainer/20250309-165419
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250309084814.3114794-13-demonsingur%40gmail.com
patch subject: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
config: x86_64-buildonly-randconfig-006-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100452.ao5ysWtI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100452.ao5ysWtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100452.ao5ysWtI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/maxim-serdes/max_des.c:991:10: error: 'const struct i2c_atr_ops' has no member named 'attach_addr'
     991 |         .attach_addr = max_des_ser_atr_attach_addr,
         |          ^~~~~~~~~~~
>> drivers/media/i2c/maxim-serdes/max_des.c:991:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     991 |         .attach_addr = max_des_ser_atr_attach_addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:991:24: note: (near initialization for 'max_des_i2c_atr_ops')
>> drivers/media/i2c/maxim-serdes/max_des.c:991:24: error: invalid initializer
   drivers/media/i2c/maxim-serdes/max_des.c:991:24: note: (near initialization for 'max_des_i2c_atr_ops.<anonymous>')
   drivers/media/i2c/maxim-serdes/max_des.c:992:10: error: 'const struct i2c_atr_ops' has no member named 'detach_addr'
     992 |         .detach_addr = max_des_ser_atr_detach_addr,
         |          ^~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:992:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     992 |         .detach_addr = max_des_ser_atr_detach_addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:992:24: note: (near initialization for 'max_des_i2c_atr_ops')
   drivers/media/i2c/maxim-serdes/max_des.c:992:24: error: initialization of 'int (*)(struct i2c_atr *, u32,  const struct i2c_client *, u16)' {aka 'int (*)(struct i2c_atr *, unsigned int,  const struct i2c_client *, short unsigned int)'} from incompatible pointer type 'void (*)(struct i2c_atr *, u32,  u16)' {aka 'void (*)(struct i2c_atr *, unsigned int,  short unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/i2c/maxim-serdes/max_des.c:992:24: note: (near initialization for 'max_des_i2c_atr_ops.attach_client')
   drivers/media/i2c/maxim-serdes/max_des.c: In function 'max_des_i2c_atr_init':
   drivers/media/i2c/maxim-serdes/max_des.c:1023:33: error: 'I2C_ATR_F_STATIC' undeclared (first use in this function)
    1023 |                                 I2C_ATR_F_STATIC | I2C_ATR_F_PASSTHROUGH);
         |                                 ^~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:1023:33: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/i2c/maxim-serdes/max_des.c:1023:52: error: 'I2C_ATR_F_PASSTHROUGH' undeclared (first use in this function)
    1023 |                                 I2C_ATR_F_STATIC | I2C_ATR_F_PASSTHROUGH);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:1021:21: error: too many arguments to function 'i2c_atr_new'
    1021 |         priv->atr = i2c_atr_new(priv->client->adapter, priv->dev,
         |                     ^~~~~~~~~~~
   In file included from drivers/media/i2c/maxim-serdes/max_des.c:9:
   include/linux/i2c-atr.h:53:17: note: declared here
      53 | struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
         |                 ^~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:1031:24: error: variable 'desc' has initializer but incomplete type
    1031 |                 struct i2c_atr_adap_desc desc = {
         |                        ^~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:1032:26: error: 'struct i2c_atr_adap_desc' has no member named 'chan_id'
    1032 |                         .chan_id = i,
         |                          ^~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:1032:36: warning: excess elements in struct initializer
    1032 |                         .chan_id = i,
         |                                    ^
   drivers/media/i2c/maxim-serdes/max_des.c:1032:36: note: (near initialization for 'desc')
   drivers/media/i2c/maxim-serdes/max_des.c:1031:42: error: storage size of 'desc' isn't known
    1031 |                 struct i2c_atr_adap_desc desc = {
         |                                          ^~~~
   drivers/media/i2c/maxim-serdes/max_des.c:1038:23: error: too few arguments to function 'i2c_atr_add_adapter'
    1038 |                 ret = i2c_atr_add_adapter(priv->atr, &desc);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/i2c-atr.h:88:5: note: declared here
      88 | int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_des.c:1031:42: warning: unused variable 'desc' [-Wunused-variable]
    1031 |                 struct i2c_atr_adap_desc desc = {
         |                                          ^~~~
   drivers/media/i2c/maxim-serdes/max_des.c: In function 'max_des_get_mbus_config':
   drivers/media/i2c/maxim-serdes/max_des.c:1367:12: error: 'struct v4l2_mbus_config' has no member named 'link_freq'
    1367 |         cfg->link_freq = phy->link_frequency;
         |            ^~
   cc1: some warnings being treated as errors
--
   drivers/media/i2c/maxim-serdes/max_ser.c:218:10: error: 'const struct i2c_atr_ops' has no member named 'attach_addr'
     218 |         .attach_addr = max_ser_i2c_atr_attach_addr,
         |          ^~~~~~~~~~~
>> drivers/media/i2c/maxim-serdes/max_ser.c:218:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     218 |         .attach_addr = max_ser_i2c_atr_attach_addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:218:24: note: (near initialization for 'max_ser_i2c_atr_ops')
>> drivers/media/i2c/maxim-serdes/max_ser.c:218:24: error: invalid initializer
   drivers/media/i2c/maxim-serdes/max_ser.c:218:24: note: (near initialization for 'max_ser_i2c_atr_ops.<anonymous>')
   drivers/media/i2c/maxim-serdes/max_ser.c:219:10: error: 'const struct i2c_atr_ops' has no member named 'detach_addr'
     219 |         .detach_addr = max_ser_i2c_atr_detach_addr,
         |          ^~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:219:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     219 |         .detach_addr = max_ser_i2c_atr_detach_addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:219:24: note: (near initialization for 'max_ser_i2c_atr_ops')
   drivers/media/i2c/maxim-serdes/max_ser.c:219:24: error: initialization of 'int (*)(struct i2c_atr *, u32,  const struct i2c_client *, u16)' {aka 'int (*)(struct i2c_atr *, unsigned int,  const struct i2c_client *, short unsigned int)'} from incompatible pointer type 'void (*)(struct i2c_atr *, u32,  u16)' {aka 'void (*)(struct i2c_atr *, unsigned int,  short unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/i2c/maxim-serdes/max_ser.c:219:24: note: (near initialization for 'max_ser_i2c_atr_ops.attach_client')
   drivers/media/i2c/maxim-serdes/max_ser.c: In function 'max_ser_i2c_atr_init':
   drivers/media/i2c/maxim-serdes/max_ser.c:232:16: error: variable 'desc' has initializer but incomplete type
     232 |         struct i2c_atr_adap_desc desc = {
         |                ^~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:233:18: error: 'struct i2c_atr_adap_desc' has no member named 'chan_id'
     233 |                 .chan_id = 0,
         |                  ^~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:233:28: warning: excess elements in struct initializer
     233 |                 .chan_id = 0,
         |                            ^
   drivers/media/i2c/maxim-serdes/max_ser.c:233:28: note: (near initialization for 'desc')
   drivers/media/i2c/maxim-serdes/max_ser.c:232:34: error: storage size of 'desc' isn't known
     232 |         struct i2c_atr_adap_desc desc = {
         |                                  ^~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:240:21: error: too many arguments to function 'i2c_atr_new'
     240 |         priv->atr = i2c_atr_new(priv->client->adapter, priv->dev,
         |                     ^~~~~~~~~~~
   In file included from drivers/media/i2c/maxim-serdes/max_ser.c:9:
   include/linux/i2c-atr.h:53:17: note: declared here
      53 | struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
         |                 ^~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:247:16: error: too few arguments to function 'i2c_atr_add_adapter'
     247 |         return i2c_atr_add_adapter(priv->atr, &desc);
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/i2c-atr.h:88:5: note: declared here
      88 | int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c:232:34: warning: unused variable 'desc' [-Wunused-variable]
     232 |         struct i2c_atr_adap_desc desc = {
         |                                  ^~~~
   drivers/media/i2c/maxim-serdes/max_ser.c: In function 'max_ser_change_address':
   drivers/media/i2c/maxim-serdes/max_ser.c:1577:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
    1577 |         val |= FIELD_PREP(MAX_SER_REG0_DEV_ADDR, new_addr);
         |                ^~~~~~~~~~
   drivers/media/i2c/maxim-serdes/max_ser.c: In function 'max_ser_i2c_atr_init':
   drivers/media/i2c/maxim-serdes/max_ser.c:248:1: warning: control reaches end of non-void function [-Wreturn-type]
     248 | }
         | ^
   cc1: some warnings being treated as errors


vim +991 drivers/media/i2c/maxim-serdes/max_des.c

   989	
   990	static const struct i2c_atr_ops max_des_i2c_atr_ops = {
 > 991		.attach_addr = max_des_ser_atr_attach_addr,
   992		.detach_addr = max_des_ser_atr_detach_addr,
   993	};
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
