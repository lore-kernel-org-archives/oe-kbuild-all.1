Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EBF199949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232208; cv=none; b=hdzctAYkdmYB4rOtsZzhFJktTIQ1TVDUocYOFPWKvlOzR3zh2miBFoRHq4kChSClOoKsoRM66rLLoN6U0WfFQoZ8D0s6lJPpY6/CUlNEprqhlyfWvoS0B5kQEJdmHhqaSGHZS2Uj1MsKC7wKymKfOOm1NwvZZ2mu2LVVDsS0BPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232208; c=relaxed/simple;
	bh=mbM2AMLOooQNzHmM2bXEle+LtiuV0rhBOs+muKnSFxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIZ6JjRTexnSumb1ZN9aW3b55F5b+b7k/vqjJAJtQyFElgnNx2SYliP0JsskCEfNXtWCRSrTTPilM39CaQFtMUrs3XMeMG6ZcRkljkCzF/Cp0sVhl9sMXzc6Gf9ln2b0o3Pj/KU5lROKfCEMDKGv0thmI2eD0wSL81G3I2f7UiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN3GDWXi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN3GDWXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724232206; x=1755768206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mbM2AMLOooQNzHmM2bXEle+LtiuV0rhBOs+muKnSFxw=;
  b=QN3GDWXiAqoEhpQjR8JF4C9p65+/xmiYO/fDd9VvsVDFbupogeQX9DSr
   dMnmsEGYOpzyGRInoEFN//7tMLy4B1CHgjnxzCtVqE5Z+rZ1YQq3mChMv
   DOUDnVZVB1O1niQwH4K7acFiEfCGZw5scUWwC5K2K181wmJ6hfvVqndA6
   5aWhcaQ67cwgstdZ3HuPs8cQtmanQxRdhFbgKfAnEPQfBhwxM27zD1ruU
   ZrzN2PJGW4p1SmIK203W9ManhsIWhQPX62V3YIt5Rm404nSrEKyunqta2
   FZ63AZpV4pPMkdyRCP9qtaXC3/J08M+dvtfTRlleDZvl3GczyggBTd0iM
   A==;
X-CSE-ConnectionGUID: 5acW/WQeQwSwX6rzj228cw==
X-CSE-MsgGUID: glZAmSGDQLq/7vHKV4g9DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="40037643"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="40037643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 02:23:25 -0700
X-CSE-ConnectionGUID: zvw7/BulTbaM+4Qvfle5fg==
X-CSE-MsgGUID: bZKT3bOrQduR6/E3U3sEeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61570020"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2024 02:23:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sghYm-000B9q-2x;
	Wed, 21 Aug 2024 09:23:20 +0000
Date: Wed, 21 Aug 2024 17:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
	Alex Hung <alex.hung@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v5 36/44] drm/amd/display: add 3x4 matrix colorop
Message-ID: <202408211502.eV7fXuRD-lkp@intel.com>
References: <20240819205714.316380-37-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819205714.316380-37-harry.wentland@amd.com>

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20240820-050138
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240819205714.316380-37-harry.wentland%40amd.com
patch subject: [PATCH v5 36/44] drm/amd/display: add 3x4 matrix colorop
config: parisc-randconfig-001-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211502.eV7fXuRD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211502.eV7fXuRD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211502.eV7fXuRD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ring.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ctx.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c: In function '__set_dm_plane_colorop_3x4_matrix':
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: error: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
      41 | #define dev_fmt(fmt) "amdgpu: " fmt
         |                      ^~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:470:9: note: in expansion of macro 'dev_warn'
     470 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:480:9: note: in expansion of macro '__drm_printk'
     480 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1247:25: note: in expansion of macro 'drm_warn'
    1247 |                         drm_warn(dev, "blob->length (%ld) isn't equal to drm_color_ctm_3x4 (%ld)\n",
         |                         ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Werror=format=]
      41 | #define dev_fmt(fmt) "amdgpu: " fmt
         |                      ^~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:470:9: note: in expansion of macro 'dev_warn'
     470 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:480:9: note: in expansion of macro '__drm_printk'
     480 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1247:25: note: in expansion of macro 'drm_warn'
    1247 |                         drm_warn(dev, "blob->length (%ld) isn't equal to drm_color_ctm_3x4 (%ld)\n",
         |                         ^~~~~~~~
   cc1: all warnings being treated as errors


vim +41 drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h

539489fc91ea773 Aurabindo Pillai 2020-04-08  40  
539489fc91ea773 Aurabindo Pillai 2020-04-08 @41  #define dev_fmt(fmt) "amdgpu: " fmt
539489fc91ea773 Aurabindo Pillai 2020-04-08  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
