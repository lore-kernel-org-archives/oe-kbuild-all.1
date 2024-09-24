Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6DC1EEF9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727185925; cv=none; b=V1APn/thTDq8BJe6aCFVNi3UVJ2yVzphPliu2DqQB0hDI9ObPCV4jWHipBzQNsMSCXQh52Z/5dmfuqem0ed8ULLWa3kyitpRukYODjf39o4k9mMx7noXGrwCXZYgmLvPEgIcWb8MajOW4dVXD4jewA4MnpsK77V1O3sTOd0POm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727185925; c=relaxed/simple;
	bh=A+qo8g3Ct4l2aVKYHULyrvn5fl2LtDJL7INuSDsWXcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUZPoC9UF+zmJTrwknjYv93+IxtEXx8i9OgA9aBsL5PLyp5zpA4RkPxNPEq6merDdzd4547yGF0rxu7eyQR8qL7iUz9H1er+sBIAU+T4h0HKQDoCoT9HVjeKCw4H+4i9NyoYYR+hn94cmzIuaPyBNcGqYYDsFGltHymYHThJ93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZh0HaOJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZh0HaOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9B4C4AF09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727185925;
	bh=A+qo8g3Ct4l2aVKYHULyrvn5fl2LtDJL7INuSDsWXcg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AZh0HaOJE/Hdvhpzl0bffMlPmu33gpIAZsP3T5RTWpfVym2uT3IspHXUj+4pNmrCy
	 ucSfHzhQIWzSkTyBJR8JcToCmNIzg4TR69s5wVFAYvlWX2BERHe/DBzSpVdeMdLHFM
	 kNxVhONr75ddSE3ljqR51n9aOv8PoktnJ/701bue6mfwI8MDij6GqEYI3l20K3za+6
	 0L0J4RKTfEXXlPqlxnuPpGsVUx8DC+tW7fCFupiB886fb6Q8rOfiFBBUfj6oMnkY+h
	 +wzIVGYOlItCzcS8X0WL3O+z6ofw/JIu8jTc6LvU/m9b4gVccmlLD6TxA4POOpLd2j
	 mNp8CGb57ehPw==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-27806115eafso2609400fac.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 06:52:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YyxCgPAFJ/dnHYJObql3Xi2U8vQPC0jXz6xnKAMlCHgYcP9m9RP
	vFDKX20GpPDd0VdDpBS82n9DDqV1xvjiplO/PDuYvJuJKQS+agDEUAoC4CL8KizSnh2U76lNtOx
	T4w5V5EaEcm9qX/vswYtQC/oQ5H0=
X-Google-Smtp-Source: AGHT+IG9SXSBSu+l7G8jF2L/kwFhNll8dKh6vSzmTwNPjKlKZensz01MHdfXNOMcMqdIm2jCFQZrrjGQ08dXBlJU84I=
X-Received: by 2002:a05:6870:3802:b0:277:f5d8:b77b with SMTP id
 586e51a60fabf-2803a7b8273mr12652814fac.32.1727185924618; Tue, 24 Sep 2024
 06:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409240317.7UrEkD87-lkp@intel.com>
In-Reply-To: <202409240317.7UrEkD87-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 24 Sep 2024 22:51:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8xbs3HeGMEj8_JR4djLhCKgF76Lfw3GKPC3-tRDU4KDw@mail.gmail.com>
Message-ID: <CAKYAXd8xbs3HeGMEj8_JR4djLhCKgF76Lfw3GKPC3-tRDU4KDw@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 3/4] fs/smb/server/smb2pdu.c:2070:
 warning: Function parameter or struct member 'coptions' not described in 'smb2_create_open_flags'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 5:05=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
