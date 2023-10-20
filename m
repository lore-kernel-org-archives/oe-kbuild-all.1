Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFDED2EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxPD2yam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697786760; x=1729322760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Whzcw7v3tBOfNrRnEsD4bXPdpOJppBBNXlu8AsKouG0=;
  b=BxPD2yam1893kTr4lxfic+Yi3s6kWaH1WuP92aln6atc/cY19cNysPKq
   bJmUUEG/BvfUqulkjPsVkpsjYR6mQ4J82cp75wZ5GOMPDYS6rAeDj/b8c
   utifb5ADw5Fs/5+3BG4QNZQuSTukEqDHZeS+BIXaMd9+e/UjeY9bV0ruu
   PssxrXi1yyCIVXd63LbA5w67oMos7P/3wgYP3r5bjxiNDJTTNP+yhj3Q0
   mdguXC4fYU4SjvHE6SruOPMzlSXtr20Q9+FV4t7CV1BiOBVD6ROdxtD2C
   YcSkWbUWlAN5zSODp0oOFYrRQNb4ho2DaeI9lWQDTMNaTOuCJJXBVwLAA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386261873"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="386261873"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 00:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="823146804"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="823146804"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 00:25:56 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtjtJ-0003Cu-1z;
	Fri, 20 Oct 2023 07:25:53 +0000
Date: Fri, 20 Oct 2023 15:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/btfids_5 4/12] arc-elf-ld: cannot find BTF_IDS_DATA:
 No such file or directory
Message-ID: <202310201537.5KZADHmh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/btfids_5
head:   960fc70930b61365f1fc8d448796360cbd1edad0
commit: 805e67e929faf4efb8a2455b0de6cbf5bd86669a [4/12] bpf: Add btf_ids support for new sections
config: arc-randconfig-002-20231020 (https://download.01.org/0day-ci/archive/20231020/202310201537.5KZADHmh-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201537.5KZADHmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201537.5KZADHmh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arc-elf-ld: cannot find BTF_IDS_DATA: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
