Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA126738C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300974; cv=none; b=IEm0+34VHtXjHvtbleRkREvw4aLBWX7QDGnYZZV6mOkI04VgqGGz5IUD/Op/dlSHmFuGDyF+lYFa6EXh8i2t6w0EiluqKSKe7cV8Yl1NCMD+MTStBVuGfBMOJRY6tsErRP+DlFP6lK43hZJNV+Dta0SlCSJko7UWx97gPloT5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300974; c=relaxed/simple;
	bh=ztb+YSkmbBq5vs5xmSGhKgMxCyWLnhYpZstwKEf0GNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oFOku4TvMEUk1tH/xii4RWJbCxiGz7G/Z3GbwlHAlH8pSDCqHq5Qu95uNy7idJCJgvSjO+H952JsNZteqNrbIwW8J+7X05jUScT0jndFOOmxSw4IifvUpSc4IzGg2miZOOoA2+/MCk9j7YF8VY0yxc/HvSctT1/+B4Dm07pY7Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsiAoii4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsiAoii4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784300972; x=1815836972;
  h=date:from:to:cc:subject:message-id;
  bh=ztb+YSkmbBq5vs5xmSGhKgMxCyWLnhYpZstwKEf0GNg=;
  b=jsiAoii4X3AMPi/CAYNBv1RgfpGKwlHLLF1Vl6789gFrfnplYW4fooro
   Vkg1n9FWPpqv/y1xG+NeUHKFKyvFXyfOd33n5pBZjCYNNsjjlmvwCSYz+
   ruPAvgrWcdCeHD+WqTtjUJjlKQBTkJsV8Ekvl2XIcs6FDJOjkqPjcJu9r
   1YR64hfRr3nMPyAZJZxT6XYfCgmnvGhSs5iWLWJ3S3g7hrMhOSArQuhAW
   C93QYeQTnCA3ZgmuehLqxZd4HRATIa9Z0EHF1oakJjrKTwk2bsFid2Ws2
   /dAbVqkh6Gflttc3F3E8qwrbeLpsLH4zsNjf2IK0XeWzsqH/P2IhxP6XV
   g==;
X-CSE-ConnectionGUID: uJHqRSRPTpCxuoKnvQAPiA==
X-CSE-MsgGUID: mGbaNeYzTOy6v/bbXcWOrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84100361"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84100361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 08:09:31 -0700
X-CSE-ConnectionGUID: dAhHY/d0Rh+pRlHj7NueYQ==
X-CSE-MsgGUID: Xb6js2aiSUek/v9g1bQTGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="261776100"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2026 08:09:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkkBk-00000000SrQ-2vU0;
	Fri, 17 Jul 2026 15:09:22 +0000
Date: Fri, 17 Jul 2026 23:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/../security/keys/internal.h:109:8: error: unknown type name
 'key_ref_t'
Message-ID: <202607172309.ESjAtQk6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2a1505f4186ef01095fe97a2592cc058696bbfa8
commit: 7108d9d0e5f2ff1a531dd36714c68a330ba84823 [1/1] ANDROID: remove inclusions from hook definition headers
config: arm64-randconfig-004-20260717 (https://download.01.org/0day-ci/archive/20260717/202607172309.ESjAtQk6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172309.ESjAtQk6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172309.ESjAtQk6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/android/vendor_hooks.c:28:
>> include/../security/keys/internal.h:91:38: warning: 'struct keyring_index_key' declared inside parameter list will not be visible outside of this definition or declaration
      91 | extern void key_set_index_key(struct keyring_index_key *index_key);
         |                                      ^~~~~~~~~~~~~~~~~
   include/../security/keys/internal.h:96:20: warning: 'struct keyring_index_key' declared inside parameter list will not be visible outside of this definition or declaration
      96 |       const struct keyring_index_key *index_key);
         |                    ^~~~~~~~~~~~~~~~~
   include/../security/keys/internal.h:98:20: warning: 'struct keyring_index_key' declared inside parameter list will not be visible outside of this definition or declaration
      98 |       const struct keyring_index_key *index_key);
         |                    ^~~~~~~~~~~~~~~~~
