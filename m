Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3956614D28F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725092938; cv=none; b=XoNVHy57pPvnDZv9P/sN9ingyxpYl5wCehtjq79Cu2aj1ZnGrV2Det4wrSnvSzrghId29fWgGUFa7YXiZ5yEaWuE688D2yDI8A0yBHCE0Fb81GAQR8h0ACv7zCxdoIkqvxd0Umh9HCcnzRVWiq76d9kCXZzC7OOjqA96dxf4ptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725092938; c=relaxed/simple;
	bh=PMooKVe/dFs/vHDTNdD36EwKdgp+XCCIwNWbXJ9Krh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VIebuf8d184LpvOfP9pHRdpMAwJAKPU9ZQpZoQu1V47E2Ej2I4RNecSQjgX45J8NOwjeigVkZOj59HMWgr/C/5wi/2Y0YvtD8Utj7/4OYsWzLe951THXTpoARkMnBEfbcWxsa7Cfl1zH0mBUHreDm4dwhaH4zFBV4esMukCzfys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STJwq6Gl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STJwq6Gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725092937; x=1756628937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMooKVe/dFs/vHDTNdD36EwKdgp+XCCIwNWbXJ9Krh8=;
  b=STJwq6GlrqKlkWm+JE+RZXKjGJiVi0Yv8Ko4lX4J5XWdbDjWe8DclVEu
   WGCiHL8mGUJ9dRM5zoPnk5qLTBnY0Usbe5IxGgtPukqP34WkosS8ApfIa
   d/OAS/7FbskPvAn/RAN9iKIaftDk20KMS3hFSWa2kncAlx7N9r+zZDEKw
   e1tJqkLCPbfzZfIXkZa0RwPGjSrTfCHs6rMB1fNhbR48aq69cg4hsqWzX
   5KMbmpJy1XwcxoCcNXcYaKp5lw+eXsdC7s1LWuNOMRkIg9g7+nT5cTNVL
   wtoZGbT038+aOp7NDlVLCufG1VPt334EN3XsS65kLvYfD6ptWtv6L9fzW
   A==;
X-CSE-ConnectionGUID: nn5DWM1VTnaq/U9fS5kg/A==
X-CSE-MsgGUID: N+ZlyTznQ1a627Hutu5W9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23923586"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23923586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 01:28:54 -0700
X-CSE-ConnectionGUID: 9KU3pOZCTEWricE8Uk0z+A==
X-CSE-MsgGUID: ikyZokA2TJC+fEDZLNeyAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64476378"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2024 01:28:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJTV-0002Sx-2l;
	Sat, 31 Aug 2024 08:28:49 +0000
Date: Sat, 31 Aug 2024 16:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: [tj-cgroup:test 23/31] kernel/cgroup/cpuset-v1.c:163:9: error:
 implicit declaration of function 'cpus_read_lock'; did you mean
 'rcu_read_lock'?
Message-ID: <202408311612.mQTuO946-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git test
head:   a5ab7b05a3c825f23d74106f3304de7d024cff8a
commit: dd46bd00ab4c00f6126794c6b52fbc87a2c5c389 [23/31] cgroup/cpuset: move relax_domain_level to cpuset-v1.c
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408311612.mQTuO946-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311612.mQTuO946-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311612.mQTuO946-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cpuset-v1.c: In function 'cpuset_write_s64':
>> kernel/cgroup/cpuset-v1.c:163:9: error: implicit declaration of function 'cpus_read_lock'; did you mean 'rcu_read_lock'? [-Wimplicit-function-declaration]
     163 |         cpus_read_lock();
         |         ^~~~~~~~~~~~~~
         |         rcu_read_lock
>> kernel/cgroup/cpuset-v1.c:178:9: error: implicit declaration of function 'cpus_read_unlock'; did you mean 'rcu_read_unlock'? [-Wimplicit-function-declaration]
     178 |         cpus_read_unlock();
         |         ^~~~~~~~~~~~~~~~
         |         rcu_read_unlock


vim +163 kernel/cgroup/cpuset-v1.c

   155	
   156	int cpuset_write_s64(struct cgroup_subsys_state *css, struct cftype *cft,
   157				    s64 val)
   158	{
   159		struct cpuset *cs = css_cs(css);
   160		cpuset_filetype_t type = cft->private;
   161		int retval = -ENODEV;
   162	
 > 163		cpus_read_lock();
   164		cpuset_lock();
   165		if (!is_cpuset_online(cs))
   166			goto out_unlock;
   167	
   168		switch (type) {
   169		case FILE_SCHED_RELAX_DOMAIN_LEVEL:
   170			retval = update_relax_domain_level(cs, val);
   171			break;
   172		default:
   173			retval = -EINVAL;
   174			break;
   175		}
   176	out_unlock:
   177		cpuset_unlock();
 > 178		cpus_read_unlock();
   179		return retval;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
