Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621E0151987
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758942; cv=none; b=NDFTnMZQLjRZZEqEaoIi/PwbnlDpikMW5wSqWVXWMdJVX5u/8tFB5nogBxfuwsQhe+PNGxAsPeDSmrWmLBjV9UMwoGNBCbF3xbEBEyxBGhW2y5oE44IJliXPtEXQnUuUV1YQMF7mANsL2KjS2AtFIFGADzlT6Tlq6ehJYdHTCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758942; c=relaxed/simple;
	bh=Q+6toF+R4/IUoADd+A10yrrv4ZzL1q7e2HmHLbhQH/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/Ttx5eXieH+qZuSq6yz2fdBHIkWvxkpCPdPwQ8DcIfbI+I3VD4lvnWPr3h4NJx2f+lFmGuTjZa4zjsK+VR9g0G9UIs1ZBhKRaMyV8hhCeLWHxdV4S7EzLSPGj/sxhU9jC6seNZiIciha4iCx5Ub37Jz5wUjjKXvM2xM4e/j6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbegKN4M; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbegKN4M"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dcdd427227so1268895a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 04:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738758938; x=1739363738; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sdQSO3DdH8oAT8jb7bvxIUo9s9+zK/x821mRJs80YY=;
        b=UbegKN4MawdW0pqWYaodFtv31imlmDbW5SoYtOlbME8+E3/99ByKkO1B7DCwjbp8kB
         94LWnmA5C6ZPTT8adOcu66fIfEvEYZ9xlXQxdhHV+grtWoEVkLL/mPz/eNOUkg1UOkmT
         +TiPMbkUaNGnuhV7kitW2qqw0Mp8Wrt5ZMnMVkkRjYAxw/O+ielf6W4tgrhsSnA//uFB
         29o+D4OV2nuMxcXLAcbXS6T6BTNeNBM7HEJ/KY0t12KypEkBZneUQnUZMnYUC0ptG/Xw
         NMRXJ5Iqdn4B1bxILL0XfhexVe/+P8zIaXN5fP7ADgwH5/P1LRyhOI8xZTxs5woQ4KCn
         8aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738758938; x=1739363738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sdQSO3DdH8oAT8jb7bvxIUo9s9+zK/x821mRJs80YY=;
        b=MeyUQmUCGgEv6DroWhJLkjV3wXO7FFU8/8UzMxcKzqB5Zo5N+c0eRpLlawLs0NKKXx
         6gyupyocXJVbjEsLH+dKBxSuhbXrf226VBXMenQPeaD1X46oQQ997Hsh7kMGw5UtZPbN
         oI9aAu/435QaHMh+5sfL9NJITQA+psbWssZ7TSfkq5iE+ZKYj/ccAaL2GlQTWkJnlWc2
         et8llO4UBic2HdY9XCqtXHCMGx4F3SOQGLwQUojCNsthC/icW3EvyxTErjcFJ6hmn6xI
         RubxbGm6En5qO+lYTNWkjEfUiIv6kFRMukj0Ya11q1eQ3R8ifZGBMNt/7a/oG4aDj3dV
         9QuA==
X-Gm-Message-State: AOJu0YzKqKIShbgFlWvxm7zPBbSYPx2px1kkNedy9R6W6CXK284dlFTN
	vljOE5iT1xPatm6eveWbPL8G46BAMEuBvIDRuhQqezxaX/T8HI4B0BMHJ30b94XnqKcvsfobl1U
	0UUez7U0fdSaqpI39ZIF346ukCtA=
X-Gm-Gg: ASbGncvlgmSc2vXSMPT3eHy3GdZo4sZopwq/7V/A1AhnQkPhme9zGnO52GvzuwK0KBx
	m0ZE5SCfY7TLrM6bYQaniHQ3c/gg2u79e2Sj6/RqFVgDRxkGveqMffKgVHiA0Av9i1FI+5Jw=
X-Google-Smtp-Source: AGHT+IFCRX0hcMWKgqoS3Z5X3Uxqz30ycfHFK3MBlUHecqOFCoP/dkqVpqL3Li/km1YYzffN5xiKpOXrWxt40Xt2ulA=
X-Received: by 2002:a05:6402:5d5:b0:5dc:7fbe:72ff with SMTP id
 4fb4d7f45d1cf-5dcdb6ff245mr2925282a12.2.1738758938321; Wed, 05 Feb 2025
 04:35:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502052058.brmQ0100-lkp@intel.com>
In-Reply-To: <202502052058.brmQ0100-lkp@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 5 Feb 2025 13:35:26 +0100
X-Gm-Features: AWEUYZl8Pqbx0QngfhSM_3VQCDPpPAa4x5LKDLboLzU0QPLJOIdF2BAkt7ELfCw
Message-ID: <CAGudoHFOAD00iEjGSjbXeVz0F1xxyybANvo+LS-442Jn5NcuSQ@mail.gmail.com>
Subject: Re: [brauner-vfs:vfs-6.15.misc 2/3] mm/gup.c:2270: warning: Function
 parameter or struct member 'locked' not described in 'get_dump_page'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 1:20=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6=
