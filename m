Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1BB23C9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677935518; x=1709471518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CK7P4q8Y4j7WeUdbEgi1CrYSEXxiiZ40QQowKXW87WE=;
  b=n1u8n8JH6xF/kmo0q283t7XjqwMRt7IjgWAh2PcA9coSzXdidi/S9J9v
   qeYfh55jVQakp7BTmOenJKz3N8rLH6DhkiZRo8BLvic1PpGf22EGJLscf
   jqRAyY9x45ugVhqz3De1k+0DLQ4fwt7LsMzJvxU10jSiXTWT9wIyWvtoA
   jh1wJ8kKLbVXi3LvCfFWZy5ZOjVT4upSZL7sNafuZgwsnMO53vb70zek0
   c811D0QK9nIDXCBlbFw+mFaGEXVmy8KGoZElm5oE8dn1sJ+zXcyKQGDsS
   55cDg1fpS2GBqWMdOJ//SQpS+3dmfbTRJxTYFgep+R5/D8LVtYUdBFHrC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="400076838"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="400076838"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 05:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="818810236"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="818810236"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 05:11:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYRg1-0002BG-26;
	Sat, 04 Mar 2023 13:11:53 +0000
Date: Sat, 4 Mar 2023 21:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Burkov <boris@bur.io>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Filipe Manana <fdmanana@suse.com>, Christoph Hellwig <hch@lst.de>
Subject: [kdave-btrfs-devel:misc-next 161/165] fs/btrfs/inode.c:6999:7-14:
 WARNING: ERR_CAST can be used with ordered
Message-ID: <202303042125.KbQDNGUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   8dfba250caf5a34c2ee02368ea20264db64f692b
commit: c58386c1e70b75698d5c3438051476f3fbe0e540 [161/165] btrfs: fix dio continue after short write due to buffer page fault
config: s390-randconfig-c031-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042125.KbQDNGUQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042125.KbQDNGUQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/inode.c:6999:7-14: WARNING: ERR_CAST can be used with ordered

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
