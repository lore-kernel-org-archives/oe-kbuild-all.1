Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD32EA171
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 05:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773034115; cv=none; b=UsiTPhVIYnvjFWRIYIa2/Zr0zDhSxjy+M5IRtdXmr84Q4SsQBiivqCciXhfTmjL9nYQF+NkcUxq80rnyjEGkmpvgJW/bgFU4tV+7U8cld4UR7kURLQcywuK9pq2AzK5l0oB6YD3MBOXMLW5FsJiqBdvBfNHJvzaoKZ1JelDYM/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773034115; c=relaxed/simple;
	bh=A5Zc4e7vF4HDEvQZDywKabrTf5P4pDHL3O/kphOFb+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liCYta3XwkvPxCRiB9CEW5eXnfMoqHjzW8QndBAaUwo7TEntLrmgLe8BFiAw2cOwP+XMCAro3FQN7m5MBZA6pSv9WXrS1Zwm0CMASV05ApCDAfs8CI3Uz4YevSgIAFUSV+YbgHIczO6FyUc2de22X9Ib9I59rZMCQf+YmTxYIEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HB6s53kR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HB6s53kR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773034114; x=1804570114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A5Zc4e7vF4HDEvQZDywKabrTf5P4pDHL3O/kphOFb+Y=;
  b=HB6s53kRNvaYvMaFXxxC0s3HLiDXKAc792Z4dWCPrgOOw9EU//eojkKO
   1cSil3qGcUYbYN1xqycMWZM22PBWvMANwsI2lfR1ayE9WVIlTDTAFTBmE
   4CoUn4klM1XFiIZVH+e5BbROOxq7eGfI7iAW0krdMG1Dknt8hEUryoltl
   1L1/ceQY64kJc0YYpjTYoxAQVKE1FXrj6mYXIU0hbHywNtViZmWtV7Qjx
   cAaaNoIbt2/DJeA9G3uwluUmjaTB+p7n3+2TdkwY2ZLaX0BLPjkbaTa83
   O8XJLPQ54p4oiz8SeWZpsvjhscfDJIblLbO8531Erw4Rfj+YTB5Y4xncB
   g==;
X-CSE-ConnectionGUID: YR8gm6ebQ9uK3kLwzW9Jsg==
X-CSE-MsgGUID: vuvKSoC1R52DPxg8Jej/nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84762010"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84762010"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 22:28:33 -0700
X-CSE-ConnectionGUID: d6GA22uMQhen+Y2XmHuJzg==
X-CSE-MsgGUID: TUCRfs5hSxaKxFuDaLPYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216194965"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Mar 2026 22:28:27 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzTAG-000000002ov-3BvA;
	Mon, 09 Mar 2026 05:28:24 +0000
Date: Mon, 9 Mar 2026 06:28:15 +0100
From: kernel test robot <lkp@intel.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <202603090618.bb9sDlgQ-lkp@intel.com>
References: <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>

Hi Vijayanand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3fa5e5702a82d259897bd7e209469bc06368bf31]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijayanand-Jitta/of-Add-convenience-wrappers-for-of_map_id/20260309-033633
base:   3fa5e5702a82d259897bd7e209469bc06368bf31
patch link:    https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8%40oss.qualcomm.com
patch subject: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into a struct
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260309/202603090618.bb9sDlgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090618.bb9sDlgQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
   --------------------------------------------------------------------------------------------^
   Documentation/core-api/mm-api:121: ./mm/memcontrol.c:1525: ERROR: Unknown target name: "total". [docutils]
   WARNING: ./include/crypto/skcipher.h:166 struct member 'SKCIPHER_ALG_COMMON' not described in 'skcipher_alg'
>> Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2105: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/dma-buf:142: ./drivers/dma-buf/dma-buf.c:1355: ERROR: Unexpected indentation. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
