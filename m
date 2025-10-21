Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1634434D93F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074263; cv=none; b=LJdNnunIFML+jU7Anfj3tdEA2oZphvYZHNlwR2UJIYs0Vj8s/4No+qzVRCEw63neayzO3oFCIQAkj1H/76tC6B0trlzgmjW4FIztQq3BMVA18sqC4ispzEEVWjPcynMc+MKJYwHOF/OT7zqOTcF/npOdW20F+7d5fmBlzyMSQCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074263; c=relaxed/simple;
	bh=V2/Qto9eiCBrX5YHeP9SN7CZ6yqjQGXRUuxF21GLxLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbYcR4mOKWpn2J14BCAff+g0HJaezX8l10T93bVkhXfuMEX7Dr/Q99IA+/FrDt07sVjiHpY7s7Rb05rZbdPKNBVhLrQtkRiM726hDW9h5WwPydbGPWQObi+bVELo/EiQMmY4Sevmh7yGHOyer3nVj7ADdWPPF1F1rWpB0qqqBTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSffvFKl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSffvFKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761074263; x=1792610263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2/Qto9eiCBrX5YHeP9SN7CZ6yqjQGXRUuxF21GLxLg=;
  b=mSffvFKlqtRtpqzuDdLZgyg9q1DRUzG2aKzUYl2JILrNZuwL2CZqqU3y
   QYfIklDSsNQ5T7tNCH0ZcS5zskX/Rkj0mkwdWOof0AiJA6szL6U+6PefF
   l8ZswQ4AH2MBlsS19GEm/i55RigQsGbDado9yVt/T+LJSxDGn4gfnfLoJ
   q2FxZGWsfO6sdWZrvUfndx0Mecl/1AkWozqqIgnzsOActyux9d/fAW6HP
   Pn1nNgf+afF8tdn5RJ07npKQehi3kr7E0qAZqrUul/wd8C3Nm/+FnY3Hj
   X+qnY+kx5WP8aTOXJjlf8YV2TpNfRgHuUwK7MG1gwlSPS1TpXgYdyVknh
   g==;
X-CSE-ConnectionGUID: RYND9NrRSy68WoRANR3BoA==
X-CSE-MsgGUID: KZTayQ0oSb+F9DSSV+4c4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85836506"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="85836506"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 12:17:42 -0700
X-CSE-ConnectionGUID: Y5Xvy62yTE6EfWym3L2WmQ==
X-CSE-MsgGUID: 9fxQJWYfQ9uxCC52500rKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183244860"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2025 12:17:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBHrI-000BFf-0Z;
	Tue, 21 Oct 2025 19:17:25 +0000
Date: Wed, 22 Oct 2025 03:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 kernel/trace/trace_events.c:2807:6: warning: no previous prototype for
 'remove_event_from_tracers'
Message-ID: <202510220327.umgvCAPD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   40a0822d3077aa3125c0b421d5716271cf88e85b
commit: 43c26111cafa87d81570c63d96c497e13ec883da [0/1] ANDROID: binder: unload C Binder trace events
config: i386-buildonly-randconfig-003-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220327.umgvCAPD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220327.umgvCAPD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220327.umgvCAPD-lkp@intel.com/

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
