Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5278CAD29
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692018393; x=1723554393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEIO+CEbB7/+aB/5j7jUTM+uW+eVRwrcIQY6SPRJHLc=;
  b=nJB/YokvbWTwHFKpQUafWTRb4qwHM45DMhnNmd70g0o0W+BQAmfdMv+r
   MB0mU68fDsS9fk0l1V6lWSTrMwGYf7vOf5oFt1tUHiyHtBYbr/6D6LjcL
   T0PhQhcyVJrneP2Yb3wjsv0R0peTLZvzo0ks9/SCUTPqbyw6+5FsdbUGH
   wwfH7DVZLeM8Y2emkIS3ReIupuI9CbfJ9o1USPDMptqZYEXhgxKFo6gOs
   eST3w6mIVnQK1llW2+cyyfvPPqNXFlzDN/vcibln4P7/05CST/oHXtUYU
   lQ0l7zCLPPibhPUQAAr048pvxjnDkEuCRNPjKWC48gfKRS9tHevjfFN+7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458394125"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="458394125"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768446803"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="768446803"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Aug 2023 06:06:30 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVXH6-00009b-0h;
	Mon, 14 Aug 2023 13:06:25 +0000
Date: Mon, 14 Aug 2023 21:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Tony Lindgren <tony@atomide.com>,
	linux-doc@vger.kernel.org
Subject: [soc:omap/maintainers 1/1] htmldocs: Warning: MAINTAINERS references
 a file that doesn't exist:
 Documentation/devicetree/bindings/arm/ti/omap.yaml
Message-ID: <202308142025.Bua4jLjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/maintainers
head:   fda31904ffbc7231898198333804fa551b681387
commit: fda31904ffbc7231898198333804fa551b681387 [1/1] MAINTAINERS: add board bindings list to OMAP2+ files
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142025.Bua4jLjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142025.Bua4jLjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/ti/omap.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
