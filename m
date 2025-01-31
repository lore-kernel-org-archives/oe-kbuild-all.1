Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE11F03D2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342521; cv=none; b=bXDGCTJEXzoW58xIKJ+YwY+27+BtwL969OVPqmmzYJtleS1JViOlM88pcTlfj9RWpyJlw1u6XoALOB8l24gk7FtNnSNFWA1HEPsRrBhBB1cFTxbNZw5ckCicVitfM/ghcJaMLanPEvhhSIGqUVV/rGmazfufsJ94EoxcZjIy1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342521; c=relaxed/simple;
	bh=pjps5y8eCDakmlM5FC2/Anvhtb8QY5n2MJnEURvNdFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kktCekl7J+wppImo+h8HBmchfPQ+h5qMzfqlUG3hlWqz/EFK7Qr2BsYXGMi14GWAtL5DujR0weLW7B6bmRQYf0wSQfj/00UZxWaMhLPCVT9BEawCURU18Z94PLBrWu4HWsxIg4kdQx6gzf1wPLo+2nsN2geCmintbv0f7ClrZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xTQ+2F/B; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xTQ+2F/B"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467abce2ef9so275761cf.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 08:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738342518; x=1738947318; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiUpenCZxJlzpmTDMs9YPmAFAkUqTeg5FHFQqHk9RHY=;
        b=xTQ+2F/BiGiNdxK9De5ttlEvVgUP0maRlTsSou38j8NXr5DQZrGi/ea88wlS0gpPm1
         SWlfCdr9tnZbL+bpdsB3hUZ8f7/0XR8FRxlhjb/UxOsum3lC6btiAt2pJ7MwXKb7T+Wi
         84EB7sbXDdSOAqEqut0O/G2eRFQFajcdPNLQWqHhNpAfsqa3hpthGpOhFmIN7AgoDCY+
         vVgP/o1lfYt+qyXJ8ASlpMhKNPeB4ZLa0k80VOAyp5qKPd8qcdrgpZWMecZvZ9flQrOx
         7tLo7o5LllOskRhiUA5w7mh9PHudq0NjIEER/GqMgrkps6QQLlV4I8iJE3CN8Q055cDD
         4jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342518; x=1738947318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiUpenCZxJlzpmTDMs9YPmAFAkUqTeg5FHFQqHk9RHY=;
        b=sj83AKTU9ffhWD8bmmTZndVeyl8KdXhs9S27zliPGCnCSKm5vKmuFxnM9lDQG36kfx
         rr3sznR0+PjCJ4PPjITXd5WyABeskgDN6YjWJr757k9hrPn+kdQpBZvVMTRysQIqlttF
         4r7OkV2qLgV6HT2YBTwrcoE7pcp/2CahsKx5v3mqPn40m//Nr5ZGJC0lkBzGXMs8Xheo
         OrxchkDxFpgwYpgwujDPYbNmSpT+2XCTSUqtqQghwLnVWeCVELxarPcIWHfgpnIvOMf4
         K4PmykT3eYO5OUe3Fq+cvzl8VxDkzRos6zQOCqdrN0vVAgU+R9PwjznDySVE3OcyUPSA
         5j6g==
X-Gm-Message-State: AOJu0Yyi4mgm+X1Gbr7Zj7ei4iYH04TYiiabN7PbZremlT4pDlGXBzpM
	i5Jwiip8h48e4hjgzHs0SJD+f6zKMRzR8Eh7WSpSZoWMWzDqK0Ynz3rrd2KTQ3aQbeTXsWM6NLY
	Zerf8bLv3Jt1jHqLcdstkhc2LiupMPwdilUuh
X-Gm-Gg: ASbGncsMnHKksuGC+PQwfN33UTOXolA5UWvBFoAwca78bacbT05l7OdotStTdwGJlxf
	vsp0tP/scNREyesoGhVno4Uyby6udabZHz1DD/HB0YT5UdrgVYl+Avetd+tGpe+2u59ntMUyH
X-Google-Smtp-Source: AGHT+IFMf+rwBBW0+s+U4Vnm90r1939kVenRZFSqmclphCk64JCB0JGIQO9cHEfYkOZIskrJCqf7t8+3AvdsvNV4Nrg=
X-Received: by 2002:a05:622a:6098:b0:46e:131e:5ba6 with SMTP id
 d75a77b69052e-46fead85a14mr4010531cf.0.1738342518324; Fri, 31 Jan 2025
 08:55:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501310832.kiAeOt2z-lkp@intel.com>
