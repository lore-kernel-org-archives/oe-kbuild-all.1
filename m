Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8655A36E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674276834; x=1705812834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+OBXuOfnhYub6Uja/aUXByzGCiePQWZmW6kP1YNTTt0=;
  b=ji59D3boUz/TZnf7oC2V2ALhuQ6G/p6wWkB9gxHirHL/LsKnd+GJ4fB/
   euM7EPM2zkiKqWGG6JA+Ni42jd280U/fi8JzMie+i7mgc4BjE9btSY2xq
   K8p2CKKExZYZ4RMvYd5tCy9SB1PgWEvzkysMG75G+5Y1LLLA/gAx/cFq6
   HxC5Q4vpKhboaGBZzOH7BnJDe9Elblt9iUdHfXjwzAHmlG9JChMs3Voad
   A9ZZySgmugzA/3Ef+kxGku33sZzvJJd6b058BD2dKGqQ3eyWteJZyEJcO
   3k2MzNrptO/JieBMq65lNu6UhcYRWU1W2Bf48c3bis49bxxGxiMG8Vh4T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388118245"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="388118245"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 20:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989624649"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="989624649"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 20:53:52 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ5t1-0003Vm-33;
	Sat, 21 Jan 2023 04:53:51 +0000
Date: Sat, 21 Jan 2023 12:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next v7 5/5] ice: use debugfs to
 output FW log data
Message-ID: <202301211213.e3hinKci-lkp@intel.com>
References: <20230120233511.131-6-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120233511.131-6-paul.m.stillwell.jr@intel.com>

Hi Paul,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[cannot apply to net-next/master linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230121-073744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230120233511.131-6-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v7 5/5] ice: use debugfs to output FW log data
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301211213.e3hinKci-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a540cbc88b6aa6de989fb8793df30f96f927ba3e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230121-073744
        git checkout a540cbc88b6aa6de989fb8793df30f96f927ba3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_debugfs.c: In function 'ice_debugfs_command_read':
>> drivers/net/ethernet/intel/ice/ice_debugfs.c:53:17: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      53 |                 vfree(log->data);
         |                 ^~~~~
         |                 kvfree
   cc1: some warnings being treated as errors


vim +53 drivers/net/ethernet/intel/ice/ice_debugfs.c

    10	
    11	/**
    12	 * ice_debugfs_command_read - read from command datum
    13	 * @filp: the opened file
    14	 * @buffer: where to write the data for the user to read
    15	 * @count: the size of the user's buffer
    16	 * @ppos: file position offset
    17	 */
    18	static ssize_t ice_debugfs_command_read(struct file *filp, char __user *buffer,
    19						size_t count, loff_t *ppos)
    20	{
    21		struct ice_pf *pf = filp->private_data;
    22		struct ice_fwlog_data *log, *tmp_log;
    23		int data_copied = 0;
    24		int copy_count = 0;
    25	
    26		if (list_empty(&pf->fwlog_data_list)) {
    27			return 0;
    28		}
    29	
    30		list_for_each_entry(log, &pf->fwlog_data_list, list) {
    31			u16 cur_buf_len = log->data_size;
    32			int retval;
    33	
    34			if (cur_buf_len >= count)
    35				break;
    36	
    37			retval = copy_to_user(buffer, log->data, cur_buf_len);
    38			if (retval)
    39				return -EFAULT;
    40	
    41			data_copied += cur_buf_len;
    42			buffer += cur_buf_len;
    43			count -= cur_buf_len;
    44			*ppos += cur_buf_len;
    45			copy_count++;
    46		}
    47	
    48		/* only free the data once we know there weren't any errors */
    49		list_for_each_entry_safe(log, tmp_log, &pf->fwlog_data_list, list) {
    50			if (!copy_count)
    51				break;
    52	
  > 53			vfree(log->data);
    54			list_del(&log->list);
    55			vfree(log);
    56			pf->fwlog_list_count--;
    57			copy_count--;
    58		}
    59	
    60		return data_copied;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
