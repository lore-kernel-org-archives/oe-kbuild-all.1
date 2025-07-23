Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7729726CE20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 23:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753314281; cv=none; b=Wp8cRUpM7glflfFhIVQZEuYyMOdeaDacsnEcQMp6pcKEcSJ4yfI+r0MIFD6RNx3geoqORppOmBjBX47JqdCzYRyULy84hXaAJDOFSbp0+jrXk5vsZ/V8pPSkyTbZ85RAAjXdfDf160v+AGDLigSIiRYigZagjhDodPjMMPGm9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753314281; c=relaxed/simple;
	bh=uRZC0I2PMbZxs8/2p6yZUNrvL4np1x1vR6oKZKvgcmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oXPRy9DURzIAS0LTlK+exJtA0Ob9COmgNrhZyrIqK4u8G64tt78we+NHR1y8dEGep/gb/Fxhdf6zlEJLIcqKB2pyDwuOXJPm0eb5BYQLLeRNR3kGgZT6xp34Jyld5WjG+nOY/X4fX3JTDZwliDBTZSHc6z/lui2I92GNXChFWZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYlhRN1T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYlhRN1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753314280; x=1784850280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRZC0I2PMbZxs8/2p6yZUNrvL4np1x1vR6oKZKvgcmI=;
  b=TYlhRN1TsEAslUJzOMq1CDY3h2vMLL55Dl4oeVmg9fV10HqU8OxmqDYJ
   fYFP6sSutrZlw4CMqhfvLhqEVT6Imawwi+kZxUMKYyGcjNG/gaw1HpI+C
   Js02ffMGv9jM0gOE8JrngeYu1W4UPLXqVbqDFjca61X9dvflNibCZGcXt
   jmUcJYdAPzvPhjpAWffBACnU3tZuu9VMzyP+C5Wta520Bb1xeRQ/4TOTy
   1wR+DiZd+AaOuY3drBoxbu5GunCREZ6d/jCDsQbpFumiUh0P506MhFa5A
   p31eZ5X+HGj3/9z6fGlO83o0+vq+Tb/2OdfDTjuqo0YuiBHfmLrEdkxOv
   g==;
X-CSE-ConnectionGUID: MADlYhZ0Rd25gAqMIt+KXA==
X-CSE-MsgGUID: z+tQOni/TP+Y7BHYGwHmFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55555162"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="55555162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 16:44:36 -0700
X-CSE-ConnectionGUID: nojacTDPT6ObVAmX4iD1sw==
X-CSE-MsgGUID: nPSX8+ynTeeJCy0QzjofCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159844699"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2025 16:44:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uej8S-000JtN-24;
	Wed, 23 Jul 2025 23:44:32 +0000
Date: Thu, 24 Jul 2025 07:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: include/uapi/linux/vbox_vmmdev_types.h:239:4: warning: field u
 within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union
 (unnamed union at include/uapi/linux/vbox_vmmdev_types.h:223:2)' and is
 usually due to 'struct vmmdev_hgcm_function...
Message-ID: <202507240731.jgaW3v2n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   01a412d06bc5786eb4e44a6c8f0f4659bd4c9864
commit: c99e1e1d0850ff157f1bc16871acd2dff5a9bcc3 vbox: add HAS_IOPORT dependency
date:   5 months ago
config: arm-randconfig-r122-20250724 (https://download.01.org/0day-ci/archive/20250724/202507240731.jgaW3v2n-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce: (https://download.01.org/0day-ci/archive/20250724/202507240731.jgaW3v2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240731.jgaW3v2n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/virt/vboxguest/vboxguest_linux.c:15:
   In file included from include/linux/vbox_utils.h:8:
>> include/uapi/linux/vbox_vmmdev_types.h:239:4: warning: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at include/uapi/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     239 |         } u;
         |           ^
>> include/uapi/linux/vbox_vmmdev_types.h:254:6: warning: field u within 'struct vmmdev_hgcm_function_parameter64::(unnamed at include/uapi/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at include/uapi/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(unnamed at include/uapi/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 warnings generated.


vim +239 include/uapi/linux/vbox_vmmdev_types.h

