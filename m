Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268517BA4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709316578; cv=none; b=YszW/H8gxcl+59T2rc4v4qJaafoqTZ6JmMDAvAdB50MxQm4W1frigfa1FLA6yA0HKZWBPeTj+P8oyPc3cN6P0Ess/4A9G3zSw7B2NnceUeEq0LT0CTcuTggJL7f73b7wr2s1cDSnygXV5wl834bameQZpQ8eHF3Z6VJ8a6MLK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709316578; c=relaxed/simple;
	bh=Tukxh2ZglRtp2a242QzOtxWe+oTtweK6AVn8FiZJUvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDnsNqqZBvJMQ4ahnfVtalqma8rmYdFRpkpCL9U+jDcMUnSU+L3xQQyjl+kVUL2qx+BYzYKgoMfqH8Bx8VgEweOFy10ygxwPvniZJqM7x6q5yA0ij0Va9JPMJYbreAo5cvhEzs1BFk1yC3/h5mxhw6Z2IwpzmQSwlJ6cKoYQn5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBnBjSyD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBnBjSyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709316577; x=1740852577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tukxh2ZglRtp2a242QzOtxWe+oTtweK6AVn8FiZJUvQ=;
  b=mBnBjSyDw3ZsH3GSh2QzCx3Lsz+k2jGYoV8QblZdHbWkOHMtthTa+oqk
   zxtvH73NCLX7QXXZsN/LoAVs+6eoVZ+egzH1Bkf4KPxE1K3YGbxv5eQ5c
   AOS7srktyQvszz+PhzNQTUhS5s5wZ95Otm80bGb3yRYSH831B2IPFcRqV
   xnvrEj/89F7rgYTeLDex9MwhZ7sAJ2Dr9eUEcu5Eg3+mYs7uW5zofb/mZ
   0H+WFT1Mvt9m8zZdIQhmVG4A28HbggPFrZZn/NST6q1v2dQ2tbJQcax7o
   Rm3RFA83gR8AmUrgLoonsQ8O/sOOMlkayiB/ociacIqGqY76KxMWZF8iW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3991666"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3991666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 10:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="12819607"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2024 10:09:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg7Jj-000E1Z-0p;
	Fri, 01 Mar 2024 18:09:15 +0000
Date: Sat, 2 Mar 2024 02:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 2/2]
 drivers/usb/gadget/function/android_f_midi_info.h:96:20: warning:
 'android_remove_midi_device' used but never defined
Message-ID: <202403020238.HklsZtnU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   79d40fcc7f981896f569f51e4c48058128a710ec
commit: 79d40fcc7f981896f569f51e4c48058128a710ec [2/2] ANDROID: usb: gadget: f_midi: Create f_midi device in android_usb class
config: i386-randconfig-011-20240301 (https://download.01.org/0day-ci/archive/20240302/202403020238.HklsZtnU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020238.HklsZtnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020238.HklsZtnU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/usb/composite.h:30,
                    from drivers/usb/gadget/function/u_midi.h:16,
                    from drivers/usb/gadget/function/f_midi.c:38:
   include/linux/usb/android_configfs_uevent.h: In function 'android_remove_function_device':
   include/linux/usb/android_configfs_uevent.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
      55 | }
         | ^
   In file included from drivers/usb/gadget/function/u_midi.h:17,
                    from drivers/usb/gadget/function/f_midi.c:38:
   drivers/usb/gadget/function/f_midi.c: At top level:
>> drivers/usb/gadget/function/android_f_midi_info.h:96:20: warning: 'android_remove_midi_device' used but never defined
      96 | static inline void android_remove_midi_device(struct f_midi_info *ctx);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/usb/composite.h:30,
                    from drivers/usb/gadget/legacy/gmidi.c:26:
   include/linux/usb/android_configfs_uevent.h: In function 'android_remove_function_device':
   include/linux/usb/android_configfs_uevent.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
      55 | }
         | ^
   In file included from drivers/usb/gadget/function/u_midi.h:17,
                    from drivers/usb/gadget/legacy/gmidi.c:29:
   drivers/usb/gadget/legacy/gmidi.c: At top level:
>> drivers/usb/gadget/function/android_f_midi_info.h:96:20: warning: 'android_remove_midi_device' declared 'static' but never defined [-Wunused-function]
      96 | static inline void android_remove_midi_device(struct f_midi_info *ctx);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/android_remove_midi_device +96 drivers/usb/gadget/function/android_f_midi_info.h

    95	
  > 96	static inline void android_remove_midi_device(struct f_midi_info *ctx);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
