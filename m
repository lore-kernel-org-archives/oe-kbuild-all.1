Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E649881F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676922872; x=1708458872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8TIrN4UXomXE4uoL54nhVbmn4jpeOsHwBHo0STMsWTQ=;
  b=nuaAa36OSBqZETI4QPwOSDc8Oe8PeoE3nz37cILZLUrqrjwvvQck9ZU2
   Nv6uCdDN4M8sVtXpGIEeazLcok/963u3i5CdHtHcGkS5NJM/064DMaU4z
   s7bRnpiuZnC/s1aUb9ppdnL8GPKEeDkDl8R9FoCUfM9c+APi7UpTP48Fi
   FHfbYiNH7A/2FtTtCk2Lh/IjobplLda0h/A4I1PXWiieSP1CR9T2qvvoy
   Iu1Rr41NeJBpfhJ5haXyeJCz8rp2AWSz/0QZquHpayJ4MfmOCLKhMBt0U
   hv0zSHjSzkztjwrIVoWmLHRmNh9R9hQvMk78/xmBYGUMfsQhejWkD8ami
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397162348"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="397162348"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 11:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671400640"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="671400640"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Feb 2023 11:54:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUCF1-000E8r-1R;
	Mon, 20 Feb 2023 19:54:27 +0000
Date: Tue, 21 Feb 2023 03:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-next 16891/16904] fs/nfsd/nfssvc.c:366:51: warning:
 argument to 'sizeof' in 'memcpy' call is the same expression as the
 destination; did you mean to dereference it?
Message-ID: <202302210342.w1Y5fxgb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-next
head:   3661b50f92042146952ed41f8eb6a802ab0f018e
commit: 70ade8921d66c7126104014517f1b3f7528cb69f [16891/16904] NFSD: copy the whole verifier in nfsd_copy_write_verifier
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230221/202302210342.w1Y5fxgb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=70ade8921d66c7126104014517f1b3f7528cb69f
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton nfsd-next
        git checkout 70ade8921d66c7126104014517f1b3f7528cb69f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210342.w1Y5fxgb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfssvc.c: In function 'nfsd_copy_write_verifier':
   fs/nfsd/nfssvc.c:366:51: warning: 'sizeof' on array function parameter 'verf' will return size of '__be32 *' {aka 'unsigned int *'} [-Wsizeof-array-argument]
     366 |                 memcpy(verf, nn->writeverf, sizeof(verf));
         |                                                   ^
   fs/nfsd/nfssvc.c:360:38: note: declared here
     360 | void nfsd_copy_write_verifier(__be32 verf[2], struct nfsd_net *nn)
         |                               ~~~~~~~^~~~~~~
>> fs/nfsd/nfssvc.c:366:51: warning: argument to 'sizeof' in 'memcpy' call is the same expression as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
     366 |                 memcpy(verf, nn->writeverf, sizeof(verf));
         |                                                   ^


vim +366 fs/nfsd/nfssvc.c

   351	
   352	/**
   353	 * nfsd_copy_write_verifier - Atomically copy a write verifier
   354	 * @verf: buffer in which to receive the verifier cookie
   355	 * @nn: NFS net namespace
   356	 *
   357	 * This function provides a wait-free mechanism for copying the
   358	 * namespace's write verifier without tearing it.
   359	 */
   360	void nfsd_copy_write_verifier(__be32 verf[2], struct nfsd_net *nn)
   361	{
   362		int seq = 0;
   363	
   364		do {
   365			read_seqbegin_or_lock(&nn->writeverf_lock, &seq);
 > 366			memcpy(verf, nn->writeverf, sizeof(verf));
   367		} while (need_seqretry(&nn->writeverf_lock, seq));
   368		done_seqretry(&nn->writeverf_lock, seq);
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
