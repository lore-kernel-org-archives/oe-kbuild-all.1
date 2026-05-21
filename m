Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794894028C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390628; cv=none; b=hIqk0a+2/8dJps0ThGgIpfALm3lmDCGIB7W8sTFdlIaf9WJOAu/Qs7VTM9TzjNWn8xATt90V8MBJC21SawaaVHA5fib1eM7PprBHw3nyT9pI6sXix1tcouYuDfOdwTXbh1E2Ezg/UMU6TlMsGOv0izcHB0NyzovoM2Y3fR1Jx1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390628; c=relaxed/simple;
	bh=jBBOXKypPqNk4OfNj09lpgYEopzR+dzIeq92lh0TVbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V0jkpC2xQtjjiTHlGOyscZoQEKwyVyAV/c/hPni1l4M3LArqFbwVFfgE0T5tnQTzYLG3DuNiC9BPSX/I4PcmuAUTJ19rLUX1AHj54wrVwEjehaeO+5oOiEo8TidhSDPDQRPEd7Ep6rIqr1rtGadF9beWOLiOqyOfRm+6En1N1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kD3PuRt7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kD3PuRt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779390624; x=1810926624;
  h=date:from:to:cc:subject:message-id;
  bh=jBBOXKypPqNk4OfNj09lpgYEopzR+dzIeq92lh0TVbI=;
  b=kD3PuRt7oT2VH6Rg9YM74gtVoltxPncYbepE48zWPAPZx5glRJqxG1+N
   l5JPg6YzpOb8DghDzigy1dxIUhR8Jm+Kkn1KBm16xtD+V/bxjUD/E39OA
   9DoEHScxUrD/ag2s5FwjmgVysy9IfL3BmR2QJ6sv5j71Kv9u0Wt2SmiEE
   dvBc6kXA4+h8kf8BbZGSHRMI3h0+eTVzQZ4O6noz1+RHlS9JcLQl6SQO5
   raWyhXRnNW4dJFmMuuLJeC+PqGYy/nyGj7xjGg0fCuT4k3dg8pex2SET3
   Ctm7N57P0Q6Dk/te0/veVmnM9iMtRIjYhcQmM9kCDWUQsrT//GEnzyxMC
   g==;
X-CSE-ConnectionGUID: TJohtMZrQ5eGcrBTGGmRfg==
X-CSE-MsgGUID: DRPIGX/4Rc6HjJOc1eNM/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97891517"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="97891517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 12:10:23 -0700
X-CSE-ConnectionGUID: FVO9VG7pQQiGfUWBAECBMQ==
X-CSE-MsgGUID: 3SYgH+CdQ86Xh951lKbT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="240485684"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 May 2026 12:10:20 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ8mf-0000000011h-2Gyz;
	Thu, 21 May 2026 19:10:17 +0000
Date: Fri, 22 May 2026 03:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fpsimd/asm-cleanup 14/18]
 drivers/net/wireless/ath/ath6kl/core.h:311:6: error: 'sme_state' defined as
 wrong kind of tag
Message-ID: <202605220327.HBiTexzK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/asm-cleanup
head:   af629ab737357a9a105e7d63a08cd8271b9b8867
commit: 5e135395acf4daee1b83406e8f97e61ab3a330ab [14/18] arm64: fpsimd: Use opaque type for SME state
config: arm64-randconfig-002 (https://download.01.org/0day-ci/archive/20260522/202605220327.HBiTexzK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220327.HBiTexzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220327.HBiTexzK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath6kl/hif.h:22,
                    from drivers/net/wireless/ath/ath6kl/sdio.c:26:
>> drivers/net/wireless/ath/ath6kl/core.h:311:6: error: 'sme_state' defined as wrong kind of tag
     311 | enum sme_state {
         |      ^~~~~~~~~


vim +/sme_state +311 drivers/net/wireless/ath/ath6kl/core.h

bdcd81707973cf Kalle Valo 2011-07-18  310  
bdcd81707973cf Kalle Valo 2011-07-18 @311  enum sme_state {
bdcd81707973cf Kalle Valo 2011-07-18  312  	SME_DISCONNECTED,
bdcd81707973cf Kalle Valo 2011-07-18  313  	SME_CONNECTING,
bdcd81707973cf Kalle Valo 2011-07-18  314  	SME_CONNECTED
bdcd81707973cf Kalle Valo 2011-07-18  315  };
bdcd81707973cf Kalle Valo 2011-07-18  316  

:::::: The code at line 311 was first introduced by commit
:::::: bdcd81707973cf8aa9305337166f8ee842a050d4 Add ath6kl cleaned up driver

:::::: TO: Kalle Valo <kvalo@qca.qualcomm.com>
:::::: CC: Kalle Valo <kvalo@qca.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
