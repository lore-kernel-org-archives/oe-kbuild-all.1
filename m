Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABF81B6CEF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022753; cv=none; b=o6sNR8Fja6C0xK6qjl9l2W6jwG3JkEFkVlo+MZReXnPQB2KEqxLhLOUzdlcb0H25MpPQUkDAa5dvb/0AQ2guUADb6l0YWPiZe8qiudclJTylgpJd05xzG9bXsgz4+O7MOtSoOH2W/uneRFi+NW3QJBCzfiUwJXKprWoYkyoa6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022753; c=relaxed/simple;
	bh=dX1g8jSzU+VXezh2f98dU2JeKi1rg/GRDajYDlMn9PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/WyIbcbNHaT8oVCzPeMqV0QV1uNdX4x9YDea5VPmHn0Ul6sh4fmleDXpX91DtZbHgUWb+HrHevJ9ufYuBkjJZzY0+dLqB6InjVSr691y1nX40j6EdnzOkEpCos1G3dnz2Ox9VGmTGs13pk+3jyb6O4sys3PM1ER+C2aUh7pXkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvppcI9V; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvppcI9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729022752; x=1760558752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dX1g8jSzU+VXezh2f98dU2JeKi1rg/GRDajYDlMn9PA=;
  b=AvppcI9VCI+6ZNsxOmhnG2LshdDcx1VapiAdQC5YdiUr1PWGB3gJxJFr
   Xb5AUkP0pRbGJimZICe0svgb4SOJmPq4EqzV1gFJSyZF8rpDMjjzkm8U/
   brgE6DqFcphnZ24CsnJoMmiPcSeYaf1roMyRBEG7JlpB4hFSr4LVV3KJi
   jxk1KdY6L2xpjBm2ACdJD+Nrj19ngepc0B8a6smIxN3ZHfgtzq0kqYQDz
   04AkJwvQGkaETQsQx9sJqmeD2Sd15H26wkUhhkGL8w4S+j9Pr86FyekVP
   XEt9MV/GpHs/a8wT9f0w3ksHmSmGv1WQnjKmzUbewq2YEwB/cz77bmCdP
   g==;
X-CSE-ConnectionGUID: fDBOk0ZNSTmWjXlCwz5tTg==
X-CSE-MsgGUID: omhZBvvbRsesgQXhxjfhJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28230124"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28230124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 13:05:52 -0700
X-CSE-ConnectionGUID: 1C/qME2AT76iW7Hx1up+UA==
X-CSE-MsgGUID: bI9P401BTACr5r2atWDXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78834721"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2024 13:05:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0nnd-000JsT-2V;
	Tue, 15 Oct 2024 20:05:45 +0000
Date: Wed, 16 Oct 2024 04:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	John Ogness <john.ogness@linutronix.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	bluescreen_avenger@verizon.net,
	Caleb Connolly <caleb.connolly@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 3/7] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202410160342.rkkekxWK-lkp@intel.com>
References: <20241011105526.615812-4-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011105526.615812-4-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 33c255312660653cf54f8019896b5dca28e3c580]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-client-squash-of-drm-client-pending-series/20241011-225715
base:   33c255312660653cf54f8019896b5dca28e3c580
patch link:    https://lore.kernel.org/r/20241011105526.615812-4-jfalempe%40redhat.com
patch subject: [PATCH v4 3/7] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410160342.rkkekxWK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160342.rkkekxWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160342.rkkekxWK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_log.c:347:6: error: redefinition of 'drm_log_register'
     347 | void drm_log_register(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_log.c:21:
   drivers/gpu/drm/drm_log.h:8:20: note: previous definition of 'drm_log_register' with type 'void(struct drm_device *)'
       8 | static inline void drm_log_register(struct drm_device *dev) {}
         |                    ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/drm_log_register +347 drivers/gpu/drm/drm_log.c

   342	
   343	/**
   344	 * drm_log_register() - Register a drm device to drm_log
   345	 * @dev: the drm device to register.
   346	 */
 > 347	void drm_log_register(struct drm_device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
