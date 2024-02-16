Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA49678B4D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708085336; cv=none; b=an+aGMELCd9MJ87JL6I+5issyEw3aCovNAc7JyPEEgiOtiTnU4M8MefEPQRUfUljq+JPlqOI+B91T2/BNowIBtyEIdleuCRukdwxTokeRRS4Mpx24qDUfdIOVMU2n4GP7uaAFsRQ1Hxc7djeuyaQX34cG07RKnAUTo6nHfaI8ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708085336; c=relaxed/simple;
	bh=QkLD/XHG9+NuCQzZHPbebqKmxkWVbMevBNZ3+AaFDQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpD1tlwyFAvJjMxl+jCiEwHNA/XNHCKQn7Nh/+lQPFiME6TJ9aHZuQZPGNyvrCNOM259RrcUPfcm3uuQ1VmLXSfT3H+A1kUAFlZ/PGqPm3tXejPsPtCMfa1wE7DDaMvBSXe6SY6cJ7cZZUYhPGfkv0sD1QBU8tuQlG6BR4Mg4gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldn8eOPy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldn8eOPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708085334; x=1739621334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QkLD/XHG9+NuCQzZHPbebqKmxkWVbMevBNZ3+AaFDQg=;
  b=ldn8eOPydsH1+/ul9zDCoOzGqcppSe2IZyj0gnRegOAbiWzE3bQQFPvN
   nowWEfaKCnkaMhHcT60zW2/LRDL9+D5UfmaQipBBNNDNGYlj9p4UJ8YQG
   dzwJWw/6qdncc3nywZ9lirOzjI+0qCswS3duu86AFTZzOO5nxIhQSrrUr
   34dMMpqXeq9nY997T6U8dioKcFFeUIqrqe66soAFq5K3YDFvVzVvLBLCe
   IjKNAFn0DGDsirVmTcDJ2zXJtAXaSeIJDA1m3FjM+Hl6wFbyBLFsz4COy
   u3Ck7DR8PgTM+XfvEMeVMcsG3FJ0xrmhXgqoTU3t/y6eEod1I33FbeVjX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2117036"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2117036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 04:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3901578"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2024 04:08:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rax1H-0001Ei-37;
	Fri, 16 Feb 2024 12:08:43 +0000
Date: Fri, 16 Feb 2024 20:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ville.syrjala@linux.intel.com,
	pekka.paalanen@collabora.com, contact@emersion.fr,
	harry.wentland@amd.com, mwen@igalia.com, jadahl@redhat.com,
	sebastian.wick@redhat.com, shashank.sharma@amd.com,
	agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
	aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
	daniel@ffwll.ch, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
	quic_abhinavk@quicinc.com, arthurgrillo@riseup.net,
	marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
	sean@poorly.run, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
Message-ID: <202402161931.6Z8xdViq-lkp@intel.com>
References: <20240213064835.139464-2-uma.shankar@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213064835.139464-2-uma.shankar@intel.com>

Hi Uma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next next-20240216]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-2-uma.shankar%40intel.com
patch subject: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
config: x86_64-randconfig-121-20240214 (https://download.01.org/0day-ci/archive/20240216/202402161931.6Z8xdViq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161931.6Z8xdViq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161931.6Z8xdViq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vkms/vkms_colorop.c:11:11: sparse: sparse: symbol 'vkms_initialize_tf_pipeline' was not declared. Should it be static?
--
   drivers/gpu/drm/vkms/vkms_composer.c: note: in included file:
>> drivers/gpu/drm/vkms/tests/vkms_color_tests.c:29:29: sparse: sparse: symbol 'test_linear_lut' was not declared. Should it be static?
>> drivers/gpu/drm/vkms/tests/vkms_color_tests.c:87:32: sparse: sparse: symbol 'test_matrix_3x4_50_desat' was not declared. Should it be static?
>> drivers/gpu/drm/vkms/tests/vkms_color_tests.c:146:32: sparse: sparse: symbol 'test_matrix_3x4_bt709_enc' was not declared. Should it be static?

vim +/vkms_initialize_tf_pipeline +11 drivers/gpu/drm/vkms/vkms_colorop.c

    10	
  > 11	const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
    12	{
    13	
    14		struct drm_colorop *op, *prev_op;
    15		struct drm_device *dev = plane->dev;
    16		int ret;
    17	
    18		/* 1st op: 1d curve */
    19		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    20		if (!op) {
    21			DRM_ERROR("KMS: Failed to allocate colorop\n");
    22			return -ENOMEM;
    23		}
    24	
    25		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
    26		if (ret)
    27			return ret;
    28	
    29		list->type = op->base.id;
    30		list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
    31	
    32		prev_op = op;
    33	
    34		/* 2nd op: 3x4 matrix */
    35		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    36		if (!op) {
    37			DRM_ERROR("KMS: Failed to allocate colorop\n");
    38			return -ENOMEM;
    39		}
    40	
    41		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
    42		if (ret)
    43			return ret;
    44	
    45		drm_colorop_set_next_property(prev_op, op);
    46	
    47		prev_op = op;
    48	
    49		/* 3rd op: 3x4 matrix */
    50		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    51		if (!op) {
    52			DRM_ERROR("KMS: Failed to allocate colorop\n");
    53			return -ENOMEM;
    54		}
    55	
    56		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
    57		if (ret)
    58			return ret;
    59	
    60		drm_colorop_set_next_property(prev_op, op);
    61	
    62		prev_op = op;
    63	
    64		/* 4th op: 1d curve */
    65		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    66		if (!op) {
    67			DRM_ERROR("KMS: Failed to allocate colorop\n");
    68			return -ENOMEM;
    69		}
    70	
    71		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
    72		if (ret)
    73			return ret;
    74	
    75		drm_colorop_set_next_property(prev_op, op);
    76	
    77		return 0;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
