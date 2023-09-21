Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4783A3D90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 06:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695278018; x=1726814018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxEYuqSML8f9hESZ1gjHaHq8kJixT+6+9MSCfHoUjV8=;
  b=mMOFxAe3eGq4loAtb4x24zLYaWmINGNj/3pmq5rhv/nTFcSP+ALHR7JQ
   2jCgU3bqw8nqI/GqdOL9Vwi9te8hwoBc3YVOQABImp+HqNS8XX+5x3YTE
   SRjt2OoGVqkC82AA9uByy7QzHdMdLqbCdxkuXEVzgY0brvJy9Y+l5BByJ
   2eUUmVzPIaOzjGo+cM+gVfsPiUZMMQa9LmW9nKa7NtBL3NAp4hskMBo+C
   X61+dX1q6YqHmiNtMJrAoyM4PwAYdSIyyTYxhDOX47aW5FMveQCeBajXC
   TZyJZdiBBclZEP6S+nQxeemP+NAn9wCiZXf6F2zKAJJtlwDJvBhttpVBI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379315973"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="379315973"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 23:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077781932"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077781932"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 23:33:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjDFL-0009ei-0v;
	Thu, 21 Sep 2023 06:33:07 +0000
Date: Thu, 21 Sep 2023 14:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-unionfs@vger.kernel.org
Subject: [mszeredi-vfs:statmount-v2 2/3] fs/namespace.c:4869: undefined
 reference to `show_path'
Message-ID: <202309211427.pt52GuFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git statmount-v2
head:   9b5ff63d2b9b94298e6c9fbac4df9e77e6901fc9
commit: 43d6746354fa23a231946542c476e14f483c44c5 [2/3] add statmount(2) syscall
config: i386-buildonly-randconfig-001-20230921 (https://download.01.org/0day-ci/archive/20230921/202309211427.pt52GuFm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211427.pt52GuFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211427.pt52GuFm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/namespace.o: in function `stmt_mnt_root':
>> fs/namespace.c:4869: undefined reference to `show_path'


vim +4869 fs/namespace.c

  4865	
  4866	static int stmt_mnt_root(struct stmt_state *s)
  4867	{
  4868		struct seq_file *seq = &s->seq;
> 4869		int err = show_path(seq, s->mnt->mnt_root);
  4870	
  4871		if (!err && !seq_has_overflowed(seq)) {
  4872			seq->buf[seq->count] = '\0';
  4873			seq->count = string_unescape_inplace(seq->buf, UNESCAPE_OCTAL);
  4874		}
  4875		return err;
  4876	}
  4877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
