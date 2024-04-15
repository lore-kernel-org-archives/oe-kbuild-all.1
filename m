Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E9156251
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210900; cv=none; b=RM7xCwD2IsBT3PfJ5+qdZiN5eON/YmY9UB2vVEkAQDh9cAAw0wPC02HS2gXOH2dD0WeN9UI03zb1z49NkDQW0E4CMzSFnFFFOfBl44dfSekffEESiWwWgfyoNII6eyFJDfNxyEXdZLT/5ND4Ru62ODvgnBTZLUP3v3NMhF9smhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210900; c=relaxed/simple;
	bh=owW+FJONWI7AomIgsy8cd2sYS581SfBetEuC2c9T/4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ioyQOrwWhUUzVzm292zaXN2ulMtCKGnaAPA/AqESrTvcTikX2TUS42DncgKX/y3TWGQOaLhbqFrVifI540cez/iU7HNm7U7R2fLWPql16MgMSeTgdOAs6a7TzHdjHzbsRedwCcSTrKke8+cGJGYoKD/kH68WX6EO5/06tYFl8xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9Pg8K14; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9Pg8K14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713210899; x=1744746899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=owW+FJONWI7AomIgsy8cd2sYS581SfBetEuC2c9T/4U=;
  b=O9Pg8K14Cb95B2n9gYYf8OpctQe25HSjWrWXrmH1YpK2prS02cI2kDRU
   n/nWr6NlIDyyGr8ml4ygiC68gEBdAVWz3cQfQOl6sRyieM+kcm0I1EfId
   JHs8VaLHXzQDjHhsKhFEDWgfbheS7RpSK4HdjTxNYqRwgCFMf7YdvctOY
   f5uzyLhUMmAQfknKqiV3dQYrL2FDSxbwRlEPqqO/1HsgzqpjaNOCYaZ2t
   i5kNX3cQxnM+HTHo953RaQaebWdm8Qx/eVobyMmM27QbiE1wer5dEJwQA
   BThTcFA7yAkx4PpYWRsBoFWP32llbrGn+UJC5B32CmN2oCY6N2JllL0rV
   g==;
X-CSE-ConnectionGUID: /xQ6IUfISsSNd2SkdGoOJQ==
X-CSE-MsgGUID: blHzLy7wQZKn5CAL/KDhOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8482001"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8482001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 12:54:58 -0700
X-CSE-ConnectionGUID: GF3p/AcUTBymKKdKw/zMmQ==
X-CSE-MsgGUID: uPFFhE0fRuyP8XRjMXo+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22113924"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2024 12:54:56 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwSPl-0004cG-1K;
	Mon, 15 Apr 2024 19:54:53 +0000
Date: Tue, 16 Apr 2024 03:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-hans 40/59]
 drivers/platform/x86/amd/pmc/mp2_stb.c:94:9: error: implicit declaration of
 function 'writeq'; did you mean 'writel'?
Message-ID: <202404160320.QAHyZ0c3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   0aae4c44b032b5ede39405dfc62900adc467f362
commit: 2dc77993cb5eb311d6bb5584d30c3d1d42d9fa4a [40/59] platform/x86/amd/pmc: Add AMD MP2 STB functionality
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240416/202404160320.QAHyZ0c3-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160320.QAHyZ0c3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160320.QAHyZ0c3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/amd/pmc/mp2_stb.c: In function 'amd_mp2_stb_send_cmd':
>> drivers/platform/x86/amd/pmc/mp2_stb.c:94:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      94 |         writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
         |         ^~~~~~
         |         writel
   cc1: some warnings being treated as errors


vim +94 drivers/platform/x86/amd/pmc/mp2_stb.c

    84	
    85	static void amd_mp2_stb_send_cmd(struct amd_mp2_dev *mp2, u8 cmd_id, bool is_dma_used)
    86	{
    87		struct mp2_cmd_base cmd_base;
    88	
    89		cmd_base.ul = 0;
    90		cmd_base.field.cmd_id = cmd_id;
    91		cmd_base.field.intr_disable = 1;
    92		cmd_base.field.is_dma_used = is_dma_used;
    93	
  > 94		writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
    95		writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
