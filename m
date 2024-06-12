Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C916D4F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718196411; cv=none; b=mRGn7TpxEQbR7OL3wFsAwGBG1CkOFjb97PnU6r/okrcEtKQgo3iXrQ0vfHJ/21ANL/6E1X6dmnSlLpLmU9rWBjCJ//1oOVsnmoCUvQ4jv1KBE2v+r+Oo5uJYsJYaEioZsW82hhORGE6XRnSdDlfmrtCtqequZGJ+D8Ut8mpnO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718196411; c=relaxed/simple;
	bh=va7FNB1yWLgISJxyU4dPtO9YIbiGnzhqA3FbRiaF9xI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWkO6M/LIJhPnEffzodWNoQ5K8V8RFBeF/SydcSLNBCvzcPbOQ6naBa+ZdRf/4uevtTzJ/L8UwFupVU5C5Ms+y0HLM0HZ2bkGXxQM5HD6bJAWWFeIqCAU7SsIGASsTLEjPtJZD4/yY/am55QmaNJgHSGEMQ28qmayRpFtR54V4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFthuF39; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFthuF39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718196410; x=1749732410;
  h=date:from:cc:subject:message-id:mime-version;
  bh=va7FNB1yWLgISJxyU4dPtO9YIbiGnzhqA3FbRiaF9xI=;
  b=hFthuF398LAtL2Fw8BcFhk8bNEps1FY2siRrMA8cAuWN791rAWcXn/i0
   lanjrp+1EuAncr+YOQPzi+NXLoNY8molE6mDaQ7WzMChX2yJr4ZbtVHHn
   1j8GXIRSBoiG5B/6VP0u14+QZ5U7e2Y/9tyfQky2ZPKDZtPC1/FH297Ld
   J5+y8bSsWLfSrsZXuAdrb3YigyZs374Cg2oOatbM2ZaAgEGTkL1ZykExL
   w5if7ndCGbAIahxA78rCVTsCVrKhTCT5k+KBYq5/CLtocycNoIWmgs/ja
   baCoR7x2rwVuCAiBv0B+Fql5wmHZHau5HT4P5YVb84Sb9LS7VOHVEYKyZ
   Q==;
X-CSE-ConnectionGUID: I2bkYjfVST27+Sf3x4KnOA==
X-CSE-MsgGUID: oZcvOBy2QyiJmKLwN/nOcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32493080"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="32493080"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 05:46:49 -0700
X-CSE-ConnectionGUID: 0wF2i1awTTW+xfgUuqIvew==
X-CSE-MsgGUID: WQ9cxxtfQ6WqRSW2ri8RJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="39663656"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2024 05:46:49 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHNNG-0001XA-34
	for oe-kbuild-all@lists.linux.dev;
	Wed, 12 Jun 2024 12:46:46 +0000
Date: Wed, 12 Jun 2024 20:46:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 6373/9999] kismet: WARNING: unmet
 direct dependencies detected for PM_GENERIC_DOMAINS when selected by
 QCOM_AOSS_QMP
Message-ID: <202406122014.ExgQvV5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: fdd3df25c06810614b642173cf8eca20610958ce [6373/9999] FROMGIT: soc: qcom: Add AOSS QMP driver
config: x86_64-kismet-CONFIG_PM_GENERIC_DOMAINS-CONFIG_QCOM_AOSS_QMP-0-0 (https://download.01.org/0day-ci/archive/20240612/202406122014.ExgQvV5G-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240612/202406122014.ExgQvV5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122014.ExgQvV5G-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS when selected by QCOM_AOSS_QMP
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
     Depends on [n]: PM [=n]
     Selected by [y]:
     - QCOM_AOSS_QMP [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && MAILBOX [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
     Depends on [n]: PM [=n]
     Selected by [y]:
     - QCOM_AOSS_QMP [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && MAILBOX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
