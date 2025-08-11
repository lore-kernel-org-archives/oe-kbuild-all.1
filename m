Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C42E2DED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946841; cv=none; b=pPb12HOnOrXjCPzmNx0VtcbnBNxLNBdBIYlbrQSn0K37+U3LZzirAtSFoyznpf153or2nYba/8NBrtwHmUn3yh+7AfOOZ4eJ4Ez8eKqt25Guedp+xYeZ5sRVxLyORR56xBlQPGibp71S+ZHsMTjc15BGG36z+zbhZQPM+VWU7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946841; c=relaxed/simple;
	bh=HAqPRFvF/3fqWDu/Bnief/M8iyBsDGVo096cGixdvSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1GuOyW5cxl6W24atGywFmjlkv0DDv14s3uN6e7oArE5uc2NfnfCkh3uB4742FTi9EnuQGxB3DZK09o9ZEmlIvPLGHjCAEfaFrPIXi8KAT73rF4OWqaNLT/IJdqyORf/J+9R5ETv/c5R59SJJDVoejZBover3Je0r3dtVH7+auY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk1VcEUX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk1VcEUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754946839; x=1786482839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HAqPRFvF/3fqWDu/Bnief/M8iyBsDGVo096cGixdvSw=;
  b=Lk1VcEUX9gtGxFAc92TskDaqm8EgUlE+fXL2f6zZDlcU4umVewAdb7o1
   3QcPR38IkSCYOxKtNmtJZFiy0NG4wni2xJ3oOZUrpv17WPbbxJ/OLl6IA
   W62piGtyGvvresZso0T7r/weM/oOj2+DF3vN+CADkqrMeMtSO9xgEctU1
   Px9f061yIkvQ5EiFBHShocUFOAETli42rpKYTp3yXZ5HoMo+TL4aoewIG
   LGWROTDTZrRendtk+ymq3o02NC/KsftOBSxJ5FhF3xP4zaq/Rb7YWp4Me
   4xcu5DPNORYQx5Uopgk1+AOOZzGHq3+n0I6GdPJ8hgVkqUCVZwsupV8+O
   A==;
X-CSE-ConnectionGUID: Fu1UEIQQTamPjK7bGVoUZw==
X-CSE-MsgGUID: RZu4K12dRU6g6wT7A0aYtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74795236"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="74795236"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:13:56 -0700
X-CSE-ConnectionGUID: TkGC4xUjRaahUq/j0zH7wg==
X-CSE-MsgGUID: 9d/bl2M4S3qeSdfgLRpRaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170155574"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2025 14:13:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZq0-0006EA-0y;
	Mon, 11 Aug 2025 21:13:49 +0000
Date: Tue, 12 Aug 2025 05:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:declare_bitmap 3/3] include/linux/nodemask.h:320:17: error:
 extra brace group at end of initializer
