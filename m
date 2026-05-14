Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34122CBD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774042; cv=pass; b=LDDKRXKAbLcPS/DnyC9nSz1AED0BCVOqgR9N8EjPPwAyaOQkJmb0/zO4mHkYYOMQk/pSWcjp77LUx7PHRupv7BCholQLb5oi0rUsVX81SSM/wQhjFzqrZnMBByHDeRvr71Q0olPG+3bNIRp1gHoifOoxN+zqIGLJ4EBHIdVHWDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774042; c=relaxed/simple;
	bh=PB7TqyyZVgqNQvdqVzKZtfFqkcaC344xcK/vqccehzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzUA6BJR1Y/tsQH8xFFUwpK6P+9dvPUwd4eBLaRwBysLRNt6fZMYDdgFAw0akQQA/d0FKFQNokipIWWtuwMVsDv791P0JmgXkJ88Ejp0DaJ+dc3rOMuSb/Uoqg+adgaOCs7uWXr85pJJdu4D9r1iIF03uHKhDP9I7iyvhidI9xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z/2rqqip; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z/2rqqip"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so2238607f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 08:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778774039; cv=none;
        d=google.com; s=arc-20240605;
        b=jdwV0LI6I+WKpnvdVLEfD/5dJxV+2ySnl/muYxRGc3Z+Kb1ej74OJgj6vsW2BbsL6s
         pe6/kfN6N5hHiiSA1G03dITI7dy83On6/4snG6IYbRko9mGBJ/UkHbB4qq5m7i5v4hIf
         KUbpJPPZRa4iPWfe3mtdHqLZ37bXOF4zOt/Co3kFBAuzbm2tv3Oqs5gFkprdYa3MuAl5
         o3CMTXB8BzSjsFswyqCGkJR7sSCeGHOERZkjMMXLjADB2bHfxv+jy5Ac1Mtw+ik7SrNR
         s9mcJQntgd9YkOtxlcSWQE5rEdxWmclXcbKrIApIabN1HIGMUHd/5EbxUZZDeDJrlrDE
         2hmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qgMQH6usPIkZejIGBuY5jChLc33tsiRQigpr96nPY/k=;
        fh=Q8Mh428VQGKBtbREXCNgh0GfCrx0vxojtASjMBIUvfg=;
        b=Lq22KuJEO4c/gNyM8ni4xahNMkRkQwJE+lOQdryweTLwetI+0562vY0/6I/RuAC7G4
         2KCh/Do5iuWUSm2dvz3SfuLGfHq0GMFbS10Baz1xnSRJDBVppGUKd93LjnQJErbEJrae
         uJGMHZQJGXR0jbasgH+QjZzgrV4DDI4PDsVQ53Dt3TV9R2MTF23MdULxbFuPZNUG9h3N
         LO77lxfPASp3DEvnAe8TCIyOb5UIVxqCO8VWz4l2f/SM87TuVLlrqTAJTkh9/L0CcGRS
         UGRTX++WyHteckMysjRgaJ3bBkJUBJTs9VSC+ga6zv1MJsAKk4vHGTFGPBR2DKSG0QXo
         tdag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778774039; x=1779378839; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qgMQH6usPIkZejIGBuY5jChLc33tsiRQigpr96nPY/k=;
        b=Z/2rqqipk4xmAI66624vWQ1xdTCAGc/1qh5DCDndBXtczge1vc0Yo9EisaIpbESS6q
         MUFao2EiJ9d59+vcoTy+SvdhXhPy8Ryz4MhMTAi/Ey4HZyGJkgSv724/rLrtNqIQQ4kT
         8/Y0LdlV0GIqbvaVLdHIoQSARvG3axB/Q/g1OviU5tVadcmfPcJOpIKSf4rHjwFNlcjD
         l4fDVFR/Cw/MomP6S6fH8wsFOj0gxupihkrcAI74pmE/fjElN6QTGV+PJ94gfCmQD/oA
         tyWbDHmCWDvzgzsUS2vjYQI7Tep9pHRFlhrEhVFQnm/3CCJPp5wYNA7MFQilqlbt5Dmc
         Rvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778774039; x=1779378839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgMQH6usPIkZejIGBuY5jChLc33tsiRQigpr96nPY/k=;
        b=ZfDLq+QcVatXJ/NAdlnUTcLR088zmL3Pozm02SXQlwzyLonnPLWKLTfNA3MY/uMDsw
         eWyZ8EB7vKtag5NS2ntS9BxKg5U59jajntGS5+cNB7tgBkbDTpG3lcBs9K3xZDiKPCS7
         e+1lOxZ2mgSU+rodTUdrgnQOkKuPpVvBcYhqIw06T717b2gu7esorqsrrU04rfiER25f
         7ZsidxNRs3MT9KRU8t1XhUJ0lHX6Kadnq9LsZK6apraY4psUqtGz6n+VxLaqhGK3TbiN
         N9UqdRuA3NOMZej8cNi7yDk0FVsf9Cem9vKHOp6hc72vhiq1BbYHna4ZF9GUZzL4EDUb
         KgEA==
