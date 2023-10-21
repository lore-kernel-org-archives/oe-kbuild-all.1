Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D14A05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeDcdNBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697848359; x=1729384359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFibtADlMgGYz4PwV+OT540CYgkfmRhE/Gz3O5x53lA=;
  b=BeDcdNBZsHbLhb5CNyra2Rdpa54WT577zOF3ibifTiKYZ0K9V80c7fMX
   dz3vV0wJ8HiZr/8nL0IZ0yibQssaCxjpv6J23OupRtrU7fVJWAYvVT13M
   EVFv+ZXqbW1f2TSYOAYmyE0lwkv0/dViZ5Sz1WdCvpl4TMGfh4R9egOMt
   4LaiC4JkP1W0FgF7hysBROeuYl99QIRxtQXiE2fQo3yc4tjymb5yRI9yX
   NL9n0Y1m9apAfZFfF8ELONfdmaYNGVrT1WoUsgDaD1YndWGtTmJVhddsl
   Wnozxc7MO08XzXmRWOJ8vnDX739DjLfPjrkJ59tGFl/+fzusuwy4MKBWY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="365935394"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="365935394"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="931155842"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="931155842"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Oct 2023 17:32:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzut-0004A2-18;
	Sat, 21 Oct 2023 00:32:35 +0000
Date: Sat, 21 Oct 2023 08:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 34/43] checkpatch: WARNING:
 braces {} are not necessary for single statement blocks
Message-ID: <202310210828.xs1ufDH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: f024c18e6aa46b823a2fcdcce2c093eef5b1af21 [34/43] WIP: mm/nommu: do_mmap: translate executable mappings
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210828.xs1ufDH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210828.xs1ufDH4-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#24: FILE: mm/nommu.c:1218:
+	if ((vma->vm_flags & VM_EXEC) && result >= 0x3d800000 && result < 0x3e000000) {
+		result += 0x43000000 - 0x3d800000;
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
