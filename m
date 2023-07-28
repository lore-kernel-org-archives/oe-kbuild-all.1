Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F37C8DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690531619; x=1722067619;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=rrYT9CCdhkSNefmeirL7ue1ZwzOjsW5kwHQ4XAoWSvo=;
  b=VLIx2z0T6KD1ojYceYMxR64Vo1VHvaJVgwZRtdG8YE6ErBRcp0OspdTJ
   iyAFL9fwpui2DGssZMOHMxekVLJmHiYMHYYvkYXsx8+J4hxX9HXyxOc0v
   4CgJGHapee0cc2mirJt0aRFazZCvRdmPoZLA2LkdS0NM9VLT7mGW8k4hq
   MEg1uWJD3J3PQrXAhUAGsYLeoPiIeej4aDeJfIS+8iNPRRUruSk8Usy3C
   PqHTLHQx/D48CCSokbq3sYc62mH1xBwvxxJe3QEDDIP3vFSWhDZNqZjwk
   bbpCADVVKNehND8gIDUFnijdPj8uEoOWHcqvDaU2y/Cg2+6LD6JsSjtXG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348138500"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="348138500"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 01:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901136292"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="901136292"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 01:06:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPIUy-00030r-1n;
	Fri, 28 Jul 2023 08:06:56 +0000
Date: Fri, 28 Jul 2023 16:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net 2/6] net: hns3: restore user pause configure when
 disable autoneg
Message-ID: <ZMN2uXx/GXoC61VD@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728075840.4022760-3-shaojijie@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH net 2/6] net: hns3: restore user pause configure when disable autoneg
Link: https://lore.kernel.org/stable/20230728075840.4022760-3-shaojijie%40huawei.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