Message-ID: <202508120501.sHs5QFVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux declare_bitmap
head:   01ab0916a9bf06c1c2c964b3747e9a02f812285c
commit: 01ab0916a9bf06c1c2c964b3747e9a02f812285c [3/3] bitmap: move DECLARE_BITMAP() macro to include/linux/bitmap.h
config: x86_64-buildonly-randconfig-006-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120501.sHs5QFVI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120501.sHs5QFVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120501.sHs5QFVI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                                     ^~
   include/linux/cpumask.h:991:38: note: in expansion of macro 'cpumask_bits'
     991 |         return bitmap_parselist(buf, cpumask_bits(dstp), nr_cpumask_bits);
         |                                      ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumap_print_to_pagebuf':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:1303:51: note: in expansion of macro 'cpumask_bits'
    1303 |         return bitmap_print_to_pagebuf(list, buf, cpumask_bits(mask),
         |                                                   ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumap_print_bitmask_to_buf':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:1327:49: note: in expansion of macro 'cpumask_bits'
    1327 |         return bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
         |                                                 ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumap_print_list_to_buf':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:1349:46: note: in expansion of macro 'cpumask_bits'
    1349 |         return bitmap_print_list_to_buf(buf, cpumask_bits(mask),
         |                                              ^~~~~~~~~~~~
   arch/x86/include/asm/cpumask.h: In function 'arch_cpu_online':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   arch/x86/include/asm/cpumask.h:16:35: note: in expansion of macro 'cpumask_bits'
      16 |         return arch_test_bit(cpu, cpumask_bits(cpu_online_mask));
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/cpumask.h: In function 'arch_cpumask_clear_cpu':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   arch/x86/include/asm/cpumask.h:21:44: note: in expansion of macro 'cpumask_bits'
      21 |         arch_clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
         |                                            ^~~~~~~~~~~~
   include/linux/mm_types.h: In function 'mm_init_cid':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:377:31: note: in expansion of macro 'cpumask_bits'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   include/linux/cpumask.h:1118:36: note: in expansion of macro 'for_each_cpu'
    1118 | #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/mm_types.h:1380:9: note: in expansion of macro 'for_each_possible_cpu'
    1380 |         for_each_possible_cpu(i) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:377:9: note: in expansion of macro 'for_each_set_bit'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask.h:1118:36: note: in expansion of macro 'for_each_cpu'
    1118 | #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/mm_types.h:1380:9: note: in expansion of macro 'for_each_possible_cpu'
    1380 |         for_each_possible_cpu(i) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h: In function 'zone_page_state_snapshot':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:377:31: note: in expansion of macro 'cpumask_bits'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   include/linux/cpumask.h:1119:36: note: in expansion of macro 'for_each_cpu'
    1119 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/vmstat.h:228:9: note: in expansion of macro 'for_each_online_cpu'
     228 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:377:9: note: in expansion of macro 'for_each_set_bit'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask.h:1119:36: note: in expansion of macro 'for_each_cpu'
    1119 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/vmstat.h:228:9: note: in expansion of macro 'for_each_online_cpu'
     228 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_test_cpu':
   include/linux/cpumask.h:647:1: warning: control reaches end of non-void function [-Wreturn-type]
     647 | }
         | ^
   include/linux/nodemask.h: In function 'node_state':
>> include/linux/nodemask.h:411:1: warning: control reaches end of non-void function [-Wreturn-type]
     411 | }
         | ^
--
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/mempolicy.c:2976:21: note: in expansion of macro 'node_isset'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                     ^~~~~~~~~~
   include/linux/nodemask.h:149:63: error: 'nodemask_t' has no member named 'bits'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                               ^
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/mempolicy.c:2976:17: note: in expansion of macro 'if'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                 ^~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/mempolicy.c:2976:21: note: in expansion of macro 'node_isset'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                     ^~~~~~~~~~
   include/linux/nodemask.h:149:63: error: 'nodemask_t' has no member named 'bits'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                               ^
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/mempolicy.c:2976:17: note: in expansion of macro 'if'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                 ^~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/mempolicy.c:2976:21: note: in expansion of macro 'node_isset'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                     ^~~~~~~~~~
   include/linux/nodemask.h:149:63: error: 'nodemask_t' has no member named 'bits'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                               ^
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/mempolicy.c:2976:17: note: in expansion of macro 'if'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                 ^~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/mempolicy.c:2976:21: note: in expansion of macro 'node_isset'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                     ^~~~~~~~~~
   include/linux/nodemask.h:149:63: error: 'nodemask_t' has no member named 'bits'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                               ^
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/mempolicy.c:2976:17: note: in expansion of macro 'if'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                 ^~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/mempolicy.c:2976:21: note: in expansion of macro 'node_isset'
    2976 |                 if (node_isset(curnid, pol->nodes))
         |                     ^~~~~~~~~~
   mm/mempolicy.c: In function 'numa_policy_init':
   include/linux/nodemask.h:286:18: error: 'nodemask_t' has no member named 'bits'
     286 |                 m.bits[0] = 1UL << (node);                              \
         |                  ^
   mm/mempolicy.c:3276:34: note: in expansion of macro 'nodemask_of_node'
    3276 |                         .nodes = nodemask_of_node(nid),
         |                                  ^~~~~~~~~~~~~~~~
   mm/mempolicy.c: In function 'mpol_to_str':
