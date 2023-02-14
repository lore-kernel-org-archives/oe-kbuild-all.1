Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE54C5EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 19:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676402906; x=1707938906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZZVzK8hIPmLjqDqUQxONG8cFhhgqu1zcoCebrHgIoc=;
  b=JtFp8e/yN6LJ6KuJV9VWKX60SOVoiu/zqJIRPe16snqeQgJNmeyvOkxY
   xWjiUOAMRwbL84WHAk/BltOuy0qzJwI9OPRXsLSuirICtKQbN/lwKjymk
   1HM35NiAFzk7fICGBPCMMMGZ5xUGC1LfPY2WD9T3dMdmubl/Plm3Y0Khu
   itbL+8D/PE6+NNr9nJOh7cvvWQSB8MDsVFjPQdgGFlTxHelbq+pMWjiWl
   GNnNTeOzQPK/nzQX7kNA1F3i/HdAkZHxiWq59NlgG0v3fZ++rekIE+kkp
   xjISkYtxpXdsZ8Req/jXb2RO6ABaRcj5Mqxf/SVkNMqIQgiq8h9Kp+SQu
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="417467212"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="417467212"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 11:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758105033"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="758105033"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 11:28:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS0yR-0008k1-2m;
	Tue, 14 Feb 2023 19:28:19 +0000
Date: Wed, 15 Feb 2023 03:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-next 121/134] fs/nfsd/nfssvc.c:366:51: warning:
 'sizeof' on array function parameter 'verf' will return size of '__be32 *'
 {aka 'unsigned int *'}
Message-ID: <202302150349.yVEGI4bO-lkp@intel.com>
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
commit: 70ade8921d66c7126104014517f1b3f7528cb69f [121/134] NFSD: copy the whole verifier in nfsd_copy_write_verifier
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230215/202302150349.yVEGI4bO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=70ade8921d66c7126104014517f1b3f7528cb69f
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton nfsd-next
        git checkout 70ade8921d66c7126104014517f1b3f7528cb69f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150349.yVEGI4bO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from fs/nfsd/nfssvc.c:10:
   fs/nfsd/nfssvc.c: In function 'nfsd_copy_write_verifier':
>> fs/nfsd/nfssvc.c:366:51: warning: 'sizeof' on array function parameter 'verf' will return size of '__be32 *' {aka 'unsigned int *'} [-Wsizeof-array-argument]
     366 |                 memcpy(verf, nn->writeverf, sizeof(verf));
         |                                                   ^
   arch/sparc/include/asm/string.h:15:48: note: in definition of macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^
   fs/nfsd/nfssvc.c:360:38: note: declared here
     360 | void nfsd_copy_write_verifier(__be32 verf[2], struct nfsd_net *nn)
         |                               ~~~~~~~^~~~~~~
>> fs/nfsd/nfssvc.c:366:51: warning: argument to 'sizeof' in '__builtin_memcpy' call is the same expression as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
     366 |                 memcpy(verf, nn->writeverf, sizeof(verf));
         |                                                   ^
   arch/sparc/include/asm/string.h:15:48: note: in definition of macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^


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