>> include/../security/keys/internal.h:101:15: warning: 'struct assoc_array_edit' declared inside parameter list will not be visible outside of this definition or declaration
     101 |        struct assoc_array_edit **_edit);
         |               ^~~~~~~~~~~~~~~~
   include/../security/keys/internal.h:100:21: warning: 'struct keyring_index_key' declared inside parameter list will not be visible outside of this definition or declaration
     100 |        const struct keyring_index_key *index_key,
         |                     ^~~~~~~~~~~~~~~~~
   include/../security/keys/internal.h:104:17: warning: 'struct assoc_array_edit' declared inside parameter list will not be visible outside of this definition or declaration
     104 |          struct assoc_array_edit **_edit);
         |                 ^~~~~~~~~~~~~~~~
   include/../security/keys/internal.h:107:14: warning: 'struct assoc_array_edit' declared inside parameter list will not be visible outside of this definition or declaration
     107 |       struct assoc_array_edit *edit);
         |              ^~~~~~~~~~~~~~~~
   include/../security/keys/internal.h:106:20: warning: 'struct keyring_index_key' declared inside parameter list will not be visible outside of this definition or declaration
     106 |       const struct keyring_index_key *index_key,
         |                    ^~~~~~~~~~~~~~~~~
>> include/../security/keys/internal.h:109:8: error: unknown type name 'key_ref_t'
     109 | extern key_ref_t find_key_to_update(key_ref_t keyring_ref,
         |        ^~~~~~~~~
   include/../security/keys/internal.h:109:37: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?
     109 | extern key_ref_t find_key_to_update(key_ref_t keyring_ref,
         |                                     ^~~~~~~~~
         |                                     key_ref_put
>> include/../security/keys/internal.h:120:27: error: field 'index_key' has incomplete type
     120 |  struct keyring_index_key index_key;
         |                           ^~~~~~~~~
>> include/../security/keys/internal.h:122:24: error: field 'match_data' has incomplete type
     122 |  struct key_match_data match_data;
         |                        ^~~~~~~~~~
   include/../security/keys/internal.h:137:2: error: unknown type name 'key_ref_t'
     137 |  key_ref_t  result;
         |  ^~~~~~~~~
   include/../security/keys/internal.h:143:8: error: unknown type name 'key_ref_t'
     143 | extern key_ref_t keyring_search_rcu(key_ref_t keyring_ref,
         |        ^~~~~~~~~
   include/../security/keys/internal.h:143:37: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?
     143 | extern key_ref_t keyring_search_rcu(key_ref_t keyring_ref,
         |                                     ^~~~~~~~~
         |                                     key_ref_put
   include/../security/keys/internal.h:146:8: error: unknown type name 'key_ref_t'
     146 | extern key_ref_t search_cred_keyrings_rcu(struct keyring_search_context *ctx);
         |        ^~~~~~~~~
   include/../security/keys/internal.h:147:8: error: unknown type name 'key_ref_t'
     147 | extern key_ref_t search_process_keyrings_rcu(struct keyring_search_context *ctx);
         |        ^~~~~~~~~
>> include/../security/keys/internal.h:159:13: warning: 'struct key_tag' declared inside parameter list will not be visible outside of this definition or declaration
     159 |      struct key_tag *domain_tag,
         |             ^~~~~~~
   include/../security/keys/internal.h:183:38: error: unknown type name 'key_ref_t'
     183 | extern int key_task_permission(const key_ref_t key_ref,
         |                                      ^~~~~~~~~
>> include/../security/keys/internal.h:185:16: warning: 'enum key_need_perm' declared inside parameter list will not be visible outside of this definition or declaration
     185 |           enum key_need_perm need_perm);
         |                ^~~~~~~~~~~~~
   include/../security/keys/internal.h:207:40: error: unknown type name 'key_ref_t'
     207 | static inline int key_permission(const key_ref_t key_ref,
         |                                        ^~~~~~~~~
   include/../security/keys/internal.h:208:11: warning: 'enum key_need_perm' declared inside parameter list will not be visible outside of this definition or declaration
     208 |      enum key_need_perm need_perm)
         |           ^~~~~~~~~~~~~
>> include/../security/keys/internal.h:208:25: error: parameter 2 ('need_perm') has incomplete type
     208 |      enum key_need_perm need_perm)
         |      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/../security/keys/internal.h:207:19: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     207 | static inline int key_permission(const key_ref_t key_ref,
         |                   ^~~~~~~~~~~~~~
   include/../security/keys/internal.h: In function 'key_permission':
>> include/../security/keys/internal.h:210:54: error: type of formal parameter 3 is incomplete
     210 |  return key_task_permission(key_ref, current_cred(), need_perm);
         |                                                      ^~~~~~~~~
   include/../security/keys/internal.h: In function 'key_is_dead':
>> include/../security/keys/internal.h:228:6: error: dereferencing pointer to incomplete type 'const struct key'
     228 |   key->flags & ((1 << KEY_FLAG_DEAD) |
         |      ^~
>> include/../security/keys/internal.h:228:23: error: 'KEY_FLAG_DEAD' undeclared (first use in this function); did you mean 'QUEUE_FLAG_DEAD'?
     228 |   key->flags & ((1 << KEY_FLAG_DEAD) |
         |                       ^~~~~~~~~~~~~
         |                       QUEUE_FLAG_DEAD
   include/../security/keys/internal.h:228:23: note: each undeclared identifier is reported only once for each function it appears in
>> include/../security/keys/internal.h:229:16: error: 'KEY_FLAG_INVALIDATED' undeclared (first use in this function); did you mean 'KEYCTL_INVALIDATE'?
     229 |          (1 << KEY_FLAG_INVALIDATED)) ||
         |                ^~~~~~~~~~~~~~~~~~~~
         |                KEYCTL_INVALIDATE
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/suspend.h:26,
                    from drivers/android/vendor_hooks.c:98:
   At top level:
   include/trace/trace_events.h:27:23: warning: 'str__suspend__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/pci.h:24,
                    from drivers/android/vendor_hooks.c:97:
   include/trace/trace_events.h:27:23: warning: 'str__pci__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/gup.h:33,
                    from drivers/android/vendor_hooks.c:96:
   include/trace/trace_events.h:27:23: warning: 'str__gup__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/snd_compr.h:23,
                    from drivers/android/vendor_hooks.c:95:
   include/trace/trace_events.h:27:23: warning: 'str__snd_compr__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/sound.h:19,
                    from drivers/android/vendor_hooks.c:94:
   include/trace/trace_events.h:27:23: warning: 'str__sound__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/ipv6.h:21,
                    from drivers/android/vendor_hooks.c:93:
   include/trace/trace_events.h:27:23: warning: 'str__ipv6__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/key_ref_t +109 include/../security/keys/internal.h

^1da177e4c3f41 Linus Torvalds 2005-04-16   90  
355ef8e1588502 David Howells  2019-06-26  @91  extern void key_set_index_key(struct keyring_index_key *index_key);
e9e349b051d987 David Howells  2008-11-14   92  extern struct key_type *key_type_lookup(const char *type);
e9e349b051d987 David Howells  2008-11-14   93  extern void key_type_put(struct key_type *ktype);
e9e349b051d987 David Howells  2008-11-14   94  
df593ee23e05cd David Howells  2019-05-30   95  extern int __key_link_lock(struct key *keyring,
df593ee23e05cd David Howells  2019-05-30   96  			   const struct keyring_index_key *index_key);
ed0ac5c7ec3763 David Howells  2019-05-20   97  extern int __key_move_lock(struct key *l_keyring, struct key *u_keyring,
ed0ac5c7ec3763 David Howells  2019-05-20   98  			   const struct keyring_index_key *index_key);
f70e2e06196ad4 David Howells  2010-04-30   99  extern int __key_link_begin(struct key *keyring,
16feef4340172b David Howells  2013-09-24  100  			    const struct keyring_index_key *index_key,
b2a4df200d570b David Howells  2013-09-24 @101  			    struct assoc_array_edit **_edit);
f70e2e06196ad4 David Howells  2010-04-30  102  extern int __key_link_check_live_key(struct key *keyring, struct key *key);
f7e47677e39a03 David Howells  2020-01-14  103  extern void __key_link(struct key *keyring, struct key *key,
f7e47677e39a03 David Howells  2020-01-14  104  		       struct assoc_array_edit **_edit);
f70e2e06196ad4 David Howells  2010-04-30  105  extern void __key_link_end(struct key *keyring,
16feef4340172b David Howells  2013-09-24  106  			   const struct keyring_index_key *index_key,
b2a4df200d570b David Howells  2013-09-24  107  			   struct assoc_array_edit *edit);
^1da177e4c3f41 Linus Torvalds 2005-04-16  108  
b2a4df200d570b David Howells  2013-09-24 @109  extern key_ref_t find_key_to_update(key_ref_t keyring_ref,
e57e8669f2ab83 David Howells  2013-09-24  110  				    const struct keyring_index_key *index_key);
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  
3e30148c3d524a David Howells  2005-06-23  112  extern struct key *keyring_search_instkey(struct key *keyring,
3e30148c3d524a David Howells  2005-06-23  113  					  key_serial_t target_id);
3e30148c3d524a David Howells  2005-06-23  114  
b2a4df200d570b David Howells  2013-09-24  115  extern int iterate_over_keyring(const struct key *keyring,
b2a4df200d570b David Howells  2013-09-24  116  				int (*func)(const struct key *key, void *data),
b2a4df200d570b David Howells  2013-09-24  117  				void *data);
b2a4df200d570b David Howells  2013-09-24  118  
4bdf0bc3003141 David Howells  2013-09-24  119  struct keyring_search_context {
4bdf0bc3003141 David Howells  2013-09-24 @120  	struct keyring_index_key index_key;
4bdf0bc3003141 David Howells  2013-09-24  121  	const struct cred	*cred;
462919591a1791 David Howells  2014-09-16 @122  	struct key_match_data	match_data;
4bdf0bc3003141 David Howells  2013-09-24  123  	unsigned		flags;
614d8c39014c18 David Howells  2014-09-16  124  #define KEYRING_SEARCH_NO_STATE_CHECK	0x0001	/* Skip state checks */
614d8c39014c18 David Howells  2014-09-16  125  #define KEYRING_SEARCH_DO_STATE_CHECK	0x0002	/* Override NO_STATE_CHECK */
614d8c39014c18 David Howells  2014-09-16  126  #define KEYRING_SEARCH_NO_UPDATE_TIME	0x0004	/* Don't update times */
614d8c39014c18 David Howells  2014-09-16  127  #define KEYRING_SEARCH_NO_CHECK_PERM	0x0008	/* Don't check permissions */
614d8c39014c18 David Howells  2014-09-16  128  #define KEYRING_SEARCH_DETECT_TOO_DEEP	0x0010	/* Give an error on excessive depth */
0b0a84154eff56 David Howells  2014-12-01  129  #define KEYRING_SEARCH_SKIP_EXPIRED	0x0020	/* Ignore expired keys (intention to replace) */
dcf49dbc8077e2 David Howells  2019-06-26  130  #define KEYRING_SEARCH_RECURSE		0x0040	/* Search child keyrings also */
4bdf0bc3003141 David Howells  2013-09-24  131  
b2a4df200d570b David Howells  2013-09-24  132  	int (*iterator)(const void *object, void *iterator_data);
b2a4df200d570b David Howells  2013-09-24  133  
4bdf0bc3003141 David Howells  2013-09-24  134  	/* Internal stuff */
4bdf0bc3003141 David Howells  2013-09-24  135  	int			skipped_ret;
4bdf0bc3003141 David Howells  2013-09-24  136  	bool			possessed;
4bdf0bc3003141 David Howells  2013-09-24  137  	key_ref_t		result;
074d58989569b3 Baolin Wang    2017-11-15  138  	time64_t		now;
4bdf0bc3003141 David Howells  2013-09-24  139  };
4bdf0bc3003141 David Howells  2013-09-24  140  
0c903ab64feb0f David Howells  2014-09-16  141  extern bool key_default_cmp(const struct key *key,
c06cfb08b88dfb David Howells  2014-09-16  142  			    const struct key_match_data *match_data);
e59428f721ee09 David Howells  2019-06-19  143  extern key_ref_t keyring_search_rcu(key_ref_t keyring_ref,
4bdf0bc3003141 David Howells  2013-09-24  144  				    struct keyring_search_context *ctx);
4bdf0bc3003141 David Howells  2013-09-24  145  
e59428f721ee09 David Howells  2019-06-19  146  extern key_ref_t search_cred_keyrings_rcu(struct keyring_search_context *ctx);
e59428f721ee09 David Howells  2019-06-19  147  extern key_ref_t search_process_keyrings_rcu(struct keyring_search_context *ctx);
^1da177e4c3f41 Linus Torvalds 2005-04-16  148  
237bbd29f7a049 Eric Biggers   2017-09-18  149  extern struct key *find_keyring_by_name(const char *name, bool uid_keyring);
^1da177e4c3f41 Linus Torvalds 2005-04-16  150  
0f44e4d976f96c David Howells  2019-06-26  151  extern int look_up_user_keyrings(struct key **, struct key **);
0f44e4d976f96c David Howells  2019-06-26  152  extern struct key *get_user_session_keyring_rcu(const struct cred *);
d84f4f992cbd76 David Howells  2008-11-14  153  extern int install_thread_keyring_to_cred(struct cred *);
d84f4f992cbd76 David Howells  2008-11-14  154  extern int install_process_keyring_to_cred(struct cred *);
685bfd2c48bb32 Oleg Nesterov  2010-05-26  155  extern int install_session_keyring_to_cred(struct cred *, struct key *);
3e30148c3d524a David Howells  2005-06-23  156  
3e30148c3d524a David Howells  2005-06-23  157  extern struct key *request_key_and_link(struct key_type *type,
3e30148c3d524a David Howells  2005-06-23  158  					const char *description,
a58946c158a040 David Howells  2019-06-26 @159  					struct key_tag *domain_tag,
4a38e122e2cc62 David Howells  2008-04-29  160  					const void *callout_info,
4a38e122e2cc62 David Howells  2008-04-29  161  					size_t callout_len,
4e54f08543d05e David Howells  2006-06-29  162  					void *aux,
7e047ef5fe2d52 David Howells  2006-06-26  163  					struct key *dest_keyring,
7e047ef5fe2d52 David Howells  2006-06-26  164  					unsigned long flags);
3e30148c3d524a David Howells  2005-06-23  165  
0c903ab64feb0f David Howells  2014-09-16  166  extern bool lookup_user_key_possessed(const struct key *key,
462919591a1791 David Howells  2014-09-16  167  				      const struct key_match_data *match_data);
5593122eec26b0 David Howells  2009-09-02  168  #define KEY_LOOKUP_CREATE	0x01
5593122eec26b0 David Howells  2009-09-02  169  #define KEY_LOOKUP_PARTIAL	0x02
e9e349b051d987 David Howells  2008-11-14  170  
e9e349b051d987 David Howells  2008-11-14  171  extern long join_session_keyring(const char *name);
67d1214551e800 Al Viro        2012-06-27  172  extern void key_change_session_keyring(struct callback_head *twork);
e9e349b051d987 David Howells  2008-11-14  173  
0c061b5707ab84 David Howells  2011-08-22  174  extern struct work_struct key_gc_work;
5d135440faf7db David Howells  2009-09-02  175  extern unsigned key_gc_delay;
074d58989569b3 Baolin Wang    2017-11-15  176  extern void keyring_gc(struct key *keyring, time64_t limit);
2b6aa412ff23a0 Mat Martineau  2016-08-31  177  extern void keyring_restriction_gc(struct key *keyring,
2b6aa412ff23a0 Mat Martineau  2016-08-31  178  				   struct key_type *dead_type);
074d58989569b3 Baolin Wang    2017-11-15  179  extern void key_schedule_gc(time64_t gc_at);
fd75815f727f15 David Howells  2012-05-11  180  extern void key_schedule_gc_links(void);
0c061b5707ab84 David Howells  2011-08-22  181  extern void key_gc_keytype(struct key_type *ktype);
5d135440faf7db David Howells  2009-09-02  182  
e9e349b051d987 David Howells  2008-11-14  183  extern int key_task_permission(const key_ref_t key_ref,
d84f4f992cbd76 David Howells  2008-11-14  184  			       const struct cred *cred,
8c0637e950d689 David Howells  2020-05-12 @185  			       enum key_need_perm need_perm);
e9e349b051d987 David Howells  2008-11-14  186  
f7e47677e39a03 David Howells  2020-01-14  187  static inline void notify_key(struct key *key,
f7e47677e39a03 David Howells  2020-01-14  188  			      enum key_notification_subtype subtype, u32 aux)
f7e47677e39a03 David Howells  2020-01-14  189  {
f7e47677e39a03 David Howells  2020-01-14  190  #ifdef CONFIG_KEY_NOTIFICATIONS
f7e47677e39a03 David Howells  2020-01-14  191  	struct key_notification n = {
f7e47677e39a03 David Howells  2020-01-14  192  		.watch.type	= WATCH_TYPE_KEY_NOTIFY,
f7e47677e39a03 David Howells  2020-01-14  193  		.watch.subtype	= subtype,
f7e47677e39a03 David Howells  2020-01-14  194  		.watch.info	= watch_sizeof(n),
f7e47677e39a03 David Howells  2020-01-14  195  		.key_id		= key_serial(key),
f7e47677e39a03 David Howells  2020-01-14  196  		.aux		= aux,
f7e47677e39a03 David Howells  2020-01-14  197  	};
f7e47677e39a03 David Howells  2020-01-14  198  
f7e47677e39a03 David Howells  2020-01-14  199  	post_watch_notification(key->watchers, &n.watch, current_cred(),
f7e47677e39a03 David Howells  2020-01-14  200  				n.key_id);
f7e47677e39a03 David Howells  2020-01-14  201  #endif
f7e47677e39a03 David Howells  2020-01-14  202  }
e9e349b051d987 David Howells  2008-11-14  203  
973c9f4f49ca96 David Howells  2011-01-20  204  /*
973c9f4f49ca96 David Howells  2011-01-20  205   * Check to see whether permission is granted to use a key in the desired way.
973c9f4f49ca96 David Howells  2011-01-20  206   */
8c0637e950d689 David Howells  2020-05-12 @207  static inline int key_permission(const key_ref_t key_ref,
8c0637e950d689 David Howells  2020-05-12 @208  				 enum key_need_perm need_perm)
e9e349b051d987 David Howells  2008-11-14  209  {
8c0637e950d689 David Howells  2020-05-12 @210  	return key_task_permission(key_ref, current_cred(), need_perm);
e9e349b051d987 David Howells  2008-11-14  211  }
e9e349b051d987 David Howells  2008-11-14  212  
3e30148c3d524a David Howells  2005-06-23  213  extern struct key_type key_type_request_key_auth;
3e30148c3d524a David Howells  2005-06-23  214  extern struct key *request_key_auth_new(struct key *target,
822ad64d7e46a8 David Howells  2019-02-14  215  					const char *op,
4a38e122e2cc62 David Howells  2008-04-29  216  					const void *callout_info,
8bbf4976b59fc9 David Howells  2008-11-14  217  					size_t callout_len,
8bbf4976b59fc9 David Howells  2008-11-14  218  					struct key *dest_keyring);
3e30148c3d524a David Howells  2005-06-23  219  
3e30148c3d524a David Howells  2005-06-23  220  extern struct key *key_get_instantiation_authkey(key_serial_t target_id);
^1da177e4c3f41 Linus Torvalds 2005-04-16  221  
fd75815f727f15 David Howells  2012-05-11  222  /*
fd75815f727f15 David Howells  2012-05-11  223   * Determine whether a key is dead.
fd75815f727f15 David Howells  2012-05-11  224   */
074d58989569b3 Baolin Wang    2017-11-15  225  static inline bool key_is_dead(const struct key *key, time64_t limit)
fd75815f727f15 David Howells  2012-05-11  226  {
fd75815f727f15 David Howells  2012-05-11  227  	return
fd75815f727f15 David Howells  2012-05-11 @228  		key->flags & ((1 << KEY_FLAG_DEAD) |
fd75815f727f15 David Howells  2012-05-11 @229  			      (1 << KEY_FLAG_INVALIDATED)) ||
218e6424e711ce David Howells  2019-06-26  230  		(key->expiry > 0 && key->expiry <= limit) ||
218e6424e711ce David Howells  2019-06-26  231  		key->domain_tag->removed;
fd75815f727f15 David Howells  2012-05-11  232  }
fd75815f727f15 David Howells  2012-05-11  233  

:::::: The code at line 109 was first introduced by commit
:::::: b2a4df200d570b2c33a57e1ebfa5896e4bc81b69 KEYS: Expand the capacity of a keyring

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
