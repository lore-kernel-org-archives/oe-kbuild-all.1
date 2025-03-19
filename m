Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C112624EF6A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742359512; cv=none; b=N6RRloIe51gkcktMIEbg8weckZE8m4SyyU4HTYQuYY0J5PgSHS7gF4alQsH7+qZGSZ8Wf8OH8y3LDySbhdRwZ6DiD+z7+wbS5Te7bZRmP73VdC6iUGOFXCLJsmBKPV5MG5BVfMIs6tuJE80zAGpTDBqaF+7wByyIPm14SOLTTNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742359512; c=relaxed/simple;
	bh=0E0nHWDYPvBk0+XssR2GhdF+g0GPKHFjVgcPWFRcx8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OInaWdCuvFJ8/kb4AbtFof1UXt6uWjCllWBcw2pYxgzSfdbAn+dhsYSBgP/M+4KIEBh9f5o+jRnIGWInzs1Cgzq3Ww4isa4YiYSbVv4hMX+ReA49/eWoVAnVLalULbqjf2LMOwrPnE+abxr294icWCP0mt24FraNLjq1ZIYDRfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAy6e9Nr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAy6e9Nr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742359511; x=1773895511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0E0nHWDYPvBk0+XssR2GhdF+g0GPKHFjVgcPWFRcx8s=;
  b=IAy6e9NrC2dNBsV76rBi4taX0S5lc1pKDkEAmhGROE/EYcRso2P7p1jp
   F04Xvi3wRyF94dYnhWyOBzlhH8PgXHtZu662vfrIWbAqL8adYhlpDI/k2
   cA/p5XKpWNHwn8keTRV/980W5n5GSEEWf7Bpx+S9et3sBUKRTRLa5C7wm
   J0mcl0TSgW8EwPxQqLEwZFUH5RZVd1LvNwNejbnoGmeH6L4MD3gRYLiI6
   dyFwwyM3m6XM6z8e5CkG1KvM9CJQnIiPOvpR6HS0HNMg7rNYZosaQck6C
   qxn4YrgrGDiG1R4CbRqbUdesgumvs/nsaxhN4f+/HOfHDeqtbzS04cPJ4
   g==;
X-CSE-ConnectionGUID: n6dfGJ4NTyCUJCSQ4QdutA==
X-CSE-MsgGUID: ywSrDBc4RlOCj0l7GeX46A==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="68883845"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="68883845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 21:45:09 -0700
X-CSE-ConnectionGUID: nlPX4K+JSIKJSTfUcyA17Q==
X-CSE-MsgGUID: wDaYYqFqRNe6Qqh5eerAAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122485625"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2025 21:45:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tulIL-000EMY-2q;
	Wed, 19 Mar 2025 04:44:45 +0000
Date: Wed, 19 Mar 2025 12:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 62/65] lib/dynamic_debug.c:1622:2-7: WARNING: NULL check
 before some freeing functions is not needed.
Message-ID: <202503191238.Gddizqoi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   ad63ebc0b5699b5e64f4f96e8c56cf6e8353f6dc
commit: 5494e3f674b07ae1e2acfddfa1ca44713750a6d1 [62/65] dyndbg: RFC ddebug_squeeze_codeorg() and struct _ddebug_codetree
config: arm-randconfig-r052-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191238.Gddizqoi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191238.Gddizqoi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:1622:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +1622 lib/dynamic_debug.c

  1617	
  1618	static void ddebug_table_free(struct ddebug_table *dt)
  1619	{
  1620		list_del_init(&dt->link);
  1621		if (dt->info.tree)
> 1622			kfree(dt->info.tree);
  1623		kfree(dt);
  1624	}
  1625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
