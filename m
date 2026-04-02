Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE23793C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115248; cv=none; b=V39slWLKVcqXI2GyKY+mE93/Latt32bTE6UMgqfYEO4AUwULvsOZ3wWGMyYcmegKFuJdYbPL7CqBbCMW7o5YLRlafT1s14rxqRusehBrIt+HCp9tERKQTEemZJnOF3QEWUDXzDS4dZ8QZkCxADkmpZQXOOsXM1cNYLxWbyq5Z1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115248; c=relaxed/simple;
	bh=kdXNh45BSn6P4i4/3/wi+IVwhRHzQ/WRcJXec0BKvgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDjSnckErWjDtA6tGaPrIpTQ8uup6o5BqvykvNzpPBOdPPPKYRlnoq0ywq7Xbvn5avx0Wj9CqDcGYYVNLvXvHNvsfOJZ+Dg32rvwIKwWqMPv7A+RceNYGiqXJrc1N3AqdyMBVlPiq4SuT7mwQ1Lgljtxlz/3jCnMIt1plJUL6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRNcno6Q; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRNcno6Q"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d02a71526so323338f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Apr 2026 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775115245; x=1775720045; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZhiUflwFUy2WPcGP8HzTbxOEv4skJ+nnW3yRKJvYww=;
        b=WRNcno6Qqsotpv2pC0K/L1xa6RkjnBOGp4QfkgQ+fRZFFmwAocP5u/rRvXv6lOfD3H
         lWQVs268YGNlIQkeei3WdbFP5n3GEtpyQ3KPmPnNbZ/KvEexyPrUeCgkQCnxaOGEy5s9
         u3I4qdW7KmmG/KCV4jCglZiFnGxomEh0YByHBtvKxRyDjvWkO6WTuRKov/pU2yrg7rKY
         ye2ggsbMfRrkjCuHOnK2A1Xhz+VWM29L4sUvtUTHGezIYN5Pip6WrVSEn5Nzq85VmKXQ
         MlfF671/AgmLak/TTU9S7uhTkFS9R1ID3X0E8MFPJnpSCz1TTF+enfKw7kNDP/5dCIxz
         7dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775115245; x=1775720045;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZhiUflwFUy2WPcGP8HzTbxOEv4skJ+nnW3yRKJvYww=;
        b=TwfhHeHAUAeJ1AEXUhWrMPHg3nw4PQyzAh6uvMPSrH0XPPn2IPpzO4eDjkefajPQ2Z
         MClFAq1Ak2NyAQCDhmcHsVSrj9JR5yCJL+exILAbc3jNfQ54G3LBYABok3qa17JUa8FR
         oYoz29qMU3U2SaRaxxAowTqQAZe6esaOtSM41yztIUjqe8stMFtIXNm30G5WeszXNoUf
         gcAXPtGqQrPBRwq1jWAWOIVx9AN7dnWhf4410T7EL1Oks+MtOhoTxkqJHzn9E5nM9JOW
         NN1VGiUomHwfCEPUvWk10EOo2+e8DW8/26INLhHBBjH3tkrVzidemAAE4zUhL8AJTa/k
         4ulQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXkm6/M103oN3n0ATULu7HXuCCS1TcJCnZmjFnXkFF5MxZ/0rqICVar3sE9ZG8sSsdeA/Zqi4N7qhTJYDP@lists.linux.dev
X-Gm-Message-State: AOJu0YyGxcwdFRIT2jDnrJ1gW7HhZa4MxTpQjgeh6yov9t1ThIn6wGWH
	2I8VscNHSFkZUdre8RCv1VDvgO6eeT0pZnrpb2WuWxi0GGl4gHkxq7gf
