Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736686353
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767999983; cv=none; b=stqRDeZzGguE7wKGNKMNrvvhz0MQS9HvgismglZkYT8fxHPg7UNlg4pNXNbI9xB0+4U0uymDeX7yk1yNgiasCC2trn9l3zsUu2VRe82Z1398h7CHc6ZOq2PMSwgasAwktgYvMNkMMS2crsSRSvLDQu3Rj40vvAK7rd5GBQte3iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767999983; c=relaxed/simple;
	bh=ApTABDh+BdUbxJpZY27S9I6fkAp1uHDXwNbOL3pfk2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWqtdtmotSOEoHl8wrxbzVC6nWqYSq+EcSMF/5VB5JDRKmye1ETNJJQzN1G4LrrW2Jw16ECKMI3ly2AtEji4E1DkMcJUUdZOo2h35cGrj9bz1NNP1qfRCWId1T6i+ewyGSqUujpMBPLV9BDfLNgTJ8ZtT3g8ussTPNsM4KR0tOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx6+rpai; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx6+rpai"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso6966121a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Jan 2026 15:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767999980; x=1768604780; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4nf4e5q3Xf+aH2HG8uen64//LPZBaEocicPF818sVA=;
        b=cx6+rpaiA9lvLmiGFt9lB5MVwe9S6b1rCz5/jUb2lUwfwBcXOzbatKvEXbzhcilN1n
         afiopTQcEje0+vCHv7GVVfyL1AjDINwh7dl+de+NGLKksNjHArys2XBvyL28OQTlMn0D
         TMjXbn+4qosgSNDkuvTYs+z9mhxBuzRgn8arwVfrb5HdzLS+mjONdvAlvxKWxHf2BCer
         U4PDd9oGnDOADKF+sB0be+a/oNPgq0mH4DgBTlL3//Dvx6FR3NMG3XybRtqNz3RoK25r
         eNKtj8gf56Mr0u3sOkInuGkwZsKRAZ6Hp40s6srTlPcFTwFqW59MUjGR1NFNODtOtvVC
         VQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767999980; x=1768604780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4nf4e5q3Xf+aH2HG8uen64//LPZBaEocicPF818sVA=;
        b=Odyo6r9oCkFq/iYS9mRV2u6NWrKZ2Oj6yYoV0Q4w3zBcQOzy06mNIq/um2Sl99T39M
         jo6Zht+WhfXGsPYn2FC35tV0NfUl/T8BcQXAWBrSVOaTC7pPtUblsDPw5c2V7hnMpx2u
         GSsEBcOaIaR+c1/+rjFq5Mf1wSulOSfLWPBnF7T70K9HdTgbgtQiYed2E1MwN1QuLYVT
         mqraJXhvMl1H6Nsh7NcXiFq+93LyFEsOIuOjJTG7lH1t6baLCYj6Ycm4UOflrmVTeHx7
         b4hz2nm1Yzf9Q1qErwSuXMSEEp99Hf3ESAjNeZncXadMTVDNZbddUYGHsNYa/l9U3Kxb
         2WfA==
X-Forwarded-Encrypted: i=1; AJvYcCUIPlHmIaYw9lDDlTtXEPjJNZw2i0gflklA1Rj+Ev+1RvHnZ2lfToflB7KHnY8zsLyNynDH7/Ok3/VpDHs1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+d7aPWXSAA8v4UaotZrhymLnl1z2j9IXpCch0aptWCbX8hfqc
	58wi/9cL2QZFd6cUTgniNg4hd6ORO/jp5FyOEVRWnbJ7pUX1baCXQfhCBdNp2T6MoJETXfo8bVz
	PVFlP841m+ujsm8BNJadkD53YoGcZaw==
X-Gm-Gg: AY/fxX4TnrUz3cReFZb1+vhHDf4XYewW2L8VNlTvBkoC7Wzu4zZ2xXQlvV9ErRkqLHm
	FcaMJ2MmAvAeo/bp0lEGFWm3cLhq3aPwd4w1FDEccWoCIC8C3/pUp2vPxE+es+R/uNSnp98V+lg
	DFAWR/+Al6sLDclNoFDL0E8YqtXD2j5X6JZ0limaU3SWu1wqMaO4YuMR2f26x6GxmpkIdZqq8y2
	W6z9IPolvDGUQz8PPJQd7BD3JLrKU764NkpVNOx7J/8W0ipfSMadbdDgn9cOGJNTwElFmOMGTyW
	A3G9T1Q+lQ6y+pagfu0BkA1FBv+6
