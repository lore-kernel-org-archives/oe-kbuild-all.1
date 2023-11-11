Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB7F6FA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 06:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQuSYfhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699684677; x=1731220677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rVY+jeaKx8S+MaGkaF1gxctS8HqAEckmoBYkFqCROHQ=;
  b=DQuSYfhEYOdiR9J+QGcyUYRjbopzTsuZcZSODiCamGyHQua2N7EMBELn
   T9AvUTDRMiKwGimZW/lmy3MC35NHAoUWSVyAUV0M5heYljC/p5Y8auqvl
   +sY5X89eMtx9I7ydVZYSwgZQy3aUYcvk8YxT5hnOGne2vPJnoIJFEUbXp
   chMTG3GfYctvM86T5oHwQmhRvQpTWuf8Gndj46U2SoEPq3mz2m9bS8mZ2
   RsXVCWN9jxvtcD1OiqqSYF0FNaHu0XpMtslgyJuUUwrlRUW2FUsHywRaU
   vmZ7Z7TL0j4qgFtW5Yax4alosSXeEorU2pDmuze+T3YOnRN3mrBN0ocgP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="370463645"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="370463645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 22:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740312474"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="740312474"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2023 22:37:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1hcv-000AGp-1j;
	Sat, 11 Nov 2023 06:37:53 +0000
Date: Sat, 11 Nov 2023 14:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 468/1172]
 fs/crypto/fname.c:87:17: sparse: sparse: Variable length array is used.
Message-ID: <202311111400.vECQ9vRa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 86eb43f574e090ecb3a2ca7366f4c74bd6ab3df2 [468/1172] fscrypt: improve format of no-key names
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20231111/202311111400.vECQ9vRa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111400.vECQ9vRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111400.vECQ9vRa-lkp@intel.com/

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
   fs/crypto/fname.o: warning: objtool: fname_decrypt()+0x51b: sibling call from callable instruction with modified stack frame
   fs/crypto/fname.o: warning: objtool: fscrypt_do_sha256()+0x150: sibling call from callable instruction with modified stack frame
   fs/crypto/fname.o: warning: objtool: fscrypt_fname_siphash()+0x68: sibling call from callable instruction with modified stack frame
   fs/crypto/fname.o: warning: objtool: fscrypt_setup_filename()+0x35f: sibling call from callable instruction with modified stack frame

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
https://github.com/intel/lkp-tests/wiki
