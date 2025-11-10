Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F5432F749
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762799366; cv=none; b=Wnkwc3CLb2l4S/VIxrKjfVixipTj61UtWLsVZVGxW2JkHkjEYhV0+tpH4RCaJy1AM6sbwJT7bEr25M0iy36UA872Jvav9Cspw1uyk1V6xaV3gerf/OA1piKcffkA5gRb3PZxMVEZih3Nf/I2qGk3RPzACN4WWB4PQdyeIe7TkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762799366; c=relaxed/simple;
	bh=rNDZRHH8pEm/7B8i80HBHOWE64I+881Dtf2euHKNRbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PE+ykJi+feDnaXx0mIcJa3f1mcBWOHjT6jUxRA7JgdboMRVGMZp/3ptZvx/g+3srj6DlG+xGoXFHyYJ+5GchSJ29lse+PgzeTi6D1heJHaus02KGZ5IldE+JQsgo0VqESsR7VJkV7Epl1LX/P1QSADicYIphr+25wLVYt4+Aiv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhUolEoS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhUolEoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762799364; x=1794335364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rNDZRHH8pEm/7B8i80HBHOWE64I+881Dtf2euHKNRbY=;
  b=IhUolEoStqqJsFsKg5Qd/tnDjexrUsMRnD04DLYoC3u7PneOXOaRwRGa
   CxF/qhekcNruZbMUGHJG2lmrruqtnSR+Q48oYnvlnVtFBq237alOlxJQ0
   r64rvZ+Ql+Bg2PuQZ/wU0onzuKtRRPesyiiugdyR/ys5Bl3p9l3gO+Fdd
   cFGmk8dD5qhGnFtR9T1sBLbDCkzNSkSuhjy37jmcz92J/yJZ89yFXdMeM
   yljjEEnJRs8hqrHHswX/cGFzqUF3UQCAZ7lCmHvEw/ISP49/yxypYjSBG
   9nX+Y/TOYryWrZf87aw6WiEdvmlaAxMefvpLvp+s8geVKuuHBoZ6+Ab0R
   g==;
X-CSE-ConnectionGUID: 3/QkYkkqRG2JpCPi0FGUOQ==
X-CSE-MsgGUID: YYeEWt19TySD8ygzfX23pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67461224"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="67461224"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 10:29:23 -0800
X-CSE-ConnectionGUID: oFnoUaddTI6rqKTOnmaX9Q==
X-CSE-MsgGUID: WbQX4CWeQQmkkEYo/q7E0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188490806"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Nov 2025 10:29:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIWdk-0000pz-0k;
	Mon, 10 Nov 2025 18:29:20 +0000
Date: Tue, 11 Nov 2025 02:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/1] mm/gup.c:479:6: warning:
 no previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable'
Message-ID: <202511110210.BHMC1gVH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pengfei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   c6f1d967546daeefe825ba927fd1840515457f60
commit: 792718bb234ac19db3efdbc3215485e874c41584 [0/1] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
config: i386-randconfig-016-20251110 (https://download.01.org/0day-ci/archive/20251111/202511110210.BHMC1gVH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110210.BHMC1gVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110210.BHMC1gVH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:479:6: warning: no previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable' [-Wmissing-prototypes]
     479 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_trace_android_vh_mm_customize_longterm_pinnable +479 mm/gup.c

   473	
   474	/*
   475	 * trace_android_vh_mm_customize_longterm_pinnable is called in include/linux/mm.h
   476	 * by including include/trace/hooks/mm.h, which will result to build-err.
   477	 * So we create func: _trace_android_vh_mm_customize_longterm_pinnable.
   478	 */
 > 479	void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
   480			bool *is_longterm_pinnable)
   481	{
   482		trace_android_vh_mm_customize_longterm_pinnable(folio, is_longterm_pinnable);
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
