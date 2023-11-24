Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0C017754
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bo98DEqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700819417; x=1732355417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=plSeBUsqZQTopGZfLYJz/xJCoIhEbM2tUDRRH5rZEYA=;
  b=bo98DEqTB3O51lS9TJyTfJc6uOpkmPLxEdsmYSurnigNRu4HsLyKp1bj
   3vIryUtVawpD08UER1EHf+DD0BWde+W3I5l2Zs+40fmOPZbSznczCMApA
   kRYNwvghDsREzHrbgMi93A9SKSLbgJkx/DXwIUa6vZ3rIumgZw/UitsoR
   mvRE6649hJo3LqGtpk9t44qqEUyj4ngV3HF8QoDMwa0qmct68e2tUY4xa
   3KzxexGijRdV8rNJYooS+EMU8uk2mUVRSqJvG1eBOoJ5RvtkEP3zZ9dZr
   8RJr2HlRH480ldKPvLJsKAaQJv5ns3uyNZq/4zzqRy3V8tKYJj7FLGC//
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392165224"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="392165224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="8921127"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2023 01:50:14 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Sp9-0002LY-0i;
	Fri, 24 Nov 2023 09:50:11 +0000
Date: Fri, 24 Nov 2023 17:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 2/56] fs/netfs/fscache_cookie.c:1159:16:
 warning: returning 'int' from a function with return type 'void *' makes
 pointer from integer without a cast
