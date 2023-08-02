Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC2D2E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 21:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691010267; x=1722546267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vr8D1jrfl2V7kqjLpE7t4rw4Chn5KJ7j7e/sz+e4kj8=;
  b=lQKVSHgqNjzRfICUeWyN1rqz2f0DTzT3HB0nCjNswW1QvfNegMROAsen
   cNQTrKTSfnmngZY8coKsKd205lJJEa/w/6imNZUUaC14KnOscVhJpRqGc
   bTviscOC9AzVdC9k9nR1KyBMh64z+UD398+Gj3hA2fS0nGEaaLyuRiA8J
   73dCzjBs6CC3BzPbpCa9g9x+lzay9hbj8WYzkUNabmtacr5kL91oFl3P4
   uB2y6nQ9YvcPJdn3pTbDSpGF3hVqVuCfMa+Mq3PWNJvVODPhU/drVBAHP
   KfqvgLRQqS4y0bRu+l8VmXlAa3z087pESmiNSN+VS40NfuKN9MZG4K0Yw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372433200"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372433200"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722983900"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="722983900"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Aug 2023 14:04:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRJ17-0001Tn-1B;
	Wed, 02 Aug 2023 21:04:25 +0000
Date: Thu, 3 Aug 2023 05:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: zhanchengbin <zhanchengbin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] ext4: ioctl adds a framework for modifying
 superblock parameters
Message-ID: <202308030412.jMcaYq0E-lkp@intel.com>
References: <20230802083402.515570-2-zhanchengbin1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802083402.515570-2-zhanchengbin1@huawei.com>

Hi zhanchengbin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhanchengbin/ext4-ioctl-adds-a-framework-for-modifying-superblock-parameters/20230802-163905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230802083402.515570-2-zhanchengbin1%40huawei.com
patch subject: [RFC PATCH 1/2] ext4: ioctl adds a framework for modifying superblock parameters
config: i386-randconfig-i004-20230801 (https://download.01.org/0day-ci/archive/20230803/202308030412.jMcaYq0E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030412.jMcaYq0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030412.jMcaYq0E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/ext4.h:77:52: error: C++ style comments are not allowed in ISO C90
      77 |         __u32                           sba_count; // attrs number
         |                                                    ^
   ./usr/include/linux/ext4.h:77:52: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
