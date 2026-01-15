Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254921A95D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488973; cv=none; b=Rt57BYX9krNXbxAXR9uKRMYLSObiGfo3riZwB64d7M6+D7rNR0KtKA+vhjIbt4/OMi4Dl/6BOo91MwWqyVcoy899zqHpmMlz0apco+n+fJP7p5FuZ9SrZ/k8CEPWeHH4U9VOWSBPFMleGMp+4KS4yWDQChm8NckNKpHCeTWI+fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488973; c=relaxed/simple;
	bh=Pe2/iAohMzZznQrtzJojtQJPyDdAMsJQ2yITlPYfu74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwQb6FXwMB6NCkrmDMKuXtM+gFMbZboJWRD6tJCOWOfGspHImxWHv3P7MfMvBwyHVpsMseBW4EFS1EV8nWPmfb3BS6G0Xz/zDFFWT4WmO8QeZMeP6nhzaont30REasCovSxfieuCg14nlNqnsPTwH4nsHmMLOBu362OhbHTdRio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzeamNBU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzeamNBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768488972; x=1800024972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pe2/iAohMzZznQrtzJojtQJPyDdAMsJQ2yITlPYfu74=;
  b=HzeamNBUtIXLIlJxsVJjN6IVx/L8tmAddM6ZT6Biqmhe+IHj9Z932NMi
   N51+lskp6Up/ShV7lbCImz5ufCkpOqGOH3zMg21sUUTWbrEDRB/dyAaPE
   GS5JnApqln1OyIqS0zUsOuIWEs57Dd5zwlxO9tB5RJiQ7orkfCWF0eRCd
   1Ccq/4dhc5XIKwmCZHzcmkfIwwZ1Zbj+AJEEaxplfir3ENrX5BigWT1cJ
   M1PKz/jZw+wXEySAtq74ofTg3JI+YeoQiuU8IDoD7EikIIJYS+BYRRtTn
   euV4jiMtiljU6Y8DnlFdzQ1HE+U8PNT8sgofUjdKzrmcyCknnsC0UPCas
   Q==;
X-CSE-ConnectionGUID: f7JOp4s6QmGtMokJ6yp67A==
X-CSE-MsgGUID: nyc/nnK8RUiebGeZFsSUFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69851170"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69851170"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:56:11 -0800
X-CSE-ConnectionGUID: /znF7UiUTVe+JfIQwBcHow==
X-CSE-MsgGUID: bAmqZBU9SG+4oKc5s8QT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="210026606"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2026 06:56:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgOlb-00000000I6K-3Hvj;
	Thu, 15 Jan 2026 14:56:07 +0000
Date: Thu, 15 Jan 2026 22:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 7/7] net: wwan: hwsim: support NMEA port emulation
Message-ID: <202601152253.zyvd4WRp-lkp@intel.com>
References: <20260109010909.4216-8-ryazanov.s.a@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109010909.4216-8-ryazanov.s.a@gmail.com>

Hi Sergey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main net-next/main net/main linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergey-Ryazanov/net-wwan-core-remove-unused-port_id-field/20260109-091432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260109010909.4216-8-ryazanov.s.a%40gmail.com
patch subject: [RFC PATCH v5 7/7] net: wwan: hwsim: support NMEA port emulation
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260115/202601152253.zyvd4WRp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152253.zyvd4WRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152253.zyvd4WRp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wwan/wwan_hwsim.c: In function 'wwan_hwsim_nmea_emul_timer':
>> drivers/net/wwan/wwan_hwsim.c:239:40: error: implicit declaration of function 'from_timer'; did you mean 'mod_timer'? [-Wimplicit-function-declaration]
     239 |         struct wwan_hwsim_port *port = from_timer(port, t, nmea_emul.timer);
         |                                        ^~~~~~~~~~
         |                                        mod_timer
>> drivers/net/wwan/wwan_hwsim.c:239:60: error: 'nmea_emul' undeclared (first use in this function)
     239 |         struct wwan_hwsim_port *port = from_timer(port, t, nmea_emul.timer);
         |                                                            ^~~~~~~~~
   drivers/net/wwan/wwan_hwsim.c:239:60: note: each undeclared identifier is reported only once for each function it appears in


vim +239 drivers/net/wwan/wwan_hwsim.c

   233	
   234	static void wwan_hwsim_nmea_emul_timer(struct timer_list *t)
   235	{
   236		/* 43.74754722298909 N 11.25759835922875 E in DMM format */
   237		static const unsigned int coord[4 * 2] = { 43, 44, 8528, 0,
   238							   11, 15, 4559, 0 };
 > 239		struct wwan_hwsim_port *port = from_timer(port, t, nmea_emul.timer);
   240		struct sk_buff *skb;
   241		struct tm tm;
   242	
   243		time64_to_tm(ktime_get_real_seconds(), 0, &tm);
   244	
   245		mod_timer(&port->nmea_emul.timer, jiffies + HZ);	/* 1 second */
   246	
   247		skb = alloc_skb(NMEA_MAX_LEN * 2, GFP_KERNEL);	/* GGA + RMC */
   248		if (!skb)
   249			return;
   250	
   251		wwan_hwsim_nmea_skb_push_sentence(skb,
   252						  "$GPGGA,%02u%02u%02u.000,%02u%02u.%04u,%c,%03u%02u.%04u,%c,1,7,1.03,176.2,M,55.2,M,,",
   253						  tm.tm_hour, tm.tm_min, tm.tm_sec,
   254						  coord[0], coord[1], coord[2],
   255						  coord[3] ? 'S' : 'N',
   256						  coord[4], coord[5], coord[6],
   257						  coord[7] ? 'W' : 'E');
   258	
   259		wwan_hwsim_nmea_skb_push_sentence(skb,
   260						  "$GPRMC,%02u%02u%02u.000,A,%02u%02u.%04u,%c,%03u%02u.%04u,%c,0.02,31.66,%02u%02u%02u,,,A",
   261						  tm.tm_hour, tm.tm_min, tm.tm_sec,
   262						  coord[0], coord[1], coord[2],
   263						  coord[3] ? 'S' : 'N',
   264						  coord[4], coord[5], coord[6],
   265						  coord[7] ? 'W' : 'E',
   266						  tm.tm_mday, tm.tm_mon + 1,
   267						  (unsigned int)tm.tm_year - 100);
   268	
   269		wwan_port_rx(port->wwan, skb);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
