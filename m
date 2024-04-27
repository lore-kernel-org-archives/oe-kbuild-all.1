Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEA510E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 18:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714242352; cv=none; b=ofN4DRWq/mJzkHdfLLi6h9sAFdvFUXCIamaoKbQjIIl/rL6fCtyZ2nIgjtp6ZpTHjxLOZs9PqRHV2f4iJYfTj/Mno6Vaf2e99dgZIIaGeTUYmI+FlktNYgupu2McgdDtgnLQ7Yda4+Jvs/VW/1ocEWuGlkm+bGC5VisrYxC6i7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714242352; c=relaxed/simple;
	bh=Q6awMkKDj8u8LedbxNQzPh2B0gJ2TutLvWezPojpBSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dS9SCoJyqOwNpFgf9Fu6AbsiSBpEbShuxW9MiOucn2JHtf1Wu4hR8jSjEODZe2TmGR+KxzZdpCIMaQpMDUN3H0Bnw5YGfyM3q+RsFmBdgcgDKuYu1WLCfF0n0Fq6zauJDbUKcHVzWMLzx3GRL+pwh8cqJQV8ADthNXDRmWRAPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nowaThuw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nowaThuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714242350; x=1745778350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6awMkKDj8u8LedbxNQzPh2B0gJ2TutLvWezPojpBSY=;
  b=nowaThuwlB6jvW0VUvRNk5hzKr/pCJcQV+K9u6V3jP4mzm8MPe5fKahj
   kk4hbj9zfQCQ+t8FXHxyJsUCulXfedDJ0am6zKz6tjEP4D/8GFPlO6/ae
   Wq8298uxGpikI35cJY3Kw1Li8vQfu//bJpz0H5jCRivi+aURVShtYlaXi
   e4FfB8nyYNyfDEa2tsAz09FM6DeaaDaCjS0qlDCdPzCsFiN4Vwsd6jbkt
   9XtOzQvrYEpknKepCHI9lofvWvataUS+fOM+Mv6WA9DTUvEDmJi56KDX4
   41lv8MpIw3Od9qjq6A/N8dMHk2mX+ezhncE7qEdVqEPNikWe0qQMJ3Gll
   w==;
X-CSE-ConnectionGUID: z4zr4wxtThKe/HVc+sICYw==
X-CSE-MsgGUID: cQfkp5ljSfmxaoK+LYvBRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20641926"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="20641926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 11:25:49 -0700
X-CSE-ConnectionGUID: 4oYwNnP+Sa+vqJ5oUF6JRQ==
X-CSE-MsgGUID: w0SWnSQgRSmuZt0ckPpP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="30522803"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Apr 2024 11:25:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0mk6-0005Nu-0o;
	Sat, 27 Apr 2024 18:25:46 +0000
Date: Sun, 28 Apr 2024 02:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3 14/14] net/sched/em_meta.c:593:33:
 error: 'const struct page_frag_cache' has no member named 'offset'
Message-ID: <202404280206.BmZc0Kh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   d4839424731dee0af1ba520ac3b177893e765399
commit: d4839424731dee0af1ba520ac3b177893e765399 [14/14] net: replace page_frag with page_frag_cache
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404280206.BmZc0Kh1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280206.BmZc0Kh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280206.BmZc0Kh1-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sched/em_meta.c: In function 'meta_int_sk_sendmsg_off':
>> net/sched/em_meta.c:593:33: error: 'const struct page_frag_cache' has no member named 'offset'
     593 |         dst->value = sk->sk_frag.offset;
         |                                 ^


vim +593 net/sched/em_meta.c

4890062960cbc4d Thomas Graf    2005-06-08  584  
4890062960cbc4d Thomas Graf    2005-06-08  585  META_COLLECTOR(int_sk_sendmsg_off)
4890062960cbc4d Thomas Graf    2005-06-08  586  {
02a56c81cf33dea Eric Dumazet   2015-11-08  587  	const struct sock *sk = skb_to_full_sk(skb);
02a56c81cf33dea Eric Dumazet   2015-11-08  588  
02a56c81cf33dea Eric Dumazet   2015-11-08  589  	if (!sk) {
4f8f61eb4341be0 Yang Yingliang 2013-12-11  590  		*err = -1;
4f8f61eb4341be0 Yang Yingliang 2013-12-11  591  		return;
4f8f61eb4341be0 Yang Yingliang 2013-12-11  592  	}
02a56c81cf33dea Eric Dumazet   2015-11-08 @593  	dst->value = sk->sk_frag.offset;
4890062960cbc4d Thomas Graf    2005-06-08  594  }
4890062960cbc4d Thomas Graf    2005-06-08  595  

:::::: The code at line 593 was first introduced by commit
:::::: 02a56c81cf33dea892da1f8a5231b0f7d7e714fe net_sched: em_meta: use skb_to_full_sk() helper

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
