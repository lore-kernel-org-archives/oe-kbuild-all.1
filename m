Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF21125A5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rwc9ZrKe"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696501977; x=1728037977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dkJJDgELIIGI8PfnoB1JMBM8ETi7YTHWyCYa21B1XWI=;
  b=Rwc9ZrKerC1iekeeDdmuS6j6MD0tvIjltoJd7aymvb1pSZsUZ5tUNvIv
   PfguueT7sVCzSNmGoN8rQ3dtWloKQ23yapWfygOA7lhaOBwWKQgUktPJ2
   D3UHouMMStXNfMuvGULuFy7uySKzLS4sk3LlpefvJ74kYi6jkNvAcQ+nS
   8krrGz5gHzWVJSlU0MNPhRUNyve1iRwzplfjhd0PngtjW1SzvIFcaITlb
   cLIX0ijL+GCRLYyaU9zUentjrkhDNOm7cUsoM0WeXJCjYNq8P0gBGq/Y5
   AZOPuE/Nmh2YUCYLb1ykQHAFnYMbghnlCKVGvMV3MCxc+wMwOM5UQy0dw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="2065136"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="2065136"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875518745"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="875518745"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Oct 2023 03:32:55 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoLf2-000LIa-0h;
	Thu, 05 Oct 2023 10:32:52 +0000
Date: Thu, 5 Oct 2023 18:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v11 07/19] ipe: add userspace interface
Message-ID: <202310051859.7DUfR6Yg-lkp@intel.com>
References: <1696457386-3010-8-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1696457386-3010-8-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe-block/for-next lwn/docs-next linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20231005-061243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/1696457386-3010-8-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v11 07/19] ipe: add userspace interface
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310051859.7DUfR6Yg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051859.7DUfR6Yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051859.7DUfR6Yg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/ipe/policy_fs.c:21: warning: cannot understand function prototype: 'struct ipefs_file '
>> security/ipe/policy_fs.c:411: warning: cannot understand function prototype: 'const struct ipefs_file policy_subdir[] = '


vim +21 security/ipe/policy_fs.c

    17	
    18	/**
    19	 * ipefs_file - defines a file in securityfs.
    20	 */
  > 21	struct ipefs_file {
    22		const char *name;
    23		umode_t access;
    24		const struct file_operations *fops;
    25	};
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
