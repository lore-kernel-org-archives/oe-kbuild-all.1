Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617018003C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031815; cv=none; b=R/K5kBw0Eot8qOH1JQ6hTkKdlbaSmvWf9SZ4NTPq5lhaM5Kvfkt+iHbBB6b25iW5oNVaF6/sr2/Da8ujLKrI6qJ4yzDWB+NNBB7WLBlmY17alc3JFFABhg5qhP8GFF/wzGGVHq6bD8N8qBrOfBzgv9pp256KRZRUH6mNTQ8kOA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031815; c=relaxed/simple;
	bh=U1EAHz1BY6ZZNOUDkzFplyENqB8GNcxj/arn4xP1Xw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sM00fRrmbtfWWLbexkcLZa3xDiHVzwqL4PUBUbYj+bHMiPDVWCkTVYIJlNixg8ymXPKKnjK4GgB6xzou6KP/10CzWySyCdaM8QRuvJQKasbCaXOmzRskwEcNrBC22Lps6SrE95ZpEiwlyfW1u8yETN1M9mEx/FYuz8khymjzGLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyoDNhkh; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyoDNhkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706031814; x=1737567814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U1EAHz1BY6ZZNOUDkzFplyENqB8GNcxj/arn4xP1Xw8=;
  b=QyoDNhkhSk8gTW3DWIC3hD1zKBS3/Gh6bPjKyiackyzxOShfSPAEfrJp
   Gk+J1tMeSO1OqzEevk90pYnqQP82DFAjvLwhepapAlyhPNhM3Ayb3JfQO
   y0+7m28QkfmJvBoe2KXI6HNAgsILRLus7WEo9iUE4oslDO9qOFrHES9iE
   HHlbBLSWEDFVoNpNDRH5RR3fHeg9bDgHW38wU+guGCgB9QCauSA6ulvvh
   nhooZGa6wjQ9EWT28CzgHwr/WlMu0boLj72LYuF0IqOET8HG617HVi5sA
   7lJ0QJCu/CoqadHs2BIpfxb0GAjhw9ziw5Jx6EorJD2uul51u8QQbCfMw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401257877"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="401257877"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1659507"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2024 09:43:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSKo5-0007aZ-0u;
	Tue, 23 Jan 2024 17:43:29 +0000
Date: Wed, 24 Jan 2024 01:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 865/1400]
 drivers/regulator/qcom_smd-regulator.c:14:21: sparse: sparse: symbol
 'smd_vreg_rpm' was not declared. Should it be static?
Message-ID: <202401240123.wBsFom3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   774551425799cb5bbac94e1768fd69eec4f78dd4
commit: 5df3b41bd6b5432010d6d85e5aa7217bd8f6b0cb [865/1400] regulator: qcom_smd: Keep one rpm handle for all vregs
config: microblaze-randconfig-r123-20240123 (https://download.01.org/0day-ci/archive/20240124/202401240123.wBsFom3Z-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240124/202401240123.wBsFom3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240123.wBsFom3Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/qcom_smd-regulator.c:14:21: sparse: sparse: symbol 'smd_vreg_rpm' was not declared. Should it be static?

vim +/smd_vreg_rpm +14 drivers/regulator/qcom_smd-regulator.c

    13	
  > 14	struct qcom_smd_rpm *smd_vreg_rpm;
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
