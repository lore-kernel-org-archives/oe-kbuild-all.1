Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941456;
	b=cn4Kie0zzEyKV2hMgr/c3PVwWwkEw6pR4DZzb+LndKOhEwcX5v2CBVkUPfciMIFsYBXe
	 A2rHNqpB2DQHhgbMS0ytGryt2ynTXdGRLrzyzFm7Sgp7l5ikmHsXqDCraJ8CYNzLBYlsE
	 JFDeu1q/pU1hujQowl4NPyRBnT5+uxa+TWSc1exnZrxeMLo8rWF+A1wpLKRja1k9wielG
	 cbFW+cvXe0EfNzFfgtdKx5exRJ46PVRMM2vNfwyPOcGqOgOJt2kf1LgFhuUPi6bF5vW0g
	 NRb7diO+mW3xP98FywjVNyO0W3a4/lEkK5kqGrazPN01X3h9gdofp6DRxTSMB73O/CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0+lOSJQ7L/jxxNGGL5HBPy/n3R/hBiOwxbdbogZkQnU=;
	b=m2Ee2U9s14NY4x7k+f5H7zOzAfdqnMfkhXMaZSXB2ie1fy4nahg0UpWU6RZU7U927rLz
	 DShu6lMvfO6p+OtfmQjx42nB4+z8bdqjnKcjETxO46F60sLbUvpO9xYOi1ntWWneGRSZP
	 2MpoiZO/tRdCs9l+akROIMGiIIZU/+askddE8kjQlN35eQIdZNEqiN1ofxVuXwmNg4KvC
	 AWewf+0cuE+9AwF2+009J8w6QB2Tj4yeiPO61C8KYYh0c4BH6f76GjfH8B6kO4u+n0rfj
	 gU9lf/m2AQGYQiAjN+tOhkgsGs8oZssT/NRit6L4yuyKg33c44/ECNCSjMZGtQKQSaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JUEz8F7J;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546E606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 05:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9546E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JUEz8F7J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793941455; x=1825477455;
  h=date:from:to:cc:subject:message-id;
  bh=8+c9BejSlFYwsTbU0r7zVtVe1crOLsZ/TcfmeInYP7w=;
  b=JUEz8F7JS1EaJHWYRRrorthbaAmRMiZSwS7UP1ZIgMgNSz4sJ5Ac8zaN
   jV0Zx+5Kyar1vWVWg0Aci0g0Q1rRtNA+OS/HKVBt6fzcA0JP1EFsY91qb
   rkxpdpT8a81bfY1h4ufCVaYaltUK71gfEqQDDdvs3KZjmI7d/HjQNSIH8
   9LcN6ACrAaG3HIMReJtdUCdCh+nTxOqS+dQNLgpwNld/4fn1GYEKuS+QA
   q3qnL6dECHqjtGkRA1D8hkviNpT+EC5wLXb+jUL6DgolMaXuAkpKrDAM4
   xyWo6Xwibd+X+zfk8CfrBODwkdW4EGj5NtNJBp7HoIjCr6skfRDjFnIzC
   A==;
X-CSE-ConnectionGUID: qfPLk6B6QbW3CcrTwG2Rgg==
X-CSE-MsgGUID: 0qIEW4W/Q7eB4K2ipAcP+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2653321"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2653321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 21:04:14 -0800
X-CSE-ConnectionGUID: 9qWMVEa4RbuQIfvV5AgKKg==
X-CSE-MsgGUID: bbOHu3aSTmaS20vBtVRciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7093221"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2026 21:04:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPC7V-00000000A2J-2UBV;
	Fri, 06 Nov 2026 05:04:09 +0000
Date: Fri, 06 Nov 2026 06:03:50 +0100
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Oliver Bestmann <oliver.bestmann@googlemail.com>
Subject: [asahilinux:bits/200-dcp 207/221]
 drivers/gpu/drm/apple/plane.c:357:4: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202611060638.87B8z8pv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   7ede143c0f094c8c52f1439b73a4cb8109ea9051
