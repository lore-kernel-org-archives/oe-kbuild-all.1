Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B918E1D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFZi+86w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302678; x=1728838678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hDJs7kAoC5QWvZZ/Gs2rACnK834llO1zH2AIJB1vQmA=;
  b=KFZi+86wwI+m+0d8PfB3+PP7a3cEiiai+IMz3xT60/8q0M02uQR6icLm
   BvsMiDMQoxolTP2xudpC9R0n0hNBjDi/bdQjQR/WS4kws3tsGRNymXsh5
   a1qdAmIXeBDjM45qTIu/yMQTBAY5jk9qtqZfwiN8BIhUgdS85Ooe07j4e
   fJ+1kJdXnRgcG3njki7PISRSAp7esCciYQ7119QYYDW9Vrnky7WWrOBjL
   tIijnGoPY1rbFBtCRTin3tKQ7Afdg9NHDGYaINohFyAbm/8Z0fHbs5a83
   g0xu1ejnozdqmkFY6DYVxnb7k2jzFZ6kbr2TdzeJM9GsYbryGpn2QsiL5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3947126"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3947126"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748712366"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748712366"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 09:57:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhxX-0006QB-01;
	Sat, 14 Oct 2023 16:57:51 +0000
Date: Sun, 15 Oct 2023 00:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 77/101] checkpatch: ERROR: spaces
 required around that '=' (ctx:VxW)
Message-ID: <202310150051.gJbdUhvD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   5923ca9112dd53a998ef4b986edcf65ee0b9065d
commit: a6c462a20c3d2dcf7597729ed0b2d124954fa61d [77/101] resctrl2: arch/x86/rdt_mbm_total_bytes: Fill out resctrl registration
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150051.gJbdUhvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150051.gJbdUhvD-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that '=' (ctx:VxW)
#64: FILE: fs/resctrl2/arch/x86/rdt_mbm_total_bytes.c:34:
+	.mon_domain_file= "mbm_total_bytes",
 	                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
