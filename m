Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7721367
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 04:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBAIYpCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698468432; x=1730004432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92k82x6J4Lniqqqp159JknvTQSCYf7dpTkvzRU7/gnY=;
  b=NBAIYpCppoFNUhWNM+PymGp4wyxO2T4w/fpHIBbcIGU7ynj+Mjeni59J
   jHsvvOj/M0u7EOhtYo/PQC3mHdpEQafbvl00TJp0sz7CWUoNgnObHj+Ks
   lxCELGwn+z7TjdJpBmjfGQ8iCyfiW+XhYlrccAG3si6LzDEpCZk+3KM1X
   7t8sTnM6/DVZRtkYD1Ux3ABpr4pPYwkcEEgRPZIecmsR/7y1eICezIUkS
   k9RRQ0+vqrl51vX7Pu54vLkN01uNIahswuhPbq/t372dIYCiTGE4IqaM1
   hzvBKR5ibNsdEA/clSqPx+GvgCrMMrrfAcILOM3YbHQTmp9TeoV8PvKmp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="391747083"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="391747083"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 21:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="759790788"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="759790788"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Oct 2023 21:47:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwbE3-000BUP-2d;
	Sat, 28 Oct 2023 04:47:07 +0000
Date: Sat, 28 Oct 2023 12:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 2/2] fs/nfsd/nfssvc.c:806:17: warning: variable
 'nfsd_up_before' set but not used
Message-ID: <202310281246.XChwGFVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   4a8ae3fade19da9ea06ad754d46c24559799c21d
commit: 4a8ae3fade19da9ea06ad754d46c24559799c21d [2/2] nfsd: ensure the nfsd_serv pointer is cleared when svc is torn down
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310281246.XChwGFVh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281246.XChwGFVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281246.XChwGFVh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfssvc.c: In function 'nfsd_svc':
>> fs/nfsd/nfssvc.c:806:17: warning: variable 'nfsd_up_before' set but not used [-Wunused-but-set-variable]
     806 |         bool    nfsd_up_before;
         |                 ^~~~~~~~~~~~~~


vim +/nfsd_up_before +806 fs/nfsd/nfssvc.c

eed2965af1bae3 Greg Banks           2006-10-02  796  
ac77efbe2b4d2a Jeff Layton          2010-07-20  797  /*
ac77efbe2b4d2a Jeff Layton          2010-07-20  798   * Adjust the number of threads and return the new number of threads.
ac77efbe2b4d2a Jeff Layton          2010-07-20  799   * This is also the function that starts the server if necessary, if
ac77efbe2b4d2a Jeff Layton          2010-07-20  800   * this is the first time nrservs is nonzero.
ac77efbe2b4d2a Jeff Layton          2010-07-20  801   */
^1da177e4c3f41 Linus Torvalds       2005-04-16  802  int
4df493a260d4c1 Trond Myklebust      2019-04-09  803  nfsd_svc(int nrservs, struct net *net, const struct cred *cred)
^1da177e4c3f41 Linus Torvalds       2005-04-16  804  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  805  	int	error;
774f8bbd9ef2e7 J. Bruce Fields      2010-08-02 @806  	bool	nfsd_up_before;
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  807  	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
9f28a971ee9fdf NeilBrown            2023-07-31  808  	struct svc_serv *serv;
^1da177e4c3f41 Linus Torvalds       2005-04-16  809  
bedbdd8bada194 Neil Brown           2008-06-10  810  	mutex_lock(&nfsd_mutex);
6658d3a7bbfd17 NeilBrown            2006-10-02  811  	dprintk("nfsd: creating service\n");
3c7aa15d2073d8 Kinglong Mee         2014-06-10  812  
3c7aa15d2073d8 Kinglong Mee         2014-06-10  813  	nrservs = max(nrservs, 0);
3c7aa15d2073d8 Kinglong Mee         2014-06-10  814  	nrservs = min(nrservs, NFSD_MAXSERVS);
671e1fcf63fd11 NeilBrown            2009-06-16  815  	error = 0;
3c7aa15d2073d8 Kinglong Mee         2014-06-10  816  
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  817  	if (nrservs == 0 && nn->nfsd_serv == NULL)
671e1fcf63fd11 NeilBrown            2009-06-16  818  		goto out;
^1da177e4c3f41 Linus Torvalds       2005-04-16  819  
72f78ae00a8e5d Wolfram Sang         2022-08-18  820  	strscpy(nn->nfsd_name, utsname()->nodename,
7627d7dc79a8ed Scott Mayhew         2020-02-19  821  		sizeof(nn->nfsd_name));
7627d7dc79a8ed Scott Mayhew         2020-02-19  822  
6777436b0f072f Stanislav Kinsbursky 2012-12-10  823  	error = nfsd_create_serv(net);
29ab23cc5d3516 J. Bruce Fields      2009-09-15  824  	if (error)
29ab23cc5d3516 J. Bruce Fields      2009-09-15  825  		goto out;
774f8bbd9ef2e7 J. Bruce Fields      2010-08-02  826  
903d9bf0edebc9 Stanislav Kinsbursky 2012-12-06  827  	nfsd_up_before = nn->nfsd_net_up;
9f28a971ee9fdf NeilBrown            2023-07-31  828  	serv = nn->nfsd_serv;
774f8bbd9ef2e7 J. Bruce Fields      2010-08-02  829  
70c5307564035c Vasily Averin        2021-04-15  830  	error = nfsd_startup_net(net, cred);
02a375f0ac4bc2 NeilBrown            2006-10-02  831  	if (error)
8c62d12740a145 NeilBrown            2021-11-29  832  		goto out_put;
9f28a971ee9fdf NeilBrown            2023-07-31  833  	error = svc_set_num_threads(serv, NULL, nrservs);
4a8ae3fade19da Jeff Layton          2023-10-26  834  	if (!error)
9f28a971ee9fdf NeilBrown            2023-07-31  835  		error = serv->sv_nrthreads;
8c62d12740a145 NeilBrown            2021-11-29  836  out_put:
ec52361df99b49 NeilBrown            2021-11-29  837  	/* Threads now hold service active */
ec52361df99b49 NeilBrown            2021-11-29  838  	if (xchg(&nn->keep_active, 0))
4a8ae3fade19da Jeff Layton          2023-10-26  839  		nfsd_put(net);
4a8ae3fade19da Jeff Layton          2023-10-26  840  	nfsd_put(net);
^1da177e4c3f41 Linus Torvalds       2005-04-16  841  out:
bedbdd8bada194 Neil Brown           2008-06-10  842  	mutex_unlock(&nfsd_mutex);
^1da177e4c3f41 Linus Torvalds       2005-04-16  843  	return error;
^1da177e4c3f41 Linus Torvalds       2005-04-16  844  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  845  

:::::: The code at line 806 was first introduced by commit
:::::: 774f8bbd9ef2e71d4ef4b89933d292091d31ca98 nfsd: fix startup/shutdown order bug

:::::: TO: J. Bruce Fields <bfields@redhat.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
