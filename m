Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3C7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693744019; x=1725280019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CAnanEJqcUzmDPBB2bUnu6ESb6Qu/kS+lpuB2T3i3vY=;
  b=a/bqDBYbvJY0bSNuhhEqS+Ap2l5aRtzlbODYNTJReapp/Psi79BjYxV2
   KSk+LjVp4pEzcXEyamO3GF1KyRlmqDwJ8xlVDc2paFDccyzE2eMsVy6DJ
   shlWBqTPbrmNfmSSIc2yK66Jvv+aX4cpsxOHNvwAg4yGIE4d+XWmT9aXt
   1PBO9RFjtEWuDC/bb2jySMKKSqUfo5biqPETMu3PgSWIjPtDBH6yiXKTh
   2dPePOIwr3LOv0A14m4EfM/cevJyH86r/T02rI3J5by1C4S2MWniMTUlm
   EmCd5hvVSwBTS3IqSsQ4tE1NCuLzYn3TR3KYwxHGJQLIMP6j1r/NirgRq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376381997"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="376381997"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 05:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="830620682"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="830620682"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Sep 2023 05:26:55 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcmBo-00039X-1b;
	Sun, 03 Sep 2023 12:26:52 +0000
Date: Sun, 3 Sep 2023 20:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5e 24/24] lib/dynamic_debug.c:284:33: error: implicit
 declaration of function 'assoc_array_delete'
