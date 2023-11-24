Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FFB17753
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrVKckrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700819413; x=1732355413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=abv8fMMfvhYC3qEM/tjrLZwTTJqiCO5jTpw+VOWd9gk=;
  b=XrVKckrj1h+6RfCaPrdCNHyOHkYYSPynIKykHFSz1qypuW4z+dR/R/vJ
   ZyUcBdNqEO5sP55d5o32dqNfW9hXxLZADqbIIy6q1+WoF0ZontOOvYl3T
   IAgS4A94g3mVYkzGeKVjgYx+myb9EpvWJ7Oetz1rhsdbOYsCDE4EwuxMV
   Q2DsEQwkZu69bgmb0MNIHmDtZJYi1udEDrgS8RfjWDUYggxC0SIkx62oG
   0MTsewAxZl1t6ZaOqL3S9f2eNpQGvlL7v/LoBRloCviwOpN8LWWz6hUiC
   zMUNy9qzZao1/gnO6fpRmUG2Jw8O8xbJ3imajop1JCV2wyCML79BArPRc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392165194"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="392165194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="8921117"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2023 01:50:11 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Sp5-0002LL-1G;
	Fri, 24 Nov 2023 09:50:07 +0000
Date: Fri, 24 Nov 2023 17:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 2/56] fs/netfs/fscache_cache.c:422:14: error:
 variable 'fscache_caches_seq_ops' has initializer but incomplete type
