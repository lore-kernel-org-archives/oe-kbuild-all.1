Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910B15AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 01:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674870850; x=1706406850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLz2TTmnYEt/KVol6jNX4OaACdph+PIwuJPS7SA+pmA=;
  b=M2DyuuvqyGZA4vY7KiZhZ1M9ihlGijoerF0OkFf9Gvns6k5v0LLUYSih
   JL92bJb1wgO82UY69cjj6WzB4ZZ5ytUvtkj+wJXUIkIJvSwWB2KwXjp5q
   +Eka/j6jV4zKMrZp40izmECeryVYVI7H4F+hmsiY6HfhLeDsXAXei+0Uq
   cD7/1fORYRzyyhTpifOrhg8Wpb93Eg/eaHSOUDMsHbK1bLegRy80TiP5k
   6oRBPQh3ZcNciJvWmky+W2dRJCBUtQykIjyAkxNItwE/tu5Oka0KY0TFY
   tzmiRV6h3NyUqC7H7wuVOAyRjKimafoGqPB0uI4LZYtKDqFzfXYP6mE8x
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="328534651"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="328534651"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 17:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="837340252"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="837340252"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Jan 2023 17:54:09 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLaPw-0000G8-0d;
	Sat, 28 Jan 2023 01:54:08 +0000
Date: Sat, 28 Jan 2023 09:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
 468/1172] fs/crypto/fname.c:87:17: sparse: sparse: Variable length array is
 used.
Message-ID: <202301280924.EfQJTZTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 86eb43f574e090ecb3a2ca7366f4c74bd6ab3df2 [468/1172] fscrypt: improve format of no-key names
config: i386-randconfig-s001-20230123 (https://download.01.org/0day-ci/archive/20230128/202301280924.EfQJTZTJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/86eb43f574e090ecb3a2ca7366f4c74bd6ab3df2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
        git checkout 86eb43f574e090ecb3a2ca7366f4c74bd6ab3df2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/fname.c:87:17: sparse: sparse: Variable length array is used.
   fs/crypto/fname.c:55: warning: Function parameter or member 'dirhash' not described in 'fscrypt_nokey_name'
   fs/crypto/fname.c:55: warning: Function parameter or member 'bytes' not described in 'fscrypt_nokey_name'
   fs/crypto/fname.c:55: warning: Function parameter or member 'sha256' not described in 'fscrypt_nokey_name'
   fs/crypto/fname.c:117: warning: Function parameter or member 'inode' not described in 'fscrypt_fname_encrypt'
   fs/crypto/fname.c:117: warning: Function parameter or member 'iname' not described in 'fscrypt_fname_encrypt'
   fs/crypto/fname.c:117: warning: Function parameter or member 'out' not described in 'fscrypt_fname_encrypt'
   fs/crypto/fname.c:117: warning: Function parameter or member 'olen' not described in 'fscrypt_fname_encrypt'
   fs/crypto/fname.c:169: warning: Function parameter or member 'inode' not described in 'fname_decrypt'
   fs/crypto/fname.c:169: warning: Function parameter or member 'iname' not described in 'fname_decrypt'
   fs/crypto/fname.c:169: warning: Function parameter or member 'oname' not described in 'fname_decrypt'
   fs/crypto/fname.c:218: warning: Function parameter or member 'src' not described in 'base64_encode'
   fs/crypto/fname.c:218: warning: Function parameter or member 'len' not described in 'base64_encode'
   fs/crypto/fname.c:218: warning: Function parameter or member 'dst' not described in 'base64_encode'
   fs/crypto/fname.c:286: warning: Function parameter or member 'inode' not described in 'fscrypt_fname_alloc_buffer'
   fs/crypto/fname.c:286: warning: Function parameter or member 'max_encrypted_len' not described in 'fscrypt_fname_alloc_buffer'
   fs/crypto/fname.c:286: warning: Function parameter or member 'crypto_str' not described in 'fscrypt_fname_alloc_buffer'
   fs/crypto/fname.c:306: warning: Function parameter or member 'crypto_str' not described in 'fscrypt_fname_free_buffer'
   fs/crypto/fname.c:330: warning: Function parameter or member 'inode' not described in 'fscrypt_fname_disk_to_usr'
   fs/crypto/fname.c:330: warning: Function parameter or member 'hash' not described in 'fscrypt_fname_disk_to_usr'
   fs/crypto/fname.c:330: warning: Function parameter or member 'minor_hash' not described in 'fscrypt_fname_disk_to_usr'
   fs/crypto/fname.c:330: warning: Function parameter or member 'iname' not described in 'fscrypt_fname_disk_to_usr'
   fs/crypto/fname.c:330: warning: Function parameter or member 'oname' not described in 'fscrypt_fname_disk_to_usr'

vim +87 fs/crypto/fname.c

    65	
    66	static int fscrypt_do_sha256(const u8 *data, unsigned int data_len, u8 *result)
    67	{
    68		struct crypto_shash *tfm = READ_ONCE(sha256_hash_tfm);
    69	
    70		if (unlikely(!tfm)) {
    71			struct crypto_shash *prev_tfm;
    72	
    73			tfm = crypto_alloc_shash("sha256", 0, 0);
    74			if (IS_ERR(tfm)) {
    75				fscrypt_err(NULL,
    76					    "Error allocating SHA-256 transform: %ld",
    77					    PTR_ERR(tfm));
    78				return PTR_ERR(tfm);
    79			}
    80			prev_tfm = cmpxchg(&sha256_hash_tfm, NULL, tfm);
    81			if (prev_tfm) {
    82				crypto_free_shash(tfm);
    83				tfm = prev_tfm;
    84			}
    85		}
    86		{
  > 87			SHASH_DESC_ON_STACK(desc, tfm);
    88	
    89			desc->tfm = tfm;
    90			desc->flags = 0;
    91	
    92			return crypto_shash_digest(desc, data, data_len, result);
    93		}
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
