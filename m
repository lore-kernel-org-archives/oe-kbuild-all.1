Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC631292CE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709812777; cv=none; b=SboGz/uIizNfXwgsRcYt0k6YUHe/Zo0Zm4CW5Wi3SkO6XC1PRoOup3k2wwRFLzOjRJZf7K3nQixu34c97QZgXQ0NadGXG6377aPXvsSAphwJpDuOtE6Zt2hXrccE3z7JWzhKykyUaM4lJ4okSD1kWY3zvZ8jOye4SjbaAVG1DdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709812777; c=relaxed/simple;
	bh=c0KxMWYW8KW94ReHltnYKanLtxAtCavt54APLlVMsRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/p1J+FrY49gloilEXNzx93Iz9fcjzW21ru6gMPerfV9GoTwlDL1DLecfF+2RkSGWlcQMZkrYPgBxr1WmXpq/yrXGcAOib633HeSMpOHkq2zPl+ob+/+FiPIlczaj37JE7kyytTMzERNJ+AjHQ8ZQGkXY+GQ3VOEZ5YviZmR3oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fuNf6xRc; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fuNf6xRc"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so1117219a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Mar 2024 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709812772; x=1710417572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUJbp5aXzr8SCmjpas7GEGArish6ibwu6ESxHPfo/Vg=;
        b=fuNf6xRcHKB/O45I9JD6lk9r2Sau3qgp1fkhJ54BmER+KLigy02slCFoc3nkqm3Jzp
         J8YQEWooY5ObSyejmxwZrcwGC0NaflJZKnSQprsmxLPAHO7iNYrvhOl8Tu3FYQAaS/tp
         9IR3yhnYin3a8iaaxawLW/Y3EoCxygQc0Cf6pKCdqTM8nJm/BF90OhZO7GN1dee5R6AA
         h6jgAEsUgzao9ZapUbytWbkhb95vL8eJC+kIb2S0tEywiKLP1gSl5RChRUF9r3hxsgs/
         3sprrXW563HJRorqg8jD5fa40PVOscVvTWBeyMlsKrGTLE1IcfqUP/DOAk6aYUq4TGtr
         tNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812772; x=1710417572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUJbp5aXzr8SCmjpas7GEGArish6ibwu6ESxHPfo/Vg=;
        b=d0ZJ7+qIM8c4gGCXRe4qxiOcfoMBwaLQE1fH7GQ4ssIV57m7X3fIY3ChVALHgOEx5v
         TrT699vnrNBlrmFIGsTRj1BEHiNoT517XRKgLIbhWenhYproD9BdUghZS3CRiHyRc6/w
         nrqB47XoP8kgNWzJV3QXuQbu1X6EnSHPBDhzwTrJ4esmzE9T28z0mPJ+KkT8UNV20lvq
         8y+NDWNGV354Tm5jEMZVyOvhpjV32Qt8la9nNB/EBVubCKxcEOwHiPBLvPt7o8iaXSfV
         VsrAEyVgla9FErUN5RPHumZZ+09oCH6CcDja5jRleQkvglbtdZyX664uobmZed/MYgjk
         AkYg==
X-Gm-Message-State: AOJu0YxtZgFFr+lG7gX2wYgrwpe6+0RiKB5F70y9oje/jVsDE8A+XMCn
	KQRpfeLXEL9wkyeNpmxALJT3zfv0tWvlnGdypA8p9c6XfLd5/ytLu1ev9lhEIL0mlZUBFv/Oz3R
	omoXL6GD/xdvd34h2Dayx/86JeQJOnD/qr56jSw==
X-Google-Smtp-Source: AGHT+IGWNGrYoHgYAQIwqINpjNesxck+bQb9UNRJGeBjmq+3684fU3SUzPRgOfbD0vQhz2YqTw+RmmeN5WYiTjZTvc8=
X-Received: by 2002:a50:cdcb:0:b0:568:1409:5b4f with SMTP id
 h11-20020a50cdcb000000b0056814095b4fmr1554866edj.41.1709812772378; Thu, 07
 Mar 2024 03:59:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403071947.NUYuBx0G-lkp@intel.com>
