Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2618C008
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778414392; cv=none; b=tkH6UfyKIrvlWuuggGpYqWxXUTAOdlOBajGljm6mAQaHHVSWcN+NCc/tbal0tGk6oi70d2Uf+20w4lymPPxu7RCYOd8pf+KCo5B6RZt7cx7xo4+cEF/T1mq/m3ulcJ0jL0nple2qXKfAZUfdVt0MzvypFn3DhKliMYlkgjhEQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778414392; c=relaxed/simple;
	bh=yptTFJlVGCpVWXJFFAQbX7JVrqF5Jg/5D60G+4Vpvzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAHPbGU3c9PAzVmNRIFZZEgCMu5wBhwFzV+BFSEegm0FkQ49OImn1rnojjPqM4u9qtY+F1llznXahegNYNU9Tj7hMuFA8S64uqxV8xgQafl3SI6ZFxhD2Li64hMJ8L5myss62a9Zy24tMbD735ENX9PmXoujFjsz/F8+0nJ8id8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQbgDgcE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQbgDgcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778414390; x=1809950390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yptTFJlVGCpVWXJFFAQbX7JVrqF5Jg/5D60G+4Vpvzs=;
  b=jQbgDgcEthUW5L4ajh48TfrVjov7/eb5ocF+ZM/fBVm4X8KhEWJHXCVV
   0MzamyVjxtiJWeQi5Z0HT9+tr2WkfrEMnQjBsE6F5byFZVzQMic1aE/jl
   RzQazhKCm/3IqAKhcTq7GhFjuYhJqlLIiKQffpXCvNezSF3RSMw1SxwzJ
   Nx8/rxUdRJ5DOz+f4PD+TC/qq8+ugJsMfO7/Ylnq2M+REtbj2cs5APba3
   4YY/wSqPRLuF7+ChyrSavmkdZJMePkoYEHInTRubAk6sYRWXIzlUIubzy
   drucJ57H/Ns0ohwA7fiU1+awwbiYz2wZIj8Zlpf92kRUSjl+/qYrjL8K6
   g==;
X-CSE-ConnectionGUID: Vq5v4Ps6SGe025Djo0yA4w==
X-CSE-MsgGUID: 8EX5JcksS7mVryOtttckGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="96890610"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="96890610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 04:59:49 -0700
X-CSE-ConnectionGUID: pBG8ledKQB6iThFCoTEGOA==
X-CSE-MsgGUID: qN5mjW7fS8q4ltImefYZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="239022144"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 May 2026 04:59:48 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM2p0-0000000027B-2l74;
	Sun, 10 May 2026 11:59:46 +0000
Date: Sun, 10 May 2026 19:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dirga Yuza <dirgayuza123@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] platform/x86: acer-wmi: Add 4-zone RGB keyboard
 support for Acer Nitro AN515-58
Message-ID: <202605101956.GFGLqih0-lkp@intel.com>
References: <20260503062131.158944-1-dirgayuza123@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503062131.158944-1-dirgayuza123@gmail.com>

Hi Dirga,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dirga-Yuza/platform-x86-acer-wmi-Add-4-zone-RGB-keyboard-support-for-Acer-Nitro-AN515-58/20260510-030340
base:   linus/master
patch link:    https://lore.kernel.org/r/20260503062131.158944-1-dirgayuza123%40gmail.com
patch subject: [RFC PATCH] platform/x86: acer-wmi: Add 4-zone RGB keyboard support for Acer Nitro AN515-58
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605101956.GFGLqih0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101956.GFGLqih0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101956.GFGLqih0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from drivers/platform/x86/acer-wmi.c:14:
   drivers/platform/x86/acer-wmi.c: In function 'acer_wmi_poll_and_enable_zones':
   include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c:102:39: note: in expansion of macro 'GENMASK'
     102 | #define ACER_GAMING_KBL_SET_ALL_ZONES GENMASK(43, 40)
         |                                       ^~~~~~~
   drivers/platform/x86/acer-wmi.c:2793:17: note: in expansion of macro 'ACER_GAMING_KBL_SET_ALL_ZONES'
    2793 |                 ACER_GAMING_KBL_SET_ALL_ZONES,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c:102:39: note: in expansion of macro 'GENMASK'
     102 | #define ACER_GAMING_KBL_SET_ALL_ZONES GENMASK(43, 40)
         |                                       ^~~~~~~
   drivers/platform/x86/acer-wmi.c:2793:17: note: in expansion of macro 'ACER_GAMING_KBL_SET_ALL_ZONES'
    2793 |                 ACER_GAMING_KBL_SET_ALL_ZONES,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from acer-wmi.c:14:
   acer-wmi.c: In function 'acer_wmi_poll_and_enable_zones':
   include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   acer-wmi.c:102:39: note: in expansion of macro 'GENMASK'
     102 | #define ACER_GAMING_KBL_SET_ALL_ZONES GENMASK(43, 40)
         |                                       ^~~~~~~
   acer-wmi.c:2793:17: note: in expansion of macro 'ACER_GAMING_KBL_SET_ALL_ZONES'
    2793 |                 ACER_GAMING_KBL_SET_ALL_ZONES,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   acer-wmi.c:102:39: note: in expansion of macro 'GENMASK'
     102 | #define ACER_GAMING_KBL_SET_ALL_ZONES GENMASK(43, 40)
         |                                       ^~~~~~~
   acer-wmi.c:2793:17: note: in expansion of macro 'ACER_GAMING_KBL_SET_ALL_ZONES'
    2793 |                 ACER_GAMING_KBL_SET_ALL_ZONES,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +49 include/linux/bits.h

31299a5e0211241 Vincent Mailhol 2025-03-26  35  
19408200c094858 Vincent Mailhol 2025-03-26  36  /*
19408200c094858 Vincent Mailhol 2025-03-26  37   * Generate a mask for the specified type @t. Additional checks are made to
19408200c094858 Vincent Mailhol 2025-03-26  38   * guarantee the value returned fits in that type, relying on
19408200c094858 Vincent Mailhol 2025-03-26  39   * -Wshift-count-overflow compiler check to detect incompatible arguments.
19408200c094858 Vincent Mailhol 2025-03-26  40   * For example, all these create build errors or warnings:
19408200c094858 Vincent Mailhol 2025-03-26  41   *
19408200c094858 Vincent Mailhol 2025-03-26  42   * - GENMASK(15, 20): wrong argument order
19408200c094858 Vincent Mailhol 2025-03-26  43   * - GENMASK(72, 15): doesn't fit unsigned long
19408200c094858 Vincent Mailhol 2025-03-26  44   * - GENMASK_U32(33, 15): doesn't fit in a u32
19408200c094858 Vincent Mailhol 2025-03-26  45   */
19408200c094858 Vincent Mailhol 2025-03-26  46  #define GENMASK_TYPE(t, h, l)					\
19408200c094858 Vincent Mailhol 2025-03-26  47  	((t)(GENMASK_INPUT_CHECK(h, l) +			\
19408200c094858 Vincent Mailhol 2025-03-26  48  	     (type_max(t) << (l) &				\
19408200c094858 Vincent Mailhol 2025-03-26 @49  	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
19408200c094858 Vincent Mailhol 2025-03-26  50  
104ea1c84b91c9f Vincent Mailhol 2025-06-09 @51  #define GENMASK(h, l)		GENMASK_TYPE(unsigned long, h, l)
104ea1c84b91c9f Vincent Mailhol 2025-06-09  52  #define GENMASK_ULL(h, l)	GENMASK_TYPE(unsigned long long, h, l)
104ea1c84b91c9f Vincent Mailhol 2025-06-09  53  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