Message-ID: <202311241342.cnZ7Oqsa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   43d25b256ce0f02be1a82781479564cf3133700f
commit: 4e8a69615a7f65699c2abba7ab261c9d8044d49a [2/56] netfs, fscache: Combine fscache with netfs
config: i386-randconfig-002-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241342.cnZ7Oqsa-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241342.cnZ7Oqsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241342.cnZ7Oqsa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/netfs/fscache_cache.c: In function 'fscache_caches_seq_show':
>> fs/netfs/fscache_cache.c:384:3: error: implicit declaration of function 'seq_puts'; did you mean 'kset_put'? [-Werror=implicit-function-declaration]
      seq_puts(m,
      ^~~~~~~~
      kset_put
>> fs/netfs/fscache_cache.c:392:2: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
     seq_printf(m,
     ^~~~~~~~~~
     bstr_printf
   fs/netfs/fscache_cache.c: In function 'fscache_caches_seq_start':
>> fs/netfs/fscache_cache.c:408:9: error: implicit declaration of function 'seq_list_start_head'; did you mean 'klist_add_head'? [-Werror=implicit-function-declaration]
     return seq_list_start_head(&fscache_caches, *_pos);
            ^~~~~~~~~~~~~~~~~~~
            klist_add_head
>> fs/netfs/fscache_cache.c:408:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return seq_list_start_head(&fscache_caches, *_pos);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c: In function 'fscache_caches_seq_next':
>> fs/netfs/fscache_cache.c:413:9: error: implicit declaration of function 'seq_list_next'; did you mean 'klist_next'? [-Werror=implicit-function-declaration]
     return seq_list_next(v, &fscache_caches, _pos);
            ^~~~~~~~~~~~~
            klist_next
   fs/netfs/fscache_cache.c:413:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return seq_list_next(v, &fscache_caches, _pos);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c: At top level:
>> fs/netfs/fscache_cache.c:422:14: error: variable 'fscache_caches_seq_ops' has initializer but incomplete type
    const struct seq_operations fscache_caches_seq_ops = {
                 ^~~~~~~~~~~~~~
>> fs/netfs/fscache_cache.c:423:3: error: 'const struct seq_operations' has no member named 'start'
     .start  = fscache_caches_seq_start,
      ^~~~~
>> fs/netfs/fscache_cache.c:423:12: warning: excess elements in struct initializer
     .start  = fscache_caches_seq_start,
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:423:12: note: (near initialization for 'fscache_caches_seq_ops')
>> fs/netfs/fscache_cache.c:424:3: error: 'const struct seq_operations' has no member named 'next'
     .next   = fscache_caches_seq_next,
      ^~~~
   fs/netfs/fscache_cache.c:424:12: warning: excess elements in struct initializer
     .next   = fscache_caches_seq_next,
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:424:12: note: (near initialization for 'fscache_caches_seq_ops')
>> fs/netfs/fscache_cache.c:425:3: error: 'const struct seq_operations' has no member named 'stop'
     .stop   = fscache_caches_seq_stop,
      ^~~~
   fs/netfs/fscache_cache.c:425:12: warning: excess elements in struct initializer
     .stop   = fscache_caches_seq_stop,
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:425:12: note: (near initialization for 'fscache_caches_seq_ops')
>> fs/netfs/fscache_cache.c:426:3: error: 'const struct seq_operations' has no member named 'show'
     .show   = fscache_caches_seq_show,
      ^~~~
   fs/netfs/fscache_cache.c:426:12: warning: excess elements in struct initializer
     .show   = fscache_caches_seq_show,
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:426:12: note: (near initialization for 'fscache_caches_seq_ops')
>> fs/netfs/fscache_cache.c:422:29: error: storage size of 'fscache_caches_seq_ops' isn't known
    const struct seq_operations fscache_caches_seq_ops = {
                                ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/netfs/fscache_volume.c: In function 'fscache_volumes_seq_show':
>> fs/netfs/fscache_volume.c:477:3: error: implicit declaration of function 'seq_puts'; did you mean 'kset_put'? [-Werror=implicit-function-declaration]
      seq_puts(m,
      ^~~~~~~~
      kset_put
>> fs/netfs/fscache_volume.c:484:2: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
     seq_printf(m,
     ^~~~~~~~~~
     bstr_printf
   fs/netfs/fscache_volume.c: In function 'fscache_volumes_seq_start':
>> fs/netfs/fscache_volume.c:500:9: error: implicit declaration of function 'seq_list_start_head'; did you mean 'klist_add_head'? [-Werror=implicit-function-declaration]
     return seq_list_start_head(&fscache_volumes, *_pos);
            ^~~~~~~~~~~~~~~~~~~
            klist_add_head
>> fs/netfs/fscache_volume.c:500:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return seq_list_start_head(&fscache_volumes, *_pos);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c: In function 'fscache_volumes_seq_next':
>> fs/netfs/fscache_volume.c:505:9: error: implicit declaration of function 'seq_list_next'; did you mean 'klist_next'? [-Werror=implicit-function-declaration]
     return seq_list_next(v, &fscache_volumes, _pos);
            ^~~~~~~~~~~~~
            klist_next
   fs/netfs/fscache_volume.c:505:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return seq_list_next(v, &fscache_volumes, _pos);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c: At top level:
>> fs/netfs/fscache_volume.c:514:14: error: variable 'fscache_volumes_seq_ops' has initializer but incomplete type
    const struct seq_operations fscache_volumes_seq_ops = {
                 ^~~~~~~~~~~~~~
>> fs/netfs/fscache_volume.c:515:3: error: 'const struct seq_operations' has no member named 'start'
     .start  = fscache_volumes_seq_start,
      ^~~~~
>> fs/netfs/fscache_volume.c:515:12: warning: excess elements in struct initializer
     .start  = fscache_volumes_seq_start,
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:515:12: note: (near initialization for 'fscache_volumes_seq_ops')
>> fs/netfs/fscache_volume.c:516:3: error: 'const struct seq_operations' has no member named 'next'
     .next   = fscache_volumes_seq_next,
      ^~~~
   fs/netfs/fscache_volume.c:516:12: warning: excess elements in struct initializer
     .next   = fscache_volumes_seq_next,
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:516:12: note: (near initialization for 'fscache_volumes_seq_ops')
>> fs/netfs/fscache_volume.c:517:3: error: 'const struct seq_operations' has no member named 'stop'
     .stop   = fscache_volumes_seq_stop,
      ^~~~
   fs/netfs/fscache_volume.c:517:12: warning: excess elements in struct initializer
     .stop   = fscache_volumes_seq_stop,
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:517:12: note: (near initialization for 'fscache_volumes_seq_ops')
>> fs/netfs/fscache_volume.c:518:3: error: 'const struct seq_operations' has no member named 'show'
     .show   = fscache_volumes_seq_show,
      ^~~~
   fs/netfs/fscache_volume.c:518:12: warning: excess elements in struct initializer
     .show   = fscache_volumes_seq_show,
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:518:12: note: (near initialization for 'fscache_volumes_seq_ops')
>> fs/netfs/fscache_volume.c:514:29: error: storage size of 'fscache_volumes_seq_ops' isn't known
    const struct seq_operations fscache_volumes_seq_ops = {
                                ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/netfs/fscache_cookie.c: In function 'fscache_cookies_seq_show':
>> fs/netfs/fscache_cookie.c:1114:3: error: implicit declaration of function 'seq_puts'; did you mean 'set_ptes'? [-Werror=implicit-function-declaration]
      seq_puts(m,
      ^~~~~~~~
      set_ptes
>> fs/netfs/fscache_cookie.c:1123:2: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
     seq_printf(m,
     ^~~~~~~~~~
     bstr_printf
   fs/netfs/fscache_cookie.c: In function 'fscache_cookies_seq_start':
>> fs/netfs/fscache_cookie.c:1159:9: error: implicit declaration of function 'seq_list_start_head'; did you mean 'klist_add_head'? [-Werror=implicit-function-declaration]
     return seq_list_start_head(&fscache_cookies, *_pos);
            ^~~~~~~~~~~~~~~~~~~
            klist_add_head
>> fs/netfs/fscache_cookie.c:1159:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return seq_list_start_head(&fscache_cookies, *_pos);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c: In function 'fscache_cookies_seq_next':
>> fs/netfs/fscache_cookie.c:1164:9: error: implicit declaration of function 'seq_list_next'; did you mean 'klist_next'? [-Werror=implicit-function-declaration]
     return seq_list_next(v, &fscache_cookies, _pos);
            ^~~~~~~~~~~~~
            klist_next
   fs/netfs/fscache_cookie.c:1164:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return seq_list_next(v, &fscache_cookies, _pos);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c: At top level:
>> fs/netfs/fscache_cookie.c:1174:14: error: variable 'fscache_cookies_seq_ops' has initializer but incomplete type
    const struct seq_operations fscache_cookies_seq_ops = {
                 ^~~~~~~~~~~~~~
>> fs/netfs/fscache_cookie.c:1175:3: error: 'const struct seq_operations' has no member named 'start'
     .start  = fscache_cookies_seq_start,
      ^~~~~
>> fs/netfs/fscache_cookie.c:1175:12: warning: excess elements in struct initializer
     .start  = fscache_cookies_seq_start,
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1175:12: note: (near initialization for 'fscache_cookies_seq_ops')
>> fs/netfs/fscache_cookie.c:1176:3: error: 'const struct seq_operations' has no member named 'next'
     .next   = fscache_cookies_seq_next,
      ^~~~
   fs/netfs/fscache_cookie.c:1176:12: warning: excess elements in struct initializer
     .next   = fscache_cookies_seq_next,
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1176:12: note: (near initialization for 'fscache_cookies_seq_ops')
>> fs/netfs/fscache_cookie.c:1177:3: error: 'const struct seq_operations' has no member named 'stop'
     .stop   = fscache_cookies_seq_stop,
      ^~~~
   fs/netfs/fscache_cookie.c:1177:12: warning: excess elements in struct initializer
     .stop   = fscache_cookies_seq_stop,
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1177:12: note: (near initialization for 'fscache_cookies_seq_ops')
>> fs/netfs/fscache_cookie.c:1178:3: error: 'const struct seq_operations' has no member named 'show'
     .show   = fscache_cookies_seq_show,
      ^~~~
   fs/netfs/fscache_cookie.c:1178:12: warning: excess elements in struct initializer
     .show   = fscache_cookies_seq_show,
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1178:12: note: (near initialization for 'fscache_cookies_seq_ops')
>> fs/netfs/fscache_cookie.c:1174:29: error: storage size of 'fscache_cookies_seq_ops' isn't known
    const struct seq_operations fscache_cookies_seq_ops = {
                                ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/fscache_caches_seq_ops +422 fs/netfs/fscache_cache.c

9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  375  
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  376  /*
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  377   * Generate a list of caches in /proc/fs/fscache/caches
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  378   */
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  379  static int fscache_caches_seq_show(struct seq_file *m, void *v)
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  380  {
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  381  	struct fscache_cache *cache;
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  382  
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  383  	if (v == &fscache_caches) {
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @384  		seq_puts(m,
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  385  			 "CACHE    REF   VOLS  OBJS  ACCES S NAME\n"
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  386  			 "======== ===== ===== ===== ===== = ===============\n"
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  387  			 );
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  388  		return 0;
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  389  	}
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  390  
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  391  	cache = list_entry(v, struct fscache_cache, cache_link);
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @392  	seq_printf(m,
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  393  		   "%08x %5d %5d %5d %5d %c %s\n",
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  394  		   cache->debug_id,
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  395  		   refcount_read(&cache->ref),
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  396  		   atomic_read(&cache->n_volumes),
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  397  		   atomic_read(&cache->object_count),
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  398  		   atomic_read(&cache->n_accesses),
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  399  		   fscache_cache_states[cache->state],
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  400  		   cache->name ?: "-");
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  401  	return 0;
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  402  }
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  403  
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  404  static void *fscache_caches_seq_start(struct seq_file *m, loff_t *_pos)
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  405  	__acquires(fscache_addremove_sem)
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  406  {
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  407  	down_read(&fscache_addremove_sem);
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @408  	return seq_list_start_head(&fscache_caches, *_pos);
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  409  }
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  410  
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  411  static void *fscache_caches_seq_next(struct seq_file *m, void *v, loff_t *_pos)
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  412  {
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @413  	return seq_list_next(v, &fscache_caches, _pos);
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  414  }
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  415  
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  416  static void fscache_caches_seq_stop(struct seq_file *m, void *v)
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  417  	__releases(fscache_addremove_sem)
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  418  {
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  419  	up_read(&fscache_addremove_sem);
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  420  }
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20  421  
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @422  const struct seq_operations fscache_caches_seq_ops = {
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @423  	.start  = fscache_caches_seq_start,
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @424  	.next   = fscache_caches_seq_next,
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @425  	.stop   = fscache_caches_seq_stop,
9549332df4ed4e fs/fscache/cache.c David Howells 2021-10-20 @426  	.show   = fscache_caches_seq_show,

:::::: The code at line 422 was first introduced by commit
:::::: 9549332df4ed4e761a1d41c83f2c25d28bb22431 fscache: Implement cache registration

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
