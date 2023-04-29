Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52983C1D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682778487; x=1714314487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dPM8JbYXqqE60OTuP30WCVH2XUlQMcjVOBtfkmoiYz8=;
  b=YK8UZWknLtwW1LP3zVnF5zoWvsM6Vz5BRT/TGxuUJ5ka74zZvcCDAqgA
   JGdv+gO1IgUGHB7n7Ef6N8Wgu4bTdbl2yEg2CVITo+rlp/jcMO3x0hQkl
   KIvFgOO4tWLCt0WvL90teaJQrBYXLH6mWMVKCS0cNQEAcR8zKbvxnpSON
   yOeg2SKP2XZv+1J6AQrVA8G+BfhdpJs7OaVldUMi7k968IQgzwtYIwWNQ
   QdunPOlCpuTPesdufKJlwYKJBhgD5+tl/f21ZopJ3JeSjEYreWqRbuAIo
   9FYfPgD4nUy4e3g46/0bbjk8OBRwtpeHo19BqPmr5rORc+syKy40uXnED
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="346729446"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="346729446"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 07:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="697944304"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="697944304"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2023 07:28:05 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pslYS-0001CH-2G;
	Sat, 29 Apr 2023 14:28:04 +0000
Date: Sat, 29 Apr 2023 22:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>, shinichiro@fastmail.com,
	snitzer@kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH blktests v2] tests/dm: add a regression test
Message-ID: <202304292230.Ai7aIFbo-lkp@intel.com>
References: <20230427024126.1417646-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427024126.1417646-1-yukuai1@huaweicloud.com>

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/tests-dm-add-a-regression-test/20230427-104508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20230427024126.1417646-1-yukuai1%40huaweicloud.com
patch subject: [PATCH blktests v2] tests/dm: add a regression test
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292230.Ai7aIFbo-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> tests/dm/001: 2:27 Invalid License ID: GPL-3.0+
>> tests/dm/rc: 2:27 Invalid License ID: GPL-3.0+

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
