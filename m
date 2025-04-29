Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F977F477
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745954576; cv=none; b=i2jxFxj9DwE+vw4qkV3gd0wfPTRbkx2vwVJqXNdFCUpAJnuonLL7gHapRPqAvYRtEa1KOBrUfIQPDjeyGvevVWsC9y2Hq9rdUdjEbDcycX+tlcVoR3+fUokjn/g69gxpD2XImHMo47CEcXgzjNe+iCevXJnvcJfHIt2b0UKqMSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745954576; c=relaxed/simple;
	bh=YcUZOph+vi1JMoxBMxqE5XidCdTwwyCrEnHNb+fJhHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqAsbqYWcyfdh/p8DKPrE959sX4duiZEXDaV4mdOWnLXBZIM2E/gjYzfIK9iURnYv/Zc7EmlVUu7DWsspOerKhIRKGw7TRt2bbLtzqSEUDSR3Tp4nluCoSdqsBVtwmv+V8r8zXdOn2vywIEnSBxHJ3lMUov7p6GIZHWVPVbkcbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7EOynUi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7EOynUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745954574; x=1777490574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YcUZOph+vi1JMoxBMxqE5XidCdTwwyCrEnHNb+fJhHg=;
  b=H7EOynUidYRMW42FcqQsLZ7vq5SjWrt0bHNpDcs/jfvhwGKxG51ZKNtZ
   54vfbY5DHiLrOtg4c4qIhytByuYOLeMR3mtQ5tIM2tdlvuwvMFbHQgrp2
   47wPZqIE8CeQtr81X/SqHXQd3UHEwm0o8coFajOMZ4YTyFmMf0DJMRE7f
   DAouo1P65mLPJ1N/qKp3tz33gcw3BOj/YXVcj8YLeQB9lOUg31QjDH5bb
   yzgW40IyHUnvaxJq05WF46NH1LqeGCLr4ua9ALX5ikBePsfXxC9KcTc92
   CqQ0KcMYbni5G+ql8OcSF7EE96JX+37eNT9l1Ad4quSSncFtFC8jKkLVm
   Q==;
X-CSE-ConnectionGUID: GqNIb9sTSMe4cHUWuxSnDQ==
X-CSE-MsgGUID: ncsnEfM8SYezBb9XbMwxFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72977598"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="72977598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 12:22:54 -0700
X-CSE-ConnectionGUID: Vf/aCDgZTxmDj11hBTY6vA==
X-CSE-MsgGUID: 1ymtwczVSjioKglvUmLG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134411779"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 12:22:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9qXa-0002s5-0R;
	Tue, 29 Apr 2025 19:22:50 +0000
Date: Wed, 30 Apr 2025 03:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [sudeep-holla:for-next/scmi/updates 17/17]
 drivers/firmware/arm_scmi/quirks.c:108:28: error: implicit declaration of
 function '__VA_OPT__'; did you mean '__VFP_FP__'?
Message-ID: <202504300332.AsMrfPIt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi/updates
head:   02db811992b0a3f7234155a9947333c360b67e3d
commit: 02db811992b0a3f7234155a9947333c360b67e3d [17/17] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
config: arm-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300332.AsMrfPIt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300332.AsMrfPIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300332.AsMrfPIt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/quirks.c:108:28: error: implicit declaration of function '__VA_OPT__'; did you mean '__VFP_FP__'? [-Werror=implicit-function-declaration]
      .compats = { __VA_ARGS__ __VA_OPT__(,) NULL },  \
                               ^
   drivers/firmware/arm_scmi/quirks.c:156:2: note: in expansion of macro '__DEFINE_SCMI_QUIRK_ENTRY'
     __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/quirks.c:170:1: note: in expansion of macro 'DEFINE_SCMI_QUIRK'
    DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
    ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_scmi/quirks.c:108:39: error: expected expression before ',' token
      .compats = { __VA_ARGS__ __VA_OPT__(,) NULL },  \
                                          ^
   drivers/firmware/arm_scmi/quirks.c:156:2: note: in expansion of macro '__DEFINE_SCMI_QUIRK_ENTRY'
     __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/quirks.c:170:1: note: in expansion of macro 'DEFINE_SCMI_QUIRK'
    DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
    ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/quirks.c: In function 'scmi_quirk_signature':
   drivers/firmware/arm_scmi/quirks.c:206:10: error: implicit declaration of function 'partial_name_hash' [-Werror=implicit-function-declaration]
      hash = partial_name_hash(tolower(*p++), hash);
             ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/quirks.c:207:11: error: implicit declaration of function 'end_name_hash' [-Werror=implicit-function-declaration]
     hash32 = end_name_hash(hash);
              ^~~~~~~~~~~~~
   drivers/firmware/arm_scmi/quirks.c:209:2: error: implicit declaration of function 'kfree'; did you mean '__free'? [-Werror=implicit-function-declaration]
     kfree(signature);
     ^~~~~
     __free
   cc1: some warnings being treated as errors


vim +108 drivers/firmware/arm_scmi/quirks.c

3242ae51027cf8 Cristian Marussi 2025-04-29  100  
3242ae51027cf8 Cristian Marussi 2025-04-29  101  #define __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ...)	\
3242ae51027cf8 Cristian Marussi 2025-04-29  102  	static struct scmi_quirk scmi_quirk_entry_ ## _qn = {		\
3242ae51027cf8 Cristian Marussi 2025-04-29  103  		.name = __stringify(quirk_ ## _qn),			\
3242ae51027cf8 Cristian Marussi 2025-04-29  104  		.vendor = _ven,						\
3242ae51027cf8 Cristian Marussi 2025-04-29  105  		.sub_vendor_id = _sub,					\
3242ae51027cf8 Cristian Marussi 2025-04-29  106  		.impl_ver_range = _impl,				\
3242ae51027cf8 Cristian Marussi 2025-04-29  107  		.key = &(scmi_quirk_ ## _qn),				\
3242ae51027cf8 Cristian Marussi 2025-04-29 @108  		.compats = { __VA_ARGS__ __VA_OPT__(,) NULL },		\
3242ae51027cf8 Cristian Marussi 2025-04-29  109  	}
3242ae51027cf8 Cristian Marussi 2025-04-29  110  

:::::: The code at line 108 was first introduced by commit
:::::: 3242ae51027cf845b37327a44fdaffda9dfe8046 firmware: arm_scmi: Add Quirks framework

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
