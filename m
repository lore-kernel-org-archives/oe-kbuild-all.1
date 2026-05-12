Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F65C17555
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572826; cv=none; b=LH/FCKTm2zI06RYlJuJqF3a6Gi/cSuzPUQqoKRNzjSEiIeVHSFVAeFmt1XNbchRo7HL7ies4a35fLVk4SXP2WuvzRgzVXbbZ11efAEkd77+tsta8/WKj/vF6JpcNIiSKQ8J8AjoTP0urqU3MHWDml6fnEnLob02b7FwI7xykSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572826; c=relaxed/simple;
	bh=dkZqGNkVN4xGp5m9aywNCOLyDtPdCi2a6mwG9ChcmdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J5ronq8Z4/PsV2tpU48EiL/JR4/gUbTT0IcBBxCsJaJZ7mUtmFwgGAUoeDn8TeyxLl/Rh9FwKdxea16rpMSMgcdN+72KAZnRrPX8GuU2ymCl88ld7DYdrEai9l7YUegtKPlz/T/FURRG8AcCv/MAnDxiF6q5hxtRoniYoB5WTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYIYjUyV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYIYjUyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778572825; x=1810108825;
  h=date:from:to:cc:subject:message-id;
  bh=dkZqGNkVN4xGp5m9aywNCOLyDtPdCi2a6mwG9ChcmdY=;
  b=MYIYjUyVF4xYQhvyRcvznlIWsP1j+Mz9d3MM97lA6nUhOPeRudIHpJL3
   HZwimcKRbf/sIEtzPcaFW+cDpnRE491skG66oLqOaCBP/SLuZ/5SUJj6E
   OOejs/JvRnI5Crb6Aii5Zj8MjjrrGZrZKy/uZ71bV8h5ZcopCeobOV8nv
   QRvqXwRPAEKXCF5v4cVzHfHYEAQi4BaNsqrMx2474O6u38eXn3KxBZY6Z
   TbTx/EWGope4Q6sNo45jXsJ2/ZYz//OxbFdbsujOJML08r8/m60Zak9jX
   jUWgDnqNtRIiXruk7BN/WNfw+WNQHLED3LNIwMvkjrP6CVthRJUtDMFMU
   w==;
X-CSE-ConnectionGUID: 8O/XA6PzSTm6fJ8rFXdNTg==
X-CSE-MsgGUID: wBLuVI1WRDOCyvRKlvUuyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79459377"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79459377"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:00:25 -0700
X-CSE-ConnectionGUID: 45fubAyCRbyPvL6QAhomgA==
X-CSE-MsgGUID: YPeR22uGR+WNJy+MXt6PvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="275815838"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 May 2026 01:00:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMi2P-000000008E5-0FoM;
	Tue, 12 May 2026 08:00:21 +0000
Date: Tue, 12 May 2026 10:00:13 +0200
From: kernel test robot <lkp@intel.com>
To: Lohita Mudimela <lohita.mudimela@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next 43/71] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605120940.DH29M8Ej-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   d00df389371346d6ac5739d8692405d9d8b11041
commit: 254a47ce0c8a52ff78a60f92a13b56db69f69096 [43/71] drm/amd/display: Separate ABM functions into dedicated power_abm.c file
reproduce: (https://download.01.org/0day-ci/archive/20260512/202605120940.DH29M8Ej-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#755: FILE: drivers/gpu/drm/amd/display/modules/power/power.c:624:
+		/*
+		* DSC support:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
