Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEFC17C224
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 03:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822304; cv=none; b=gbXcijNGY40T4hfEZhk+szxc9FnwQCIuQe/8zNTHNbgGuPDZm1j/ReKe6SFpsKsfG24BZhCI7WCJ6RQmExHZdvPH38LuT1EnMOQXUWQ5Ka6agE6Xh6lEC0aG9JoQalqaKolvTNx+Z2ZPZhvTPEC7NOWSOYb+3KZkKRzBEtGa6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822304; c=relaxed/simple;
	bh=BisAwkSD2fjW7Xq+1yduzhmEB3hSU7QsTbWDeyNNvpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I5i9i0CquvxSGdakSELOz4W9YgwjkLxfYRnsK/3ed7l/HAdFyXE02nYTCwRM5cBvhhF+4LygfIp46j7cp9/rwmyk76ldSn12UCCNq9aJqZtZZNFp4thsA12TDzH/9KqBOEvcMhXT5J+GhdCilxgn3LyVQZYVuqqnP9eU2LoSwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha1z5mqU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha1z5mqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750822302; x=1782358302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BisAwkSD2fjW7Xq+1yduzhmEB3hSU7QsTbWDeyNNvpI=;
  b=ha1z5mqUiuJuSL0Z68HWZN9LaI2liQkq4lR0C+YkjtOabcClbC7l8JuL
   CPxxi0XcSJ/1lNiENB9EUKBc5k73Zm+syXm67i8g3lQLG3GKHLCKHPcNy
   r4R9avrHdU/rUInm//vW9g3qSEoMkSyvJ5OO8PPac8RQZ4Ln5bHP3OvFa
   2cRVOL8MilPVrUcUaQAY+FV3BONNExu2+RC9iRDVdUb9JI7wIOLVvJXwa
   t4u+h2VHtIT3SfK4IgHxHTmAEp7K9I6hpkRw7TYnfVw32DTBFXDVJZe6t
   j/ZWobRL+F8c9ApDSprZ2FTApDNGRWD1GbdEYPclaWXy81+CSdY0OBWPJ
   g==;
X-CSE-ConnectionGUID: vU/hAJHGSTuQ9dPMmv/yaw==
X-CSE-MsgGUID: HAj7RDPrRWCX/5i12b/Dng==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75616721"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="75616721"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 20:31:41 -0700
X-CSE-ConnectionGUID: sDd8lyYYRuC7vEXQqA/SAw==
X-CSE-MsgGUID: JL0O0zA2SmW10flk8ltCDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152268798"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2025 20:31:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUGrJ-000SjC-2j;
	Wed, 25 Jun 2025 03:31:37 +0000
Date: Wed, 25 Jun 2025 11:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 178/178]
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1151:52:
 warning: right shift count >= width of type
Message-ID: <202506251110.HInI5dtA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a96f44b4c60a235515d3e5c66770402531dc3d97
commit: a96f44b4c60a235515d3e5c66770402531dc3d97 [178/178] CHROMIUM: media: mediatek: vcodec: fix vp9 p2 4096x2176 fail
config: i386-buildonly-randconfig-004-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251110.HInI5dtA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251110.HInI5dtA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251110.HInI5dtA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c: In function 'vdec_vp9_slice_setup_tile_buffer':
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1151:52: warning: right shift count >= width of type [-Wshift-count-overflow]
    1151 |                                         *tb |= (pa >> 32) & 0xf;
         |                                                    ^~


vim +1151 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c

  1071	
  1072	/*
  1073	 * parse tiles according to `6.4 Decode tiles syntax`
  1074	 * in "vp9-bitstream-specification"
  1075	 *
  1076	 * frame contains uncompress header, compressed header and several tiles.
  1077	 * this function parses tiles' position and size, stores them to tile buffer
  1078	 * for decoding.
  1079	 */
  1080	static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *instance,
  1081						    struct vdec_vp9_slice_vsi *vsi,
  1082						    struct mtk_vcodec_mem *bs)
  1083	{
  1084		struct vdec_vp9_slice_uncompressed_header *uh;
  1085		unsigned int rows_log2;
  1086		unsigned int cols_log2;
  1087		unsigned int rows;
  1088		unsigned int cols;
  1089		unsigned int mi_row;
  1090		unsigned int mi_col;
  1091		unsigned int offset;
  1092		dma_addr_t pa;
  1093		unsigned int size;
  1094		struct vdec_vp9_slice_tiles *tiles;
  1095		unsigned char *pos;
  1096		unsigned char *end;
  1097		unsigned char *va;
  1098		unsigned int *tb;
  1099		int i;
  1100		int j;
  1101	
  1102		uh = &vsi->frame.uh;
  1103		rows_log2 = uh->tile_rows_log2;
  1104		cols_log2 = uh->tile_cols_log2;
  1105		rows = 1 << rows_log2;
  1106		cols = 1 << cols_log2;
  1107	
  1108		if (rows > 4 || cols > 64) {
  1109			mtk_vdec_err(instance->ctx, "tile_rows %u tile_cols %u\n", rows, cols);
  1110			return -EINVAL;
  1111		}
  1112	
  1113		offset = uh->uncompressed_header_size +
  1114			uh->header_size_in_bytes;
  1115		if (bs->size <= offset) {
  1116			mtk_vdec_err(instance->ctx, "bs size %zu tile offset %u\n", bs->size, offset);
  1117			return -EINVAL;
  1118		}
  1119	
  1120		tiles = &vsi->frame.tiles;
  1121		/* setup tile buffer */
  1122	
  1123		va = (unsigned char *)bs->va;
  1124		pos = va + offset;
  1125		end = va + bs->size;
  1126		/* truncated */
  1127		pa = bs->dma_addr + offset;
  1128		tb = instance->tile.va;
  1129		for (i = 0; i < rows; i++) {
  1130			for (j = 0; j < cols; j++) {
  1131				if (i == rows - 1 &&
  1132				    j == cols - 1) {
  1133					size = (unsigned int)(end - pos);
  1134				} else {
  1135					if (end - pos < 4)
  1136						return -EINVAL;
  1137	
  1138					size = (pos[0] << 24) | (pos[1] << 16) |
  1139						(pos[2] << 8) | pos[3];
  1140					pos += 4;
  1141					pa += 4;
  1142					offset += 4;
  1143					if (end - pos < size)
  1144						return -EINVAL;
  1145				}
  1146				tiles->size[i][j] = size;
  1147				if (tiles->mi_rows[i]) {
  1148					*tb++ = (size << 3) + ((offset << 3) & 0x7f);
  1149					*tb = pa & ~0xf;
  1150					if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
> 1151						*tb |= (pa >> 32) & 0xf;
  1152					tb++;
  1153					*tb++ = (pa << 3) & 0x7f;
  1154					mi_row = (tiles->mi_rows[i] - 1) & 0x1ff;
  1155					mi_col = (tiles->mi_cols[j] - 1) & 0x3f;
  1156					*tb++ = (mi_row << 6) + mi_col;
  1157				}
  1158				pos += size;
  1159				pa += size;
  1160				offset += size;
  1161			}
  1162		}
  1163	
  1164		return 0;
  1165	}
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