Message-ID: <202309032035.M80dBHhw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5e
head:   69b58a07013be2ff9c21e29b48cce3de6d963f11
commit: 69b58a07013be2ff9c21e29b48cce3de6d963f11 [24/24] dyndbg: use assoc-array to cache prefixes
config: mips-loongson1b_defconfig (https://download.01.org/0day-ci/archive/20230903/202309032035.M80dBHhw-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309032035.M80dBHhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309032035.M80dBHhw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_change':
>> lib/dynamic_debug.c:284:33: error: implicit declaration of function 'assoc_array_delete' [-Werror=implicit-function-declaration]
     284 |                                 assoc_array_delete(&ddebug_prefix_cache, &ddprefix_aa_ops, dp);
         |                                 ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:784:59: warning: 'struct assoc_array_ptr' declared inside parameter list will not be visible outside of this definition or declaration
     784 | static inline struct key *keyring_ptr_to_key(const struct assoc_array_ptr *x)
         |                                                           ^~~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'keyring_ptr_to_key':
>> lib/dynamic_debug.c:786:24: error: implicit declaration of function 'assoc_array_ptr_to_leaf' [-Werror=implicit-function-declaration]
     786 |         void *object = assoc_array_ptr_to_leaf(x);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:786:24: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   lib/dynamic_debug.c: In function 'ddprefix_get_key_chunk':
>> lib/dynamic_debug.c:802:33: error: invalid use of undefined type 'const struct keyring_index_key'
     802 |         int desc_len = index_key->desc_len, n = sizeof(chunk);
         |                                 ^~
>> lib/dynamic_debug.c:804:18: error: 'ASSOC_ARRAY_KEY_CHUNK_SIZE' undeclared (first use in this function)
     804 |         level /= ASSOC_ARRAY_KEY_CHUNK_SIZE;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:804:18: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c:807:33: error: invalid use of undefined type 'const struct keyring_index_key'
     807 |                 return index_key->hash;
         |                                 ^~
   lib/dynamic_debug.c:809:33: error: invalid use of undefined type 'const struct keyring_index_key'
     809 |                 return index_key->x;
         |                                 ^~
   lib/dynamic_debug.c:811:48: error: invalid use of undefined type 'const struct keyring_index_key'
     811 |                 return (unsigned long)index_key->type;
         |                                                ^~
   lib/dynamic_debug.c:813:48: error: invalid use of undefined type 'const struct keyring_index_key'
     813 |                 return (unsigned long)index_key->domain_tag;
         |                                                ^~
   lib/dynamic_debug.c:816:49: error: invalid use of undefined type 'const struct keyring_index_key'
     816 |                 if (desc_len <= sizeof(index_key->desc))
         |                                                 ^~
   lib/dynamic_debug.c:819:30: error: invalid use of undefined type 'const struct keyring_index_key'
     819 |                 d = index_key->description + sizeof(index_key->desc);
         |                              ^~
   lib/dynamic_debug.c:819:62: error: invalid use of undefined type 'const struct keyring_index_key'
     819 |                 d = index_key->description + sizeof(index_key->desc);
         |                                                              ^~
   lib/dynamic_debug.c:821:45: error: invalid use of undefined type 'const struct keyring_index_key'
     821 |                 desc_len -= sizeof(index_key->desc);
         |                                             ^~
   lib/dynamic_debug.c: In function 'ddprefix_get_object_key_chunk':
>> lib/dynamic_debug.c:835:43: error: invalid use of undefined type 'const struct key'
     835 |         return ddprefix_get_key_chunk(&key->index_key, level);
         |                                           ^~
   lib/dynamic_debug.c: In function 'ddprefix_compare_object':
   lib/dynamic_debug.c:843:19: error: invalid use of undefined type 'const struct key'
     843 |         return key->index_key.type == index_key->type &&
         |                   ^~
   lib/dynamic_debug.c:843:48: error: invalid use of undefined type 'const struct keyring_index_key'
     843 |         return key->index_key.type == index_key->type &&
         |                                                ^~
   lib/dynamic_debug.c:844:20: error: invalid use of undefined type 'const struct key'
     844 |                 key->index_key.domain_tag == index_key->domain_tag &&
         |                    ^~
   lib/dynamic_debug.c:844:55: error: invalid use of undefined type 'const struct keyring_index_key'
     844 |                 key->index_key.domain_tag == index_key->domain_tag &&
         |                                                       ^~
   lib/dynamic_debug.c:845:20: error: invalid use of undefined type 'const struct key'
     845 |                 key->index_key.desc_len == index_key->desc_len &&
         |                    ^~
   lib/dynamic_debug.c:845:53: error: invalid use of undefined type 'const struct keyring_index_key'
     845 |                 key->index_key.desc_len == index_key->desc_len &&
         |                                                     ^~
   lib/dynamic_debug.c:846:27: error: invalid use of undefined type 'const struct key'
     846 |                 memcmp(key->index_key.description, index_key->description,
         |                           ^~
   lib/dynamic_debug.c:846:61: error: invalid use of undefined type 'const struct keyring_index_key'
     846 |                 memcmp(key->index_key.description, index_key->description,
         |                                                             ^~
   lib/dynamic_debug.c:847:33: error: invalid use of undefined type 'const struct keyring_index_key'
     847 |                        index_key->desc_len) == 0;
         |                                 ^~
   lib/dynamic_debug.c: In function 'ddprefix_diff_objects':
   lib/dynamic_debug.c:857:51: error: invalid use of undefined type 'const struct key'
     857 |         const struct keyring_index_key *a = &key_a->index_key;
         |                                                   ^~
   lib/dynamic_debug.c:863:18: error: invalid use of undefined type 'const struct keyring_index_key'
     863 |         seg_a = a->hash;
         |                  ^~
   lib/dynamic_debug.c:864:18: error: invalid use of undefined type 'const struct keyring_index_key'
     864 |         seg_b = b->hash;
         |                  ^~
   lib/dynamic_debug.c:867:18: error: 'ASSOC_ARRAY_KEY_CHUNK_SIZE' undeclared (first use in this function)
     867 |         level += ASSOC_ARRAY_KEY_CHUNK_SIZE / 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:873:18: error: invalid use of undefined type 'const struct keyring_index_key'
     873 |         seg_a = a->x;
         |                  ^~
   lib/dynamic_debug.c:874:18: error: invalid use of undefined type 'const struct keyring_index_key'
     874 |         seg_b = b->x;
         |                  ^~
   lib/dynamic_debug.c:880:33: error: invalid use of undefined type 'const struct keyring_index_key'
     880 |         seg_a = (unsigned long)a->type;
         |                                 ^~
   lib/dynamic_debug.c:881:33: error: invalid use of undefined type 'const struct keyring_index_key'
     881 |         seg_b = (unsigned long)b->type;
         |                                 ^~
   lib/dynamic_debug.c:886:33: error: invalid use of undefined type 'const struct keyring_index_key'
     886 |         seg_a = (unsigned long)a->domain_tag;
         |                                 ^~
   lib/dynamic_debug.c:887:33: error: invalid use of undefined type 'const struct keyring_index_key'
     887 |         seg_b = (unsigned long)b->domain_tag;
         |                                 ^~
   lib/dynamic_debug.c:892:21: error: invalid use of undefined type 'const struct keyring_index_key'
     892 |         i = sizeof(a->desc);
         |                     ^~
   lib/dynamic_debug.c:893:14: error: invalid use of undefined type 'const struct keyring_index_key'
     893 |         if (a->desc_len <= i)
         |              ^~
   lib/dynamic_debug.c:896:21: error: invalid use of undefined type 'const struct keyring_index_key'
     896 |         for (; i < a->desc_len; i++) {
         |                     ^~
   lib/dynamic_debug.c:897:45: error: invalid use of undefined type 'const struct keyring_index_key'
     897 |                 seg_a = *(unsigned char *)(a->description + i);
         |                                             ^~
   lib/dynamic_debug.c:898:45: error: invalid use of undefined type 'const struct keyring_index_key'
     898 |                 seg_b = *(unsigned char *)(b->description + i);
         |                                             ^~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:918:21: error: variable 'ddprefix_aa_ops' has initializer but incomplete type
     918 | static const struct assoc_array_ops ddprefix_aa_ops = {
         |                     ^~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:919:10: error: 'const struct assoc_array_ops' has no member named 'get_key_chunk'
     919 |         .get_key_chunk          = ddprefix_get_key_chunk,
         |          ^~~~~~~~~~~~~
>> lib/dynamic_debug.c:919:35: warning: excess elements in struct initializer
     919 |         .get_key_chunk          = ddprefix_get_key_chunk,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:919:35: note: (near initialization for 'ddprefix_aa_ops')
>> lib/dynamic_debug.c:920:10: error: 'const struct assoc_array_ops' has no member named 'get_object_key_chunk'
     920 |         .get_object_key_chunk   = ddprefix_get_object_key_chunk,
         |          ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:920:35: warning: excess elements in struct initializer
     920 |         .get_object_key_chunk   = ddprefix_get_object_key_chunk,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:920:35: note: (near initialization for 'ddprefix_aa_ops')
>> lib/dynamic_debug.c:921:10: error: 'const struct assoc_array_ops' has no member named 'compare_object'
     921 |         .compare_object         = ddprefix_compare_object,
         |          ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:921:35: warning: excess elements in struct initializer
     921 |         .compare_object         = ddprefix_compare_object,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:921:35: note: (near initialization for 'ddprefix_aa_ops')
>> lib/dynamic_debug.c:922:10: error: 'const struct assoc_array_ops' has no member named 'diff_objects'
     922 |         .diff_objects           = ddprefix_diff_objects,
         |          ^~~~~~~~~~~~
   lib/dynamic_debug.c:922:35: warning: excess elements in struct initializer
     922 |         .diff_objects           = ddprefix_diff_objects,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:922:35: note: (near initialization for 'ddprefix_aa_ops')
>> lib/dynamic_debug.c:923:10: error: 'const struct assoc_array_ops' has no member named 'free_object'
     923 |         .free_object            = ddprefix_free_object,
         |          ^~~~~~~~~~~
   lib/dynamic_debug.c:923:35: warning: excess elements in struct initializer
     923 |         .free_object            = ddprefix_free_object,
         |                                   ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:923:35: note: (near initialization for 'ddprefix_aa_ops')
   lib/dynamic_debug.c:935:5: warning: no previous prototype for '__dynamic_emit_prefix' [-Wmissing-prototypes]
     935 | int __dynamic_emit_prefix(struct _ddebug *desc, char *buf, int pos)
         |     ^~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function '__dynamic_emit_prefix':
>> lib/dynamic_debug.c:941:18: error: implicit declaration of function 'assoc_array_find' [-Werror=implicit-function-declaration]
     941 |         prefix = assoc_array_find(&ddebug_prefix_cache, &ddprefix_aa_ops, desc);
         |                  ^~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:941:16: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     941 |         prefix = assoc_array_find(&ddebug_prefix_cache, &ddprefix_aa_ops, desc);
         |                ^
>> lib/dynamic_debug.c:956:16: error: implicit declaration of function 'assoc_array_insert' [-Werror=implicit-function-declaration]
     956 |         edit = assoc_array_insert(&ddebug_prefix_cache, &ddprefix_aa_ops, desc, prefix);
         |                ^~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:956:14: warning: assignment to 'struct assoc_array_edit *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     956 |         edit = assoc_array_insert(&ddebug_prefix_cache, &ddprefix_aa_ops, desc, prefix);
         |              ^
>> lib/dynamic_debug.c:960:9: error: implicit declaration of function 'assoc_array_apply_edit' [-Werror=implicit-function-declaration]
     960 |         assoc_array_apply_edit(edit);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:918:37: error: storage size of 'ddprefix_aa_ops' isn't known
     918 | static const struct assoc_array_ops ddprefix_aa_ops = {
         |                                     ^~~~~~~~~~~~~~~
   lib/dynamic_debug.c:198:27: error: storage size of 'ddebug_prefix_cache' isn't known
     198 | static struct assoc_array ddebug_prefix_cache;
         |                           ^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:918:37: error: storage size of 'ddprefix_aa_ops' isn't known
     918 | static const struct assoc_array_ops ddprefix_aa_ops = {
         |                                     ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/assoc_array_delete +284 lib/dynamic_debug.c

   197	
 > 198	static struct assoc_array ddebug_prefix_cache;
   199	
   200	/*
   201	 * Search the tables for _ddebug's which match the given `query' and
   202	 * apply the `flags' and `mask' to them.  Returns number of matching
   203	 * callsites, normally the same as number of changes.  If verbose,
   204	 * logs the changes.  Takes ddebug_lock.
   205	 */
   206	static int ddebug_change(const struct ddebug_query *query,
   207				 struct flag_settings *modifiers)
   208	{
   209		int i;
   210		struct ddebug_table *dt;
   211		unsigned int newflags;
   212		unsigned int nfound = 0;
   213		struct flagsbuf fbuf, nbuf;
   214		struct ddebug_class_map *map = NULL;
   215		int __outvar valid_class;
   216	
   217		/* search for matching ddebugs */
   218		mutex_lock(&ddebug_lock);
   219		list_for_each_entry(dt, &ddebug_tables, link) {
   220	
   221			/* match against the module name */
   222			if (query->module &&
   223			    !match_wildcard(query->module, dt->mod_name))
   224				continue;
   225	
   226			if (query->class_string) {
   227				map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
   228				if (!map)
   229					continue;
   230			} else {
   231				/* constrain query, do not touch class'd callsites */
   232				valid_class = _DPRINTK_CLASS_DFLT;
   233			}
   234	
   235			for (i = 0; i < dt->num_ddebugs; i++) {
   236				struct _ddebug *dp = &dt->ddebugs[i];
   237	
   238				/* match site against query-class */
   239				if (dp->class_id != valid_class)
   240					continue;
   241	
   242				/* match against the source filename */
   243				if (query->filename &&
   244				    !match_wildcard(query->filename, dp->filename) &&
   245				    !match_wildcard(query->filename,
   246						   kbasename(dp->filename)) &&
   247				    !match_wildcard(query->filename,
   248						   trim_prefix(dp->filename)))
   249					continue;
   250	
   251				/* match against the function */
   252				if (query->function &&
   253				    !match_wildcard(query->function, dp->function))
   254					continue;
   255	
   256				/* match against the format */
   257				if (query->format) {
   258					if (*query->format == '^') {
   259						char *p;
   260						/* anchored search. match must be at beginning */
   261						p = strstr(dp->format, query->format+1);
   262						if (p != dp->format)
   263							continue;
   264					} else if (!strstr(dp->format, query->format))
   265						continue;
   266				}
   267	
   268				/* match against the line number range */
   269				if (query->first_lineno &&
   270				    dp->lineno < query->first_lineno)
   271					continue;
   272				if (query->last_lineno &&
   273				    dp->lineno > query->last_lineno)
   274					continue;
   275	
   276				nfound++;
   277	
   278				newflags = (dp->flags & modifiers->mask) | modifiers->flags;
   279				if (newflags == dp->flags)
   280					continue;
   281	
   282				if (dp->flags & _DPRINTK_FLAGS_PREFIX_CACHED) {
   283					v4pr_info("drop stale prefix\n");
 > 284					assoc_array_delete(&ddebug_prefix_cache, &ddprefix_aa_ops, dp);
   285				}
   286	#ifdef CONFIG_JUMP_LABEL
   287				if (dp->flags & _DPRINTK_FLAGS_PRINT) {
   288					if (!(newflags & _DPRINTK_FLAGS_PRINT))
   289						static_branch_disable(&dp->key.dd_key_true);
   290				} else if (newflags & _DPRINTK_FLAGS_PRINT) {
   291					static_branch_enable(&dp->key.dd_key_true);
   292				}
   293	#endif
   294				v4pr_info("changed %s:%d [%s]%s %s => %s\n",
   295					  trim_prefix(dp->filename), dp->lineno,
   296					  dt->mod_name, dp->function,
   297					  ddebug_describe_flags(dp->flags, &fbuf),
   298					  ddebug_describe_flags(newflags, &nbuf));
   299				dp->flags = newflags;
   300			}
   301		}
   302		mutex_unlock(&ddebug_lock);
   303	
   304		return nfound;
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
