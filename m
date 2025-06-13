Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D91E485
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 00:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749775820; cv=none; b=X/C+r3/bEB3ObphteX3JqE/x5qBt1vCgLaDVdk4MhWO/jv47DzBoIjWp5m7HAJWSFpfV1OhCZXL8KNyKpP+0wdDEPqfI8+NeP6aEZ19KfRHW2Dk2NossB7sU0XjTzkkIFh71gzlTBFuQwdEyLbgANJk6hXaIOndZGFN6VQaAmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749775820; c=relaxed/simple;
	bh=n/tzkcjxQurXmIhQv3/oUoInP97JmfUJYFrpuVEApwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXpsjqG6AlrKBhBqd2JP/27MxGW/Gul0sXnlVYKXvuvE9gsrx1fzubkJH0RV/bp0nJNvmIpRClRATQNqlhHRje8ppCJzMpWSS688oMQRR7v/141cfhwr4nyeMphvmWxG6KSelAaQ8nsLBiJo2khYdt6b8yDx2/XZBHsWgCWVaFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4601jNh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4601jNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749775820; x=1781311820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/tzkcjxQurXmIhQv3/oUoInP97JmfUJYFrpuVEApwI=;
  b=A4601jNhdex9aFHLOwfLQ5hi1uGH8yFVZK0tiCO5Cs0oNIjviH1sh0qw
   UKqo6Igd8tkVD6ZzU4Qxy8cvbGBj1VO+ZhGL8jKXBRB83MWKs+wPauelj
   SNHBn4G3t4CKSAqvy3rCMJNf37mXKqbfubBXI0meNMfwOPlKf7cSK/sEw
   LKNAABULaB9C7F6PbVkH/0nxkS5Du/IxsiqAVGvFmSf/kYhzk3cBi+N/m
   9G0CyG/alqoYU5khIcfxUI8zgHvCixkRGji9LMF1zorKC1+/6WdDpJ/u4
   pwoe0TI60EtuWzplhbnD3EVjirr9aVqmwEsKjz/8Gfw0SPIFVG0rwlHrI
   A==;
X-CSE-ConnectionGUID: 4Gg8w2lNTq6zarFAH1MsjA==
X-CSE-MsgGUID: i6PIqRZ6Rk632vwChyYO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63332790"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="63332790"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:50:18 -0700
X-CSE-ConnectionGUID: 91a0adgZQ3elK37Jml+/3Q==
X-CSE-MsgGUID: lcoyOosTQYCa2P7l5ldGvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152448643"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 17:50:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPscY-000C40-1D;
	Fri, 13 Jun 2025 00:50:14 +0000
Date: Fri, 13 Jun 2025 08:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/9] drm/xe/xe3: Add support for graphics IP version
 30.03
Message-ID: <202506130839.TGVWYv72-lkp@intel.com>
References: <20250612203448.2948795-3-dnyaneshwar.bhadane@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612203448.2948795-3-dnyaneshwar.bhadane@intel.com>

Hi Dnyaneshwar,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250612]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes v6.16-rc1 v6.15 v6.15-rc7 linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dnyaneshwar-Bhadane/drm-i915-xe3lpd-Add-support-for-display-version-30-02/20250613-043615
base:   next-20250612
patch link:    https://lore.kernel.org/r/20250612203448.2948795-3-dnyaneshwar.bhadane%40intel.com
patch subject: [PATCH v5 2/9] drm/xe/xe3: Add support for graphics IP version 30.03
config: arc-randconfig-002-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130839.TGVWYv72-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130839.TGVWYv72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130839.TGVWYv72-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_wa.c:861:
>> drivers/gpu/drm/xe/generated/xe_wa_oob.c:102:34: error: unterminated argument list invoking macro "XE_RTP_RULES"
     102 |         GRAPHICS_VERSION(3003) },
         |                                  ^
>> drivers/gpu/drm/xe/generated/xe_wa_oob.c:100:3: error: 'XE_RTP_RULES' undeclared here (not in a function)
     100 |   XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3001), OR,
         |   ^~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_wa.c:862:9: error: expected '}' before '{' token
     862 |         {}
         |         ^
   drivers/gpu/drm/xe/generated/xe_wa_oob.c:99:1: note: to match this '{'
      99 | { XE_RTP_NAME("16026508708"),
         | ^
   drivers/gpu/drm/xe/xe_wa.c:863:2: error: expected '}' before ';' token
     863 | };
         |  ^
   drivers/gpu/drm/xe/xe_wa.c:860:61: note: to match this '{'
     860 | static __maybe_unused const struct xe_rtp_entry oob_was[] = {
         |                                                             ^
>> drivers/gpu/drm/xe/xe_wa.c:653:37: warning: 'lrc_was' defined but not used [-Wunused-const-variable=]
     653 | static const struct xe_rtp_entry_sr lrc_was[] = {
         |                                     ^~~~~~~
>> drivers/gpu/drm/xe/xe_wa.c:296:37: warning: 'engine_was' defined but not used [-Wunused-const-variable=]
     296 | static const struct xe_rtp_entry_sr engine_was[] = {
         |                                     ^~~~~~~~~~
>> drivers/gpu/drm/xe/xe_wa.c:101:37: warning: 'gt_was' defined but not used [-Wunused-const-variable=]
     101 | static const struct xe_rtp_entry_sr gt_was[] = {
         |                                     ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
