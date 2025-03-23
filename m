Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE71F099D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742719728; cv=none; b=OtVo7dJ7Sk3PwL7lSt3PiUbjxyn9dr3BWEkEAnBv3+cF3q1PGTsaZH9tQNJ2330cA6C8Bfui+sQYwDdJhq8fzDwmWbB1IdgMARI7255gmsXH5pe3XyGmKdlSw5kQmIAyQ64WHEW1f1rYcRg67jmPizyQs5sssjKZxxmmmWEpyrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742719728; c=relaxed/simple;
	bh=YLoYIddIY8boU6Kna3t+CkDUn4OJV1sbrxjKmcHzd/c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=oZuIcegU4ZtCLYsEn2iO3XN4wu7/hlpi/zvZMIX1aRcWaSp5pm9NYRcmWLZeKgG3FX6x7g8l+x7PnXYWXBulMZLLlolveC94BagIYaC7QALJmxv6xW+J86EGcFgFtuOMgbObZUfq/uBy3oHPskADpwtgKgegnWOMsa1rDeAS15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=O65lF+sL; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="O65lF+sL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=ntqBCbUCpr/Mtgxw0QT/3YSOXMeDt68ZvHwK5MyDT90=;
  b=O65lF+sLOlPKmEsaQJgVTxAAAN64A4GxVJMCX7vhylWT0kwZR77IrvZU
   8qehLqKPgVccXniR9SXYx09WC+BLErKcJmWjLte8ZBKO5med4o+RMTyjm
   cRj0uZSd64glCYhY5bJ7XDo5k7SUc0wIx2hU/6rzam948lW+gYca1+5Ao
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,269,1736809200"; 
   d="scan'208";a="214279116"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 09:48:36 +0100
Date: Sun, 23 Mar 2025 09:48:35 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: cros-kernel-buildreports@googlegroups.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2] mm/shmem.c:4277:6-13:
 WARNING: Unsigned expression compared with zero: version < 0 (fwd)
Message-ID: <alpine.DEB.2.22.394.2503230948200.3562@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1985051817-1742719715=:3562"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1985051817-1742719715=:3562
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



---------- Forwarded message ----------
Date: Sun, 23 Mar 2025 09:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline-rust 2/2] mm/shmem.c:4277:6-13:
    WARNING: Unsigned expression compared with zero: version < 0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   69e641afed13f4ee53e66be0464646d326f9b5b1
commit: 58e55efd6c72cbc3e76423a1086f7b4d6c2ae9c2 [2/2] tmpfs: Add casefold lookup support
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-103-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230810.79D4qmtG-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503230810.79D4qmtG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/shmem.c:4277:6-13: WARNING: Unsigned expression compared with zero: version < 0

vim +4277 mm/shmem.c

626c3920aeb457 Al Viro       2019-09-08  4261
58e55efd6c72cb André Almeida 2024-10-21  4262  #if IS_ENABLED(CONFIG_UNICODE)
58e55efd6c72cb André Almeida 2024-10-21  4263  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param,
58e55efd6c72cb André Almeida 2024-10-21  4264  				    bool latest_version)
58e55efd6c72cb André Almeida 2024-10-21  4265  {
58e55efd6c72cb André Almeida 2024-10-21  4266  	struct shmem_options *ctx = fc->fs_private;
58e55efd6c72cb André Almeida 2024-10-21  4267  	unsigned int version = UTF8_LATEST;
58e55efd6c72cb André Almeida 2024-10-21  4268  	struct unicode_map *encoding;
58e55efd6c72cb André Almeida 2024-10-21  4269  	char *version_str = param->string + 5;
58e55efd6c72cb André Almeida 2024-10-21  4270
58e55efd6c72cb André Almeida 2024-10-21  4271  	if (!latest_version) {
58e55efd6c72cb André Almeida 2024-10-21  4272  		if (strncmp(param->string, "utf8-", 5))
58e55efd6c72cb André Almeida 2024-10-21  4273  			return invalfc(fc, "Only UTF-8 encodings are supported "
58e55efd6c72cb André Almeida 2024-10-21  4274  				       "in the format: utf8-<version number>");
58e55efd6c72cb André Almeida 2024-10-21  4275
58e55efd6c72cb André Almeida 2024-10-21  4276  		version = utf8_parse_version(version_str);
58e55efd6c72cb André Almeida 2024-10-21 @4277  		if (version < 0)
58e55efd6c72cb André Almeida 2024-10-21  4278  			return invalfc(fc, "Invalid UTF-8 version: %s", version_str);
58e55efd6c72cb André Almeida 2024-10-21  4279  	}
58e55efd6c72cb André Almeida 2024-10-21  4280
58e55efd6c72cb André Almeida 2024-10-21  4281  	encoding = utf8_load(version);
58e55efd6c72cb André Almeida 2024-10-21  4282
58e55efd6c72cb André Almeida 2024-10-21  4283  	if (IS_ERR(encoding)) {
58e55efd6c72cb André Almeida 2024-10-21  4284  		return invalfc(fc, "Failed loading UTF-8 version: utf8-%u.%u.%u\n",
58e55efd6c72cb André Almeida 2024-10-21  4285  			       unicode_major(version), unicode_minor(version),
58e55efd6c72cb André Almeida 2024-10-21  4286  			       unicode_rev(version));
58e55efd6c72cb André Almeida 2024-10-21  4287  	}
58e55efd6c72cb André Almeida 2024-10-21  4288
58e55efd6c72cb André Almeida 2024-10-21  4289  	pr_info("tmpfs: Using encoding : utf8-%u.%u.%u\n",
58e55efd6c72cb André Almeida 2024-10-21  4290  		unicode_major(version), unicode_minor(version), unicode_rev(version));
58e55efd6c72cb André Almeida 2024-10-21  4291
58e55efd6c72cb André Almeida 2024-10-21  4292  	ctx->encoding = encoding;
58e55efd6c72cb André Almeida 2024-10-21  4293
58e55efd6c72cb André Almeida 2024-10-21  4294  	return 0;
58e55efd6c72cb André Almeida 2024-10-21  4295  }
58e55efd6c72cb André Almeida 2024-10-21  4296  #else
58e55efd6c72cb André Almeida 2024-10-21  4297  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param,
58e55efd6c72cb André Almeida 2024-10-21  4298  				    bool latest_version)
58e55efd6c72cb André Almeida 2024-10-21  4299  {
58e55efd6c72cb André Almeida 2024-10-21  4300  	return invalfc(fc, "tmpfs: Kernel not built with CONFIG_UNICODE\n");
58e55efd6c72cb André Almeida 2024-10-21  4301  }
58e55efd6c72cb André Almeida 2024-10-21  4302  #endif
58e55efd6c72cb André Almeida 2024-10-21  4303

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
--8323329-1985051817-1742719715=:3562--