In-Reply-To: <202403071947.NUYuBx0G-lkp@intel.com>
From: Filipe Manana <fdmanana@suse.com>
Date: Thu, 7 Mar 2024 11:59:21 +0000
Message-ID: <CAKisOQEh2LVgHjSooSisUOYEv+SncO1fD4y+yMt9sA_EtTWaxg@mail.gmail.com>
Subject: Re: [linux-next:master 11882/12647] fs/btrfs/extent_io.c:3246:26:
 warning: 'last_extent_end' may be used uninitialized
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, David Sterba <dsterba@suse.com>, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 11:31=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   1843e16d2df9d98427ef8045589571749d627cf7
> commit: 978b63f7464abcfd364a6c95f734282c50f3decf [11882/12647] btrfs: fix=
 race when detecting delalloc ranges during fiemap
> config: s390-randconfig-c005-20230325 (https://download.01.org/0day-ci/ar=
chive/20240307/202403071947.NUYuBx0G-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240307/202403071947.NUYuBx0G-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403071947.NUYuBx0G-lkp=
@intel.com/
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it n=
ow.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    fs/btrfs/extent_io.c: In function 'extent_fiemap':
> >> fs/btrfs/extent_io.c:3246:26: warning: 'last_extent_end' may be used u=
ninitialized [-Wmaybe-uninitialized]
>     3246 |         if (cache.cached && cache.offset + cache.len >=3D last=
_extent_end) {

I don't see how that can happen, and for me the smatch tool doesn't
report anything.

last_extent_end is initialized early in the function, by the call to
fiemap_find_last_extent_offset(), which always
initializes the variable, except if an error happens in which case we
skip that code as we jump into the 'out_unlock' label.

I'm afraid this is a false alarm.

>          |             ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
>    fs/btrfs/extent_io.c:3064:13: note: 'last_extent_end' was declared her=
e
>     3064 |         u64 last_extent_end;
>          |             ^~~~~~~~~~~~~~~
>
>
> vim +/last_extent_end +3246 fs/btrfs/extent_io.c
>
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3054
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3055  int extent_fiemap(struct =
btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3056                    u64 sta=
rt, u64 len)
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3057  {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3058          const u64 ino =3D=
 btrfs_ino(inode);
> 978b63f7464abc Filipe Manana  2024-02-28  3059          struct extent_sta=
te *cached_state =3D NULL;
> b3e744fe6d289b Filipe Manana  2022-11-11  3060          struct extent_sta=
te *delalloc_cached_state =3D NULL;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3061          struct btrfs_path=
 *path;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3062          struct fiemap_cac=
he cache =3D { 0 };
> 61dbb952f0a5f5 Filipe Manana  2022-10-11  3063          struct btrfs_back=
ref_share_check_ctx *backref_ctx;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3064          u64 last_extent_e=
nd;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3065          u64 prev_extent_e=
nd;
> b0ad381fa76902 Josef Bacik    2024-02-12  3066          u64 range_start;
> b0ad381fa76902 Josef Bacik    2024-02-12  3067          u64 range_end;
> b0ad381fa76902 Josef Bacik    2024-02-12  3068          const u64 sectors=
ize =3D inode->root->fs_info->sectorsize;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3069          bool stopped =3D =
false;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3070          int ret;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3071
> 978b63f7464abc Filipe Manana  2024-02-28  3072          cache.entries_siz=
e =3D PAGE_SIZE / sizeof(struct btrfs_fiemap_entry);
> 978b63f7464abc Filipe Manana  2024-02-28  3073          cache.entries =3D=
 kmalloc_array(cache.entries_size,
> 978b63f7464abc Filipe Manana  2024-02-28  3074                           =
             sizeof(struct btrfs_fiemap_entry),
> 978b63f7464abc Filipe Manana  2024-02-28  3075                           =
             GFP_KERNEL);
> 84a7949d409753 Filipe Manana  2022-10-11  3076          backref_ctx =3D b=
trfs_alloc_backref_share_check_ctx();
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3077          path =3D btrfs_al=
loc_path();
> 978b63f7464abc Filipe Manana  2024-02-28  3078          if (!cache.entrie=
s || !backref_ctx || !path) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3079                  ret =3D -=
ENOMEM;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3080                  goto out;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3081          }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3082
> 978b63f7464abc Filipe Manana  2024-02-28  3083  restart:
> b0ad381fa76902 Josef Bacik    2024-02-12  3084          range_start =3D r=
ound_down(start, sectorsize);
> b0ad381fa76902 Josef Bacik    2024-02-12  3085          range_end =3D rou=
nd_up(start + len, sectorsize);
> b0ad381fa76902 Josef Bacik    2024-02-12  3086          prev_extent_end =
=3D range_start;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3087
> 978b63f7464abc Filipe Manana  2024-02-28  3088          lock_extent(&inod=
e->io_tree, range_start, range_end, &cached_state);
> 978b63f7464abc Filipe Manana  2024-02-28  3089
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3090          ret =3D fiemap_fi=
nd_last_extent_offset(inode, path, &last_extent_end);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3091          if (ret < 0)
> 978b63f7464abc Filipe Manana  2024-02-28  3092                  goto out_=
unlock;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3093          btrfs_release_pat=
h(path);
> fe09e16cc8d444 Liu Bo         2013-09-22  3094
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3095          path->reada =3D R=
EADA_FORWARD;
> b0ad381fa76902 Josef Bacik    2024-02-12  3096          ret =3D fiemap_se=
arch_slot(inode, path, range_start);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3097          if (ret < 0) {
> 978b63f7464abc Filipe Manana  2024-02-28  3098                  goto out_=
unlock;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3099          } else if (ret > =
0) {
> b8f164e3e67f22 Filipe Manana  2022-09-01  3100                  /*
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3101                   * No fil=
e extent item found, but we may have delalloc between
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3102                   * the cu=
rrent offset and i_size. So check for that.
> b8f164e3e67f22 Filipe Manana  2022-09-01  3103                   */
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3104                  ret =3D 0=
;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3105                  goto chec=
k_eof_delalloc;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3106          }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3107
> b0ad381fa76902 Josef Bacik    2024-02-12  3108          while (prev_exten=
t_end < range_end) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3109                  struct ex=
tent_buffer *leaf =3D path->nodes[0];
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3110                  struct bt=
rfs_file_extent_item *ei;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3111                  struct bt=
rfs_key key;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3112                  u64 exten=
t_end;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3113                  u64 exten=
t_len;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3114                  u64 exten=
t_offset =3D 0;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3115                  u64 exten=
t_gen;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3116                  u64 disk_=
bytenr =3D 0;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3117                  u64 flags=
 =3D 0;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3118                  int exten=
t_type;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3119                  u8 compre=
ssion;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3120
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3121                  btrfs_ite=
m_key_to_cpu(leaf, &key, path->slots[0]);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3122                  if (key.o=
bjectid !=3D ino || key.type !=3D BTRFS_EXTENT_DATA_KEY)
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3123                          b=
reak;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3124
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3125                  extent_en=
d =3D btrfs_file_extent_end(path);
> b8f164e3e67f22 Filipe Manana  2022-09-01  3126
> fe09e16cc8d444 Liu Bo         2013-09-22  3127                  /*
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3128                   * The fi=
rst iteration can leave us at an extent item that ends
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3129                   * before=
 our range's start. Move to the next item.
> fe09e16cc8d444 Liu Bo         2013-09-22  3130                   */
> b0ad381fa76902 Josef Bacik    2024-02-12  3131                  if (exten=
t_end <=3D range_start)
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3132                          g=
oto next_item;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3133
> 877c14767f106a Filipe Manana  2022-10-11  3134                  backref_c=
tx->curr_leaf_bytenr =3D leaf->start;
> 877c14767f106a Filipe Manana  2022-10-11  3135
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3136                  /* We hav=
e in implicit hole (NO_HOLES feature enabled). */
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3137                  if (prev_=
extent_end < key.offset) {
> b0ad381fa76902 Josef Bacik    2024-02-12  3138                          c=
onst u64 hole_end =3D min(key.offset, range_end) - 1;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3139
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3140                          r=
et =3D fiemap_process_hole(inode, fieinfo, &cache,
> b3e744fe6d289b Filipe Manana  2022-11-11  3141                           =
                         &delalloc_cached_state,
> 61dbb952f0a5f5 Filipe Manana  2022-10-11  3142                           =
                         backref_ctx, 0, 0, 0,
> b0ad381fa76902 Josef Bacik    2024-02-12  3143                           =
                         prev_extent_end, hole_end);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3144                          i=
f (ret < 0) {
> 978b63f7464abc Filipe Manana  2024-02-28  3145                           =
       goto out_unlock;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3146                          }=
 else if (ret > 0) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3147                           =
       /* fiemap_fill_next_extent() told us to stop. */
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3148                           =
       stopped =3D true;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3149                           =
       break;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3150                          }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3151
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3152                          /=
* We've reached the end of the fiemap range, stop. */
> b0ad381fa76902 Josef Bacik    2024-02-12  3153                          i=
f (key.offset >=3D range_end) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3154                           =
       stopped =3D true;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3155                           =
       break;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3156                          }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3157                  }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3158
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3159                  extent_le=
n =3D extent_end - key.offset;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3160                  ei =3D bt=
rfs_item_ptr(leaf, path->slots[0],
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3161                           =
           struct btrfs_file_extent_item);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3162                  compressi=
