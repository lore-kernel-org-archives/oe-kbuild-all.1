Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB502139C9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272133; cv=pass; b=dfWuzQ71/pedS4AR33hGAYfz/BW3DwxD5fYg5MnXuFjS/1nlFl+a5xM+CQD3v/PVHs6DNbSFczT46uL8MfIkWqo2ExfzHrHtbdzS/kNC/0eO7eZCFo0XEQ5FWOgU7SOxnPaGJa68lR923HCpXPiMoyOrIT/LLwITuweZfhLUW8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272133; c=relaxed/simple;
	bh=pOZf3ggKzaXnSWcs3uzk8GcTVpp0tFc4UkzfaBPxJzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoXoRh2DJabWpvE+7uWEFazqnisledNCUjVzjyRYikvB4k0e3XmyGQ3i67qwlxbvwR5kNv0y1rF2ik0tz2h2HQ6Q6b20C5hyMzHGSmkId+X3qPF9sgIxxbaJEA+Pa8znr4TmAzgErSga11Q5yd11NhJUHlSm1OPnhs8Asc4v0cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJrZAgY+; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJrZAgY+"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89c6f61020cso44981046d6.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 06:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272130; cv=none;
        d=google.com; s=arc-20240605;
        b=j0FSECLWnx4KBNyi1WJQ2bW9WS/Yzh9LuDHErkKJUpOkPDFNLedI49lgtfQ0EPsUtF
         BxcOswLYAH/+pI+gtIyx4MIqgP8hQp16jEK0isfxx0W5Ei1EK0vc2k1onbdD5+/erqxc
         r8ZGVOjOu9zVd4SSu6QAYk0PiZJh2Nae7D3boqeYYG4cz8QG5U6YXakT0XSRI3HezwCf
         iUmDk7e1mTR6OpqJ7ttgYzGKRW9ysv1JXD1XA6J9rmgQCMmiWPoz1kKDMrC+9BCZoBQP
         amAM0RNqPcT1pYneJWI5mIIRKnBh1nieJMJ9SiHa/Wq4q5xnfmng989PZqMeS8Ozfwyg
         OxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dTiOKfx7i/Tgm0HXFocZLKaqOe68VqvbGNMyJx2KgzA=;
        fh=/bc5k6oiPxtmLpxyyO/cmKxuIRAeFvXAqKObtkd/LwI=;
        b=R+MShtP/tNjZ6WZJzZYrLgQ9vAAINOSqb7wMZgV7wY7KdbbjP6kbVhTYOEEitceCCz
         JD2ZCh2T3TOijTFQk3ANbZrCYtC4Jm/mTTIjhZEPzPXAdE34Qq4kl9jWbtiX422iVhIH
         GOgHve1l/m6542pD30ipl7prp+HZC6UHZLc0UKdEA6Gme0ALdpkO4mQ0yoPKi6czHxrd
         sy8NxKbFA3+PcIFfp3G2ABOJote0Dr7NcZNm9xUSHWGVdBGjLiiegoAmN41SwIKGTRSQ
         UTi6PwVBZ8FwM/sFoRPoto2xXrsEJTim+VowxUoi0gxtvOkqOSZVo3H6cdhzp8pr0NAe
         WCrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272130; x=1774876930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTiOKfx7i/Tgm0HXFocZLKaqOe68VqvbGNMyJx2KgzA=;
        b=XJrZAgY+zHE3M3ATKAsfK1eCFzr0oJhVeaiytjB2yu/L4nJYJ5Y0FjNOw+0ZJOqkgv
         nAkLBybGXrS/cJYp5AunoXfggcw3OKJv9SYHXV3hHKHm1cEOXqA7n/dH+IQxNqsZ5Tcq
         83p9q9vmhYnatFn7Ra4puHF9LeTpwB+FnHmBwSbpwewor/Us7yA1jXJlJyoiWwHiOexS
         9t6zezbA8ZRb+XNYhO/d1KXXaPM51SEniqM7aM4UC5/VfqligxESWriBUCXCaTd9RI6r
         r0iftoTAQZnNKaP8wjTCEBosujwrE/Qzjbyml2pgQdbqp5/47viKzmr4hS7M/RBrqHiH
         AjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272130; x=1774876930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTiOKfx7i/Tgm0HXFocZLKaqOe68VqvbGNMyJx2KgzA=;
        b=MmUSO6YCvvSgpXQajLRMNX48Hg7uXhmyVOAII2t6HfdxIGg3t/Psm2fxls2cTmEvKt
         0T9uRCtEPj76Rn89WkA/px/a6QBUoB9f6BFeYcy0vbhM1ARkWbJvKpErYAapvxIQP8s/
         UrGt0Go3HprxJKhxYYyUvGjFb427nFx1s2ag6sD4/ZSbsF0W5jlKpoYJUhmNaRbZNzgs
         iN1gAEkl5Wxogf4OUbpw2KAWnHfmMGqQ/yr/ubyqEKKY32Ab4uh0By8rXTDHhgFlnFnN
         N+ffSXy93DBkGaSWGyeUyBwJjLuJTab2KQc8TjkbPuVlgwlVg4hweTGpFFm4MdviGVQY
         f54A==
