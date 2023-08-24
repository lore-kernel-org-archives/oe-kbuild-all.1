Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461D288E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 13:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692883432; x=1724419432;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4Q9K6P4vwc1oLvCJ3m1fHBD0HH4SALhn4Uqx9s5+pKk=;
  b=VNuhuyuGuJg31HQKEojcIH2Ctz6ucm3UOK/EmrJVQPmVK2K1LwYrSjLa
   vUyN/vSZQiNjWe459qNcYy+jG6teCBV2bNZoI5zgnpmXv0f9/VyDDGXr4
   4Juez8wLDvUrUr4i62J+ghXBXMLdgQ/WtrGCJPHtCpYBA53QnOU9AEIxm
   b+7H0HX/LllIPhpLlBQEV0bbESrIwr6muVPPIrgnGp0sxKerf2ivDcK74
   NKd7BH17gIyOYllTU0FV9qXhMKHEPXCIoQ/3xkjsbMEpiEbn4A1BZFGbO
   JmK+r+CB7nzYc1wwekVQL5kBPq+wYFWzQ4VDEbzNLoYapcza396cnHCBb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="440784058"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="440784058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766540999"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766540999"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 06:16:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZAC1-0002hM-01;
	Thu, 24 Aug 2023 13:16:09 +0000
Date: Thu, 24 Aug 2023 21:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [PATCH 5.10] iommu/mediatek: remove redundant comparison
Message-ID: <ZOdX/4Sqkr7y5v5D@24313c2339b3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824130954.29688-1-adiupina@astralinux.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] [PATCH 5.10] iommu/mediatek: remove redundant comparison
Link: https://lore.kernel.org/stable/20230824130954.29688-1-adiupina%40astralinux.ru

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



