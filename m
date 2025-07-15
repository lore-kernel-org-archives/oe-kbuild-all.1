Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3411333F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 01:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752541429; cv=none; b=NNO3J1MuDwe68SixT+1v8S+umwErZniMD7AMbkY5QPNKWL5TKzFiuzR4ekbWbQyLHlThsaDgLk65/b85wYLteGcxc3qxvGhH+OHb2u+wybtVBCX4a6XlhEi2r2/LPhvyBy9qWYfPF51v6+osjn5yxCDLbVhhIc7coGxnPfXpRtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752541429; c=relaxed/simple;
	bh=F3hg9NRjgn7jIryv9VoimfmExGxLQ8DUXmH0Hsa3JSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seffWWjHcELVM1785fgyIpJ1YTUbF6BizQvOBuVfm/Sh/qeZCc5d0qAE+iYlYvGAD904HvoKr4MN3kO7tmeIt6kmGoX+WK0l41fqalCkKZv6X1Clq4Gb0xQl6W2os9KDvUQicBZ1jv+tYWFHXSsSy/pgb+NOT2ep9E7eKgh+mX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwjHKLBs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwjHKLBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752541427; x=1784077427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3hg9NRjgn7jIryv9VoimfmExGxLQ8DUXmH0Hsa3JSI=;
  b=KwjHKLBsTORw/e6IVbO236sLEImsp8+csB94/vILdIB5O7Fh5L8WgF1l
   0ovm3WjZpSlu8cvAJHWCZB3qtpZBQwcwf323bsQp7oIhviqHJFWSie9Mi
   CHvQzWrnE5BeGOt4JtXXwCHhcxPr/HpZhD80NL7w0GAyKCF4VQK0Vg24k
   CCCZ4tUDXwybGZzXsc1w7SvL3L9OzoVX0IJDKFJnfsihV1HG0NNl4rXcU
   dkcEIEJFRThtummBUwDjCNZSCQEuELKilThbZk28iyWFJ/7q6J40xHLCu
   O/0cVxYMnW38yEiz5CNV8zx1qv7Yr5bSxmzJVyaLfqXvOvY7W6fvz5rQZ
   g==;
X-CSE-ConnectionGUID: gAM5JAA7QeO+mQAdFcbjpg==
X-CSE-MsgGUID: ylCh09SlRuCKZelxzI2dIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58554411"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="58554411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 18:03:47 -0700
X-CSE-ConnectionGUID: VQ6eiaacQia3THiHOoeIsg==
X-CSE-MsgGUID: jYIwzg9aT/6u5+1BLckGyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="188070345"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jul 2025 18:03:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubU58-0009Ux-1p;
	Tue, 15 Jul 2025 01:03:42 +0000
Date: Tue, 15 Jul 2025 09:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/gpu/drm/panel/panel-himax-hx8279.c:940:2-3: Unneeded
 semicolon
Message-ID: <202507150825.LZMhkNeK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 38d42c261389985e8dd4739dbd97e2dc855e8dd0 drm: panel: Add driver for Himax HX8279 DDIC panels
date:   3 months ago
config: arm-randconfig-r064-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150825.LZMhkNeK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150825.LZMhkNeK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-himax-hx8279.c:940:2-3: Unneeded semicolon

vim +940 drivers/gpu/drm/panel/panel-himax-hx8279.c

   895	
   896	static int hx8279_check_dig_gamma(struct hx8279 *hx, struct device *dev, const u8 *component)
   897	{
   898		u8 gamma_high_bits[4];
   899		u16 prev_val = 0;
   900		int i, j, k, x;
   901	
   902		/*
   903		 * The gamma values are 10 bits long and shall be incremental
   904		 * to form a digital gamma correction reference curve.
   905		 *
   906		 * As for the registers format: the first 24 bytes contain each the
   907		 * lowest 8 bits for each of the gamma level references, and the last
   908		 * 6 bytes contain the high two bits of 4 registers at a time, where
   909		 * the first two bits are relative to the last register, and the last
   910		 * two are relative to the first register.
   911		 *
   912		 * Another way of saying, those are the first four LOW values:
   913		 * DGMA1_LO = 0xb1, DGMA2_LO = 0xb2, DGMA3_LO = 0xb3, DGMA4_LO = 0xb4
   914		 *
   915		 * The high values for those four are at DGMA1_4_HI = 0xc9;
   916		 * ...and DGMA1_4_HI's data contains the following bits:
   917		 * [1:0] = DGMA4_HI, [3:2] = DGMA3_HI, [5:4] = DGMA2_HI, [7:6] = DGMA1_HI
   918		 */
   919		for (i = 0; i < HX8279_PG_DGAMMA_NUM_HI_BYTES; i++) {
   920			k = HX8279_PG_DGAMMA_NUM_LO_BYTES + i;
   921			j = i * 4;
   922			x = 0;
   923	
   924			gamma_high_bits[0] = FIELD_GET(HX8279_DGAMMA_DGMA1_HI, component[k]);
   925			gamma_high_bits[1] = FIELD_GET(HX8279_DGAMMA_DGMA2_HI, component[k]);
   926			gamma_high_bits[2] = FIELD_GET(HX8279_DGAMMA_DGMA3_HI, component[k]);
   927			gamma_high_bits[3] = FIELD_GET(HX8279_DGAMMA_DGMA4_HI, component[k]);
   928	
   929			do {
   930				u16 cur_val = component[j] | (gamma_high_bits[x] << 8);
   931	
   932				if (cur_val < prev_val)
   933					return dev_err_probe(dev, -EINVAL,
   934							     "Invalid dgamma values: %u < %u!\n",
   935							     cur_val, prev_val);
   936				prev_val = cur_val;
   937				j++;
   938				x++;
   939			} while (x < 4);
 > 940		};
   941	
   942		return 0;
   943	}
   944	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
