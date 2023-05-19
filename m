Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24723D3BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 23:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684538315; x=1716074315;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3Zixwlol1xE0X5p41L5oQGRGFktaH19NJOc32BD1ZPQ=;
  b=Y6Co5NSTZrcgpRR400gnqPN1z8NHNie+HkaHthhb0znhfidqrmQX2V9/
   XrjzBQTqBgLNeUj0PCTeeL0T/xZ4om6mfnG0SxngA+AyR0S5ZpgNEDBpf
   hsGHBYFfEg1u2uqZRXfkcTBn9iEf1om/bLqa5pj4biw8H8Jynhdx4dzpd
   /zf9ln7d3OIVTLp0837BSxUYHxjAcEEXilu66hdHt4wSGpehtk8I48NjB
   88TV5cX/DsNwseeERmofRQN/qJmD/XX6tC8/AO2SdHgUlcDdqFUhTSvBa
   FGqJwe2YILHExHBPMCF0d84N33kdqKPIGhCgINgBJojFsXMcCB4X1L5CD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526291"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; 
   d="scan'208";a="352526291"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 16:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888613"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; 
   d="scan'208";a="696888613"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 May 2023 16:18:25 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q09Me-000B9o-0S;
	Fri, 19 May 2023 23:18:24 +0000
Date: Sat, 20 May 2023 07:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sagar Biradar <sagar.biradar@microchip.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] aacraid: reply queue mapping to CPUs based of IRQ
 affinity
Message-ID: <ZGgDvnIQUh6uI79l@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519230834.27436-1-sagar.biradar@microchip.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v4] aacraid: reply queue mapping to CPUs based of IRQ affinity
Link: https://lore.kernel.org/stable/20230519230834.27436-1-sagar.biradar%40microchip.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



