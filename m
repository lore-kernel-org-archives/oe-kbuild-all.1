Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7B37D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 00:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKFqZuuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696897868; x=1728433868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42dgYEJl+NT9BtWWLKg7/J2iXum7RFqS6pxdMqzgcc8=;
  b=FKFqZuufmRArkW6jH56PTarTJtB8j+ejvCoxdD4Z4QnrIg+D1XnYdCij
   Y/8HNalC6Qxk+O9TYmj0xdyOv2yWONwD3Aj6X6PwPn7pySAPuAKdedaP/
   lUZPnfdmgHijljiMGzusLXtKyFyZC9lCSqiGQ4KHlPnenZHmwkUD7cGE+
   82g5ZNQtFvO+JoWO9AntIOjZXepnrS82v9ODmRRyUpQgJtsuuzR63JFPW
   imk2H+55HVhSTaZpqJRkJpSUUaDfFQtvi393dB8XvcwAzFLnvJ/zvM/XO
   4M38fSzC9nEsAhCZbiInOsoDLZ4RY9ktTWfnww+v6yKgT6DSO6vvv0Q5N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387119315"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="387119315"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 17:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843905980"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="843905980"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2023 17:31:06 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq0eO-0000sC-06;
	Tue, 10 Oct 2023 00:31:04 +0000
Date: Tue, 10 Oct 2023 08:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 468/1172]
 fs/crypto/fname.c:87:17: sparse: sparse: Variable length array is used.
Message-ID: <202310100834.IQRgUpwm-lkp@intel.com>
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
config: i386-randconfig-062-20231001 (https://download.01.org/0day-ci/archive/20231010/202310100834.IQRgUpwm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100834.IQRgUpwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100834.IQRgUpwm-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
