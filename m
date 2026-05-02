Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA42C21C7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777739972; cv=none; b=FGcO/nAtfKjyFnMlxiqz2o9m64mGhHxXZ9N9P11lKrbSrieAGXKkR0+5grtVYZu1bH4LbOjnaQShlZPHYwfvP0mCThoBUi0CJcBKWGvNrX1jjBoJ2w6KycSdnhnsKqPPsV8ZJwlcYtQQOzxQJ2HLuD6As554jicGb9MchzhuoGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777739972; c=relaxed/simple;
	bh=aAGplT5rF4sBzOrb3d/fXHgD2gCLEXJPwkUnRtuRb9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QlMsnomjROtL4N0lpzd+fQIZdJabUCOjVEYl6orhq8Elz74C2fo/LoaMd8GIJTAZ0RiO1TDMx1jLiVqefTWxfUaz+CZTApVPC/FbbHZBiMsn5HjVt6TbUa3xUgbEz5a39k13FCGh3WfUg9eI1dSCaB+Sk36yDndEkoZtGe2bcBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc+Ajqko; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc+Ajqko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777739969; x=1809275969;
  h=date:from:to:cc:subject:message-id;
  bh=aAGplT5rF4sBzOrb3d/fXHgD2gCLEXJPwkUnRtuRb9g=;
  b=Xc+Ajqko7DjW3VoQEUP+pV6IzmCVBVAmmm6jxbkEm5lGpR4teH6zAmZ+
   ugcWMZlIpJIQHsdj311iMoA/vnJEk9qwzduD6z8IN3HJzVhG94nEe7z1l
   qyXVHejJvWE3mANF4sZdCb/oqX7tYW332H4tmwPaqofTMbZG6Yd5z8qZJ
   tcSZJTczHkJw2WSCvpfeet3ExlSHzKFpYjp/5stThtpyy2DAZxLKYc4Jy
   q0yWhVlHLRsaobmkFb/cVb9w1p5DnD+7aYQL/ECS4ykAffCQq+Sa8SYqT
   3NMYbIqH8mrAYAvJUqTcj0HJMPvNNwwFlizT0FJdmx8fFreQnQ4rUYiqt
   A==;
X-CSE-ConnectionGUID: 8aNcJJhwRB2CdySCwm1OdQ==
X-CSE-MsgGUID: tyloMv8lR322s8AHJxARtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82522353"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="82522353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 09:39:28 -0700
X-CSE-ConnectionGUID: K2k8RDTFQquadC5B0kaUCg==
X-CSE-MsgGUID: 9c6e0wqYT1GXNtuVhEASyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="232478141"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 May 2026 09:39:26 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJDND-000000001ab-1VlY;
	Sat, 02 May 2026 16:39:23 +0000
Date: Sun, 03 May 2026 00:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: net/ipv4/ipmr.c:312:24: sparse: sparse: incompatible types
 in comparison expression (different address spaces):
Message-ID: <202605030032.glNApko7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: b3b6babf47517fde6b6de2493dea28e8831b9347 ipmr: Free mr_table after RCU grace period.
date:   5 days ago
config: nios2-randconfig-r132-20260502 (https://download.01.org/0day-ci/archive/20260503/202605030032.glNApko7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030032.glNApko7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b3b6babf4751 ("ipmr: Free mr_table after RCU grace period.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030032.glNApko7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/ipmr.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
>> net/ipv4/ipmr.c:312:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv4/ipmr.c:312:24: sparse:    struct mr_table [noderef] __rcu *
   net/ipv4/ipmr.c:312:24: sparse:    struct mr_table *
   net/ipv4/ipmr.c:318:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv4/ipmr.c:318:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv4/ipmr.c:318:16: sparse:    struct mr_table *
   net/ipv4/ipmr.c:318:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv4/ipmr.c:318:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv4/ipmr.c:318:16: sparse:    struct mr_table *
   net/ipv4/ipmr.c:329:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv4/ipmr.c:329:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv4/ipmr.c:329:16: sparse:    struct mr_table *
   net/ipv4/ipmr.c:343:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv4/ipmr.c:343:9: sparse:    struct mr_table [noderef] __rcu *
   net/ipv4/ipmr.c:343:9: sparse:    struct mr_table *
   net/ipv4/ipmr.c:354:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv4/ipmr.c:354:32: sparse:    struct mr_table [noderef] __rcu *
   net/ipv4/ipmr.c:354:32: sparse:    struct mr_table *
   net/ipv4/ipmr.c:356:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv4/ipmr.c:356:9: sparse:    struct mr_table [noderef] __rcu *
   net/ipv4/ipmr.c:356:9: sparse:    struct mr_table *
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +312 net/ipv4/ipmr.c

   301	
   302	bool ipmr_rule_default(const struct fib_rule *rule)
   303	{
   304		return fib_rule_matchall(rule) && rule->table == RT_TABLE_DEFAULT;
   305	}
   306	EXPORT_SYMBOL(ipmr_rule_default);
   307	#else
   308	static struct mr_table *ipmr_mr_table_iter(struct net *net,
   309						   struct mr_table *mrt)
   310	{
   311		if (!mrt)
 > 312			return rcu_dereference(net->ipv4.mrt);
   313		return NULL;
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