commit: e323190553b10d2a8ff68365ddb8c1dfd3c74b0b [207/221] drm: apple: Add support for Apple Interchange framebuffers
config: arm64-randconfig-r2100-20261106 (https://download.01.org/0day-ci/archive/20261106/202611060638.87B8z8pv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060638.87B8z8pv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060638.87B8z8pv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/apple/plane.c: In function 'apple_plane_atomic_update':
>> drivers/gpu/drm/apple/plane.c:357:4: error: a label can only be part of a statement and a declaration is not a statement
       struct dcp_image_layout layout;
       ^~~~~~


vim +357 drivers/gpu/drm/apple/plane.c

   284	
   285	static void apple_plane_atomic_update(struct drm_plane *plane,
   286					      struct drm_atomic_commit *commit)
   287	{
   288		struct drm_plane_state *base = drm_atomic_get_new_plane_state(commit, plane);
   289		struct apple_plane_state *new_state;
   290		struct drm_gem_dma_object *obj;
   291		bool is_premultiplied = false;
   292	
   293		if (!base)
   294			return;
   295	
   296		new_state = to_apple_plane_state(base);
   297	
   298		if (!base->fb) {
   299			memset(&new_state->surf, 0, sizeof(new_state->surf));
   300			return;
   301		}
   302	
   303		struct drm_framebuffer *fb = base->fb;
   304		const struct drm_format_info *fmt = fb->format;
   305		/*
   306		 * DCP doesn't support XBGR8 / XRGB8 / XBGR2101010 natively. Blending as
   307		 * pre-multiplied alpha with a black background can be used as
   308		 * workaround for the bottommost plane.
   309		 */
   310		if (fmt->format == DRM_FORMAT_XRGB8888 ||
   311		    fmt->format == DRM_FORMAT_XBGR8888 ||
   312		    fmt->format == DRM_FORMAT_XBGR2101010)
   313			is_premultiplied = true;
   314	
   315		new_state->src_rect = drm_to_dcp_rect_fp(&base->src);
   316		new_state->dst_rect = drm_to_dcp_rect(&base->dst);
   317	
   318		new_state->surf = (struct dcp_surface){
   319			.is_premultiplied = is_premultiplied,
   320			.plane_cnt = fb->format->num_planes,
   321			.plane_cnt2 = fb->format->num_planes,
   322			.format = drm_format_to_dcp(fmt->format, base->color_range),
   323			.xfer_func = get_xfer_func(fmt->is_yuv, base->color_encoding),
   324			.colorspace = get_colorspace(fmt->is_yuv, base->color_encoding),
   325			.stride = fb->pitches[0],
   326			.width = fb->width,
   327			.height = fb->height,
   328			.surface_id = plane->base.id,
   329	
   330			/* Only used for compressed or multiplanar surfaces */
   331			.pix_size = 1,
   332			.pel_w = 1,
   333			.pel_h = 1,
   334			.has_comp = 1,
   335			.has_planes = 1,
   336			.has_compr_info = 1,
   337		};
   338	
   339		/* Populate plane information for planar formats */
   340		struct dcp_surface *surf = &new_state->surf;
   341		for (int i = 0; fb->format->num_planes && i < fb->format->num_planes; i++) {
   342			u32 width = drm_format_info_plane_width(fb->format, fb->width, i);
   343			u32 height = drm_format_info_plane_height(fb->format, fb->height, i);
   344			u32 bpp;
   345			u32 bw;
   346			u32 bh;
   347	
   348			surf->planes[i] = (struct dcp_plane_info){
   349				.width = width,
   350				.height = height,
   351				.base = fb->offsets[i] - fb->offsets[0],
   352				.offset = fb->offsets[i] - fb->offsets[0],
   353			};
   354	
   355			switch (fb->modifier) {
   356			case DRM_FORMAT_MOD_APPLE_INTERCHANGE:
 > 357				struct dcp_image_layout layout;
   358	
   359				bpp = drm_format_info_bpp(fmt, i);
   360				layout = apple_get_ix_layout(width, height, bpp, i, fmt->is_yuv);
   361	
   362				surf->planes[i].tile_w = layout.tile_w;
   363				surf->planes[i].tile_h = layout.tile_h;
   364				surf->planes[i].stride = layout.width_tiles * layout.tile_bytes;
   365				surf->planes[i].size = layout.meta_offset + layout.meta_size;
   366				surf->planes[i].tile_size = layout.tile_bytes;
   367				surf->planes[i].address_fmt = DCP_ADDR_FMT_INTERCHANGE_TILED;
   368	
   369				surf->compression_info[i] = (struct dcp_compression_info) {
   370					.tile_w = layout.tile_w,
   371					.tile_h = layout.tile_h,
   372					.data_offset = surf->planes[i].offset,
   373					.metadata_offset = surf->planes[i].offset + layout.meta_offset,
   374					.meta_bytes = layout.meta_tile_bytes,
   375					.tiles_w = layout.width_tiles,
   376					.tiles_h = layout.height_tiles,
   377					.tile_bytes = layout.tile_bytes,
   378					.row_stride = layout.width_tiles * layout.tile_bytes,
   379					.compression_type = DCP_COMPRESSION_INTERCHANGE,
   380				};
   381				break;
   382			case DRM_FORMAT_MOD_INVALID:
   383			case DRM_FORMAT_MOD_LINEAR:
   384				bh = drm_format_info_block_height(fb->format, i);
   385				bw = drm_format_info_block_width(fb->format, i);
   386				surf->planes[i].tile_w = bw;
   387				surf->planes[i].tile_h = bh;
   388				surf->planes[i].stride = fb->pitches[i];
   389				surf->planes[i].size = height * fb->pitches[i];
   390				surf->planes[i].tile_size = bw * bh;
   391				surf->planes[i].address_fmt = DCP_ADDR_FMT_LINEAR;
   392				break;
   393			default:
   394				break;
   395			}
   396	
   397			surf->buf_size += surf->planes[i].size;
   398		}
   399	
   400		/* the obvious helper call drm_fb_dma_get_gem_addr() adjusts
   401		 * the address for source x/y offsets. Since IOMFB has a direct
   402		 * support source position prefer that.
   403		 */
   404		obj = drm_fb_dma_get_gem_obj(base->fb, 0);
   405		if (obj)
   406			new_state->iova = obj->dma_addr + base->fb->offsets[0];
   407	}
   408	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