X-Forwarded-Encrypted: i=1; AJvYcCVy3fqsCuPIIh0uaSzJ2xXzarfPu17vroc8rgSeD37yOaxB4opR0yO4dCAvMahaOGRlQDZTlYNCRQzbodcc@lists.linux.dev
X-Gm-Message-State: AOJu0YzyMrJdAHbUKj1zP/Ze5TIa7FKVpg3j+53/pUurDH1epF4yoVs1
	7eIAMJRNAjji8zelDf8hDbQb0pIUNT4tr9D76HH+FHv5tsvLQY+cFqzSrFTimqCMlQ3oPQIdXQ/
	Qmjz4UQ229f5vtjwg0sUrzv85s2fEZYI=
X-Gm-Gg: ATEYQzzXE4zjiKz95oPR5TW41zYAKxQ1mBteNPm24Sz1rA2VuZIV6HEnKE8cF2KbMKN
	i90RjuVBW+xT+OhLzyJJ3t7Q4UtE7qkKHFv87K1BNBcMddK1cYZTTssTq+eLbiO7N4bMiRvYY/p
	7fci4JVD1VVB+pV+EFA/fMU7yFICncnFt0Eq/RCPtQNr7YRUC4seTn1g9VgiZDyzMwPMzM6PgV6
	nupTdfyisAhk2cKUYgmodyCOxOtEoVq6mWjKeRuriSLaF3waSk5SRPhf17zOKXzRfAlmJP3iSSg
	CY0Pl548Co7+TxCn/nJdVG6rZVjW1RytDThZHFM1Xsn+fefkQDskwgpSTDkadC/07bYfiTqqVYL
	tgVQmYxWONAkmYsG8U1ewabB7y5IcJFwjzYvgeVjjTuWQD/A7mQcomdOXW74dbpBfZNSw4hhh1p
	ED0HCxPQNNn2bTfm+qMwX2CQ==
X-Received: by 2002:a05:6214:449d:b0:89c:6692:1d83 with SMTP id
 6a1803df08f44-89c8543f16bmr179293256d6.3.1774272130234; Mon, 23 Mar 2026
 06:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603180118.ClDWNtId-lkp@intel.com> <b859bfa1-7844-4b23-91a4-bbd526ffc19b@samba.org>
In-Reply-To: <b859bfa1-7844-4b23-91a4-bbd526ffc19b@samba.org>
From: Steve French <smfrench@gmail.com>
Date: Mon, 23 Mar 2026 08:21:58 -0500
X-Gm-Features: AQROBzCBnQmmYkruPhQ2P1j2dNfaSC0ZtjlVbK8huEwU6tKFpem_8kw-eLtJn64
Message-ID: <CAH2r5mvvjWtJza+9YrLYvneysyEQa5rENhTYiFTAwrE+KhOy8Q@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 11/12] fs/smb/server/smb2pdu.c:5723:3:
 warning: variable 'pntsd' is uninitialized when used here
To: Stefan Metzmacher <metze@samba.org>
Cc: Asim Viladi Oglu Manizada <manizada@pm.me>, Namjae Jeon <linkinjeon@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Steve French <stfrench@microsoft.com>, 
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

