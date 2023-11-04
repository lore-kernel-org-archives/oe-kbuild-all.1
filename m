Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3634EC133
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbvLT3Tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699130716; x=1730666716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/47jz1BjpgxOx2eKbQRVKS0VKFK+iH28LWYQ4DZ+G4w=;
  b=YbvLT3TmtVSj6kgbDtInBg8mBVDMHBjvWk+IIgNTzoc4AmM9iq/CUsRF
   D/VZXScjd5m3oiGK51VJZxxSwvhI/PMPQMSt9gxCpPzrjv995iKAUZnNw
   6FXkcYzqiAiJsjPVB3wgIcvzL9RsN+8aSAgSve8GQoe46Jx8FaK1d/dFI
   zsLipkHb9pj3p9BzHBY12F67mi1+Y5gvindM3pVE+ZYvnNvvmnVYLA3Lc
   QDW8d8nS0k4U5SCI8CIAHk/X7O64WpZTg0xI2X2udO/nFN7X4H73FDX1p
   wMScVLVb3esPoG6iOIy8V1JZguUSj9jE+aZIhFbKxdRgAVZ9O+UXrf3Nj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379499993"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="379499993"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 13:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="10075579"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2023 13:45:13 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzNW3-0004g8-0U;
	Sat, 04 Nov 2023 20:45:11 +0000
Date: Sun, 5 Nov 2023 04:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 14/16] kernel/bpf/helpers.c:1470:36:
 warning: unused variable 'bpf_dynptr_from_mem_proto'
Message-ID: <202311050447.G0TKLtim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   9d02047200a95c6b3c244b9bbf4cbd77eaac2072
commit: 760f4cf674da090493b278a32a2fc69e6f9575cd [14/16] CHROMIUM: Introduce CONFIG_BPF_DYNPTR
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311050447.G0TKLtim-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050447.G0TKLtim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050447.G0TKLtim-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:1470:36: warning: unused variable 'bpf_dynptr_from_mem_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_dynptr_from_mem_proto = {
                                      ^
>> kernel/bpf/helpers.c:1497:36: warning: unused variable 'bpf_dynptr_read_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_dynptr_read_proto = {
                                      ^
>> kernel/bpf/helpers.c:1525:36: warning: unused variable 'bpf_dynptr_write_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_dynptr_write_proto = {
                                      ^
>> kernel/bpf/helpers.c:1553:36: warning: unused variable 'bpf_dynptr_data_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_dynptr_data_proto = {
                                      ^
   4 warnings generated.


vim +/bpf_dynptr_from_mem_proto +1470 kernel/bpf/helpers.c

