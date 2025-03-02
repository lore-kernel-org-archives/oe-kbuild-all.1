Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965F723F362
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740916196; cv=none; b=EBe0TwAfg+mpADRHWeCpedFU73qtvVt63XYGwnWvi2pt7MybGf5/GxeFWByEzrwvvlUGaEtpZ7Rd6XWVrOrD4DA9jAqY2nRdbaSYH30/FoDx0Ct9xPPeXUpXDBCgwmoDgQ0iGGkptGzGEC6Mu1f9Mha1FWRbkiwcC2uVjtSiruA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740916196; c=relaxed/simple;
	bh=MtvXPfYUEsuxZNsXtgyJ1YpV2uHuWHcgR1znV7/bRr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q1UwbXNMKDPvMKxyBWT4V8oGFXMw/Y8QUxKkEJMK9nlqn4vTPbX+ZDpEELiu92cxpZGD7smNeKe9kc7ZatUt7Hvyi0vjT0c0TKS+Kfqqh/aggalTQit4+2s1WJSD5oI3w0wRJg5B7mO58v3hE7V4kwJuw15/rMQPmEDa26YCn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFcVFopr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFcVFopr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740916195; x=1772452195;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MtvXPfYUEsuxZNsXtgyJ1YpV2uHuWHcgR1znV7/bRr4=;
  b=RFcVFoprlUXvv1H9jYteD8zmIl6X5uY0qDgMC0MeV0cl5Lnhzmwj0ghv
   DUTkRcIEm8vphit1HTD2bHPyf5C6w0tCY/XeMnYwGIkxcK+oC6zgJBRpU
   e5fG4wmrJe03dKiNmKCrKKm0gQGkVJkobigWWNLUwO6ZXmuqAL3k2tD13
   XCIdKLLyGJmu+AzUrnVudq2Hf9JNh+p88MNAeB3I3prWHgZ1LWs9oIWpQ
   xTOColk5qjHyPryuTksKQnmS10A73in2Fsq6qIkfRpwa9zlR7Bn3mS4ne
   k4b5a1wYW5k9f2ojCb9Ao/kxbUWUk+uPmBPI1dM8F/YSNKJy5Lsv0N6LH
   Q==;
X-CSE-ConnectionGUID: OFR4EByCRuKBxNvIUarCMQ==
X-CSE-MsgGUID: uGEFOBXhQEKOJKh48LVPgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41919713"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="41919713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 03:49:54 -0800
X-CSE-ConnectionGUID: /kWvElUHR7aB4xvk61ESVA==
X-CSE-MsgGUID: GkXPlz6zTLGfp9Pjg8CkkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117509758"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Mar 2025 03:49:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tohpJ-000HIQ-05;
	Sun, 02 Mar 2025 11:49:47 +0000
Date: Sun, 2 Mar 2025 19:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 6/6] include/drm/drm_print.h:228:31: warning:
 '%s' directive argument is null
Message-ID: <202503021906.P2MwAvyK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   067a974fd8a9ea43f97ca184e2768b583f2f8c44
commit: 067a974fd8a9ea43f97ca184e2768b583f2f8c44 [6/6] drm/xe: Add performance tunings to debugfs
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20250302/202503021906.P2MwAvyK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021906.P2MwAvyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021906.P2MwAvyK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/drm/ttm/ttm_resource.h:34,
                    from include/drm/ttm/ttm_device.h:30,
                    from drivers/gpu/drm/xe/xe_device_types.h:13,
                    from drivers/gpu/drm/xe/xe_gt_types.h:9,
                    from drivers/gpu/drm/xe/xe_tuning.c:13:
   drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
>> include/drm/drm_print.h:228:31: warning: '%s' directive argument is null [-Wformat-overflow=]
     228 |         drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
         |                               ^~~~~~
   drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of macro 'drm_printf_indent'
     226 |                 drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
         |                 ^~~~~~~~~~~~~~~~~


vim +228 include/drm/drm_print.h

e2b155e9924c39 Chris Wilson   2017-11-23  220  
bf6234a294c5b8 Noralf Trønnes 2017-11-07  221  /**
bf6234a294c5b8 Noralf Trønnes 2017-11-07  222   * drm_printf_indent - Print to a &drm_printer stream with indentation
bf6234a294c5b8 Noralf Trønnes 2017-11-07  223   * @printer: DRM printer
bf6234a294c5b8 Noralf Trønnes 2017-11-07  224   * @indent: Tab indentation level (max 5)
bf6234a294c5b8 Noralf Trønnes 2017-11-07  225   * @fmt: Format string
bf6234a294c5b8 Noralf Trønnes 2017-11-07  226   */
bf6234a294c5b8 Noralf Trønnes 2017-11-07  227  #define drm_printf_indent(printer, indent, fmt, ...) \
bf6234a294c5b8 Noralf Trønnes 2017-11-07 @228  	drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
d8187177b0b195 Rob Clark      2016-11-05  229  

:::::: The code at line 228 was first introduced by commit
:::::: bf6234a294c5b8bcc6f47ecdb646f41ad5efddd3 drm/print: Add drm_printf_indent()

:::::: TO: Noralf Trønnes <noralf@tronnes.org>
:::::: CC: Noralf Trønnes <noralf@tronnes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
