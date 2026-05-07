Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A244397E81
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192568; cv=none; b=OX5WnImDxiUewqgj+FE+IMMlIrhXm3cF7Q+8ycoiaq/g2qBvIZ4KDVI8NqMCISjrAAmAj0iEh0voWlMZkyt/k0LkK5WXQCOowpQfrKgIjsRxYC5NeO9N4p/HyAjtIQUi9eFgctlz87KTyhjlCW+tVdRUT+BO8oP45q8H2p3Fr/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192568; c=relaxed/simple;
	bh=c92rYm+JUAYlt1T3bBf1Xi2vyEnYZtr6axQLo/Z9BNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HzxS0kBjEGB9q7Aw5WL50QguXh9k0lc89KzoqJAKu9GKflhLS+Ph+v57HawQqwdE9xNdg7cMa3y2kf6mi2qY/3NkCsJjk4WCIv8DR/Syo1QaQlwP2HWWMcAprCvcswu53C+lUTkEoUcJiSVOTpXa9F+Y3SbOROaRBYxQSj+nQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrPt03mC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrPt03mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778192567; x=1809728567;
  h=date:from:to:cc:subject:message-id;
  bh=c92rYm+JUAYlt1T3bBf1Xi2vyEnYZtr6axQLo/Z9BNA=;
  b=MrPt03mC8iPrdSgfkDmKrlvYOpG9fW7SJXdSLitqGYX5lvwcfeUZY4YL
   OXdgBrwMgH/14v9IFQ9/r2bCMuBPyZxg1LcvKIEalnDQLQfHpfXbaN/Vb
   /deKJ+6SW5wOVBNyiJuTbbTnMLSHLfLL7MjpS2U+BlNKZ0XrrpgZCQXch
   yKiEjNOoUQk/bmj0wWYBZsVCjcjSuUd48kxh12pf0R/1MmGmwa6wO8NQL
   gak7Giz3GSAZZGWq1jQ1Nni2kCRwQ/VXhrH7yxul6VdgR+WdejB3vBetF
   NQOXuBYdi5BpTLj+we/HqdO/OU0LY9p6MWmXDsM0nn7bk7fQQcBXq81rK
   A==;
X-CSE-ConnectionGUID: OgqRCBjTQbexhrpfJ3Ol0A==
X-CSE-MsgGUID: qrmEKlF4QuatfGa6OiCz0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79059608"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79059608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 15:22:46 -0700
X-CSE-ConnectionGUID: yte2/ixOSo2Y382GbJOQaQ==
X-CSE-MsgGUID: T75K5BPETfCVK4+cpopHlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="260033296"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2026 15:22:44 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL77B-000000000WZ-2MWA;
	Thu, 07 May 2026 22:22:41 +0000
Date: Fri, 08 May 2026 06:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>,
 Linlin Zhang <linlin.zhang@oss.qualcomm.com>
Subject: [linux-next:master 3785/4176]
 drivers/md/dm-inlinecrypt.c:329 inlinecrypt_ctr() warn: unsigned
 'ctx->key_size' is never less than zero.
