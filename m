Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EE740BE5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725730689; cv=none; b=Zve4Foj+qNwbV/bGfEOcKtxtX1d0ydJbYX9khQN+29GEFcGbtPOSzDgznkLfCTGhs+N1zJhJjMwZh0yfeN2hZ8nFTS/sFJn9sluOVi1gxhoDVQ1sUjxHBGVsDj9yMaAfOHqi3zTGXdEMYM1czL4RGqPQxDT3FSHqHkyIR7bhZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725730689; c=relaxed/simple;
	bh=AyswbdD/zs3FkywWv2OXstVsrZ30wFrG3yDa8z+5TNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEJ10eEJiN1V8vtES4odNKyyE1bp9Osz/9j8769AbX99N3KvZ/pv2FRev6HQaN3JGKo8jCEzpAIePfzmWbFoWxrUc1jBygY46lueLVOQ4EzdbHjhOUJVAlMGGVstZfYQ0JDZa/s3vNAbw5CLLF66BLR7AKNjsqMzPBtCNxMPrds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCiIsQgd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCiIsQgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725730688; x=1757266688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AyswbdD/zs3FkywWv2OXstVsrZ30wFrG3yDa8z+5TNI=;
  b=MCiIsQgd1U3xOl1eCTPtmJ2qySKLIl7ObyFZX+TdRBxvo4yT8NyIjcxq
   OfSIneREBhoPs1QiVkyNiNnORx8nYWCUrUAB8jzyw8uhIeLd0YEzetdDK
   OtCQdd/wv73vHxQntay0AeOuqEVi8RRPTnZP/yXg0K1K6WrX+bjIOeT4B
   b3H7jvxEt5cHemNefQZXYkN138lA32Lh5dNOieff53LruKPz9mTfW7foV
   axAcn8xapi1LlqCWSv+M4+e8wMvM1/aqp8sIsqD10D430OpVlsbyjKszX
   4sLil7FXUj4wxvJoNkH0IX4BoDrW+eNaTbbAbtZGyIr5pkimWxoi/33Cy
   w==;
X-CSE-ConnectionGUID: PEWvkm3pSs+T2JFZL7WbrA==
X-CSE-MsgGUID: MaLqzJrJSoyrCjTYre0xsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24265635"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24265635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:38:05 -0700
X-CSE-ConnectionGUID: ZCr2FD6yS9KXe7T2Loq3dQ==
X-CSE-MsgGUID: SM2sol7iRm6Br+10Ag3iXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66788057"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Sep 2024 10:38:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smzNp-000Cn7-23;
	Sat, 07 Sep 2024 17:38:01 +0000
Date: Sun, 8 Sep 2024 01:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-vfs:vfs.mgtime 10/10] fs/attr.c:294:32: error: 'ATTR_DELEG'
 undeclared; did you mean 'ATTR_FILE'?
Message-ID: <202409080139.fyLM4sEa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mgtime
head:   b0d5ea249d885320bae0b58744f78cdb5277a268
commit: b0d5ea249d885320bae0b58744f78cdb5277a268 [10/10] fs: handle delegated timestamps in setattr_copy_mgtime
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240908/202409080139.fyLM4sEa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080139.fyLM4sEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080139.fyLM4sEa-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/attr.c: In function 'setattr_copy_mgtime':
>> fs/attr.c:294:32: error: 'ATTR_DELEG' undeclared (first use in this function); did you mean 'ATTR_FILE'?
     294 |                 if (ia_valid & ATTR_DELEG)
         |                                ^~~~~~~~~~
         |                                ATTR_FILE
   fs/attr.c:294:32: note: each undeclared identifier is reported only once for each function it appears in
   fs/attr.c: In function 'setattr_copy':
   fs/attr.c:362:32: error: 'ATTR_DELEG' undeclared (first use in this function); did you mean 'ATTR_FILE'?
     362 |                 if (ia_valid & ATTR_DELEG)
         |                                ^~~~~~~~~~
         |                                ATTR_FILE


vim +294 fs/attr.c

   273	
   274	/**
   275	 * setattr_copy_mgtime - update timestamps for mgtime inodes
   276	 * @inode: inode timestamps to be updated
   277	 * @attr: attrs for the update
   278	 *
   279	 * With multigrain timestamps, we need to take more care to prevent races
   280	 * when updating the ctime. Always update the ctime to the very latest
   281	 * using the standard mechanism, and use that to populate the atime and
   282	 * mtime appropriately (unless we're setting those to specific values).
   283	 */
   284	static void setattr_copy_mgtime(struct inode *inode, const struct iattr *attr)
   285	{
   286		unsigned int ia_valid = attr->ia_valid;
   287		struct timespec64 now;
   288	
   289		if (ia_valid & ATTR_CTIME) {
   290			/*
   291			 * In the case of an update for a write delegation, we must respect
   292			 * the value in ia_ctime and not use the current time.
   293			 */
 > 294			if (ia_valid & ATTR_DELEG)
   295				now = inode_set_ctime_deleg(inode, attr->ia_ctime);
   296			else
   297				now = inode_set_ctime_current(inode);
   298		} else {
   299			/* If ATTR_CTIME isn't set, then ATTR_MTIME shouldn't be either. */
   300			WARN_ON_ONCE(ia_valid & ATTR_MTIME);
   301		}
   302	
   303		if (ia_valid & ATTR_ATIME_SET)
   304			inode_set_atime_to_ts(inode, attr->ia_atime);
   305		else if (ia_valid & ATTR_ATIME)
   306			inode_set_atime_to_ts(inode, now);
   307	
   308		if (ia_valid & ATTR_MTIME_SET)
   309			inode_set_mtime_to_ts(inode, attr->ia_mtime);
   310		else if (ia_valid & ATTR_MTIME)
   311			inode_set_mtime_to_ts(inode, now);
   312	}
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
