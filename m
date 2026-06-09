Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF844CA27C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043618; cv=pass; b=Oz1Dcspe5Hz2WHEjgbxfAEzpBttWJqOEVhYNmfNZL8RIe1pqZTNO4VBVt14zBGk56nKaYc1d03R7LyGF+me5PrShHHlCA0yYeT3HraiTB9LcpJ9rHYGb5mrJb14ChdQQr79Bc2SDc9PSABmzuJYQTG1hPRNUz33kj17HU4ccvqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043618; c=relaxed/simple;
	bh=hSgi0DQrQeGWXJn/UStoGjVMSyxqvgC7nF5MpkTHiIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CudTknuqW8IwE74rENYTOUaHQXNQAae3WrNZGPGy4/U0xQpQ9guL+Boys0tho3ZQwOrIoyin0sObk7FkrdZer1MU2ajS76hnesNJKum/gvcqC4j9R7eLVcMIYt+FE8Zvz+o0fwCw8DqNklAG5OIdoO4ftj0pNQgisRg32baJ9Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he/v3tpZ; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he/v3tpZ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-91591f19c30so913364485a.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Jun 2026 15:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781043616; cv=none;
        d=google.com; s=arc-20240605;
        b=hC96JHJysOkvx+PAKA7wz8XSmmn766ls6P8IRJpHALmWRFwLgZaOtsArSY74u7RFNS
         OxM9zTTyR3LLA4Fiji8GVXDhk9kTIC5DT9/sEKZX3KBWmJeD/BliO+I07vnc4PqNoTDx
         cbOOqVBxNF+0TnLIETbtmTAoTkVmldSapb2vAY9xWGLuuxFSPRduKN8yewmpNE2zBUSo
         tMWD4mGhoPH3Byss/1xf7seSQEWVZPiBgefizGU6eDgSF/kGTm4EjGrKUcX5W7PtYb1o
         KkSKNocFxCJFzuOCNMDcsbuapgWAnvh7I9xsoz/a+E2Asa78qBuy8CPnbxpFOLPqBUKy
         BKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ot/4t41HpYuXj39wqSGjI97S9W+8dZZVBBjzX6WdKw=;
        fh=reO31Tg8PvgYNxsDt+cs/XBP9u1kaxe8zjGoOXcQUlM=;
        b=HF23MdP3hkJ9EDMFuhL2EgTSTIeQySt7cTLgEZYJQuNwjsgCjSFWEOpt8JUgKB6ahT
         8+dSboBuhnPjgLGxHWXpW8bF6umhHz0JZd7JcHiXwLRdpV1vMw0VYDkyk6sj92IvJDOX
         PMHpwRQtSgszul8o14Z/oyNGxSfN7M6jn8bqy4H4A04uPmmmVCFjT1Qz5T0b5SngtdUf
         /zM2jSpUz30clTyWAJUKV6ahiDdQXPKEA1MMwuGSRvT5HwegFiE0XHESoQwokXTPLJOh
         ItF0HckQOCmxmqkyYcClJ0AF1R8Hm7TC0QCz0W9jGChzWLfX2KqBCWJn2J+5C7qUUkSd
         iSxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043616; x=1781648416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ot/4t41HpYuXj39wqSGjI97S9W+8dZZVBBjzX6WdKw=;
        b=he/v3tpZKdW7RfyrdoUQzAfbqIAo/HUqLQDc7goVYbVCZWX9Xh+IUeWcmV9/tyoz32
         LusgJPAekcebZ0DtyvXmP+Xh8EYBv07tmGWPnZ+WyGXmx+mqg7oUPgpuZcrEWMaBvCOn
         OLGDLzvmpIfzXe2UoE0tiCJnqzWRXvLrtveyFfkl/lgWfpNcy4V+4/Z11Y29cdubfiN0
         uVO0xblCQUDgcKUtUzEmegNrdSAI32086qBdrM4fV7j+mk4GXVhiUQP8uxncpe4QzjIt
         ds/xpsSKEiVpjnSaDX0wCWZGWJDt4ygDkI0LBtPfj2c+a7erZ+/vaSkhoWSpsihRscDN
         0Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043616; x=1781648416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ot/4t41HpYuXj39wqSGjI97S9W+8dZZVBBjzX6WdKw=;
        b=k6enmLl7OnGdF3pgxiNZLwSDjh4JgYeKu+WemvZ9MxxEkgvIpjQrM9vsKgo0garNWX
         YqfWTcIZh4N8Nij3ObDKucYde3Mv4x8V+Yh5CZWA3ui6TbFA0MqW3j9IHcaGeXf31awU
         wjG69/7pwIO/wIXoJBXIwQpPpsCmL7z7Wx1NgbHPMbbKOlgtwrTfz/GatzrbIZxqQYGy
         VAgAqEvqUraaXp9ZIS45Q/hlekglwn+PZpFBg8F9gdTVBJAsyOTkN8EJQdJAGOd0IM3+
         lFnFiCUVbzcmJZODh0hwAqNAVti0TdA+VS6yrrvt7cuWmKlHhvqcST3Or4gO0GeEHOZY
         h2iA==