>> include/linux/nodemask.h:320:17: error: extra brace group at end of initializer
     320 | ((nodemask_t) { {                                                       \
         |                 ^
   mm/mempolicy.c:3480:28: note: in expansion of macro 'NODE_MASK_NONE'
    3480 |         nodemask_t nodes = NODE_MASK_NONE;
         |                            ^~~~~~~~~~~~~~
   include/linux/nodemask.h:320:17: note: (near initialization for '(anonymous)')
     320 | ((nodemask_t) { {                                                       \
         |                 ^
   mm/mempolicy.c:3480:28: note: in expansion of macro 'NODE_MASK_NONE'
    3480 |         nodemask_t nodes = NODE_MASK_NONE;
         |                            ^~~~~~~~~~~~~~
>> include/linux/nodemask.h:320:17: warning: excess elements in struct initializer
     320 | ((nodemask_t) { {                                                       \
         |                 ^
   mm/mempolicy.c:3480:28: note: in expansion of macro 'NODE_MASK_NONE'
    3480 |         nodemask_t nodes = NODE_MASK_NONE;
         |                            ^~~~~~~~~~~~~~
   include/linux/nodemask.h:320:17: note: (near initialization for '(anonymous)')
     320 | ((nodemask_t) { {                                                       \
         |                 ^
   mm/mempolicy.c:3480:28: note: in expansion of macro 'NODE_MASK_NONE'
    3480 |         nodemask_t nodes = NODE_MASK_NONE;
         |                            ^~~~~~~~~~~~~~
   include/linux/nodemask.h: In function 'node_state':
>> include/linux/nodemask.h:411:1: warning: control reaches end of non-void function [-Wreturn-type]
     411 | }
         | ^
   include/linux/nodemask.h: In function '__nodes_weight':
   include/linux/nodemask.h:245:1: warning: control reaches end of non-void function [-Wreturn-type]
     245 | }
         | ^
   include/linux/nodemask.h: In function '__nodes_empty':
   include/linux/nodemask.h:233:1: warning: control reaches end of non-void function [-Wreturn-type]
     233 | }
         | ^
   include/linux/nodemask.h: In function '__nodes_equal':
   include/linux/nodemask.h:211:1: warning: control reaches end of non-void function [-Wreturn-type]
     211 | }
         | ^
   include/linux/nodemask.h: In function '__node_remap':
   include/linux/nodemask.h:346:1: warning: control reaches end of non-void function [-Wreturn-type]
     346 | }
         | ^
   mm/mempolicy.c: In function 'queue_folio_required':
>> mm/mempolicy.c:641:1: warning: control reaches end of non-void function [-Wreturn-type]
     641 | }
         | ^
   mm/mempolicy.c: In function 'get_nodes':
   mm/mempolicy.c:1616:1: warning: control reaches end of non-void function [-Wreturn-type]
    1616 | }
         | ^
   include/linux/nodemask.h: In function '__nodes_subset':
   include/linux/nodemask.h:227:1: warning: control reaches end of non-void function [-Wreturn-type]
     227 | }
         | ^
   mm/mempolicy.c: In function 'copy_nodes_to_user':
   mm/mempolicy.c:1643:1: warning: control reaches end of non-void function [-Wreturn-type]
    1643 | }
         | ^
   include/linux/nodemask.h: In function '__nodes_intersects':
   include/linux/nodemask.h:219:1: warning: control reaches end of non-void function [-Wreturn-type]
     219 | }
         | ^
   include/linux/nodemask.h: In function '__nodelist_parse':
   include/linux/nodemask.h:338:1: warning: control reaches end of non-void function [-Wreturn-type]
     338 | }
         | ^
   include/linux/nodemask.h: In function '__nodemask_pr_bits':
   include/linux/nodemask.h:113:1: warning: control reaches end of non-void function [-Wreturn-type]
     113 | }
         | ^
