Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5F3D6488
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932051; cv=none; b=HOVM2Ps4mo+jBsa5LqtvW6tKzctw/pvin7VNy5kbacMaqYPwjP8P7GYAY+PLruG5eiymHfDMIO1YDUiuGhKVaks19GMn49mVObLyeXK3F8HEH0BDszk/OMzklMMXngjGqHiEuf0dmUR+g5355BnsR7qoeucbMsY21Pcxo56vu+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932051; c=relaxed/simple;
	bh=1IWwTEw1GqCEhA8ZyZBG4zkYP1SpHmJ8C/6DMHiIobA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CnX95RmCKx5FsZTZ9KYGV9cECuA1z5RaMlvJrN72M8KHj4ZlGtTcsb+yjVxgrYAz+NxC3D9KgxZCNcn3JaHqJq9GpAD3w540vz3lOIdNpzF2slG40Ro5NpaMMshMhe/cwGZGv0dZ6nMbhX2pr0hjw8cGSQ0BMWmIOnNDpQRLnxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fH6S0GK3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fH6S0GK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773932050; x=1805468050;
  h=date:from:to:cc:subject:message-id;
  bh=1IWwTEw1GqCEhA8ZyZBG4zkYP1SpHmJ8C/6DMHiIobA=;
  b=fH6S0GK34dO+/TLpF6xe5iujL4P1t9uX9vBLNXCla1lqLsB/ytaVXJA8
   C17E/vbqyo3O04Jswy8IDm5+yh2EaxnDYdVr/Pal5c7+YQohuvs94G6Fy
   xa9SgcBdLV+q8Yzg8qWC99EAkwdxzvE1nv8X5dQ9D0cFpVriNiXCYaTZK
   Q1ju+N8NVQ145Q/SNozj8SoV7WqBo39GtNfGi0rQpKoB2jBJ51N5yS4+d
   Ce73pm3FY6Z7e7QFfoBlj9RCze7iw452u1j8F1QndovURT3KrxQqSNqKj
   Sl28f2r04hGZwHacw8o9Tt85lhmK+lozbmNO4RugtLNCGi+8rg0l1t54W
   Q==;
X-CSE-ConnectionGUID: yw0voRNYQOO1Yh1zsn3yFg==
X-CSE-MsgGUID: ilMWt+uXQoy0NjL2LrNKXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75121191"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75121191"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 07:54:08 -0700
X-CSE-ConnectionGUID: /K1J4AB6R76pmYH769Yuww==
X-CSE-MsgGUID: 44K33oE9SGSzlrn39NrKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223015042"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Mar 2026 07:54:06 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3El9-000000001BH-0mWd;
	Thu, 19 Mar 2026 14:54:03 +0000
Date: Thu, 19 Mar 2026 22:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 291/539]
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3175:16: error: too
 few arguments to function 'simple_copy_to_iter'
Message-ID: <202603192247.TX0fXp9x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: 57c6b9166540a1457db26d8e2eb3ed29a9a42f19 [291/539] drivers/net/wireless/intel: convert to read/write iterators
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603192247.TX0fXp9x-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603192247.TX0fXp9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603192247.TX0fXp9x-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c: In function 'iwl_dbgfs_rf_read':
   drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3176:67: error: macro "strlen" passed 2 arguments, but takes just 1
    3176 |                                     strlen(trans_pcie->rf_name, to));
         |                                                                   ^
   In file included from include/linux/string.h:390,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:7:
   include/linux/fortify-string.h:255:9: note: macro "strlen" defined here
     255 | #define strlen(p)                                                       \
         |         ^~~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3176:37: error: passing argument 3 of 'simple_copy_to_iter' makes integer from pointer without a cast [-Wint-conversion]
    3176 |                                     strlen(trans_pcie->rf_name, to));
         |                                     ^~~~~~
         |                                     |
         |                                     size_t (*)(const char *) {aka unsigned int (*)(const char *)}
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1473,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:15,
                    from include/linux/pci.h:1736:
   include/linux/fs.h:3304:68: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'size_t (*)(const char *)' {aka 'unsigned int (*)(const char *)'}
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |                                                             ~~~~~~~^~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3175:16: error: too few arguments to function 'simple_copy_to_iter'
    3175 |         return simple_copy_to_iter(trans_pcie->rf_name, &iocb->ki_pos,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3304:9: note: declared here
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3177:1: warning: control reaches end of non-void function [-Wreturn-type]
    3177 | }
         | ^
--
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c: In function 'iwl_dbgfs_tas_get_status_read':
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:706:45: error: passing argument 2 of 'simple_copy_to_iter' makes pointer from integer without a cast [-Wint-conversion]
     706 |         ret = simple_copy_to_iter(buff, pos - buff);
         |                                         ~~~~^~~~~~
         |                                             |
         |                                             int
   In file included from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from include/linux/ieee80211.h:19,
                    from drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:10:
   include/linux/fs.h:3304:55: note: expected 'loff_t *' {aka 'long long int *'} but argument is of type 'int'
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |                                               ~~~~~~~~^~~~
>> drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:706:15: error: too few arguments to function 'simple_copy_to_iter'
     706 |         ret = simple_copy_to_iter(buff, pos - buff);
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3304:9: note: declared here
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c: In function 'iwl_dbgfs_fw_system_stats_read':
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:1022:45: error: passing argument 2 of 'simple_copy_to_iter' makes pointer from integer without a cast [-Wint-conversion]
    1022 |         ret = simple_copy_to_iter(buff, pos - buff);
         |                                         ~~~~^~~~~~
         |                                             |
         |                                             int
   include/linux/fs.h:3304:55: note: expected 'loff_t *' {aka 'long long int *'} but argument is of type 'int'
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |                                               ~~~~~~~~^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:1022:15: error: too few arguments to function 'simple_copy_to_iter'
    1022 |         ret = simple_copy_to_iter(buff, pos - buff);
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3304:9: note: declared here
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c: In function 'iwl_dbgfs_frame_stats_read':
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:1089:45: error: passing argument 2 of 'simple_copy_to_iter' makes pointer from integer without a cast [-Wint-conversion]
    1089 |         ret = simple_copy_to_iter(buff, pos - buff);
         |                                         ~~~~^~~~~~
         |                                             |
         |                                             int
   include/linux/fs.h:3304:55: note: expected 'loff_t *' {aka 'long long int *'} but argument is of type 'int'
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |                                               ~~~~~~~~^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:1089:15: error: too few arguments to function 'simple_copy_to_iter'
    1089 |         ret = simple_copy_to_iter(buff, pos - buff);
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3304:9: note: declared here
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |         ^~~~~~~~~~~~~~~~~~~


vim +/simple_copy_to_iter +3175 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c

  3165	
  3166	static ssize_t iwl_dbgfs_rf_read(struct kiocb *iocb,
  3167					 struct iov_iter *to)
  3168	{
  3169		struct iwl_trans *trans = iocb->ki_filp->private_data;
  3170		struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
  3171	
  3172		if (!trans_pcie->rf_name[0])
  3173			return -ENODEV;
  3174	
> 3175		return simple_copy_to_iter(trans_pcie->rf_name, &iocb->ki_pos,
  3176					    strlen(trans_pcie->rf_name, to));
> 3177	}
  3178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
