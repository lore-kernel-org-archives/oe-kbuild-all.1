Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F42301716
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853396; cv=none; b=Nzu7w6sIwNcN142HF3yR70xuaUqmEpBo7q3UEG8RGbgoH2bZVE9Yshs19aUORBbrDo7EhGnZHB+64cKXKNCAYaRKbpX8yyfD5h6zJEfxU92g8rvD12ENKhZkxNt/mFAUY4HgzNgl8nj17pQ2IRv57NO1FbY0IoY9adnLX7Ce7Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853396; c=relaxed/simple;
	bh=MT83huwooZ6DIMCd5QbG+wra2dmKD6ikpfqo2Lbbvtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzDKV5OxJkI8u65QQ7mSUXnJk/VdRyH2udHf/LEP/f71xeF017/phw4IeGzLVa/0b+FAnRWp3olwSLssHljRRK17R8P+iJ1qS3ghXUfJlhqeDsr8Utfvgi7eJYTrvDz6vXjBNGc7G3BAnfZ1gpiLiyYYZ73rbRN6Uum8QoGBAII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7WzyxyR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7WzyxyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761853394; x=1793389394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MT83huwooZ6DIMCd5QbG+wra2dmKD6ikpfqo2Lbbvtg=;
  b=g7WzyxyR6M8KVPg45xwDyK9QN8PZJntm1VN8NsIZYtcLRONUDfDYtiMp
   pJBYLROP8+0+DwNOuSgYmKgXPENz6UtLu/NvgQBwa30O6AMzAO2eeQrMj
   skSkCWN6CDW4GEqg/Pf/HZsA8jnQf8GxR0M8uAdhjuo0xtoyfLWSZYfpN
   wdfRUHM8PZOLh07b0g8qZ/I6MwqAwvN3gdsiwURfHWFIBnU4XrxoJqOt4
   k8xp/GKjB9A/BbAuIeVInvSdUzpTnr4OTeVaR6v/kIrZqMJihZQseCT82
   V+60FXcEv+a1Ilf5ij6+VQNDpiYi9O76r6naNuxuW+PweZFjegQ44FLTP
   g==;
X-CSE-ConnectionGUID: t5MY7VeqRLGiATOQSznaSQ==
X-CSE-MsgGUID: MvtZOABcSMi+izG6cZTF3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67844691"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67844691"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 12:43:14 -0700
X-CSE-ConnectionGUID: b3CVvgyHQJWbC3NxGM553w==
X-CSE-MsgGUID: aBUSNnsXQE2av1NWbYtsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185312361"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Oct 2025 12:43:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEYYA-000MSW-2y;
	Thu, 30 Oct 2025 19:43:10 +0000
Date: Fri, 31 Oct 2025 03:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Olga Kornievskaia <okorniev@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] NFSv4.1: protect destroying and nullifying
 bc_serv structure
Message-ID: <202510310339.u1WX0r1I-lkp@intel.com>
References: <20251027192318.86366-4-okorniev@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027192318.86366-4-okorniev@redhat.com>

Hi Olga,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olga-Kornievskaia/NFSv4-1-pass-transport-for-callback-shutdown/20251028-033212
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20251027192318.86366-4-okorniev%40redhat.com
patch subject: [RFC PATCH 3/3] NFSv4.1: protect destroying and nullifying bc_serv structure
config: m68k-bvme6000_defconfig (https://download.01.org/0day-ci/archive/20251031/202510310339.u1WX0r1I-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310339.u1WX0r1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310339.u1WX0r1I-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/callback.c: In function 'nfs_callback_down':
>> fs/nfs/callback.c:278:25: error: implicit declaration of function 'xprt_svc_destroy_nullify_bc' [-Wimplicit-function-declaration]
     278 |                         xprt_svc_destroy_nullify_bc(xprt, &cb_info->serv);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xprt_svc_destroy_nullify_bc +278 fs/nfs/callback.c

   259	
   260	/*
   261	 * Kill the callback thread if it's no longer being used.
   262	 */
   263	void nfs_callback_down(int minorversion, struct net *net, struct rpc_xprt *xprt)
   264	{
   265		struct nfs_callback_data *cb_info = &nfs_callback_info[minorversion];
   266		struct svc_serv *serv;
   267	
   268		mutex_lock(&nfs_callback_mutex);
   269		serv = cb_info->serv;
   270		nfs_callback_down_net(minorversion, serv, net);
   271		cb_info->users--;
   272		if (cb_info->users == 0) {
   273			svc_set_num_threads(serv, NULL, 0);
   274			dprintk("nfs_callback_down: service destroyed\n");
   275			if (!minorversion)
   276				svc_destroy(&cb_info->serv);
   277			else
 > 278				xprt_svc_destroy_nullify_bc(xprt, &cb_info->serv);
   279		}
   280		mutex_unlock(&nfs_callback_mutex);
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
