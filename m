Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3DB284671
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 02:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567294; cv=none; b=E77VLX1NpkDejGu4N7L95I0K9XKLKmdbb8DG/R0cN642Lkbfk/EzcggZI0VkchVf9nbbu+Fm1xi8wem8bbAykStT+Oq0ucHShs7hc33ManZqyS31Tp6pZUlgp6sKdvIjI2BvOB10vEWwfMIc+9uxmmDrazOAxQmEAxLDTn7s3U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567294; c=relaxed/simple;
	bh=AsLaV6WjLigGQB+1fL0zxdBAPWzCg6IZSXz0Q9HxAG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZ9e77GkYjtT8dEL4Ui6D0wSSkpSpVAs2cgmNshWgQYgyJkChtjKX7sLeuxSznyXYz+Vs8PS++94fYn26h8kknGOM4FAMA/+xE5dLQz5IvEB/2nMMiStEsDHmu5JUVzPevdILqGSmGCrsAGe1sybJmMl0yHanppQOUjdAD0S9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyjV7SE1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyjV7SE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769567291; x=1801103291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AsLaV6WjLigGQB+1fL0zxdBAPWzCg6IZSXz0Q9HxAG8=;
  b=PyjV7SE1zueYBRGlhnQU0B5qNqgkEhBv4VFRYE/5wigQ2DvG5ccjrYRl
   Al32vIkzxVqeFBq0NgdNFSnbr7HLWdZQa6m0Fla84KrRjSXnRyp0GH33P
   fEt+qpNyNWw4hrUDOvEabP0eMOkuFEPFQKa4DnehFLu6KurdsqUm2+7hG
   IcKwQ4P+HYssVaBky16cDO2PinA5OEQQhXIi+rFDcsyX1IA0NgwVNqkSh
   6BH76b8cCULl8yUpRaOugKsA7BLACKmmxHZ344LAATcg0cvf3yF2Pp2Y+
   mx8I8ReQA07KSkHvKaTC0nuvvPbaocLlb6BTvy8kv0sV8ps1Mj6WwdxBp
   w==;
X-CSE-ConnectionGUID: +5TUf2NEQtamU/TxTKqadg==
X-CSE-MsgGUID: kKz8yVUKTOCKWTd+73Qaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81881450"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81881450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:28:11 -0800
X-CSE-ConnectionGUID: Y8t6OJ+RTyODRg9E9tlaNw==
X-CSE-MsgGUID: 1pnRvin1TRWKvOKkPfe5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207277691"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 18:28:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvHo-00000000Z8y-1XK9;
	Wed, 28 Jan 2026 02:28:04 +0000
Date: Wed, 28 Jan 2026 10:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, a0987203069@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <202601281037.qP5gX0kK-lkp@intel.com>
References: <20260126085727.2568958-4-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126085727.2568958-4-a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to robh/for-next linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-display-nuvoton-add-MA35D1-DCU-binding/20260126-170258
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260126085727.2568958-4-a0987203069%40gmail.com
patch subject: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260128/202601281037.qP5gX0kK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281037.qP5gX0kK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281037.qP5gX0kK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nuvoton/ma35_drm.h:18,
                    from drivers/gpu/drm/nuvoton/ma35_plane.c:23:
   drivers/gpu/drm/nuvoton/ma35_plane.c: In function 'ma35_layer_blend_mode_select':
>> drivers/gpu/drm/nuvoton/ma35_plane.h:141:9: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     141 |         FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
         |         ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_plane.c:177:24: note: in expansion of macro 'MA35_BLEND_MODE_SRC'
     177 |                 *reg = MA35_BLEND_MODE_SRC;
         |                        ^~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nuvoton/ma35_crtc.c: In function 'ma35_crtc_atomic_enable':
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:97:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      97 |         reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->htotal) |
         |               ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_crtc.c: In function 'ma35_crtc_get_scanout_position':
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:228:17: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     228 |         *hpos = FIELD_GET(MA35_DISPLAY_CURRENT_X, reg);
         |                 ^~~~~~~~~


vim +/FIELD_PREP +141 drivers/gpu/drm/nuvoton/ma35_plane.h

   137	
   138	/* configs for blend modes */
   139	#define MA35_BLEND_MODE_CLEAR	0
   140	#define MA35_BLEND_MODE_SRC	\
 > 141		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
   142	#define MA35_BLEND_MODE_DST \
   143		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
   144	#define MA35_BLEND_MODE_SRC_OVER \
   145		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE) | \
   146		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   147	#define MA35_BLEND_MODE_DST_OVER \
   148		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   149		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE))
   150	#define MA35_BLEND_MODE_SRC_IN \
   151		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
   152	#define MA35_BLEND_MODE_DST_IN \
   153		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
   154	#define MA35_BLEND_MODE_SRC_OUT \
   155		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
   156	#define MA35_BLEND_MODE_DST_OUT \
   157		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
   158	#define MA35_BLEND_MODE_SRC_ATOP \
   159		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL) | \
   160		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   161	#define MA35_BLEND_MODE_DST_ATOP \
   162		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   163		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL))
   164	#define MA35_BLEND_MODE_XOR \
   165		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   166		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
