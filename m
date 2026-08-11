Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2838978F3A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467327; cv=none; b=kLsgHat01uTj4wEFPlyPgECjG4YN3cqcxSZOFNuTwXXiST5AAfiGB/bjjdXAr0dYTcXkbeSXp8lWjmT8JWzEvGkEZflPx9QG+olP66K9/SKBSxFd2ktq4PTyPajlbyTiRLDbQ1BzxZccbukT4Ys5EQxT8O2N4GXPdVCoUqZ8JAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467327; c=relaxed/simple;
	bh=cGFmFNA3JSKtffZB8/weVzRdENRI8JcnBeVz1rOJMbg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e3MI3tE0gD0ZFHEt3Blh0pQkMZJqNs86S7TcqcM7GwRyH0bx7J/3HAuT1PrZ38CdyOO5HXnXXW3yYNIeF9seQDKU2xLPtGNctzTr9tJ5Ww578aNnSTQcx5Bf6V457jfwqrA+3KvZ61hJ80TBy8KWn1D92W/xiTcDBruQ8X6sh+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dw2pFrTQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dw2pFrTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786467325; x=1818003325;
  h=date:from:to:cc:subject:message-id;
  bh=cGFmFNA3JSKtffZB8/weVzRdENRI8JcnBeVz1rOJMbg=;
  b=dw2pFrTQFYD7LR9PWbNGybUbtdZVoMx5BrZmcENgi5X/cd2QEkGwDWF2
   SSXjKdyT1TwZOy+KPdaFug/w8Z50DGUUxHwwKy+/ro8AU+mEb0czjg9fL
   lrsIVjnRBqJj/DcWCQMWno6XcOP1oqVoYP4TbgARMFEzk2npoT5rLEcQ/
   ErkXLQP7I4u6WUORE+ECofu6ExZ2Q2qmPxAVZ3pJKRS0oe6uqbQ/RKpA8
   3oQ3MSMQomeEbhmGZghQk6rhKRemZUrYyu8rmqXWA+SlNVuDuByAQi8CH
   SAsc9TXGMK8OIu5IVQkSMosnWTFMn1A6ivNVCX1UqnHL/ZFNM4vdkyDTY
   g==;
X-CSE-ConnectionGUID: HA4joXPaSB2er6X8e1C2Fg==
X-CSE-MsgGUID: 1kE84o/BQSScgCOnJlTLeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74541643"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="74541643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 09:55:14 -0700
X-CSE-ConnectionGUID: OOdclZzYT9ygsnY0y1jbCg==
X-CSE-MsgGUID: zoaPrHJCRyiD8fk+2n8wAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="288106294"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2026 09:55:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtpks-00000000P4o-3rvJ;
	Tue, 11 Aug 2026 16:55:10 +0000
Date: Wed, 12 Aug 2026 00:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lumag-msm:msm8974-iommu 7/96] Warning:
 drivers/firmware/qcom/qcom_scm.c:1180 Incorrect use of kernel-doc format:  *
 qcom_scm_get_feat_version() - query the version of a firmware feature
Message-ID: <202608120002.lkYINtbx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/lumag/msm msm8974-iommu
head:   3ec77ed4d75ef16356dff9a2dcc7f3842c02f204
commit: 127aa344565c14c5a6902baada9fe9fb24752029 [7/96] firmware: qcom: scm: add qcom_scm_get_feat_version()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260812/202608120002.lkYINtbx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120002.lkYINtbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120002.lkYINtbx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/firmware/qcom/qcom_scm.c:877 Excess function parameter 'pas_id' description in 'qcom_scm_pas_get_rsc_table'
>> Warning: drivers/firmware/qcom/qcom_scm.c:1180 Incorrect use of kernel-doc format:  * qcom_scm_get_feat_version() - query the version of a firmware feature
>> Warning: drivers/firmware/qcom/qcom_scm.c:1189 function parameter 'feat' not described in 'qcom_scm_get_feat_version'
>> Warning: drivers/firmware/qcom/qcom_scm.c:1189 function parameter 'version' not described in 'qcom_scm_get_feat_version'
>> Warning: drivers/firmware/qcom/qcom_scm.c:1189 expecting prototype for qcom_scm_restore_sec_cfg_available(). Prototype was for qcom_scm_get_feat_version() instead
   Warning: drivers/firmware/qcom/qcom_scm.c:877 Excess function parameter 'pas_id' description in 'qcom_scm_pas_get_rsc_table'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
