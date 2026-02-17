Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C3335546
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330884; cv=pass; b=SaNBKQjEg3W0Rel+lRVR484m0t4iS+7L331qiWoxW9tdMJwJ6h4FXk+yyvBE1HIP4bf+op2fIJu3T3ev3hqGgRVYn5r7W7jAHiwNCjWpA5/EELeulckw9ZV31c1jz+fWtV0ObSCv5heMw9xWFuX6QhhRzVvcSDhoSK6XBct/0Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330884; c=relaxed/simple;
	bh=KX8Gt6enMIeawjI8VhJC4+NTlB+dOlE95Y2IJXEASiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEJ7HMVpcrM83HQQtjIqxaDV4wDWhAJTY+rzBm0uTu9eRliSHdOLTGUMWjLFC4ZZnrVs9UpkC20xJESZ3PMpWrxiXMkjIVSLB7a6HNiOI9ExiL00EU7rF6Bw17Oob8LzDSzn7P5yAwYq8R4aVkqwaqoM+HxT4qPhmU1tGL5exCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SX3prIM7; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SX3prIM7"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e699310a8so4359268e87.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 04:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771330881; cv=none;
        d=google.com; s=arc-20240605;
        b=FQO90G+GA1maL/OBsR0jcProuAlS6Yghmg3OxTngU+c8Sa+qQEa8M9EBLH7cMSaabk
         k4T1UU+gWo6XtXcuhxaAG976K1agBy3x/BQiNyqmE1yheRWPUh/yTfpqBrIEz07osib+
         Wrvy6e1XlwreAhdml86T3T6u5dH4nlBTN1fhoM/fRCknVKIEsJ61LsZKtpV7B8nGtyYO
         s9I/kkOT0+yAvsYcIaQ4igmhuQIk5dsqsNb6q1tSXnCCkxTuyfexgaAtPRQavuytTcqP
         OhPXQCQEE/QvKxQSl+DKXkRvniVabXfhfx4Zxy9Bw5FSjavUopQpfiiyLzlSUKSWaVbM
         NHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tqL9llIV+JETwz1bbd7t56D3q3+eN5cn/ZWuHFiDOBY=;
        fh=OkZ/RtTMCgjCML68rt0C0uHhBhmzd764AbiPBkXLHHI=;
        b=IV+TpFMU9x+GzGXU63aAtR8gQ9LanEGGTT/dctzzbIjVPTv6k6leu9hv53I4DrAnTr
         ZizAJwM1Hv/EK+mqVPYFN17KhXOA6pnhbeE60eBWWZFd6QZR89NkpixLw2ofLmbKYTBH
         WkzW79pdFcA8Na8A74LiKGn4+uXNt7uG4cOok+EpP+3lElyo3EQKCJ9xERPWhBoPI3eA
         AJgsXpv/kSK6Don4aoSr4MBA6tOgUcRHTLOp1hBIBzGMpdIRHJAgvGuOrFHGpw7GVd6u
         yx01dwp7TFKJRelkPDnLiQur3J7BVOBLMwNwxbT55hAIKdl8DpsR7NJACP8Kr3HbjP9f
         yGzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771330881; x=1771935681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqL9llIV+JETwz1bbd7t56D3q3+eN5cn/ZWuHFiDOBY=;
        b=SX3prIM7FQevUrD/bi6QH8Yd2FNZGa+ogR4KwnnMdBiUFcNUZ1v2izsMQiJ8eda0JF
         ElJl/ZjqmPbkyNiCdkQn0DZhOjz/Pl6Lw4xVuLiaiQg3USm7f9Fz3maKyfIzhPittvFG
         5nFTye/2IA00642lLPi+QWKwSRaAoacoTUZMHrjFoVKCF2loNBOFziFK1kk/dNHPqdFV
         LuhLJllyliX6ZycaEfrZl964ahTsq3TIN2pD2L0IgeeeEc/spVd5FcTQakkGr7j23/wS
         R0zTwY/Gt4/kXYgn0+gVJniiTFXSH9EbYspR0gx4KFJ14cPK33G6ayzFLFn1csWRZ0js
         otmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330881; x=1771935681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqL9llIV+JETwz1bbd7t56D3q3+eN5cn/ZWuHFiDOBY=;
        b=at6M8HBJQHBQYfKpFgTgeNidNpnEzp31y1lO8JoxN7+yb4Ixuv4tm5anPzuRsiatb8
         rVl8DCmTPfXnBBsY/jCEjoZm1mmFu99BCqj5rPxaRyeJQuKZv4x7ldVLziK7iBHxqUJp
         D9nN7sr13rI77x4PyBkrbF5Dhal+bQqlQelhB9V/8Iron927+L1ZFLohuv95rWcxnabv
         10DbFOxF6H0sQk7i3g5dJbwAbFfs5LfQr2JzoaWlp/V12KEohj2RT4fH34MmQLDdmW3c
         PP1+Ugu/TVVwAgQYizK1ZxWeGN0a7So3YFsFEkMMDFIPNyU78B24LqJAz5LQnwrsvTC0
         UtQw==
