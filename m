Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122872472A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 03:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762312746; cv=none; b=AkYp1OPk+gp3CH+aHVApNHMGUpOdQRFEbrXaU+plnqZP+jjia3xzLtaS3S8ab3lUa7SGAXMFppvbobw0oRx6cdosSh2lijmkApbZT7iR9pZ8VayeaueqPoHjvpNIuxEvmgyB6obAbXVa/JlO2USk4fVgCk82uVJ7Rm1KokNPGGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762312746; c=relaxed/simple;
	bh=rAMAPqLRErq8k8QYnCAWXAG29UTdlb3GnFhkKN5LA1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASM1HMmI9QmQvzb2kB5N2d/iOLAne9M/5aXpL+jGMB3yje7XXbGQTkRdF4lGUyfATN3y4Uyn/XgoYqqZGfLbNLIzKEfoYRVW6RIx+yGER6fh4xgD1jy2ozEvhK2+v8IqM9iWkIQsHcywxK0i2oI1NeU6zWLvpkTy2mK/K+ZYN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2PbRL3a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2PbRL3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762312745; x=1793848745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAMAPqLRErq8k8QYnCAWXAG29UTdlb3GnFhkKN5LA1A=;
  b=U2PbRL3aaNfPuI/16h+YYVWW9xTQoGPJhVgc7cpLQugINayhn6AbmRRn
   XhXNYCl43WVuklk+dLyuZHHCnsnlAu93wFMfeJP4bPIs+blriGk4USwbu
   YgUgF9zd+0wE/ulk028rO1IIb3IpUUmGHxeuw3f3P/dBQaWVlEBUsork5
   a0GujdRnRXYFc7k8Wi3dfxcyLFpZFNZGn4w1SgRem/ju0AOAbLaeASniH
   +VdExIqU+0lDK/KM2SIXHRwYSIQHjKGTbPWzjKxeWHQydF4XwtTNQINJo
   i7SpdvNZDP8F9BRAbXTS7toCOIF1zLonoiROY6EiNxCOjs+PwXamygNep
   A==;
X-CSE-ConnectionGUID: 4EzIXroQSKeA7wJefQ1fkg==
X-CSE-MsgGUID: yup/42A0SQy1yIacfNkHiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64518789"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="64518789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 19:19:04 -0800
X-CSE-ConnectionGUID: DmLgtqThTTOoNruEb9dueA==
X-CSE-MsgGUID: c5VtkHpWSEGZwRJvfiCBow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="186623499"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Nov 2025 19:19:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGU32-000S6y-39;
	Wed, 05 Nov 2025 03:19:00 +0000
Date: Wed, 5 Nov 2025 11:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1930/1930]
 drivers/video/fbdev/core/sysfillrect.c:291:51: sparse: sparse: cast removes
 address space '<asn:2>' of expression
Message-ID: <202511051110.kqecU8nf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ef0390f1259df6b9ca86aa41a598fd07c29ba602
commit: 7389066b79d5dc829e15de2509e43a66bf24e296 [1930/1930] fbdev: Fix out-of-bounds issue in sys_fillrect()
config: arm64-randconfig-r134-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051110.kqecU8nf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051110.kqecU8nf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051110.kqecU8nf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/sysfillrect.c:291:51: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/video/fbdev/core/sysfillrect.c:329:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long word @@     got restricted __le64 [usertype] @@
   drivers/video/fbdev/core/sysfillrect.c:329:32: sparse:     expected unsigned long word
   drivers/video/fbdev/core/sysfillrect.c:329:32: sparse:     got restricted __le64 [usertype]
   drivers/video/fbdev/core/sysfillrect.c:329:32: sparse: sparse: cast to restricted __le64

vim +291 drivers/video/fbdev/core/sysfillrect.c

   242	
   243	void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
   244	{
   245		unsigned long pat, pat2, fg;
   246		unsigned long width = rect->width, height = rect->height;
   247		int bits = BITS_PER_LONG, bytes = bits >> 3;
   248		u32 bpp = p->var.bits_per_pixel;
   249		unsigned long *dst;
   250		int dst_idx, left;
   251		long dst_offset;
   252	
   253		if (p->state != FBINFO_STATE_RUNNING)
   254			return;
   255	
   256		if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
   257		    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
   258			fg = ((u32 *) (p->pseudo_palette))[rect->color];
   259		else
   260			fg = rect->color;
   261	
   262		pat = pixel_to_pat( bpp, fg);
   263	
   264		dst = (unsigned long *)((unsigned long)p->screen_base & ~(bytes-1));
   265		dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
   266		dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
   267		/* FIXME For now we support 1-32 bpp only */
   268		left = bits % bpp;
   269		if (p->fbops->fb_sync)
   270			p->fbops->fb_sync(p);
   271		if (!left) {
   272			void (*fill_op32)(struct fb_info *p, unsigned long *dst,
   273					  int dst_idx, unsigned long pat, unsigned n,
   274					  int bits) = NULL;
   275	
   276			switch (rect->rop) {
   277			case ROP_XOR:
   278				fill_op32 = bitfill_aligned_rev;
   279				break;
   280			case ROP_COPY:
   281				fill_op32 = bitfill_aligned;
   282				break;
   283			default:
   284				printk( KERN_ERR "cfb_fillrect(): unknown rop, "
   285					"defaulting to ROP_COPY\n");
   286				fill_op32 = bitfill_aligned;
   287				break;
   288			}
   289			while (height--) {
   290				dst += dst_idx >> (ffs(bits) - 1);
 > 291				dst_offset = (long)dst - (long)p->screen_base;
   292				if (dst_offset < 0 || dst_offset >= p->fix.smem_len) {
   293					pr_err("dst offset out of bound: dst_offset(%ld)", dst_offset);
   294					return;
   295				}
   296				dst_idx &= (bits - 1);
   297				fill_op32(p, dst, dst_idx, pat, width*bpp, bits);
   298				dst_idx += p->fix.line_length*8;
   299			}
   300		} else {
   301			int right, r;
   302			void (*fill_op)(struct fb_info *p, unsigned long *dst,
   303					int dst_idx, unsigned long pat, int left,
   304					int right, unsigned n, int bits) = NULL;
   305	#ifdef __LITTLE_ENDIAN
   306			right = left;
   307			left = bpp - right;
   308	#else
   309			right = bpp - left;
   310	#endif
   311			switch (rect->rop) {
   312			case ROP_XOR:
   313				fill_op = bitfill_unaligned_rev;
   314				break;
   315			case ROP_COPY:
   316				fill_op = bitfill_unaligned;
   317				break;
   318			default:
   319				printk(KERN_ERR "sys_fillrect(): unknown rop, "
   320					"defaulting to ROP_COPY\n");
   321				fill_op = bitfill_unaligned;
   322				break;
   323			}
   324			while (height--) {
   325				dst += dst_idx / bits;
   326				dst_idx &= (bits - 1);
   327				r = dst_idx % bpp;
   328				/* rotate pattern to the correct start position */
   329				pat2 = le_long_to_cpu(rolx(cpu_to_le_long(pat), r, bpp));
   330				fill_op(p, dst, dst_idx, pat2, left, right,
   331					width*bpp, bits);
   332				dst_idx += p->fix.line_length*8;
   333			}
   334		}
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
