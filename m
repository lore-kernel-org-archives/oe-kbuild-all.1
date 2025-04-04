Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E944DF5C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743733592; cv=none; b=aZYmn4PqkRv+S2kD265KuM6ujDyrOZOR83oOLGlU+2NJmlb/4RdGpNJ0nOAmxbAHXqB1E5Hd7CUCN9uQ3H9OxefFahZ3gQiCvJORTzyqdFhVxN3BoIQYTmAUrvuagdmZEQQyAC71DFgRZSK5hQYu9WYG0YAfy+K+K0pr3ZjwMqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743733592; c=relaxed/simple;
	bh=IZa+Ryfe0cRInrTdslRNVibjEZlrl11gOjTc63NDrCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3mS1DSbzAICQh4DlHmE+RO0q0jW1ZNdMRnhkZJBEDBer04RkvPmZKJiydflfXHRCe1zQwWYcMy1UXiUAAm2qAo84mbL0lRf/09a9/xtTaEZw61EbJe0VgXif3PDpfqmAJ1FT/cEppjvEU5oIniInXl2GLPSrtKMjlNeZnWSpoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFJq0DDq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFJq0DDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743733590; x=1775269590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZa+Ryfe0cRInrTdslRNVibjEZlrl11gOjTc63NDrCs=;
  b=hFJq0DDqVnwIa9UVH8lG2XjZhcM00YtJi75E9lmEeKYRvACt7VktUs+/
   Re1n/MtJeXqbHxfTP9VnjiIz+2ReLSfPppKOF7zS9fIWGoSCvtHrp/R/2
   QSsOhw8PBtC5vRYTxPue2PHHs2sMiBvRbQkNIpEVkB+MizJ4Yid2xpDIM
   9quETeyFNQ0qp0SpUfOVVVKEjyrMJlGZq3JZTddD0NJ6IisStrh385Tk5
   P+BjMOss7bwUGwaI2ckB/TCTvFCaxsdZFZyzvfzgZgJeJyMtpFXGBVg3Z
   dVcXcGJhbBVVPdZuFHy70zbIfJHk0u4GExiNkMz8l9TtomnW0Re7xSlks
   g==;
X-CSE-ConnectionGUID: nKJ+kF8ZRpiv6GvQOTRcqw==
X-CSE-MsgGUID: kF/1vG8YTJuF95Rc0M2oJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45262959"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45262959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 19:26:29 -0700
X-CSE-ConnectionGUID: pK7NvGhuTqGfA+dkFJzkfw==
X-CSE-MsgGUID: LfqZrTYUT2Wnml6eFHkYvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127713404"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2025 19:26:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0WlF-0000wV-1P;
	Fri, 04 Apr 2025 02:26:25 +0000
Date: Fri, 4 Apr 2025 10:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Li Ming <ming.li@zohomail.com>
Subject: drivers/cxl/core/features.c:441 cxlctl_validate_hw_command() warn:
 always true condition '(scope >= 0) => (0-u32max >= 0)'
Message-ID: <202504041033.2HBboAZR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06a22366d6a11ca8ed03c738171822ac9b714cfd
commit: 4d1c09cef2c244bd19467c016a3e56ba28ecc59d cxl: Add support for fwctl RPC command to enable CXL feature commands
date:   2 weeks ago
config: loongarch-randconfig-r071-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041033.2HBboAZR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041033.2HBboAZR-lkp@intel.com/

smatch warnings:
drivers/cxl/core/features.c:441 cxlctl_validate_hw_command() warn: always true condition '(scope >= 0) => (0-u32max >= 0)'

vim +441 drivers/cxl/core/features.c

   429	
   430	static bool cxlctl_validate_hw_command(struct cxl_features_state *cxlfs,
   431					       const struct fwctl_rpc_cxl *rpc_in,
   432					       enum fwctl_rpc_scope scope,
   433					       u16 opcode)
   434	{
   435		struct cxl_mailbox *cxl_mbox = &cxlfs->cxlds->cxl_mbox;
   436	
   437		switch (opcode) {
   438		case CXL_MBOX_OP_GET_SUPPORTED_FEATURES:
   439			if (cxl_mbox->feat_cap < CXL_FEATURES_RO)
   440				return false;
 > 441			if (scope >= FWCTL_RPC_CONFIGURATION)
   442				return true;
   443			return false;
   444		default:
   445			return false;
   446		}
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
