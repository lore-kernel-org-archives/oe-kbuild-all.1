Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEFB367
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 05:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721711360; cv=none; b=NaMAGEWU1kgIjslHQcLsvFRDMB15N2Cx/Kh+W5j+QN+2qatEjloYb8p2GFv8beApZQKFqmk7Gj0MRi7jNNm14jIAfGGnUeFlXAjnYi4NnMgWnpOJmE1zSIXRgtwnGkWw+iJbZNzdNmMCSDQA7mtrLy31vfuHDduT9rtIEiQCJCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721711360; c=relaxed/simple;
	bh=URkN6o9DX/CLr87jXUKGPg2GKPpl6BZvoUMoE9FgLi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDvcNe6DwdWpraLL18Qb1qjC8F2GXSgt8rxcJveLAyh3pjcjwLIZDUVH8WSvhz7M8g5dd+bDO5N+fYImYEAchZtiAuWbRmiid8U/fc1ArACp/SpTRx4GQgYqWFzAr7QXVKYg8tnRP5mPxUmEHrpJaIRWjam/+Wpiyg0Ob7kNc8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ztc+ToWu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ztc+ToWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721711359; x=1753247359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URkN6o9DX/CLr87jXUKGPg2GKPpl6BZvoUMoE9FgLi8=;
  b=Ztc+ToWu+O+Hig/tsavJbYy1q5wOrOl7rQVs10UVvlS4xIgriTxWgWrU
   4U7/TOrHPfEyOtf+LxjvvfHpNsT/P0+AwUv4BE3wUbJnCItIhnhGbxpoP
   vDpmcc4g1y8YAJ+739wPxkLuVirnTuBBt7PLF714qo99RKkW6Amt7uljH
   l/qqBkeIRnYqUB8oRnvi3AJuNJ9WjOz7ihhLEFB1kfVLvVUu+l3bFBqL0
   XiisBSWP2nf+IQQVurnkYW4aXWS5OvbyWTDd4k2cXleFCwOAJnY6SIumJ
   uCd0j3W797X8LKeGh5STehxX7WFJm59o6tOid+sD0omd50Wi3mmDL0N7b
   w==;
X-CSE-ConnectionGUID: fRO5emyCRaun9Qh7+oI4xw==
X-CSE-MsgGUID: Q5YTujg9Tyy3ys5MLBSJrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19462440"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19462440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 22:09:18 -0700
X-CSE-ConnectionGUID: 0pM33TCbQlWOYZAzrud3gg==
X-CSE-MsgGUID: qZlEitm0SU++UDfhUAxq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52720820"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jul 2024 22:09:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW7ly-000lfB-2p;
	Tue, 23 Jul 2024 05:09:14 +0000
Date: Tue, 23 Jul 2024 13:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-9e 55/55] drivers/gpu/drm/drm_print.c:193:7: error: use
 of undeclared identifier 'prefix_pad'
Message-ID: <202407231317.LlIUiTSG-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240723/202407231317.LlIUiTSG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231317.LlIUiTSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231317.LlIUiTSG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_print.c:193:7: error: use of undeclared identifier 'prefix_pad'
     193 |                            prefix_pad, prefix, vaf);
         |                            ^
>> drivers/gpu/drm/drm_print.c:193:19: error: use of undeclared identifier 'prefix'
     193 |                            prefix_pad, prefix, vaf);
         |                                        ^
   drivers/gpu/drm/drm_print.c:196:10: error: use of undeclared identifier 'prefix_pad'
     196 |                        prefix_pad, prefix, vaf);
         |                        ^
   drivers/gpu/drm/drm_print.c:196:22: error: use of undeclared identifier 'prefix'
     196 |                        prefix_pad, prefix, vaf);
         |                                    ^
   4 errors generated.


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