X-Forwarded-Encrypted: i=1; AFNElJ/aK+HFdJKWCaazexq4AaekxVR50QSdl//MW0FK/1A/HCPuOvmW7Qtve5ZmmVkrSKl3reUIBLG70IC4I4W/@lists.linux.dev
X-Gm-Message-State: AOJu0YzBdqZWR1/Fdvungl8YCDHcdDNq1vLY0hqV130MXzB6BFuIw70+
	8vWh1xXTSOUoNZOh/ChrrPPbfDqY2yUWIulqoq/RmA2Yp1/mpXFwon6osq/TVGwDA74L7BFtzUO
	TfGbOXyZuVE4VLYC34WittAuKUnfWI08=
X-Gm-Gg: Acq92OHMYF4qdV+sAauZQEOlQnLan5k/sIjjQoVhTIwyGIvwu2EJVqLfAXE93U4UwFR
	a5BBpErclBuWXFYxrPy5BpoNEQ8IRcOEAEt2/vj0JOfSUKDxCeESqv+d4AIJb490swUx+qICLuA
	K45ajVE4ER33LsXPV1qKV+75AtA/nuh551Ny94BCiQEZW4IQhd6DFP26yCNiVhdL+d5+3+174lR
	4c5S70cEWXSio0rwl0AqxvEU9NlY/XhjLXDvD9pHw1H5vYEvIN9VNnb+4uTIj3rPEkSgRrJ1qzK
	wdgAmT226UmP2QHGAb5LamQQ1UFQxLGl/WPgrNUgnRdKXaSxudzpOWblnpWlA/y4tv1lZpNOCfj
	5kywUpF5e/P+iBDy3OQVToSKVTsZz12vi49KgwPDBsm53Yp4efNkf2+SaoYxZuYW1u+we++yvFR
	CIYxkLkfw3Z9je20HK5PJR78WTXwGcdbaf
X-Received: by 2002:a05:620a:1d0e:b0:911:9a7a:8076 with SMTP id
 af79cd13be357-915a9c350edmr3718229185a.8.1781043615973; Tue, 09 Jun 2026
 15:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606091825.Fvo4zzYp-lkp@intel.com> <20260609141108.90414-1-cel@kernel.org>
In-Reply-To: <20260609141108.90414-1-cel@kernel.org>
From: Steve French <smfrench@gmail.com>
Date: Tue, 9 Jun 2026 17:20:04 -0500
X-Gm-Features: AVVi8CeOfYnDex28-rn-0FojbcnrExEKLSF5jGwKXya_gdEo9vDq-mOmY0-SzJg
Message-ID: <CAH2r5mvCKnRjvt4VK7xj47L4yLoBc8_dTc_CRHjG4xq2MuFBjA@mail.gmail.com>
Subject: Re: [cifs:for-next-next 15/16] fs/smb/client/cifsfs.c:1204:22: error:
 use of undeclared identifier 'FS_XFLAG_CASEFOLD'
To: Chuck Lever <cel@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Steve French <stfrench@microsoft.com>, Roland Mainz <roland.mainz@nrubsig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 9:19=E2=80=AFAM Chuck Lever <cel@kernel.org> wrote:
>
> On 6/9/26 6:24 AM, kernel test robot wrote:
> > >> fs/smb/client/cifsfs.c:1204:22: error: use of undeclared identifier =
'FS_XFLAG_CASEFOLD'
>
> FS_XFLAG_CASEFOLD and FS_XFLAG_CASENONPRESERVING are defined by
> "fs: Add case sensitivity flags to file_kattr", the foundational
> patch of the case-sensitivity series. That patch adds the two
> macros to include/uapi/linux/fs.h and folds them into
> FS_XFLAG_RDONLY_MASK in include/linux/fileattr.h.
>
> The cifs consumer ("cifs: Implement fileattr_get for case
> sensitivity") landed in for-next-next without that prerequisite,
> so the identifiers are undeclared. The failure reproduces under
> both clang and gcc because the macros are simply absent, not
> because of any arch- or compiler-specific construct.
>
> Steve, the cifs patch should not be applied ahead of its
> dependency. Either base for-next-next on the branch carrying
> "fs: Add case sensitivity flags to file_kattr", or drop the cifs
> patch until that patch lands. The full series is intended to be
> merged together for this reason.

Removed now - the purpose of this branch ("for-next-next") was not to
forget patches in next merge window,
(ie that are too early to merge into cifs-2.6.git for-next) I didn't
realize that anyone auto-built from for-next-next,
I didn't want to forget about the followon patch to yours:

smb: client: revalidate attrs before reporting FS_COMPR_FL

  cifs_fileattr_get() reports FS_COMPR_FL from inode->cifsAttrs.
  Revalidate the dentry attributes before consulting cifsAttrs
  so that the reported compression flag reflects current server
  state when attribute revalidation is required.

  Signed-off-by: tanze <tanze@kylinos.cn>



--=20
Thanks,

Steve
