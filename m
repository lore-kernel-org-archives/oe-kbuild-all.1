Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448D1B4F1F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 04:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782967790; cv=none; b=fYTOEh+9uYJUGiurzcF8OWKASXyUHgPyncMA4wj3gPbPOLsrDRfGTtcF8zO/Hd8hpcU7SKkNmBW2JlYfaxNJkH1TnQZ/lq65IyBGBKBH1lJmmSciLa0sJLJxioNEEGOTk8eAvSaz0cH+PZUEO4wMfv6GBsekwHpJA+dn8aE40+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782967790; c=relaxed/simple;
	bh=QVxENEXVs/iLZQNm1VTN7U8Lv9gwTuvGDDaXvo6WdeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AJk/ZFahVVWldz0FxnRKmhthBQ8diTDRYdb/ZasKhKIAQ2TAbZ4AMZXHaJkMFA4p8xKR7chN07jz1I2fAUlZHwBCt4+jLgjG2BLpTGHKlZLNbZcgtfnOsShw1965qqOXLbSgjNygMKIHlywyEuUTwdAnMDL43Zg2ESQhC1kol/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4jnY7d6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4jnY7d6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782967788; x=1814503788;
  h=date:from:to:cc:subject:message-id;
  bh=QVxENEXVs/iLZQNm1VTN7U8Lv9gwTuvGDDaXvo6WdeM=;
  b=e4jnY7d6oEI8OqGwMJLjnnLj3rbr6Vole8m8c9HRKarunWXNpHc6itV+
   BERp0+9ATgeFJV63yT9oo5lLgNiAQwbpoeUp9DLw/IGC+fI0p795p5JAv
   G2uNoRENEBakkM1HfyPCoUvjXDyjojpzZkFsokHv4sQvMRExLOoV0Q8uO
   PNuVYuVEc9lGR9JuCh+ayw/OnXh0l2QExcs7mxt3wqtpa27jj76ylLB1C
   qnXK6kEZcu9HGK9x93Qx+DIODQv07FOdw9ASEZKIBmSSojXA34saXvase
   L6ls5sMT4/Slm7kSqDJLbdjVFUE7WyOGrkx1CCIL8NaIas/UZzD4Gp4++
   w==;
X-CSE-ConnectionGUID: nrnO9yd1RjCdvN1ttVLgMw==
X-CSE-MsgGUID: zEN6PsGHSX+HhV6PmLs6vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94064368"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94064368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 21:49:48 -0700
X-CSE-ConnectionGUID: GN7nfimERUiJ54ECeI1G0w==
X-CSE-MsgGUID: Im8tpRrgQYyFmu1i3h5OSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="282823887"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Jul 2026 21:49:46 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf9Mu-0000000013x-1M2H;
	Thu, 02 Jul 2026 04:49:44 +0000
Date: Thu, 02 Jul 2026 06:49:41 +0200
From: kernel test robot <lkp@intel.com>
To: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next 390/437] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607020614.BiaG5p3V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   50be7c9b5d5ea55fd40bb411cf324cec99ec7417
commit: 4623b958dd6da0f4c3026afdf330626a09ecb0f0 [390/437] drm/amdgpu: Fix kernel panic during driver load failure
reproduce: (https://download.01.org/0day-ci/archive/20260702/202607020614.BiaG5p3V-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#65: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3534:
+		 * but clear here if MES init fails
+		*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
