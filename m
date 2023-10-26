Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354415C4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBMz5Kw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698287876; x=1729823876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjPVDnZ+2ujEN1pFpOHWWqdhSiV29N9aw5sjx3PpyfI=;
  b=ZBMz5Kw3ED39f8cbcE0o/8MWw+Joc28E/Ri7d999rlPmH//NMujLhXGl
   oFEYY8Gw6rZrpazsGmK6RhHviTXRlc4GBpN2z5M3Q6/yt/aOsK/IMbRdj
   11DxlZ80uGkPPP/8pZU8fdJ6dB2OJKBM+PnBx1OkqqS6w3TTEfOJEYhFx
   rHJKlzwTpd4+p7zacp2COGtC5se/3/yomXtnx8ZUUBTnOkVbaCkSMQc/T
   GO2HLfGC+EXDva8xDUn18k95amCx5IP0EfaUTG7V67KQU0dLSkVyS7626
   gyxZnQYx8xYRJT/gkgMEjTvJE30Y9N+C4bWmd9fa7zMtoeN7WAqxIFuCJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391313798"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="391313798"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 19:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1090442953"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="1090442953"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2023 19:37:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvqFr-0009Oh-0m;
	Thu, 26 Oct 2023 02:37:51 +0000
Date: Thu, 26 Oct 2023 10:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 10651/14992] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/iio/imu/bosch,bma400.yaml
Message-ID: <202310261059.USL6VstF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe1998aa935b44ef873193c0772c43bce74f17dc
commit: b512c767e7bcef308ee5b038405debf9baa9c579 [10651/14992] iio: imu: Add driver for BMI323 IMU
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310261059.USL6VstF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261059.USL6VstF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/iio/imu/bosch,bma400.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
