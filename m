Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724827F198
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364101; cv=none; b=GC/aecIbT4zYoSJuu4Ea3p2D6FLdla1yeMeN4Z+LIO4bnH4KNfeRIZRlrQyIDiQW3g96POv0wgqa6U3AucehD5w+DNs5D4++eGt5AL9jnNR1jaJi3o1PsIpOvGXO1AYBxVsNsbBDzO7yaK+QLKse6LDlhjs+cNr9pOZjSXKopOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364101; c=relaxed/simple;
	bh=Te2K4MLbSboonILFErtX6EvuVIbSQWDoGbAbm/MvvN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jW2MiszGvayb/HTPbFMx4/MwjkfI8xfI7gfDfTkj4TmcnYQu/aXTrUcQ2Dd2hB89bNZwDmLU8X1uC2/lqO42JpMIH3oOA5Hms0tvotCehHrZjc25qGEkbwHmmNekK6DzurtYJCcGHLPs4S+B1+B9C4kBASwqOEi+ioKKkX/UbmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGGPaRBv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGGPaRBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364100; x=1779900100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Te2K4MLbSboonILFErtX6EvuVIbSQWDoGbAbm/MvvN8=;
  b=EGGPaRBvJnbapfRu+k6EebyAFU2VFfBcnZZPUxy17bdNevQKTOiX8euf
   HLXdac25vE8me6aZRur0UgHgDWRZRwHUy9g8QP2bHHxQnxdGPrGjgbDjN
   a8HTctcxDF3d8aTQA+ZKNqwwqynfCv/wSXkBupHs6ormpjk179P3jy+d+
   4hjm0GD+nkc2k3szA54oEKZMUPuIBa3jvzkpI9An8hvcmejWAs/OcrYCn
   hOHp8FcImVB9o/nbYBPxqe8zocrBNQ81zX79cEh22FzkBCwVgmcNtZZ9m
   idvdhttrx0K+cIK0/lyqlAKfobF1npmemE3u3tZ+Kwkcrt+85xgrvKrE9
   w==;
X-CSE-ConnectionGUID: Jt6LN1/8Rn+TWSE2/g47ww==
X-CSE-MsgGUID: la2OnWxtQoibUWxhb9kmxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="75753528"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="75753528"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:41:38 -0700
X-CSE-ConnectionGUID: KmlLoZcUTm2fYYrfsbtfyw==
X-CSE-MsgGUID: srJ8aODbROue3mOFAfHaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="148028418"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2025 09:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxMs-000TLz-2V;
	Tue, 27 May 2025 16:41:34 +0000
Date: Wed, 28 May 2025 00:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.coredump.socket.protocol 9/13]
 fs/coredump.c:690:12: warning: 'coredump_request' defined but not used
Message-ID: <202505280036.xjAhNgLi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.coredump.socket.protocol
head:   cb5f73bef28a0477715f449b2ceb17e77a1b640a
commit: 9ce83f52a131f8806989e05df19215c433c8e7c8 [9/13] coredump: allow better parameter control
config: csky-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280036.xjAhNgLi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280036.xjAhNgLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280036.xjAhNgLi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/coredump.c:690:12: warning: 'coredump_request' defined but not used [-Wunused-function]
     690 | static int coredump_request(struct core_name *cn, struct coredump_params *cprm)
         |            ^~~~~~~~~~~~~~~~


vim +/coredump_request +690 fs/coredump.c

   689	
 > 690	static int coredump_request(struct core_name *cn, struct coredump_params *cprm)
   691	{
   692		struct coredump_req req = {
   693			.size		= sizeof(struct coredump_req),
   694			.mask		= COREDUMP_KERNEL | COREDUMP_USERSPACE |
   695					  COREDUMP_REJECT | COREDUMP_WAIT,
   696			.size_ack	= sizeof(struct coredump_ack),
   697		};
   698		struct coredump_ack ack = {};
   699		ssize_t ret, usize;
   700	
   701		if (cn->core_type != COREDUMP_SOCK_REQ)
   702			return 0;
   703	
   704		/* Let userspace know what we support. */
   705		ret = coredump_sock_send(cprm->file, &req);
   706		if (ret)
   707			return ret;
   708	
   709		/*
   710		 * Peek the size of the coredump_ack struct that userspace
   711		 * wants to send us and then retrieve it all in one go.
   712		 */
   713		ret = coredump_sock_recv(cprm->file, &ack, sizeof(ack.size),
   714					 MSG_PEEK | MSG_WAITALL);
   715		if (ret)
   716			return ret;
   717	
   718		/*
   719		 * We told userspace what size we know about.
   720		 * So refuse anything too small or larger than we know.
   721		 */
   722		usize = ack.size;
   723		if (usize < COREDUMP_ACK_SIZE_VER0 || usize > sizeof(ack)) {
   724			coredump_sock_oob(cprm->file, COREDUMP_OOB_INVALIDSIZE);
   725			return -EINVAL;
   726		}
   727	
   728		/* Now retrieve the coredump_ack. */
   729		ret = coredump_sock_recv(cprm->file, &ack, usize, MSG_WAITALL);
   730		if (ret)
   731			return ret;
   732		if (ack.size != usize)
   733			return -EINVAL;
   734	
   735		/*
   736		 * We told userspace what flags we support.
   737		 * So refuse any flags we don't know.
   738		 */
   739		if (ack.mask & ~req.mask) {
   740			coredump_sock_oob(cprm->file, COREDUMP_OOB_UNSUPPORTED);
   741			return -EINVAL;
   742		}
   743	
   744		/* Handle mutually exclusive options. */
   745		if (hweight64(ack.mask & (COREDUMP_USERSPACE | COREDUMP_KERNEL |
   746					  COREDUMP_REJECT)) != 1) {
   747			coredump_sock_oob(cprm->file, COREDUMP_OOB_CONFLICTING);
   748			return -EINVAL;
   749		}
   750	
   751		cn->mask = ack.mask;
   752		return 0;
   753	}
   754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
