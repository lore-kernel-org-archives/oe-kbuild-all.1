Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970437F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694631119; x=1726167119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3of/r2f6XluGSxcAYZAvQp/C0wS6LWLim6fT5ccqDx4=;
  b=T2sSu9cPMx53iQyNx6JECbvboJg9NAnCbEmRGqOJY8QhIUt2TWXoF87x
   +EytCKEbTU6RbJOUeEtOlK3lPCFvXzZKqPwvWjd7SlO3Z6DkZQcq8hlmM
   VI2a1QAU31JxI99sVBOH7eGlqL27PoKCX+TJwfPS57B/1lMGvES2kOzNs
   qn6qgfOwWKza3Kr3haxSdylUt0DsZlu6CxxeNzlStbiG4yoDlyY3lVEe+
   DhPAZaR2gKKBm3JwcWFTXt+gOukYJSgtSM47xUN0moiXHvOUEaWuY8ZZx
   pdLKbPWvHmlDQbjDiWX1IESSnQrMt7vCHb5rp/tnlDq/sj1SBY+GyEceg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363793758"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="363793758"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 11:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773584824"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="773584824"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Sep 2023 11:51:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgUxv-0000Ta-1N;
	Wed, 13 Sep 2023 18:51:55 +0000
Date: Thu, 14 Sep 2023 02:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-cleanup 7/13] lib/iov_iter.c:261:16: error:
 implicit declaration of function 'memcpy_mc'; did you mean 'memcpy'?
Message-ID: <202309140221.K2Md2qvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-cleanup
head:   bbca19708859dff75c7d28b9cb73f114497d6f60
commit: b6cd84d1413db6e972edf847ec0a5b2951d6886b [7/13] iov_iter: Make copy_from_iter() always handle MCE
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230914/202309140221.K2Md2qvB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140221.K2Md2qvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140221.K2Md2qvB-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/iov_iter.c: In function 'memcpy_from_iter_mc':
>> lib/iov_iter.c:261:16: error: implicit declaration of function 'memcpy_mc'; did you mean 'memcpy'? [-Werror=implicit-function-declaration]
     261 |         return memcpy_mc(to + progress, iter_from, len);
         |                ^~~~~~~~~
         |                memcpy
   cc1: some warnings being treated as errors


vim +261 lib/iov_iter.c

   256	
   257	static __always_inline
   258	size_t memcpy_from_iter_mc(void *iter_from, size_t progress,
   259				   size_t len, void *to, void *priv2)
   260	{
 > 261		return memcpy_mc(to + progress, iter_from, len);
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
