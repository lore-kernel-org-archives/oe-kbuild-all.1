Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D352374
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 02:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpXoG4ws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698806580; x=1730342580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k3ckl3CIitL8Q4EkQTmivHcNo71alFzAQ+qGMGafd0U=;
  b=cpXoG4wsq2hDP+7jU6/fO+IYfwY0ArWOSJbRKKAlWZOzA9MoclExUq5j
   OFWVbLGYekreAFBp8BxonaP3QgznJNjGmWCVdnivh5C/p47MaM3VgxDrn
   grM7VhV0Qq/ShYfVdhN/8gmUKToBIvLLBVEtV9bIsvCBo5/yaOGXE/r1I
   mhHUd7KQKex9UMIdP2xbUQ7IDwofmsvPON6owjMJ8D6fpR/fdzsTgIRFF
   FC9O7ghficHSny3NczmEHSE9LaeWTyxZ8KWv6bCUngli0DCVf0EFiHDJH
   PVnz2vDF6F+OykAZzOzPIIVyUIjCrhaM309Tz9Gat1GlrIdpu1ByFZEbi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="9954599"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="9954599"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 19:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="710639942"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="710639942"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2023 19:42:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy1C2-0000Xd-0z;
	Wed, 01 Nov 2023 02:42:54 +0000
Date: Wed, 1 Nov 2023 10:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] drm/loongson: Allow attach drm bridge driver by
 calling lsdc_output_init()
Message-ID: <202311011055.5xna6j7t-lkp@intel.com>
References: <20231029194607.379459-4-suijingfeng@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029194607.379459-4-suijingfeng@loongson.cn>

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6 next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-loongson-Introduce-a-minimal-support-for-Loongson-VBIOS/20231030-034730
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231029194607.379459-4-suijingfeng%40loongson.cn
patch subject: [PATCH 3/8] drm/loongson: Allow attach drm bridge driver by calling lsdc_output_init()
config: x86_64-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011055.5xna6j7t-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011055.5xna6j7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011055.5xna6j7t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/loongson/lsdc_output.c:555:5: warning: no previous declaration for 'lsdc_encoder_init' [-Wmissing-declarations]
    int lsdc_encoder_init(struct drm_device *ddev,
        ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/loongson/lsdc_output.c:578:5: warning: no previous declaration for 'lsdc_connector_init' [-Wmissing-declarations]
    int lsdc_connector_init(struct drm_device *ddev,
        ^~~~~~~~~~~~~~~~~~~


vim +/lsdc_encoder_init +555 drivers/gpu/drm/loongson/lsdc_output.c

   554	
 > 555	int lsdc_encoder_init(struct drm_device *ddev,
   556			      struct lsdc_output *output,
   557			      unsigned int pipe)
   558	{
   559		const struct lsdc_output_desc *descp = output->descp;
   560		struct drm_encoder *encoder = &output->encoder;
   561		int ret;
   562	
   563		ret = drm_encoder_init(ddev,
   564				       encoder,
   565				       descp->encoder_funcs,
   566				       descp->encoder_type,
   567				       descp->name);
   568		if (ret)
   569			return ret;
   570	
   571		encoder->possible_crtcs = BIT(pipe);
   572	
   573		drm_encoder_helper_add(encoder, descp->encoder_helper_funcs);
   574	
   575		return 0;
   576	}
   577	
 > 578	int lsdc_connector_init(struct drm_device *ddev,
   579				struct lsdc_output *output,
   580				struct i2c_adapter *ddc,
   581				unsigned int pipe)
   582	{
   583		const struct lsdc_output_desc *descp = output->descp;
   584		struct drm_connector *connector = &output->connector;
   585		int ret;
   586	
   587		ret = drm_connector_init_with_ddc(ddev,
   588						  connector,
   589						  descp->connector_funcs,
   590						  descp->connector_type,
   591						  ddc);
   592		if (ret)
   593			return ret;
   594	
   595		drm_connector_helper_add(connector, descp->connector_helper_funcs);
   596	
   597		drm_connector_attach_encoder(connector, &output->encoder);
   598	
   599		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
   600				    DRM_CONNECTOR_POLL_DISCONNECT;
   601	
   602		connector->interlace_allowed = 0;
   603		connector->doublescan_allowed = 0;
   604	
   605		drm_info(ddev, "DisplayPipe-%u has %s\n", pipe, descp->name);
   606	
   607		return 0;
   608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