on =3D btrfs_file_extent_compression(leaf, ei);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3163                  extent_ty=
pe =3D btrfs_file_extent_type(leaf, ei);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3164                  extent_ge=
n =3D btrfs_file_extent_generation(leaf, ei);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3165
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3166                  if (exten=
t_type !=3D BTRFS_FILE_EXTENT_INLINE) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3167                          d=
isk_bytenr =3D btrfs_file_extent_disk_bytenr(leaf, ei);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3168                          i=
f (compression =3D=3D BTRFS_COMPRESS_NONE)
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3169                           =
       extent_offset =3D btrfs_file_extent_offset(leaf, ei);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3170                  }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3171
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3172                  if (compr=
ession !=3D BTRFS_COMPRESS_NONE)
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3173                          f=
lags |=3D FIEMAP_EXTENT_ENCODED;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3174
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3175                  if (exten=
t_type =3D=3D BTRFS_FILE_EXTENT_INLINE) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3176                          f=
lags |=3D FIEMAP_EXTENT_DATA_INLINE;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3177                          f=
lags |=3D FIEMAP_EXTENT_NOT_ALIGNED;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3178                          r=
et =3D emit_fiemap_extent(fieinfo, &cache, key.offset, 0,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3179                           =
                        extent_len, flags);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3180                  } else if=
 (extent_type =3D=3D BTRFS_FILE_EXTENT_PREALLOC) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3181                          r=