.15.misc
> head:   625aec60ff1462a0620753deeec4a38ddd032e29
> commit: 62801d0e24907a20b4724b58ce174bc9a2fc3b4c [2/3] fs: avoid mmap sem=
 relocks when coredumping with many missing pages
> config: i386-buildonly-randconfig-003-20250205 (https://download.01.org/0=
day-ci/archive/20250205/202502052058.brmQ0100-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250205/202502052058.brmQ0100-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502052058.brmQ0100-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/gup.c:2270: warning: Function parameter or struct member 'locked' n=
ot described in 'get_dump_page'
>

how about this:

diff --git a/mm/gup.c b/mm/gup.c
index 3883b307780e..66d2aec76d99 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2254,6 +2254,7 @@ EXPORT_SYMBOL(fault_in_readable);
 /**
  * get_dump_page() - pin user page in memory while writing it to core dump
  * @addr: user address
+ * @locked: a pointer to an int denoting whether the mmap sem is held
  *
  * Returns struct page pointer of user page pinned for dump,
  * to be freed afterwards by put_page().

I presume I can avoid sending a full v2 :)

>
> vim +2270 mm/gup.c
>
> bb523b406c849e Andreas Gruenbacher 2021-08-02  2253
> 8f942eea12ae8c Jann Horn           2020-10-15  2254  /**
> 8f942eea12ae8c Jann Horn           2020-10-15  2255   * get_dump_page() -=
 pin user page in memory while writing it to core dump
> 8f942eea12ae8c Jann Horn           2020-10-15  2256   * @addr: user addre=
ss
> 8f942eea12ae8c Jann Horn           2020-10-15  2257   *
> 8f942eea12ae8c Jann Horn           2020-10-15  2258   * Returns struct pa=
ge pointer of user page pinned for dump,
> 8f942eea12ae8c Jann Horn           2020-10-15  2259   * to be freed after=
wards by put_page().
> 8f942eea12ae8c Jann Horn           2020-10-15  2260   *
> 8f942eea12ae8c Jann Horn           2020-10-15  2261   * Returns NULL on a=
ny kind of failure - a hole must then be inserted into
> 8f942eea12ae8c Jann Horn           2020-10-15  2262   * the corefile, to =
preserve alignment with its headers; and also returns
> 8f942eea12ae8c Jann Horn           2020-10-15  2263   * NULL wherever the=
 ZERO_PAGE, or an anonymous pte_none, has been found -
> 8f942eea12ae8c Jann Horn           2020-10-15  2264   * allowing a hole t=
o be left in the corefile to save disk space.
> 8f942eea12ae8c Jann Horn           2020-10-15  2265   *
> 7f3bfab52cab96 Jann Horn           2020-10-15  2266   * Called without mm=
ap_lock (takes and releases the mmap_lock by itself).
> 8f942eea12ae8c Jann Horn           2020-10-15  2267   */
> 8f942eea12ae8c Jann Horn           2020-10-15  2268  #ifdef CONFIG_ELF_CO=
RE
> 62801d0e24907a Mateusz Guzik       2025-01-19  2269  struct page *get_dum=
p_page(unsigned long addr, int *locked)
> 8f942eea12ae8c Jann Horn           2020-10-15 @2270  {
> 8f942eea12ae8c Jann Horn           2020-10-15  2271     struct page *page=
;
> 7f3bfab52cab96 Jann Horn           2020-10-15  2272     int ret;
> 8f942eea12ae8c Jann Horn           2020-10-15  2273
> 62801d0e24907a Mateusz Guzik       2025-01-19  2274     ret =3D __get_use=
r_pages_locked(current->mm, addr, 1, &page, locked,
> 7f3bfab52cab96 Jann Horn           2020-10-15  2275                      =
             FOLL_FORCE | FOLL_DUMP | FOLL_GET);
> 7f3bfab52cab96 Jann Horn           2020-10-15  2276     return (ret =3D=
=3D 1) ? page : NULL;
> 8f942eea12ae8c Jann Horn           2020-10-15  2277  }
> 8f942eea12ae8c Jann Horn           2020-10-15  2278  #endif /* CONFIG_ELF=
_CORE */
> 8f942eea12ae8c Jann Horn           2020-10-15  2279
>
> :::::: The code at line 2270 was first introduced by commit
> :::::: 8f942eea12ae8c5a7cde85c145234b25e38de959 binfmt_elf_fdpic: stop us=
ing dump_emit() on user pointers on !MMU
>
> :::::: TO: Jann Horn <jannh@google.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Mateusz Guzik <mjguzik gmail.com>
