Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D62D8378
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301492; cv=none; b=rW0OCeVQcmH5QI24mXE1AIjYl+IdhxdG7jOGX0Pw1xzY0/8AGus8rXXS3ifvUV+ZHfhci2V3klwMlzDso/laQXTGBx3Q+nKahfVfyNWDap9GFkmvCGsr3CHRnS7X5TB5/w2HCu+rjxyKQlxicw3pwz6B4USAmSU46JXQ2SEZ1WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301492; c=relaxed/simple;
	bh=zA4/+G/cJ2A5ABApZeEgCCleDJIkGB7owhDjhYtS2DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBGHP2X0cyfp5O7bX8XdMs9DNBP/2pHmmIQFSMBRI7TfXDa+uGeXM1NO59D2EtMIQ/viJssbE2pjEjMnZSSsiGvAA3mTfCM9J2kuP4otEmC7+TOcLNS5l/2uq5ENfz4HJdL4vINQAmR5kx4ntVpXFT0e/nGhloknfnWV5NWfbiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzN6oBd/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzN6oBd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763301488; x=1794837488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zA4/+G/cJ2A5ABApZeEgCCleDJIkGB7owhDjhYtS2DA=;
  b=LzN6oBd/45gA+WYzquGlUt3Mq8VvkFMeddA+y/q6432G/YOibNiULxot
   KtLa5kSbsyo0YW6YqgWjWcUXNx0suatp7nEeIoPl45ypsM+pl1yl3apJo
   ytjfXlQ4xHIdcS4hy9J5N3MJN3E9d2HK3g025075AlVkThPfwjiFHa+I1
   zX9kVUwWgj5KXu7Q4QLWCBf49HfOZQDb1ULrCoOOsxQo9VAmuY4mhh4Er
   Zg8vetzyF3mdCqPIkkXvF+MtemfAiAjotrtMXUQbKQ8eCVZVc6rChOnMR
   Hg1iMfFyPry5Ps9S2Hw3ZePQsnQ5pNwSYYx8CVbTZblH2sfwig9Q+EeLg
   A==;
X-CSE-ConnectionGUID: ZO4EQiNKQ4CNT9lQ4wyjAQ==
X-CSE-MsgGUID: BL04Q+OYSL2dDlbQQeengg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82947594"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="82947594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 05:58:03 -0800
X-CSE-ConnectionGUID: Hj/747x3SU+dOq3t99aSCg==
X-CSE-MsgGUID: ATwvHivaQGiwNv5q7C4UgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="189885654"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2025 05:58:02 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKdGR-0008o9-38;
	Sun, 16 Nov 2025 13:57:59 +0000
Date: Sun, 16 Nov 2025 21:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] libcrypto/chachapoly: Use strict typing for fixed
 size array arguments
Message-ID: <202511162151.ShBs8TfO-lkp@intel.com>
References: <20251114180706.318152-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114180706.318152-2-ardb+git@google.com>

Hi Ard,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master ebiggers/libcrypto-next ebiggers/libcrypto-fixes linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/libcrypto-chachapoly-Use-strict-typing-for-fixed-size-array-arguments/20251115-021755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251114180706.318152-2-ardb%2Bgit%40google.com
patch subject: [RFC PATCH] libcrypto/chachapoly: Use strict typing for fixed size array arguments
config: arc-randconfig-002-20251116 (https://download.01.org/0day-ci/archive/20251116/202511162151.ShBs8TfO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511162151.ShBs8TfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511162151.ShBs8TfO-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/keys/big_key.c: In function 'big_key_preparse':
>> security/keys/big_key.c:103:10: error: passing argument 7 of 'chacha20poly1305_encrypt' from incompatible pointer type [-Werror=incompatible-pointer-types]
          0, enckey);
             ^~~~~~
   In file included from security/keys/big_key.c:18:
   include/crypto/chacha20poly1305.h:21:21: note: expected 'const u8 (*)[32]' {aka 'const unsigned char (*)[32]'} but argument is of type 'u8 *' {aka 'unsigned char *'}
             const u8 (*key)[CHACHA20POLY1305_KEY_SIZE]);
             ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/big_key.c: In function 'big_key_read':