X-Gm-Message-State: AOJu0YwlFR0vmXWTzJuzC8jBeUkUAAPMPaMC6UlRTYOkTUezb/BHC6hZ
	uyqOd4kUdVieziRUx+46EHM+xqEwzGT01/UVzi19Hw/6eSGxyDuOV+UjyZ/TLuanbjeFLM+UzQX
	JdAPtBA1H9m+ZuMXgW0S3IXVL0gI6ChaN5WTdCBePC1eW5siv3agcZo8=
X-Gm-Gg: AZuq6aLC3y0/jbhZz9yiYytf42LszE/x5h4GPovzT+fjIYH5u/GBCAzonTu+qAuNOhM
	UQdbuziC2VjeNyqJ/X+ql7tVHqbxfarAlkZdWSfB0B8K+C8HMBCeJX1dmVL7WP1GTlvttsFZkgs
	kg/Pr+nm50ekQiG9UMvghoXMvj2c07K8oCQD0h0CgIYg/5UO88A+O6Tv1YnHGTtQSczgBw4DG1i
	Dd6esV5Wsr5hBAjfhbw5+BppXdBvYVpTAa2kP2ZJBCvRnRGRCHPF8i9+O3XEc95hvg+SzzQ4r5L
	LhhZa7Li+3iC/WBBwdiulr9xsGzbWQTC2kxJsamv
X-Received: by 2002:a05:6512:398e:b0:59e:3912:ec2b with SMTP id
 2adb3069b0e04-59f6d00c934mr3301474e87.24.1771330880980; Tue, 17 Feb 2026
 04:21:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602170751.qIgCJbJI-lkp@intel.com>
In-Reply-To: <202602170751.qIgCJbJI-lkp@intel.com>
From: Filipe Manana <fdmanana@suse.com>
Date: Tue, 17 Feb 2026 12:21:10 +0000
X-Gm-Features: AaiRm53HudBrYKHlHfe4-ZbiXc_y4tHDtL8mYbDu-q-5rnrb_TZEafY2jpsMjXY
Message-ID: <CAKisOQHUvfx2Sy6+202qRZMjjDPg-h8wTJJeL+h2wD0+VLskQg@mail.gmail.com>
Subject: Re: fs/btrfs/ordered-data.c:215:5-11: ERROR: allocation function on
 line 173 returns NULL not ERR_PTR on failure
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 11:16=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   9702969978695d9a699a1f34771580cdbb153b33
> commit: 08c649a5637371cb6bf8f3e974323cf59a7f434b btrfs: check we grabbed =
inode reference when allocating an ordered extent
> date:   9 months ago
> config: mips-randconfig-r064-20260215 (https://download.01.org/0day-ci/ar=
chive/20260217/202602170751.qIgCJbJI-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9=
b8addffa70cee5b2acc5454712d9cf78ce45710)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602170751.qIgCJbJI-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> fs/btrfs/ordered-data.c:215:5-11: ERROR: allocation function on line 1=
73 returns NULL not ERR_PTR on failure


False alarm.
The allocation function does indeed return NULL, but if that's the
case we set 'entry' to ERR_PTR(-ENOMEM) in line 175.
The only other error path sets entry to ERR_PTR(-ESTALE).

