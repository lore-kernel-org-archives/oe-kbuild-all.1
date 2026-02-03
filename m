Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220B4A23
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077196; cv=none; b=OHhrZwALk6dlUBqoyv7kIshNji51HlUeXedJssGjbmKtLMTd0i9TpkBnxE8Efm6m1tmrPXOzytGw0jBDuRQNIxONWzUFMT8eL4bJlA44+KSskF3UjBRHkJVk4/hLPaFeIVbjGJkxb7er9lWCwdz5+PQpUgSJ1pHwrdvbOZlUcgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077196; c=relaxed/simple;
	bh=XkzL05raeGMJMoGRl1g4LFnKOGD0VArtHTvRvtlawWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cP0MXk24rpWjeA0mT2CJVSaL/8z70fNnOej/lgux+wIc0bkp6DGU76UY41TgENhJod6TovMN4NitELJQMcdhuIqn/ME6wJ52KSOWhFS3RMX1V8FSbmzfUCV6OWwApYSqCDTzcfcuoJBk23NyTdCejT1TjEOAjJ+Gt4MUPcbJOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNxy/Wjn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNxy/Wjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770077195; x=1801613195;
  h=date:from:to:cc:subject:message-id;
  bh=XkzL05raeGMJMoGRl1g4LFnKOGD0VArtHTvRvtlawWY=;
  b=NNxy/Wjn+DcniaheRfWVDLdKdsfQyyDeRt/YNa6WJDKz8KmgVK24mugh
   f1B6czcu3P7JPNGPaTbKJ8eUt0fseU9CjfXRYjPuLgFS/tMjBjLoGEuWC
   5X0mhoOWHdfUaj534jqaWOz7ib60x+RKs4xdpqxkEMIFXxAGi+0YAk+YF
   x2QQuVNUKfFf9eC80I+IEaAqpberc1zQRHchHaxT7IMtXoOHypXIAukXd
   qZwnRg/5V6woQsdlMEV9hPdIJgGamPRFNw2VEnIuIwaQ74/2aq5A4pdSQ
   CERgZYoADlewgB/succj+MYjlNd/phkv4gaNEK+sSPiD4tZnPp8pjD2MF
   w==;
X-CSE-ConnectionGUID: 9g8WFwM2QleUeLnhq/+T/Q==
X-CSE-MsgGUID: x0jXvKtBS2SaAyvRia0gxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82613754"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="82613754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 16:06:31 -0800
X-CSE-ConnectionGUID: Mq8ldk1fSY2b2Xkbz1XzLg==
X-CSE-MsgGUID: yw6CPU7bSLOW5ik7d5brXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="214154754"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2026 16:06:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn3w3-00000000g3w-2VjP;
	Tue, 03 Feb 2026 00:06:27 +0000
Date: Tue, 03 Feb 2026 08:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 kernel/trace/trace_events.c:2807:6: warning: no previous prototype for
 'remove_event_from_tracers'
Message-ID: <202602030830.RGlyrjRu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   913aa5cde49ba2c8ff2c30fb1d404d81f7b10429
commit: 43c26111cafa87d81570c63d96c497e13ec883da [0/1] ANDROID: binder: unload C Binder trace events
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260203/202602030830.RGlyrjRu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030830.RGlyrjRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030830.RGlyrjRu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:2807:6: warning: no previous prototype for 'remove_event_from_tracers' [-Wmissing-prototypes]
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/remove_event_from_tracers +2807 kernel/trace/trace_events.c

  2806	
> 2807	void remove_event_from_tracers(struct trace_event_call *call)
  2808	{
  2809		struct trace_event_file *file;
  2810		struct trace_array *tr;
  2811	
  2812		do_for_each_event_file_safe(tr, file) {
  2813			if (file->event_call != call)
  2814				continue;
  2815	
  2816			remove_event_file_dir(file);
  2817			/*
  2818			 * The do_for_each_event_file_safe() is
  2819			 * a double loop. After finding the call for this
  2820			 * trace_array, we use break to jump to the next
  2821			 * trace_array.
  2822			 */
  2823			break;
  2824		} while_for_each_event_file();
  2825	}
  2826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
