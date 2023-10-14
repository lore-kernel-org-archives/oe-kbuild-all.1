Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA88101CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASf62oHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697291796; x=1728827796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GRUD6oWM3SLQaYqbezLJcvxX8mODSZr5dQ8KSpTl60I=;
  b=ASf62oHSCHfvgSMepIHPcN+wDoLOpTYy/PKafAS4oZJAIra7BqbH3dJe
   QdSut7tZ8wukZYHZnfltifRhFk7DE/PLsl60vzjSz/pAh4xybL3B5pDim
   87cCk2n7ZsEP0BnwF+4NhTrrwKF1x3lDvuNRZW57iq6gMBdqlKZuq/dmO
   1FfMfrX2DUIfUdAsJBpfBJ8IH3FEgWeTLKtDydP9k4I22YYBZlLpWCifN
   Ee2tUtCXunjq3nEXTybOS1zwxCM6rfjrkJ5vOVKwhnVDIpaXPMGwsYhMF
   S8jGyCykIAjXvdQh09/q7BLGyQBNMBm/0nf7xqTvKy1mC7TEZawn9/a2L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471556047"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471556047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 06:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748677194"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748677194"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 06:56:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrf84-0006D9-1I;
	Sat, 14 Oct 2023 13:56:32 +0000
Date: Sat, 14 Oct 2023 21:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-fsverity-kfunc 2/5] undefined reference to
 `__bpf_dynptr_size'
Message-ID: <202310142112.fkPYcDaj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-fsverity-kfunc
head:   1dc94c536fe6c5f3da4712d746698a38fdce474e
commit: 985728b637a47855dbf4c23c3e346fc51b647fbf [2/5] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
config: parisc-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142112.fkPYcDaj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142112.fkPYcDaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142112.fkPYcDaj-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: fs/verity/measure.o: in function `bpf_get_fsverity_digest':
>> (.text+0x248): undefined reference to `__bpf_dynptr_size'
>> hppa-linux-ld: (.text+0x2a0): undefined reference to `__bpf_dynptr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