So it's perfectly fine to test for IS_ERR(entry) at line 215.

Please fix the bot, as this is the second time this warning/false
alarm is reported.

Thanks.


>
>
> vim +215 fs/btrfs/ordered-data.c
>
>    147
>    148  static struct btrfs_ordered_extent *alloc_ordered_extent(
>    149                          struct btrfs_inode *inode, u64 file_offse=
t, u64 num_bytes,
>    150                          u64 ram_bytes, u64 disk_bytenr, u64 disk_=
num_bytes,
>    151                          u64 offset, unsigned long flags, int comp=
ress_type)
>    152  {
>    153          struct btrfs_ordered_extent *entry;
>    154          int ret;
>    155          u64 qgroup_rsv =3D 0;
>    156          const bool is_nocow =3D (flags &
>    157                 ((1U << BTRFS_ORDERED_NOCOW) | (1U << BTRFS_ORDERE=
D_PREALLOC)));
>    158
>    159          if (is_nocow) {
>    160                  /* For nocow write, we can release the qgroup rsv=
 right now */
>    161                  ret =3D btrfs_qgroup_free_data(inode, NULL, file_=
offset, num_bytes, &qgroup_rsv);
>    162                  if (ret < 0)
>    163                          return ERR_PTR(ret);
>    164          } else {
>    165                  /*
>    166                   * The ordered extent has reserved qgroup space, =
release now
>    167                   * and pass the reserved number for qgroup_record=
 to free.
>    168                   */
>    169                  ret =3D btrfs_qgroup_release_data(inode, file_off=
set, num_bytes, &qgroup_rsv);
>    170                  if (ret < 0)
>    171                          return ERR_PTR(ret);
>    172          }
>  > 173          entry =3D kmem_cache_zalloc(btrfs_ordered_extent_cache, G=
FP_NOFS);
>    174          if (!entry) {
>    175                  entry =3D ERR_PTR(-ENOMEM);
>    176                  goto out;
>    177          }
>    178
>    179          entry->file_offset =3D file_offset;
>    180          entry->num_bytes =3D num_bytes;
>    181          entry->ram_bytes =3D ram_bytes;
>    182          entry->disk_bytenr =3D disk_bytenr;
>    183          entry->disk_num_bytes =3D disk_num_bytes;
>    184          entry->offset =3D offset;
>    185          entry->bytes_left =3D num_bytes;
>    186          if (WARN_ON_ONCE(!igrab(&inode->vfs_inode))) {
>    187                  kmem_cache_free(btrfs_ordered_extent_cache, entry=
);
>    188                  entry =3D ERR_PTR(-ESTALE);
>    189                  goto out;
>    190          }
>    191          entry->inode =3D inode;
>    192          entry->compress_type =3D compress_type;
>    193          entry->truncated_len =3D (u64)-1;
>    194          entry->qgroup_rsv =3D qgroup_rsv;
>    195          entry->flags =3D flags;
>    196          refcount_set(&entry->refs, 1);
>    197          init_waitqueue_head(&entry->wait);
>    198          INIT_LIST_HEAD(&entry->list);
>    199          INIT_LIST_HEAD(&entry->log_list);
>    200          INIT_LIST_HEAD(&entry->root_extent_list);
>    201          INIT_LIST_HEAD(&entry->work_list);
>    202          INIT_LIST_HEAD(&entry->bioc_list);
>    203          init_completion(&entry->completion);
>    204
>    205          /*
>    206           * We don't need the count_max_extents here, we can assum=
e that all of
>    207           * that work has been done at higher layers, so this is t=
ruly the
>    208           * smallest the extent is going to get.
>    209           */
>    210          spin_lock(&inode->lock);
>    211          btrfs_mod_outstanding_extents(inode, 1);
>    212          spin_unlock(&inode->lock);
>    213
>    214  out:
>  > 215          if (IS_ERR(entry) && !is_nocow)
>    216                  btrfs_qgroup_free_refroot(inode->root->fs_info,
>    217                                            btrfs_root_id(inode->ro=
ot),
>    218                                            qgroup_rsv, BTRFS_QGROU=
P_RSV_DATA);
>    219
>    220          return entry;
>    221  }
>    222
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
