Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D436FAB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690974450; x=1722510450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qX7gnADsk4x72WVLcvlaXPd/ZlRG14qvfK4bGqThBYk=;
  b=mWBoF7iUxDJQ7LVfMKWYCSYaLcL0cRzz5O80EEWQDTdkiHHP+3kJtBHa
   VB/Brr3/VxMKVdfQG3Ye1LwrGi256HjYYTFrlAc0KgPMICCwohtdFIoDq
   EJl1BGCzJLtfN128sw7rHXMVOmyrgGaG1/gBn7h/qQtxLnNKaasXLIf/9
   LBlu/R5gtHWQTha0z/5zImGWOCzQjDArdRzDXprvCubR+Pv7hapJHM/NC
   gkkghCjeISJZAqLcv20bl3cUkgQhEpBSItYnAD8Zpu9eLvEnHJ2SYnxeT
   saHbkMhMZsgpA3OK1yjq3sl2Kso6iBMfnwiYlzOrQg7KY2wdcbAbYdCtO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="433388724"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="433388724"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 04:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="679024222"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="679024222"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Aug 2023 04:07:29 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR9hQ-0001A9-2A;
	Wed, 02 Aug 2023 11:07:28 +0000
Date: Wed, 2 Aug 2023 19:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: zhanchengbin <zhanchengbin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] ext4: ioctl add EXT4_IOC_SUPERBLOCK_KEY_S_ERRORS
Message-ID: <202308021801.ieUVR2xl-lkp@intel.com>
References: <20230802083402.515570-3-zhanchengbin1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802083402.515570-3-zhanchengbin1@huawei.com>

Hi zhanchengbin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhanchengbin/ext4-ioctl-adds-a-framework-for-modifying-superblock-parameters/20230802-163905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230802083402.515570-3-zhanchengbin1%40huawei.com
patch subject: [RFC PATCH 2/2] ext4: ioctl add EXT4_IOC_SUPERBLOCK_KEY_S_ERRORS
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308021801.ieUVR2xl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021801.ieUVR2xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021801.ieUVR2xl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/ioctl.c:33:5: warning: no previous prototype for 'sb_attr_errors_check' [-Wmissing-prototypes]
      33 | int sb_attr_errors_check(struct ext4_sbattr *p_sbattr)
         |     ^~~~~~~~~~~~~~~~~~~~
>> fs/ext4/ioctl.c:47:6: warning: no previous prototype for 'sb_attr_errors_set' [-Wmissing-prototypes]
      47 | void sb_attr_errors_set(struct ext4_super_block *es, const void *arg)
         |      ^~~~~~~~~~~~~~~~~~


vim +/sb_attr_errors_check +33 fs/ext4/ioctl.c

    29	
    30	typedef void ext4_update_sb_callback(struct ext4_super_block *es,
    31					       const void *arg);
    32	
  > 33	int sb_attr_errors_check(struct ext4_sbattr *p_sbattr)
    34	{
    35		__u16 error_behavior = *(__u16 *)(p_sbattr->sba_value);
    36	
    37		if (p_sbattr->sba_len != EXT4_IOC_SUPERBLOCK_LEN_S_ERRORS)
    38			return -EINVAL;
    39	
    40		if (error_behavior < EXT4_ERRORS_CONTINUE ||
    41		    error_behavior > EXT4_ERRORS_PANIC)
    42			return -EINVAL;
    43	
    44		return 0;
    45	}
    46	
  > 47	void sb_attr_errors_set(struct ext4_super_block *es, const void *arg)
    48	{
    49		struct ext4_sbattr *p_sbattr = (struct ext4_sbattr *)arg;
    50	
    51		es->s_errors = cpu_to_le16(*(__u16 *)p_sbattr->sba_value);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