>> security/keys/big_key.c:261:13: error: passing argument 7 of 'chacha20poly1305_decrypt' from incompatible pointer type [-Werror=incompatible-pointer-types]
                enckey) ? 0 : -EBADMSG;
                ^~~~~~
   In file included from security/keys/big_key.c:18:
   include/crypto/chacha20poly1305.h:26:16: note: expected 'const u8 (*)[32]' {aka 'const unsigned char (*)[32]'} but argument is of type 'u8 *' {aka 'unsigned char *'}
        const u8 (*key)[CHACHA20POLY1305_KEY_SIZE]);
        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/chacha20poly1305_encrypt +103 security/keys/big_key.c

ab3c3587f8cda9 David Howells      2013-09-24   53  
ab3c3587f8cda9 David Howells      2013-09-24   54  /*
002edaf76f09af David Howells      2014-07-18   55   * Preparse a big key
ab3c3587f8cda9 David Howells      2013-09-24   56   */
002edaf76f09af David Howells      2014-07-18   57  int big_key_preparse(struct key_preparsed_payload *prep)
ab3c3587f8cda9 David Howells      2013-09-24   58  {
c1298a3a1139c9 Kees Cook          2022-05-08   59  	struct big_key_payload *payload = to_big_key_payload(prep->payload);
ab3c3587f8cda9 David Howells      2013-09-24   60  	struct file *file;
521fd61c84a19b Jason A. Donenfeld 2020-05-11   61  	u8 *buf, *enckey;
ab3c3587f8cda9 David Howells      2013-09-24   62  	ssize_t written;
521fd61c84a19b Jason A. Donenfeld 2020-05-11   63  	size_t datalen = prep->datalen;
521fd61c84a19b Jason A. Donenfeld 2020-05-11   64  	size_t enclen = datalen + CHACHA20POLY1305_AUTHTAG_SIZE;
ab3c3587f8cda9 David Howells      2013-09-24   65  	int ret;
ab3c3587f8cda9 David Howells      2013-09-24   66  
c1298a3a1139c9 Kees Cook          2022-05-08   67  	BUILD_BUG_ON(sizeof(*payload) != sizeof(prep->payload.data));
c1298a3a1139c9 Kees Cook          2022-05-08   68  
ab3c3587f8cda9 David Howells      2013-09-24   69  	if (datalen <= 0 || datalen > 1024 * 1024 || !prep->data)
d9f4bb1a0f4db4 David Howells      2018-02-22   70  		return -EINVAL;
ab3c3587f8cda9 David Howells      2013-09-24   71  
ab3c3587f8cda9 David Howells      2013-09-24   72  	/* Set an arbitrary quota */
002edaf76f09af David Howells      2014-07-18   73  	prep->quotalen = 16;
ab3c3587f8cda9 David Howells      2013-09-24   74  
c1298a3a1139c9 Kees Cook          2022-05-08   75  	payload->length = datalen;
ab3c3587f8cda9 David Howells      2013-09-24   76  
ab3c3587f8cda9 David Howells      2013-09-24   77  	if (datalen > BIG_KEY_FILE_THRESHOLD) {
ab3c3587f8cda9 David Howells      2013-09-24   78  		/* Create a shmem file to store the data in.  This will permit the data
ab3c3587f8cda9 David Howells      2013-09-24   79  		 * to be swapped out if needed.
ab3c3587f8cda9 David Howells      2013-09-24   80  		 *
13100a72f40f57 Kirill Marinushkin 2016-04-12   81  		 * File content is stored encrypted with randomly generated key.
521fd61c84a19b Jason A. Donenfeld 2020-05-11   82  		 * Since the key is random for each file, we can set the nonce
521fd61c84a19b Jason A. Donenfeld 2020-05-11   83  		 * to zero, provided we never define a ->update() call.
ab3c3587f8cda9 David Howells      2013-09-24   84  		 */
e13ec939e96b13 Christoph Hellwig  2017-09-01   85  		loff_t pos = 0;
13100a72f40f57 Kirill Marinushkin 2016-04-12   86  
521fd61c84a19b Jason A. Donenfeld 2020-05-11   87  		buf = kvmalloc(enclen, GFP_KERNEL);
d9f4bb1a0f4db4 David Howells      2018-02-22   88  		if (!buf)
13100a72f40f57 Kirill Marinushkin 2016-04-12   89  			return -ENOMEM;
13100a72f40f57 Kirill Marinushkin 2016-04-12   90  
13100a72f40f57 Kirill Marinushkin 2016-04-12   91  		/* generate random key */
521fd61c84a19b Jason A. Donenfeld 2020-05-11   92  		enckey = kmalloc(CHACHA20POLY1305_KEY_SIZE, GFP_KERNEL);
13100a72f40f57 Kirill Marinushkin 2016-04-12   93  		if (!enckey) {
13100a72f40f57 Kirill Marinushkin 2016-04-12   94  			ret = -ENOMEM;
13100a72f40f57 Kirill Marinushkin 2016-04-12   95  			goto error;
13100a72f40f57 Kirill Marinushkin 2016-04-12   96  		}
521fd61c84a19b Jason A. Donenfeld 2020-05-11   97  		ret = get_random_bytes_wait(enckey, CHACHA20POLY1305_KEY_SIZE);
428490e38b2e35 Jason A. Donenfeld 2017-09-20   98  		if (unlikely(ret))
13100a72f40f57 Kirill Marinushkin 2016-04-12   99  			goto err_enckey;
13100a72f40f57 Kirill Marinushkin 2016-04-12  100  
521fd61c84a19b Jason A. Donenfeld 2020-05-11  101  		/* encrypt data */
521fd61c84a19b Jason A. Donenfeld 2020-05-11  102  		chacha20poly1305_encrypt(buf, prep->data, datalen, NULL, 0,
521fd61c84a19b Jason A. Donenfeld 2020-05-11 @103  					 0, enckey);
13100a72f40f57 Kirill Marinushkin 2016-04-12  104  
13100a72f40f57 Kirill Marinushkin 2016-04-12  105  		/* save aligned data to file */
13100a72f40f57 Kirill Marinushkin 2016-04-12  106  		file = shmem_kernel_file_setup("", enclen, 0);
d2b86970245b64 Wei Yongjun        2013-10-30  107  		if (IS_ERR(file)) {
d2b86970245b64 Wei Yongjun        2013-10-30  108  			ret = PTR_ERR(file);
13100a72f40f57 Kirill Marinushkin 2016-04-12  109  			goto err_enckey;
d2b86970245b64 Wei Yongjun        2013-10-30  110  		}
ab3c3587f8cda9 David Howells      2013-09-24  111  
521fd61c84a19b Jason A. Donenfeld 2020-05-11  112  		written = kernel_write(file, buf, enclen, &pos);
13100a72f40f57 Kirill Marinushkin 2016-04-12  113  		if (written != enclen) {
97826c821ec672 David Howells      2013-11-13  114  			ret = written;
ab3c3587f8cda9 David Howells      2013-09-24  115  			if (written >= 0)
521fd61c84a19b Jason A. Donenfeld 2020-05-11  116  				ret = -EIO;
ab3c3587f8cda9 David Howells      2013-09-24  117  			goto err_fput;
ab3c3587f8cda9 David Howells      2013-09-24  118  		}
ab3c3587f8cda9 David Howells      2013-09-24  119  
ab3c3587f8cda9 David Howells      2013-09-24  120  		/* Pin the mount and dentry to the key so that we can open it again
ab3c3587f8cda9 David Howells      2013-09-24  121  		 * later
ab3c3587f8cda9 David Howells      2013-09-24  122  		 */
c1298a3a1139c9 Kees Cook          2022-05-08  123  		payload->data = enckey;
c1298a3a1139c9 Kees Cook          2022-05-08  124  		payload->path = file->f_path;
c1298a3a1139c9 Kees Cook          2022-05-08  125  		path_get(&payload->path);
ab3c3587f8cda9 David Howells      2013-09-24  126  		fput(file);
272a121940a286 Denis Efremov      2020-08-27  127  		kvfree_sensitive(buf, enclen);
ab3c3587f8cda9 David Howells      2013-09-24  128  	} else {
ab3c3587f8cda9 David Howells      2013-09-24  129  		/* Just store the data in a buffer */
ab3c3587f8cda9 David Howells      2013-09-24  130  		void *data = kmalloc(datalen, GFP_KERNEL);
13100a72f40f57 Kirill Marinushkin 2016-04-12  131  
002edaf76f09af David Howells      2014-07-18  132  		if (!data)
002edaf76f09af David Howells      2014-07-18  133  			return -ENOMEM;
ab3c3587f8cda9 David Howells      2013-09-24  134  
c1298a3a1139c9 Kees Cook          2022-05-08  135  		payload->data = data;
146aa8b1453bd8 David Howells      2015-10-21  136  		memcpy(data, prep->data, prep->datalen);
ab3c3587f8cda9 David Howells      2013-09-24  137  	}
ab3c3587f8cda9 David Howells      2013-09-24  138  	return 0;
ab3c3587f8cda9 David Howells      2013-09-24  139  
ab3c3587f8cda9 David Howells      2013-09-24  140  err_fput:
ab3c3587f8cda9 David Howells      2013-09-24  141  	fput(file);
13100a72f40f57 Kirill Marinushkin 2016-04-12  142  err_enckey:
453431a54934d9 Waiman Long        2020-08-06  143  	kfree_sensitive(enckey);
ab3c3587f8cda9 David Howells      2013-09-24  144  error:
272a121940a286 Denis Efremov      2020-08-27  145  	kvfree_sensitive(buf, enclen);
ab3c3587f8cda9 David Howells      2013-09-24  146  	return ret;
ab3c3587f8cda9 David Howells      2013-09-24  147  }
ab3c3587f8cda9 David Howells      2013-09-24  148  
002edaf76f09af David Howells      2014-07-18  149  /*
002edaf76f09af David Howells      2014-07-18  150   * Clear preparsement.
002edaf76f09af David Howells      2014-07-18  151   */
002edaf76f09af David Howells      2014-07-18  152  void big_key_free_preparse(struct key_preparsed_payload *prep)
002edaf76f09af David Howells      2014-07-18  153  {
c1298a3a1139c9 Kees Cook          2022-05-08  154  	struct big_key_payload *payload = to_big_key_payload(prep->payload);
13100a72f40f57 Kirill Marinushkin 2016-04-12  155  
c1298a3a1139c9 Kees Cook          2022-05-08  156  	if (prep->datalen > BIG_KEY_FILE_THRESHOLD)
c1298a3a1139c9 Kees Cook          2022-05-08  157  		path_put(&payload->path);
c1298a3a1139c9 Kees Cook          2022-05-08  158  	kfree_sensitive(payload->data);
002edaf76f09af David Howells      2014-07-18  159  }
002edaf76f09af David Howells      2014-07-18  160  
ab3c3587f8cda9 David Howells      2013-09-24  161  /*
ab3c3587f8cda9 David Howells      2013-09-24  162   * dispose of the links from a revoked keyring
ab3c3587f8cda9 David Howells      2013-09-24  163   * - called with the key sem write-locked
ab3c3587f8cda9 David Howells      2013-09-24  164   */
ab3c3587f8cda9 David Howells      2013-09-24  165  void big_key_revoke(struct key *key)
ab3c3587f8cda9 David Howells      2013-09-24  166  {
c1298a3a1139c9 Kees Cook          2022-05-08  167  	struct big_key_payload *payload = to_big_key_payload(key->payload);
ab3c3587f8cda9 David Howells      2013-09-24  168  
ab3c3587f8cda9 David Howells      2013-09-24  169  	/* clear the quota */
ab3c3587f8cda9 David Howells      2013-09-24  170  	key_payload_reserve(key, 0);
c1298a3a1139c9 Kees Cook          2022-05-08  171  	if (key_is_positive(key) && payload->length > BIG_KEY_FILE_THRESHOLD)
c1298a3a1139c9 Kees Cook          2022-05-08  172  		vfs_truncate(&payload->path, 0);
ab3c3587f8cda9 David Howells      2013-09-24  173  }
ab3c3587f8cda9 David Howells      2013-09-24  174  
ab3c3587f8cda9 David Howells      2013-09-24  175  /*
ab3c3587f8cda9 David Howells      2013-09-24  176   * dispose of the data dangling from the corpse of a big_key key
ab3c3587f8cda9 David Howells      2013-09-24  177   */
ab3c3587f8cda9 David Howells      2013-09-24  178  void big_key_destroy(struct key *key)
ab3c3587f8cda9 David Howells      2013-09-24  179  {
c1298a3a1139c9 Kees Cook          2022-05-08  180  	struct big_key_payload *payload = to_big_key_payload(key->payload);
13100a72f40f57 Kirill Marinushkin 2016-04-12  181  
c1298a3a1139c9 Kees Cook          2022-05-08  182  	if (payload->length > BIG_KEY_FILE_THRESHOLD) {
c1298a3a1139c9 Kees Cook          2022-05-08  183  		path_put(&payload->path);
c1298a3a1139c9 Kees Cook          2022-05-08  184  		payload->path.mnt = NULL;
c1298a3a1139c9 Kees Cook          2022-05-08  185  		payload->path.dentry = NULL;
13100a72f40f57 Kirill Marinushkin 2016-04-12  186  	}
c1298a3a1139c9 Kees Cook          2022-05-08  187  	kfree_sensitive(payload->data);
c1298a3a1139c9 Kees Cook          2022-05-08  188  	payload->data = NULL;
ab3c3587f8cda9 David Howells      2013-09-24  189  }
ab3c3587f8cda9 David Howells      2013-09-24  190  
b6f61c31464940 David Howells      2020-05-12  191  /*
b6f61c31464940 David Howells      2020-05-12  192   * Update a big key
b6f61c31464940 David Howells      2020-05-12  193   */
b6f61c31464940 David Howells      2020-05-12  194  int big_key_update(struct key *key, struct key_preparsed_payload *prep)
b6f61c31464940 David Howells      2020-05-12  195  {
b6f61c31464940 David Howells      2020-05-12  196  	int ret;
b6f61c31464940 David Howells      2020-05-12  197  
b6f61c31464940 David Howells      2020-05-12  198  	ret = key_payload_reserve(key, prep->datalen);
b6f61c31464940 David Howells      2020-05-12  199  	if (ret < 0)
b6f61c31464940 David Howells      2020-05-12  200  		return ret;
b6f61c31464940 David Howells      2020-05-12  201  
b6f61c31464940 David Howells      2020-05-12  202  	if (key_is_positive(key))
b6f61c31464940 David Howells      2020-05-12  203  		big_key_destroy(key);
b6f61c31464940 David Howells      2020-05-12  204  
b6f61c31464940 David Howells      2020-05-12  205  	return generic_key_instantiate(key, prep);
b6f61c31464940 David Howells      2020-05-12  206  }
b6f61c31464940 David Howells      2020-05-12  207  
ab3c3587f8cda9 David Howells      2013-09-24  208  /*
ab3c3587f8cda9 David Howells      2013-09-24  209   * describe the big_key key
ab3c3587f8cda9 David Howells      2013-09-24  210   */
ab3c3587f8cda9 David Howells      2013-09-24  211  void big_key_describe(const struct key *key, struct seq_file *m)
ab3c3587f8cda9 David Howells      2013-09-24  212  {
c1298a3a1139c9 Kees Cook          2022-05-08  213  	struct big_key_payload *payload = to_big_key_payload(key->payload);
ab3c3587f8cda9 David Howells      2013-09-24  214  
ab3c3587f8cda9 David Howells      2013-09-24  215  	seq_puts(m, key->description);
ab3c3587f8cda9 David Howells      2013-09-24  216  
363b02dab09b32 David Howells      2017-10-04  217  	if (key_is_positive(key))
146aa8b1453bd8 David Howells      2015-10-21  218  		seq_printf(m, ": %zu [%s]",
c1298a3a1139c9 Kees Cook          2022-05-08  219  			   payload->length,
c1298a3a1139c9 Kees Cook          2022-05-08  220  			   payload->length > BIG_KEY_FILE_THRESHOLD ? "file" : "buff");
ab3c3587f8cda9 David Howells      2013-09-24  221  }
ab3c3587f8cda9 David Howells      2013-09-24  222  
ab3c3587f8cda9 David Howells      2013-09-24  223  /*
ab3c3587f8cda9 David Howells      2013-09-24  224   * read the key data
ab3c3587f8cda9 David Howells      2013-09-24  225   * - the key's semaphore is read-locked
ab3c3587f8cda9 David Howells      2013-09-24  226   */
d3ec10aa95819b Waiman Long        2020-03-21  227  long big_key_read(const struct key *key, char *buffer, size_t buflen)
ab3c3587f8cda9 David Howells      2013-09-24  228  {
c1298a3a1139c9 Kees Cook          2022-05-08  229  	struct big_key_payload *payload = to_big_key_payload(key->payload);
c1298a3a1139c9 Kees Cook          2022-05-08  230  	size_t datalen = payload->length;
ab3c3587f8cda9 David Howells      2013-09-24  231  	long ret;
ab3c3587f8cda9 David Howells      2013-09-24  232  
ab3c3587f8cda9 David Howells      2013-09-24  233  	if (!buffer || buflen < datalen)
ab3c3587f8cda9 David Howells      2013-09-24  234  		return datalen;
ab3c3587f8cda9 David Howells      2013-09-24  235  
ab3c3587f8cda9 David Howells      2013-09-24  236  	if (datalen > BIG_KEY_FILE_THRESHOLD) {
ab3c3587f8cda9 David Howells      2013-09-24  237  		struct file *file;
c1298a3a1139c9 Kees Cook          2022-05-08  238  		u8 *buf, *enckey = payload->data;
521fd61c84a19b Jason A. Donenfeld 2020-05-11  239  		size_t enclen = datalen + CHACHA20POLY1305_AUTHTAG_SIZE;
bdd1d2d3d251c6 Christoph Hellwig  2017-09-01  240  		loff_t pos = 0;
13100a72f40f57 Kirill Marinushkin 2016-04-12  241  
521fd61c84a19b Jason A. Donenfeld 2020-05-11  242  		buf = kvmalloc(enclen, GFP_KERNEL);
d9f4bb1a0f4db4 David Howells      2018-02-22  243  		if (!buf)
13100a72f40f57 Kirill Marinushkin 2016-04-12  244  			return -ENOMEM;
ab3c3587f8cda9 David Howells      2013-09-24  245  
c1298a3a1139c9 Kees Cook          2022-05-08  246  		file = dentry_open(&payload->path, O_RDONLY, current_cred());
13100a72f40f57 Kirill Marinushkin 2016-04-12  247  		if (IS_ERR(file)) {
13100a72f40f57 Kirill Marinushkin 2016-04-12  248  			ret = PTR_ERR(file);
13100a72f40f57 Kirill Marinushkin 2016-04-12  249  			goto error;
13100a72f40f57 Kirill Marinushkin 2016-04-12  250  		}
ab3c3587f8cda9 David Howells      2013-09-24  251  
13100a72f40f57 Kirill Marinushkin 2016-04-12  252  		/* read file to kernel and decrypt */
521fd61c84a19b Jason A. Donenfeld 2020-05-11  253  		ret = kernel_read(file, buf, enclen, &pos);
521fd61c84a19b Jason A. Donenfeld 2020-05-11  254  		if (ret != enclen) {
521fd61c84a19b Jason A. Donenfeld 2020-05-11  255  			if (ret >= 0)
ab3c3587f8cda9 David Howells      2013-09-24  256  				ret = -EIO;
13100a72f40f57 Kirill Marinushkin 2016-04-12  257  			goto err_fput;
13100a72f40f57 Kirill Marinushkin 2016-04-12  258  		}
13100a72f40f57 Kirill Marinushkin 2016-04-12  259  
521fd61c84a19b Jason A. Donenfeld 2020-05-11  260  		ret = chacha20poly1305_decrypt(buf, buf, enclen, NULL, 0, 0,
521fd61c84a19b Jason A. Donenfeld 2020-05-11 @261  					       enckey) ? 0 : -EBADMSG;
521fd61c84a19b Jason A. Donenfeld 2020-05-11  262  		if (unlikely(ret))
13100a72f40f57 Kirill Marinushkin 2016-04-12  263  			goto err_fput;
13100a72f40f57 Kirill Marinushkin 2016-04-12  264  
13100a72f40f57 Kirill Marinushkin 2016-04-12  265  		ret = datalen;
13100a72f40f57 Kirill Marinushkin 2016-04-12  266  
d3ec10aa95819b Waiman Long        2020-03-21  267  		/* copy out decrypted data */
521fd61c84a19b Jason A. Donenfeld 2020-05-11  268  		memcpy(buffer, buf, datalen);
13100a72f40f57 Kirill Marinushkin 2016-04-12  269  
13100a72f40f57 Kirill Marinushkin 2016-04-12  270  err_fput:
13100a72f40f57 Kirill Marinushkin 2016-04-12  271  		fput(file);
13100a72f40f57 Kirill Marinushkin 2016-04-12  272  error:
272a121940a286 Denis Efremov      2020-08-27  273  		kvfree_sensitive(buf, enclen);
ab3c3587f8cda9 David Howells      2013-09-24  274  	} else {
ab3c3587f8cda9 David Howells      2013-09-24  275  		ret = datalen;
c1298a3a1139c9 Kees Cook          2022-05-08  276  		memcpy(buffer, payload->data, datalen);
ab3c3587f8cda9 David Howells      2013-09-24  277  	}
ab3c3587f8cda9 David Howells      2013-09-24  278  
ab3c3587f8cda9 David Howells      2013-09-24  279  	return ret;
ab3c3587f8cda9 David Howells      2013-09-24  280  }
ab3c3587f8cda9 David Howells      2013-09-24  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
