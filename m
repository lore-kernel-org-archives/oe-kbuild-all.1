Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA5BE4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746931310; cv=none; b=qunWc5vfh6TdiyXt4DpVFtrYkIRQx0zO5o5dy92Jo/mL/0PHuVCEBveXpBCWpitYNvbxJiF1k/I+LevfOqv6kekXWvHQc/4aTLTFDSp+FTuT60I2ZHR92cCRQ/ld4YqNtz+Hi2ZsdlMfGfckURTy5JTcP6yAm5+uQ9TnXsGZbSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746931310; c=relaxed/simple;
	bh=wFlLoYQr4HtvMJsdxPWQVUef9uoYpqKWxZLi84mFgb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRbAsNuN9iW55GzVWGKH8I6GX0kheG2Pk3T5UCy9dbo3jtW3opUfu4ywFZ/tuBoT3iO3mbprEj3UCoukrMHmoiAolL3SyMYnppIIkC0kpFys5EyQSNSIoIP9G7Rqk3bvr5aEgu+OJbHQEFcDh6LzXlcFrQni19xykXHytFylyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qb8RhZId; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qb8RhZId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746931309; x=1778467309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wFlLoYQr4HtvMJsdxPWQVUef9uoYpqKWxZLi84mFgb4=;
  b=Qb8RhZIdeYrziP8T0kUUzxa2Cgs3fmXho2BJ1BfDsXHxztFgHkGf6kf2
   jpCt3o0ceguhhBoub2T0v/vWjdr/HTQYQ/Ivh4ttNFiGNtjEC9PyC04Sa
   jJz+f6CkraKrvLASiKPCxWLxsE43IiuMEmuauINJd8E59APJLZPpDN8l3
   4R85LVK/JzON3FFmzHqJSO3h1eowVeMo5zj6wwoLtZ6+IDa2JkAN0HUOC
   nlbF3y5H3J7rToS5vfeipH4HwAKTF1fVjsRHFRTPIpaCxYv8WOvzq49BM
   wsA65ZVyXWFSr2BMWiiPEVOr4bb200MolQ3ZO6fqewhp5Kb175UHsopBR
   Q==;
X-CSE-ConnectionGUID: iCIhaip4SgyPdOLhYXYCHQ==
X-CSE-MsgGUID: +Fa2dZ5kTYKKhvFdwmk1OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="59401930"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="59401930"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 19:41:48 -0700
X-CSE-ConnectionGUID: lLpfnabcS8CB7myXvQjdBQ==
X-CSE-MsgGUID: j7c/Xd15T1WmAPyIUbI6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="137403917"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 May 2025 19:41:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDwdN-000DXn-0g;
	Sun, 11 May 2025 02:41:45 +0000
Date: Sun, 11 May 2025 10:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [linux-next:master 7560/10031]
 drivers/gpu/drm/msm/hdmi/hdmi.c:439:1: sparse: sparse: symbol
 'msm_hdmi_pm_ops' was not declared. Should it be static?
Message-ID: <202505111047.hLZqZUqQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: b77770cfe2196e2b68ec01d87211bd28fb7be49d [7560/10031] drm/msm/hdmi: implement proper runtime PM handling
config: powerpc-randconfig-r121-20250510 (https://download.01.org/0day-ci/archive/20250511/202505111047.hLZqZUqQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250511/202505111047.hLZqZUqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111047.hLZqZUqQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/hdmi/hdmi.c:439:1: sparse: sparse: symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?

vim +/msm_hdmi_pm_ops +439 drivers/gpu/drm/msm/hdmi/hdmi.c

   438	
 > 439	DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