X-Forwarded-Encrypted: i=1; AFNElJ+RN9ab8GeDQd0VXGcTGIBNhObU0O9nbNi5WcsLQ0V8jHe+8Ai0p/bzfOhL8WzzR5SJ0w5fkzWcKwmL44u/@lists.linux.dev
X-Gm-Message-State: AOJu0YwsI8Az5Mev9hImYZTedl5/0aWT49WlFCafaAfuMN8X0evxXLjJ
	L4XbgPf0x/yu226JuCBdchJRQ64KOo9+rryhK4zetBKJxt3XohwR/E282w2PJoEpKP9i00GKc9G
	x2BASHAi0ECaYj7xemmeS40TS6C/3G7tCgRaBZJvyog==
X-Gm-Gg: Acq92OGkQ80HWU1bJf05/XRxQiiJJqbfkvYo41FyS7j9LIQ+CsG+lyBroIqwcgI2Mcu
	pWfUQLhplmrFks0c2x3m33vDZmwAz6hpgPm35AoxocBpWjIrddGBXOsLQRLecD+uINpNDWtVdA1
	C+QY4Le42oBXY3qEU6esPs665PDK5aQOeZPykLB1k3/dyN8vlq4JrvCUh1cHhJvdrXtqQHoeof8
	OBZx5oEkzy5GvshI10O0/deuBOJ8BDFl5S5mwbWftWvpZioau8dvoWcw4wUMB54OCLIk8c5qsJ3
	+OFjvWc+F9X9016c6/8viUDHxSJLSnkL/XmQklxWybn8OJEuAc0aXQsf+HXNEVbsYCd/69eyhbC
	qhUky
X-Received: by 2002:a05:6000:26c3:b0:43d:773d:78ff with SMTP id
 ffacd0b85a97d-45c59bd694dmr13057668f8f.27.1778774039166; Thu, 14 May 2026
 08:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140957.DjseWRNF-lkp@intel.com>
In-Reply-To: <202605140957.DjseWRNF-lkp@intel.com>
From: Daniel Vacek <neelx@suse.com>
Date: Thu, 14 May 2026 17:53:48 +0200
X-Gm-Features: AVHnY4KVJUQxROYdVpnRn9I-OXiF2fc1Yoza92-zbX1sbPfg2LPOazrV6rKQVc4
Message-ID: <CAPjX3FduCSJWY_Qx53ADfh1tpvsAjM7XCa=j1JjL3OYF8B4D7w@mail.gmail.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 32/43] fs/btrfs/fscrypt.c:240:34:
 sparse: sparse: incorrect type in return expression (different base types)
To: kernel test robot <lkp@intel.com>
Cc: Josef Bacik <josef@toxicpanda.com>, oe-kbuild-all@lists.linux.dev, 
	David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 03:51, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> commit: fda37caa264ff597b0fc03039dc95e392432bbc5 [32/43] btrfs: implement process_bio cb for fscrypt
> config: alpha-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605140957.DjseWRNF-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> fs/btrfs/fscrypt.c:240:34: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_status_t @@     got int @@
>    fs/btrfs/fscrypt.c:240:34: sparse:     expected restricted blk_status_t
>    fs/btrfs/fscrypt.c:240:34: sparse:     got int

@@ -238,7 +238,7 @@ static blk_status_t
btrfs_process_encrypted_bio(struct bio *orig_bio,
         ASSERT(orig_bio == enc_bio);
         return btrfs_check_encrypted_read_bio(bbio, enc_bio);
     }
-    return btrfs_csum_one_bio(bbio, enc_bio, false);
+    return btrfs_csum_one_bio(bbio, enc_bio, false)? BLK_STS_IOERR: BLK_STS_OK;
 }

This should do the trick.

--nX

>
> vim +240 fs/btrfs/fscrypt.c
>
>    215
>    216  static blk_status_t btrfs_process_encrypted_bio(struct bio *orig_bio,
>    217                                                  struct bio *enc_bio)
>    218  {
>    219          struct btrfs_bio *bbio;
>    220
>    221          /*
>    222           * If our bio is from the normal fs_bio_set then we know this is a
>    223           * mirror split and we can skip it, we'll get the real bio on the last
>    224           * mirror and we can process that one.
>    225           */
>    226          if (orig_bio->bi_pool == &fs_bio_set)
>    227                  return BLK_STS_OK;
>    228
>    229          bbio = btrfs_bio(orig_bio);
>    230
>    231          if (bio_op(orig_bio) == REQ_OP_READ) {
>    232                  /*
>    233                   * We have ->saved_iter based on the orig_bio, so if the block
>    234                   * layer changes we need to notice this asap so we can update
>    235                   * our code to handle the new world order.
>    236                   */
>    237                  ASSERT(orig_bio == enc_bio);
>    238                  return btrfs_check_encrypted_read_bio(bbio, enc_bio);
>    239          }
>  > 240          return btrfs_csum_one_bio(bbio, enc_bio, false);
>    241  }
>    242
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