Hi,
>
> tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> head:   073f3e59284343a926e47db3d7373aad7bfa4e8b
> commit: 676fc89e7fdf5873f3f0df11a684400348e175b3 [3/4] ksmbd: fix open fa=
ilure from block and char device file
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202409=
24/202409240317.7UrEkD87-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240924/202409240317.7UrEkD87-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409240317.7UrEkD87-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/smb/server/smb2pdu.c:2070: warning: Function parameter or struct me=
mber 'coptions' not described in 'smb2_create_open_flags'
> >> fs/smb/server/smb2pdu.c:2070: warning: Function parameter or struct me=
mber 'mode' not described in 'smb2_create_open_flags'
> >> fs/smb/server/smb2pdu.c:2070: warning: Excess function parameter 'is_d=
ir' description in 'smb2_create_open_flags'
I have fixed these warnings and pushed the updated patches to queue.
Thanks for your report!
>
>
> vim +2070 fs/smb/server/smb2pdu.c
>
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2054
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2055  /**
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2056   * =
smb2_create_open_flags() - convert smb open flags to unix open flags
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2057   * =
@file_present: is file already present
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2058   * =
@access:               file access flags
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2059   * =
@disposition:  file disposition flags
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2060   * =
@may_flags:            set with MAY_ flags
> e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2061   * =
@is_dir:               is creating open flags for directory
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2062   *
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2063   * =
Return:      file open flags
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2064   */
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2065  sta=
tic int smb2_create_open_flags(bool file_present, __le32 access,
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2066     =
                         __le32 disposition,
> e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2067     =
                         int *may_flags,
> 676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2068     =
                         __le32 coptions,
> 676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2069     =
                         umode_t mode)
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16 @2070  {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2071    i=
nt oflags =3D O_NONBLOCK | O_LARGEFILE;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2072
> 676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2073    i=
f (coptions & FILE_DIRECTORY_FILE_LE || S_ISDIR(mode)) {
> e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2074     =
       access &=3D ~FILE_WRITE_DESIRE_ACCESS_LE;
> e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2075     =
       ksmbd_debug(SMB, "Discard write access to a directory\n");
> e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2076    }
> e2e33caa5dc2ea fs/smb/server/smb2pdu.c Hobin Woo    2024-07-05  2077
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2078    i=
f (access & FILE_READ_DESIRED_ACCESS_LE &&
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2079     =
   access & FILE_WRITE_DESIRE_ACCESS_LE) {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2080     =
       oflags |=3D O_RDWR;
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2081     =
       *may_flags =3D MAY_OPEN | MAY_READ | MAY_WRITE;
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2082    }=
 else if (access & FILE_WRITE_DESIRE_ACCESS_LE) {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2083     =
       oflags |=3D O_WRONLY;
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2084     =
       *may_flags =3D MAY_OPEN | MAY_WRITE;
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2085    }=
 else {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2086     =
       oflags |=3D O_RDONLY;
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2087     =
       *may_flags =3D MAY_OPEN | MAY_READ;
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2088    }
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2089
> 676fc89e7fdf58 fs/smb/server/smb2pdu.c Namjae Jeon  2024-09-23  2090    i=
f (access =3D=3D FILE_READ_ATTRIBUTES_LE || S_ISBLK(mode) || S_ISCHR(mode))
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2091     =
       oflags |=3D O_PATH;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2092
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2093    i=
f (file_present) {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2094     =
       switch (disposition & FILE_CREATE_MASK_LE) {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2095     =
       case FILE_OPEN_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2096     =
       case FILE_CREATE_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2097     =
               break;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2098     =
       case FILE_SUPERSEDE_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2099     =
       case FILE_OVERWRITE_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2100     =
       case FILE_OVERWRITE_IF_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2101     =
               oflags |=3D O_TRUNC;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2102     =
               break;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2103     =
       default:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2104     =
               break;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2105     =
       }
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2106    }=
 else {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2107     =
       switch (disposition & FILE_CREATE_MASK_LE) {
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2108     =
       case FILE_SUPERSEDE_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2109     =
       case FILE_CREATE_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2110     =
       case FILE_OPEN_IF_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2111     =
       case FILE_OVERWRITE_IF_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2112     =
               oflags |=3D O_CREAT;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2113     =
               break;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2114     =
       case FILE_OPEN_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2115     =
       case FILE_OVERWRITE_LE:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2116     =
               oflags &=3D ~O_CREAT;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2117     =
               break;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2118     =
       default:
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2119     =
               break;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2120     =
       }
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2121    }
> 6c5e36d13e2a33 fs/ksmbd/smb2pdu.c      Hyunchul Lee 2021-06-23  2122
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2123    r=
eturn oflags;
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2124  }
> e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon  2021-03-16  2125
>
> :::::: The code at line 2070 was first introduced by commit
> :::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side pr=
ocedures for SMB3
>
> :::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
> :::::: CC: Steve French <stfrench@microsoft.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