et =3D fiemap_process_hole(inode, fieinfo, &cache,
> b3e744fe6d289b Filipe Manana  2022-11-11  3182                           =
                         &delalloc_cached_state,
> 61dbb952f0a5f5 Filipe Manana  2022-10-11  3183                           =
                         backref_ctx,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3184                           =
                         disk_bytenr, extent_offset,
> 84a7949d409753 Filipe Manana  2022-10-11  3185                           =
                         extent_gen, key.offset,
> 84a7949d409753 Filipe Manana  2022-10-11  3186                           =
                         extent_end - 1);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3187                  } else if=
 (disk_bytenr =3D=3D 0) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3188                          /=
* We have an explicit hole. */
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3189                          r=
et =3D fiemap_process_hole(inode, fieinfo, &cache,
> b3e744fe6d289b Filipe Manana  2022-11-11  3190                           =
                         &delalloc_cached_state,
> 61dbb952f0a5f5 Filipe Manana  2022-10-11  3191                           =
                         backref_ctx, 0, 0, 0,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3192                           =
                         key.offset, extent_end - 1);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3193                  } else {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3194                          /=
* We have a regular extent. */
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3195                          i=
f (fieinfo->fi_extents_max) {
> ceb707da9ad92a Filipe Manana  2022-10-11  3196                           =
       ret =3D btrfs_is_data_extent_shared(inode,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3197                           =
                                         disk_bytenr,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3198                           =
                                         extent_gen,
> 61dbb952f0a5f5 Filipe Manana  2022-10-11  3199                           =
                                         backref_ctx);
> dc046b10c8b7d4 Josef Bacik    2014-09-10  3200                           =
       if (ret < 0)
> 978b63f7464abc Filipe Manana  2024-02-28  3201                           =
               goto out_unlock;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3202                           =
       else if (ret > 0)
> fe09e16cc8d444 Liu Bo         2013-09-22  3203                           =
               flags |=3D FIEMAP_EXTENT_SHARED;
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3204                          }
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3205
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3206                          r=
et =3D emit_fiemap_extent(fieinfo, &cache, key.offset,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3207                           =
                        disk_bytenr + extent_offset,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3208                           =
                        extent_len, flags);
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3209                  }
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3210
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3211                  if (ret <=
 0) {
> 978b63f7464abc Filipe Manana  2024-02-28  3212                          g=
oto out_unlock;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3213                  } else if=
 (ret > 0) {
> 978b63f7464abc Filipe Manana  2024-02-28  3214                          /=
* emit_fiemap_extent() told us to stop. */
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3215                          s=
topped =3D true;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3216                          b=
reak;
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3217                  }
> 09fbc1c8e7b00e Filipe Manana  2022-09-01  3218
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3219                  prev_exte=
nt_end =3D extent_end;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3220  next_item:
> 09fbc1c8e7b00e Filipe Manana  2022-09-01  3221                  if (fatal=
_signal_pending(current)) {
> 09fbc1c8e7b00e Filipe Manana  2022-09-01  3222                          r=
et =3D -EINTR;
> 978b63f7464abc Filipe Manana  2024-02-28  3223                          g=
oto out_unlock;
> 09fbc1c8e7b00e Filipe Manana  2022-09-01  3224                  }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3225
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3226                  ret =3D f=
iemap_next_leaf_item(inode, path);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3227                  if (ret <=
 0) {
> 978b63f7464abc Filipe Manana  2024-02-28  3228                          g=
oto out_unlock;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3229                  } else if=
 (ret > 0) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3230                          /=