X-Google-Smtp-Source: AGHT+IHptlW3QdpvyZAs8YM+DyD5+3TkZkB2lBpnyv2pOOVqTAc27L3qqsMnQHvX6M3MM/mSMmDOp0xsFFdIu0gZ2Qw=
X-Received: by 2002:a05:6402:26d1:b0:649:d81b:7b7e with SMTP id
 4fb4d7f45d1cf-65097dea710mr9666545a12.8.1767999980297; Fri, 09 Jan 2026
 15:06:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260102232934.1560-6-rick.macklem@gmail.com> <202601100546.EDWB9nf6-lkp@intel.com>
In-Reply-To: <202601100546.EDWB9nf6-lkp@intel.com>
From: Rick Macklem <rick.macklem@gmail.com>
Date: Fri, 9 Jan 2026 15:06:07 -0800
X-Gm-Features: AZwV_QhfhaaDYVNI4iK_DjcqOv_XohHuIUKyvxyQXwX_aOZy-du5nOnZSMXnDgI
Message-ID: <CAM5tNy4KhHb1avowiBET93OZCwcYKR1KAW+F-Wuj_6G46u6C0Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] Make nfs4_server_supports_acls() global
To: kernel test robot <lkp@intel.com>
Cc: linux-nfs@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Rick Macklem <rmacklem@uoguelph.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This should be fixed in the v2 patches I posted.
(It needs the same patch as patch 0001 in the server
series, so I added it to the v2 series.)

rick

On Fri, Jan 9, 2026 at 1:55=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on trondmy-nfs/linux-next]
> [also build test ERROR on linus/master v6.19-rc4 next-20260109]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/rick-macklem-gmail=
-com/Add-entries-to-the-predefined-client-operations-enum/20260103-073239
> base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
> patch link:    https://lore.kernel.org/r/20260102232934.1560-6-rick.mackl=
em%40gmail.com
> patch subject: [PATCH v1 5/7] Make nfs4_server_supports_acls() global
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260110=
/202601100546.EDWB9nf6-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260110/202601100546.EDWB9nf6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601100546.EDWB9nf6-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/nfs/nfs4proc.c: In function 'nfs4_server_supports_acls':
> >> fs/nfs/nfs4proc.c:6083:50: error: 'FATTR4_WORD2_POSIX_DEFAULT_ACL' und=
eclared (first use in this function)
>     6083 |                 return server->attr_bitmask[2] & FATTR4_WORD2_=
POSIX_DEFAULT_ACL;
>          |                                                  ^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
>    fs/nfs/nfs4proc.c:6083:50: note: each undeclared identifier is reporte=
d only once for each function it appears in
> >> fs/nfs/nfs4proc.c:6085:50: error: 'FATTR4_WORD2_POSIX_ACCESS_ACL' unde=
clared (first use in this function); did you mean 'FATTR4_WORD1_TIME_ACCESS=
_SET'?
>     6085 |                 return server->attr_bitmask[2] & FATTR4_WORD2_=
POSIX_ACCESS_ACL;
>          |                                                  ^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
>          |                                                  FATTR4_WORD1_=
TIME_ACCESS_SET
>
>
> vim +/FATTR4_WORD2_POSIX_DEFAULT_ACL +6083 fs/nfs/nfs4proc.c
>
>   6071
>   6072  bool nfs4_server_supports_acls(const struct nfs_server *server,
>   6073                                        enum nfs4_acl_type type)
>   6074  {
>   6075          switch (type) {
>   6076          default:
>   6077                  return server->attr_bitmask[0] & FATTR4_WORD0_ACL=
;
>   6078          case NFS4ACL_DACL:
>   6079                  return server->attr_bitmask[1] & FATTR4_WORD1_DAC=
L;
>   6080          case NFS4ACL_SACL:
>   6081                  return server->attr_bitmask[1] & FATTR4_WORD1_SAC=
L;
>   6082          case NFS4ACL_POSIXDEFAULT:
> > 6083                  return server->attr_bitmask[2] & FATTR4_WORD2_POS=
IX_DEFAULT_ACL;
>   6084          case NFS4ACL_POSIXACCESS:
> > 6085                  return server->attr_bitmask[2] & FATTR4_WORD2_POS=
IX_ACCESS_ACL;
>   6086          }
>   6087  }
>   6088
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
