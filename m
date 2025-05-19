Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983FA2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 04:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747629360; cv=none; b=F3om68g2DjsmnltSX4kr7o7XwfDAyo93p0sO+zEbU87pQatBKfJEVhsf0sZif5WWipV31fRmm0JnZfi6T8w7AXmKVp5ZlO3kQB/DuSa+iXJh32l7hmY6lP6XKIbnlo/6evV2Dm01inrstGwHWD73j9r7ZNEoCZJDQU4g9dNc1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747629360; c=relaxed/simple;
	bh=9lOOQsJSwnkg1xiALe8BARNLy0cJvTLDBKHqrfhbkn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eAvZsP1WHapqLPhMZvg/Bu50ej6uD+1ATJGl1q8Ci6o7WxcM1/T7Rj5kFiGrRUH+t5QsVovjJHLEd+66SEI5so9wW7Iu4PCbYG4nhn8nOyBZPhb5R9H8Jb/n3fAM/eTWWaRcgXxxHstjQ0UU3JE/S2aoFbuhN3jKBhFgbr106P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zb+bvtht; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zb+bvtht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747629357; x=1779165357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9lOOQsJSwnkg1xiALe8BARNLy0cJvTLDBKHqrfhbkn0=;
  b=Zb+bvthtFbKeF6OnAXx+St+H2d5llvE+RiUZGkxB+fc5LI/7Nw8GuEqU
   xlu7/zaOMNZBLgXhfVZ2DaTfwARB9CxDi9pPeI7SNDuwTU8vDTzv+AICa
   ya1uaJeES9xvYGZ2fa0MCK8BACRUvPLvdI95SprrU2lnxZQPtu0+coVor
   9Eomcilg6Zppcd+ZHmcCyi1kZFU+OQGZDb5NP7XViOcZDaLkKoueq5kQE
   XcB6HAKKleqoIQF3fqOVOWrpcHXLYV3Kv9Smizjl89oB7tSIs//N7JcFB
   DjeFiGaOi2K8P8CYj4JOxvCyS+FRCWkp72xY+zfsfj0qxiJVfSW8kuEJf
   w==;
X-CSE-ConnectionGUID: bngE/yr9RL+qZ68yfikTdA==
X-CSE-MsgGUID: hNGlpfsgQ9Od1MMD8NLldQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60151179"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60151179"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 21:35:57 -0700
X-CSE-ConnectionGUID: OcsPW0VZStWP/4bVFDnsZA==
X-CSE-MsgGUID: uYJzQNSxRgW0tj66U0BAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="176366772"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2025 21:35:55 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGsED-0000ml-1r;
	Mon, 19 May 2025 04:35:53 +0000
Date: Mon, 19 May 2025 12:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw 14/23] drivers/mfd/adp5585.c:299:13: error:
 implicit declaration of function 'FIELD_GET'
Message-ID: <202505191217.Sx6cVH9M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw
head:   af6389bf492da2aa423e604133e69a1c14f37292
commit: e2bfa673d98c47a1f082a922b86021a351f1c1a2 [14/23] mfd: adp5585: add support for event handling
config: alpha-randconfig-2002-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191217.Sx6cVH9M-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191217.Sx6cVH9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191217.Sx6cVH9M-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/adp5585.c: In function 'adp5585_report_events':
>> drivers/mfd/adp5585.c:299:13: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      key_val = FIELD_GET(ADP5585_KEY_EVENT_MASK, key);
                ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +299 drivers/mfd/adp5585.c

   278	
   279	static void adp5585_report_events(struct adp5585_dev *adp5585, int ev_cnt)
   280	{
   281		struct adp5585_ev_handler *h;
   282		unsigned int i;
   283	
   284		guard(mutex)(&adp5585->ev_lock);
   285	
   286		if (list_empty(&adp5585->ev_handlers)) {
   287			dev_warn_ratelimited(adp5585->dev, "No event handlers registered\n");
   288			return;
   289		}
   290	
   291		for (i = 0; i < ev_cnt; i++) {
   292			unsigned int key, key_val, key_press;
   293			int ret;
   294	
   295			ret = regmap_read(adp5585->regmap, ADP5585_FIFO_1 + i, &key);
   296			if (ret)
   297				return;
   298	
 > 299			key_val = FIELD_GET(ADP5585_KEY_EVENT_MASK, key);
   300			key_press = FIELD_GET(ADP5585_KEV_EV_PRESS_MASK, key);
   301	
   302			list_for_each_entry(h, &adp5585->ev_handlers, entry) {
   303				ret = h->handler(h->dev, key_val, key_press);
   304				if (!ret)
   305					/* handled! */
   306					break;
   307			}
   308		}
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
