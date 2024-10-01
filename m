Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171827448
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 16:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727801269; cv=none; b=YDXveMVGtI6HdqwR8knTX1mO002EQTnlP+ZKakneh6vACCSDPRTF4p9rJpjvCBIAhRX0WSy7YOTa2pgOAD/apA/T6HZ2OVyy/rBdWmyifoPghmXSpUJfNOAMdy2krZhAteeEjKPLPYDvfaXw7URMb+tWjSJn+TYy0l4pCFz2eWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727801269; c=relaxed/simple;
	bh=lQcBkNOtHfMq2LRshPZpWIVuKjHwcZvlHstwu/NdiYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTauJJCNKQE2v3k/Ig6AFu2ARUrLGgzi/2Dqkhnz12fLKKVeplGABhERmQxgw07VR24W0bLzj+yirHlOgJ58ru59+/8s9jx68affY9IDScVkKbVNNSn5ThCo5kHIOt0q3DB+ULUWPbzqxaSx0G6SIxAzX716CyLI+L4EuznmetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R//w3Kfo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R//w3Kfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727801267; x=1759337267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lQcBkNOtHfMq2LRshPZpWIVuKjHwcZvlHstwu/NdiYw=;
  b=R//w3Kfofo7OoVwh1SpMEMVtVdZAqRknxGPyedcTCuhMqTHMmeeK8FJv
   nj4gWLnCMW6eFZxJ3K09zGlK4n3yaHSkaiZS3URqrjTR0AcxLVDmxW6kz
   9QFRUPzKqK7RAO/V9PzJnoS2fReh1zhr9fI/PVfaWKIYlKXonMMXXbJNR
   fipGpiq315IbZPdk6D8ebJCyi6vxmLX/qcisM6ehv82+XUuI/wW+dp7Fl
   aHUuHD3RK/d/ornUGTe6uiAtx3XK1fMEyP4HxqGAfoIHHHNfuX45Rrb3N
   VCiA8758owxBablU5xR0tGqGcF991V2W3R3QSrbeDKdJsiLhIIl+Q/kPX
   g==;
X-CSE-ConnectionGUID: Uy40jpuMS+OaPjlHT5n1/Q==
X-CSE-MsgGUID: ks3egdvHRVieQWMeERTv2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="52356329"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="52356329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 09:47:30 -0700
X-CSE-ConnectionGUID: /QDEMzS0RueJv3jWxlAvUg==
X-CSE-MsgGUID: w5UluuTHQDiXa5eiIxJ1Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="73848154"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2024 09:47:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svg22-000Qvh-2D;
	Tue, 01 Oct 2024 16:47:26 +0000
Date: Wed, 2 Oct 2024 00:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11555/23811]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202410020035.4BK3PpPS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 8ad07513042c8fef5a03b404f0bbf066f603c101 [11555/23811] net: hns3: place dcqcn implementations in an ind file
config: x86_64-buildonly-randconfig-005-20240929 (https://download.01.org/0day-ci/archive/20241002/202410020035.4BK3PpPS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020035.4BK3PpPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020035.4BK3PpPS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dcqcn.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
