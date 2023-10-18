Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819C430E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 04:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSQb0F3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697604169; x=1729140169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmZzlIdqhYmXcwK47ocMN/yqN5HhnpJYZYqUHIo2TTM=;
  b=dSQb0F3+yvakp7k68y1+yIBqTQEPz0fERD29BSx3QQAFut3Ap3lNgCyJ
   AeKrURM7E3KaTE8lKUEsQshvor+Vdmb+GrcSzbqOGXtawKXJ0FlkYtbLI
   KVaYKkdpWhkhqpt1v5XlcwjJ4RKOM6J0Iigh6N2ToylrztgWzcusZoi2V
   HY6/wzM/ztW6bkHZZd2WyALf73jy0A73zDTO4WJnRjKunVgkPRV5fEWk9
   Lk0MQh25qmEc/Qeyy7tYuDEs1++ElJ8tvjjDcWQ5Yx8siy5xP8qRSE20E
   hYwm4eqmlT0eJD0XmLIN75x6Xbu36LTiA8MMFDw7e7K4YRn+OyLOZYes3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="450157234"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="450157234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 21:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="4361052"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2023 21:42:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsyOL-000AWk-15;
	Wed, 18 Oct 2023 04:42:45 +0000
Date: Wed, 18 Oct 2023 12:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-fsverity-kfunc 1/5]
 kernel/trace/bpf_trace.c:1447:17: warning: no previous declaration for
 'bpf_get_file_xattr'
Message-ID: <202310181234.eKL8iE1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-fsverity-kfunc
head:   1dc94c536fe6c5f3da4712d746698a38fdce474e
commit: 9418605c321ac2028411a0e8af3407e3ad62d963 [1/5] bpf: Add kfunc bpf_get_file_xattr
config: x86_64-randconfig-071-20231018 (https://download.01.org/0day-ci/archive/20231018/202310181234.eKL8iE1A-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181234.eKL8iE1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181234.eKL8iE1A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/bpf_trace.c:1285:29: warning: no previous declaration for 'bpf_lookup_user_key' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_key *bpf_lookup_user_key(u32 serial, u64 flags)
                                ^~~~~~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:1334:29: warning: no previous declaration for 'bpf_lookup_system_key' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_key *bpf_lookup_system_key(u64 id)
                                ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:1358:18: warning: no previous declaration for 'bpf_key_put' [-Wmissing-declarations]
    __bpf_kfunc void bpf_key_put(struct bpf_key *bkey)
                     ^~~~~~~~~~~
   kernel/trace/bpf_trace.c:1378:17: warning: no previous declaration for 'bpf_verify_pkcs7_signature' [-Wmissing-declarations]
    __bpf_kfunc int bpf_verify_pkcs7_signature(struct bpf_dynptr_kern *data_ptr,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/bpf_trace.c:1447:17: warning: no previous declaration for 'bpf_get_file_xattr' [-Wmissing-declarations]
    __bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynptr_kern *name_ptr,
                    ^~~~~~~~~~~~~~~~~~


vim +/bpf_get_file_xattr +1447 kernel/trace/bpf_trace.c

  1432	
  1433	/* filesystem kfuncs */
  1434	__diag_push();
  1435	__diag_ignore_all("-Wmissing-prototypes",
  1436			  "kfuncs which will be used in BPF programs");
  1437	
  1438	/**
  1439	 * bpf_get_file_xattr - get xattr of a file
  1440	 * @name_ptr: name of the xattr
  1441	 * @value_ptr: output buffer of the xattr value
  1442	 *
  1443	 * Get xattr *name_ptr* of *file* and store the output in *value_ptr*.
  1444	 *
  1445	 * Return: 0 on success, a negative value on error.
  1446	 */
> 1447	__bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynptr_kern *name_ptr,
  1448					   struct bpf_dynptr_kern *value_ptr)
  1449	{
  1450		if (!bpf_dynptr_is_string(name_ptr))
  1451			return -EINVAL;
  1452	
  1453		return vfs_getxattr(mnt_idmap(file->f_path.mnt), file_dentry(file), name_ptr->data,
  1454				    value_ptr->data, __bpf_dynptr_size(value_ptr));
  1455	}
  1456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
