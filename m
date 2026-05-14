Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0ED3FA5D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778772875; cv=pass; b=Of9IQ7Amf18ide8puHcXcVqp0fdAXrHuBHjcI5kpFYjWhLnVjyq5DOG4EA9S9sjxI5lukj0k3ePSRaL3JQ44rir2st3gh7xPthTetFBv0yI32NOj041b2Rlww95a3tX0bTJANmSACjCwjQyP5EJ/F6EbpwJrV8yWuBquJsiUW04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778772875; c=relaxed/simple;
	bh=KfuOoLHBlecMG5jWytudA3QypY0etoDmvNo+cj7c09I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8sfXdge6qzYCIKGSaj6ucOekxYJNYi7uUj05taCgPgnuyzShC8axRzy+V9NHd5OV3Hx7uz+8E2GVwxRU3KF3cNvjfZfz3n2WIbKFC/DapAqA7LEGszlN32hXHxkFScxFvjCTjn2F0Y0BXFiK2rBJyMjqfqL0NPMqJsHtqWKVVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cmhLRWlU; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cmhLRWlU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a74032ff8so6061104f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 08:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778772872; cv=none;
        d=google.com; s=arc-20240605;
        b=bamKl99GyZlFCVXRiCMbUQKzMZr8ChBdZjAtuEr+3WQShLOruNIVDAcOnuBhVlgX2L
         6WEqffRpsQJXQQgwIt08BUbmeKOD9gtVMPqLYWIM5jAlp+CAIryNRJ+RR1J2Kq4fY2yT
         9EsWVMQiUJNp1OrMXcbcKkd41IfnFMGzF/w+PfzzXzhxrHcilwn81/JE1oVNdpzQGPOj
         /vAtYnl+Vdr5v2P/1Mr99d0S1lHSGdG6Figx18mGKqvMDfRDus8VfBLHPfEW9lT/HQ3B
         GnLGreZlikiFRa5qAmdr9ODhTTd8+3O+XUucKqoS3UYCTatZ2mjDMdp7LNpGWp2nWTvQ
         FHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pf+h8+h8JIUbkD3+bX/Cdm5rMg+pNvi9MUB7PeSBqT0=;
        fh=NAeCQ0Sqexf8kDLYNBWFJbKd9JKy08O9zrDRgJXslS4=;
        b=R5pn5SnnnCrbbhxj3dCBf9l4dUc8AUXd1pAlG5GzC8cReKUljuA+9F9mDGx4mueqW+
         ZHxY3/UPknKafe+UE0gOzem7Ed6Eab5NxBm/klWT5z8I+eMj0u24l4LMiItYaKqqCTGN
         lKoR31+zEziTqUkI0baJgjK3HFK1o8GlYyouVmoXYH2V1Xc8P6MyYEmLcG4UfN/Dl/iW
         QrlPaxHV3E1vRsa6pPO7/9w+o5yzY03zXuWwWGxTrZ2vAvZ60a3fUvaHIfUxMCMi2/k9
         RXeM96dTkcP+c/GmAVmt0gztWku/BYvMM2xmACTdPvI3FZq7UFmppIk9GMs74P0F9PuR
         ukqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778772872; x=1779377672; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pf+h8+h8JIUbkD3+bX/Cdm5rMg+pNvi9MUB7PeSBqT0=;
        b=cmhLRWlUjsM45Q+Ey0E0ISCla8kdp6F/5FhRdlss/LoNZJXzYbuYyb0cGJBHhh1YVy
         AlEdpQZHor/RfLP98HhzSYdboHMKAALGbVag2VR2OtV9tlVh3Vy1ZcayPhBKCp8vqvYL
         4JxrsthtOwsCpVeiTMcrjjqBbaSIhTNRTH7pKET+YeThSbVIp0c+snR+FWiH4wOjjcO2
         fnuMkkbVtT9wdvlsqmVYaBsf54AKBNuf/mKZ/bMHHyNPDjGTkVyPHyar+HeUmObp03UZ
         4gHEoAjVYPzyhSnwK7r+l6CGcj++tPeol1IhHAR1i4DZaUw/1PUXHV1CKHn83ueBjKbh
         cLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778772872; x=1779377672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf+h8+h8JIUbkD3+bX/Cdm5rMg+pNvi9MUB7PeSBqT0=;
        b=B6WmwCnrNSTsIDosZc4z6OX7I4NYJmx9mHJZ8x6YFeTFt30qTUnG/Lr01B6xo0TaGg
         eTZ9Jyf459dccrRpLc0uGqx99UjWrijbxpUaKPk+1YALZrxefg36gYngD25IS9Mhw576
         HVXOU9O08rmRwvqadHKe/IMFamD5MUgOeu35dK84va0qyji0sq0dbPbv//gr7Pfmi0eT
         38wyX1sAD8kpmEc+4fCP2kmlnd9JH0l3tWDw0nYWPBWqK90VAz5MCBIWwIvXRjjU67AA
         Ng0/rMVM6Kk6ts89voY+sWfTumguSpu4q6BlTcHT+M4djDGcx85Mam18nr9MpA+zMhxT
         +0fQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yMWphgrWfEixk4+3x8/edWzUQmXkVqqPNXr0N0HeJ6ZqwELiRlof9p3ZJrCVjwojhtJVkhznhGh0SQcGU@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr49AIhftgvoulbnrYdFSgaMcg9ecnFrN4so+B2D8GcPAv4gNe
	MFkHTQsoa64gMFWktYWEOtbGldAtmma4JWZFQGwtrkQA8mvtVmfWVUurVItaHWTiK9UqY5ksQJG
	EqcsUnJAyamjojP+ORfSQI5L5rCcH4Hw56YfbXoO8lQ==
