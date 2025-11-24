Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9FC2DBF47
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763966573; cv=none; b=fDsUYuywmO5M/bjdIm2VvD398LHmvGmHdw/xZm8ACRPDiIAJ2Y9+Nozr1M83EEBcWLatAM7AbF9q1HAsrIaY7pQrtizfpj09MpjQY+NqvV7JmeJhz8G6Zj/uSD86wDQXF9G+FCWj4ENEzO+mOomCf98R0Z/75pnlSNpx82QfabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763966573; c=relaxed/simple;
	bh=DLuCo1oDVxsfhuRsJPjbW2pl7rak+RgGR5fIxL78+Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoZV2NbB5fijWYCQYf+m0S/x84JOQd1NSXP/apr0poKO3i8atLc+Wa/CUhNbzBuvvbZI4HeFRoaVbDSXgdCDnw/t6IRS0MlleIJJc0b0Eg6orJ1zwHgMicdT63+60JLMOcOFkOLfGlc+vv0f+nImExBqVqsb3vo9ist+T/Gd0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uugruf+v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uugruf+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763966572; x=1795502572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DLuCo1oDVxsfhuRsJPjbW2pl7rak+RgGR5fIxL78+Cw=;
  b=Uugruf+vhFAHcVs78t9O1xXhVKcgCuk1s8RlDMPlPG0jfr9T4jIB3q04
   18RFTfU1rZruikgAucY8qH7PmNiJzS54z4kF6FLFTw6cqsNujWX5o6Ky3
   dpRTO7L+lZcdCyd7ZpepRk8bPjgKsFEVZo2Y+rKF5hvKsAS7AsF3ft9bi
   rZkM83ZKG8GqbocForw8pwRgIB95mACvgE/umRVcd1o6PDbeSAIpk8YNf
   AXZu6T/3qW+pbo+Lkhoe3qLdbXuHFecRXkuja6fPFGQvmmnxc2xnA6LNu
   YtT+3HqWDe8dYKxSEywbmjaLS0AiUjd+mSyqQ9PZ6zjjmiIVa5n1lJsaS
   Q==;
X-CSE-ConnectionGUID: M7kx+tycSwulENn5lyKcaw==
X-CSE-MsgGUID: 3oic3yH1SdWgOSaZ3MebkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="88611724"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="88611724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 22:42:49 -0800
X-CSE-ConnectionGUID: g4ehXqOeT62OCaFk8D7IGA==
X-CSE-MsgGUID: 6Y3zspM4SbquAnodzNIQpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196531519"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Nov 2025 22:42:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNQHe-000000000RQ-0bOb;
	Mon, 24 Nov 2025 06:42:46 +0000
Date: Mon, 24 Nov 2025 14:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Siva Reddy Kallam <siva.kallam@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Usman Ansari <usman.ansari@broadcom.com>
Subject: [rdma-rdma:wip/leon-for-next 35/54]
 drivers/infiniband/hw/bng_re/bng_dev.c:14:13: warning: unused variable
 'version'
Message-ID: <202511241404.IbO6uq0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   45085ad3b2a35868e6b6852657f892abb631b8a8
commit: e873663e5f05f355aa40e372f516fe3949fdfc61 [35/54] RDMA/bng_re: Add Auxiliary interface
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251124/202511241404.IbO6uq0v-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241404.IbO6uq0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241404.IbO6uq0v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bng_re/bng_dev.c:14:13: warning: unused variable 'version' [-Wunused-variable]
      14 | static char version[] =
         |             ^~~~~~~
   1 warning generated.


vim +/version +14 drivers/infiniband/hw/bng_re/bng_dev.c

    13	
  > 14	static char version[] =
    15			BNG_RE_DESC "\n";
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