--
   include/linux/cpumask.h:1349:46: note: in expansion of macro 'cpumask_bits'
    1349 |         return bitmap_print_list_to_buf(buf, cpumask_bits(mask),
         |                                              ^~~~~~~~~~~~
   arch/x86/include/asm/cpumask.h: In function 'arch_cpu_online':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   arch/x86/include/asm/cpumask.h:16:35: note: in expansion of macro 'cpumask_bits'
      16 |         return arch_test_bit(cpu, cpumask_bits(cpu_online_mask));
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/cpumask.h: In function 'arch_cpumask_clear_cpu':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   arch/x86/include/asm/cpumask.h:21:44: note: in expansion of macro 'cpumask_bits'
      21 |         arch_clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
         |                                            ^~~~~~~~~~~~
   include/linux/mm_types.h: In function 'mm_init_cid':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:377:31: note: in expansion of macro 'cpumask_bits'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   include/linux/cpumask.h:1118:36: note: in expansion of macro 'for_each_cpu'
    1118 | #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/mm_types.h:1380:9: note: in expansion of macro 'for_each_possible_cpu'
    1380 |         for_each_possible_cpu(i) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:377:9: note: in expansion of macro 'for_each_set_bit'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask.h:1118:36: note: in expansion of macro 'for_each_cpu'
    1118 | #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/mm_types.h:1380:9: note: in expansion of macro 'for_each_possible_cpu'
    1380 |         for_each_possible_cpu(i) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h: In function 'zone_page_state_snapshot':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:377:31: note: in expansion of macro 'cpumask_bits'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   include/linux/cpumask.h:1119:36: note: in expansion of macro 'for_each_cpu'
    1119 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/vmstat.h:228:9: note: in expansion of macro 'for_each_online_cpu'
     228 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:377:9: note: in expansion of macro 'for_each_set_bit'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask.h:1119:36: note: in expansion of macro 'for_each_cpu'
    1119 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~
   include/linux/vmstat.h:228:9: note: in expansion of macro 'for_each_online_cpu'
     228 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/mshyperv.h: In function '__cpumask_to_vpset':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:377:31: note: in expansion of macro 'cpumask_bits'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   include/asm-generic/mshyperv.h:277:9: note: in expansion of macro 'for_each_cpu'
     277 |         for_each_cpu(cpu, cpus) {
         |         ^~~~~~~~~~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:377:9: note: in expansion of macro 'for_each_set_bit'
     377 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/mshyperv.h:277:9: note: in expansion of macro 'for_each_cpu'
     277 |         for_each_cpu(cpu, cpus) {
         |         ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_test_cpu':
   include/linux/cpumask.h:647:1: warning: control reaches end of non-void function [-Wreturn-type]
     647 | }
         | ^
   include/linux/nodemask.h: In function 'node_state':
>> include/linux/nodemask.h:411:1: warning: control reaches end of non-void function [-Wreturn-type]
     411 | }
         | ^
..


vim +320 include/linux/nodemask.h

^1da177e4c3f41 Linus Torvalds         2005-04-16  318  
^1da177e4c3f41 Linus Torvalds         2005-04-16  319  #define NODE_MASK_NONE							\
^1da177e4c3f41 Linus Torvalds         2005-04-16 @320  ((nodemask_t) { {							\
^1da177e4c3f41 Linus Torvalds         2005-04-16  321  	[0 ... BITS_TO_LONGS(MAX_NUMNODES)-1] =  0UL			\
^1da177e4c3f41 Linus Torvalds         2005-04-16  322  } })
^1da177e4c3f41 Linus Torvalds         2005-04-16  323  
^1da177e4c3f41 Linus Torvalds         2005-04-16  324  #define nodes_addr(src) ((src).bits)
^1da177e4c3f41 Linus Torvalds         2005-04-16  325  
01a3ee2b203e51 Reinette Chatre        2006-10-11  326  #define nodemask_parse_user(ubuf, ulen, dst) \
01a3ee2b203e51 Reinette Chatre        2006-10-11  327  		__nodemask_parse_user((ubuf), (ulen), &(dst), MAX_NUMNODES)
54c9e0085bd101 Yury Norov             2024-07-18  328  static __always_inline int __nodemask_parse_user(const char __user *buf, int len,
^1da177e4c3f41 Linus Torvalds         2005-04-16  329  					nodemask_t *dstp, int nbits)
^1da177e4c3f41 Linus Torvalds         2005-04-16  330  {
01a3ee2b203e51 Reinette Chatre        2006-10-11  331  	return bitmap_parse_user(buf, len, dstp->bits, nbits);
^1da177e4c3f41 Linus Torvalds         2005-04-16  332  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  333  
^1da177e4c3f41 Linus Torvalds         2005-04-16  334  #define nodelist_parse(buf, dst) __nodelist_parse((buf), &(dst), MAX_NUMNODES)
54c9e0085bd101 Yury Norov             2024-07-18  335  static __always_inline int __nodelist_parse(const char *buf, nodemask_t *dstp, int nbits)
^1da177e4c3f41 Linus Torvalds         2005-04-16  336  {
^1da177e4c3f41 Linus Torvalds         2005-04-16  337  	return bitmap_parselist(buf, dstp->bits, nbits);
^1da177e4c3f41 Linus Torvalds         2005-04-16  338  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  339  
fb5eeeee44edb2 Paul Jackson           2005-10-30  340  #define node_remap(oldbit, old, new) \
fb5eeeee44edb2 Paul Jackson           2005-10-30  341  		__node_remap((oldbit), &(old), &(new), MAX_NUMNODES)
54c9e0085bd101 Yury Norov             2024-07-18  342  static __always_inline int __node_remap(int oldbit,
fb5eeeee44edb2 Paul Jackson           2005-10-30  343  		const nodemask_t *oldp, const nodemask_t *newp, int nbits)
fb5eeeee44edb2 Paul Jackson           2005-10-30  344  {
fb5eeeee44edb2 Paul Jackson           2005-10-30  345  	return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
fb5eeeee44edb2 Paul Jackson           2005-10-30  346  }
fb5eeeee44edb2 Paul Jackson           2005-10-30  347  
fb5eeeee44edb2 Paul Jackson           2005-10-30  348  #define nodes_remap(dst, src, old, new) \
fb5eeeee44edb2 Paul Jackson           2005-10-30  349  		__nodes_remap(&(dst), &(src), &(old), &(new), MAX_NUMNODES)
54c9e0085bd101 Yury Norov             2024-07-18  350  static __always_inline void __nodes_remap(nodemask_t *dstp, const nodemask_t *srcp,
fb5eeeee44edb2 Paul Jackson           2005-10-30  351  		const nodemask_t *oldp, const nodemask_t *newp, int nbits)
fb5eeeee44edb2 Paul Jackson           2005-10-30  352  {
fb5eeeee44edb2 Paul Jackson           2005-10-30  353  	bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
fb5eeeee44edb2 Paul Jackson           2005-10-30  354  }
fb5eeeee44edb2 Paul Jackson           2005-10-30  355  
7ea931c9fc80c4 Paul Jackson           2008-04-28  356  #define nodes_onto(dst, orig, relmap) \
7ea931c9fc80c4 Paul Jackson           2008-04-28  357  		__nodes_onto(&(dst), &(orig), &(relmap), MAX_NUMNODES)
54c9e0085bd101 Yury Norov             2024-07-18  358  static __always_inline void __nodes_onto(nodemask_t *dstp, const nodemask_t *origp,
7ea931c9fc80c4 Paul Jackson           2008-04-28  359  		const nodemask_t *relmapp, int nbits)
7ea931c9fc80c4 Paul Jackson           2008-04-28  360  {
7ea931c9fc80c4 Paul Jackson           2008-04-28  361  	bitmap_onto(dstp->bits, origp->bits, relmapp->bits, nbits);
7ea931c9fc80c4 Paul Jackson           2008-04-28  362  }
7ea931c9fc80c4 Paul Jackson           2008-04-28  363  
7ea931c9fc80c4 Paul Jackson           2008-04-28  364  #define nodes_fold(dst, orig, sz) \
7ea931c9fc80c4 Paul Jackson           2008-04-28  365  		__nodes_fold(&(dst), &(orig), sz, MAX_NUMNODES)
54c9e0085bd101 Yury Norov             2024-07-18  366  static __always_inline void __nodes_fold(nodemask_t *dstp, const nodemask_t *origp,
7ea931c9fc80c4 Paul Jackson           2008-04-28  367  		int sz, int nbits)
7ea931c9fc80c4 Paul Jackson           2008-04-28  368  {
7ea931c9fc80c4 Paul Jackson           2008-04-28  369  	bitmap_fold(dstp->bits, origp->bits, sz, nbits);
7ea931c9fc80c4 Paul Jackson           2008-04-28  370  }
7ea931c9fc80c4 Paul Jackson           2008-04-28  371  
^1da177e4c3f41 Linus Torvalds         2005-04-16  372  #if MAX_NUMNODES > 1
^1da177e4c3f41 Linus Torvalds         2005-04-16  373  #define for_each_node_mask(node, mask)				    \
^1da177e4c3f41 Linus Torvalds         2005-04-16  374  	for ((node) = first_node(mask);				    \
cdd2d06fbc0a58 Gavin Shan             2023-01-24  375  	     (node) < MAX_NUMNODES;				    \
^1da177e4c3f41 Linus Torvalds         2005-04-16  376  	     (node) = next_node((node), (mask)))
^1da177e4c3f41 Linus Torvalds         2005-04-16  377  #else /* MAX_NUMNODES == 1 */
^1da177e4c3f41 Linus Torvalds         2005-04-16  378  #define for_each_node_mask(node, mask)                                  \
37462a920392cb Christophe de Dinechin 2022-04-14  379  	for ((node) = 0; (node) < 1 && !nodes_empty(mask); (node)++)
^1da177e4c3f41 Linus Torvalds         2005-04-16  380  #endif /* MAX_NUMNODES */
^1da177e4c3f41 Linus Torvalds         2005-04-16  381  
13808910713a98 Christoph Lameter      2007-10-16  382  /*
13808910713a98 Christoph Lameter      2007-10-16  383   * Bitmasks that are kept for all the nodes.
13808910713a98 Christoph Lameter      2007-10-16  384   */
13808910713a98 Christoph Lameter      2007-10-16  385  enum node_states {
13808910713a98 Christoph Lameter      2007-10-16  386  	N_POSSIBLE,		/* The node could become online at some point */
13808910713a98 Christoph Lameter      2007-10-16  387  	N_ONLINE,		/* The node is online */
7ea1530ab3fdfa Christoph Lameter      2007-10-16  388  	N_NORMAL_MEMORY,	/* The node has regular memory */
7ea1530ab3fdfa Christoph Lameter      2007-10-16  389  #ifdef CONFIG_HIGHMEM
7ea1530ab3fdfa Christoph Lameter      2007-10-16  390  	N_HIGH_MEMORY,		/* The node has regular or high memory */
7ea1530ab3fdfa Christoph Lameter      2007-10-16  391  #else
7ea1530ab3fdfa Christoph Lameter      2007-10-16  392  	N_HIGH_MEMORY = N_NORMAL_MEMORY,
7ea1530ab3fdfa Christoph Lameter      2007-10-16  393  #endif
20b2f52b73febc Lai Jiangshan          2012-12-12  394  	N_MEMORY,		/* The node has memory(regular, high, movable) */
37c0708dbee582 Christoph Lameter      2007-10-16  395  	N_CPU,		/* The node has one or more cpus */
894c26a1c274b8 Jonathan Cameron       2020-09-30  396  	N_GENERIC_INITIATOR,	/* The node has one or more Generic Initiators */
13808910713a98 Christoph Lameter      2007-10-16  397  	NR_NODE_STATES
13808910713a98 Christoph Lameter      2007-10-16  398  };
13808910713a98 Christoph Lameter      2007-10-16  399  
^1da177e4c3f41 Linus Torvalds         2005-04-16  400  /*
^1da177e4c3f41 Linus Torvalds         2005-04-16  401   * The following particular system nodemasks and operations
^1da177e4c3f41 Linus Torvalds         2005-04-16  402   * on them manage all possible and online nodes.
^1da177e4c3f41 Linus Torvalds         2005-04-16  403   */
^1da177e4c3f41 Linus Torvalds         2005-04-16  404  
13808910713a98 Christoph Lameter      2007-10-16  405  extern nodemask_t node_states[NR_NODE_STATES];
^1da177e4c3f41 Linus Torvalds         2005-04-16  406  
^1da177e4c3f41 Linus Torvalds         2005-04-16  407  #if MAX_NUMNODES > 1
54c9e0085bd101 Yury Norov             2024-07-18  408  static __always_inline int node_state(int node, enum node_states state)
13808910713a98 Christoph Lameter      2007-10-16  409  {
13808910713a98 Christoph Lameter      2007-10-16  410  	return node_isset(node, node_states[state]);
13808910713a98 Christoph Lameter      2007-10-16 @411  }
13808910713a98 Christoph Lameter      2007-10-16  412  

:::::: The code at line 320 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
