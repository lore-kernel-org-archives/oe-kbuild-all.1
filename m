Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6E190
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 02:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679712045; x=1711248045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V562cJTUW6cDbBsUye0gmw4tUX9R+HzAALEOrJ8Rues=;
  b=H3SHGT3VdGyebz59nGikE1sOb578KqN5YL0uR54s81KKkeLAkLRBY5hU
   qNnv0hl1XN3IQbmw8eVA9anS8WCRR+3yEwNPhJJ2WnNm93AF+yDTXgoK9
   P4XTYVrAu3D4/LuVVt2am+W2orBstJu07GpMLHQ1l98MMh880W+N81uwz
   6j5KR6i9VINz3ViHyrrGg5hTZxwjq+PAHjbOCBZblifaxka5UnBJbmFH7
   UvX0alPsLYjr3f4Yop0aTesie5PEwMK4XnuXpa+bHQDFlaSD5SR9InrIr
   FJ8/YBvo/h9h6CoZkS+6b85uGaIp8ew+t874+gCjzW4O8OfqQpiPQpJNx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328355748"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="328355748"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 19:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="633041635"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="633041635"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Mar 2023 19:40:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pftpj-000Fsq-27;
	Sat, 25 Mar 2023 02:40:43 +0000
Date: Sat, 25 Mar 2023 10:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:iter-ubuf 2/2] lib/iov_iter.c:1786:9: warning: no
 previous prototype for '__import_iovec_ubuf'
Message-ID: <202303251001.JGiCReZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git iter-ubuf
head:   8ccf20004bd671f70362eac93833c12f5ce89c66
commit: 8ccf20004bd671f70362eac93833c12f5ce89c66 [2/2] iov_iter: import single vector iovecs as ITER_UBUF
config: parisc-randconfig-r006-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251001.JGiCReZB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=8ccf20004bd671f70362eac93833c12f5ce89c66
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block iter-ubuf
        git checkout 8ccf20004bd671f70362eac93833c12f5ce89c66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251001.JGiCReZB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/iov_iter.c:1786:9: warning: no previous prototype for '__import_iovec_ubuf' [-Wmissing-prototypes]
    1786 | ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
         |         ^~~~~~~~~~~~~~~~~~~


vim +/__import_iovec_ubuf +1786 lib/iov_iter.c

  1782	
  1783	/*
  1784	 * Single segment iovec supplied by the user, import it as ITER_UBUF.
  1785	 */
> 1786	ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
  1787				    struct iovec **iovp, struct iov_iter *i,
  1788				    bool compat)
  1789	{
  1790		struct iovec *iov = *iovp;
  1791		ssize_t ret;
  1792	
  1793		if (compat)
  1794			ret = copy_compat_iovec_from_user(iov, uvec, 1);
  1795		else
  1796			ret = copy_iovec_from_user(iov, uvec, 1);
  1797		if (unlikely(ret))
  1798			return ret;
  1799	
  1800		import_ubuf(type, iov->iov_base, iov->iov_len, i);
  1801		*iovp = NULL;
  1802		return i->count;
  1803	}
  1804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
