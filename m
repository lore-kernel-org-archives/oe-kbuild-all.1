Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643891DF254
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jun 2026 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837253; cv=none; b=FxSPX4+t8tXkhhgxP5tc6tYB4bO5DCYKtkqzDrlqv72OXEt8mtjVg2Qqs34zdgIcOPY82G1DrBx2161uPtyk0NDEFoQbqCHPBqqsanEwUcqzxGaAMNV0VH/3q5kQrk6n0q2pb13lhHwZfWP3zaZS5blnmQ7MSIFnhFHrM6w/BOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837253; c=relaxed/simple;
	bh=WvQxZgXYmZ2n/l+CFOeI6WvvjB8wMGOk5C4PFiICUBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SVFzLfmzo2qO4Mr3DbQsJ8P3TrUJAN7L3hqjSHkCjATmRjFtJXr2NqkwnzAx7x0SwXrMPz26zJVkbAWzLm3sBeD481M3rTUoA0VyITxlqbRqObtEVkgws+yGzqpq1KmwU86TUVPcFEgdTo60Yb6wx+Pxof/Oei5ulA4j7nrFXEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eb0UGrnC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eb0UGrnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780837252; x=1812373252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvQxZgXYmZ2n/l+CFOeI6WvvjB8wMGOk5C4PFiICUBg=;
  b=Eb0UGrnCjlC/5G0JrNixGcB2qySG3Sk+Cv+eES0ugAXcThZWVpejP6br
   LLAtJMm5thldajskj4ee+tNdnbhZAXg0O2Cr+ze/Dmi5/ZUlhGHzuZZl4
   rPfGhQKz3qDD5J3q6wOHDXeIAXHYjT646v+tYELsgVX4lt0UQGSUK48Hk
   0RbYreOA8T+cTVIzCZ84kU64TqV65tN4qGcjincpvExbNeZCAr4nfnj4k
   qZPejLNpijZQESUWEAhzgkiHv0dqU002DhL/sOkCzA48HFLnVCBx1Jasd
   YaAE+UykRI2um6iM53omAW2zbRucUAn7VOPtUODq7H8BTP8uWOQbjteM8
   g==;
X-CSE-ConnectionGUID: 7sTKUYX/T2+yBBuQJ6TDYA==
X-CSE-MsgGUID: HaP6YpmDRJObNIJeamLrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81655270"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="81655270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 06:00:51 -0700
X-CSE-ConnectionGUID: Kl/6mKoRQRW4zugFYDiE1w==
X-CSE-MsgGUID: gwdNFsO7Sjm4SpVALbCLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="268981449"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2026 06:00:49 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWD7P-0000000033N-0X1F;
	Sun, 07 Jun 2026 13:00:47 +0000
Date: Sun, 07 Jun 2026 14:59:54 +0200
From: kernel test robot <lkp@intel.com>
To: Tyron Govender <dev@tyrongovender.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Tyron-Govender/drm-panel-orientation-quirks-Ad?=
 =?us-ascii?Q?d-HUION-Kamvas-Studio-16/20260607-193244?= 1/1] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606071441.E93LK7u8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Tyron-Govender/drm-panel-orientation-quirks-Add-HUION-Kamvas-Studio-16/20260607-193244
head:   25ba6cbe8262ed7628951ac6aa3be9b24862ac3a
commit: 25ba6cbe8262ed7628951ac6aa3be9b24862ac3a [1/1] drm: panel-orientation-quirks: Add HUION Kamvas Studio 16
reproduce: (https://download.01.org/0day-ci/archive/20260607/202606071441.E93LK7u8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#20: FILE: drivers/gpu/drm/drm_panel_orientation_quirks.c:368:
+	}, {	/*
+	 * HUION Kamvas Studio 16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
