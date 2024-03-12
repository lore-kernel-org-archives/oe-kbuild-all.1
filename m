Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033397A15A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710253062; cv=none; b=WdX5i9EEItCkYMxENSiHG/oa8VkKqV3xto8W/5xOIpyQaClVdnDtQDOV8fgNXdBzvHBe2VBvTGthJvyAjZOikC+9VoH/YmN3lrollZrj1CVcQm4He7ALEvIymB3QpAdlql21Ytk4Z+Sa391t8XTOkkAw99yPS8CKsZT2ysR+BRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710253062; c=relaxed/simple;
	bh=Ee1etKLfW+WFjXYPciqFkLGPblil+Ee3PsBZCtmqdAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5WCROz8rCH8O3zWk1ZJCnqV0jHIT+cHPcLfz8lS9XEpneYkOXUIfJFzay7IoF98BOT0uR/H0SzgjfnnUe0u5NBko1zZ/aYN7c0K6QQ/0c1B1D7EaKoVETtRQbVneDO5UQuBWjR4ViY+CYTJH7QIfH/Nx/LylkMnWFYkV88LrLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMMWDm+5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMMWDm+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710253061; x=1741789061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ee1etKLfW+WFjXYPciqFkLGPblil+Ee3PsBZCtmqdAY=;
  b=lMMWDm+5LqId2p+e9iS2vU0XwNhUKor/tixukI6qxd0aWHnnwrraAj30
   XTYMMuNUea7GqM9Pgto6gabsD9g43hCNfyfWZ0HGCP1/LqrH0aRW/d6xs
   QvBJ76DPNT3Ci+eZ5y8qff51BT0v0o9/4wWR0VHz42AW6mbPdGc/b6Tlv
   6hEfF2L+CF0sDkQdhwi/wpqqPPj3Jg7i6ShPtEROhqTfwSJhE6qHpVhEy
   w69L+zfibbRkLVBDQrwhlsfLFxJ+PnbvoN2NXd8Oyk9YW03pPFIZmJfsi
   a3VwfDHu+R1LApa7BrLvOCyKUOobF5NpA3tSs3Y4zAijPnpUplxeZ4DQE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8727646"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8727646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="34721992"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2024 07:17:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk2wd-000ABf-0k;
	Tue, 12 Mar 2024 14:17:31 +0000
Date: Tue, 12 Mar 2024 22:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21699/21850]
 drivers/platform/x86/.tmp_dell-smbios-wmi.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202403122249.xsnDebIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c38cc0a3be12e5c70b9a2a015cbee44014a52518
commit: 14dbb7913c699931c3e0314f650058dacdaf566b [21699/21850] platform/x86: dell-smbios-wmi: Fix oops on rmmod dell_smbios
config: x86_64-buildonly-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240312/202403122249.xsnDebIP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403122249.xsnDebIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403122249.xsnDebIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/.tmp_dell-smbios-wmi.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
