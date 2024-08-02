Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7EC1171C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722609851; cv=none; b=EYrV4gCwytzveDo7byZnEz3pEMkP5OeIZ/Mw4hKMlMK35tfAr3nVU+DXvvxLPCxTjhLiOLMyfufF+SrPPcMChtq3P3Pccy36EIvWsEhLfFCwFYGRfcPFYHgCZSl/VCjhuf2fKr+vdudLnsDppKaGk7YHThGdV+6OEKdS6Ni1KJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722609851; c=relaxed/simple;
	bh=FVlr7ixeFgwa9IHACrY6xav+gTxiWfujzCvU/ud61BY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QehKtUVkkbC8VDo3AtywzmPFK6UKoeB69jwvAaLXcexUAcBsOLTuqqkGRPcnkzhnzXK5HSJHc8RIIH8138aMkvkQXDzB95rUAH87fiDQMzAxWyReTfWvgHEHAmUXITNoONu5Ex3zg1pK1sI6gpic8Rssj5bqgj+1YqJn6dMS7gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9CfCK0/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9CfCK0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722609849; x=1754145849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FVlr7ixeFgwa9IHACrY6xav+gTxiWfujzCvU/ud61BY=;
  b=W9CfCK0/4GRLeX3L9PeX75oYp4XB2QA/9H8vqEGSqYQxiXU+4zCki/c9
   6rg1e1wEc8SGcRooaEc5DE65hqE4xQy5qIuJjMfrD+6Q7ACUI44oc3DhS
   5iodavlHtjTR0lFn0709ZdPZiWlfXDD5UfvbTszwfy3/vA8Exv0jJlPTx
   lFdyOaJXS7qqD9UQF6Y26gWnveYZOuvSr0zIC3FGu4y/i5b5eKfwyGVyP
   axfps6X/VSSbiEnope9JHtSLbWiu2zsHiOZB8YC0OOesSEei4oY5mEsaR
   72YYGuC27p8YZP6BEjONcJebfg+hWeQjIho7YxdyDx8BrOHd3WjOuQAx0
   g==;
X-CSE-ConnectionGUID: tX0qxA3WRvmRFA5wgbGFyQ==
X-CSE-MsgGUID: l0DEe2q/Rxq15Jo6LR9MGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20749627"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="20749627"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 07:44:08 -0700
X-CSE-ConnectionGUID: Yv/GEndzQKy4JIxwfmU2rA==
X-CSE-MsgGUID: diNakT/kRsuxjgzLY+oBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="59544729"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Aug 2024 07:44:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZtVk-000wto-2a;
	Fri, 02 Aug 2024 14:44:04 +0000
Date: Fri, 2 Aug 2024 22:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11566/23411]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_pfc_storm.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202408022236.W9r0RrhP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b263c2033617bb9a15cbaa3ee200e1fb75778140
commit: cf7415aa7aae0ef2c815ab271528a29a5ea68c51 [11566/23411] net: hns3: cae module now provides an independent pfc storm cfg feature
config: x86_64-buildonly-randconfig-005-20240727 (https://download.01.org/0day-ci/archive/20240802/202408022236.W9r0RrhP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408022236.W9r0RrhP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408022236.W9r0RrhP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_pfc_storm.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
