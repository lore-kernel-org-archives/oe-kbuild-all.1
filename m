Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E312A1CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731593402; cv=none; b=f2OkdZRfxVKkGeRaOlaeowWteRehTkO9XFXtpubeW6KyNqgACbR5Z39If+ZKivCqbgobl6zPJQ/Ar2B/h6waUBBxkXtw8qYCIiWostK7CC3TMe5lSnBAu95WbysvFdiffzKe7ZeTVy7iGuYwDGloxoXHfE4ToZryO5iODtiNMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731593402; c=relaxed/simple;
	bh=AK482gybuMrmeTh4RN4J77hxcISsrDwZmGWYTaXNCfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3uCGE2i/T4TFDou8P2Zcl6EjgVt0oLp5pD/YxhvNM2+LavY9xxBIPil0+Q+Kjp1JThaf45q8YdC1T9AzqoAKas4SbF4OYtfP6gWD7FJBokAj2hsPz7rhlWkcTHCuqmXTP3dddb5C9Le0WhTtJGzgqdSVCaYdrg82+SfNI9zVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDoUK9UF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDoUK9UF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731593401; x=1763129401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AK482gybuMrmeTh4RN4J77hxcISsrDwZmGWYTaXNCfg=;
  b=nDoUK9UF/hZAaBA/b34rhsX71rggHvsJ25Pa1xVyeL6fBRe+3eMrf/vN
   u8n4dvI29c8KJVTcEntqzlGGUeosot4/ohJZIqLmEB+4DclQ5ZBXeXMmA
   oqkUbiz8DFEzIS0Wx31DK+MIN8TdxY/dbmQC3i/Nu8oFFUbuR8FJu+wLt
   RMqjzknKURdGmduoeGqbSwXRqEjtMHu7CZ9zlZOhapBCNm1x+n9YQfGQl
   Hd5NB4R/DiuuddtjXD9Yt2dZOy/x1HC1927wbZl3WFUBw1nxl63jPGMJi
   qCxP2JOnNodoCIc6jj5f2BYegu6vuZJmisgG5i/+z9nNYT60+2YkNxP9z
   w==;
X-CSE-ConnectionGUID: NOYlBPzeQHuM5h4WXcl5rQ==
X-CSE-MsgGUID: Ba6HwQoqQguMb0135Wq/vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49058500"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="49058500"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 06:10:00 -0800
X-CSE-ConnectionGUID: zgznjMSjQV6I0EnBynT4jQ==
X-CSE-MsgGUID: mt477hI0RF+Su8iro2YseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="111515653"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Nov 2024 06:10:00 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBaXl-000051-1a;
	Thu, 14 Nov 2024 14:09:57 +0000
Date: Thu, 14 Nov 2024 22:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 29/31] fs/nfs/client.c:246:9: error:
 implicit declaration of function 'nfs_localio_disable_client'; did you mean
 'nfs_localio_file_init'?
Message-ID: <202411142248.UXoYZhuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   cfedadbf2d21c1e63694d79b40d00573aa80af75
commit: 528d24b1cf5cfdcbb711a1d5de98f94930527ecc [29/31] nfs/localio: remove redundant code and simplify LOCALIO enablement
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241114/202411142248.UXoYZhuB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411142248.UXoYZhuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411142248.UXoYZhuB-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/client.c: In function 'nfs_free_client':
>> fs/nfs/client.c:246:9: error: implicit declaration of function 'nfs_localio_disable_client'; did you mean 'nfs_localio_file_init'? [-Werror=implicit-function-declaration]
     246 |         nfs_localio_disable_client(clp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         nfs_localio_file_init
   cc1: some warnings being treated as errors


vim +246 fs/nfs/client.c

   240	
   241	/*
   242	 * Destroy a shared client record
   243	 */
   244	void nfs_free_client(struct nfs_client *clp)
   245	{
 > 246		nfs_localio_disable_client(clp);
   247	
   248		/* -EIO all pending I/O */
   249		if (!IS_ERR(clp->cl_rpcclient))
   250			rpc_shutdown_client(clp->cl_rpcclient);
   251	
   252		put_net(clp->cl_net);
   253		put_nfs_version(clp->cl_nfs_mod);
   254		kfree(clp->cl_hostname);
   255		kfree(clp->cl_acceptor);
   256		kfree_rcu(clp, rcu);
   257	}
   258	EXPORT_SYMBOL_GPL(nfs_free_client);
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
