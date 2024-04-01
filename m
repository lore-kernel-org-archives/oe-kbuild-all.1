Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3E537F7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712005372; cv=none; b=kbt+Ycef1YWZcFc1l/YXFZzFRuS+S8K2o6ropbb4rySbGbKZ2HJHCdh8rS1wKravCnQTOAIkitwHHmfhkvVqn4VqH2zRHX7yIgfbHdh9nyM9l6re1DCAOKhkf2OpRrq10lfpreGaNKHYl2XOYqr77E7P92gaRPBN/NFLRkZgV/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712005372; c=relaxed/simple;
	bh=+FzHQfjWPFRVW1psdJPosS3T2VY3uxPNKVuQZRV5zhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KT9BX9QQ4h/NnJvKM+A2CA6gL3F5robCmwk0pxRJd/RORjLDooHUWP+uAcZUGxvp8Eoey0v5Tjt98qV+VJJYD1qrW/QPbPkD0DBi//YAlYOsXW0yS+CeGHTQ2FtU9KbQDVjZm+5j1buhlpmKGHwzVGMk4XSgzsJiORw3gkbQNHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrNgyWPf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrNgyWPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712005370; x=1743541370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+FzHQfjWPFRVW1psdJPosS3T2VY3uxPNKVuQZRV5zhk=;
  b=CrNgyWPf5EyDc/rEWl4QkYKFDGNawo5mOSyX5a5WEkkrsvRWPpaqm73v
   gIlonov8KhP1dSG1BdSSpHb2+ikJq9uUet4tHeS33IwjpSfRyoEhQ1PFy
   re81rr06/bZurdmuM6FsP9SROBkyZ62vJjmf48m/GBlCywpI6ljfYa9/f
   BG7CmTywYYRm3Dpa+0Y/9oNKdeOfpk4gYO+6zCIODA5rApjFRcUSKSuW/
   2Da8oQyKSQPddFUdtyZ4oFy6eERitAXOBDE0vVqjdc0nVfVh3OlNVR94I
   UYlWbCeSjpE8UpwTFJTPDGdSJKcw+ySNITuWAHxWYxeed7b9H+PK+I6hh
   w==;
X-CSE-ConnectionGUID: 3ixQy0SSS0OA2zy9TZL8fw==
X-CSE-MsgGUID: Mr2teZJYTSCYszuCwFXNiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7014467"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7014467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 14:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="48834641"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Apr 2024 14:02:47 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrOnk-0000ck-2M;
	Mon, 01 Apr 2024 21:02:44 +0000
Date: Tue, 2 Apr 2024 05:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3084/29526]
 include/keys/asymmetric-type.h:72:12: error: dereferencing pointer to
 incomplete type 'const struct key'
