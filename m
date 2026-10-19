Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73181485955
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393467; cv=none; b=LdG5jBkgsxNDZLEuAzyfBh41P6kKtz45dKvMEH8g2BmtBKAVrF6XteJml63R6E483EbxuUo8+iB+81XSfKWcKcQyS4iptD2DV/4L+53+qWbUQBFAM5+Q0y/dXfZr//cXjZajHoZXDjmdAhWbmY33GtOQOHcNayYI11pfGC4JBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393467; c=relaxed/simple;
	bh=KdGR0L0B8sTgRcjL6DRdMwGYTDMG8ULTuuPtH9owaCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hy5q4ae/dkDIoqNjxvkWWtzm5JZv8sfiBUp7whNqE5GyJE7/8qKYO3ssnrGadEtXlFA/USLQGf4vT+NNghE80brcaMEbVLTErjqDY4OKOkFp6BUEDEtg1dEL4VIyLADdQUXp5DCLa15wyhk4qOdBtqwJxiZFiY9RDyeSv9oGvIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iw6BCv2v; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iw6BCv2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792393466; x=1823929466;
  h=date:from:to:cc:subject:message-id;
  bh=KdGR0L0B8sTgRcjL6DRdMwGYTDMG8ULTuuPtH9owaCU=;
  b=Iw6BCv2vxx77CqZvlh4Y+SGVoRnPmd4ipSc5x7SsysBj7bTVg74LcAc5
   ZN1dF7ekVV+XB5Ul/QjLovopVG6ZQqSurIeDYTGjI1S9FMH+uZDUn717A
   13XZdHdIxWF0U5EKYVpFz7GkCVPzKJyKEReaHB4nxa2e/NMIF6bEzw27Y
   I186FFF77GnLWqX/S9jAMXJ1cBXvEPdZWFRvpgowZ6tp0LNkTnUXIgedE
   Srj2RYeOfwZRaMBUCmPeIA8JPXygXkCNIGyDh33g4nRdzxkEqqcvL2MqB
   qsirMHzZaCdg9WOs5sP763YaoFXNK4l3B0GMUtwaFAK3Tu0+WaOhmy/Rq
   w==;
X-CSE-ConnectionGUID: TfcPrATpSoaIuYas0mwpkg==
X-CSE-MsgGUID: kJjmk7WaRKeHyZLlMifzmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1070286"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1070286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:04:25 -0700
X-CSE-ConnectionGUID: mLKkGVk3T16HiHesfMUm3g==
X-CSE-MsgGUID: /WVl4jySQ/WK7cMcfZDEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2459913"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2026 00:04:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIhPw-00000000LMo-23eK;
	Mon, 19 Oct 2026 07:04:20 +0000
Date: Mon, 19 Oct 2026 15:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [linux-next:master 3902/18293] ERROR: modpost:
 drivers/firmware/qcom/qcom-scm.ko: symbol 'qcom_tzmem_enable' undefined!
Message-ID: <202610191421.XPO84JIb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 8fecd3194de338bdc0c57597be61fdcf33e1832d [3902/18293] firmware: QCOM interfaces should depend on ARCH_QCOM
config: x86_64-randconfig-1010-20261018 (https://download.01.org/0day-ci/archive/20261019/202610191421.XPO84JIb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191421.XPO84JIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191421.XPO84JIb-lkp@intel.com/

Note: the linux-next/master HEAD 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/firmware/qcom/qcom-scm.ko: symbol 'qcom_tzmem_enable' undefined!
>> ERROR: modpost: drivers/firmware/qcom/qcom-scm.ko: symbol 'qcom_tzmem_to_phys' undefined!
>> ERROR: modpost: drivers/firmware/qcom/qcom-scm.ko: symbol 'devm_qcom_tzmem_pool_new' undefined!
>> ERROR: modpost: drivers/firmware/qcom/qcom-scm.ko: symbol 'qcom_tzmem_free' undefined!
>> ERROR: modpost: drivers/firmware/qcom/qcom-scm.ko: symbol 'qcom_tzmem_alloc' undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_SCM
   Depends on [n]: ARCH_QCOM || COMPILE_TEST [=n]
   Selected by [m]:
   - QCOM_MDT_LOADER [=m]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
