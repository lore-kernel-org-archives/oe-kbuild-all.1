Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE988250EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705527684; cv=none; b=ot9LYRtxpcms1FSdonl9yW2HwVbWnKpgfSE7dNdpe7PE1wofSUomCRwlOYzHdd4WJs2yCQLayKf70SzIfIj+iJoSHqkqxRVPOXg6aV+1zYdV1kVDiEVqjvYMkamBp7FTihACTTZ4Iw+wx8b4pRvcuRHHsxPzHQ1ztMAfJPMRcsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705527684; c=relaxed/simple;
	bh=2izEFk6rGLAAiSGT9eR09uhDA57YFfuVuO/P/zIXzAA=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=gEQQLYipBzqwswa+UiTimTbgePYimuh0FyTDyTVsEHFEN9kPN/+6ykfr3egEBagaVNcuRitlXOOKbdHXADfBKmmAV6IbhaNKcA4WXFuxyCxTbxJEdka7IH3c/lTVlzhQ99H4MVVgw7mAGp9rFTwbPLmF2cqq5Q9ldXSD2ZMz4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1+w0Is9; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1+w0Is9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705527681; x=1737063681;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2izEFk6rGLAAiSGT9eR09uhDA57YFfuVuO/P/zIXzAA=;
  b=Y1+w0Is9ek2tap6+QoR7tgo1XXuz4c0xhB/3nfAa10hXfQOuv7FqyCvN
   PU3nmvCpjghOVUTz+cqLc+vdheVr3MvJDTSwPGRrs4e/biJF+mO4LuzAj
   ra1yLjkDi3kS9uq85lDpRveFPXCVM0KZLek63zurj4e1x7Ue5B2Dc5igz
   6cMZo3+g7kMwfVT0klTLQWQg9jdT1TiEtVU8O1nkGNxs65S8TUCHLAbDI
   +Ix2ESSTpWtNbI1Nh3mAdqDKJRjjA5vPtRt1Tf7F5kUHXRqWHqokRc8er
   xTejeBGi8BrCirlB3/d2cGwYQUU2ylncWaObjAUotXUJs1TBqk/jiSqRo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404046570"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="404046570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 13:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="209988"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2024 13:41:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQDev-0002ME-0I
	for oe-kbuild-all@lists.linux.dev;
	Wed, 17 Jan 2024 21:41:17 +0000
Date: Thu, 18 Jan 2024 05:40:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14-rebase 873/9999]
 drivers/gpu/arm/midgard/backend/gpu/mali_kbase_instr_backend.c:76:6:
 warning: variable 'ret' set but not used