X-Gm-Gg: ATEYQzwkNCSyK4JWy87d5T8QvpAVkKkcuF0RYlwTkt3tREZ4lnL87CtbNyJy4BLKJUQ
	tYcBjIKTBa4Om+z3YaGE0AhniZHUTyzZRPPy2ClQB6edq8qwRZF4gRCSBANYDVYwuIfwDBYv7G4
	dHz1OrCl7t9AI3y/ESWQDymqfXoITzFEh9MAnsEA5iqDe6Ye1iODgOXTGEwctH7uaJxDc962iaS
	FTvzb8rfNZ5qGVGHr7Id+TklF/exA0CP9bP9bBWTHmWHjOajgurKs6CDJZEoMOfvaOJQIw0hQQx
	5irvXvrbNaBxdbBo14bL5d6wJeyYCwVl0YwL+2VQSoW/7Hox/VmzccilMfCB6C8SA0mADtNJH47
	rtPhnSbJaEoJL9DeUvDzJOilHlVDjPalu7bkP3FHWE4M7Cf3dwvlHOJ73o9QkVwbIfB6eLXIPuo
	eXepzbSkOJmKjpzPo9pf4=
X-Received: by 2002:a05:6000:40cb:b0:43d:b99:bdcc with SMTP id ffacd0b85a97d-43d150dd744mr12121013f8f.26.1775115244942;
        Thu, 02 Apr 2026 00:34:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e6224sm6005807f8f.25.2026.04.02.00.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:34:04 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:34:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 38/96]
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c:1126 omapfb_mmap() warn:
 inconsistent returns '&rg->lock'.
Message-ID: <202604012338.d8PQexIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/bvanassche/linux thread-safety
head:   c1607d2e734438927b2e2174f2af3912dbdb7e8b
commit: bfb7ef5272e9ee11e27416642e2cfdf1961eb4f8 [38/96] fbdev/omap2: Make the source code easier to analyze
config: arm64-randconfig-r072-20260401
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 585e2a015b29c1a53c4acddeda1b64b3fb3aac39)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604012338.d8PQexIR-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/omap2/omapfb/omapfb-main.c:1126 omapfb_mmap() warn: inconsistent returns '&rg->lock'.

vim +1126 drivers/video/fbdev/omap2/omapfb/omapfb-main.c

b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1089  static int omapfb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1090  {
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1091  	struct omapfb_info *ofbi = FB2OFB(fbi);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1092  	struct fb_fix_screeninfo *fix = &fbi->fix;
bfb7ef5272e9ee drivers/video/fbdev/omap2/omapfb/omapfb-main.c Bart Van Assche   2026-02-06  1093  	struct omapfb2_mem_region *rg = ofbi->region;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1094  	unsigned long start;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1095  	u32 len;
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1096  	int r;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1097  
76f92201b821dd drivers/video/fbdev/omap2/omapfb/omapfb-main.c Thomas Zimmermann 2023-11-27  1098  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
76f92201b821dd drivers/video/fbdev/omap2/omapfb/omapfb-main.c Thomas Zimmermann 2023-11-27  1099  
bfb7ef5272e9ee drivers/video/fbdev/omap2/omapfb/omapfb-main.c Bart Van Assche   2026-02-06  1100  	omapfb_get_mem_region(rg);
078ff546a806b2 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1101  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1102  	start = omapfb_get_region_paddr(ofbi);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1103  	len = fix->smem_len;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1104  
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1105  	DBG("user mmap region start %lx, len %d, off %lx\n", start, len,
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1106  			vma->vm_pgoff << PAGE_SHIFT);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1107  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1108  	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1109  	vma->vm_ops = &mmap_user_ops;
078ff546a806b2 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1110  	vma->vm_private_data = rg;
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1111  
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1112  	r = vm_iomap_memory(vma, start, len);
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1113  	if (r)
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1114  		goto error;
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1115  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1116  	/* vm_ops.open won't be called for mmap itself. */
078ff546a806b2 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1117  	atomic_inc(&rg->map_count);
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1118  
3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1119  	omapfb_put_mem_region(rg);
3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1120  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1121  	return 0;
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1122  
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1123  error:
3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1124  	omapfb_put_mem_region(ofbi->region);

This is a false positive, but it would be cleaner to change this
as well: s/omapfb_put_mem_region(ofbi->region)/omapfb_put_mem_region(rg)/

3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1125  
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17 @1126  	return r;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1127  }
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
