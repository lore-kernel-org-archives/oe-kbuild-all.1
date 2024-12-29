Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE6812B93
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735450075; cv=none; b=Hni2r89Y+Z9dSu5jJwMu2JJo/JvwTDALM1FknHHU6Y1dEuLNJtP3TtK/rrilB8WbUzqjR+u/e98ByGnRFfYfTFY+5oQyq4lgqdbxgPvegyyAxUxx/+WFawPPz5sCyd/IBEdjFDgRSochDUpzUXWh+Cq9PafKnE8/L9q8PntZemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735450075; c=relaxed/simple;
	bh=Jh5ipIBPQAnl9s5+TGdNZn4lZGJjbSNiszL5tZRSgmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iv+HtbxaUh/ynqzBMomduHSZ7izmHXSYmQLFgYNZDrbOwnE6VuQn4OAzxGgNRAfey0iBfxb9XGpyovTdynQOR9sKh9mvKzrA89Ffm0RgaZw2+SSh+a5kTpBwBtcml/XZQa8DTE6UCY8yb6IPzL2ZZCKTbHGEq6dkhDoKcEiFRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GW7/nYUF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GW7/nYUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735450072; x=1766986072;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Jh5ipIBPQAnl9s5+TGdNZn4lZGJjbSNiszL5tZRSgmw=;
  b=GW7/nYUFvwKCX8azTDMbVM8KwN1XkB7XPqg+eMjKPXRvu9pQc+bhmu1I
   +S/NyfQEjuXMvq2H17ueIU3bCOcnu1+GXQM49/ADsbbcjE5A84FqAJ6UB
   IKDdCn8KXx+nnLiEqt620yNCiWNVisFJDVf1aqK3I+HdTVwdautVFK9Tq
   Cb99qX7RjxwcbrpOfxGYkJlELYOB+xPL4/OeAt9+CYrJyZI8bwbDgi56K
   SeAODiCxC/C+wVhIo4CpMiLkxAtPQtnlixnPUnQTjsmHbnwC6OmBY+W38
   +pyBpNe2l6DOB8uLZS/yEr6w3L7eQmseZYPLRygDqHZqWA5hfnUBIPTQH
   g==;
X-CSE-ConnectionGUID: yKyz6AEPTlueRSnvVThRJw==
X-CSE-MsgGUID: gQTPEBjMQuKs8FbezF8SXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46361769"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46361769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 21:27:51 -0800
X-CSE-ConnectionGUID: ungSMa+iSymMGQIopEiY9g==
X-CSE-MsgGUID: gMfECx6JT52EyRfHnzfguw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100329158"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Dec 2024 21:27:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRlq7-0004Ug-2f;
	Sun, 29 Dec 2024 05:27:47 +0000
Date: Sun, 29 Dec 2024 13:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel <pavel@ucw.cz>
Subject: drivers/leds/leds-lm3692x.c:119: warning: Function parameter or
 struct member 'boost_ctrl' not described in 'lm3692x_led'
Message-ID: <202412291351.Stu5nPDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Guido,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: cffd61a5c7755546154539dcd7f36590e91e002f leds: lm3692x: Allow to configure over voltage protection
date:   5 years ago
config: sparc-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241229/202412291351.Stu5nPDv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291351.Stu5nPDv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291351.Stu5nPDv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'lock' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'client' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'led_dev' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'regmap' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'enable_gpio' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'regulator' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'led_enable' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'model_id' not described in 'lm3692x_led'
>> drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'boost_ctrl' not described in 'lm3692x_led'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]


vim +119 drivers/leds/leds-lm3692x.c

9699cb6bbef273 Dan Murphy    2017-12-12   96  
9699cb6bbef273 Dan Murphy    2017-12-12   97  /**
9699cb6bbef273 Dan Murphy    2017-12-12   98   * struct lm3692x_led -
9699cb6bbef273 Dan Murphy    2017-12-12   99   * @lock - Lock for reading/writing the device
9699cb6bbef273 Dan Murphy    2017-12-12  100   * @client - Pointer to the I2C client
9699cb6bbef273 Dan Murphy    2017-12-12  101   * @led_dev - LED class device pointer
9699cb6bbef273 Dan Murphy    2017-12-12  102   * @regmap - Devices register map
9699cb6bbef273 Dan Murphy    2017-12-12  103   * @enable_gpio - VDDIO/EN gpio to enable communication interface
9699cb6bbef273 Dan Murphy    2017-12-12  104   * @regulator - LED supply regulator pointer
07abd4325e7013 Dan Murphy    2018-07-02  105   * @led_enable - LED sync to be enabled
07abd4325e7013 Dan Murphy    2018-07-02  106   * @model_id - Current device model ID enumerated
9699cb6bbef273 Dan Murphy    2017-12-12  107   */
9699cb6bbef273 Dan Murphy    2017-12-12  108  struct lm3692x_led {
9699cb6bbef273 Dan Murphy    2017-12-12  109  	struct mutex lock;
9699cb6bbef273 Dan Murphy    2017-12-12  110  	struct i2c_client *client;
9699cb6bbef273 Dan Murphy    2017-12-12  111  	struct led_classdev led_dev;
9699cb6bbef273 Dan Murphy    2017-12-12  112  	struct regmap *regmap;
9699cb6bbef273 Dan Murphy    2017-12-12  113  	struct gpio_desc *enable_gpio;
9699cb6bbef273 Dan Murphy    2017-12-12  114  	struct regulator *regulator;
07abd4325e7013 Dan Murphy    2018-07-02  115  	int led_enable;
07abd4325e7013 Dan Murphy    2018-07-02  116  	int model_id;
cffd61a5c77555 Guido Günther 2020-01-04  117  
cffd61a5c77555 Guido Günther 2020-01-04  118  	u8 boost_ctrl;
9699cb6bbef273 Dan Murphy    2017-12-12 @119  };
9699cb6bbef273 Dan Murphy    2017-12-12  120  

:::::: The code at line 119 was first introduced by commit
:::::: 9699cb6bbef273d7be25441bfc20a2db9ee0f509 leds: lm3692x: Introduce LM3692x dual string driver

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
