Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793162905;
	b=I4N6xGT/7d1cghNiQnjU4CtUy7IUko9JJVrQytoKnP9JrbVl3Y9dzlX1NDvFCS8LRI80
	 Ri8/HdELW0jVn6B2ljtydhMj5xmCkMf3AqUtwpFYpdAFQv+CrYbRcle7ufjjDz2NOtSEX
	 YexoYA1FNPs1gsw1TzebdhWho9R7JOQrNrRvGQrM3B06+M2BAuXIoowY05TTXJy+JeQUT
	 bPE1DJESuBrEQIK9BP9VsXMG89U0xBZPB0J2n4hMbkfNlBg0Q3/9w4NSTv1u+aJxLYAd/
	 7H50ht+ROPBgdxA3c9WCQ+h5w0yzTDK2fk4s7s3xgv/n0l9NAYFKbMFHB9i2un/+oHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793162905;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fePuyPnoiE2G2stUlhoUcE0qBtqRGMIcdF0PHTwlZ04=;
	b=qCsAq+VizyRMTdLSKLG3Yw/ck4tamxS5A+yybKh6pYWrUpt8naQv5bemgObxWUaBbhax
	 Q2OaseYdk/kqgY1BqUphwI4TureDRXj9AEfZvHbroScQRKzT2qdXuXYG/Tt+uyXS0W7v2
	 EG6p/0pcS44RB7/Hbm5m/6W/ZAAcL46VZMNVPGJjfOlb5G4mkf3IfBbzqJy3xBf9l4dDU
	 bbpkOAg4qfDi2U6Lmifq2jxkql6eWVAigglJffXhUu/jxYW+RtKy7yleSA38PO0fCbZrb
	 F11Sg0X+ZNYnRGABbbycALsNU7eaw4gRgkGWtCZ4LsWQcGxR/EWplpgOtx0xeH3t2xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HEHL8r8w;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755F8606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 04:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HEHL8r8w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793162903; x=1824698903;
  h=date:from:to:cc:subject:message-id;
  bh=rSeNfruK3vDLHZo3+a97i0B3VnQcaLajutO/wnLh5G4=;
  b=HEHL8r8w2tArGSCywwIFmtQ2j6AW2ljK4OB4MIVcqTNZgcYtlt9C3ZNr
   BUcbAFtlfjs9bF2gtDXII9ke5pF/noBgsFERJgIN7ADCafoRp91hKI6e/
   iiqzmiGyimlmJVDFqPKVRdAx7IVeiIV4sEJl82DkPoWQV1ttNJ8HmtO7e
   IZrTV3LLFczbdmRZd0Z10OuaFR2sUAQRDBsADXW5AOpKe8YyYr+lqGFku
   1EM/JmQDKq8aeEZY9Ubtl1wBEviy2uj4z5yR2AhNoiasQk3pWvpfcir/l
   lKvQJc2grlffDzF/+iPFhDC3ar8YdcW5s+F1OS/IXgz1nn80EzcTk2fDj
   Q==;
X-CSE-ConnectionGUID: Ga44rZSATNiCy+AKp8BzxQ==
X-CSE-MsgGUID: Vdr+0n/JRliGgrRw9KQySg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1762813"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1762813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:48:23 -0700
X-CSE-ConnectionGUID: HcjqCdouRJunhE3O9/ymNA==
X-CSE-MsgGUID: YuqP5Rg0TNun74+8D3h3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5089169"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2026 21:48:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvaE-000000004lH-1Koq;
	Wed, 28 Oct 2026 04:48:18 +0000
Date: Wed, 28 Oct 2026 05:48:17 +0100
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Oliver Bestmann <oliver.bestmann@googlemail.com>
Subject: [asahilinux:bits/200-dcp 207/213]
 drivers/gpu/drm/apple/plane.c:357:4: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202610280515.8vdhkz35-lkp@intel.com>
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
head:   b911d3aec58d8eebd94b9403a3e83e488967f339
commit: 3288b6095ea6491ef83bda442bab90bbeebdf85e [207/213] drm: apple: Add support for Apple Interchange framebuffers
config: arm64-randconfig-2001-20261028 (https://download.01.org/0day-ci/archive/20261028/202610280515.8vdhkz35-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280515.8vdhkz35-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280515.8vdhkz35-lkp@intel.com/

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
