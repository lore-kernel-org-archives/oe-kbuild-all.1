Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD1366
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 06:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685255220; x=1716791220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h1fX6J9MwHA4UhEIWnjjtlM/vEh0VODuOxy/W8XzQNw=;
  b=VQ9c0FylFbBltwpgDh6z39laXpgKLwsRKowxMo/2JfcM4YTzoeRjsqs+
   xpD8oCeSLkR9+3oid3x3vLHpBfkmrVvoO7KQA9CpDuZuvtffpfsXRabQi
   nrux1Mmsk+KGkInxhp9ohJONU/Y3+5MyXu+HZoGtFk3XWqFNwOLVmUKsZ
   gat12qtEFjEaG93DLtT64MR0LgKDbe+4klYRxFlFEXuoTWdQYqo6TA6Ec
   KX0AIdz0fEW7Z4Emv/SWQ0JyMe+0jtTrjpM1xD+Ej8wE5TmVDvzg8FdYM
   oho0YciRw0Ay0s4JvhLWvgPERHh6lOjO8Ks/KkIT/XFGhse72x5x5CSKv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="382742068"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="382742068"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 23:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="879980811"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="879980811"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 23:26:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q39rk-000KT0-0T;
	Sun, 28 May 2023 06:26:56 +0000
Date: Sun, 28 May 2023 14:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>,
	Eric Biederman <ebiederm@xmission.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Zhen Lei <thunder.leizhen@huawei.com>,
	Michael Holzheu <holzheu@linux.vnet.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Amerigo Wang <amwang@redhat.com>
Subject: Re: [PATCH 5/6] kexec: add helper __crash_shrink_memory()
Message-ID: <202305281410.FdGZvhsb-lkp@intel.com>
References: <20230527123439.772-6-thunder.leizhen@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527123439.772-6-thunder.leizhen@huawei.com>

Hi Zhen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhen-Lei/kexec-fix-a-memory-leak-in-crash_shrink_memory/20230527-203821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230527123439.772-6-thunder.leizhen%40huawei.com
patch subject: [PATCH 5/6] kexec: add helper __crash_shrink_memory()
config: x86_64-randconfig-s033-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281410.FdGZvhsb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/dea97cef503d26e05d0e11818ae44176056ddf64
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhen-Lei/kexec-fix-a-memory-leak-in-crash_shrink_memory/20230527-203821
        git checkout dea97cef503d26e05d0e11818ae44176056ddf64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281410.FdGZvhsb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/kexec_core.c:1108:5: sparse: sparse: symbol '__crash_shrink_memory' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