Message-ID: <202311241339.QlGNMHuL-lkp@intel.com>
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
config: x86_64-randconfig-011-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241339.QlGNMHuL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241339.QlGNMHuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241339.QlGNMHuL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/fscache_cookie.c: In function 'fscache_cookies_seq_show':
   fs/netfs/fscache_cookie.c:1114:17: error: implicit declaration of function 'seq_puts' [-Werror=implicit-function-declaration]
    1114 |                 seq_puts(m,
         |                 ^~~~~~~~
   fs/netfs/fscache_cookie.c:1123:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
    1123 |         seq_printf(m,
         |         ^~~~~~~~~~
         |         bstr_printf
   fs/netfs/fscache_cookie.c: In function 'fscache_cookies_seq_start':
   fs/netfs/fscache_cookie.c:1159:16: error: implicit declaration of function 'seq_list_start_head' [-Werror=implicit-function-declaration]
    1159 |         return seq_list_start_head(&fscache_cookies, *_pos);
         |                ^~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_cookie.c:1159:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
    1159 |         return seq_list_start_head(&fscache_cookies, *_pos);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c: In function 'fscache_cookies_seq_next':
   fs/netfs/fscache_cookie.c:1164:16: error: implicit declaration of function 'seq_list_next'; did you mean 'klist_next'? [-Werror=implicit-function-declaration]
    1164 |         return seq_list_next(v, &fscache_cookies, _pos);
         |                ^~~~~~~~~~~~~
         |                klist_next
   fs/netfs/fscache_cookie.c:1164:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
    1164 |         return seq_list_next(v, &fscache_cookies, _pos);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c: At top level:
   fs/netfs/fscache_cookie.c:1174:14: error: variable 'fscache_cookies_seq_ops' has initializer but incomplete type
    1174 | const struct seq_operations fscache_cookies_seq_ops = {
         |              ^~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1175:10: error: 'const struct seq_operations' has no member named 'start'
    1175 |         .start  = fscache_cookies_seq_start,
         |          ^~~~~
   fs/netfs/fscache_cookie.c:1175:19: warning: excess elements in struct initializer
    1175 |         .start  = fscache_cookies_seq_start,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1175:19: note: (near initialization for 'fscache_cookies_seq_ops')
   fs/netfs/fscache_cookie.c:1176:10: error: 'const struct seq_operations' has no member named 'next'
    1176 |         .next   = fscache_cookies_seq_next,
         |          ^~~~
   fs/netfs/fscache_cookie.c:1176:19: warning: excess elements in struct initializer
    1176 |         .next   = fscache_cookies_seq_next,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1176:19: note: (near initialization for 'fscache_cookies_seq_ops')
   fs/netfs/fscache_cookie.c:1177:10: error: 'const struct seq_operations' has no member named 'stop'
    1177 |         .stop   = fscache_cookies_seq_stop,
         |          ^~~~
   fs/netfs/fscache_cookie.c:1177:19: warning: excess elements in struct initializer
    1177 |         .stop   = fscache_cookies_seq_stop,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1177:19: note: (near initialization for 'fscache_cookies_seq_ops')
   fs/netfs/fscache_cookie.c:1178:10: error: 'const struct seq_operations' has no member named 'show'
    1178 |         .show   = fscache_cookies_seq_show,
         |          ^~~~
   fs/netfs/fscache_cookie.c:1178:19: warning: excess elements in struct initializer
    1178 |         .show   = fscache_cookies_seq_show,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cookie.c:1178:19: note: (near initialization for 'fscache_cookies_seq_ops')
   fs/netfs/fscache_cookie.c:1174:29: error: storage size of 'fscache_cookies_seq_ops' isn't known
    1174 | const struct seq_operations fscache_cookies_seq_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/netfs/fscache_volume.c: In function 'fscache_volumes_seq_show':
   fs/netfs/fscache_volume.c:477:17: error: implicit declaration of function 'seq_puts' [-Werror=implicit-function-declaration]
     477 |                 seq_puts(m,
         |                 ^~~~~~~~
   fs/netfs/fscache_volume.c:484:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
     484 |         seq_printf(m,
         |         ^~~~~~~~~~
         |         bstr_printf
   fs/netfs/fscache_volume.c: In function 'fscache_volumes_seq_start':
   fs/netfs/fscache_volume.c:500:16: error: implicit declaration of function 'seq_list_start_head' [-Werror=implicit-function-declaration]
     500 |         return seq_list_start_head(&fscache_volumes, *_pos);
         |                ^~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_volume.c:500:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     500 |         return seq_list_start_head(&fscache_volumes, *_pos);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c: In function 'fscache_volumes_seq_next':
   fs/netfs/fscache_volume.c:505:16: error: implicit declaration of function 'seq_list_next'; did you mean 'klist_next'? [-Werror=implicit-function-declaration]
     505 |         return seq_list_next(v, &fscache_volumes, _pos);
         |                ^~~~~~~~~~~~~
         |                klist_next
   fs/netfs/fscache_volume.c:505:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     505 |         return seq_list_next(v, &fscache_volumes, _pos);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c: At top level:
   fs/netfs/fscache_volume.c:514:14: error: variable 'fscache_volumes_seq_ops' has initializer but incomplete type
     514 | const struct seq_operations fscache_volumes_seq_ops = {
         |              ^~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:515:10: error: 'const struct seq_operations' has no member named 'start'
     515 |         .start  = fscache_volumes_seq_start,
         |          ^~~~~
   fs/netfs/fscache_volume.c:515:19: warning: excess elements in struct initializer
     515 |         .start  = fscache_volumes_seq_start,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:515:19: note: (near initialization for 'fscache_volumes_seq_ops')
   fs/netfs/fscache_volume.c:516:10: error: 'const struct seq_operations' has no member named 'next'
     516 |         .next   = fscache_volumes_seq_next,
         |          ^~~~
   fs/netfs/fscache_volume.c:516:19: warning: excess elements in struct initializer
     516 |         .next   = fscache_volumes_seq_next,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:516:19: note: (near initialization for 'fscache_volumes_seq_ops')
   fs/netfs/fscache_volume.c:517:10: error: 'const struct seq_operations' has no member named 'stop'
     517 |         .stop   = fscache_volumes_seq_stop,
         |          ^~~~
   fs/netfs/fscache_volume.c:517:19: warning: excess elements in struct initializer
     517 |         .stop   = fscache_volumes_seq_stop,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:517:19: note: (near initialization for 'fscache_volumes_seq_ops')
   fs/netfs/fscache_volume.c:518:10: error: 'const struct seq_operations' has no member named 'show'
     518 |         .show   = fscache_volumes_seq_show,
         |          ^~~~
   fs/netfs/fscache_volume.c:518:19: warning: excess elements in struct initializer
     518 |         .show   = fscache_volumes_seq_show,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_volume.c:518:19: note: (near initialization for 'fscache_volumes_seq_ops')
   fs/netfs/fscache_volume.c:514:29: error: storage size of 'fscache_volumes_seq_ops' isn't known
     514 | const struct seq_operations fscache_volumes_seq_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/netfs/fscache_cache.c: In function 'fscache_caches_seq_show':
   fs/netfs/fscache_cache.c:384:17: error: implicit declaration of function 'seq_puts' [-Werror=implicit-function-declaration]
     384 |                 seq_puts(m,
         |                 ^~~~~~~~
   fs/netfs/fscache_cache.c:392:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
     392 |         seq_printf(m,
         |         ^~~~~~~~~~
         |         bstr_printf
   fs/netfs/fscache_cache.c: In function 'fscache_caches_seq_start':
   fs/netfs/fscache_cache.c:408:16: error: implicit declaration of function 'seq_list_start_head' [-Werror=implicit-function-declaration]
     408 |         return seq_list_start_head(&fscache_caches, *_pos);
         |                ^~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_cache.c:408:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     408 |         return seq_list_start_head(&fscache_caches, *_pos);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c: In function 'fscache_caches_seq_next':
   fs/netfs/fscache_cache.c:413:16: error: implicit declaration of function 'seq_list_next'; did you mean 'klist_next'? [-Werror=implicit-function-declaration]
     413 |         return seq_list_next(v, &fscache_caches, _pos);
         |                ^~~~~~~~~~~~~
         |                klist_next
   fs/netfs/fscache_cache.c:413:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     413 |         return seq_list_next(v, &fscache_caches, _pos);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c: At top level:
   fs/netfs/fscache_cache.c:422:14: error: variable 'fscache_caches_seq_ops' has initializer but incomplete type
     422 | const struct seq_operations fscache_caches_seq_ops = {
         |              ^~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:423:10: error: 'const struct seq_operations' has no member named 'start'
     423 |         .start  = fscache_caches_seq_start,
         |          ^~~~~
   fs/netfs/fscache_cache.c:423:19: warning: excess elements in struct initializer
     423 |         .start  = fscache_caches_seq_start,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:423:19: note: (near initialization for 'fscache_caches_seq_ops')
   fs/netfs/fscache_cache.c:424:10: error: 'const struct seq_operations' has no member named 'next'
     424 |         .next   = fscache_caches_seq_next,
         |          ^~~~
   fs/netfs/fscache_cache.c:424:19: warning: excess elements in struct initializer
     424 |         .next   = fscache_caches_seq_next,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:424:19: note: (near initialization for 'fscache_caches_seq_ops')
   fs/netfs/fscache_cache.c:425:10: error: 'const struct seq_operations' has no member named 'stop'
     425 |         .stop   = fscache_caches_seq_stop,
         |          ^~~~
   fs/netfs/fscache_cache.c:425:19: warning: excess elements in struct initializer
     425 |         .stop   = fscache_caches_seq_stop,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:425:19: note: (near initialization for 'fscache_caches_seq_ops')
   fs/netfs/fscache_cache.c:426:10: error: 'const struct seq_operations' has no member named 'show'
     426 |         .show   = fscache_caches_seq_show,
         |          ^~~~
   fs/netfs/fscache_cache.c:426:19: warning: excess elements in struct initializer
     426 |         .show   = fscache_caches_seq_show,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/fscache_cache.c:426:19: note: (near initialization for 'fscache_caches_seq_ops')
   fs/netfs/fscache_cache.c:422:29: error: storage size of 'fscache_caches_seq_ops' isn't known
     422 | const struct seq_operations fscache_caches_seq_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1159 fs/netfs/fscache_cookie.c

7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20  1154  
7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20  1155  static void *fscache_cookies_seq_start(struct seq_file *m, loff_t *_pos)
7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20  1156  	__acquires(fscache_cookies_lock)
7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20  1157  {
7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20  1158  	read_lock(&fscache_cookies_lock);
7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20 @1159  	return seq_list_start_head(&fscache_cookies, *_pos);
7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20  1160  }
7f3283aba39a0f fs/fscache/cookie.c David Howells 2021-10-20  1161  

:::::: The code at line 1159 was first introduced by commit
:::::: 7f3283aba39a0f395700c3b5defa4ec49d9914b3 fscache: Implement cookie registration

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
