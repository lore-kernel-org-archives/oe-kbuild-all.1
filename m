Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DE410F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674557092; x=1706093092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9GN09YTe7MMMKDh6Jjnt9HvPyO8WnTDVLFsKBcAcLXM=;
  b=VROY7YADC7THQnI2Hoa9a+y7fend3RVRVyxUwiDsMXrWD4Mi74MridoQ
   EDnnL8Q2OAGXJc6hbTpPiowYvdZzgjE5BvFzR+ENFDjdOcsHtLsjlTXfA
   +PiBS9fgvylMJ8IuhbU1lsLqrGbjBIQMCBb67w/uWXJGYq1MdSoMZ8Tea
   sWB7Ks5yoM116PTWioM9NV0daDYa0eSVjCGsFhu94p3HyCxKbQyh77dOz
   Ad48VPKJ4mZpPtYJvyPF+bxh/QyGd0/Jowbiiz0fFyb+KC9Om49XYIDQI
   60Ddrjyiuml7vIUaCL8rK9vETob++FtEyvg5TuwrNkBdBKTKlntIeGL+t
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328356975"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="328356975"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907438513"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="907438513"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 02:44:50 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKGnJ-0006LU-2a;
	Tue, 24 Jan 2023 10:44:49 +0000
Date: Tue, 24 Jan 2023 18:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Van Hensbergen <ericvh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, v9fs-developer@lists.sourceforge.net
Subject: [ericvh-v9fs:ericvh/for-next 4/12] fs/9p/vfs_file.c:590:42: warning:
 'v9fs_file_vm_ops' defined but not used
Message-ID: <202301241856.YAPUu0wS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git ericvh/for-next
head:   2245aefc0a6f35eb2a9ad0afa8958c3d2fa694ea
commit: 7cde5b8cea83cb4f289ad3b1183656836b14fa2b [4/12] Consolidate file operations and add readahead and writeback
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230124/202301241856.YAPUu0wS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git/commit/?id=7cde5b8cea83cb4f289ad3b1183656836b14fa2b
        git remote add ericvh-v9fs https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git
        git fetch --no-tags ericvh-v9fs ericvh/for-next
        git checkout 7cde5b8cea83cb4f289ad3b1183656836b14fa2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/9p/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/9p/vfs_file.c:590:42: warning: 'v9fs_file_vm_ops' defined but not used [-Wunused-const-variable=]
     590 | static const struct vm_operations_struct v9fs_file_vm_ops = {
         |                                          ^~~~~~~~~~~~~~~~


vim +/v9fs_file_vm_ops +590 fs/9p/vfs_file.c

fb89b45cdfdc8b Dominique Martinet 2014-01-10  588  
fb89b45cdfdc8b Dominique Martinet 2014-01-10  589  
7263cebed9fada Aneesh Kumar K.V   2011-02-28 @590  static const struct vm_operations_struct v9fs_file_vm_ops = {
7263cebed9fada Aneesh Kumar K.V   2011-02-28  591  	.fault = filemap_fault,
f1820361f83d55 Kirill A. Shutemov 2014-04-07  592  	.map_pages = filemap_map_pages,
7263cebed9fada Aneesh Kumar K.V   2011-02-28  593  	.page_mkwrite = v9fs_vm_page_mkwrite,
7263cebed9fada Aneesh Kumar K.V   2011-02-28  594  };
7263cebed9fada Aneesh Kumar K.V   2011-02-28  595  

:::::: The code at line 590 was first introduced by commit
:::::: 7263cebed9fadad719063fdc8bba7085cf2c080d fs/9p: Add buffered write support for v9fs.

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Eric Van Hensbergen <ericvh@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
