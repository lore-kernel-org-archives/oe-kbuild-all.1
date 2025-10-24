Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A98405C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315611; cv=none; b=Tps1rcaC8zW5H2K86ERaKAzJxyArB5902a9VOQfoizMQaHs1Ey7TxP0YL1B2zHfNABxznW9qOx6GeSrOjD0gpHcWmKUJaHQb9wBLaM8V0xZ6lOiVWs9YbdFaJoirABjuSLBckEKUln86TdFPqM3tzkDpcS82LpLxwPcs7heDSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315611; c=relaxed/simple;
	bh=FwQ2WK2oZZ0QQc5I+VL+tTmd9JoRVPn+Cio3pe5XBRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J8+M6giI9b0xpSJpOtZmmBDUmbkfgZLYbXnweqixCoyjy9odB03urecAU77dSJu/+FCNf7CmMkkokCN8XOkmN9R7rfpLBTlmAp7jjXIfLZyIhQ7QPkXdHK1qxZJv46s4KwnHddMFBRtkCx6y9r6BZ5WifCPkf1Gfxe9Z9WIMpzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIYW7WJM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIYW7WJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761315610; x=1792851610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FwQ2WK2oZZ0QQc5I+VL+tTmd9JoRVPn+Cio3pe5XBRg=;
  b=FIYW7WJMhI7gDGcGzi8Pgg5+wZiLXbvx8DtxlHjdxAFwCY5j69+y3HSy
   3pntN+SU9TVgHx7mPS5j9Sx4JMoWejlMPr31JYyjvYqfX0dndOlqBki14
   bZFP8S2oB2HLkYjfWM06fhxShtluvZ0NZDC6Db7BhsoAiLkl3gNINQo4B
   2Rmnb1qbJcz3yhA28FNMrnzO02413mF5MT8OvAQktVeO+cx2X1SecJv7N
   Ftt5/N5Pygcb31QEZYKaKat3Ue3HDm+zfZWuVYszLAAIe/3F0c2tvbQF8
   kdAV5s5xQM6U90LeGJT4lyD47CnA7vEFu5tn3WM5cXqBEvPenKSyxgrU7
   w==;
X-CSE-ConnectionGUID: dyL0r2EWQ9WUU+i2w+CeMg==
X-CSE-MsgGUID: 4UTsPrFETL6gOSvVXDwIVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62526760"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="62526760"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:20:07 -0700
X-CSE-ConnectionGUID: iIWhZbZPTayrvSfKAEK/ng==
X-CSE-MsgGUID: 09CyNeEtQ3eZDZxObo61Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="188733739"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Oct 2025 07:20:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCIcY-000EY9-1E;
	Fri, 24 Oct 2025 14:19:07 +0000
Date: Fri, 24 Oct 2025 22:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 336/4098]
 drivers/gpu/drm/solomon/ssd130x.c:1011:5-8: Unneeded variable: "ret". Return
 "0" on line 1024
Message-ID: <202510242255.O4cs8TXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   72fb0170ef1f45addf726319c52a0562b6913707
commit: 2258f03989afb66087538a5d6d56c18ef6532b07 [336/4098] drm/solomon: Move calls to drm_gem_fb_end_cpu*()
config: csky-randconfig-r051-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242255.O4cs8TXL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510242255.O4cs8TXL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/solomon/ssd130x.c:1011:5-8: Unneeded variable: "ret". Return "0" on line 1024
   drivers/gpu/drm/solomon/ssd130x.c:1036:5-8: Unneeded variable: "ret". Return "0" on line 1050

vim +1011 drivers/gpu/drm/solomon/ssd130x.c

b4299c936d8fd6 Javier Martinez Canillas 2023-12-29  1001  
d51f9fbd98b6d8 Javier Martinez Canillas 2023-09-13  1002  static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
45b58669e532bc Javier Martinez Canillas 2023-07-26  1003  				const struct iosys_map *vmap,
d51f9fbd98b6d8 Javier Martinez Canillas 2023-09-13  1004  				struct drm_rect *rect,
4cd24d4b1a9548 Thomas Zimmermann        2023-10-09  1005  				u8 *buf, u8 *data_array,
4cd24d4b1a9548 Thomas Zimmermann        2023-10-09  1006  				struct drm_format_conv_state *fmtcnv_state)
a61732e808672c Javier Martinez Canillas 2022-02-14  1007  {
a61732e808672c Javier Martinez Canillas 2022-02-14  1008  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
b3aca563d69bcb Thomas Zimmermann        2022-08-08  1009  	struct iosys_map dst;
4442ac1af10442 Geert Uytterhoeven       2022-03-17  1010  	unsigned int dst_pitch;
a61732e808672c Javier Martinez Canillas 2022-02-14 @1011  	int ret = 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  1012  
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  1013  	/* Align y to display page boundaries */
ec5dceb8180f0c Javier Martinez Canillas 2023-10-14  1014  	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
ec5dceb8180f0c Javier Martinez Canillas 2023-10-14  1015  	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT), ssd130x->height);
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  1016  
27564c61ab1dbd Geert Uytterhoeven       2023-07-13  1017  	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
a61732e808672c Javier Martinez Canillas 2022-02-14  1018  
b3aca563d69bcb Thomas Zimmermann        2022-08-08  1019  	iosys_map_set_vaddr(&dst, buf);
4cd24d4b1a9548 Thomas Zimmermann        2023-10-09  1020  	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
a61732e808672c Javier Martinez Canillas 2022-02-14  1021  
d51f9fbd98b6d8 Javier Martinez Canillas 2023-09-13  1022  	ssd130x_update_rect(ssd130x, rect, buf, data_array);
a61732e808672c Javier Martinez Canillas 2022-02-14  1023  
a61732e808672c Javier Martinez Canillas 2022-02-14 @1024  	return ret;
a61732e808672c Javier Martinez Canillas 2022-02-14  1025  }
a61732e808672c Javier Martinez Canillas 2022-02-14  1026  

:::::: The code at line 1011 was first introduced by commit
:::::: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomon SSD130x OLED displays

:::::: TO: Javier Martinez Canillas <javierm@redhat.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
