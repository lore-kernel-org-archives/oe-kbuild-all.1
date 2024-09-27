Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B299443
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727462561; cv=none; b=GnqhDPsSXl9R163VLAZVTN14skAz7POT6pJbP8i+Sa0uSUwngJksYvtajO+L8uBbUfss4RYG6PXhBNGTN+kjsOiCJ8aNGlj+s2PaY+ePqnxP6B1w3cmNDStXB3RJqrOgjDlOF+Ao8bcyDHE07PPQcCEWRel3sRxNB9wxiDNnBjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727462561; c=relaxed/simple;
	bh=ot7gQ9dG5J32TWHwyeHXpvRpifz6GJqyeltKebKbEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IgdfwEHR7D3zw3xxXlp0BDY9jx8h2mBhdiQxYBdYioVrn9KYKY0S5fgfmS1zjzIQXgFYCGWbZDDZh00U212/mg4ut7UWj+DP0SYb58HTLZ5JpEI08dfLW4VylsusxH+dA4kZycTMkPIwnwQpqXXGbNVwhNxK8r4nJHJ56CiHeUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/Cz1N0i; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/Cz1N0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727462560; x=1758998560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ot7gQ9dG5J32TWHwyeHXpvRpifz6GJqyeltKebKbEcY=;
  b=N/Cz1N0iMZTjpsZw5BKwEz4JMVTq5WxMNy2TPZONQIQuXwwG9+JrDK1E
   pTFZaNfEWiFI2URhJw0REe/N62Oxj1s3EcaQvD5h35Bkc2HY8p914KtMF
   uJogfduU70/0BGP8noEqnVbSWh6U8Hpu4uI9K74tZjjIr1RS0GBvqjApi
   Z6dCVr5pWlTQbXKVuJ0GjydEjX7n5fmkzLTHNhc0mDB/UD3/sLD11kFa3
   PXx787djwCIhzuvGkSOPTirztnfd4JN2piJHkQuTkjc7qfQgDe0a1ovjl
   uLos8lb1nwK4wyE0RpZNeYBKO7dNnPrYibRzn+q/LjpEZGwx0VrP0RoKj
   A==;
X-CSE-ConnectionGUID: AO0KAuWwRsSoaVkEcPH+sw==
X-CSE-MsgGUID: HikTWfgOQ1K0UsmjrMPFVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49142871"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="49142871"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 11:42:39 -0700
X-CSE-ConnectionGUID: YV41aH0DR1qNu2BER49zaA==
X-CSE-MsgGUID: dsdmqJPYSRutjT9Rcr2hvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="103425932"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2024 11:42:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suFvI-000MVD-0s;
	Fri, 27 Sep 2024 18:42:36 +0000
Date: Sat, 28 Sep 2024 02:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17967/23799]
 drivers/hwtracing/intel_th/msu-sink.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202409280233.aF2FycBU-lkp@intel.com>
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
commit: 4d516770f81434cde260d33430626e3880b9902e [17967/23799] intel_th: msu-sink: An example msu buffer "sink"
config: x86_64-buildonly-randconfig-001-20240926 (https://download.01.org/0day-ci/archive/20240928/202409280233.aF2FycBU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280233.aF2FycBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280233.aF2FycBU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/intel_th/msu-sink.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