X-Gm-Gg: Acq92OHnpEdLMlUXH17VKrIw4DIbyovWsSVFMpMCmG8axUsFZITYVrGMa53eXrv4Kil
	Bd5v9uhZ++vHrj5EF6FQWh2lzuml90p0D8/g1GH7XAYfDtF2cGwN+IjMmG9A+kfst0gUC7O3ZdD
	331vLPEzHxpOGETPWbdExhY5LmlINpdeK+BYCDcdlyY97zXagD26X6CyfaT/uYjseFGU4XMUlPo
	ZciYkoKbV3w5yJ9BjDAdPE18DIPk+4P2Ntyu9/1cwIx9fVo7vkpWi1334ML/ngrvWZzJCQry3s/
	Xm6VLgkXgSlQrtnnPiwIzHLfWFgo0AykXhEC0xjXDzkXoZHOeyK0Txgtr/BwDv2NlhK/KaMrN5e
	xvilxlKIMiUjLiBdh5d1Z7NSYYQ==
X-Received: by 2002:a05:6000:1865:b0:43d:740:fb37 with SMTP id
 ffacd0b85a97d-45c7aea1a60mr12997807f8f.24.1778772871718; Thu, 14 May 2026
 08:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140955.Dr60lOTF-lkp@intel.com>
In-Reply-To: <202605140955.Dr60lOTF-lkp@intel.com>
From: Daniel Vacek <neelx@suse.com>
Date: Thu, 14 May 2026 17:34:20 +0200
X-Gm-Features: AVHnY4J1cV_3hREaQN3v7TGFi2SHCasp71zI4aR53a-eiMxwbyJV4IW9ZjY0pVQ
Message-ID: <CAPjX3Ffy5eThg4tDhvLYh-Vb3gzbSMzhkL8pJfDgtt-YD6CTTA@mail.gmail.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 34/43] fs/btrfs/super.c:659:3:
 error: a label can only be part of a statement and a declaration is not a statement
To: kernel test robot <lkp@intel.com>
Cc: Josef Bacik <josef@toxicpanda.com>, oe-kbuild-all@lists.linux.dev, 
	David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 03:28, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
