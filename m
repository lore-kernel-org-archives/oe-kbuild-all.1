Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719814D428
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724210411; cv=none; b=Ovm6huqt3vj66YOU6WNLjsK2yXG31thHjFFpvXwHK71i5eTazkOQhPyEqSvQ0Eu7chHohrnBfuJuvVboTwk/07bA36dzs+Th8zL1EbBlLxV2J6EXwinZcxPlkpAWfcF78uQ2Zc0a2zQ0/qX0Y2QmAId1UVWAo8q3ooouuU0yGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724210411; c=relaxed/simple;
	bh=ar+dQ4i1dygyS6t1yB6lTHw2GDDRUaWDsPxGQ51Omg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxHQ28ecXpewh4qs97aLTcBParlbbGdEqB7uJuHKccHC9DezGjVnqqNK8tFOV2Gcjjk93Fd+on7awlwg+1ef7ASsgUE2hHYIkGsafgxC9hZhSUCvHrC/k46CFJ1/blqzp8HKtUAzxssOU5C2/hez4H/NJlwBaROBJHkLghzRvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZArZZGoF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZArZZGoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724210409; x=1755746409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ar+dQ4i1dygyS6t1yB6lTHw2GDDRUaWDsPxGQ51Omg4=;
  b=ZArZZGoFc1JClKu7WkIFnIkMX58bYuwVfTSen7l/CgX6VHTdgFPpeUku
   K1tprHwMuyuRPC/qjkY6OXyv6ZhyThBqLdJxS5tPDZPPQf/0eprqtHyEO
   X/fUWNF0Zk4Btltn5ckcTrsmUU08FHku3juxBwCqSporT7FqU62w/t9rq
   U74xkr8ozxohDEtu1OOhJ38MyjP+Ut5aIPHQJXQzE94uqggYcyeSBocxy
   2czzURsa+dEvQtbUIMsOLuM+BP/2OFIa2JhWuMl9BaK73v6q0bwSAUGNz
   /DtoIsXx3FEAgRmEDf0eoInneUhqSzT7rO3fA45DVOIaKfy5w9ZyxpTka
   w==;
X-CSE-ConnectionGUID: 8Lbh7bAiRZqOKVLFGbcbMQ==
X-CSE-MsgGUID: Iy+rihhkRQy4RzSKtlyW5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33700762"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="33700762"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 20:20:06 -0700
X-CSE-ConnectionGUID: KgQ/m24UQG2DwZ2YX3h3UQ==
X-CSE-MsgGUID: nG6pfSGxQIOH9xtiv6NZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="61712748"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2024 20:20:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgbtB-000AqE-2V;
	Wed, 21 Aug 2024 03:20:01 +0000
Date: Wed, 21 Aug 2024 11:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
	Alex Hung <alex.hung@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v5 36/44] drm/amd/display: add 3x4 matrix colorop
Message-ID: <202408211016.TkunD7H3-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc4 next-20240820]
[cannot apply to drm-exynos/exynos-drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20240820-050138
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240819205714.316380-37-harry.wentland%40amd.com
patch subject: [PATCH v5 36/44] drm/amd/display: add 3x4 matrix colorop
config: arm-randconfig-002-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211016.TkunD7H3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211016.TkunD7H3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211016.TkunD7H3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ring.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ctx.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c: In function '__set_dm_plane_colorop_3x4_matrix':
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
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
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
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


vim +41 drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h

539489fc91ea77 Aurabindo Pillai 2020-04-08  40  
539489fc91ea77 Aurabindo Pillai 2020-04-08 @41  #define dev_fmt(fmt) "amdgpu: " fmt
539489fc91ea77 Aurabindo Pillai 2020-04-08  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
