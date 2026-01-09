Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC1338590
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 23:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768002663; cv=none; b=JJ5DdarfiL9QFW24kcOcG2mDd25Faf2i0/h8i4NaZ4T9LVbL1h9bs0oGOw+5hnK+8C2o/Msf9GWG5Gcnh2yC8xcbD95WvETvs1+8ihycXkkMzLcLhtSKjpj680Im4anWoF9jSsI5ZuHxqopzOysfQEOrZBGQv46oqlNfCnBPqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768002663; c=relaxed/simple;
	bh=wg1a971ZV81p1X2cSVvs2XCqIuTQ6nIT+RVZmomxAkw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BPeS9Q05bplnswdIqqP7N4JlF9HW8zHOxYSERHpcWlzKSFzzmvM1fgmrUIT0b9Zz0Bdz+COejYaLAVcnohddOCbj7cCjOf9hFWRzt8quTs1kugbNV27bn1pAcDlZwYQHPK/hxLEFPvFlYaD+joyzT9XsHg+zrzj9ZYNn686axOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AM5RCuJj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AM5RCuJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768002662; x=1799538662;
  h=date:from:to:cc:subject:message-id;
  bh=wg1a971ZV81p1X2cSVvs2XCqIuTQ6nIT+RVZmomxAkw=;
  b=AM5RCuJjkJz7KQnw5YH2eK0zKgl2HBar6+0/h+TVU94GUn5nye6jMr9J
   Eg4HcdHz2y4GlBNyizd+3IY+Tm+phHsF1Y5ODGxeNyynmsyBMUzG6WLAq
   ewI0MADoBNsh1QWuHdBisilNDrvoTeTJx/aEYRlXU+BnKQUjiU/Sbc6Fa
   lDk1Sbsw/6hOlUKGEwh+wRBhicoRzSktGg7bXuran7hLU+I+/fE5swC6n
   qmLJZv3dmwOjSJWsWK4D7bQDYk98Adgy5QYymXsOL9XA4j0GQxjnqgd3p
   Iu/WGzV1TGJVSyNJrK24UGkfFJo+dW/hA/5Px84Q75q+cB8Dop6KOBIfp
   w==;
X-CSE-ConnectionGUID: HHJxRR4KS0S9vJq0uDvR0Q==
X-CSE-MsgGUID: DcDwEHeJS2O8v2V/bX77ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69314555"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69314555"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 15:50:59 -0800
X-CSE-ConnectionGUID: kE21eWVtTiaGhuNxGCqsEA==
X-CSE-MsgGUID: WAlGkRV3S5qRD/FLre9rxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="226938797"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2026 15:50:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veMFr-000000007r2-2iSG;
	Fri, 09 Jan 2026 23:50:55 +0000
Date: Sat, 10 Jan 2026 07:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Subject: include/uapi/linux/vbox_vmmdev_types.h:254:6: warning: field
 u within 'struct vmmdev_hgcm_function_parameter64::(unnamed at
 include/uapi/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union
 (unnamed union at include/uapi/linux/vbox_vmmdev_types.h...
Message-ID: <202601100754.L6nl4dGs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   372800cb95a35a7c40a07e2e0f7de4ce6786d230
commit: c99e1e1d0850ff157f1bc16871acd2dff5a9bcc3 vbox: add HAS_IOPORT dependency
date:   11 months ago
config: arm-randconfig-r052-20260110 (https://download.01.org/0day-ci/archive/20260110/202601100754.L6nl4dGs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100754.L6nl4dGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100754.L6nl4dGs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/virt/vboxguest/vboxguest_linux.c:15:
   In file included from include/linux/vbox_utils.h:8:
   include/uapi/linux/vbox_vmmdev_types.h:239:4: warning: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at include/uapi/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     239 |         } u;
         |           ^
>> include/uapi/linux/vbox_vmmdev_types.h:254:6: warning: field u within 'struct vmmdev_hgcm_function_parameter64::(unnamed at include/uapi/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at include/uapi/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(unnamed at include/uapi/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 warnings generated.


vim +254 include/uapi/linux/vbox_vmmdev_types.h

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

:::::: The code at line 254 was first introduced by commit
:::::: f6ddd094f5793447d594aa9f42032a7aba12b4d2 virt: Add vboxguest driver for Virtual Box Guest integration UAPI

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