Message-ID: <202401180555.gdT8I8Hx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 3898fa526f5561c6baaf676d866d9d77b61e0c66 [873/9999] CHROMIUM: MALI: Bifrost r13p0 EAC release
config: arm-randconfig-003-20240118 (https://download.01.org/0day-ci/archive/20240118/202401180555.gdT8I8Hx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180555.gdT8I8Hx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180555.gdT8I8Hx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/arm/midgard/mali_kbase_defs.h:37:0,
                    from drivers/gpu/arm/midgard/mali_kbase.h:57,
                    from drivers/gpu/arm/midgard/backend/gpu/mali_kbase_js_backend.c:28:
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1216:33: warning: 'base_hw_issues_model_tEGx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tEGx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1209:33: warning: 'base_hw_issues_tEGx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tEGx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1201:33: warning: 'base_hw_issues_model_tBOx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tBOx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1194:33: warning: 'base_hw_issues_tBOx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tBOx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1186:33: warning: 'base_hw_issues_model_tTRx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tTRx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1179:33: warning: 'base_hw_issues_tTRx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tTRx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1171:33: warning: 'base_hw_issues_model_tKAx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tKAx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1164:33: warning: 'base_hw_issues_tKAx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tKAx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1156:33: warning: 'base_hw_issues_model_tGOx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tGOx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1148:33: warning: 'base_hw_issues_tGOx_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tGOx_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1140:33: warning: 'base_hw_issues_tGOx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tGOx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1132:33: warning: 'base_hw_issues_model_tNOx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tNOx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1124:33: warning: 'base_hw_issues_tNOx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tNOx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1116:33: warning: 'base_hw_issues_model_tDVx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tDVx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1109:33: warning: 'base_hw_issues_tDVx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tDVx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1101:33: warning: 'base_hw_issues_model_tSIx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tSIx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1094:33: warning: 'base_hw_issues_tSIx_r1p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r1p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1086:33: warning: 'base_hw_issues_tSIx_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1078:33: warning: 'base_hw_issues_tSIx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1070:33: warning: 'base_hw_issues_tSIx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1061:33: warning: 'base_hw_issues_model_tHEx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tHEx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1052:33: warning: 'base_hw_issues_tHEx_r0p3' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p3[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1042:33: warning: 'base_hw_issues_tHEx_r0p2' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p2[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1032:33: warning: 'base_hw_issues_tHEx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1022:33: warning: 'base_hw_issues_tHEx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1008:33: warning: 'base_hw_issues_model_tMIx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tMIx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:991:33: warning: 'base_hw_issues_tMIx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tMIx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:974:33: warning: 'base_hw_issues_tMIx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tMIx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:957:33: warning: 'base_hw_issues_tMIx_r0p0_05dev0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tMIx_r0p0_05dev0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:943:33: warning: 'base_hw_issues_model_t82x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t82x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:923:33: warning: 'base_hw_issues_t82x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t82x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:902:33: warning: 'base_hw_issues_t82x_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t82x_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:880:33: warning: 'base_hw_issues_t82x_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t82x_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:864:33: warning: 'base_hw_issues_model_t83x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t83x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:844:33: warning: 'base_hw_issues_t83x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t83x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:823:33: warning: 'base_hw_issues_t83x_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t83x_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:809:33: warning: 'base_hw_issues_model_t86x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t86x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:790:33: warning: 'base_hw_issues_t86x_r2p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t86x_r2p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:771:33: warning: 'base_hw_issues_t86x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t86x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:750:33: warning: 'base_hw_issues_t86x_r0p2' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t86x_r0p2[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:735:33: warning: 'base_hw_issues_model_tFRx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tFRx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:716:33: warning: 'base_hw_issues_tFRx_r2p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r2p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:697:33: warning: 'base_hw_issues_tFRx_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:676:33: warning: 'base_hw_issues_tFRx_r0p2' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r0p2[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:654:33: warning: 'base_hw_issues_tFRx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:635:33: warning: 'base_hw_issues_model_t62x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t62x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:616:33: warning: 'base_hw_issues_model_t60x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t60x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:597:33: warning: 'base_hw_issues_model_t76x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t76x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:581:33: warning: 'base_hw_issues_model_t72x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t72x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:560:33: warning: 'base_hw_issues_t72x_r1p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t72x_r1p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:539:33: warning: 'base_hw_issues_t72x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t72x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:519:33: warning: 'base_hw_issues_t72x_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t72x_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:496:33: warning: 'base_hw_issues_t76x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t76x_r1p0[] = {
--
   drivers/gpu/arm/midgard/mali_kbase_mmu.c: In function 'kbasep_as_poke_timer_callback':
>> drivers/gpu/arm/midgard/mali_kbase_mmu.c:2228:6: warning: variable 'queue_work_ret' set but not used [-Wunused-but-set-variable]
     int queue_work_ret;
         ^~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_kbase_mmu.c: In function 'kbase_as_poking_timer_release_atom':
   drivers/gpu/arm/midgard/mali_kbase_mmu.c:2318:8: warning: variable 'queue_work_ret' set but not used [-Wunused-but-set-variable]
       int queue_work_ret;
           ^~~~~~~~~~~~~~
   In file included from drivers/gpu/arm/midgard/mali_kbase_defs.h:37:0,
                    from drivers/gpu/arm/midgard/mali_kbase.h:57,
                    from drivers/gpu/arm/midgard/mali_kbase_mmu.c:33:
   At top level:
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1216:33: warning: 'base_hw_issues_model_tEGx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tEGx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1209:33: warning: 'base_hw_issues_tEGx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tEGx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1201:33: warning: 'base_hw_issues_model_tBOx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tBOx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1194:33: warning: 'base_hw_issues_tBOx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tBOx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1186:33: warning: 'base_hw_issues_model_tTRx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tTRx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1179:33: warning: 'base_hw_issues_tTRx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tTRx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1171:33: warning: 'base_hw_issues_model_tKAx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tKAx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1164:33: warning: 'base_hw_issues_tKAx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tKAx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1156:33: warning: 'base_hw_issues_model_tGOx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tGOx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1148:33: warning: 'base_hw_issues_tGOx_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tGOx_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1140:33: warning: 'base_hw_issues_tGOx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tGOx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1132:33: warning: 'base_hw_issues_model_tNOx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tNOx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1124:33: warning: 'base_hw_issues_tNOx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tNOx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1116:33: warning: 'base_hw_issues_model_tDVx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tDVx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1109:33: warning: 'base_hw_issues_tDVx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tDVx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1101:33: warning: 'base_hw_issues_model_tSIx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tSIx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1094:33: warning: 'base_hw_issues_tSIx_r1p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r1p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1086:33: warning: 'base_hw_issues_tSIx_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1078:33: warning: 'base_hw_issues_tSIx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1070:33: warning: 'base_hw_issues_tSIx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tSIx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1061:33: warning: 'base_hw_issues_model_tHEx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tHEx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1052:33: warning: 'base_hw_issues_tHEx_r0p3' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p3[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1042:33: warning: 'base_hw_issues_tHEx_r0p2' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p2[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1032:33: warning: 'base_hw_issues_tHEx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1022:33: warning: 'base_hw_issues_tHEx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tHEx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1008:33: warning: 'base_hw_issues_model_tMIx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tMIx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:991:33: warning: 'base_hw_issues_tMIx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tMIx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:974:33: warning: 'base_hw_issues_tMIx_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tMIx_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:957:33: warning: 'base_hw_issues_tMIx_r0p0_05dev0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tMIx_r0p0_05dev0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:943:33: warning: 'base_hw_issues_model_t82x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t82x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:923:33: warning: 'base_hw_issues_t82x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t82x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:902:33: warning: 'base_hw_issues_t82x_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t82x_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:880:33: warning: 'base_hw_issues_t82x_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t82x_r0p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:864:33: warning: 'base_hw_issues_model_t83x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t83x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:844:33: warning: 'base_hw_issues_t83x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t83x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:823:33: warning: 'base_hw_issues_t83x_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t83x_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:809:33: warning: 'base_hw_issues_model_t86x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t86x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:790:33: warning: 'base_hw_issues_t86x_r2p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t86x_r2p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:771:33: warning: 'base_hw_issues_t86x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t86x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:750:33: warning: 'base_hw_issues_t86x_r0p2' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t86x_r0p2[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:735:33: warning: 'base_hw_issues_model_tFRx' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_tFRx[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:716:33: warning: 'base_hw_issues_tFRx_r2p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r2p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:697:33: warning: 'base_hw_issues_tFRx_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:676:33: warning: 'base_hw_issues_tFRx_r0p2' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r0p2[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:654:33: warning: 'base_hw_issues_tFRx_r0p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_tFRx_r0p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:635:33: warning: 'base_hw_issues_model_t62x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t62x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:616:33: warning: 'base_hw_issues_model_t60x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t60x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:597:33: warning: 'base_hw_issues_model_t76x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t76x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:581:33: warning: 'base_hw_issues_model_t72x' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_model_t72x[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:560:33: warning: 'base_hw_issues_t72x_r1p1' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t72x_r1p1[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:539:33: warning: 'base_hw_issues_t72x_r1p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t72x_r1p0[] = {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:519:33: warning: 'base_hw_issues_t72x_r0p0' defined but not used [-Wunused-const-variable=]
    static const enum base_hw_issue base_hw_issues_t72x_r0p0[] = {
..


vim +/ret +76 drivers/gpu/arm/midgard/backend/gpu/mali_kbase_instr_backend.c

    68	
    69	int kbase_instr_hwcnt_enable_internal(struct kbase_device *kbdev,
    70						struct kbase_context *kctx,
    71						struct kbase_ioctl_hwcnt_enable *enable)
    72	{
    73		unsigned long flags, pm_flags;
    74		int err = -EINVAL;
    75		u32 irq_mask;
  > 76		int ret;
    77		u64 shader_cores_needed;
    78		u32 prfcnt_config;
    79	
    80		shader_cores_needed = kbase_pm_get_present_cores(kbdev,
    81								KBASE_PM_CORE_SHADER);
    82	
    83		/* alignment failure */
    84		if ((enable->dump_buffer == 0ULL) || (enable->dump_buffer & (2048 - 1)))
    85			goto out_err;
    86	
    87		/* Override core availability policy to ensure all cores are available
    88		 */
    89		kbase_pm_ca_instr_enable(kbdev);
    90	
    91		/* Request the cores early on synchronously - we'll release them on any
    92		 * errors (e.g. instrumentation already active) */
    93		kbase_pm_request_cores_sync(kbdev, true, shader_cores_needed);
    94	
    95		spin_lock_irqsave(&kbdev->hwcnt.lock, flags);
    96	
    97		if (kbdev->hwcnt.backend.state != KBASE_INSTR_STATE_DISABLED) {
    98			/* Instrumentation is already enabled */
    99			spin_unlock_irqrestore(&kbdev->hwcnt.lock, flags);
   100			goto out_unrequest_cores;
   101		}
   102	
   103		/* Enable interrupt */
   104		spin_lock_irqsave(&kbdev->hwaccess_lock, pm_flags);
   105		irq_mask = kbase_reg_read(kbdev, GPU_CONTROL_REG(GPU_IRQ_MASK), NULL);
   106		kbase_reg_write(kbdev, GPU_CONTROL_REG(GPU_IRQ_MASK), irq_mask |
   107							PRFCNT_SAMPLE_COMPLETED, NULL);
   108		spin_unlock_irqrestore(&kbdev->hwaccess_lock, pm_flags);
   109	
   110		/* In use, this context is the owner */
   111		kbdev->hwcnt.kctx = kctx;
   112		/* Remember the dump address so we can reprogram it later */
   113		kbdev->hwcnt.addr = enable->dump_buffer;
   114	
   115		/* Request the clean */
   116		kbdev->hwcnt.backend.state = KBASE_INSTR_STATE_REQUEST_CLEAN;
   117		kbdev->hwcnt.backend.triggered = 0;
   118		/* Clean&invalidate the caches so we're sure the mmu tables for the dump
   119		 * buffer is valid */
   120		ret = queue_work(kbdev->hwcnt.backend.cache_clean_wq,
   121						&kbdev->hwcnt.backend.cache_clean_work);
   122		KBASE_DEBUG_ASSERT(ret);
   123	
   124		spin_unlock_irqrestore(&kbdev->hwcnt.lock, flags);
   125	
   126		/* Wait for cacheclean to complete */
   127		wait_event(kbdev->hwcnt.backend.wait,
   128						kbdev->hwcnt.backend.triggered != 0);
   129	
   130		KBASE_DEBUG_ASSERT(kbdev->hwcnt.backend.state ==
   131								KBASE_INSTR_STATE_IDLE);
   132	
   133		kbase_pm_request_l2_caches(kbdev);
   134	
   135		/* Configure */
   136		prfcnt_config = kctx->as_nr << PRFCNT_CONFIG_AS_SHIFT;
   137	#ifdef CONFIG_MALI_PRFCNT_SET_SECONDARY
   138		{
   139			u32 gpu_id = kbdev->gpu_props.props.raw_props.gpu_id;
   140			u32 product_id = (gpu_id & GPU_ID_VERSION_PRODUCT_ID)
   141				>> GPU_ID_VERSION_PRODUCT_ID_SHIFT;
   142			int arch_v6 = GPU_ID_IS_NEW_FORMAT(product_id);
   143	
   144			if (arch_v6)
   145				prfcnt_config |= 1 << PRFCNT_CONFIG_SETSELECT_SHIFT;
   146		}
   147	#endif
   148	
   149		kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_CONFIG),
   150				prfcnt_config | PRFCNT_CONFIG_MODE_OFF, kctx);
   151	
   152		kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_BASE_LO),
   153						enable->dump_buffer & 0xFFFFFFFF, kctx);
   154		kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_BASE_HI),
   155						enable->dump_buffer >> 32,        kctx);
   156		kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_JM_EN),
   157						enable->jm_bm,                    kctx);
   158		kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_SHADER_EN),
   159						enable->shader_bm,                kctx);
   160		kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_MMU_L2_EN),
   161						enable->mmu_l2_bm,                kctx);
   162		/* Due to PRLAM-8186 we need to disable the Tiler before we enable the
   163		 * HW counter dump. */
   164		if (kbase_hw_has_issue(kbdev, BASE_HW_ISSUE_8186))
   165			kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_TILER_EN), 0,
   166										kctx);
   167		else
   168			kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_TILER_EN),
   169								enable->tiler_bm, kctx);
   170	
   171		kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_CONFIG),
   172				prfcnt_config | PRFCNT_CONFIG_MODE_MANUAL, kctx);
   173	
   174		/* If HW has PRLAM-8186 we can now re-enable the tiler HW counters dump
   175		 */
   176		if (kbase_hw_has_issue(kbdev, BASE_HW_ISSUE_8186))
   177			kbase_reg_write(kbdev, GPU_CONTROL_REG(PRFCNT_TILER_EN),
   178								enable->tiler_bm, kctx);
   179	
   180		spin_lock_irqsave(&kbdev->hwcnt.lock, flags);
   181	
   182		kbdev->hwcnt.backend.state = KBASE_INSTR_STATE_IDLE;
   183		kbdev->hwcnt.backend.triggered = 1;
   184		wake_up(&kbdev->hwcnt.backend.wait);
   185	
   186		spin_unlock_irqrestore(&kbdev->hwcnt.lock, flags);
   187	
   188		err = 0;
   189	
   190		dev_dbg(kbdev->dev, "HW counters dumping set-up for context %p", kctx);
   191		return err;
   192	 out_unrequest_cores:
   193		spin_lock_irqsave(&kbdev->hwaccess_lock, flags);
   194		kbase_pm_unrequest_cores(kbdev, true, shader_cores_needed);
   195		spin_unlock_irqrestore(&kbdev->hwaccess_lock, flags);
   196	 out_err:
   197		return err;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
