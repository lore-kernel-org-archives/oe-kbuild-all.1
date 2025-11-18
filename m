Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0340630FC2E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456287; cv=none; b=Lkdyok/Ei9EkODOQWEk5N1gEtHFs+7P3ZHU6NwWqSyPxfjxuYc6K4PX1I28Vw2hxyOWPksVpaocWjSMEVC/7XrJCsq+YexAW/FfLsR6bWAJzOtJbkZbQeWArPN72tFPLysC+BG3k7tnhqIIRmjSyQRRpo/wgjQxJ239XSjoDCbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456287; c=relaxed/simple;
	bh=2e3s67FJBQkKQctDjwsfZs3PlkxPX3KmBNoYaFFvDH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsSnK7AuIVYPUFpsVWI/wc7kwhuTjIwEk3kSkG8DibWF9HczO6bbB34jv3HydkWClFB93Tvr/m+DffwzVTg2/PSSr9v74RVS6L1SGqy1eN3UzkI5xOb16MV3BPEZUQ4AYBTP/4xQsCl00eq1vJlkRVsdP1xr6Wbhtxb+xjCoqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtSwINUX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtSwINUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763456286; x=1794992286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2e3s67FJBQkKQctDjwsfZs3PlkxPX3KmBNoYaFFvDH0=;
  b=BtSwINUXo/+cnHDNicul0JCPOa6rAHQJVPmmO8m+Skm27b0VqpbBOpB0
   zFGhPoafAB6L7rP6RP/QjAGq7RgXoqC+t8ru2b9+Xnxg8f5ga7tyDBysJ
   N63Jw7jYwKi3QQsDT4LhTUIlpwaLgMdMUoV/gKPJVkEmpQGsmtzpdopIz
   rVby7E97bA/c83jglfF6ZJhVG42qwjGCBV5yVKeRYANohWxVTodijFgkW
   ylQybXxBarzqR5KQbvcpv7klDW3Vb00pEOo5nIqfRzNNSSOnFs8pkxzJR
   fdqZIP1x4IqoqsoKKIcit5HiqXCHJNlQUjojMsf2gwBt12NWA73OlKZE5
   Q==;
X-CSE-ConnectionGUID: 41NcVnsUQaiDnKWMVAPiFg==
X-CSE-MsgGUID: 0er5EwD7SGuu2WVap0gNuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65353253"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65353253"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:58:05 -0800
X-CSE-ConnectionGUID: ggqtB+rsTNi0urkZLt529Q==
X-CSE-MsgGUID: /nnLGuh2SvudOePaDGdeDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="189964566"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2025 00:58:03 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLHXE-0001WN-16;
	Tue, 18 Nov 2025 08:58:00 +0000
Date: Tue, 18 Nov 2025 16:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: 429368636@qq.com, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pavel@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org, zhangxinyu <gavin.zhang@faiot.com>
Subject: Re: [PATCH] leds: add aw91xxx driver
Message-ID: <202511181607.3hTCfucu-lkp@intel.com>
References: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.18-rc6 next-20251118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/429368636-qq-com/leds-add-aw91xxx-driver/20251117-175335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908%40qq.com
patch subject: [PATCH] leds: add aw91xxx driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251118/202511181607.3hTCfucu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181607.3hTCfucu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181607.3hTCfucu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-aw91xxx.c: In function 'blink_store':
>> drivers/leds/leds-aw91xxx.c:653:30: warning: format '%x' expects a matching 'unsigned int *' argument [-Wformat=]
     653 |         if (sscanf(buf, "%x %x", &databuf[0]) == 1)
         |                             ~^
         |                              |
         |                              unsigned int *
   drivers/leds/leds-aw91xxx.c: At top level:
>> drivers/leds/leds-aw91xxx.c:1309:13: warning: no previous prototype for 'aw91xxx_irq_func' [-Wmissing-prototypes]
    1309 | irqreturn_t aw91xxx_irq_func(int irq, void *key_data)
         |             ^~~~~~~~~~~~~~~~
>> drivers/leds/leds-aw91xxx.c:1395:6: warning: no previous prototype for 'aw91xxx_int_work' [-Wmissing-prototypes]
    1395 | void aw91xxx_int_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~
   drivers/leds/leds-aw91xxx.c: In function 'aw91xxx_key_work':
>> drivers/leds/leds-aw91xxx.c:1425:13: warning: variable 'key_num' set but not used [-Wunused-but-set-variable]
    1425 |         int key_num = 0;
         |             ^~~~~~~


vim +653 drivers/leds/leds-aw91xxx.c

   645	
   646	static ssize_t
   647	blink_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t len)
   648	{
   649		unsigned int databuf[2];
   650		struct led_classdev *led_cdev = dev_get_drvdata(dev);
   651		struct aw91xxx *aw91xxx = container_of(led_cdev, struct aw91xxx, cdev);
   652	
 > 653		if (sscanf(buf, "%x %x", &databuf[0]) == 1)
   654			aw91xxx_led_blink(aw91xxx, databuf[0], 3);
   655	
   656		return len;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
