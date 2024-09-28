Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE00C1C6B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727535803; cv=none; b=aVTERqH4Ssz5Bu9hbnyigkz3hohEn3HEnHQREUBIs473H1UMhmhuE6QYloR7YEtIr/52H/VzHbhX6mNVckYfnosq2cjdPQWiAG8faN8xjjART0s8JwuXBnDRx+IlmCWWDdZCmshycLnAdhTU0amZQ7V7F61WcDB7I1uO3AR5jXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727535803; c=relaxed/simple;
	bh=JywcPj6wpYwYbiQ2z8p/VXCjyQznXmJgEp8/7s1HI2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpglcgdiszfy373ruK2ZiEfF5jgh+ufBpZplvkxl6nj5HlVKtqjJCd2RxM2ORZPdWFcy19wKG72sb/jYUlAFUBG0u4X1a6oXE+DCz6UiJKU7StlgLMHSp2LddGKwGrUzuFHyNgNr1SaFeG3phof093iXI8c5DuWgDJTfcPm3p60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/JeiIKp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/JeiIKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727535802; x=1759071802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JywcPj6wpYwYbiQ2z8p/VXCjyQznXmJgEp8/7s1HI2Y=;
  b=k/JeiIKpjPyqctrBXVB4Zl8lDL8pxFoL0s4na5DIJJOvSmCKa8nyQVYY
   lE20/BgbeJKORkc7Blqytfzon8C2qp+jc5zEPtpe/8tpAwHv43Axj6cE1
   1evRu+0c4S7UbNcCqYY0KYJH+QSY8bVcuaiKVmez7r38Uqsav3rWuX0SY
   /tBC+tJDTdcLXojK2MtR9PWI9uTA8ri8bEO8hEG1xrVuYqvaKwYIVOJj1
   7Gb9AevtjVlwJdpVoKCFcBZ64y+WYL+8/wo2VxEtRJNJtt9zlln22rBWx
   Mm5fG2nlt6eRpyyZ43tKffpN0sFYzPFr3G8syGZx6e+YS8xBHtbsY1laL
   w==;
X-CSE-ConnectionGUID: geDbsyXVTqCcEYx5HyXKug==
X-CSE-MsgGUID: efaz45HFSsSmvlcA2A+nXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37344379"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37344379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 08:03:19 -0700
X-CSE-ConnectionGUID: b046xog1S+WH6br5n7p5Sg==
X-CSE-MsgGUID: EPSlnDUtT5uZCYYUsFnNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72502125"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2024 08:03:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYyZ-000NLr-27;
	Sat, 28 Sep 2024 15:03:15 +0000
Date: Sat, 28 Sep 2024 23:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19685/23799]
 drivers/md/.tmp_dm-verity-verify-sig.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202409282255.GuxtXkRJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 193a981127632c7d4c26a0674881dea0c208640c [19685/23799] dm verity: add root hash pkcs#7 signature verification
config: x86_64-buildonly-randconfig-002-20240926 (https://download.01.org/0day-ci/archive/20240928/202409282255.GuxtXkRJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282255.GuxtXkRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282255.GuxtXkRJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/.tmp_dm-verity-verify-sig.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
