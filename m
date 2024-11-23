Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD233CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 00:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732323408; cv=none; b=XNb9AAQwSxFekwVV2aRAAh326gqaCYpF2j1Ox7E+qLzQtsWpUbF0b9ir7dBy6fRE0ve88ETWZ2jzwxIuRjbloHJAtNjyglhVmmUJ+1N3KrCN91JWc2LqI5syNl8eCkonnvtXnd6BvDVRVJ0pmFZcC+mLOw+lp++dT7FaSL/zwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732323408; c=relaxed/simple;
	bh=h9x+oCA5AWiyqQ/4BYfUnGqCSj77COz+CG9Ww9le7DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ui5CmycnJAocoiz+aC8rfJPMYTktALHrZ4AhGIsU/baJB0afva8Ec7xBv3w9lrrIF7l1nid5eUVwkD70pIKAWHb8kBCVlGT9NLa3wYg+cxsTP+EH8GKbObhWSFyrjb3FX1shz7fa9hsScLfeguQuYhvn34mv827RXPHs5cphtKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVUHyJUU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVUHyJUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732323406; x=1763859406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h9x+oCA5AWiyqQ/4BYfUnGqCSj77COz+CG9Ww9le7DM=;
  b=dVUHyJUURGS9TarNQMC5volkBAOorgitmJR4a2rMu7hQlT3/eGgDTj3d
   OiByJQVH6bxsgyRlyrHbHTLNhXpDG0Gs2Im5nNznvuNoQOW+aiUr6uHrZ
   yEg3RPbE88fc5m+2Q8G6UkbRWfVkM+U6CdMYksm8FCAIi7af0wYbM691Y
   ccJpq9gRhq8FcA1HCNWpbfb3yUh/lmRaEvAjK5ycT/7fScebsLSIxggMo
   FJOPlN+J0eL+8qtipDmlNXbBZ/vhTgavSXy2UimY/hL8yyHDGBrgpFpEA
   qgQoJETHiwgk7LER0LLJhtv3RgXxtLSy61XPSceB64Hz0slBKI/hVhMJb
   A==;
X-CSE-ConnectionGUID: z/qDmo1QStuUMXA3deYUYQ==
X-CSE-MsgGUID: W/qSulFfTkeDBZKNM4va9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32357184"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="32357184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 16:56:46 -0800
X-CSE-ConnectionGUID: fafXpq4sQseqBbfoW97CXA==
X-CSE-MsgGUID: 6Jhz/vD+TEafa518v/O2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="91523169"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2024 16:56:44 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEeS2-0004K3-0i;
	Sat, 23 Nov 2024 00:56:42 +0000
Date: Sat, 23 Nov 2024 08:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1408/30000]
 include/keys/asymmetric-type.h:72:12: error: incomplete definition of type
 'const struct key'
Message-ID: <202411230848.E6fm6RjX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   e3a8df30015ed13e27f9d7f4080a52e326e448c9
commit: 1be052b20ba04b635cf87bcff80de5314697953e [1408/30000] ANDROID: Initial commit of Incremental FS
config: x86_64-randconfig-006-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230848.E6fm6RjX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230848.E6fm6RjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230848.E6fm6RjX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/restrict.c:13:
   In file included from crypto/asymmetric_keys/asymmetric_keys.h:8:
>> include/keys/asymmetric-type.h:72:12: error: incomplete definition of type 'const struct key'
      72 |         return key->payload.data[asym_key_ids];
         |                ~~~^
   include/linux/keyctl.h:30:9: note: forward declaration of 'struct key'
      30 |         struct key      *key;
         |                ^
>> crypto/asymmetric_keys/restrict.c:87:15: error: incomplete definition of type 'const union key_payload'
      87 |         sig = payload->data[asym_auth];
         |               ~~~~~~~^
   include/crypto/public_key.h:55:7: note: forward declaration of 'union key_payload'
      55 | union key_payload;
         |       ^
>> crypto/asymmetric_keys/restrict.c:103:58: error: incomplete definition of type 'struct key'
     103 |         if (use_builtin_keys && !test_bit(KEY_FLAG_BUILTIN, &key->flags))
         |                                                              ~~~^
   include/linux/keyctl.h:30:9: note: forward declaration of 'struct key'
      30 |         struct key      *key;
         |                ^
