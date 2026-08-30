Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633623BBA0E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104341; cv=none; b=UMobTbn1knvueP910biqRm91RWT5bPucyetP+UqAv8+y1KPJli55qR6L9HlHCdkPz/+IcPV+DRrAWigTr+BoiTputJEj2UR6BFVUddfjVFGAKz2/4jlFSCdQCR5M7wZ877h73mGzGCwGrm1gHWANCnn9qaGz6vVwRDk/pqqBOBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104341; c=relaxed/simple;
	bh=9NqfYwSIcbZg1A5qEdoE1gI3v55aIAY8Cq4fUYQzEAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xe8mOMQETPTO36rzXy7aSazMUGZKIk9l1v6/re/TQ/6bUK7ok3CTlhB6yIdFYFQtYek9YcYO+YGrclGO2Vobe3o4RYGwqAycIcnNnLA2Y50C2RNMtVH+1YGaUEUv2NKI5pJFggJ3i+yoUZoq7TVBGmfTyj1ydb15x2T8cvS4HpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWchh7hs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWchh7hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788104337; x=1819640337;
  h=date:from:to:cc:subject:message-id;
  bh=9NqfYwSIcbZg1A5qEdoE1gI3v55aIAY8Cq4fUYQzEAE=;
  b=SWchh7hs3p9LLrUGprh02PYe+aMegbFph33X6CMEnZAIVYS6Kh1MJT0A
   1C+Pksx4EAz927eA/6as3SnTm+AzEKZFwLrtbr/fjp7ymLYRpI+lUs6M0
   burc0d000tRAd/eslHTij0Vy//LsUJ6A3WJquCGMcTeO/jH8BYmDJ62OI
   XBRG9t+H2SwZs70c3gQVWt2vuocVSR49AuN7jxoOdZoR31BKZXzAu6YRA
   meGnYjgz2UinGjJ+rPfsWbvdngG7UOy/cxvwZvRfhNBNB8wWHHAT5zbIb
   R0ZkcsAH2MqNNNQAnyKFVDqLmW5taM/dGpicY+6VDQYeAiYF+V8oginEu
   g==;
X-CSE-ConnectionGUID: 9IAgvYdmQH+e+JgUYEYFjQ==
X-CSE-MsgGUID: ReDDSgMkQPKUv0UXlu7JyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114063785"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="114063785"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 08:38:55 -0700
X-CSE-ConnectionGUID: SgmIdHcvQkeUwmG+YHtINQ==
X-CSE-MsgGUID: wjrcrYmYTQ2GzfX2qHhPJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="273859800"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Aug 2026 08:38:54 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0hcL-00000000E1A-2oNh;
	Sun, 30 Aug 2026 15:38:45 +0000
Date: Sun, 30 Aug 2026 23:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/drm-msm-hdmi-eliza 13/15] ERROR: modpost:
 drivers/gpu/drm/msm/msm.ko: symbol '__udivdi3' undefined!
Message-ID: <202608302329.fP1r2ext-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/krzk/linux b4/drm-msm-hdmi-eliza
head:   d8f47c20c4e7d547c7f8cb70726214b62be153aa
commit: 71713ca7000a53bf3fd3fdd2725d3b5a61d31ce0 [13/15] drm/msm/hdmi_phy_eliza: Add support for Synopsys-based HDMI phy on Eliza
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260830/202608302329.fP1r2ext-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302329.fP1r2ext-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302329.fP1r2ext-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/msm/msm.ko: symbol '__udivdi3' undefined!
WARNING: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses symbol 'devm_iio_channel_get' from namespace 'IIO_CONSUMER', but does not import it.
WARNING: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
