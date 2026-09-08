Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51F546EF92
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902510; cv=none; b=khypXdXYu0adyfB0AARtiOysmqBY9CJsbjBigZuiDniMoLnkpUO9dyOQyFgll9V5Bt+P2iEHhmZZ8FbA6q0q+oJqJhrXnk8oIbfnK0/o+8QSngfwwNF1kAygUUTasVb4ij8feAnLuTVQdRbv+qkPzGSP2A/vR0VYRCO5xHikJes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902510; c=relaxed/simple;
	bh=wYBI628hRt2p++sPicDUj5RUVI5kJwjnajHynHHYX6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YtNuHemQWbJwta6jgULNMeCUO9uNV/41AwTefR2Uc2dC5BKOKOec6nCyVgNQ7xLJYI+MDBUIs72k/Uh0avkirn0GrB7qqQzEAXPoCnmxCERB+FruuX2j01sJtL70O6MggWVp1+V4mwVai+YIPBvz1Sgky2YNVElgBvejCmx2JAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbV2KfE4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbV2KfE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788902508; x=1820438508;
  h=date:from:to:cc:subject:message-id;
  bh=wYBI628hRt2p++sPicDUj5RUVI5kJwjnajHynHHYX6k=;
  b=WbV2KfE4n4Ek3j40kYbv5X9OXVaTw3QNZxBY6VcZxSc44f75A/2PpXmn
   FJ3o2SdD1gsT8Ym4VpKWQ7Wo/0m7gtEG1W1T1cQmjgh3zdWRNRBUcvOY4
   QiiVIgV0X49oA1cCxOEla5eXv1gup6Cthmko53XznZOhrAQg6+R//UuhA
   +VZsjaPApvEh4p5q6BxxNYqbydQfqrDWNoKsrzgaucV/7YznosgQjfLkP
   cq2r0S86LKhAz1ik1vdEaZ2UXYGzXgf9M6RLcazDhvAHNpwtsauWDcqUP
   Uos7iauUoycFodyAO7NOoNwFSOtYSy78o2T16KT1mVj51NBzLZb1X+OV8
   Q==;
X-CSE-ConnectionGUID: VnhFzknDTduk6sWpWRjA/Q==
X-CSE-MsgGUID: hcuEmiW9RSqgQZ6VOiaz1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89442671"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89442671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 14:21:48 -0700
X-CSE-ConnectionGUID: Em9vixkGQBmuSHs8zqjuVw==
X-CSE-MsgGUID: yrWLvC42SB67vkDBxO+BGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="275260059"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Sep 2026 14:21:47 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x43GC-000000000rG-2sBL;
	Tue, 08 Sep 2026 21:21:44 +0000
Date: Tue, 08 Sep 2026 23:20:45 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/240-isp 25/89] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202609082305.otS4u3nD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   e31aa85e339c10dbf872c0759d5a6c35954af0cc
commit: 158df310e6b78b57b1ef40dee48e5d72586c3df5 [25/89] media: apple: isp: Remove ioread/iowrite and stop doing raw address translation
reproduce: (https://download.01.org/0day-ci/archive/20260908/202609082305.otS4u3nD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#487: FILE: drivers/media/platform/apple/isp/isp-ipc.c:252:
+		/* Only enabled in debug builds so it shouldn't matter, but
+		* the LOG surface is always the first surface requested.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
