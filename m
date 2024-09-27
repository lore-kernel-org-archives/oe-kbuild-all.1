Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A0189914
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727432657; cv=none; b=YRd3cIlkdV//QSUfrH7kR6STpSIYVMZQEe7Uac/+2DQ3SFsFKhDtm95L0hN7tyYySR8OHvyPMo1/kOM8Sxc2M9P811eA8XB/mIdFGwAhrv7W13htobE3XCIZ2FsT3Kbga/iRiMil4Pcm7lOUFXeMXRw6+tQ0imCCrkRx6vsC600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727432657; c=relaxed/simple;
	bh=l/REdIJH3q8nQhMlcQn934TGU7eZe+UaeTMN2Wj66Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SP2S1f4BypGD3yCyFCR7i3wbW8FU5S0J5u47OAHrCTXfr8TPQU6+0waR0v5RwQnHHR1lDXjVftIU4HYB1jo7mt8aBrCxJPgpIdDGlMpb8AdH0tfPoM3e0mVMpvEkMdrSuBNQAkYOxOE+y8ogzgr5fm5JI5Kpol0+vNI4kEvsAP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1qpkSqC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1qpkSqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727432655; x=1758968655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/REdIJH3q8nQhMlcQn934TGU7eZe+UaeTMN2Wj66Bk=;
  b=N1qpkSqCzmXjybL/4UfhfXfgFf5s9PsfRXlRCLqrJCLfKX1ykkWemUnY
   x7sGlj4WvTx6P6YF9Eb9ftCKzK6yi28V3cCNY7+anygPza0njkELGn54Q
   ZKy7mR+l1pSpAjk85PhBWablLCZJRZ4PI449QKEg+xL7FD9lCdbi3ztzg
   C7P9QybQJHDYTQTZ2fmLn6UL3UwhJpUhMdAoGwLHG/Gl+mlX1AQ4tpq8N
   9aTQUDv2xiiZZ4i+coqseq9iwia3rC8a5kmxwy5RocxR2sZoJIFhTnW/j
   Wrkmj4y7tBw3SfspiixwWQ1GDCaJEZiq3D0GMyEJ/Pr9WcEmUzNeQKxUk
   A==;
X-CSE-ConnectionGUID: ChOmjpZFQQCqDRWkePCt1g==
X-CSE-MsgGUID: HnO8gJWcSPO/UTr0oSBBnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26518285"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26518285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 03:24:12 -0700
X-CSE-ConnectionGUID: FneCgF7VSlaK9zwxZJJG8Q==
X-CSE-MsgGUID: uoE4RchsThG6HBfpSSz11g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77433977"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 03:24:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su88v-000Lnt-1S;
	Fri, 27 Sep 2024 10:24:09 +0000
Date: Fri, 27 Sep 2024 18:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 468/1172]
 fs/crypto/fname.c:87:17: sparse: sparse: Variable length array is used.
Message-ID: <202409271826.kQl2Kk3Y-lkp@intel.com>
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
config: x86_64-randconfig-122-20240919 (https://download.01.org/0day-ci/archive/20240927/202409271826.kQl2Kk3Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271826.kQl2Kk3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271826.kQl2Kk3Y-lkp@intel.com/

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
   fs/crypto/fname.o: warning: objtool: fname_decrypt()+0x483: sibling call from callable instruction with modified stack frame
   fs/crypto/fname.o: warning: objtool: fscrypt_do_sha256()+0x155: sibling call from callable instruction with modified stack frame
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
