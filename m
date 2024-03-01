Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3ED46B3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312186; cv=none; b=ZSwFZpBvjDYgaPWeWYPE3tPbmG9iiTAAmtLiZpu3Qs0vmf4qZvMFE8TmYrM1vbWkBMpHsU2sYEW+Kozqp48C3iQaPClilXUixUX90zCmmMd63mFrDRlG8ftn9NQn0QsXgJDc3yjAm1BFrwBcBG4LnAIkPeL0cC7lT0IDpk2xIEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312186; c=relaxed/simple;
	bh=phvljXsRR48ryGmVzUz4mGSSBtNroHzk9MiXMtUxuoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZO2O0rNTmavzb8sWUBBQ8aJJgpEcn39XJ0iJRTBpEIVw6v873xKzwspoP0QeFhz14eKsRhf81AqNVNi7jkeFaIHsLNpISE5LyiSRzAK3dClNsvDqeDk8XoDxBTi20TTBVHUTC5dMoiah4Ju6HaNxyJQ4Nm+Rltt+cDybUnJ+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FokfDJPp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FokfDJPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709312185; x=1740848185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phvljXsRR48ryGmVzUz4mGSSBtNroHzk9MiXMtUxuoo=;
  b=FokfDJPpyuq9jwctvskK4qPfVpvLjzX5+hKe0vUQgaX563JZt7PbwHXJ
   PKByB55meyajHqcFKU3MUG7r/epjLn/Uuq76Bgw0doE3sNmoq777DjzH8
   4hLwc9ihF04ngIjrNoBV3TaYzmP7Cs0GrrZYw0Aq8NYRyXtNoYzoogGOA
   W0DxguHKzD2bJeKw9u0+5VsVR9EyLDsTZkGX31K2zU8WZd/MeVPdi5SJ6
   cl4Ik3HctSQ+df3oXdw8xV/P9PmFw0Ifx+zPOZVi7QW0Ihw3etgDDyYsF
   pgHGztC3LoL4VmS07OGhD9cN83xQKIx8y3PKmQquTRBD21ygadF/F0aJ6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3723474"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3723474"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 08:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8146183"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2024 08:56:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg6BG-000Dyf-0G;
	Fri, 01 Mar 2024 16:56:19 +0000
Date: Sat, 2 Mar 2024 00:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/2]
 drivers/usb/gadget/android_configfs_uevent.c:186:6: warning: no previous
 prototype for function '__android_set_connected'
Message-ID: <202403020010.XZdplvLP-lkp@intel.com>
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
commit: 5e9a404dff899b6f6586f99fb19e90d598ae2d6d [1/2] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240302/202403020010.XZdplvLP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020010.XZdplvLP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020010.XZdplvLP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/android_configfs_uevent.c:28:7: warning: variable 'configured' set but not used [-Wunused-but-set-variable]
      28 |         bool configured = false;
         |              ^
>> drivers/usb/gadget/android_configfs_uevent.c:186:6: warning: no previous prototype for function '__android_set_connected' [-Wmissing-prototypes]
     186 | void __android_set_connected(struct android_uevent_opts *opts, bool connected)
         |      ^
   drivers/usb/gadget/android_configfs_uevent.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | void __android_set_connected(struct android_uevent_opts *opts, bool connected)
         | ^
         | static 
>> drivers/usb/gadget/android_configfs_uevent.c:199:6: warning: no previous prototype for function '__android_set_configured' [-Wmissing-prototypes]
     199 | void __android_set_configured(struct android_uevent_opts *opts, bool configured)
         |      ^
   drivers/usb/gadget/android_configfs_uevent.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     199 | void __android_set_configured(struct android_uevent_opts *opts, bool configured)
         | ^
         | static 
   3 warnings generated.


vim +/__android_set_connected +186 drivers/usb/gadget/android_configfs_uevent.c

   185	
 > 186	void __android_set_connected(struct android_uevent_opts *opts, bool connected)
   187	{
   188		unsigned long flags;
   189	
   190		spin_lock_irqsave(&opts_lock, flags);
   191		// Don't send the uevent if connected state is not changed
   192		if (opts->connected != connected) {
   193			opts->connected = connected;
   194			schedule_work(&opts->work);
   195		}
   196		spin_unlock_irqrestore(&opts_lock, flags);
   197	}
   198	
 > 199	void __android_set_configured(struct android_uevent_opts *opts, bool configured)
   200	{
   201		unsigned long flags;
   202	
   203		spin_lock_irqsave(&opts_lock, flags);
   204		// Don't send the uevent if configure state is not changed
   205		if (opts->configured != configured) {
   206			opts->configured = configured;
   207			schedule_work(&opts->work);
   208		}
   209		spin_unlock_irqrestore(&opts_lock, flags);
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
