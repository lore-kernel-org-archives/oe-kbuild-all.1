Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D23278E41
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404375; cv=none; b=VsGbf7FsQzb9eSJsPrIQCKAH776xnIlyAPRxOAu1zwMEThZRvgFbq1kPkGudEiINV9vl7pmLxn8nfDMjZbCpKuyvnOxyZ4VpjtmogD9JYbsFa0Ym/M1hpQLGn7mKNgX1RB1aj13ZEw6+rdrTpBU+PJTPx3BW0rHkF0w29JY5JVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404375; c=relaxed/simple;
	bh=kWu5yImY7RnE7tjfxW0C/fnaz3sADwtR4T125y77ruY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhOyVLFxAUwfGyDg5sr01Hdi/02hUJe7R6R4OocBKRsw9QTrjzU65QLZBfqbPY3ePamOMLn1RoIY7IUBISfyJpoDxTNwvdrF1UAxo3EnKcdP3gaaCRAoEp+JW2VviyNZ5a4TIAnomgeBheVplw8vox6NANTVcc3QAhtDUa7FZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlU8MeL3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlU8MeL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754404373; x=1785940373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kWu5yImY7RnE7tjfxW0C/fnaz3sADwtR4T125y77ruY=;
  b=MlU8MeL3t3oOSUwq++jl4FcpjuvMX9ljCnhBPP7HmiT0YBeuldDgD9II
   PReHe0fBw9TydwfK2XuouKyzmTcYXpjrYIyRE+jAdkzPDEEvhlGytzP0x
   zX2Fe41slGCN0ObupLUyREIXULPXw3HimKtIAKzg97e2jIAfNWf0XWoQs
   lEJg6RLb84zaHrCoWmY7dMtqIBKz8Z8tUVSQVhfPdjLVHiZlaehWhokNl
   IJdWc4yc9ln1N4uJixOLwO5wPHLxl0tSgQWfRVEJLy/MjMJvj1TDF7JOr
   +KW2iDMiT480dku5sgZ0xCvve2GhwY/BxLRiIl6GBaNyfERNNk58RcYOe
   w==;
X-CSE-ConnectionGUID: OKRmoo/NSMydaqwF6Iy9JA==
X-CSE-MsgGUID: r/+lVcUBQy2BFuNOTFCsiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68154101"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="68154101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 07:32:40 -0700
X-CSE-ConnectionGUID: kqpoYOevTD2xB+MFk49fCg==
X-CSE-MsgGUID: zVpxejR4QMSa8LSpsK8t5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="168688409"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2025 07:32:40 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujIiS-00020p-3C;
	Tue, 05 Aug 2025 14:32:36 +0000
Date: Tue, 5 Aug 2025 16:31:48 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2650/2650] WARNING: modpost: vmlinux: section
 mismatch in reference: virtio_fs_init+0x105 (section: .init.text) ->
 virtio_fs_sysfs_exit (section: .exit.text)
Message-ID: <202508051633.5bENwyOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5d1af5a159ade19469a4a6aceaa10d4cece4eebb
commit: cc6009cb24f9754275aa850a61fd12554acdec36 [2650/2650] virtiofs: export filesystem tags through sysfs
config: x86_64-buildonly-randconfig-2001-20250805 (https://download.01.org/0day-ci/archive/20250805/202508051633.5bENwyOF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051633.5bENwyOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051633.5bENwyOF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: virtio_fs_init+0x105 (section: .init.text) -> virtio_fs_sysfs_exit (section: .exit.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
