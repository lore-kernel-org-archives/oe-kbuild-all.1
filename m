Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0689B156CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755908368; cv=none; b=kfjV35cEAQctCR7tEgEi5DQSLWxZ+R/+Q+9qcHzvpea8p4R43AWFNvy3OkWAOLA+1ebkC6d2lNvI7spC0SfIZO/bUPcbSCkpMOQxLJCcgfPjbg3Uvx/CgBiVgvsOCADS7mfiMiEgicF23cSjUuUUxJkZfURKVu0cgR2NctSfFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755908368; c=relaxed/simple;
	bh=6ISXGPDqh5pOfCUnj1sPbLTYjcSxUSulEPedG2Os3cE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJwtD7RPkFwYVHR7wLNqdChblkJ8QlY/7wUmEMdy8FcMiGbdxd53mNlnD8/ytviV9eM6LZqBjcbscSVSS2rNCiuT6UO04tDgIB8UAhNLk8Tzw4wugtY7JgrTMXQA2lDpsNjft7F9wStqIWYJT4AEbelx/4i03NSPmcJmJxCzVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS2Dm3Vb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS2Dm3Vb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755908366; x=1787444366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ISXGPDqh5pOfCUnj1sPbLTYjcSxUSulEPedG2Os3cE=;
  b=iS2Dm3Vb8Ki3xu+rcjGWHWJJa81an7UU90zo15igM47C66lJD7YslbKC
   1YYBNoK7VVrF4qgXe2cSEr45LYS7HPrWA0df6COOs2Jg9CJ/i0jNkcXPN
   g6sTM7omYSOgWb8VPy1meURmxDRhCgQTp1ppjpOvIOtlmEIyW9fYCQvyJ
   qDxe0tY59CMrfoXFYil1WykdNws7Vmv6JXAYSwoPzuAHeA6rq+Mf4lFjI
   tYbGOrVM1OuPwskujsUVaNofNBADG6rvRhb7k0aEj/owQ2ozl+g+TbDtO
   Tdso7C3xzjE9dkXFDuy+w2BgxOkjAYUEHnxKH68tZcn+zK9+s/+4KpYwT
   Q==;
X-CSE-ConnectionGUID: racQrHGsS52hpvnuWndQTQ==
X-CSE-MsgGUID: Y5MF0vOPTFaElT5KS/4ISw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58078319"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58078319"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 17:19:25 -0700
X-CSE-ConnectionGUID: mn3RKEo5QYWC5oztwn0LSQ==
X-CSE-MsgGUID: AuTjxDYaQ6yf5cDIFyV77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="205999755"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2025 17:19:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upbyc-000Lx5-0k;
	Sat, 23 Aug 2025 00:19:22 +0000
Date: Sat, 23 Aug 2025 08:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/f2fs/f2fs.h:2183:42: error: no
 member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202508230853.N2bfM0zM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   78b358dd857847b754754677fc0c9b5a1b3d6fe3
commit: 29429c25a600ea41fc44db5d8de0f65bce2872ac [1/1] ANDROID: vendor_hooks: add hooks for f2fs down read
config: i386-buildonly-randconfig-002-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230853.N2bfM0zM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230853.N2bfM0zM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230853.N2bfM0zM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/compress.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2234:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/f2fs/compress.c:18:
>> fs/f2fs/f2fs.h:2183:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 warning and 1 error generated.
--
   In file included from fs/f2fs/file.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2234:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/f2fs/file.c:28:
>> fs/f2fs/f2fs.h:2183:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   fs/f2fs/file.c:41:12: warning: no previous prototype for function 'f2fs_filemap_fault' [-Wmissing-prototypes]
      41 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         |            ^
   fs/f2fs/file.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         | ^
         | static 
   2 warnings and 1 error generated.


vim +2183 fs/f2fs/f2fs.h

  2176	
  2177	void _trace_android_rvh_f2fs_down_read(wait_queue_head_t *read_waiters,
  2178					   struct rw_semaphore *rwsem, bool *skip);
  2179	
  2180	static inline void f2fs_down_read(struct f2fs_rwsem *sem)
  2181	{
  2182		bool skip = false;
> 2183		_trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
  2184		if (skip)
  2185			return;
  2186	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
  2187		wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
  2188	#else
  2189		down_read(&sem->internal_rwsem);
  2190	#endif
  2191	}
  2192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
