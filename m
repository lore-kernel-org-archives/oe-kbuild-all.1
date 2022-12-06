Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72A215CBC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Dec 2022 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670340007; x=1701876007;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=px51s1I8Q20++rz+44sqxe8BinnmrgYrIMOiGxLwkog=;
  b=BTHr0b4mzzwJw4ZGPGBL5H6HePBNLUKqMC/A39YiVaPLf5jns/6H2jNi
   A2a6cNNmkbpsvpY4eJ1OcN3rR0wYyW0tGhHbu0m+Dp5pBCWRvjzDNs2mn
   nLqkz/eDpGvtgFaDO4LJBs5pQpRAEXE0Uy6fiKqCI+Mo7Xmb8KDmm0W95
   o/6uKpWjv/nOKqII79Au5vAL2tTZgOXZLW1/NVouSx+vH0SeiM+V1p3se
   uhV2ZNx0Zq9rl0twUg/cNUgOPe3IHZINtoTywX4fX1Ubm2oe4iHc75mDm
   rVCpWtLIhFkGIuAo0ttDXbtdVa0BG08uKcDtevG+Et7934Xh4HFJ6YyP/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="297003689"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="297003689"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 07:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="770755357"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="770755357"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Dec 2022 07:19:08 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2Ziu-00011J-0W;
	Tue, 06 Dec 2022 15:19:08 +0000
Date: Tue, 6 Dec 2022 23:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Radu Nicolae Pirea (OSS)" <radu-nicolae.pirea@oss.nxp.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] net: dsa: sja1105: fix slab-out-of-bounds in
 sja1105_setup
Message-ID: <Y49dO6qcmcWfZ+k0@0d7994225921>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206151136.802344-1-radu-nicolae.pirea@oss.nxp.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] net: dsa: sja1105: fix slab-out-of-bounds in sja1105_setup
Link: https://lore.kernel.org/stable/20221206151136.802344-1-radu-nicolae.pirea%40oss.nxp.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



