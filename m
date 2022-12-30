Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F7353A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Dec 2022 22:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672439102; x=1703975102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yybVRQ8iPIsbqZIGLaIL7MB2xjCclLzuH42lS2c7G5E=;
  b=YNuaL5poYLT8Opd1HBVwcmMHJy7Z9OpBqSc3ySf4lc35+UCfK2EPn8zd
   Dd8fS+ONAaOW6ztoZ4W2iZcWGpVSm7yBDyANMmf38QCdoBd/Oeeup5bSD
   +MSSo8Gu2T+cL4JX58CuiaGlvpO4SrDkbdGf7uuyA1pDp7zCpDzCVYyjb
   ym6oU3AjRKVGkisJBRsItDrc7IdJmeITMHEr76gEx+3KFO+AkTEIzfSM9
   L5oA/N2VVww/UfiFv2vq6B3RYydK9jUAz8BC67spZCZb26/cPskWqjiWM
   4FyTwcxyFdycxOcSSbbQ4kb8xeiTvFWqUrlJu3dIXagj++USEBi5YGP3N
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="385694191"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="385694191"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 14:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="631620938"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="631620938"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Dec 2022 14:24:59 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBNoA-000ITT-19;
	Fri, 30 Dec 2022 22:24:58 +0000
Date: Sat, 31 Dec 2022 06:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>, linux-block@vger.kernel.org,
	shinichiro.kawasaki@wdc.com, hch@infradead.org
Cc: oe-kbuild-all@lists.linux.dev, yukuai3@huawei.com, yangerkun@huawei.com,
	yi.zhang@huawei.com
Subject: Re: [PATCH blktests] dm: add a regression test
Message-ID: <202212310607.TCNdNAlM-lkp@intel.com>
References: <20221230065424.19998-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230065424.19998-1-yukuai1@huaweicloud.com>

Hi Yu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc1 next-20221226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/dm-add-a-regression-test/20221230-143530
patch link:    https://lore.kernel.org/r/20221230065424.19998-1-yukuai1%40huaweicloud.com
patch subject: [PATCH blktests] dm: add a regression test
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
>> tests/dm/001: 2:27 Invalid License ID: GPL-3.0+
>> tests/dm/rc: 2:27 Invalid License ID: GPL-3.0+

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
