Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9E83112B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 20:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769803906; cv=pass; b=An6/RGi481IV5sOuoQ2R/gR21hMJr+7aTomsJRoja8HL24AAUakhyDbAlIou9siqCMcbE1q6tf6Um0O5hLqMxM5LYkO5Y3b9+ed/5F0q4DGvPZeLy0yZvMFdloL67fSzYtvw0dwNe2xm8rfTLtM5xqdBuoQgPl2tQq99+FvBX4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769803906; c=relaxed/simple;
	bh=rQg2XAmvCjv6Pxt+pWb6hjO1zF2ufQcWZb17Q9FMzPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaRwt4Y1tx0JoFLxTjKqnq3HkskCk4HhlZhEdrhxDQ9iOtXcTd5vN2IUvRd+RgtY9HruRkY8FsemY7B/O+F8+nSRwVMc38ru5iVIF9Jaqsml7dqVLqhuqgG8Auw07JcK21Q+rMI3rZfjgl4+fkJ3JN1aS8tWHAn0/YPIQxJJor0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YstEE4B6; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YstEE4B6"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c47ee987401so1055974a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 12:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769803904; cv=none;
        d=google.com; s=arc-20240605;
        b=DyqkjwOrWU9nwLBakMmca7bMDl64QReEGXiUM92x6udwnuhxfn670QzroUjRDWYdPu
         +XnCNwjd9Gwp5cQcTJlV4K7jvnAfM1gkW+52hp+0k7o1ekOJggAtGbC7oxLdYdC9gM/1
         Y4gEGl/ocjBWhqBvzOp/wnvck6VZlye5edG07fob9IBFPqtrDz9uRRxDOdRwaKqOcDo6
         GTdNQ4J2bn/+0EBdR0c97G2CnWKjuPij1TV2yXh0ds0GCaq3az2/iIutAOj4Xr26Q+e6
         CJmLzQ/XJlHh/ciIOjJ6Adyf3+QFZ3Xt+k9gcskFVtlipfeN2/iodF+I7z7wHZHnKofk
         sJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KqTERH/+2h6DWpnL/jhYC24xZ6zypIXUC8x2yGcNW24=;
        fh=+Yo5/jluoX2NUFbt0SXFwyN6+o/sijCF6WlBjWsIPAA=;
        b=lFNtM363Na7UBhrnB3LshUmpyD7Awj11vJfCG2lM/ppcmbiiXXkhSyAHnPbx9JhPTy
         CzEYGMjaiq3RsvJ5abitMrZg2m1P4t1/HI7YQ7na49pMsO4rVbKSVlDMHj7mCTNDFLUh
         XFgr69O7fYEUgSQXEeILKIjjMJUKZBbl56+gPVL10AZ77Jluthp2GOc6NAx/bR+iat6U
         YED2p4FWLZRVAqeDJ83eRaqRXkO06BiajGTwp4VChWANpCRSLoHf/NkVmEK0SgP4w297
         bCfK1uttZwfe5b76a3ZCu54bs8h0ZoLBEbiHF2jMNKbLVpIzoLYclMQ3u2UespJY4VUY
         HcLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769803904; x=1770408704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqTERH/+2h6DWpnL/jhYC24xZ6zypIXUC8x2yGcNW24=;
        b=YstEE4B6lDBgtGz14PFQChk19K6Q57zrNZs4SWL7CwY0lisjuVQoCbxqB4UZnFnySi
         Sj7mzCwjYHofbZtX3UiJOfa7SUCLD05fA3J3nA6P3qlGqXvDzGSh1cvqej2tBIOmR8z5
         T12nUmE8WGdgbFIvIENh5q89y8XYh/iVWnNbnUxsol1jnQOoCx1FJnT78jw9nDOr+gFT
         zeiLnLXRLBowSObFaY7jdk8HXHeONHq2GYgEuqZ9i+vbhGK4VjoyDoT5cipiG8qm+1yB
         jzl6c1g3v0ZIvPJg31w4QSNumP2aTQFwYlBSlrF10G9AB0yQdnj67+DEaF8c+dJcEVWP
         lTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803904; x=1770408704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KqTERH/+2h6DWpnL/jhYC24xZ6zypIXUC8x2yGcNW24=;
        b=ZcJXInFsyqkJ9jUAuyKr+tHbG2nuOrt34g1LTaEs5LPjwdnIc7cNzd+sToLW7EQvN7
         k+2WdIlMASlWYS9hnNinXw8kdiNFAN0Sm3Wmih+SpvOpFxZOQgsKhSTGVcBP7u1mPvAV
         RXaPDnGRNp7mgAOLSCX+2F3zC/exXVwHIkd7ibwe7Ll3Wreoz4bWhGeM5EDskDOmJ4Dv
         ej8zBlV3p7aS8/rwo2Kp1S7Xh6PBgjZxznnZuL/DtFJduwdDV/KLw45QpNEllHq4hzXZ
         8H+G7Dh8kf3rhiFCAT6Nv19047bNSGAFJGB40NDRcloRynNqHzClZ8jSGHQ8vIVLBH7y
         RK1A==