looks like a simple fix to initialize it to null at declaration, right?

On Mon, Mar 23, 2026 at 3:56=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
>
> I'm seeing the same thing in ksmbd-for-next now:
>
> 6a0795e46296589d8eba6c194586e9e65974d73f ksmbd: fix OOB write in QUERY_IN=
FO for compound requests
>
> smatch generates this error now:
>
> server/smb2pdu.c:5801 smb2_get_info_sec() error: uninitialized symbol 'pn=
tsd'.
>
> metze
>
> Am 17.03.26 um 18:55 schrieb kernel test robot:
> > tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> > head:   a58d8c8b3d5daee33fb03f4d41ea278ae6e6ffc9
> > commit: 095198efe2c86423f647b242687c50e34e355d3a [11/12] ksmbd: fix hea=
p OOB write in QUERY_INFO for compound requests
> > config: arm-randconfig-003-20260317 (https://download.01.org/0day-ci/ar=
chive/20260318/202603180118.ClDWNtId-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project=
 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260318/202603180118.ClDWNtId-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603180118.ClDWNtId-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> fs/smb/server/smb2pdu.c:5723:3: warning: variable 'pntsd' is uninitia=
lized when used here [-Wuninitialized]
> >      5723 |                 pntsd->revision =3D cpu_to_le16(1);
> >           |                 ^~~~~
> >     fs/smb/server/smb2pdu.c:5708:24: note: initialize the variable 'pnt=
sd' to silence this warning
> >      5708 |         struct smb_ntsd *pntsd, *ppntsd =3D NULL;
> >           |                               ^
> >           |                                =3D NULL
> >     1 warning generated.
> >
> >
> > vim +/pntsd +5723 fs/smb/server/smb2pdu.c
> >
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5701
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5702  static int smb2_get_info_sec(struct ksmbd_work *work,
> > 64b39f4a2fd293 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-30  5703                          struct smb2_query_info_req *req,
> > cb4517201b8acd fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-1=
1-03  5704                          struct smb2_query_info_rsp *rsp)
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5705  {
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5706     struct ksmbd_file *fp;
> > 4609e1f18e19c3 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-0=
1-13  5707     struct mnt_idmap *idmap;
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5708     struct smb_ntsd *pntsd, *ppntsd =3D NULL;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5709     struct smb_fattr fattr =3D {{0}};
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5710     struct inode *inode;
> > 8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-0=
8-02  5711     __u32 secdesclen =3D 0;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5712     unsigned int id =3D KSMBD_NO_FID, pid =3D KSMBD_NO_FID;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5713     int addition_info =3D le32_to_cpu(req->AdditionalInformation=
);
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5714     int rc =3D 0, ppntsd_size =3D 0, max_len;
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5715     size_t scratch_len;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5716
> > e294f78d347851 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-0=
6-28  5717     if (addition_info & ~(OWNER_SECINFO | GROUP_SECINFO | DACL_S=
ECINFO |
> > e294f78d347851 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-0=
6-28  5718                           PROTECTED_DACL_SECINFO |
> > e294f78d347851 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-0=
6-28  5719                           UNPROTECTED_DACL_SECINFO)) {
> > 8e537d1465e740 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-1=
1-21  5720             ksmbd_debug(SMB, "Unsupported addition info: 0x%x)\n=
",
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5721                    addition_info);
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5722
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27 @5723             pntsd->revision =3D cpu_to_le16(1);
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5724             pntsd->type =3D cpu_to_le16(SELF_RELATIVE | DACL_PRO=
TECTED);
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5725             pntsd->osidoffset =3D 0;
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5726             pntsd->gsidoffset =3D 0;
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5727             pntsd->sacloffset =3D 0;
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5728             pntsd->dacloffset =3D 0;
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5729
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5730             secdesclen =3D sizeof(struct smb_ntsd);
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5731             rsp->OutputBufferLength =3D cpu_to_le32(secdesclen);
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5732
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5733             return 0;
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5734     }
> > ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-0=
4-27  5735
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5736     if (work->next_smb2_rcv_hdr_off) {
> > 2d004c6cae567e fs/ksmbd/smb2pdu.c      Paulo Alcantara           2022-0=
3-21  5737             if (!has_file_id(req->VolatileFileId)) {
> > 3867369ef8f760 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-0=
7-08  5738                     ksmbd_debug(SMB, "Compound request set FID =
=3D %llu\n",
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5739                                 work->compound_fid);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5740                     id =3D work->compound_fid;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5741                     pid =3D work->compound_pfid;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5742             }
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5743     }
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5744
> > 3867369ef8f760 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-0=
7-08  5745     if (!has_file_id(id)) {
> > 2d004c6cae567e fs/ksmbd/smb2pdu.c      Paulo Alcantara           2022-0=
3-21  5746             id =3D req->VolatileFileId;
> > 2d004c6cae567e fs/ksmbd/smb2pdu.c      Paulo Alcantara           2022-0=
3-21  5747             pid =3D req->PersistentFileId;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5748     }
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5749
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5750     fp =3D ksmbd_lookup_fd_slow(work, id, pid);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5751     if (!fp)
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5752             return -ENOENT;
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5753
> > 4609e1f18e19c3 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-0=
1-13  5754     idmap =3D file_mnt_idmap(fp->filp);
> > ab0b263b749ade fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-0=
6-29  5755     inode =3D file_inode(fp->filp);
> > e67fe63341b811 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-0=
1-13  5756     ksmbd_acls_fattr(&fattr, idmap, inode);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5757
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5758     if (test_share_config_flag(work->tcon->share_conf,
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5759                                KSMBD_SHARE_FLAG_ACL_XATTR))
> > 4609e1f18e19c3 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-0=
1-13  5760             ppntsd_size =3D ksmbd_vfs_get_sd_xattr(work->conn, i=
dmap,
> > 8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-0=
8-02  5761                                                  fp->filp->f_pat=
h.dentry,
> > 8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-0=
8-02  5762                                                  &ppntsd);
> > 8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-0=
8-02  5763
> > 8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-0=
8-02  5764     /* Check if sd buffer size exceeds response buffer size */
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5765     max_len =3D smb2_calc_max_out_buf_len(work,
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5766                     offsetof(struct smb2_query_info_rsp, Buffer)=
,
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5767                     le32_to_cpu(req->OutputBufferLength));
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5768     if (max_len < 0) {
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5769             rc =3D -EINVAL;
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5770             goto out;
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5771     }
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5772
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5773     scratch_len =3D smb_acl_sec_desc_scratch_len(&fattr, ppntsd,
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5774                     ppntsd_size, addition_info);
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5775     pntsd =3D kvmalloc(scratch_len, KSMBD_DEFAULT_GFP);
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5776     if (!pntsd) {
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5777             rc =3D -ENOMEM;
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5778             goto out;
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5779     }
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5780
> > 4d7ca4090184c1 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-0=
1-13  5781     rc =3D build_sec_desc(idmap, pntsd, ppntsd, ppntsd_size,
> > 8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-0=
8-02  5782                     addition_info, &secdesclen, &fattr);
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5783
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5784  out:
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5785     posix_acl_release(fattr.cf_acls);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5786     posix_acl_release(fattr.cf_dacls);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5787     kfree(ppntsd);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5788     ksmbd_fd_put(work, fp);
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5789     if (rc) {
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5790             kvfree(pntsd);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5791             return rc;
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5792     }
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5793
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5794     rsp->OutputBufferLength =3D cpu_to_le32(secdesclen);
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5795     return ksmbd_iov_pin_rsp_read(work, (void *)rsp,
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5796                     offsetof(struct smb2_query_info_rsp, Buffer)=
,
> > 095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-0=
3-16  5797                     pntsd, secdesclen);
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5798  }
> > e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-0=
3-16  5799
> >
> > :::::: The code at line 5723 was first introduced by commit
> > :::::: ced2b26a76cd1db0b6ccb39e0bc873177c9bda21 cifsd: Fix regression i=
n smb2_get_info
> >
> > :::::: TO: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> > :::::: CC: Steve French <stfrench@microsoft.com>
> >
> b



--=20
Thanks,

Steve
