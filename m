Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EEC39D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 05:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2rPxc1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696655875; x=1728191875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h8JjTkOjxy+GvvvrgGzYxXx8I+OrRY9nFul1gwrLQGU=;
  b=h2rPxc1XU39D0RZo7+IB7vzOpxgRzjb6Y+Cfv4h2rTzsHsn3uAyOr3Nt
   b/k3SS6lTDCi9a1h7Ry1Oqj5/M+PV+KlvCMqZckauHCQuJes7gTdtHCdV
   ofnrdeCLA5nlRmJObvrSFPZz3Rs+4atKGiyVTALdguItSPd9oTN8wkr8w
   zIYQurJUGld8XCAs523kI9Pj+8TWwnfVYqDg+IMvnFc6XkRo/VJ7h/rZq
   72Tggd6VWsnmYTuRrHK5YuSOjKcqn0j7OyhVIYDD8OKr1GlJJt/I4VrFf
   Aeb50smPsOWruIEyTTNTqrBsN1fve2aQ/RZcqH6r0Fi09kVSgkUDUWgcJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386731700"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="386731700"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 22:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="756103940"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="756103940"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Oct 2023 22:17:46 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qozhA-0003zl-27;
	Sat, 07 Oct 2023 05:17:44 +0000
Date: Sat, 7 Oct 2023 13:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make_ruc2021@163.com>, airlied@gmail.com, daniel@ffwll.ch,
	javierm@redhat.com, lyude@redhat.com, mripard@kernel.org,
	u.kleine-koenig@pengutronix.de, noralf@tronnes.org,
	tzimmermann@suse.de
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i2c/ch7006: fix a possible null pointer dereference
Message-ID: <202310071306.7oXVHYob-lkp@intel.com>
References: <20231007031712.3997144-1-make_ruc2021@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007031712.3997144-1-make_ruc2021@163.com>

Hi Ma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/drm-i2c-ch7006-fix-a-possible-null-pointer-dereference/20231007-112036
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231007031712.3997144-1-make_ruc2021%40163.com
patch subject: [PATCH] drm/i2c/ch7006: fix a possible null pointer dereference
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231007/202310071306.7oXVHYob-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310071306.7oXVHYob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310071306.7oXVHYob-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i2c/ch7006_drv.c: In function 'ch7006_encoder_get_modes':
>> drivers/gpu/drm/i2c/ch7006_drv.c:239:42: warning: variable 'encoder_mode' set but not used [-Wunused-but-set-variable]
     239 |                 struct drm_display_mode *encoder_mode;
         |                                          ^~~~~~~~~~~~


vim +/encoder_mode +239 drivers/gpu/drm/i2c/ch7006_drv.c

   226	
   227	static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
   228					    struct drm_connector *connector)
   229	{
   230		struct ch7006_priv *priv = to_ch7006_priv(encoder);
   231		const struct ch7006_mode *mode;
   232		int n = 0;
   233	
   234		for (mode = ch7006_modes; mode->mode.clock; mode++) {
   235			if (~mode->valid_scales & 1<<priv->scale ||
   236			    ~mode->valid_norms & 1<<priv->norm)
   237				continue;
   238	
 > 239			struct drm_display_mode *encoder_mode;
   240			encoder_mode = drm_mode_duplicate(encoder->dev, &mode->mode);
   241			if (!mode)
   242				continue;
   243	
   244			n++;
   245		}
   246	
   247		return n;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
