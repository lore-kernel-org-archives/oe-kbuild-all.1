Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6600433086
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853677; cv=none; b=ul+ihqmaMurXmixrv2zueHlpYFvSO3XgxBgZmR5Ohn8d1btvTXqrx4AyTa0SCXzUPgpsSZprXEzxMMTEfVCuYLkeEUuW0QuoA1lp0uuVB8h6ePNmFhNsLuvtHWi1CH0Rw4JLHLtUlFkWp8VQwRgLZ5kaRTzsRrCwY0LrXMIPesg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853677; c=relaxed/simple;
	bh=Ribr0gr5a13fZ9MYAzQNKOFOehjGVRNklAGuAn0+YaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rReGZwrVpWum+N+ssKOQa/YY9BwatKnwc1XnJRzhbTtCZO1CDp+vQmC0452awC2KASbr4+/ZECIGzRpjKo7fQahbjKLQUDzLVrg+nm1u+/KwlsSLPTIZ08D4T/RnJFC/2Tk8EnKUjjYqm0oZOV0YVd07enX+BQRKKD85y8KkJMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO/Kri+i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO/Kri+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750853676; x=1782389676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ribr0gr5a13fZ9MYAzQNKOFOehjGVRNklAGuAn0+YaQ=;
  b=NO/Kri+i2IbFpm+xKMHiuISPB3rpFNZscxKKwu27S/PE+z4UJgk9h7Y9
   WjW+9IZS3othx0cpOKv/qqZvQjSFK4BmUHQDfXivMNtCJc35zvZYWvdQ3
   9oIRMGNchk06xNqGYbUrk0GfoRCVRf2ro3dI5BmIKVOD5hFl9QpAItbjN
   VsrhDbrBBSh7WGkyiSNmEfG97BrKVJgQ9Cructn9QZt9jtQrpULcS1seE
   45t1+vO36EcLHWFoQgFN575Uxx/OXMXjtt+NrA2KOp88cxmt+MenEXMre
   ipiuqqq4n7D6We9dV4tU6o7+2UXLw6Psjl2V34/Mdq93dfaRBUXq4ZtlH
   A==;
X-CSE-ConnectionGUID: fvvWwGdWS2+xzYKjo7bJEA==
X-CSE-MsgGUID: NE/ujTgsSGiAa+/4IpZHug==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52839942"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52839942"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:14:35 -0700
X-CSE-ConnectionGUID: UzLJfONzSxKdQyLaajiNzw==
X-CSE-MsgGUID: k1v+9eqERFW8VN5jdghhlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="157700648"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2025 05:14:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUP1M-000T5O-05;
	Wed, 25 Jun 2025 12:14:32 +0000
Date: Wed, 25 Jun 2025 20:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/irq 18/23] rust-project.json: warning: ignored by one of
 the .gitignore files
Message-ID: <202506252014.6CrzeGuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/irq
head:   a4365b5800b5e1ffc954628d80dbffea234d3513
commit: 90211f8354a8d834844ae16cc7a21c27639e65d6 [18/23] JOEL: Add LSM metadata
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250625/202506252014.6CrzeGuS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252014.6CrzeGuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252014.6CrzeGuS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   compile_commands.json: warning: ignored by one of the .gitignore files
>> rust-project.json: warning: ignored by one of the .gitignore files
   scripts/target.json: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
