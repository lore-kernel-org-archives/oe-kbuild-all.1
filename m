Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B24A23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233218; cv=none; b=bWPpvjPH3KbcAxvg9Yv+XYuxeT/r2+PgxXlENq+O+jlAqeX+wLNTgpUapD2WNgAh+LJX8mlLtEkKmlpiKSuNlV9FLRns4z39IrE+y+1W13WNnM5QBQDIx3MeY9vrDzAK9SQTvBI0gnelZcsSd5u+n+pu8pC4QYW8F0uhQBdtYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233218; c=relaxed/simple;
	bh=D7gGJTa8km8avWjytIiRiqe5Rh23Rlll309GTvLTfvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+7CbqJdwq20EGzKuOgbs1CKZniMxg2ELeXUJsJLKj0O81pWwHuFlQ1WhrU5Olu9Oy15B8g76uFr+lV/wmu/OM9daAmSK+3yT1Vcuf0+uAfTSJBs7E5bjk/H1uvN0zGD9o7jSTjl15j9quy/SMhKtqwGJcI4ZaQtlo80oBTZ2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpB5FiRI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpB5FiRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747233216; x=1778769216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7gGJTa8km8avWjytIiRiqe5Rh23Rlll309GTvLTfvI=;
  b=MpB5FiRIhe9WEm/6AjTg42IYRfOnFzDUt7iRMDPqzKaCN/TDupwhTb4K
   XOm8ks+NuAY712HgJM3BHyU7fEAUxmuh1GKVm8yJK/G4KV9dY7LIRSiZo
   AwC9Y/6hKTUKKrTrwJxNoATT4JrilHpwFHZ3yePcfcBWpKj5IQckhyDtV
   PtdOIzb7YfsGdrKxB4hQ3s+Om8ls6x5DjVSk3CenKVfjLNsiAzylKwS5H
   GxbyelIctyRi1OkRufemol7RUAau6DINGxnYs5QvnHgjLOmMss7gSJNmt
   7FzYWUhWDlVghJtYPjQ2AkckPPP3C1MP4G7by5G9+igqM2Z1xPA1kFeA9
   w==;
X-CSE-ConnectionGUID: WsOK/LJJRD2Zfnx2dfbVhw==
X-CSE-MsgGUID: piEddKC7SC+qNyvcVkwJFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51772930"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="51772930"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:33:36 -0700
X-CSE-ConnectionGUID: v87bFaUTRxKR6Hv1xndIVw==
X-CSE-MsgGUID: VEw8RFMPSaCvxngTOsPzPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="139054423"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 May 2025 07:33:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFDAq-000HEH-2k;
	Wed, 14 May 2025 14:33:32 +0000
Date: Wed, 14 May 2025 22:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 7775/11093]
 drivers/firmware/arm_scmi/quirks.c:110:28: error: implicit declaration of
 function '__VA_OPT__'; did you mean '__CHAR_BIT__'?
Message-ID: <202505142257.ejBGy5gg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
commit: 7b487beab7cd853ab7de58746284898fb9316334 [7775/11093] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
config: arm64-randconfig-r072-20250513 (https://download.01.org/0day-ci/archive/20250514/202505142257.ejBGy5gg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142257.ejBGy5gg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142257.ejBGy5gg-lkp@intel.com/

Note: the linux-next/master HEAD bdd609656ff5573db9ba1d26496a528bdd297cf2 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/quirks.c:110:28: error: implicit declaration of function '__VA_OPT__'; did you mean '__CHAR_BIT__'? [-Werror=implicit-function-declaration]
      .compats = { __VA_ARGS__ __VA_OPT__(,) NULL },  \
                               ^
   drivers/firmware/arm_scmi/quirks.c:158:2: note: in expansion of macro '__DEFINE_SCMI_QUIRK_ENTRY'
     __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/quirks.c:172:1: note: in expansion of macro 'DEFINE_SCMI_QUIRK'
    DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
    ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_scmi/quirks.c:110:39: error: expected expression before ',' token
      .compats = { __VA_ARGS__ __VA_OPT__(,) NULL },  \
                                          ^
   drivers/firmware/arm_scmi/quirks.c:158:2: note: in expansion of macro '__DEFINE_SCMI_QUIRK_ENTRY'
     __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/quirks.c:172:1: note: in expansion of macro 'DEFINE_SCMI_QUIRK'
    DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
    ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +110 drivers/firmware/arm_scmi/quirks.c

487c407d57d6d3 Cristian Marussi 2025-04-29  102  
487c407d57d6d3 Cristian Marussi 2025-04-29  103  #define __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ...)	\
487c407d57d6d3 Cristian Marussi 2025-04-29  104  	static struct scmi_quirk scmi_quirk_entry_ ## _qn = {		\
487c407d57d6d3 Cristian Marussi 2025-04-29  105  		.name = __stringify(quirk_ ## _qn),			\
487c407d57d6d3 Cristian Marussi 2025-04-29  106  		.vendor = _ven,						\
487c407d57d6d3 Cristian Marussi 2025-04-29  107  		.sub_vendor_id = _sub,					\
487c407d57d6d3 Cristian Marussi 2025-04-29  108  		.impl_ver_range = _impl,				\
487c407d57d6d3 Cristian Marussi 2025-04-29  109  		.key = &(scmi_quirk_ ## _qn),				\
487c407d57d6d3 Cristian Marussi 2025-04-29 @110  		.compats = { __VA_ARGS__ __VA_OPT__(,) NULL },		\
487c407d57d6d3 Cristian Marussi 2025-04-29  111  	}
487c407d57d6d3 Cristian Marussi 2025-04-29  112  

:::::: The code at line 110 was first introduced by commit
:::::: 487c407d57d6d32ff4370f4e738227811732d4bd firmware: arm_scmi: Add common framework to handle firmware quirks

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
