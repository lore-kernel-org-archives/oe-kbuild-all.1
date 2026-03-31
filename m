Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294436EA88
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934959; cv=none; b=U7EmEkb8J1Gs3I8jx2eaGLdp0A6R7iOVCxRnSoQW6u95l2smvGaxAIoJmfypFA9F6C+Yc71zuggpOfnNW7UIuceR253kdTp3YaKyZ2a/AI8tHj1+InNAs4nWj2VHPIe4S55l0W/Wl2I9z7xhWkW1NQ1M2mVU5xcdWXRW29iH7tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934959; c=relaxed/simple;
	bh=o1Bk7rs5EZIf2qz8ktfdQWe5awGZBRbBKlEegLMxjCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X///xzxuI3hucPp6vQEFJD/GPAG2AsSAwSW4ZUMy+JN1VojNRTURkv5R30DP3FVKuO2SANPOncE7f7eDG53c5eBkojDSU1yAL+ZpeF0XNXI+43dIK422ng5Zm2Ot3bQsZznxthyMmBRlsKS2rPpEyC4uIESe2zFU5MGWg3ywlgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFmuju9V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFmuju9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774934957; x=1806470957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o1Bk7rs5EZIf2qz8ktfdQWe5awGZBRbBKlEegLMxjCE=;
  b=LFmuju9VQuMhilQCH1rWSVBuW7oO07NEWq8/E0zRS14qp/bKY+8eG8aA
   JMNuTOAVuIxc/5WjPgtihpKrSFejKW4CLnRdFnJqKD7gYPhXLzVXWBk7h
   tOH2sQXtD+aHVDdUTE6/ICMYvlZf/hMrwY17wkrppgYJE29AYvrqYijUI
   e9KltdDENBYjR1Ji5zK7R+FrJFM6w44dZxPAORD5ui3SbCnZNl9a1+yF0
   R9DG8tC9O1oyfqgG7Mse/71q8ATXU+JJLmLYy0UJJVooUGcrJ2Q4HH+JL
   Y8jYwk18NpTZDFwnT/6b6lwR2Ob+n+bf9RAhfwYY1VJrd6lsDoZUYZ541
   g==;
X-CSE-ConnectionGUID: Q9ma2n/5Rxiq8c55g8BCfQ==
X-CSE-MsgGUID: 3IQviGzXQROniQ/2igHkYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86631290"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86631290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:29:17 -0700
X-CSE-ConnectionGUID: NR39ryqhReeLtYQ36YL0fg==
X-CSE-MsgGUID: BdXPiGJIS7eHxwvNOKEhLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="264191701"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Mar 2026 22:29:13 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Rf3-000000002Gv-2FGq;
	Tue, 31 Mar 2026 05:29:09 +0000
Date: Tue, 31 Mar 2026 13:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Marek Vasut <marex@denx.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 02/12] drm/bridge: tc358762: Improce SYSCTRL register
 defines
Message-ID: <202603311306.2ez4eHxU-lkp@intel.com>
References: <20260327-tc358762-fixes-v2-2-3589d3c45f4a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-tc358762-fixes-v2-2-3589d3c45f4a@ideasonboard.com>

Hi Tomi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-bridge-tc358762-Clean-up-register-defines/20260328-164947
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260327-tc358762-fixes-v2-2-3589d3c45f4a%40ideasonboard.com
patch subject: [PATCH v2 02/12] drm/bridge: tc358762: Improce SYSCTRL register defines
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603311306.2ez4eHxU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311306.2ez4eHxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311306.2ez4eHxU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/tc358762.c: In function 'tc358762_init':
>> drivers/gpu/drm/bridge/tc358762.c:154:24: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     154 |                        FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
         |                        ^~~~~~~~~~


vim +/FIELD_PREP +154 drivers/gpu/drm/bridge/tc358762.c

   127	
   128	static int tc358762_init(struct tc358762 *ctx)
   129	{
   130		u32 lcdctrl;
   131	
   132		tc358762_write(ctx, DSI_LANEENABLE,
   133			       DSI_LANEENABLE_L0EN | DSI_LANEENABLE_CLEN);
   134		tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
   135		tc358762_write(ctx, PPI_D1S_CLRSIPOCOUNT, 5);
   136		tc358762_write(ctx, PPI_D0S_ATMR, 0);
   137		tc358762_write(ctx, PPI_D1S_ATMR, 0);
   138		tc358762_write(ctx, PPI_LPTXTIMECNT, LPX_PERIOD);
   139	
   140		tc358762_write(ctx, SPICMR, 0x00);
   141	
   142		lcdctrl = LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
   143			  LCDCTRL_UNK6 | LCDCTRL_VTGEN;
   144	
   145		if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
   146			lcdctrl |= LCDCTRL_HSPOL;
   147	
   148		if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
   149			lcdctrl |= LCDCTRL_VSPOL;
   150	
   151		tc358762_write(ctx, LCDCTRL, lcdctrl);
   152	
   153		tc358762_write(ctx, SYSCTRL,
 > 154			       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
   155			       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
   156			       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
   157	
   158		msleep(100);
   159	
   160		tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
   161		tc358762_write(ctx, DSI_STARTDSI, DSI_STARTDSI_STARTDSI);
   162	
   163		msleep(100);
   164	
   165		return tc358762_clear_error(ctx);
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