263ae152e96253 Joanne Koong 2022-05-23  1469  
dc368e1c658e4f Joanne Koong 2022-06-16 @1470  static const struct bpf_func_proto bpf_dynptr_from_mem_proto = {
263ae152e96253 Joanne Koong 2022-05-23  1471  	.func		= bpf_dynptr_from_mem,
263ae152e96253 Joanne Koong 2022-05-23  1472  	.gpl_only	= false,
263ae152e96253 Joanne Koong 2022-05-23  1473  	.ret_type	= RET_INTEGER,
263ae152e96253 Joanne Koong 2022-05-23  1474  	.arg1_type	= ARG_PTR_TO_UNINIT_MEM,
263ae152e96253 Joanne Koong 2022-05-23  1475  	.arg2_type	= ARG_CONST_SIZE_OR_ZERO,
263ae152e96253 Joanne Koong 2022-05-23  1476  	.arg3_type	= ARG_ANYTHING,
263ae152e96253 Joanne Koong 2022-05-23  1477  	.arg4_type	= ARG_PTR_TO_DYNPTR | DYNPTR_TYPE_LOCAL | MEM_UNINIT,
263ae152e96253 Joanne Koong 2022-05-23  1478  };
263ae152e96253 Joanne Koong 2022-05-23  1479  
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1480  BPF_CALL_5(bpf_dynptr_read, void *, dst, u32, len, struct bpf_dynptr_kern *, src,
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1481  	   u32, offset, u64, flags)
13bbbfbea7598e Joanne Koong 2022-05-23  1482  {
13bbbfbea7598e Joanne Koong 2022-05-23  1483  	int err;
13bbbfbea7598e Joanne Koong 2022-05-23  1484  
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1485  	if (!src->data || flags)
13bbbfbea7598e Joanne Koong 2022-05-23  1486  		return -EINVAL;
13bbbfbea7598e Joanne Koong 2022-05-23  1487  
13bbbfbea7598e Joanne Koong 2022-05-23  1488  	err = bpf_dynptr_check_off_len(src, offset, len);
13bbbfbea7598e Joanne Koong 2022-05-23  1489  	if (err)
13bbbfbea7598e Joanne Koong 2022-05-23  1490  		return err;
13bbbfbea7598e Joanne Koong 2022-05-23  1491  
13bbbfbea7598e Joanne Koong 2022-05-23  1492  	memcpy(dst, src->data + src->offset + offset, len);
13bbbfbea7598e Joanne Koong 2022-05-23  1493  
13bbbfbea7598e Joanne Koong 2022-05-23  1494  	return 0;
13bbbfbea7598e Joanne Koong 2022-05-23  1495  }
13bbbfbea7598e Joanne Koong 2022-05-23  1496  
dc368e1c658e4f Joanne Koong 2022-06-16 @1497  static const struct bpf_func_proto bpf_dynptr_read_proto = {
13bbbfbea7598e Joanne Koong 2022-05-23  1498  	.func		= bpf_dynptr_read,
13bbbfbea7598e Joanne Koong 2022-05-23  1499  	.gpl_only	= false,
13bbbfbea7598e Joanne Koong 2022-05-23  1500  	.ret_type	= RET_INTEGER,
13bbbfbea7598e Joanne Koong 2022-05-23  1501  	.arg1_type	= ARG_PTR_TO_UNINIT_MEM,
13bbbfbea7598e Joanne Koong 2022-05-23  1502  	.arg2_type	= ARG_CONST_SIZE_OR_ZERO,
13bbbfbea7598e Joanne Koong 2022-05-23  1503  	.arg3_type	= ARG_PTR_TO_DYNPTR,
13bbbfbea7598e Joanne Koong 2022-05-23  1504  	.arg4_type	= ARG_ANYTHING,
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1505  	.arg5_type	= ARG_ANYTHING,
13bbbfbea7598e Joanne Koong 2022-05-23  1506  };
13bbbfbea7598e Joanne Koong 2022-05-23  1507  
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1508  BPF_CALL_5(bpf_dynptr_write, struct bpf_dynptr_kern *, dst, u32, offset, void *, src,
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1509  	   u32, len, u64, flags)
13bbbfbea7598e Joanne Koong 2022-05-23  1510  {
13bbbfbea7598e Joanne Koong 2022-05-23  1511  	int err;
13bbbfbea7598e Joanne Koong 2022-05-23  1512  
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1513  	if (!dst->data || flags || bpf_dynptr_is_rdonly(dst))
13bbbfbea7598e Joanne Koong 2022-05-23  1514  		return -EINVAL;
13bbbfbea7598e Joanne Koong 2022-05-23  1515  
13bbbfbea7598e Joanne Koong 2022-05-23  1516  	err = bpf_dynptr_check_off_len(dst, offset, len);
13bbbfbea7598e Joanne Koong 2022-05-23  1517  	if (err)
13bbbfbea7598e Joanne Koong 2022-05-23  1518  		return err;
13bbbfbea7598e Joanne Koong 2022-05-23  1519  
13bbbfbea7598e Joanne Koong 2022-05-23  1520  	memcpy(dst->data + dst->offset + offset, src, len);
13bbbfbea7598e Joanne Koong 2022-05-23  1521  
13bbbfbea7598e Joanne Koong 2022-05-23  1522  	return 0;
13bbbfbea7598e Joanne Koong 2022-05-23  1523  }
13bbbfbea7598e Joanne Koong 2022-05-23  1524  
dc368e1c658e4f Joanne Koong 2022-06-16 @1525  static const struct bpf_func_proto bpf_dynptr_write_proto = {
13bbbfbea7598e Joanne Koong 2022-05-23  1526  	.func		= bpf_dynptr_write,
13bbbfbea7598e Joanne Koong 2022-05-23  1527  	.gpl_only	= false,
13bbbfbea7598e Joanne Koong 2022-05-23  1528  	.ret_type	= RET_INTEGER,
13bbbfbea7598e Joanne Koong 2022-05-23  1529  	.arg1_type	= ARG_PTR_TO_DYNPTR,
13bbbfbea7598e Joanne Koong 2022-05-23  1530  	.arg2_type	= ARG_ANYTHING,
13bbbfbea7598e Joanne Koong 2022-05-23  1531  	.arg3_type	= ARG_PTR_TO_MEM | MEM_RDONLY,
13bbbfbea7598e Joanne Koong 2022-05-23  1532  	.arg4_type	= ARG_CONST_SIZE_OR_ZERO,
f8d3da4ef8faf0 Joanne Koong 2022-07-06  1533  	.arg5_type	= ARG_ANYTHING,
13bbbfbea7598e Joanne Koong 2022-05-23  1534  };
13bbbfbea7598e Joanne Koong 2022-05-23  1535  
34d4ef5775f776 Joanne Koong 2022-05-23  1536  BPF_CALL_3(bpf_dynptr_data, struct bpf_dynptr_kern *, ptr, u32, offset, u32, len)
34d4ef5775f776 Joanne Koong 2022-05-23  1537  {
34d4ef5775f776 Joanne Koong 2022-05-23  1538  	int err;
34d4ef5775f776 Joanne Koong 2022-05-23  1539  
34d4ef5775f776 Joanne Koong 2022-05-23  1540  	if (!ptr->data)
34d4ef5775f776 Joanne Koong 2022-05-23  1541  		return 0;
34d4ef5775f776 Joanne Koong 2022-05-23  1542  
34d4ef5775f776 Joanne Koong 2022-05-23  1543  	err = bpf_dynptr_check_off_len(ptr, offset, len);
34d4ef5775f776 Joanne Koong 2022-05-23  1544  	if (err)
34d4ef5775f776 Joanne Koong 2022-05-23  1545  		return 0;
34d4ef5775f776 Joanne Koong 2022-05-23  1546  
34d4ef5775f776 Joanne Koong 2022-05-23  1547  	if (bpf_dynptr_is_rdonly(ptr))
34d4ef5775f776 Joanne Koong 2022-05-23  1548  		return 0;
34d4ef5775f776 Joanne Koong 2022-05-23  1549  
34d4ef5775f776 Joanne Koong 2022-05-23  1550  	return (unsigned long)(ptr->data + ptr->offset + offset);
34d4ef5775f776 Joanne Koong 2022-05-23  1551  }
34d4ef5775f776 Joanne Koong 2022-05-23  1552  
dc368e1c658e4f Joanne Koong 2022-06-16 @1553  static const struct bpf_func_proto bpf_dynptr_data_proto = {
34d4ef5775f776 Joanne Koong 2022-05-23  1554  	.func		= bpf_dynptr_data,
34d4ef5775f776 Joanne Koong 2022-05-23  1555  	.gpl_only	= false,
34d4ef5775f776 Joanne Koong 2022-05-23  1556  	.ret_type	= RET_PTR_TO_DYNPTR_MEM_OR_NULL,
34d4ef5775f776 Joanne Koong 2022-05-23  1557  	.arg1_type	= ARG_PTR_TO_DYNPTR,
34d4ef5775f776 Joanne Koong 2022-05-23  1558  	.arg2_type	= ARG_ANYTHING,
34d4ef5775f776 Joanne Koong 2022-05-23  1559  	.arg3_type	= ARG_CONST_ALLOC_SIZE_OR_ZERO,
34d4ef5775f776 Joanne Koong 2022-05-23  1560  };
34d4ef5775f776 Joanne Koong 2022-05-23  1561  

:::::: The code at line 1470 was first introduced by commit
:::::: dc368e1c658e4f478a45e8d1d5b0c8392ca87506 bpf: Fix non-static bpf_func_proto struct definitions

:::::: TO: Joanne Koong <joannelkoong@gmail.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