f6ddd094f57934 Hans de Goede 2017-11-30  219  
f6ddd094f57934 Hans de Goede 2017-11-30  220  /** HGCM function parameter, 32-bit client. */
f6ddd094f57934 Hans de Goede 2017-11-30  221  struct vmmdev_hgcm_function_parameter32 {
f6ddd094f57934 Hans de Goede 2017-11-30  222  	enum vmmdev_hgcm_function_parameter_type type;
f6ddd094f57934 Hans de Goede 2017-11-30  223  	union {
f6ddd094f57934 Hans de Goede 2017-11-30  224  		__u32 value32;
f6ddd094f57934 Hans de Goede 2017-11-30  225  		__u64 value64;
f6ddd094f57934 Hans de Goede 2017-11-30  226  		struct {
f6ddd094f57934 Hans de Goede 2017-11-30  227  			__u32 size;
f6ddd094f57934 Hans de Goede 2017-11-30  228  			union {
f6ddd094f57934 Hans de Goede 2017-11-30  229  				__u32 phys_addr;
f6ddd094f57934 Hans de Goede 2017-11-30  230  				__u32 linear_addr;
f6ddd094f57934 Hans de Goede 2017-11-30  231  			} u;
f6ddd094f57934 Hans de Goede 2017-11-30  232  		} pointer;
f6ddd094f57934 Hans de Goede 2017-11-30  233  		struct {
f6ddd094f57934 Hans de Goede 2017-11-30  234  			/** Size of the buffer described by the page list. */
f6ddd094f57934 Hans de Goede 2017-11-30  235  			__u32 size;
f6ddd094f57934 Hans de Goede 2017-11-30  236  			/** Relative to the request header. */
f6ddd094f57934 Hans de Goede 2017-11-30  237  			__u32 offset;
f6ddd094f57934 Hans de Goede 2017-11-30  238  		} page_list;
f6ddd094f57934 Hans de Goede 2017-11-30 @239  	} u;
f6ddd094f57934 Hans de Goede 2017-11-30  240  } __packed;
f6ddd094f57934 Hans de Goede 2017-11-30  241  VMMDEV_ASSERT_SIZE(vmmdev_hgcm_function_parameter32, 4 + 8);
f6ddd094f57934 Hans de Goede 2017-11-30  242  
f6ddd094f57934 Hans de Goede 2017-11-30  243  /** HGCM function parameter, 64-bit client. */
f6ddd094f57934 Hans de Goede 2017-11-30  244  struct vmmdev_hgcm_function_parameter64 {
f6ddd094f57934 Hans de Goede 2017-11-30  245  	enum vmmdev_hgcm_function_parameter_type type;
f6ddd094f57934 Hans de Goede 2017-11-30  246  	union {
f6ddd094f57934 Hans de Goede 2017-11-30  247  		__u32 value32;
f6ddd094f57934 Hans de Goede 2017-11-30  248  		__u64 value64;
f6ddd094f57934 Hans de Goede 2017-11-30  249  		struct {
f6ddd094f57934 Hans de Goede 2017-11-30  250  			__u32 size;
f6ddd094f57934 Hans de Goede 2017-11-30  251  			union {
f6ddd094f57934 Hans de Goede 2017-11-30  252  				__u64 phys_addr;
f6ddd094f57934 Hans de Goede 2017-11-30  253  				__u64 linear_addr;
f6ddd094f57934 Hans de Goede 2017-11-30 @254  			} u;
f6ddd094f57934 Hans de Goede 2017-11-30  255  		} __packed pointer;
f6ddd094f57934 Hans de Goede 2017-11-30  256  		struct {
f6ddd094f57934 Hans de Goede 2017-11-30  257  			/** Size of the buffer described by the page list. */
f6ddd094f57934 Hans de Goede 2017-11-30  258  			__u32 size;
f6ddd094f57934 Hans de Goede 2017-11-30  259  			/** Relative to the request header. */
f6ddd094f57934 Hans de Goede 2017-11-30  260  			__u32 offset;
f6ddd094f57934 Hans de Goede 2017-11-30  261  		} page_list;
f6ddd094f57934 Hans de Goede 2017-11-30  262  	} __packed u;
f6ddd094f57934 Hans de Goede 2017-11-30  263  } __packed;
f6ddd094f57934 Hans de Goede 2017-11-30  264  VMMDEV_ASSERT_SIZE(vmmdev_hgcm_function_parameter64, 4 + 12);
f6ddd094f57934 Hans de Goede 2017-11-30  265  

:::::: The code at line 239 was first introduced by commit
:::::: f6ddd094f5793447d594aa9f42032a7aba12b4d2 virt: Add vboxguest driver for Virtual Box Guest integration UAPI

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
