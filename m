Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBA81A9FA4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027881; cv=none; b=bT844XpZKHfppa9Ux7qol/Di4z86IXiAXidSIvSHhMMZ3swsRYPvZfo/i91W1dvxorm2/5j5/sTarTxy5CH7/KCTUAPF4F5d35fXF5dlptVap9h/OWCDN5uN/3RZm/x6Kc5gRdPGZHQNq943667JR3uk22t1TKLjFjEJ9a5CxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027881; c=relaxed/simple;
	bh=gOw6ZS4Y8veWm7qCJ6d5UZqJJYpw/QS8hfaHAh5U9nM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WoonrfCWJ7KX6M/Islf6kyBFlHwbGcv3rJfQ/0eo6QRPUdmhnrj0C5tGzU9YQqK76+LKfDW0JBC2xNgMjNDzZq746OQg9qQfJEs/UNUy5kFF8XYWnNUy8ELrM4IXpD42ql5mkcMK1GZW6oVQtPs6mmDRj0nc6AhO/wDTq8WXYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/lOQZ24; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/lOQZ24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760027880; x=1791563880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gOw6ZS4Y8veWm7qCJ6d5UZqJJYpw/QS8hfaHAh5U9nM=;
  b=f/lOQZ24k1xW9qKV9fpeOR1Y9ptxvMdZKfkPa42pmNK/HHMWdMaUUd9e
   WQTVRc/8JMCjbhfXJEFhtxXKVgDFMosIh9j8SCwPnUu5DCbiVVltzkeTu
   oetxNshDV38hAXKEpCGdH1QlvczuJRa4YDVtc4LVltyFdnRmFRzmCcynx
   SMVOWRD7vLeTxLOYmT86Djzmw+zdJqPcIwHOHdlMVw+geBIaLl5N6fO62
   RXEcZ99MgarwqATXth4gJQtzYmlGPYJeqerTTyli9QlWUklN0Z0CiIy93
   c8nCzSADO5iTAbebOqcYxKf2ZkfSP8n+/n1XSBYc2SKcMOSs6Woan69Co
   w==;
X-CSE-ConnectionGUID: VklhE9uRRtu0GuKggj/B2Q==
X-CSE-MsgGUID: KJFr+T1gSM2F88VYaJOSWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="65893384"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="65893384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:38:00 -0700
X-CSE-ConnectionGUID: 28bcX2whSgSpmhxdJig8Yg==
X-CSE-MsgGUID: NzksbJC8Rui/GRxtReKDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211408313"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 09:37:58 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6teN-000116-2l;
	Thu, 09 Oct 2025 16:37:55 +0000
Date: Fri, 10 Oct 2025 00:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:always-kfence 1/1] mm/slub.c:4207:10: warning: returning
 'int' from a function with return type 'void *' makes pointer from integer
 without a cast
Message-ID: <202510100018.gn5rIx9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git always-kfence
head:   90a1fd620f839dfd87e82ec5482b27e364b1b5b9
commit: 90a1fd620f839dfd87e82ec5482b27e364b1b5b9 [1/1] mm: add a way to always do a kfence allocation in a slabcache
config: riscv-randconfig-001-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100018.gn5rIx9v-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100018.gn5rIx9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100018.gn5rIx9v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c: In function 'slab_kfence_alloc':
   mm/slub.c:4207:10: error: implicit declaration of function '__kfence_alloc'; did you mean 'kfence_alloc'? [-Werror=implicit-function-declaration]
      return __kfence_alloc(s, orig_size, gfpflags);
             ^~~~~~~~~~~~~~
             kfence_alloc
>> mm/slub.c:4207:10: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
      return __kfence_alloc(s, orig_size, gfpflags);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +4207 mm/slub.c

  4203	
  4204	static void *slab_kfence_alloc(struct kmem_cache *s, size_t orig_size, gfp_t gfpflags)
  4205	{
  4206		if (s->flags & SLAB_ALWAYS_KFENCE)
> 4207			return __kfence_alloc(s, orig_size, gfpflags);
  4208		return kfence_alloc(s, orig_size, gfpflags);
  4209	}
  4210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