>> crypto/asymmetric_keys/restrict.c:103:36: error: use of undeclared identifier 'KEY_FLAG_BUILTIN'
     103 |         if (use_builtin_keys && !test_bit(KEY_FLAG_BUILTIN, &key->flags))
         |                                           ^
   crypto/asymmetric_keys/restrict.c:131:23: error: incomplete definition of type 'struct key'
     131 |         else if (dest_keyring->type != &key_type_keyring)
         |                  ~~~~~~~~~~~~^
   include/linux/keyctl.h:30:9: note: forward declaration of 'struct key'
      30 |         struct key      *key;
         |                ^
>> crypto/asymmetric_keys/restrict.c:131:34: error: use of undeclared identifier 'key_type_keyring'; did you mean 'dest_keyring'?
     131 |         else if (dest_keyring->type != &key_type_keyring)
         |                                         ^~~~~~~~~~~~~~~~
         |                                         dest_keyring
   crypto/asymmetric_keys/restrict.c:118:46: note: 'dest_keyring' declared here
     118 | static int key_or_keyring_common(struct key *dest_keyring,
         |                                              ^
   crypto/asymmetric_keys/restrict.c:140:15: error: incomplete definition of type 'const union key_payload'
     140 |         sig = payload->data[asym_auth];
         |               ~~~~~~~^
   include/crypto/public_key.h:55:7: note: forward declaration of 'union key_payload'
      55 | union key_payload;
         |       ^
   crypto/asymmetric_keys/restrict.c:147:14: error: incomplete definition of type 'struct key'
     147 |                 if (trusted->type == &key_type_keyring) {
         |                     ~~~~~~~^
   include/linux/keyctl.h:30:9: note: forward declaration of 'struct key'
      30 |         struct key      *key;
         |                ^
   crypto/asymmetric_keys/restrict.c:147:25: error: use of undeclared identifier 'key_type_keyring'; did you mean 'dest_keyring'?
     147 |                 if (trusted->type == &key_type_keyring) {
         |                                       ^~~~~~~~~~~~~~~~
         |                                       dest_keyring
   crypto/asymmetric_keys/restrict.c:118:46: note: 'dest_keyring' declared here
     118 | static int key_or_keyring_common(struct key *dest_keyring,
         |                                              ^
   crypto/asymmetric_keys/restrict.c:153:21: error: incomplete definition of type 'struct key'
     153 |                 } else if (trusted->type == &key_type_asymmetric) {
         |                            ~~~~~~~^
   include/linux/keyctl.h:30:9: note: forward declaration of 'struct key'
      30 |         struct key      *key;
         |                ^
>> crypto/asymmetric_keys/restrict.c:180:12: error: implicit declaration of function '__key_get' [-Werror,-Wimplicit-function-declaration]
     180 |                                         key = __key_get(trusted);
         |                                               ^
>> crypto/asymmetric_keys/restrict.c:180:10: error: incompatible integer to pointer conversion assigning to 'struct key *' from 'int' [-Wint-conversion]
     180 |                                         key = __key_get(trusted);
         |                                             ^ ~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/restrict.c:186:11: error: implicit declaration of function '__key_get' [-Werror,-Wimplicit-function-declaration]
     186 |                                 key = __key_get(trusted);
         |                                       ^
   crypto/asymmetric_keys/restrict.c:186:9: error: incompatible integer to pointer conversion assigning to 'struct key *' from 'int' [-Wint-conversion]
     186 |                                 key = __key_get(trusted);
         |                                     ^ ~~~~~~~~~~~~~~~~~~
   14 errors generated.
--
   In file included from crypto/asymmetric_keys/pkcs7_trust.c:15:
>> include/keys/asymmetric-type.h:72:12: error: incomplete definition of type 'const struct key'
      72 |         return key->payload.data[asym_key_ids];
         |                ~~~^
   include/linux/key.h:33:8: note: forward declaration of 'struct key'
      33 | struct key;
         |        ^
   1 error generated.
--
   In file included from crypto/asymmetric_keys/x509_public_key.c:12:
   In file included from include/keys/asymmetric-subtype.h:14:
>> include/keys/asymmetric-type.h:72:12: error: incomplete definition of type 'const struct key'
      72 |         return key->payload.data[asym_key_ids];
         |                ~~~^
   include/linux/key.h:33:8: note: forward declaration of 'struct key'
      33 | struct key;
         |        ^
   In file included from crypto/asymmetric_keys/x509_public_key.c:12:
>> include/keys/asymmetric-subtype.h:57:12: error: incomplete definition of type 'const struct key'
      57 |         return key->payload.data[asym_subtype];
         |                ~~~^
   include/linux/key.h:33:8: note: forward declaration of 'struct key'
      33 | struct key;
         |        ^
   In file included from crypto/asymmetric_keys/x509_public_key.c:13:
>> include/keys/asymmetric-parser.h:27:22: warning: declaration of 'struct key_preparsed_payload' will not be visible outside of this function [-Wvisibility]
      27 |         int (*parse)(struct key_preparsed_payload *prep);
         |                             ^
>> crypto/asymmetric_keys/x509_public_key.c:156:37: warning: declaration of 'struct key_preparsed_payload' will not be visible outside of this function [-Wvisibility]
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
>> crypto/asymmetric_keys/x509_public_key.c:165:29: error: incomplete definition of type 'struct key_preparsed_payload'
     165 |         cert = x509_cert_parse(prep->data, prep->datalen);
         |                                ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
   crypto/asymmetric_keys/x509_public_key.c:165:41: error: incomplete definition of type 'struct key_preparsed_payload'
     165 |         cert = x509_cert_parse(prep->data, prep->datalen);
         |                                            ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
   crypto/asymmetric_keys/x509_public_key.c:224:6: error: incomplete definition of type 'struct key_preparsed_payload'
     224 |         prep->payload.data[asym_subtype] = &public_key_subtype;
         |         ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
   crypto/asymmetric_keys/x509_public_key.c:225:6: error: incomplete definition of type 'struct key_preparsed_payload'
     225 |         prep->payload.data[asym_key_ids] = kids;
         |         ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
   crypto/asymmetric_keys/x509_public_key.c:226:6: error: incomplete definition of type 'struct key_preparsed_payload'
     226 |         prep->payload.data[asym_crypto] = cert->pub;
         |         ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
   crypto/asymmetric_keys/x509_public_key.c:227:6: error: incomplete definition of type 'struct key_preparsed_payload'
     227 |         prep->payload.data[asym_auth] = cert->sig;
         |         ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
   crypto/asymmetric_keys/x509_public_key.c:228:6: error: incomplete definition of type 'struct key_preparsed_payload'
     228 |         prep->description = desc;
         |         ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
   crypto/asymmetric_keys/x509_public_key.c:229:6: error: incomplete definition of type 'struct key_preparsed_payload'
     229 |         prep->quotalen = 100;
         |         ~~~~^
   crypto/asymmetric_keys/x509_public_key.c:156:37: note: forward declaration of 'struct key_preparsed_payload'
     156 | static int x509_key_preparse(struct key_preparsed_payload *prep)
         |                                     ^
>> crypto/asymmetric_keys/x509_public_key.c:249:11: error: incompatible function pointer types initializing 'int (*)(struct key_preparsed_payload *)' with an expression of type 'int (struct key_preparsed_payload *)' [-Wincompatible-function-pointer-types]
     249 |         .parse  = x509_key_preparse,
         |                   ^~~~~~~~~~~~~~~~~
   2 warnings and 11 errors generated.
--
   In file included from crypto/asymmetric_keys/asymmetric_type.c:9:
   In file included from include/keys/asymmetric-subtype.h:14:
>> include/keys/asymmetric-type.h:72:12: error: incomplete definition of type 'const struct key'
      72 |         return key->payload.data[asym_key_ids];
         |                ~~~^
   include/linux/key.h:33:8: note: forward declaration of 'struct key'
      33 | struct key;
         |        ^
   In file included from crypto/asymmetric_keys/asymmetric_type.c:9:
>> include/keys/asymmetric-subtype.h:57:12: error: incomplete definition of type 'const struct key'
      57 |         return key->payload.data[asym_subtype];
         |                ~~~^
   include/linux/key.h:33:8: note: forward declaration of 'struct key'
      33 | struct key;
         |        ^
   In file included from crypto/asymmetric_keys/asymmetric_type.c:10:
>> include/keys/asymmetric-parser.h:27:22: warning: declaration of 'struct key_preparsed_payload' will not be visible outside of this function [-Wvisibility]
      27 |         int (*parse)(struct key_preparsed_payload *prep);
         |                             ^
   crypto/asymmetric_keys/asymmetric_type.c:52:2: error: unknown type name 'key_ref_t'; did you mean 'key_perm_t'?
      52 |         key_ref_t ref;
         |         ^~~~~~~~~
         |         key_perm_t
   include/linux/key.h:31:18: note: 'key_perm_t' declared here
      31 | typedef uint32_t key_perm_t;
         |                  ^
>> crypto/asymmetric_keys/asymmetric_type.c:85:8: error: implicit declaration of function 'keyring_search' [-Werror,-Wimplicit-function-declaration]
      85 |         ref = keyring_search(make_key_ref(keyring, 1),
         |               ^
>> crypto/asymmetric_keys/asymmetric_type.c:87:13: error: incompatible integer to pointer conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of type 'const void *' [-Wint-conversion]
      87 |         if (IS_ERR(ref))
         |                    ^~~
   include/linux/err.h:34:60: note: passing argument to parameter 'ptr' here
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                            ^
   crypto/asymmetric_keys/asymmetric_type.c:88:59: error: incompatible integer to pointer conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of type 'const void *' [-Wint-conversion]
      88 |                 pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
         |                                                                         ^~~
   include/linux/printk.h:342:38: note: expanded from macro 'pr_debug'
     342 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   include/linux/printk.h:137:17: note: expanded from macro 'no_printk'
     137 |                 printk(fmt, ##__VA_ARGS__);             \
         |                               ^~~~~~~~~~~
   include/linux/err.h:29:61: note: passing argument to parameter 'ptr' here
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                             ^
   crypto/asymmetric_keys/asymmetric_type.c:91:13: error: incompatible integer to pointer conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of type 'const void *' [-Wint-conversion]
      91 |         if (IS_ERR(ref)) {
         |                    ^~~
   include/linux/err.h:34:60: note: passing argument to parameter 'ptr' here
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                            ^
   crypto/asymmetric_keys/asymmetric_type.c:92:19: error: incompatible integer to pointer conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of type 'const void *' [-Wint-conversion]
      92 |                 switch (PTR_ERR(ref)) {
         |                                 ^~~
   include/linux/err.h:29:61: note: passing argument to parameter 'ptr' here
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                             ^
   crypto/asymmetric_keys/asymmetric_type.c:99:20: error: incompatible integer to pointer conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of type 'const void *' [-Wint-conversion]
      99 |                         return ERR_CAST(ref);
         |                                         ^~~
   include/linux/err.h:51:64: note: passing argument to parameter 'ptr' here
      51 | static inline void * __must_check ERR_CAST(__force const void *ptr)
         |                                                                ^
>> crypto/asymmetric_keys/asymmetric_type.c:248:24: warning: declaration of 'struct key_match_data' will not be visible outside of this function [-Wvisibility]
     248 |                                const struct key_match_data *match_data)
         |                                             ^
>> crypto/asymmetric_keys/asymmetric_type.c:251:55: error: incomplete definition of type 'const struct key_match_data'
     251 |         const struct asymmetric_key_id *match_id = match_data->preparsed;
         |                                                    ~~~~~~~~~~^
   crypto/asymmetric_keys/asymmetric_type.c:248:24: note: forward declaration of 'struct key_match_data'
     248 |                                const struct key_match_data *match_data)
         |                                             ^
   crypto/asymmetric_keys/asymmetric_type.c:261:25: warning: declaration of 'struct key_match_data' will not be visible outside of this function [-Wvisibility]
     261 |                                        const struct key_match_data *match_data)
         |                                                     ^
   crypto/asymmetric_keys/asymmetric_type.c:264:55: error: incomplete definition of type 'const struct key_match_data'
     264 |         const struct asymmetric_key_id *match_id = match_data->preparsed;
         |                                                    ~~~~~~~~~~^
   crypto/asymmetric_keys/asymmetric_type.c:261:25: note: forward declaration of 'struct key_match_data'
     261 |                                        const struct key_match_data *match_data)
         |                                                     ^
   crypto/asymmetric_keys/asymmetric_type.c:283:49: warning: declaration of 'struct key_match_data' will not be visible outside of this function [-Wvisibility]
     283 | static int asymmetric_key_match_preparse(struct key_match_data *match_data)
         |                                                 ^
>> crypto/asymmetric_keys/asymmetric_type.c:286:31: error: incomplete definition of type 'struct key_match_data'
     286 |         const char *spec = match_data->raw_data;
         |                            ~~~~~~~~~~^
   crypto/asymmetric_keys/asymmetric_type.c:283:49: note: forward declaration of 'struct key_match_data'
     283 | static int asymmetric_key_match_preparse(struct key_match_data *match_data)
         |                                                 ^
>> crypto/asymmetric_keys/asymmetric_type.c:288:9: error: incompatible function pointer types initializing 'bool (*)(const struct key *, const struct key_match_data *)' (aka '_Bool (*)(const struct key *, const struct key_match_data *)') with an expression of type 'bool (const struct key *, const struct key_match_data *)' (aka '_Bool (const struct key *, const struct key_match_data *)') [-Wincompatible-function-pointer-types]
     288 |         bool (*cmp)(const struct key *, const struct key_match_data *) =
         |                ^
     289 |                 asymmetric_key_cmp;
         |                 ~~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:297:7: error: incompatible function pointer types assigning to 'bool (*)(const struct key *, const struct key_match_data *)' (aka '_Bool (*)(const struct key *, const struct key_match_data *)') from 'bool (const struct key *, const struct key_match_data *)' (aka '_Bool (const struct key *, const struct key_match_data *)') [-Wincompatible-function-pointer-types]
     297 |                 cmp = asymmetric_key_cmp_partial;
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:310:12: error: incomplete definition of type 'struct key_match_data'
     310 |         match_data->preparsed = match_id;
         |         ~~~~~~~~~~^
   crypto/asymmetric_keys/asymmetric_type.c:283:49: note: forward declaration of 'struct key_match_data'
     283 | static int asymmetric_key_match_preparse(struct key_match_data *match_data)
         |                                                 ^
   crypto/asymmetric_keys/asymmetric_type.c:311:12: error: incomplete definition of type 'struct key_match_data'
     311 |         match_data->cmp = cmp;
         |         ~~~~~~~~~~^
   crypto/asymmetric_keys/asymmetric_type.c:283:49: note: forward declaration of 'struct key_match_data'
     283 | static int asymmetric_key_match_preparse(struct key_match_data *match_data)
         |                                                 ^
   crypto/asymmetric_keys/asymmetric_type.c:312:12: error: incomplete definition of type 'struct key_match_data'
     312 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |         ~~~~~~~~~~^
   crypto/asymmetric_keys/asymmetric_type.c:283:49: note: forward declaration of 'struct key_match_data'
     283 | static int asymmetric_key_match_preparse(struct key_match_data *match_data)
         |                                                 ^
>> crypto/asymmetric_keys/asymmetric_type.c:312:28: error: use of undeclared identifier 'KEYRING_SEARCH_LOOKUP_ITERATE'
     312 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |                                   ^
   crypto/asymmetric_keys/asymmetric_type.c:322:46: warning: declaration of 'struct key_match_data' will not be visible outside of this function [-Wvisibility]
     322 | static void asymmetric_key_match_free(struct key_match_data *match_data)
         |                                              ^
   crypto/asymmetric_keys/asymmetric_type.c:324:18: error: incomplete definition of type 'struct key_match_data'
     324 |         kfree(match_data->preparsed);
         |               ~~~~~~~~~~^
   crypto/asymmetric_keys/asymmetric_type.c:322:46: note: forward declaration of 'struct key_match_data'
     322 | static void asymmetric_key_match_free(struct key_match_data *match_data)
         |                                              ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   5 warnings and 20 errors generated.
--
   In file included from crypto/asymmetric_keys/pkcs7_parser.c:16:
   In file included from crypto/asymmetric_keys/pkcs7_parser.h:10:
   In file included from crypto/asymmetric_keys/x509_parser.h:10:
>> include/keys/asymmetric-type.h:72:12: error: incomplete definition of type 'const struct key'
      72 |         return key->payload.data[asym_key_ids];
         |                ~~~^
   include/linux/keyctl.h:30:9: note: forward declaration of 'struct key'
      30 |         struct key      *key;
         |                ^
   1 error generated.
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
   Depends on [n]: CRYPTO [=y] && KEYS [=n]
   Selected by [y]:
   - INCREMENTAL_FS [=y] && BLOCK [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


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