Message-ID: <202404020454.GICJ8HTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   66f4b04cb0729788a2bd2a078d5ede30c2bf54c2
commit: 1be052b20ba04b635cf87bcff80de5314697953e [3084/29526] ANDROID: Initial commit of Incremental FS
config: i386-buildonly-randconfig-003-20240402 (https://download.01.org/0day-ci/archive/20240402/202404020454.GICJ8HTM-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404020454.GICJ8HTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020454.GICJ8HTM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/x509_parser.h:10:0,
                    from crypto/asymmetric_keys/x509_cert_parser.c:15:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
>> include/keys/asymmetric-type.h:72:12: error: dereferencing pointer to incomplete type 'const struct key'
     return key->payload.data[asym_key_ids];
               ^~
--
   In file included from include/keys/asymmetric-subtype.h:14:0,
                    from crypto/asymmetric_keys/x509_public_key.c:12:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
>> include/keys/asymmetric-type.h:72:12: error: dereferencing pointer to incomplete type 'const struct key'
     return key->payload.data[asym_key_ids];
               ^~
   In file included from crypto/asymmetric_keys/x509_public_key.c:13:0:
   include/keys/asymmetric-parser.h: At top level:
   include/keys/asymmetric-parser.h:27:22: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
     int (*parse)(struct key_preparsed_payload *prep);
                         ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/x509_public_key.c:156:37: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
    static int x509_key_preparse(struct key_preparsed_payload *prep)
                                        ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/x509_public_key.c: In function 'x509_key_preparse':
>> crypto/asymmetric_keys/x509_public_key.c:165:29: error: dereferencing pointer to incomplete type 'struct key_preparsed_payload'
     cert = x509_cert_parse(prep->data, prep->datalen);
                                ^~
   crypto/asymmetric_keys/x509_public_key.c: At top level:
>> crypto/asymmetric_keys/x509_public_key.c:249:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .parse = x509_key_preparse,
              ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/x509_public_key.c:249:11: note: (near initialization for 'x509_key_parser.parse')
   cc1: some warnings being treated as errors
--
   In file included from include/keys/asymmetric-subtype.h:14:0,
                    from crypto/asymmetric_keys/signature.c:11:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
>> include/keys/asymmetric-type.h:72:12: error: dereferencing pointer to incomplete type 'const struct key'
     return key->payload.data[asym_key_ids];
               ^~
   crypto/asymmetric_keys/signature.c: In function 'query_asymmetric_key':
>> crypto/asymmetric_keys/signature.c:51:9: error: dereferencing pointer to incomplete type 'struct key'
     if (key->type != &key_type_asymmetric)
            ^~
   In file included from crypto/asymmetric_keys/signature.c:11:0:
   include/keys/asymmetric-subtype.h: In function 'asymmetric_key_subtype':
   include/keys/asymmetric-subtype.h:58:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
--
   In file included from crypto/asymmetric_keys/asymmetric_keys.h:8:0,
                    from crypto/asymmetric_keys/restrict.c:13:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
>> include/keys/asymmetric-type.h:72:12: error: dereferencing pointer to incomplete type 'const struct key'
     return key->payload.data[asym_key_ids];
               ^~
   crypto/asymmetric_keys/restrict.c: In function 'restrict_link_by_signature':
>> crypto/asymmetric_keys/restrict.c:87:15: error: dereferencing pointer to incomplete type 'const union key_payload'
     sig = payload->data[asym_auth];
                  ^~
   crypto/asymmetric_keys/restrict.c:103:36: error: 'KEY_FLAG_BUILTIN' undeclared (first use in this function); did you mean 'KEYCTL_UNLINK'?
     if (use_builtin_keys && !test_bit(KEY_FLAG_BUILTIN, &key->flags))
                                       ^~~~~~~~~~~~~~~~
                                       KEYCTL_UNLINK
   crypto/asymmetric_keys/restrict.c:103:36: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/asymmetric_keys/restrict.c:103:58: error: dereferencing pointer to incomplete type 'struct key'
     if (use_builtin_keys && !test_bit(KEY_FLAG_BUILTIN, &key->flags))
                                                             ^~
   crypto/asymmetric_keys/restrict.c: In function 'key_or_keyring_common':
   crypto/asymmetric_keys/restrict.c:131:34: error: 'key_type_keyring' undeclared (first use in this function); did you mean 'dest_keyring'?
     else if (dest_keyring->type != &key_type_keyring)
                                     ^~~~~~~~~~~~~~~~
                                     dest_keyring
   crypto/asymmetric_keys/restrict.c:180:12: error: implicit declaration of function '__key_get'; did you mean 'key_get'? [-Werror=implicit-function-declaration]
         key = __key_get(trusted);
               ^~~~~~~~~
               key_get
>> crypto/asymmetric_keys/restrict.c:180:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
         key = __key_get(trusted);
             ^
   crypto/asymmetric_keys/restrict.c:186:9: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
        key = __key_get(trusted);
            ^
   cc1: some warnings being treated as errors
--
   In file included from include/keys/asymmetric-subtype.h:14:0,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
>> include/keys/asymmetric-type.h:72:12: error: dereferencing pointer to incomplete type 'const struct key'
     return key->payload.data[asym_key_ids];
               ^~
   In file included from crypto/asymmetric_keys/asymmetric_type.c:10:0:
   include/keys/asymmetric-parser.h: At top level:
   include/keys/asymmetric-parser.h:27:22: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
     int (*parse)(struct key_preparsed_payload *prep);
                         ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'find_asymmetric_key':
   crypto/asymmetric_keys/asymmetric_type.c:52:2: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?
     key_ref_t ref;
     ^~~~~~~~~
     key_ref_put
   crypto/asymmetric_keys/asymmetric_type.c:85:8: error: implicit declaration of function 'keyring_search'; did you mean 'groups_search'? [-Werror=implicit-function-declaration]
     ref = keyring_search(make_key_ref(keyring, 1),
           ^~~~~~~~~~~~~~
           groups_search
   crypto/asymmetric_keys/asymmetric_type.c:87:13: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
     if (IS_ERR(ref))
                ^~~
   In file included from arch/x86/include/asm/processor.h:32:0,
                    from include/linux/mutex.h:19,
                    from include/linux/seq_file.h:8,
                    from include/keys/asymmetric-subtype.h:13,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   include/linux/err.h:34:33: note: expected 'const void *' but argument is of type 'int'
    static inline bool __must_check IS_ERR(__force const void *ptr)
                                    ^~~~~~
   In file included from include/linux/kernel.h:15:0,
                    from include/asm-generic/bug.h:19,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/seq_file.h:7,
                    from include/keys/asymmetric-subtype.h:13,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   crypto/asymmetric_keys/asymmetric_type.c:88:59: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
      pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
                                                              ^
   include/linux/printk.h:137:17: note: in definition of macro 'no_printk'
      printk(fmt, ##__VA_ARGS__);  \
                    ^~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:88:3: note: in expansion of macro 'pr_debug'
      pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
      ^~~~~~~~
   In file included from arch/x86/include/asm/processor.h:32:0,
                    from include/linux/mutex.h:19,
                    from include/linux/seq_file.h:8,
                    from include/keys/asymmetric-subtype.h:13,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   include/linux/err.h:29:33: note: expected 'const void *' but argument is of type 'int'
    static inline long __must_check PTR_ERR(__force const void *ptr)
                                    ^~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:91:13: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
     if (IS_ERR(ref)) {
                ^~~
   In file included from arch/x86/include/asm/processor.h:32:0,
                    from include/linux/mutex.h:19,
                    from include/linux/seq_file.h:8,
                    from include/keys/asymmetric-subtype.h:13,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   include/linux/err.h:34:33: note: expected 'const void *' but argument is of type 'int'
    static inline bool __must_check IS_ERR(__force const void *ptr)
                                    ^~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:92:19: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
      switch (PTR_ERR(ref)) {
                      ^~~
   In file included from arch/x86/include/asm/processor.h:32:0,
                    from include/linux/mutex.h:19,
                    from include/linux/seq_file.h:8,
                    from include/keys/asymmetric-subtype.h:13,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   include/linux/err.h:29:33: note: expected 'const void *' but argument is of type 'int'
    static inline long __must_check PTR_ERR(__force const void *ptr)
                                    ^~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:99:20: warning: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
       return ERR_CAST(ref);
                       ^~~
   In file included from arch/x86/include/asm/processor.h:32:0,
                    from include/linux/mutex.h:19,
                    from include/linux/seq_file.h:8,
                    from include/keys/asymmetric-subtype.h:13,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   include/linux/err.h:51:35: note: expected 'const void *' but argument is of type 'int'
    static inline void * __must_check ERR_CAST(__force const void *ptr)
                                      ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:248:24: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
              const struct key_match_data *match_data)
                           ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_cmp':
>> crypto/asymmetric_keys/asymmetric_type.c:251:55: error: dereferencing pointer to incomplete type 'const struct key_match_data'
     const struct asymmetric_key_id *match_id = match_data->preparsed;
                                                          ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:261:25: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
               const struct key_match_data *match_data)
                            ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_cmp_partial':
   crypto/asymmetric_keys/asymmetric_type.c:264:55: error: dereferencing pointer to incomplete type 'const struct key_match_data'
     const struct asymmetric_key_id *match_id = match_data->preparsed;
                                                          ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:283:49: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
    static int asymmetric_key_match_preparse(struct key_match_data *match_data)
                                                    ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_match_preparse':
>> crypto/asymmetric_keys/asymmetric_type.c:286:31: error: dereferencing pointer to incomplete type 'struct key_match_data'
     const char *spec = match_data->raw_data;
                                  ^~
>> crypto/asymmetric_keys/asymmetric_type.c:289:3: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
      asymmetric_key_cmp;
      ^~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:297:7: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
      cmp = asymmetric_key_cmp_partial;
          ^
   crypto/asymmetric_keys/asymmetric_type.c:312:28: error: 'KEYRING_SEARCH_LOOKUP_ITERATE' undeclared (first use in this function)
     match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:312:28: note: each undeclared identifier is reported only once for each function it appears in
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:322:46: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
    static void asymmetric_key_match_free(struct key_match_data *match_data)
                                                 ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_match_free':
   crypto/asymmetric_keys/asymmetric_type.c:324:18: error: dereferencing pointer to incomplete type 'struct key_match_data'
     kfree(match_data->preparsed);
                     ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:369:43: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
    static int asymmetric_key_preparse(struct key_preparsed_payload *prep)
                                              ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_preparse':
>> crypto/asymmetric_keys/asymmetric_type.c:376:10: error: dereferencing pointer to incomplete type 'struct key_preparsed_payload'
     if (prep->datalen == 0)
             ^~
   crypto/asymmetric_keys/asymmetric_type.c:385:23: error: passing argument 1 of 'parser->parse' from incompatible pointer type [-Werror=incompatible-pointer-types]
      ret = parser->parse(prep);
                          ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:385:23: note: expected 'struct key_preparsed_payload *' but argument is of type 'struct key_preparsed_payload *'
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:415:49: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
    static void asymmetric_key_free_preparse(struct key_preparsed_payload *prep)
                                                    ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_free_preparse':
   crypto/asymmetric_keys/asymmetric_type.c:417:47: error: dereferencing pointer to incomplete type 'struct key_preparsed_payload'
     struct asymmetric_key_subtype *subtype = prep->payload.data[asym_subtype];
                                                  ^~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_destroy':
>> crypto/asymmetric_keys/asymmetric_type.c:437:39: error: dereferencing pointer to incomplete type 'struct key'
     struct asymmetric_key_ids *kids = key->payload.data[asym_key_ids];
                                          ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:455:2: error: unknown type name 'key_restrict_link_func_t'
     key_restrict_link_func_t check,
     ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_lookup_restriction':
   crypto/asymmetric_keys/asymmetric_type.c:483:10: error: implicit declaration of function 'asymmetric_restriction_alloc'; did you mean 'asymmetric_lookup_restriction'? [-Werror=implicit-function-declaration]
      return asymmetric_restriction_alloc(
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
             asymmetric_lookup_restriction
   In file included from crypto/asymmetric_keys/asymmetric_type.c:16:0:
   include/keys/system_keyring.h:21:42: error: 'restrict_link_reject' undeclared (first use in this function); did you mean 'restrict_method'?
    #define restrict_link_by_builtin_trusted restrict_link_reject
                                             ^
   crypto/asymmetric_keys/asymmetric_type.c:484:4: note: in expansion of macro 'restrict_link_by_builtin_trusted'
       restrict_link_by_builtin_trusted, NULL);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:501:3: error: unknown type name 'key_restrict_link_func_t'
      key_restrict_link_func_t link_fn =
      ^~~~~~~~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:502:4: warning: initialization makes integer from pointer without a cast [-Wint-conversion]
       restrict_link_by_key_or_keyring;
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:511:12: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
       link_fn = restrict_link_by_key_or_keyring_chain;
               ^
   crypto/asymmetric_keys/asymmetric_type.c:521:10: error: implicit declaration of function 'key_lookup'; did you mean '__d_lookup'? [-Werror=implicit-function-declaration]
       key = key_lookup(serial);
             ^~~~~~~~~~
             __d_lookup
>> crypto/asymmetric_keys/asymmetric_type.c:521:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
       key = key_lookup(serial);
           ^
   crypto/asymmetric_keys/asymmetric_type.c:528:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      ret = asymmetric_restriction_alloc(link_fn, key);
          ^
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:577:8: error: variable 'key_type_asymmetric' has initializer but incomplete type
    struct key_type key_type_asymmetric = {
           ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:578:3: error: 'struct key_type' has no member named 'name'
     .name   = "asymmetric",
      ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:578:12: warning: excess elements in struct initializer
     .name   = "asymmetric",
               ^~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:578:12: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:579:3: error: 'struct key_type' has no member named 'preparse'
     .preparse  = asymmetric_key_preparse,
      ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:579:15: warning: excess elements in struct initializer
     .preparse  = asymmetric_key_preparse,
                  ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:579:15: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:580:3: error: 'struct key_type' has no member named 'free_preparse'
     .free_preparse  = asymmetric_key_free_preparse,
      ^~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:580:20: warning: excess elements in struct initializer
     .free_preparse  = asymmetric_key_free_preparse,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:580:20: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:581:3: error: 'struct key_type' has no member named 'instantiate'
     .instantiate  = generic_key_instantiate,
      ^~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:581:18: error: 'generic_key_instantiate' undeclared here (not in a function); did you mean 'generic_fillattr'?
     .instantiate  = generic_key_instantiate,
                     ^~~~~~~~~~~~~~~~~~~~~~~
                     generic_fillattr
   crypto/asymmetric_keys/asymmetric_type.c:581:18: warning: excess elements in struct initializer
   crypto/asymmetric_keys/asymmetric_type.c:581:18: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:582:3: error: 'struct key_type' has no member named 'match_preparse'
     .match_preparse  = asymmetric_key_match_preparse,
      ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:582:21: warning: excess elements in struct initializer
     .match_preparse  = asymmetric_key_match_preparse,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:582:21: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:583:3: error: 'struct key_type' has no member named 'match_free'
     .match_free  = asymmetric_key_match_free,
      ^~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:583:17: warning: excess elements in struct initializer
     .match_free  = asymmetric_key_match_free,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:583:17: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:584:3: error: 'struct key_type' has no member named 'destroy'
     .destroy  = asymmetric_key_destroy,
      ^~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:584:14: warning: excess elements in struct initializer
     .destroy  = asymmetric_key_destroy,
                 ^~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:584:14: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:585:3: error: 'struct key_type' has no member named 'describe'
     .describe  = asymmetric_key_describe,
      ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:585:15: warning: excess elements in struct initializer
     .describe  = asymmetric_key_describe,
                  ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:585:15: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:586:3: error: 'struct key_type' has no member named 'lookup_restriction'
     .lookup_restriction = asymmetric_lookup_restriction,
      ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:586:24: warning: excess elements in struct initializer
     .lookup_restriction = asymmetric_lookup_restriction,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:586:24: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:587:3: error: 'struct key_type' has no member named 'asym_query'
     .asym_query  = query_asymmetric_key,
      ^~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:587:17: warning: excess elements in struct initializer
     .asym_query  = query_asymmetric_key,
                    ^~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:587:17: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:588:3: error: 'struct key_type' has no member named 'asym_eds_op'
     .asym_eds_op  = asymmetric_key_eds_op,
      ^~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:588:18: warning: excess elements in struct initializer
     .asym_eds_op  = asymmetric_key_eds_op,
                     ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:588:18: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:589:3: error: 'struct key_type' has no member named 'asym_verify_signature'
     .asym_verify_signature = asymmetric_key_verify_signature,
      ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:589:27: warning: excess elements in struct initializer
     .asym_verify_signature = asymmetric_key_verify_signature,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:589:27: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_init':
   crypto/asymmetric_keys/asymmetric_type.c:643:9: error: implicit declaration of function 'register_key_type'; did you mean 'register_sysctl'? [-Werror=implicit-function-declaration]
     return register_key_type(&key_type_asymmetric);
            ^~~~~~~~~~~~~~~~~
            register_sysctl
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
   Depends on [n]: CRYPTO [=y] && KEYS [=n]
   Selected by [m]:
   - INCREMENTAL_FS [=m] && BLOCK [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +72 include/keys/asymmetric-type.h

7901c1a8effbe5 David Howells   2014-09-16  58  
7901c1a8effbe5 David Howells   2014-09-16  59  extern bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
7901c1a8effbe5 David Howells   2014-09-16  60  				   const struct asymmetric_key_id *kid2);
7901c1a8effbe5 David Howells   2014-09-16  61  
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  62  extern bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  63  				      const struct asymmetric_key_id *kid2);
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  64  
7901c1a8effbe5 David Howells   2014-09-16  65  extern struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
7901c1a8effbe5 David Howells   2014-09-16  66  							    size_t len_1,
7901c1a8effbe5 David Howells   2014-09-16  67  							    const void *val_2,
7901c1a8effbe5 David Howells   2014-09-16  68  							    size_t len_2);
146aa8b1453bd8 David Howells   2015-10-21  69  static inline
146aa8b1453bd8 David Howells   2015-10-21  70  const struct asymmetric_key_ids *asymmetric_key_ids(const struct key *key)
146aa8b1453bd8 David Howells   2015-10-21  71  {
146aa8b1453bd8 David Howells   2015-10-21 @72  	return key->payload.data[asym_key_ids];
146aa8b1453bd8 David Howells   2015-10-21  73  }
7901c1a8effbe5 David Howells   2014-09-16  74  

:::::: The code at line 72 was first introduced by commit
:::::: 146aa8b1453bd8f1ff2304ffb71b4ee0eb9acdcc KEYS: Merge the type-specific data with the payload data

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