> config: nios2-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9185-gbcc58b9c
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605140955.Dr60lOTF-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/btrfs/super.c: In function 'btrfs_parse_param':
> >> fs/btrfs/super.c:659:3: error: a label can only be part of a statement and a declaration is not a statement
>       int ret;
>       ^~~

And here we are. Old gcc also complains. Though it is less clear :-/
So this?:

--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -347,6 +347,9 @@ static int btrfs_parse_param(struct fs_context
*fc, struct fs_parameter *param)
     struct btrfs_fs_context *ctx = fc->fs_private;
     struct fs_parse_result result;
     int opt;
+#ifdef CONFIG_BTRFS_DEBUG
+    int ret;
+#endif

     opt = fs_parse(fc, btrfs_fs_parameters, param, &result);
     if (opt < 0)
@@ -656,8 +659,6 @@ static int btrfs_parse_param(struct fs_context
*fc, struct fs_parameter *param)
         btrfs_set_opt(ctx->mount_opt, REF_TRACKER);
         break;
     case Opt_test_dummy_encryption:
-        int ret;
-
         /*
          * We only support v2, so reject any v1 policies.
          */

Not exactly nice but it works.

--nX

>
>
> vim +659 fs/btrfs/super.c
>
>    344
>    345  static int btrfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>    346  {
>    347          struct btrfs_fs_context *ctx = fc->fs_private;
>    348          struct fs_parse_result result;
>    349          int opt;
>    350
>    351          opt = fs_parse(fc, btrfs_fs_parameters, param, &result);
>    352          if (opt < 0)
>    353                  return opt;
>    354
>    355          switch (opt) {
>    356          case Opt_degraded:
>    357                  btrfs_set_opt(ctx->mount_opt, DEGRADED);
>    358                  break;
>    359          case Opt_subvol_empty:
>    360                  /*
>    361                   * This exists because we used to allow it on accident, so we're
>    362                   * keeping it to maintain ABI.  See 37becec95ac3 ("Btrfs: allow
>    363                   * empty subvol= again").
>    364                   */
>    365                  break;
>    366          case Opt_subvol:
>    367                  kfree(ctx->subvol_name);
>    368                  ctx->subvol_name = kstrdup(param->string, GFP_KERNEL);
>    369                  if (!ctx->subvol_name)
>    370                          return -ENOMEM;
>    371                  break;
>    372          case Opt_subvolid:
>    373                  ctx->subvol_objectid = result.uint_64;
>    374
>    375                  /* subvolid=0 means give me the original fs_tree. */
>    376                  if (!ctx->subvol_objectid)
>    377                          ctx->subvol_objectid = BTRFS_FS_TREE_OBJECTID;
>    378                  break;
>    379          case Opt_device: {
>    380                  struct btrfs_device *device;
>    381
>    382                  mutex_lock(&uuid_mutex);
>    383                  device = btrfs_scan_one_device(param->string, false);
>    384                  mutex_unlock(&uuid_mutex);
>    385                  if (IS_ERR(device))
>    386                          return PTR_ERR(device);
>    387                  break;
>    388          }
>    389          case Opt_datasum:
>    390                  if (result.negated) {
>    391                          btrfs_set_opt(ctx->mount_opt, NODATASUM);
>    392                  } else {
>    393                          btrfs_clear_opt(ctx->mount_opt, NODATACOW);
>    394                          btrfs_clear_opt(ctx->mount_opt, NODATASUM);
>    395                  }
>    396                  break;
>    397          case Opt_datacow:
>    398                  if (result.negated) {
>    399                          btrfs_clear_opt(ctx->mount_opt, COMPRESS);
>    400                          btrfs_clear_opt(ctx->mount_opt, FORCE_COMPRESS);
>    401                          btrfs_set_opt(ctx->mount_opt, NODATACOW);
>    402                          btrfs_set_opt(ctx->mount_opt, NODATASUM);
>    403                  } else {
>    404                          btrfs_clear_opt(ctx->mount_opt, NODATACOW);
>    405                  }
>    406                  break;
>    407          case Opt_compress_force:
>    408          case Opt_compress_force_type:
>    409                  btrfs_set_opt(ctx->mount_opt, FORCE_COMPRESS);
>    410                  fallthrough;
>    411          case Opt_compress:
>    412          case Opt_compress_type:
>    413                  if (btrfs_parse_compress(ctx, param, opt))
>    414                          return -EINVAL;
>    415                  break;
>    416          case Opt_ssd:
>    417                  if (result.negated) {
>    418                          btrfs_set_opt(ctx->mount_opt, NOSSD);
>    419                          btrfs_clear_opt(ctx->mount_opt, SSD);
>    420                          btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
>    421                  } else {
>    422                          btrfs_set_opt(ctx->mount_opt, SSD);
>    423                          btrfs_clear_opt(ctx->mount_opt, NOSSD);
>    424                  }
>    425                  break;
>    426          case Opt_ssd_spread:
>    427                  if (result.negated) {
>    428                          btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
>    429                  } else {
>    430                          btrfs_set_opt(ctx->mount_opt, SSD);
>    431                          btrfs_set_opt(ctx->mount_opt, SSD_SPREAD);
>    432                          btrfs_clear_opt(ctx->mount_opt, NOSSD);
>    433                  }
>    434                  break;
>    435          case Opt_barrier:
>    436                  if (result.negated)
>    437                          btrfs_set_opt(ctx->mount_opt, NOBARRIER);
>    438                  else
>    439                          btrfs_clear_opt(ctx->mount_opt, NOBARRIER);
>    440                  break;
>    441          case Opt_thread_pool:
>    442                  if (result.uint_32 == 0) {
>    443                          btrfs_err(NULL, "invalid value 0 for thread_pool");
>    444                          return -EINVAL;
>    445                  }
>    446                  ctx->thread_pool_size = result.uint_32;
>    447                  break;
>    448          case Opt_max_inline:
>    449                  ctx->max_inline = memparse(param->string, NULL);
>    450                  break;
>    451          case Opt_acl:
>    452                  if (result.negated) {
>    453                          fc->sb_flags &= ~SB_POSIXACL;
>    454                  } else {
>    455  #ifdef CONFIG_BTRFS_FS_POSIX_ACL
>    456                          fc->sb_flags |= SB_POSIXACL;
>    457  #else
>    458                          btrfs_err(NULL, "support for ACL not compiled in");
>    459                          return -EINVAL;
>    460  #endif
>    461                  }
>    462                  /*
>    463                   * VFS limits the ability to toggle ACL on and off via remount,
>    464                   * despite every file system allowing this.  This seems to be
>    465                   * an oversight since we all do, but it'll fail if we're
>    466                   * remounting.  So don't set the mask here, we'll check it in
>    467                   * btrfs_reconfigure and do the toggling ourselves.
>    468                   */
>    469                  if (fc->purpose != FS_CONTEXT_FOR_RECONFIGURE)
>    470                          fc->sb_flags_mask |= SB_POSIXACL;
>    471                  break;
>    472          case Opt_treelog:
>    473                  if (result.negated)
>    474                          btrfs_set_opt(ctx->mount_opt, NOTREELOG);
>    475                  else
>    476                          btrfs_clear_opt(ctx->mount_opt, NOTREELOG);
>    477                  break;
>    478          case Opt_norecovery:
>    479                  btrfs_info(NULL,
>    480  "'norecovery' is for compatibility only, recommended to use 'rescue=nologreplay'");
>    481                  btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
>    482                  break;
>    483          case Opt_flushoncommit:
>    484                  if (result.negated)
>    485                          btrfs_clear_opt(ctx->mount_opt, FLUSHONCOMMIT);
>    486                  else
>    487                          btrfs_set_opt(ctx->mount_opt, FLUSHONCOMMIT);
>    488                  break;
>    489          case Opt_ratio:
>    490                  ctx->metadata_ratio = result.uint_32;
>    491                  break;
>    492          case Opt_discard:
>    493                  if (result.negated) {
>    494                          btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
>    495                          btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
>    496                          btrfs_set_opt(ctx->mount_opt, NODISCARD);
>    497                  } else {
>    498                          btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
>    499                          btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
>    500                  }
>    501                  break;
>    502          case Opt_discard_mode:
>    503                  switch (result.uint_32) {
>    504                  case Opt_discard_sync:
>    505                          btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
>    506                          btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
>    507                          break;
>    508                  case Opt_discard_async:
>    509                          btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
>    510                          btrfs_set_opt(ctx->mount_opt, DISCARD_ASYNC);
>    511                          break;
>    512                  default:
>    513                          btrfs_err(NULL, "unrecognized discard mode value %s",
>    514                                    param->key);
>    515                          return -EINVAL;
>    516                  }
>    517                  btrfs_clear_opt(ctx->mount_opt, NODISCARD);
>    518                  break;
>    519          case Opt_space_cache:
>    520                  if (result.negated) {
>    521                          btrfs_set_opt(ctx->mount_opt, NOSPACECACHE);
>    522                          btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
>    523                          btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
>    524                  } else {
>    525                          btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
>    526                          btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
>    527                  }
>    528                  break;
>    529          case Opt_space_cache_version:
>    530                  switch (result.uint_32) {
>    531                  case Opt_space_cache_v1:
>    532                          btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
>    533                          btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
>    534                          break;
>    535                  case Opt_space_cache_v2:
>    536                          btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
>    537                          btrfs_set_opt(ctx->mount_opt, FREE_SPACE_TREE);
>    538                          break;
>    539                  default:
>    540                          btrfs_err(NULL, "unrecognized space_cache value %s",
>    541                                    param->key);
>    542                          return -EINVAL;
>    543                  }
>    544                  break;
>    545          case Opt_rescan_uuid_tree:
>    546                  btrfs_set_opt(ctx->mount_opt, RESCAN_UUID_TREE);
>    547                  break;
>    548          case Opt_clear_cache:
>    549                  btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
>    550                  break;
>    551          case Opt_user_subvol_rm_allowed:
>    552                  btrfs_set_opt(ctx->mount_opt, USER_SUBVOL_RM_ALLOWED);
>    553                  break;
>    554          case Opt_enospc_debug:
>    555                  if (result.negated)
>    556                          btrfs_clear_opt(ctx->mount_opt, ENOSPC_DEBUG);
>    557                  else
>    558                          btrfs_set_opt(ctx->mount_opt, ENOSPC_DEBUG);
>    559                  break;
>    560          case Opt_defrag:
>    561                  if (result.negated)
>    562                          btrfs_clear_opt(ctx->mount_opt, AUTO_DEFRAG);
>    563                  else
>    564                          btrfs_set_opt(ctx->mount_opt, AUTO_DEFRAG);
>    565                  break;
>    566          case Opt_usebackuproot:
>    567                  btrfs_warn(NULL,
>    568                             "'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead");
>    569                  btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
>    570
>    571                  /* If we're loading the backup roots we can't trust the space cache. */
>    572                  btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
>    573                  break;
>    574          case Opt_skip_balance:
>    575                  btrfs_set_opt(ctx->mount_opt, SKIP_BALANCE);
>    576                  break;
>    577          case Opt_fatal_errors:
>    578                  switch (result.uint_32) {
>    579                  case Opt_fatal_errors_panic:
>    580                          btrfs_set_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
>    581                          break;
>    582                  case Opt_fatal_errors_bug:
>    583                          btrfs_clear_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
>    584                          break;
>    585                  default:
>    586                          btrfs_err(NULL, "unrecognized fatal_errors value %s",
>    587                                    param->key);
>    588                          return -EINVAL;
>    589                  }
>    590                  break;
>    591          case Opt_commit_interval:
>    592                  ctx->commit_interval = result.uint_32;
>    593                  if (ctx->commit_interval > BTRFS_WARNING_COMMIT_INTERVAL) {
>    594                          btrfs_warn(NULL, "excessive commit interval %u, use with care",
>    595                                     ctx->commit_interval);
>    596                  }
>    597                  if (ctx->commit_interval == 0)
>    598                          ctx->commit_interval = BTRFS_DEFAULT_COMMIT_INTERVAL;
>    599                  break;
>    600          case Opt_rescue:
>    601                  switch (result.uint_32) {
>    602                  case Opt_rescue_usebackuproot:
>    603                          btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
>    604                          break;
>    605                  case Opt_rescue_nologreplay:
>    606                          btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
>    607                          break;
>    608                  case Opt_rescue_ignorebadroots:
>    609                          btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
>    610                          break;
>    611                  case Opt_rescue_ignoredatacsums:
>    612                          btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
>    613                          break;
>    614                  case Opt_rescue_ignoremetacsums:
>    615                          btrfs_set_opt(ctx->mount_opt, IGNOREMETACSUMS);
>    616                          break;
>    617                  case Opt_rescue_ignoresuperflags:
>    618                          btrfs_set_opt(ctx->mount_opt, IGNORESUPERFLAGS);
>    619                          break;
>    620                  case Opt_rescue_parameter_all:
>    621                          btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
>    622                          btrfs_set_opt(ctx->mount_opt, IGNOREMETACSUMS);
>    623                          btrfs_set_opt(ctx->mount_opt, IGNORESUPERFLAGS);
>    624                          btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
>    625                          btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
>    626                          break;
>    627                  default:
>    628                          btrfs_info(NULL, "unrecognized rescue option '%s'",
>    629                                     param->key);
>    630                          return -EINVAL;
>    631                  }
>    632                  break;
>    633  #ifdef CONFIG_BTRFS_DEBUG
>    634          case Opt_fragment:
>    635                  switch (result.uint_32) {
>    636                  case Opt_fragment_parameter_all:
>    637                          btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
>    638                          btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
>    639                          break;
>    640                  case Opt_fragment_parameter_metadata:
>    641                          btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
>    642                          break;
>    643                  case Opt_fragment_parameter_data:
>    644                          btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
>    645                          break;
>    646                  default:
>    647                          btrfs_info(NULL, "unrecognized fragment option '%s'",
>    648                                     param->key);
>    649                          return -EINVAL;
>    650                  }
>    651                  break;
>    652          case Opt_ref_verify:
>    653                  btrfs_set_opt(ctx->mount_opt, REF_VERIFY);
>    654                  break;
>    655          case Opt_ref_tracker:
>    656                  btrfs_set_opt(ctx->mount_opt, REF_TRACKER);
>    657                  break;
>    658          case Opt_test_dummy_encryption:
>  > 659                  int ret;
>    660
>    661                  /*
>    662                   * We only support v2, so reject any v1 policies.
>    663                   */
>    664                  if (param->type == fs_value_is_string && *param->string &&
>    665                      !strcmp(param->string, "v1")) {
>    666                          btrfs_info(NULL, "v1 encryption isn't supported");
>    667                          return -EINVAL;
>    668                  }
>    669
>    670                  btrfs_set_opt(ctx->mount_opt, TEST_DUMMY_ENCRYPTION);
>    671                  ret = fscrypt_parse_test_dummy_encryption(param, &ctx->dummy_enc_policy);
>    672                  if (ret)
>    673                          return ret;
>    674                  break;
>    675  #endif
>    676          default:
>    677                  btrfs_err(NULL, "unrecognized mount option '%s'", param->key);
>    678                  return -EINVAL;
>    679          }
>    680
>    681          return 0;
>    682  }
>    683
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
