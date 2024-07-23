Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FCD1DA22
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 02:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721703434; cv=none; b=JHGLto1J19Pi1K2Becxf1sdLETJnGeEqdUMDeubVCxTlqK/xA3IEJLCCbO64b+zPFZAw82SSgmeT8xcm0wkoGJXAwhaSGLyxr5i2Nefoe3FMxkLAV0ILB5qnLxZUywCPKEesfmeyrZX0JMezl3QuZzw6smE2+itwzBvC08Rp6uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721703434; c=relaxed/simple;
	bh=X8cJBKFCRN0fZmfeh/smN0OoqSEXRujXP3wgixAwCeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=isDTtn/cORJ3WvGFHvBdDVAQF0b/QCjw+iKEkkD/AVick3jbZ/iMkARjkHRu8aAVwaYJ2eOtkOiEz4aZI7yulaFI/ZcWyGjA0y7l2FlPEvhb/APVN6Kd5PtFHbA0mYoJC3Ggo3uv11p+S7spdLX+GqKMqjeziKox6oiD2qO85Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQM18j8A; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQM18j8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721703433; x=1753239433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8cJBKFCRN0fZmfeh/smN0OoqSEXRujXP3wgixAwCeA=;
  b=KQM18j8AAWYC9J68Lrqy8GvjasJLvxSKlYandEGD8bhtYhvKx3/V86zi
   WJ1iXyKDV94UcqKXCWXckVWEfzfmSxVnMfx+C6DWBXAY95FsEBBrYBsE1
   VkG8g/SJiOeY0yxbvZjSLi2QMhrzVZBTe+h/tZ1mA3GHgFYPntOnVY4Et
   tOHcMWYsyo3E7fQbX32DtWn+lSb1ani/hQ6whTGm2qSLb/XB8eqcvUczN
   AC1QfpJZee6SBo1RXCxfvDedrRBBLh5Y83YtbJXNlXojkmmQJRMcGY8IL
   /B3KR3ZydrLc7/ie0ybVyBhkwCuwsi7q/zHpsEZvZdXdLfDbRWfHGatuv
   w==;
X-CSE-ConnectionGUID: bjX2c92vQqSJUJ2sz62XOQ==
X-CSE-MsgGUID: hCH8zvX5SPOtJOL/WpnjjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19180317"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19180317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 19:57:12 -0700
X-CSE-ConnectionGUID: yr8eDP8DTomlnTOPJpVOaQ==
X-CSE-MsgGUID: dCWNK9ytRSu0b2PA/V323w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52826782"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jul 2024 19:57:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW5i8-000laE-0g;
	Tue, 23 Jul 2024 02:57:08 +0000
Date: Tue, 23 Jul 2024 10:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-9e 55/55] drivers/gpu/drm/drm_print.c:193:28: error:
 'prefix_pad' undeclared
Message-ID: <202407231007.ds6y11YY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-9e
head:   7e183df2c7882601296e132ddf3598e306961545
commit: 7e183df2c7882601296e132ddf3598e306961545 [55/55] fixup-mismerge-drm-print
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240723/202407231007.ds6y11YY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231007.ds6y11YY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231007.ds6y11YY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/drm_print.c:36:
   drivers/gpu/drm/drm_print.c: In function '__drm_printfn_dbg':
>> drivers/gpu/drm/drm_print.c:193:28: error: 'prefix_pad' undeclared (first use in this function)
     193 |                            prefix_pad, prefix, vaf);
         |                            ^~~~~~~~~~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/gpu/drm/drm_print.c:193:28: note: each undeclared identifier is reported only once for each function it appears in
     193 |                            prefix_pad, prefix, vaf);
         |                            ^~~~~~~~~~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
>> drivers/gpu/drm/drm_print.c:193:40: error: 'prefix' undeclared (first use in this function)
     193 |                            prefix_pad, prefix, vaf);
         |                                        ^~~~~~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~


vim +/prefix_pad +193 drivers/gpu/drm/drm_print.c

d8187177b0b195 Rob Clark   2016-11-05  181  
9fd6f61a297e94 Jani Nikula 2024-01-16  182  void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
9fd6f61a297e94 Jani Nikula 2024-01-16  183  {
9fd6f61a297e94 Jani Nikula 2024-01-16  184  	const struct drm_device *drm = p->arg;
9fd6f61a297e94 Jani Nikula 2024-01-16  185  	const struct device *dev = drm ? drm->dev : NULL;
9fd6f61a297e94 Jani Nikula 2024-01-16  186  
cf251030029594 Jim Cromie  2024-04-21  187  	if (!__drm_debug_enabled(p->category))
9fd6f61a297e94 Jani Nikula 2024-01-16  188  		return;
9fd6f61a297e94 Jani Nikula 2024-01-16  189  
9fd6f61a297e94 Jani Nikula 2024-01-16  190  	/* Note: __builtin_return_address(0) is useless here. */
9fd6f61a297e94 Jani Nikula 2024-01-16  191  	if (dev)
9fd6f61a297e94 Jani Nikula 2024-01-16  192  		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME "]%s%s %pV",
9fd6f61a297e94 Jani Nikula 2024-01-16 @193  			   prefix_pad, prefix, vaf);
9fd6f61a297e94 Jani Nikula 2024-01-16  194  	else
9fd6f61a297e94 Jani Nikula 2024-01-16  195  		printk(KERN_DEBUG "[" DRM_NAME "]%s%s %pV",
9fd6f61a297e94 Jani Nikula 2024-01-16  196  		       prefix_pad, prefix, vaf);
9fd6f61a297e94 Jani Nikula 2024-01-16  197  }
9fd6f61a297e94 Jani Nikula 2024-01-16  198  EXPORT_SYMBOL(__drm_printfn_dbg);
9fd6f61a297e94 Jani Nikula 2024-01-16  199  

:::::: The code at line 193 was first introduced by commit
:::::: 9fd6f61a297e944fa045a1cb6cd53916d0fea454 drm/print: add drm_dbg_printer() for drm device specific printer

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