Message-ID: <202605080638.NXLkvBwM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: 753450f716417f53759c91b5bb7b96563379a719 [3785/4176] dm-inlinecrypt: add target for inline block device encryption
config: hexagon-randconfig-r073-20260508 (https://download.01.org/0day-ci/archive/20260508/202605080638.NXLkvBwM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080638.NXLkvBwM-lkp@intel.com/

smatch warnings:
drivers/md/dm-inlinecrypt.c:329 inlinecrypt_ctr() warn: unsigned 'ctx->key_size' is never less than zero.
drivers/md/dm-inlinecrypt.c:329 inlinecrypt_ctr() warn: error code type promoted to positive: 'ctx->key_size'

vim +329 drivers/md/dm-inlinecrypt.c

   283	
   284	/*
   285	 * Construct an inlinecrypt mapping:
   286	 * <cipher> [<key>|:<key_size>:<logon>:<key_description>] <iv_offset> <dev_path> <start>
   287	 *
   288	 * This syntax matches dm-crypt's, but the set of supported functionality has
   289	 * been stripped down.
   290	 */
   291	static int inlinecrypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
   292	{
   293		struct inlinecrypt_ctx *ctx;
   294		const struct dm_inlinecrypt_cipher *cipher;
   295		u8 raw_key[BLK_CRYPTO_MAX_ANY_KEY_SIZE];
   296		unsigned int dun_bytes;
   297		unsigned long long tmpll;
   298		char dummy;
   299		int err;
   300	
   301		if (argc < 5) {
   302			ti->error = "Not enough arguments";
   303			return -EINVAL;
   304		}
   305	
   306		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   307		if (!ctx) {
   308			ti->error = "Out of memory";
   309			return -ENOMEM;
   310		}
   311		ti->private = ctx;
   312	
   313		/* <cipher> */
   314		ctx->cipher_string = kstrdup(argv[0], GFP_KERNEL);
   315		if (!ctx->cipher_string) {
   316			ti->error = "Out of memory";
   317			err = -ENOMEM;
   318			goto bad;
   319		}
   320		cipher = lookup_cipher(ctx->cipher_string);
   321		if (!cipher) {
   322			ti->error = "Unsupported cipher";
   323			err = -EINVAL;
   324			goto bad;
   325		}
   326	
   327		/* <key> */
   328		ctx->key_size = get_key_size(&argv[1]);
 > 329		if (ctx->key_size < 0) {
   330			ti->error = "Cannot parse key size";
   331			return -EINVAL;
   332		}
   333		err = inlinecrypt_get_key(argv[1], raw_key, ctx->key_size);
   334		if (err) {
   335			ti->error = "Malformed key string";
   336			goto bad;
   337		}
   338	
   339		/* <iv_offset> */
   340		if (sscanf(argv[2], "%llu%c", &ctx->iv_offset, &dummy) != 1) {
   341			ti->error = "Invalid iv_offset sector";
   342			err = -EINVAL;
   343			goto bad;
   344		}
   345	
   346		/* <dev_path> */
   347		err = dm_get_device(ti, argv[3], dm_table_get_mode(ti->table),
   348				    &ctx->dev);
   349		if (err) {
   350			ti->error = "Device lookup failed";
   351			goto bad;
   352		}
   353	
   354		/* <start> */
   355		if (sscanf(argv[4], "%llu%c", &tmpll, &dummy) != 1 ||
   356		    tmpll != (sector_t)tmpll) {
   357			ti->error = "Invalid start sector";
   358			err = -EINVAL;
   359			goto bad;
   360		}
   361		ctx->start = tmpll;
   362	
   363		/* optional arguments */
   364		ctx->sector_size = SECTOR_SIZE;
   365		if (argc > 5) {
   366			err = inlinecrypt_ctr_optional(ti, argc - 5, &argv[5]);
   367			if (err)
   368				goto bad;
   369		}
   370		ctx->sector_bits = ilog2(ctx->sector_size);
   371		if (ti->len & ((ctx->sector_size >> SECTOR_SHIFT) - 1)) {
   372			ti->error = "Device size is not a multiple of sector_size";
   373			err = -EINVAL;
   374			goto bad;
   375		}
   376		if (ctx->iv_offset & ((ctx->sector_size >> SECTOR_SHIFT) - 1)) {
   377			ti->error = "Wrong alignment of iv_offset sector";
   378			err = -EINVAL;
   379		}
   380	
   381		ctx->max_dun = (ctx->iv_offset + ti->len - 1) >>
   382			       (ctx->sector_bits - SECTOR_SHIFT);
   383		dun_bytes = DIV_ROUND_UP(fls64(ctx->max_dun), 8);
   384	
   385		err = blk_crypto_init_key(&ctx->key, raw_key, ctx->key_size,
   386					  BLK_CRYPTO_KEY_TYPE_RAW,
   387					  cipher->mode_num, dun_bytes,
   388					  ctx->sector_size);
   389		if (err) {
   390			ti->error = "Error initializing blk-crypto key";
   391			goto bad;
   392		}
   393	
   394		err = blk_crypto_start_using_key(ctx->dev->bdev, &ctx->key);
   395		if (err) {
   396			ti->error = "Error starting to use blk-crypto";
   397			goto bad;
   398		}
   399	
   400		ti->num_flush_bios = 1;
   401	
   402		err = 0;
   403		goto out;
   404	
   405	bad:
   406		inlinecrypt_dtr(ti);
   407	out:
   408		memzero_explicit(raw_key, sizeof(raw_key));
   409		return err;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
