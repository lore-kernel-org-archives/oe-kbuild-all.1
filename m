Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08F3CE4B9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648109; cv=none; b=ONbZPKj63QYGGLev5KWMtUSj1Hlfv8zvEQU+NjewqcLEzx9whV40/WwS1WRSCgkozcwnFfC4zzqZpGgNklg8GtPtqCeYvGXUd3eyP6WhL5ie7V2nDHrNS3wbZ1Smz/0h9MFQFyZ4ZeGy0vtPF9bDD+rNf+eNWvF3hIlZO/s0UQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648109; c=relaxed/simple;
	bh=9Ey6U4fYaL+yQhuNqkZRfy5qLelS1uE0N2j72qfF5Gg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zcn75AKhijpzw3CLVC4biMNXp9G9ZXBbXK+pt/2miUDwL0Q2qY2BCJzfgaqwKb4nlnLXSFC0yPL2f+Fx9T+DbkoW5Fs5gF/MXezQXg2TmoKLewncMtXhNzeBKvhyjrIYZ/EuiM5NMt4u0ZyregqKm5qKQw1EXxBZQXaOESA14mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEodJZxB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEodJZxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780648107; x=1812184107;
  h=date:from:to:cc:subject:message-id;
  bh=9Ey6U4fYaL+yQhuNqkZRfy5qLelS1uE0N2j72qfF5Gg=;
  b=jEodJZxBBOg97y+T0QG4Z4ESiLyL++Lb9dQQBectX+mOMhgjkBBAyPPT
   AqVLXH07SVtgrdvj50mp85JyNWW3A/01+cebSSAsleuyqgyYpFvEjkUjn
   wf4HZ6YqDpj44NIEIeRSQOAneh/a8dg/MPMGTmguuEhm18LIL2ZH2a59Q
   ffqIBa8wg8DVycWeMZQoi+j/y5d3TTQt5mPS2zfL8boamPb7L2jSugyNQ
   Pgn37Qk+n7U/+AAhhhFgc1aiIFUs4F4a1+gS/DeZKOsSFOrYUpsnNeyPA
   55wFKtSSXzBAbNusZNYI9vP9J4ZmweLmJzywxnu5TGFBBiXZkC7X48B2t
   w==;
X-CSE-ConnectionGUID: xbJxtgCDSG20uf2FfHM3NQ==
X-CSE-MsgGUID: gEI/HrxJSfyjx8QQ7+DPKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80517703"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="80517703"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 01:28:13 -0700
X-CSE-ConnectionGUID: oOkqnEo1QVO4GIlXePHaBw==
X-CSE-MsgGUID: //zjEQjlT4eqcegWZaP7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="248715469"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2026 01:28:12 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVPuT-000000002WT-1tKM;
	Fri, 05 Jun 2026 08:28:09 +0000
Date: Fri, 05 Jun 2026 10:27:45 +0200
From: kernel test robot <lkp@intel.com>
To: Matthew Stewart <matthew.stewart2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next 166/275] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606051034.b4SDR7bb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   56ae73c92e200e630c2bdf1e98c88b86c8483b37
commit: a3d3758b2ee159a0985bc2f973a892200c2ab62b [166/275] drm/amd/display: Add DCN42B DC resource files
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606051034.b4SDR7bb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#168: FILE: drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:122:
+	/* read dtbclk - DTBCLK tied off in DCN42B
+	* internal->CLK5_CLK4_CURRENT_CNT = REG_READ(CLK5_CLK4_CURRENT_CNT) / ratio;

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2291: FILE: drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.c:838:
+		 * aux_engine_regs_init(4);
+		*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