* No more file extent items for this inode. */
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3231                          b=
reak;
> 26e726afe01c1c Chengyu Song   2015-03-24  3232                  }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3233                  cond_resc=
hed();
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3234          }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3235
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3236  check_eof_delalloc:
> b0ad381fa76902 Josef Bacik    2024-02-12  3237          if (!stopped && p=
rev_extent_end < range_end) {
> b3e744fe6d289b Filipe Manana  2022-11-11  3238                  ret =3D f=
iemap_process_hole(inode, fieinfo, &cache,
> b3e744fe6d289b Filipe Manana  2022-11-11  3239                           =
                 &delalloc_cached_state, backref_ctx,
> b0ad381fa76902 Josef Bacik    2024-02-12  3240                           =
                 0, 0, 0, prev_extent_end, range_end - 1);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3241                  if (ret <=
 0)
> 978b63f7464abc Filipe Manana  2024-02-28  3242                          g=
oto out_unlock;
> b0ad381fa76902 Josef Bacik    2024-02-12  3243                  prev_exte=
nt_end =3D range_end;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3244          }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3245
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01 @3246          if (cache.cached =
&& cache.offset + cache.len >=3D last_extent_end) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3247                  const u64=
 i_size =3D i_size_read(&inode->vfs_inode);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3248
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3249                  if (prev_=
extent_end < i_size) {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3250                          u=
64 delalloc_start;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3251                          u=
64 delalloc_end;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3252                          b=
ool delalloc;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3253
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3254                          d=
elalloc =3D btrfs_find_delalloc_in_range(inode,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3255                           =
                                       prev_extent_end,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3256                           =
                                       i_size - 1,
> b3e744fe6d289b Filipe Manana  2022-11-11  3257                           =
                                       &delalloc_cached_state,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3258                           =
                                       &delalloc_start,
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3259                           =
                                       &delalloc_end);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3260                          i=
f (!delalloc)
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3261                           =
       cache.flags |=3D FIEMAP_EXTENT_LAST;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3262                  } else {
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3263                          c=
ache.flags |=3D FIEMAP_EXTENT_LAST;
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3264                  }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3265          }
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3266
> 978b63f7464abc Filipe Manana  2024-02-28  3267  out_unlock:
> 978b63f7464abc Filipe Manana  2024-02-28  3268          unlock_extent(&in=
ode->io_tree, range_start, range_end, &cached_state);
> 978b63f7464abc Filipe Manana  2024-02-28  3269
> 978b63f7464abc Filipe Manana  2024-02-28  3270          if (ret =3D=3D BT=
RFS_FIEMAP_FLUSH_CACHE) {
> 978b63f7464abc Filipe Manana  2024-02-28  3271                  btrfs_rel=
ease_path(path);
> 978b63f7464abc Filipe Manana  2024-02-28  3272                  ret =3D f=
lush_fiemap_cache(fieinfo, &cache);
> 978b63f7464abc Filipe Manana  2024-02-28  3273                  if (ret)
> 978b63f7464abc Filipe Manana  2024-02-28  3274                          g=
oto out;
> 978b63f7464abc Filipe Manana  2024-02-28  3275                  len -=3D =
cache.next_search_offset - start;
> 978b63f7464abc Filipe Manana  2024-02-28  3276                  start =3D=
 cache.next_search_offset;
> 978b63f7464abc Filipe Manana  2024-02-28  3277                  goto rest=
art;
> 978b63f7464abc Filipe Manana  2024-02-28  3278          } else if (ret < =
0) {
> 978b63f7464abc Filipe Manana  2024-02-28  3279                  goto out;
> 978b63f7464abc Filipe Manana  2024-02-28  3280          }
> 978b63f7464abc Filipe Manana  2024-02-28  3281
> 978b63f7464abc Filipe Manana  2024-02-28  3282          /*
> 978b63f7464abc Filipe Manana  2024-02-28  3283           * Must free the =
path before emitting to the fiemap buffer because we
> 978b63f7464abc Filipe Manana  2024-02-28  3284           * may have a non=
-cloned leaf and if the fiemap buffer is memory mapped
> 978b63f7464abc Filipe Manana  2024-02-28  3285           * to a file, a w=
rite into it (through btrfs_page_mkwrite()) may trigger
> 978b63f7464abc Filipe Manana  2024-02-28  3286           * waiting for an=
 ordered extent that in order to complete needs to
> 978b63f7464abc Filipe Manana  2024-02-28  3287           * modify that le=
af, therefore leading to a deadlock.
> 978b63f7464abc Filipe Manana  2024-02-28  3288           */
> 978b63f7464abc Filipe Manana  2024-02-28  3289          btrfs_free_path(p=
ath);
> 978b63f7464abc Filipe Manana  2024-02-28  3290          path =3D NULL;
> 978b63f7464abc Filipe Manana  2024-02-28  3291
> 978b63f7464abc Filipe Manana  2024-02-28  3292          ret =3D flush_fie=
map_cache(fieinfo, &cache);
> 978b63f7464abc Filipe Manana  2024-02-28  3293          if (ret)
> 978b63f7464abc Filipe Manana  2024-02-28  3294                  goto out;
> 978b63f7464abc Filipe Manana  2024-02-28  3295
> 5c5aff98f83abc David Sterba   2019-03-20  3296          ret =3D emit_last=
_fiemap_cache(fieinfo, &cache);
> ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3297  out:
> b3e744fe6d289b Filipe Manana  2022-11-11  3298          free_extent_state=
(delalloc_cached_state);
> 978b63f7464abc Filipe Manana  2024-02-28  3299          kfree(cache.entri=
es);
> 84a7949d409753 Filipe Manana  2022-10-11  3300          btrfs_free_backre=
f_share_ctx(backref_ctx);
> e02d48eaaed77f Colin Ian King 2019-07-05  3301          btrfs_free_path(p=
ath);
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3302          return ret;
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3303  }
> 1506fcc8189cdd Yehuda Sadeh   2009-01-21  3304
>
> :::::: The code at line 3246 was first introduced by commit
> :::::: ac3c0d36a2a2f7a8f9778faef3f2639f5bf29d44 btrfs: make fiemap more e=
fficient and accurate reporting extent sharedness
>
> :::::: TO: Filipe Manana <fdmanana@suse.com>
> :::::: CC: David Sterba <dsterba@suse.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
