Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646B47A0C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847487; cv=none; b=YIpf3myx5l8HLj75G0M96V1j6LhPIfYE3iiHLpMjA6Ck7jNe9hapX2YQaNWBAZ3v4J4A5CDOJYwZROQBy/mAxl0WHvMP1MPNjraMcgIrcIa+f3Uv2daWZHOi3FgJcRH0QrpwMEKhfkqrKTFNnmTEELYmkm+FizXR33ZcM+TfCwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847487; c=relaxed/simple;
	bh=irmecrxlayx1efOQbCzEnZmn5YAMrX+o2Nbt1OhN8VQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f6VRBhWO6z8tv0cxxFBYv0XPlhRMVwHsAfDasCf17wIes9ahvMVFlM04LV1s+P2DGbHr3sM6M8whKu7uxePwDDSiuaX4s4z1fRW+b2InquZR5D4wJRg7opP51TWd8Q6RiByMFkF2UrdAzHGzxHJo8sD4gtsfCb4HOrv/vswq2Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpuhC/qV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpuhC/qV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778847486; x=1810383486;
  h=date:from:to:cc:subject:message-id;
  bh=irmecrxlayx1efOQbCzEnZmn5YAMrX+o2Nbt1OhN8VQ=;
  b=QpuhC/qVKw9Tb4jm3nmtMyifTTiTy+Xr3xN7lLuUgRTl0zFVb5QyksUx
   R26OuQaiU6TCa6U38C0Y8xW12ceEdMqvyHnlT9VdrQxXwDWfvio9GNGqv
   YsV7bmOZnbPy8Lgvomm1IApzi3gCBcao/ESawuFQhNFKIDqen3AgQwBGK
   j18VeFJN2mLWIECzyiuCdA8an8Z7E0OkBm1kc4uNI0saPHY93X0bKFR7f
   ZxIbhULAQZbZEf43wKdPx9u03Q9aZnKP/SLPmwaltvah8AxfndTkGdwb9
   ZJshoj7vvBOgXrr8Knb2mLWRefgplrXJNkX/IeqbdWDeWGJ0pR2rKp9Mg
   g==;
X-CSE-ConnectionGUID: m+J/afqAR661N3gQviNwQg==
X-CSE-MsgGUID: fEuQiSiLQASQlgGv7/LIOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83672299"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83672299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 05:18:06 -0700
X-CSE-ConnectionGUID: VCKbcIl5RJ+yFbS+DHiopw==
X-CSE-MsgGUID: OkL2/invR0OzRMyU4QyqFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="234428305"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 May 2026 05:18:04 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNrUP-000000001W5-3Ym3;
	Fri, 15 May 2026 12:18:01 +0000
Date: Fri, 15 May 2026 20:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 269/870]
 drivers/gpu/drm/xlnx/xlnx_mixer.c:1849:13: warning: cast from pointer to
 integer of different size
Message-ID: <202605151943.zQ00OAmH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   fb979987d554f0c8fd045b114a27a6359c9265cf
commit: 3b2892d96e45e4b17a90755f5750930cbfc2416b [269/870] drm: xlnx: mixer: Initial video mixer driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605151943.zQ00OAmH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151943.zQ00OAmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151943.zQ00OAmH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_mixer.c: In function 'xlnx_mix_update_logo_img':
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:1849:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1849 |         if ((phys_addr_t)buffer->vaddr == logo_layer->layer_regs.buff_addr1 &&
         |             ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:1855:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1855 |         logo_layer->layer_regs.buff_addr1 = (phys_addr_t)buffer->vaddr;
         |                                             ^


vim +1849 drivers/gpu/drm/xlnx/xlnx_mixer.c

  1798	
  1799	static int xlnx_mix_update_logo_img(struct xlnx_mix_plane *plane,
  1800					    struct drm_gem_dma_object *buffer,
  1801					     u32 src_w, u32 src_h)
  1802	{
  1803		struct xlnx_mix_layer_data *logo_layer = plane->mixer_layer;
  1804		struct xlnx_mix_hw *mixer = to_mixer_hw(plane);
  1805		size_t pixel_cnt = src_h * src_w;
  1806		bool per_pixel_alpha = false;
  1807		u32 max_width = logo_layer->hw_config.max_width;
  1808		u32 max_height = logo_layer->hw_config.max_height;
  1809		u32 min_width = logo_layer->hw_config.min_width;
  1810		u32 min_height = logo_layer->hw_config.min_height;
  1811		u8 *r_data = NULL;
  1812		u8 *g_data = NULL;
  1813		u8 *b_data = NULL;
  1814		u8 *a_data = NULL;
  1815		size_t el_size = sizeof(u8);
  1816		u8 *pixel_mem_data;
  1817		int ret, i, j;
  1818	
  1819		/* ensure valid conditions for update */
  1820		if (logo_layer->id != mixer->logo_layer_id)
  1821			return 0;
  1822	
  1823		if (src_h > max_height || src_w > max_width ||
  1824		    src_h < min_height || src_w < min_width) {
  1825			DRM_ERROR("Mixer logo/cursor layer dimensions illegal.\n");
  1826			return -EINVAL;
  1827		}
  1828	
  1829		if (!xlnx_mix_isfmt_support(plane->mixer_layer->hw_config.vid_fmt)) {
  1830			DRM_ERROR("DRM color format not supported for logo layer\n");
  1831			return -EINVAL;
  1832		}
  1833		per_pixel_alpha = (logo_layer->hw_config.vid_fmt ==
  1834				   DRM_FORMAT_RGBA8888) ? true : false;
  1835		r_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1836		g_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1837		b_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1838		if (per_pixel_alpha)
  1839			a_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1840	
  1841		if (!r_data || !g_data || !b_data || (per_pixel_alpha && !a_data)) {
  1842			DRM_ERROR("Unable to allocate memory for logo layer data\n");
  1843			ret = -ENOMEM;
  1844			goto free;
  1845		}
  1846		/* ensure buffer attributes have changed to indicate new logo
  1847		 * has been created
  1848		 */
> 1849		if ((phys_addr_t)buffer->vaddr == logo_layer->layer_regs.buff_addr1 &&
  1850		    src_w == logo_layer->layer_regs.width &&
  1851		    src_h == logo_layer->layer_regs.height)
  1852			return 0;
  1853	
  1854		/* cache buffer address for future comparison */
  1855		logo_layer->layer_regs.buff_addr1 = (phys_addr_t)buffer->vaddr;
  1856		pixel_mem_data = (u8 *)(buffer->vaddr);
  1857		for (i = 0, j = 0; j < pixel_cnt; j++) {
  1858			if (per_pixel_alpha && a_data)
  1859				a_data[j] = pixel_mem_data[i++];
  1860	
  1861			b_data[j] = pixel_mem_data[i++];
  1862			g_data[j] = pixel_mem_data[i++];
  1863			r_data[j] = pixel_mem_data[i++];
  1864		}
  1865		ret = xlnx_mix_logo_load(to_mixer_hw(plane), src_w, src_h, r_data,
  1866					 g_data, b_data,
  1867					 per_pixel_alpha ? a_data : NULL);
  1868	free:
  1869		kfree(r_data);
  1870		kfree(g_data);
  1871		kfree(b_data);
  1872		kfree(a_data);
  1873	
  1874		return ret;
  1875	}
  1876	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
