Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BC0377A83
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498154; cv=none; b=m3yJWqUbvmhKt6VhUR5K//OXZqWAt2B9grVLeiAsaaWQ5oaIUXGntYdUNiVnOK2iP4/bURJ3RcEQfMAgzOE1A12AeWg646hJtZ1QMl5mAo5dteOx53Wk/1bIjMn5XOgddfN4yDM+4ouNwtbu0CBOUNki1cvv7r+Y0Ml2qpZTo7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498154; c=relaxed/simple;
	bh=Xt1M20zQ5P79g9rWgkPA+xY/4uJTlSdMXzwK7OW1n50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jUqUvBKE06/8yaDl8GHtnIBAVZHMrf2U33HNl5CUH5Rece7eEQNREgW91VWjVecgjBqppzRuz2pwNVR5BxlOkPnWWentsido3stM9+UZp51G72phyeT1JR4sljeNCw+e/wOEOMZJJC63FQiaHjDhUKScslEPpH9oCetgHoiGKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARTjYXCn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARTjYXCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790498151; x=1822034151;
  h=date:from:to:cc:subject:message-id;
  bh=Xt1M20zQ5P79g9rWgkPA+xY/4uJTlSdMXzwK7OW1n50=;
  b=ARTjYXCnfyglBmFXmFI2te1nRb9z62vNKj1f2wcsf9ACEb6TfEyaNtWJ
   XCs6N9i03Q7d8m5/kUzg1HxkCf0VAKZi9c3L4r4MkfkJYNDz10otp2vqu
   YXk4BqXHjUOy1n5DZaPpaQRTN92z22qfHkyCQjk1F9MWjU059/iYebrJK
   KEUyQ/UMvnjQy6Q2ZGK94zYcICF1Uav66HHyrxyh5OJzKVHeq8PIZvqoM
   TeZMxcTwWqtY3bLEDT/kLS6Fb8ZIeM4GIl8mWEvYlX2+mUr6ZqG4mUkPY
   hn13osA8IIqbuG54p82rvjkkyD9hBD7wL8CHpdR6zrMUVnDsq4L3PjNSj
   Q==;
X-CSE-ConnectionGUID: Uk/esDrBT5OoMgQhBezP4g==
X-CSE-MsgGUID: W3RI5ENcR9WDESZ2p+B2LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101794629"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="101794629"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 01:35:50 -0700
X-CSE-ConnectionGUID: 3hzl04kKQ9KWyur+eu8Llg==
X-CSE-MsgGUID: OUTYc/phTUmQBDsx17SHkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="301028361"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2026 01:35:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAkML-00000000MhZ-4BU0;
	Sun, 27 Sep 2026 08:35:45 +0000
Date: Sun, 27 Sep 2026 16:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.12 194/1171]
 drivers/gpu/drm/xlnx/xlnx_mixer.c:1805:13: warning: cast from pointer to
 integer of different size
Message-ID: <202609271610.xp8IzrTP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.12
head:   d25fdf9fee1c8707551f590540e46b3686b90099
commit: 7f39b034942ee80f2e6e595a0d702ea97382d40f [194/1171] drm: xlnx: mixer: Initial video mixer driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260927/202609271610.xp8IzrTP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271610.xp8IzrTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271610.xp8IzrTP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_mixer.c: In function 'xlnx_mix_update_logo_img':
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:1805:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1805 |         if ((phys_addr_t)buffer->vaddr == logo_layer->layer_regs.buff_addr1 &&
         |             ^
   drivers/gpu/drm/xlnx/xlnx_mixer.c:1811:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1811 |         logo_layer->layer_regs.buff_addr1 = (phys_addr_t)buffer->vaddr;
         |                                             ^


vim +1805 drivers/gpu/drm/xlnx/xlnx_mixer.c

  1754	
  1755	static int xlnx_mix_update_logo_img(struct xlnx_mix_plane *plane,
  1756					    struct drm_gem_dma_object *buffer,
  1757					     u32 src_w, u32 src_h)
  1758	{
  1759		struct xlnx_mix_layer_data *logo_layer = plane->mixer_layer;
  1760		struct xlnx_mix_hw *mixer = to_mixer_hw(plane);
  1761		size_t pixel_cnt = src_h * src_w;
  1762		bool per_pixel_alpha = false;
  1763		u32 max_width = logo_layer->hw_config.max_width;
  1764		u32 max_height = logo_layer->hw_config.max_height;
  1765		u32 min_width = logo_layer->hw_config.min_width;
  1766		u32 min_height = logo_layer->hw_config.min_height;
  1767		u8 *r_data = NULL;
  1768		u8 *g_data = NULL;
  1769		u8 *b_data = NULL;
  1770		u8 *a_data = NULL;
  1771		size_t el_size = sizeof(u8);
  1772		u8 *pixel_mem_data;
  1773		int ret, i, j;
  1774	
  1775		/* ensure valid conditions for update */
  1776		if (logo_layer->id != mixer->logo_layer_id)
  1777			return 0;
  1778	
  1779		if (src_h > max_height || src_w > max_width ||
  1780		    src_h < min_height || src_w < min_width) {
  1781			DRM_ERROR("Mixer logo/cursor layer dimensions illegal.\n");
  1782			return -EINVAL;
  1783		}
  1784	
  1785		if (!xlnx_mix_isfmt_support(plane->mixer_layer->hw_config.vid_fmt)) {
  1786			DRM_ERROR("DRM color format not supported for logo layer\n");
  1787			return -EINVAL;
  1788		}
  1789		per_pixel_alpha = (logo_layer->hw_config.vid_fmt ==
  1790				   DRM_FORMAT_RGBA8888) ? true : false;
  1791		r_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1792		g_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1793		b_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1794		if (per_pixel_alpha)
  1795			a_data = kcalloc(pixel_cnt, el_size, GFP_KERNEL);
  1796	
  1797		if (!r_data || !g_data || !b_data || (per_pixel_alpha && !a_data)) {
  1798			DRM_ERROR("Unable to allocate memory for logo layer data\n");
  1799			ret = -ENOMEM;
  1800			goto free;
  1801		}
  1802		/* ensure buffer attributes have changed to indicate new logo
  1803		 * has been created
  1804		 */
> 1805		if ((phys_addr_t)buffer->vaddr == logo_layer->layer_regs.buff_addr1 &&
  1806		    src_w == logo_layer->layer_regs.width &&
  1807		    src_h == logo_layer->layer_regs.height)
  1808			return 0;
  1809	
  1810		/* cache buffer address for future comparison */
  1811		logo_layer->layer_regs.buff_addr1 = (phys_addr_t)buffer->vaddr;
  1812		pixel_mem_data = (u8 *)(buffer->vaddr);
  1813		for (i = 0, j = 0; j < pixel_cnt; j++) {
  1814			if (per_pixel_alpha && a_data)
  1815				a_data[j] = pixel_mem_data[i++];
  1816	
  1817			b_data[j] = pixel_mem_data[i++];
  1818			g_data[j] = pixel_mem_data[i++];
  1819			r_data[j] = pixel_mem_data[i++];
  1820		}
  1821		ret = xlnx_mix_logo_load(to_mixer_hw(plane), src_w, src_h, r_data,
  1822					 g_data, b_data,
  1823					 per_pixel_alpha ? a_data : NULL);
  1824	free:
  1825		kfree(r_data);
  1826		kfree(g_data);
  1827		kfree(b_data);
  1828		kfree(a_data);
  1829	
  1830		return ret;
  1831	}
  1832	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
