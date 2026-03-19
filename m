Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D53DBD7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932050; cv=none; b=TBmbdo9ZWKZ4oG3v3/HFpEdW/SeraWdzVRZHnyQ8A39SqooT61ga+/hx2jpouTJF17VDxOkOPAIcy2EEfeMjVB+EC1TGEve1hEksxQ95etMQ2mSHm0fp++8+EOYKPhc9EkN+G7oOUGR7ctjbsKkB5RLIBb9Y3iAgv68fE0Kf4Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932050; c=relaxed/simple;
	bh=qzhsPnodeiskw1A96IJbFwsu8TrdwKHB5Nu/BDgvVnE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NgVf9a2yNrUvL1DrMXXvCOuyDqZz1WGRlnNQ3aVrTAZJNIYvduxbPYD3voZGTbhqYaqLPLNs7igAJwvUd3iBLrwSMIXq6xsZrtiWOaENEseTzC5Li7iNO2lpU3TT/sIF2Wo3HFdv0XPoSJFPhuFzWTmwwNNfmqOrOFhmIQdavwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/Puf2pf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/Puf2pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773932049; x=1805468049;
  h=date:from:to:cc:subject:message-id;
  bh=qzhsPnodeiskw1A96IJbFwsu8TrdwKHB5Nu/BDgvVnE=;
  b=k/Puf2pfiJPaoIu+rWCVqFqO2G9U3QRdl4yAkBRhFJE74btvdKd99E3G
   xcLYSy/lB05gJ4636rFwZGSDmBLiXpVlaRbC6otuspCRUCirzoY4Fbpk5
   UDrNjpOeE5Qs2c3yoe48TswGeNvXXrMTfGHBBH+ovRMwjg3w8K0cx22Yh
   p/RaHO70JWzUztRzG4iDFXbYWKohE+3M3am6gZuuPZ3qn178kp4Yu/ggv
   3EHH/PXbjpScf7QQjd9GKkfKQzogoU/pzNkJwZ+glpEmCKLyrM73P6HT/
   ud8n2rTeerQH18es0QpF9Rpcmd5veh82U0sVLeCG8x/ABbNRMMm6aQyXy
   Q==;
X-CSE-ConnectionGUID: 7OaWJ35/Qxet89zzElXaFQ==
X-CSE-MsgGUID: hKdsTeaJRP6VE98L0NSVfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75121189"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75121189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 07:54:07 -0700
X-CSE-ConnectionGUID: rDMRL2HfS2ShuYaf/R7OFA==
X-CSE-MsgGUID: yFm6IOHaT2yjkvFhMmEdIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223015040"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Mar 2026 07:54:05 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3El9-000000001BF-0fLg;
	Thu, 19 Mar 2026 14:54:03 +0000
Date: Thu, 19 Mar 2026 22:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 291/539]
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3176:37: error: too
 many arguments to function 'strlen'; expected 1, have 2
Message-ID: <202603192229.wsEWr11e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: 57c6b9166540a1457db26d8e2eb3ed29a9a42f19 [291/539] drivers/net/wireless/intel: convert to read/write iterators
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603192229.wsEWr11e-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603192229.wsEWr11e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603192229.wsEWr11e-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c: In function 'iwl_dbgfs_rf_read':
>> drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3176:37: error: too many arguments to function 'strlen'; expected 1, have 2
    3176 |                                     strlen(trans_pcie->rf_name, to));
         |                                     ^~~~~~                      ~~
   In file included from include/linux/string.h:69,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:7:
   arch/arc/include/asm/string.h:32:24: note: declared here
      32 | extern __kernel_size_t strlen(const char *);
         |                        ^~~~~~
>> drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3175:16: error: too few arguments to function 'simple_copy_to_iter'; expected 4, have 3
    3175 |         return simple_copy_to_iter(trans_pcie->rf_name, &iocb->ki_pos,
         |                ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1473,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:15,
                    from include/linux/pci.h:1736:
   include/linux/fs.h:3304:9: note: declared here
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |         ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/rs.c:24:
>> drivers/net/wireless/intel/iwlwifi/mvm/debugfs.h:33:22: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Wincompatible-pointer-types]
      33 |         .read_iter = iwl_dbgfs_##name##_read,                           \
         |                      ^~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/rs.c:4051:9: note: in expansion of macro '_MVM_DEBUGFS_READ_WRITE_FILE_OPS'
    4051 |         _MVM_DEBUGFS_READ_WRITE_FILE_OPS(name, bufsz, struct iwl_lq_sta)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/rs.c:4057:1: note: in expansion of macro 'MVM_DEBUGFS_READ_WRITE_FILE_OPS'
    4057 | MVM_DEBUGFS_READ_WRITE_FILE_OPS(ss_force, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.h:33:22: note: (near initialization for 'iwl_dbgfs_ss_force_ops.read_iter')
      33 |         .read_iter = iwl_dbgfs_##name##_read,                           \
         |                      ^~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/rs.c:4051:9: note: in expansion of macro '_MVM_DEBUGFS_READ_WRITE_FILE_OPS'
    4051 |         _MVM_DEBUGFS_READ_WRITE_FILE_OPS(name, bufsz, struct iwl_lq_sta)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/rs.c:4057:1: note: in expansion of macro 'MVM_DEBUGFS_READ_WRITE_FILE_OPS'
    4057 | MVM_DEBUGFS_READ_WRITE_FILE_OPS(ss_force, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/rs.c:3997:16: note: 'iwl_dbgfs_ss_force_read' declared here
    3997 | static ssize_t iwl_dbgfs_ss_force_read(struct file *file,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c: In function 'iwl_dbgfs_tas_get_status_read':
>> drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:706:45: error: passing argument 2 of 'simple_copy_to_iter' makes pointer from integer without a cast [-Wint-conversion]
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
>> drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:706:15: error: too few arguments to function 'simple_copy_to_iter'; expected 4, have 2
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
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:1022:15: error: too few arguments to function 'simple_copy_to_iter'; expected 4, have 2
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
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c:1089:15: error: too few arguments to function 'simple_copy_to_iter'; expected 4, have 2
    1089 |         ret = simple_copy_to_iter(buff, pos - buff);
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3304:9: note: declared here
    3304 | ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
         |         ^~~~~~~~~~~~~~~~~~~


vim +/strlen +3176 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c

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
> 3176					    strlen(trans_pcie->rf_name, to));
  3177	}
  3178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