X-Forwarded-Encrypted: i=1; AJvYcCWDiDcXYUkN7vWKOWGNYuMy9m8MjqjSGJduCE84Fc2+8h/sFaOy962eT1yEGTdJeZGZ8mxCOtspZpqqL+Lu@lists.linux.dev
X-Gm-Message-State: AOJu0YzO+eCaiRvC5b9O1u/VK2cZejnQeU4gf406eF9VsG5ukcGovZVa
	39jbp4DFCEkwrEOlNfDF+hXm9NTGfHuW/5LgB1ZNYXjIBpFB1yXzalzWBxGjIfgD6ToJGph0Mp0
	x9t9PDmf6msQpMXosSxPCBRyTB01f+74=
X-Gm-Gg: AZuq6aJ7h9sLFpCv+xMWEC6z3JWowGLJHlNeZnOlmKQZlPSbhh5Cc8ujLNNvOhRiBvN
	17aimmwWN5ShTK8pxvoNYpbHbvyhU3QZ0AWH7ZEDS0U0G0Rx8EVpxsWnkek/dMPutxw68s0bbIC
	1C/Yc+syI0Edk9Iclm0mt6l2Ss7aIP+Txkheu9oBIAWDOpc6Yry+B+ytxBXKmosf44kT4XJgzSH
	ypENVfysZGx6nrs4536c9Fmya84nhLM+CZfPxg3h7dnu2OV+AodGDuB2YYygd5mPU7psQ3yR7SG
	HnYCHKgEXag=
X-Received: by 2002:a17:90a:d2c6:b0:34a:a16d:77c3 with SMTP id
 98e67ed59e1d1-3543c3a6c21mr3874104a91.2.1769803904268; Fri, 30 Jan 2026
 12:11:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129215340.3742283-1-andrii@kernel.org> <202601301121.zr5U6ixA-lkp@intel.com>
In-Reply-To: <202601301121.zr5U6ixA-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Jan 2026 12:11:31 -0800
X-Gm-Features: AZwV_Qj7wDya2OBtNs7PUmH8JcxUTODcuVx2e0LmJSjVryNSnlC4sk5utSn3GV0
Message-ID: <CAEf4BzZthAONGByqvk3pHRT3GaA8=fNbz+d1V1CY1N8sHEcsjA@mail.gmail.com>
Subject: Re: [PATCH v2 mm-stable] procfs: avoid fetching build ID while
 holding VMA lock
To: akpm@linux-foundation.org
Cc: kernel test robot <lkp@intel.com>, Andrii Nakryiko <andrii@kernel.org>, linux-mm@kvack.org, 
	oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	bpf@vger.kernel.org, surenb@google.com, shakeel.butt@linux.dev, 
	syzbot+4e70c8e0a2017b432f7a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 7:55=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Andrii,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/net]
> [also build test WARNING on bpf-next/master bpf/master linus/master v6.19=
-rc7]
> [cannot apply to akpm-mm/mm-everything next-20260129]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/pr=
ocfs-avoid-fetching-build-ID-while-holding-VMA-lock/20260130-055639
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
net
> patch link:    https://lore.kernel.org/r/20260129215340.3742283-1-andrii%=
40kernel.org
> patch subject: [PATCH v2 mm-stable] procfs: avoid fetching build ID while=
 holding VMA lock
> config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/202601=
30/202601301121.zr5U6ixA-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260130/202601301121.zr5U6ixA-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601301121.zr5U6ixA-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Warning: lib/buildid.c:348 This comment starts with '/**', but isn't a=
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>     * Parse build ID of ELF file

So AI tells me to be a proper kernel-doc comment this should have been:

* build_id_parse_file() - Parse build ID of ELF file

Andrew, should I send v3 or you can just patch it up in-place? Thanks!


>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
