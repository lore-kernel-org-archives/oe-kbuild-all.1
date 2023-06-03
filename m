Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F5F5C98
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 07:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685778030; x=1717314030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cW9DTSdTxyAKRe9XKCSoC/96vhR3nXHtujwISq7tXks=;
  b=BjoNbrhsQTDy1dxXA/dpMpJuDSFlE6OKbrr7GeCpQVjH+3pPbuae5e2B
   M0qTy13fVYVsRaoKltFxdUAdKVXK3y/h7xikS3ZckLCLkmArifOEId3dw
   NXraK2Ax7910nSJcY+wqCVYeUEs2JiibPiEd5S945iArv5VULFdGSr9Tj
   9iNNC0cCgatm/pduLw8gV9POWS1YyyLCowkuL3JgOThNue8wR7aQeoHeH
   5nCAgBFNwq3jZEFZMmWuRRRU/YevaRy2/hiNmXdG1m9aJi1Ie+zf+nlVJ
   KaYv/Qg76XzMGNbkYJ74zBPtCxCbrbOqz0ETZHB5JefSVYXL9bXzHDrJm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335665205"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="335665205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 00:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="737798077"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="737798077"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jun 2023 00:40:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5Ls8-0001QX-1w;
	Sat, 03 Jun 2023 07:40:24 +0000
Date: Sat, 3 Jun 2023 15:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com
Cc: oe-kbuild-all@lists.linux.dev,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/6] device-mapper: Avoid double-fetch of version
Message-ID: <202306031511.xIeQ4BQz-lkp@intel.com>
References: <20230601212456.1533-5-demi@invisiblethingslab.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601212456.1533-5-demi@invisiblethingslab.com>

Hi Demi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on linus/master v6.4-rc4 next-20230602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Demi-Marie-Obenour/device-mapper-Check-that-target-specs-are-sufficiently-aligned/20230602-052741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20230601212456.1533-5-demi%40invisiblethingslab.com
patch subject: [PATCH 4/6] device-mapper: Avoid double-fetch of version
config: x86_64-randconfig-c032-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031511.xIeQ4BQz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306031511.xIeQ4BQz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-ioctl.c:1900:42-48: ERROR: application of sizeof to pointer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
