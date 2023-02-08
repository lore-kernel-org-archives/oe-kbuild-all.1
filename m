Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBF2364
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675852505; x=1707388505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wuKUaDG3nhGakKAMflDpyFUzigTaRC9OJjlo6xuqn+w=;
  b=YCUgXWzlFuhP4mA9T/hq7YE5Wr86bEF++SUvRXYxfvU6BB7+jaTd5VOe
   ce1uXBmzG/cq8i69DMgHjSeV/IN5M2hBQo9ilW2X173zQXMQeGxuJ7k0z
   FZcqkIihWO35kHN22ng48gZcimP3w3GfsFG5d2yTEqWDzyl+2kYYBJ/qP
   37Mrw1cI449DVdRnM2XYcUFdqAwKV0hL9n5fZ+j1CG/qKg0kBvp8nl817
   RKzrZFr4zJlHYM7qnk7uX6AHJQDpoXSqBFcKSJtGJ0LnPJ/KxSYkcw2iB
   ZgdNIyWvuMdHKD+t1ChjN15mgUxg0eUWUz2jteGh+wo9G7Mt2zKO4KOwg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415985404"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="415985404"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 02:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="660610481"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="660610481"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2023 02:35:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPhn3-0004Og-37;
	Wed, 08 Feb 2023 10:35:01 +0000
Date: Wed, 8 Feb 2023 18:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH V2] blktests: add test to cover umount one deleted disk
Message-ID: <202302081836.q16rGKum-lkp@intel.com>
References: <20230208010235.553252-1-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208010235.553252-1-ming.lei@redhat.com>

Hi Ming,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc7 next-20230208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/blktests-add-test-to-cover-umount-one-deleted-disk/20230208-090437
patch link:    https://lore.kernel.org/r/20230208010235.553252-1-ming.lei%40redhat.com
patch subject: [PATCH V2] blktests: add test to cover umount one deleted disk
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
>> tests/block/032: 2:27 Invalid License ID: GPL-3.0+

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
