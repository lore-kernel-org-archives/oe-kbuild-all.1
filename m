Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AA3B192
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729213264; cv=none; b=WjWUfBii6SM6fW0gieqq22Fu+68q15rly6YRl1u2PztMBoNLP0zMluQH6iWOWhbqokH9w55298Z5uAADKRGT18KZaIqp2+6tP7/HEkdPhSn2TeXseTmoeQes0ShpUEkZqGEiMDAxCUH22YtlGJX7gH2x+PhfOhy7cVWQlV8L+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729213264; c=relaxed/simple;
	bh=8eDAVp1llPMRkGyKgFcN6O8Gea7/aRAoPbW6MBfBBsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2oLt8JxUHZ/HJXirgWNoUXHpsAuWeXrYFbu7gtnubB0sECEbId7+Q9arCJVl2OyWSVaYgsqQ+a7ckvJI/8HufqUpldf5RIbvJc7YeJKSKuRNR5Ppt/x8p35GDwm1NpCrvUvAFmqdytybvf+pjA2MJrVo8HY/fJvSYqcDkKLuuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2/GBtQo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2/GBtQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729213262; x=1760749262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8eDAVp1llPMRkGyKgFcN6O8Gea7/aRAoPbW6MBfBBsU=;
  b=a2/GBtQompWPmrm9aH9NmjLuPJOQs6dskGCRi1sSokL6SJ/sDl60Nwsp
   sBa2k/cfor1aEyUJveho/IxnflaH0DLLgKTORsWO4NjM2ZzG31AJ6DMrw
   HIbdeHTGnbw12Qe/CadZliJQoKf9TFqqbqf4cJcWserBM0Le85y0dn+GS
   9Y6lKVZTVA5HiQZh9YOPFsQJdbssEuyVyhuQVDrSBPhl6Ye7aKUAZjg8T
   6sxmPtPWI65Mr9t9Dv9Y/aP/MsraZkegr6D0/ZCbVkmyF6uT8GCqZ7/L2
   WPW72KFUv1Vz0Pf7FpxNW8aArXt7RdOMlhuwO+J74QlsLIO9f2c3kFevF
   w==;
X-CSE-ConnectionGUID: 6yXFoujcRAWqUYNU2t1rvQ==
X-CSE-MsgGUID: 4APPqPMHRhyA4/KlYiLhVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28521389"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28521389"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 18:01:01 -0700
X-CSE-ConnectionGUID: 28lpL1nKRDGpS4/ddyn14w==
X-CSE-MsgGUID: xPSXlSHtR5yf0gLTgidBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="83792523"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Oct 2024 18:00:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1bMM-000N5r-0A;
	Fri, 18 Oct 2024 01:00:54 +0000
Date: Fri, 18 Oct 2024 09:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, christian.koenig@amd.com, ray.huang@amd.com,
	dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
	mcanal@igalia.com, quic_jjohnson@quicinc.com,
	karolina.stolarek@intel.com, Arunpravin.PaneerSelvam@amd.com,
	thomas.hellstrom@linux.intel.com, asomalap@amd.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ruanjinjie@huawei.com
Subject: Re: [PATCH 1/3] drm/connector: hdmi: Fix memory leak in
 drm_display_mode_from_cea_vic()
Message-ID: <202410180830.oitxTsOv-lkp@intel.com>
References: <20241014071632.989108-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014071632.989108-2-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/drm-connector-hdmi-Fix-memory-leak-in-drm_display_mode_from_cea_vic/20241014-152022
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241014071632.989108-2-ruanjinjie%40huawei.com
patch subject: [PATCH 1/3] drm/connector: hdmi: Fix memory leak in drm_display_mode_from_cea_vic()
config: arc-randconfig-002-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180830.oitxTsOv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180830.oitxTsOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180830.oitxTsOv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_drm_hdmi_compute_mode_clock_rgb':
>> drivers/gpu/drm/tests/drm_connector_test.c:1008:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1008 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   In file included from drivers/gpu/drm/tests/drm_connector_test.c:13:
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc':
   drivers/gpu/drm/tests/drm_connector_test.c:1031:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1031 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1':
   drivers/gpu/drm/tests/drm_connector_test.c:1051:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1051 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc':
   drivers/gpu/drm/tests/drm_connector_test.c:1074:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1074 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1':
   drivers/gpu/drm/tests/drm_connector_test.c:1094:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1094 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_drm_hdmi_compute_mode_clock_rgb_double':
   drivers/gpu/drm/tests/drm_connector_test.c:1117:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1117 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_connector_hdmi_compute_mode_clock_yuv420_valid':
   drivers/gpu/drm/tests/drm_connector_test.c:1142:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1142 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc':
   drivers/gpu/drm/tests/drm_connector_test.c:1182:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1182 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc':
   drivers/gpu/drm/tests/drm_connector_test.c:1209:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1209 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc':
   drivers/gpu/drm/tests/drm_connector_test.c:1233:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1233 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc':
   drivers/gpu/drm/tests/drm_connector_test.c:1257:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1257 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/tests/drm_connector_test.c: In function 'drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc':
   drivers/gpu/drm/tests/drm_connector_test.c:1281:31: warning: passing argument 2 of 'drm_mode_destroy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1281 |         drm_mode_destroy(drm, mode);
         |                               ^~~~
   include/drm/drm_modes.h:456:72: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
     456 | void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +1008 drivers/gpu/drm/tests/drm_connector_test.c

   987	
   988	/*
   989	 * Test that for a given mode, with 8bpc and an RGB output the TMDS
   990	 * character rate is equal to the mode pixel clock.
   991	 */
   992	static void drm_test_drm_hdmi_compute_mode_clock_rgb(struct kunit *test)
   993	{
   994		struct drm_connector_init_priv *priv = test->priv;
   995		const struct drm_display_mode *mode;
   996		unsigned long long rate;
   997		struct drm_device *drm = &priv->drm;
   998	
   999		mode = drm_display_mode_from_cea_vic(drm, 16);
  1000		KUNIT_ASSERT_NOT_NULL(test, mode);
  1001	
  1002		KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
  1003	
  1004		rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
  1005		KUNIT_ASSERT_GT(test, rate, 0);
  1006		KUNIT_EXPECT_EQ(test, mode->clock * 1000ULL, rate);
  1007	
> 1008		drm_mode_destroy(drm, mode);
  1009	}
  1010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
