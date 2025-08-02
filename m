Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4DA920
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754129880; cv=none; b=AiVET/c/ANiYq/tGxKkz5mHtx1LzkxbbRgm+vXJIkspvEb4szfx7c9o44N/ZiKZewj1CcCwwoa8BV5Cu+/LM9EJPhgM4CgvxJH+68Fi4BxYxRFMNKMZ4su902jzA8tDsA1boOt0bIb4GNFJCGH2Ogw3o2TiNXbfaLQGZ0g6FK04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754129880; c=relaxed/simple;
	bh=riNYIRqVoOoakrBnug7k5od3DJ5mfh+UAdeMk36JlMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GO4ydkTuPoVTgeOoIsj4+uUFvbaVB+zaUANZasq7a/b0o8sZjDfq8hX+SUIJvJIrNOJZihOAu56UlCD6qz/FbQZzNH0wUnHckSkz5lTN/JY+1qM4V9SfDC9NC64KJ26WenbNolS96ALjLsdZibzuI6WkAKlQgPDsgrIG0/tsZpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjPRpBoJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjPRpBoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754129878; x=1785665878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=riNYIRqVoOoakrBnug7k5od3DJ5mfh+UAdeMk36JlMs=;
  b=NjPRpBoJRguD+BJZZN0phNjp0bRBkAZ2A7/zVsIOTv9Gr8NKi3aSEU1m
   b6xzfIP1VgqNf9FEhJl+4Pyx1rRZuSNNqUbphXNHHwr4eZCSoZFP/zWjZ
   ON/6wY3QEzSQE15kP6g7+NHnlxnxmBKy2n9jZX1sVPtCX/YEeqR4jjaH9
   4ciNsPW+Mzy6RC0MvE7nSwvr/VDCtCIPXpkbuyEKMsAnWKvxV5+/jABn4
   MsLIK+poRG+JANBi/XebghYHupxwWic4V8q9mlPle+5CN/h81/XOwTsiC
   z19Fit/pjsSsbQGiNerq8fqsPagfWE2z7UGo8iMnsfB2VtmqFmJC/muE9
   A==;
X-CSE-ConnectionGUID: h1tX/vUET0OX0Qug7BPmJw==
X-CSE-MsgGUID: nbUCk9q5SeOWeBpgv+GB1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="74052868"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74052868"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 03:17:57 -0700
X-CSE-ConnectionGUID: ALnym2G+Q5KJYzyyGR31WA==
X-CSE-MsgGUID: 7YIAIXgYQpKP/vbYvYF2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168229114"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2025 03:17:55 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui9JH-0005Iq-1f;
	Sat, 02 Aug 2025 10:17:51 +0000
Date: Sat, 2 Aug 2025 18:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [sj:mm-new 40/108] mm/kmemleak.c:440:25: error: implicit declaration
 of function '__printk_safe_enter'
Message-ID: <202508021825.tUu2retW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git mm-new
head:   85e964e7a1ee73a0bb6db3e08355b93b25fa295f
commit: c9e6712790c0d20de3914c44e8a22d9df00cb28a [40/108] mm: fix possible deadlock in console_trylock_spinning
config: i386-buildonly-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021825.tUu2retW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021825.tUu2retW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021825.tUu2retW-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/kmemleak.c: In function '__lookup_object':
>> mm/kmemleak.c:440:25: error: implicit declaration of function '__printk_safe_enter' [-Werror=implicit-function-declaration]
     440 |                         __printk_safe_enter();
         |                         ^~~~~~~~~~~~~~~~~~~
>> mm/kmemleak.c:444:25: error: implicit declaration of function '__printk_safe_exit' [-Werror=implicit-function-declaration]
     444 |                         __printk_safe_exit();
         |                         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__printk_safe_enter +440 mm/kmemleak.c

   413	
   414	/*
   415	 * Look-up a memory block metadata (kmemleak_object) in the object search
   416	 * tree based on a pointer value. If alias is 0, only values pointing to the
   417	 * beginning of the memory block are allowed. The kmemleak_lock must be held
   418	 * when calling this function.
   419	 */
   420	static struct kmemleak_object *__lookup_object(unsigned long ptr, int alias,
   421						       unsigned int objflags)
   422	{
   423		struct rb_node *rb = object_tree(objflags)->rb_node;
   424		unsigned long untagged_ptr = (unsigned long)kasan_reset_tag((void *)ptr);
   425	
   426		while (rb) {
   427			struct kmemleak_object *object;
   428			unsigned long untagged_objp;
   429	
   430			object = rb_entry(rb, struct kmemleak_object, rb_node);
   431			untagged_objp = (unsigned long)kasan_reset_tag((void *)object->pointer);
   432	
   433			if (untagged_ptr < untagged_objp)
   434				rb = object->rb_node.rb_left;
   435			else if (untagged_objp + object->size <= untagged_ptr)
   436				rb = object->rb_node.rb_right;
   437			else if (untagged_objp == untagged_ptr || alias)
   438				return object;
   439			else {
 > 440				__printk_safe_enter();
   441				kmemleak_warn("Found object by alias at 0x%08lx\n",
   442					      ptr);
   443				dump_object_info(object);
 > 444				__printk_safe_exit();
   445				break;
   446			}
   447		}
   448		return NULL;
   449	}
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
