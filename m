Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A679D0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675892717; x=1707428717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wI+Bz3mPL88hrKgC5yUBkpfP232cChBO2KpmnMSSUZ8=;
  b=ToACfICPmnPPZNiZjk16pzIXM+jQYwSMbyElgCwNSnF8asoF+eNlSvQu
   IZmJ2DmgtH6/omhK2o3IedMxK5hdcdPUFl44urYzsV+UUAdq7nmm6PUTa
   +JrPo678ndYzi7d3HBw+7F3jgP3+VMa/TThGsoqOQOc+wgmh5q5KYqz49
   pG/JnTRPjQeX+PuzrYFa5okWrYXvIg6Ef56d9vjm7dekObPlzyatZy/Xu
   vKQ7x1AS8WSm2uVir9FwbdFRtGF7tB+GYKgZdRsTHftrSEci1JYi00G8i
   xiX0kTvWICzJrbDkQ5D3VeH8ohAL6np/t20AGn0V3EO+sVoemAyOH1Tf9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="313569876"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="313569876"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 13:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756183273"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="756183273"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2023 13:45:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPsFf-0004fM-0I;
	Wed, 08 Feb 2023 21:45:15 +0000
Date: Thu, 9 Feb 2023 05:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-next 5/5] fs/nfsd/nfssvc.c:366:21: sparse: sparse:
 cast to restricted __be32
Message-ID: <202302090506.RcejN3zH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-next
head:   fd5c4106c0d572fd57a43f62355753eb4d928a54
commit: cd17c663394d7f5367c25d68feba1ba2503be15e [5/5] nfsd: simplify write verifier handling
config: m68k-randconfig-s042-20230209 (https://download.01.org/0day-ci/archive/20230209/202302090506.RcejN3zH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=cd17c663394d7f5367c25d68feba1ba2503be15e
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton nfsd-next
        git checkout cd17c663394d7f5367c25d68feba1ba2503be15e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302090506.RcejN3zH-lkp@intel.com

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfssvc.c:366:21: sparse: sparse: cast to restricted __be32

vim +366 fs/nfsd/nfssvc.c

   351	
   352	/**
   353	 * nfsd_set_write_verifier - set the write verifier for a call
   354	 * @verf: buffer in which to receive the verifier cookie
   355	 * @nf: nfsd_file being operated on for write
   356	 *
   357	 * Grab the (static) write verifier for the nfsd_net, and then fold
   358	 * the current errseq_t value into it for the inode to create a
   359	 * write verifier.
   360	 */
   361	void nfsd_set_write_verifier(__be32 verf[2], struct nfsd_file *nf)
   362	{
   363		struct nfsd_net *nn = net_generic(nf->nf_net, nfsd_net_id);
   364	
   365		memcpy(verf, nn->writeverf, sizeof(*verf));
 > 366		verf[0] ^= (__be32)errseq_fetch(&nf->nf_file->f_mapping->wb_err);
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
