Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75182D98
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713212165; cv=none; b=T+OfT2zYvzp55RxCeT4lMCfHzrgr+FAEpxy039/7RWYfbMqVZE6yRMHuXRtg2PQkXh1k/4PF5ZelPDDt0my6xDZboh4qmqHAGpTLl7CYqUj+Cyg9SW9sPqO+EcgfWzyOdkOALifGf/OHRlFCFllpeXl9ncX2MvV5ROQhvYrPRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713212165; c=relaxed/simple;
	bh=wXWLkYumIbgPqkVp7Z0lNsJ39fLg/ouahHS2cHX8Xos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BZW5J8SfZnZg/BmOdler2+r0EyvrLlnuNA0sfhrblLTxK/uEoYM8GB9UBxvj+GCzq89idYygv+AA4ZP/iXuseD84vqixCiNXB7y78Hm5YJgQvLGhF1XxPg4/MobHzttMTLmLNtA8i+xKAX78SvhzAMbNR9yGMQXhLUpOUmVboOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aX3kIl8+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aX3kIl8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713212160; x=1744748160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXWLkYumIbgPqkVp7Z0lNsJ39fLg/ouahHS2cHX8Xos=;
  b=aX3kIl8+NV/AKJKRroNzvw2s6MdPMIhkg7l/wS5bEozq2CivrLAIxeGN
   JFNwkmyFKFBVrgx1fjUh0HxKVnzef2m7CzilRkbVXslBX5QeMnImkl0pD
   M7s++qbdW+I4385+IN0eNqxGYBSd6BpIQXA1+Qsqf1Hu0H2LH9DTV+mO9
   aIRTBv6RkMw8B5AEfuiWGkze/XxTxCFS57a+tEPXswUbRraro1yG2Mn0f
   rvNEv8uIm7mM111NXNDYxZWzUwJ6HuE1CS1GuT4nSmaF9flHtzKIw9VZo
   5eToGw0h/jv/z3PVzn5LA28di3XG/wVMiXrCOEM1SYMP730jX5ibOGOuL
   Q==;
X-CSE-ConnectionGUID: +Kd2XbcoQyy7EiHkmbbrQg==
X-CSE-MsgGUID: RU1qE8ENQiGwh6pMqQCQpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8484342"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8484342"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 13:15:59 -0700
X-CSE-ConnectionGUID: tIU9zoRdQLi7bAoiH9pjbg==
X-CSE-MsgGUID: QT+pICEGS2O7QuO/naASgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22493914"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2024 13:15:56 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwSk5-0004d6-2o;
	Mon, 15 Apr 2024 20:15:53 +0000
Date: Tue, 16 Apr 2024 04:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 25/98] ld.lld: error: undefined symbol:
 snmp_fold_field
Message-ID: <202404160430.2Pud5w2f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c4c1ee7e260d136fea1d11049b198c97b26b45db
commit: d9324ddd538a0b57dbee8623806ff9b9f7811202 [25/98] net: dev ipv4/v6 stat
config: arm64-randconfig-003-20240415 (https://download.01.org/0day-ci/archive/20240416/202404160430.2Pud5w2f-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160430.2Pud5w2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160430.2Pud5w2f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: snmp_fold_field
   >>> referenced by net-procfs.c
   >>>               net/core/net-procfs.o:(dev_ext_seq_show) in archive vmlinux.a
   >>> referenced by net-procfs.c
   >>>               net/core/net-procfs.o:(dev_ext_seq_show) in archive vmlinux.a
   >>> referenced by net-procfs.c
   >>>               net/core/net-procfs.o:(dev_ext_seq_show) in archive vmlinux.a
   >>> referenced 5 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
