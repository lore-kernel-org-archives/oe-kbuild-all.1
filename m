Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C9C8E4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685812606; x=1717348606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6mvgXclEvZxWmR2IQvHMv+VhhvtR5RjC5l2jothIlY=;
  b=nEWJ204d4l/KwXiKpDxn1X1mawGl64daZ4M13IebvmOcuV9/ac/6PRaH
   S4BpOzzIbehVyEsm3UZKPPFlHzr6OWg4p2ZnjRXVN+9ecbUH9KaSYSqp3
   FX2YMY81LtU/en1E8Ow34sAvqUPiphrWw25Cfc0rEFqE6GcJ0YxjQ3f6K
   nODtgGhMytEjIXEeW6Z0uzmc5E8w3oFDiWfJPhweDufO+MgQxT3TitF/q
   IZoT/RRDOWuN+GcteDLQSYaCq2GpeLIGIkVj4fT5fpWu57GYbCKy8F18q
   D1J2soYG5Mm75EmSgVfpKseixdHVGSfmBs0GytHXi6/V6WIFkaH3a+rXZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="335715855"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="335715855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 10:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="702288615"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="702288615"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Jun 2023 10:16:44 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5Urr-0001pR-1h;
	Sat, 03 Jun 2023 17:16:43 +0000
Date: Sun, 4 Jun 2023 01:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [trace:probes/core 16/16] htmldocs: Warning:
 Documentation/trace/fprobetrace.rst references a file that doesn't exist:
 Documentation/trace/fprobes.rst
Message-ID: <202306040144.aD72UzkF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/core
head:   438ae37afde3d24731cf23e5b77370e76218744e
commit: 438ae37afde3d24731cf23e5b77370e76218744e [16/16] Documentation: tracing/probes: Add fprobe event tracing document
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=438ae37afde3d24731cf23e5b77370e76218744e
        git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
        git fetch --no-tags trace probes/core
        git checkout 438ae37afde3d24731cf23e5b77370e76218744e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306040144.aD72UzkF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/trace/fprobetrace.rst references a file that doesn't exist: Documentation/trace/fprobes.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
