Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F318203707
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148195; cv=none; b=KfgX877Okv8tfcrN0eDjuHp9qNYqyCFTrlxIp1ah+74fvyY8H4Jod3pn+sf8J9U6bADVG0A0KzMblhEtIoJOcWgfLHO+xbeR/klUl9Qw8hA+UMNj6v28oIEToGD7VUmOio4ekVMGg9x7uRpzq8XffXslY6YVeH5Ekwto0awQSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148195; c=relaxed/simple;
	bh=dyqQ38rseq9Aianu5Oq/oG/Ry3vzwUrjlfprbOXiafM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+yU3kBys0VSHf441RYwo7UatqEd3vGPO8Q4twlkjDqRv9wMAJaDKhP1/ULj7pfhmHvHqEEtbFAukknOqcV1VMnhfMvLDheeTIpP+DmaYeA+TmgZ3n6XE6/rAJSrlmuRC5EvmXPs3bzRyTQvZizQPH/TJhzSsAuNntkwnH+7RJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEqEw5qR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEqEw5qR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733148194; x=1764684194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dyqQ38rseq9Aianu5Oq/oG/Ry3vzwUrjlfprbOXiafM=;
  b=SEqEw5qRa0vUcBlp5vsOoiSaeu8PyPy4bgmDRDc+VsjTVvlXlro7gd0J
   sfJbZ4Gi2bbp62Hr6V7hfjLcKTB7hnyA2LyTUgUnNyA8U/bQLO82GuZAF
   Ve3d4Fhd+wlKZebcT30JCb6TtSQqPeG0E8OSZH6I1xMpXO/fpEpk2wPDS
   vB/UuEiFoi8CsXp1Skne0ie4qYR+71NuIgvE2NIOiYN3EmEejPi6wM1k6
   zs+d0Cdf2Giw+gb2Q2+LsqXfDwcIM8ObucoHmu25crTtIzxUB3OxEWv1K
   9HdtFkLHjkN6Mmsk4xkCIJ2R7bG9JAD+2h9N+YJBc2FhPNSSxU+Nt1QRO
   w==;
X-CSE-ConnectionGUID: bZuIfZdaRVKF5AcR/gZSvA==
X-CSE-MsgGUID: gBatyyw8Q5GUQ0Lo50UCyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43927718"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="43927718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:03:13 -0800
X-CSE-ConnectionGUID: xsWPDAflRyOHLyvdK3+aNQ==
X-CSE-MsgGUID: Un+ATuaEReu/KDIPcDcPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97882845"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 06:03:12 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI713-0002TB-2m;
	Mon, 02 Dec 2024 14:03:09 +0000
Date: Mon, 2 Dec 2024 22:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1268/1268]
 drivers/md/.tmp_dm-verity-verify-sig.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202412022223.rGhuTZ2P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaskaran,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   312efa97a54edf7e64f108312c4d8c6961a1abaf
commit: 193a981127632c7d4c26a0674881dea0c208640c [1268/1268] dm verity: add root hash pkcs#7 signature verification
config: x86_64-buildonly-randconfig-004-20241103 (https://download.01.org/0day-ci/archive/20241202/202412022223.rGhuTZ2P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022223.rGhuTZ2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022223.rGhuTZ2P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/.tmp_dm-verity-verify-sig.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
