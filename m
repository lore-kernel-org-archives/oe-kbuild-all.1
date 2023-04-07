Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B080EAD22
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680896764; x=1712432764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WROnxILt1nc33yvsReY7LVwpzf2HXR0+0Yv+93x2kA0=;
  b=DfWKXg21ZimfhIceqN9HcU6DUnsFrQUtTeO4xRfOFXoEF2tdbN0lSZ3i
   ioyjVEJjYJ6c8lCVL4gS14DNkNdaMrzVezsnVH34oa+1SV0o5aVNlCuta
   jDbYzz/qxJj7Ns4eu5a6ltNLjm+bs7Di1roxgISQJ6alEIWCG/S8cDKB9
   k7+4LmJxKF/ZuUu3cz/gXoaMGQ85jRi+Gl/ukXssK8bOZlXgZLuAWNcm9
   0wQl/9p7UI6vBvYLYsx1j1xd9OmRVIjBxKrl4xZ1B2gxBxZbVNsLZ/OME
   EfYoumgVdlLrjChWmChyLNysn6tYMUN7uKUkHm9ZzmXUrjfOChuL9u1I4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="345709706"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="345709706"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 12:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637805784"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637805784"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 12:46:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pks26-000SpO-1o;
	Fri, 07 Apr 2023 19:46:02 +0000
Date: Sat, 8 Apr 2023 03:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v4 9/11] ivm.c:undefined reference
 to `__tdx_hypercall_ret'
Message-ID: <202304080321.yb9ABBv8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v4
head:   1d92fca91fe3723a3a86bb54b4d427c9fcb803e9
commit: 54aa56c2db98cb287a268cd954d4c8cc8919cec9 [9/11] x86/hyperv: Support hypercalls for TDX guests
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080321.yb9ABBv8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/54aa56c2db98cb287a268cd954d4c8cc8919cec9
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v4
        git checkout 54aa56c2db98cb287a268cd954d4c8cc8919cec9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080321.yb9ABBv8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/hyperv/ivm.o: in function `hv_tdx_hypercall':
>> ivm.c:(.text+0x76): undefined reference to `__tdx_hypercall_ret'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
