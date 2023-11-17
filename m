Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298EA1366
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhEmjnzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700182952; x=1731718952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6llsqo5lB4zxBH9KsUUz6e3ikgoMggXcSKFr/tncPfg=;
  b=UhEmjnzjRwk7+WFFgvbKG5cQXepnAUtncJbn6cRE5MVwnInF6rVZTatn
   eYr71nUB+WScT+FEbA0nHPqRhdTkOeX2Y2B5ajz4RkAHB1xUS3kf2bxlO
   PT/4pLYdpDsnVbn+tlf89/OyWBh0+hnkDYi3I8ivkDwYs2Unl7Vw+tSow
   hBJXjeF2iaWUliQJBnXOkZnpF7WbT9Q9yYvnt/8IYg8/wKqMui4wFmfeo
   E5htMBCUnHpUVe7uKpuZnwW2H9s1zdjZkgHTPoRfFJanURRW10jAA5iJC
   I+UkEJck4QnM/tM4Zro3T92sHNYrSUXHc/0q2dOqTbwLxl19DULg8CL1G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395136324"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="395136324"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:02:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="889084809"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="889084809"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Nov 2023 17:02:30 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3nFc-0002Dt-0r;
	Fri, 17 Nov 2023 01:02:28 +0000
Date: Fri, 17 Nov 2023 09:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/3] NFSD: Replace RQ_SPLICE_OK in nfsd_read()
Message-ID: <202311170817.S8tqyh0m-lkp@intel.com>
References: <169988367779.6844.7373759612199164974.stgit@bazille.1015granger.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169988367779.6844.7373759612199164974.stgit@bazille.1015granger.net>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc1]
[cannot apply to trondmy-nfs/linux-next next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Replace-RQ_SPLICE_OK-in-nfsd_read/20231113-220401
base:   linus/master
patch link:    https://lore.kernel.org/r/169988367779.6844.7373759612199164974.stgit%40bazille.1015granger.net
patch subject: [PATCH v1 1/3] NFSD: Replace RQ_SPLICE_OK in nfsd_read()
config: i386-randconfig-003-20231117 (https://download.01.org/0day-ci/archive/20231117/202311170817.S8tqyh0m-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311170817.S8tqyh0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170817.S8tqyh0m-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/nfsd/vfs.o: in function `nfsd_read_splice_ok':
>> fs/nfsd/vfs.c:1239: undefined reference to `svcauth_gss_flavor'
>> ld: fs/nfsd/vfs.c:1239: undefined reference to `svcauth_gss_flavor'


vim +1239 fs/nfsd/vfs.c

  1219	
  1220	/**
  1221	 * nfsd_read_splice_ok - check if spliced reading is supported
  1222	 * @rqstp: RPC transaction context
  1223	 *
  1224	 * Return values:
  1225	 *   %true: nfsd_splice_read() may be used
  1226	 *   %false: nfsd_splice_read() must not be used
  1227	 *
  1228	 * NFS READ normally uses splice to send data in-place. However the
  1229	 * data in cache can change after the reply's MIC is computed but
  1230	 * before the RPC reply is sent. To prevent the client from
  1231	 * rejecting the server-computed MIC in this somewhat rare case, do
  1232	 * not use splice with the GSS integrity and privacy services.
  1233	 */
  1234	bool nfsd_read_splice_ok(struct svc_rqst *rqstp)
  1235	{
  1236		struct auth_domain *domain = rqstp->rq_gssclient;
  1237	
  1238		if (domain)
> 1239			switch (svcauth_gss_flavor(domain)) {
  1240			case RPC_AUTH_GSS_KRB5I:
  1241			case RPC_AUTH_GSS_KRB5P:
  1242				return false;
  1243			}
  1244		return true;
  1245	}
  1246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
