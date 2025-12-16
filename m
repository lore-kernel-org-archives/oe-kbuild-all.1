Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666C125B2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 01:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849559; cv=none; b=WsnCAnWJnY4m05mB4HNKFvrvBaIrQU0Vmph2KoQ2mQ6zQ8WCGSq9bidznNRG5ICD8ury62tftLDG1ZHmVDB8O8zQxRA/f0L0XrSf/fp/dAKyc+K1Q0LhANADkwUg4gxZHG/A7MHnynVpCgKrOcEt9q5rFagf6kbqWyq0Hv/AAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849559; c=relaxed/simple;
	bh=q4ILL6QG74nvLnoFLPbI6dRrnI8PO2n5rqarjqgSKAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ec9zfTSvDkAthNLnjr8ZtL/CQ7ogXXQtlqaYI3BCa+GsxEwpQkNA/BYFtqqSWm5S1L0Z1IhC2rrij+qAconD8ur5NCr5rxXFEBSNYyvSJfjDbXBnSikyjDwwIhpdy9wkFPeUwZj6v1xAP7AbnqoRU27HHhJR2BOh0exHdsC79wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PshDhZsY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PshDhZsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765849558; x=1797385558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q4ILL6QG74nvLnoFLPbI6dRrnI8PO2n5rqarjqgSKAI=;
  b=PshDhZsYdxNTs2O8CkPVUPOCQQJSQaGPnwZANimzFoBZtMy1rzJwl5b+
   xmxIb8lGbV+bfNdhHhQPxNNNSLitNX8bAUmrtTMLR/sLwMNoATHzlV8VI
   RaSOxkWWPx6cKSsdl3ZLFqvKoRUxoC8PL8TMZ88j1CvT9Z1vLi0DUbqWh
   D8/ysxOCzfBp1EY6OqwBcB6SLPgmjYmDQ43a7d81nATYiCVc/Tg7PtDfy
   kTjF+4cWfd1L+Itgfyi6qqAGivuL4CQqXxl/1mxnYgRMRNXagDC5CGiG5
   UVUvfTy/SCFcGvUVMR6cGBx6r9ogc3OXzmqnd8jQNp4DaMjjZRa2QjQx6
   w==;
X-CSE-ConnectionGUID: 8X/uvHF7TEKle186/o2aew==
X-CSE-MsgGUID: AHNngmMVRH60ocRTmxXx7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66949825"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="66949825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 17:45:57 -0800
X-CSE-ConnectionGUID: DGY4rt7LSROhvaR6qLnzqQ==
X-CSE-MsgGUID: VHmYBONvTO24sJZCMrQD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202284955"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Dec 2025 17:45:56 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVK8Q-0000000011p-22Mj;
	Tue, 16 Dec 2025 01:45:54 +0000
Date: Tue, 16 Dec 2025 09:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/crypto/ccp/hygon/vpsp.c:381: warning: Cannot understand  * @brief
 copy data in gpa to host memory and send it to psp for processing.
Message-ID: <202512160910.Pa1uHQc0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 28b4e19791583d1b93313942b031326239349d45 [25/25] anolis: crypto: ccp: support TKM run on CSV
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251216/202512160910.Pa1uHQc0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160910.Pa1uHQc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160910.Pa1uHQc0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/vpsp.c:91: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copy the guest data to the host kernel buffer
   drivers/crypto/ccp/hygon/vpsp.c:294: warning: Cannot understand  * @brief Directly convert the gpa address into hpa and forward it to PSP,
    on line 294 - I thought it was a doc line
>> drivers/crypto/ccp/hygon/vpsp.c:381: warning: Cannot understand  * @brief copy data in gpa to host memory and send it to psp for processing.
    on line 381 - I thought it was a doc line


vim +381 drivers/crypto/ccp/hygon/vpsp.c

   379	
   380	/**
 > 381	 * @brief copy data in gpa to host memory and send it to psp for processing.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