In-Reply-To: <202501310832.kiAeOt2z-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 31 Jan 2025 08:55:07 -0800
X-Gm-Features: AWEUYZlYmGqQyjVr7VWqyAmQe2tSBpC7UL1Yuh4KOHDcRsgzbL_zqpzPBxkbf0s
Message-ID: <CAJuCfpGrtTK=reeVPrS+GQngs=WS-cZvy_YU9-JGyRgVFdofAw@mail.gmail.com>
Subject: Re: drivers/auxdisplay/panel.c:1454:2: error: call to
 __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 4:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
> commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current=
->alloc_tag manipulations when profiling is disabled
> date:   5 days ago
> config: hexagon-randconfig-r133-20250131 (https://download.01.org/0day-ci=
/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c=
006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20250131/202501310832=
.kiAeOt2z-lkp@intel.com/reproduce)

Just saw this report (was on vacation). Will try to figure out what's going=
 on.

>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_assert=
_309 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_const=
ant_p(_dest_len) || _dest_len =3D=3D (size_t)-1
>            strtomem_pad(key->u.kbd.release_str, release, '\0');
>            ^
>    include/linux/string.h:417:2: note: expanded from macro 'strtomem_pad'
>            BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||              =
  \
>            ^
>    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_O=
N'
>            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
>            ^
>    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_=
ON_MSG'
>    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                        ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:530:2: note: expanded from macro '_comp=
iletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ^
>    include/linux/compiler_types.h:523:4: note: expanded from macro '__com=
piletime_assert'
>                            prefix ## suffix();                           =
  \
>                            ^
>    <scratch space>:127:1: note: expanded from here
>    __compiletime_assert_309
>    ^
>    1 error generated.
>
>
> vim +/error +1454 drivers/auxdisplay/panel.c
>
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1426
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1427  /* tries to bind a key to the signal name <name>. The key wi=
ll send the
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1428   * strings <press>, <repeat>, <release> for these respective=
 events.
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1429   * Returns the pointer to the new key if ok, NULL if the key=
 could not be bound.
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1430   */
> 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              201=
3-02-15  1431  static struct logical_input *panel_bind_key(const char *name=
, const char *press,
> 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              201=
3-02-15  1432                                              const char *repe=
at,
> 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              201=
3-02-15  1433                                              const char *rele=
ase)
> 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-22  1434  {
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1435          struct logical_input *key;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1436
> fdf4a4948ca8a1 drivers/staging/panel/panel.c Dominique van den Broeck 201=
4-05-21  1437          key =3D kzalloc(sizeof(*key), GFP_KERNEL);
> eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          201=
2-07-12  1438          if (!key)
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1439                  return NULL;
> eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          201=
2-07-12  1440
> 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-22  1441          if (!input_name2mask(name, &key->mask, &key->value, =
&scan_mask_i,
> cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          201=
0-07-12  1442                               &scan_mask_o)) {
> cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          201=
0-07-12  1443                  kfree(key);
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1444                  return NULL;
> cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          201=
0-07-12  1445          }
> 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-22  1446
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1447          key->type =3D INPUT_TYPE_KBD;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1448          key->state =3D INPUT_ST_LOW;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1449          key->rise_time =3D 1;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1450          key->fall_time =3D 1;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1451
> a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             202=
3-09-11  1452          strtomem_pad(key->u.kbd.press_str, press, '\0');
> a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             202=
3-09-11  1453          strtomem_pad(key->u.kbd.repeat_str, repeat, '\0');
> a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             202=
3-09-11 @1454          strtomem_pad(key->u.kbd.release_str, release, '\0');
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1455          list_add(&key->list, &logical_inputs);
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1456          return key;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1457  }
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1458
>
> :::::: The code at line 1454 was first introduced by commit
> :::::: a952abcdaa22116d940ca9cb9253caad1622ae93 auxdisplay: panel: Replac=
e deprecated strncpy() with strtomem_pad()
>
> :::::: TO: Justin Stitt <justinstitt@google.com>
> :::::: CC: Kees Cook <keescook@chromium.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
