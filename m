Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A23446A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782188761; cv=none; b=UUmkYgnwRncVo+65m5WeedQbPZiy8SGuc0v1uVVm4u3wQvIZ3gszpVUhJUSI3XuI+49en3a351hMqBY+b2ea7duzywI5IjAU+4gg9Vw04mV6Y7PB3KgON9H4d0Dqq/Toe+6efdSQLJce5tTs9DLq9uX+Oophojtc2nawWQuOwQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782188761; c=relaxed/simple;
	bh=wOPa1dqq+mlKJoifwWbp4RjsHBrFsS0BY3T7L5BB4Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Opzd021FxBeUhqBZIymWhoj/Coxq/ZjOCw68HeSRqYFmG9Tu0rMH2ZFGOo7nDv7IADp1qF9cd9tAAc1sIHaYnYaCFO6V9ZmPL6sHyAmm9YQU0Xk9PkVDUXUYGsIUEfxT4FFSFEoUtykujozcjYdHtjjprh2mecNEKGFkbXi++Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqIdEt6i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqIdEt6i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BE11F000E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 04:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782188759;
	bh=WImKe0gNySjp3D4JqCdv0qGJ8o/akw0TckF/LbQn0u8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mqIdEt6iNzTvPHpN0ep6GPsFmKeUfxoxrYt9fqJttuJqbnl9w9Tw92HPaYO+e7tNK
	 orrG9WX2h5nrVZVdMjYARwDq4b5txT2Mcrg3cNxO3VBivs/ASkL46NVgl9rI3quwIm
	 fZL8eLLXoQL8iBHOglZgexFryyOu802UjrbEpj7rKe4niE5PYRnNbbiv+b2QtVCRwz
	 UuWFjZ+Ten2PEztWhlg+YmbZvCQXqGZdhZ343zFacZ3M1oXaTdY91IfI/iyQsjCEh/
	 0WxmPe+CGuxlx3redp6txtOUhF8z3tMiqkbTJ8w0SocjdDq+yh/Pr+rslV9suhLNe5
	 Dwg7K7lRRRX2w==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c07ea058c1aso822062566b.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 21:25:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Sbq+sQrUr3/G8JyQSMsJq/LQlMgfrSOOiGVy50fUcjfzeWYriQtnNFoHNP4cfxkAci42uLlNTY4k9fVvA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7cpRm8oCK1V0JM0jCoPHpfhSxuL/w4JdhNO8+sbeLuuWfHXQ5
	qVDEgVlxeDcsMIF02/jLKMqewCDQ70pmUftQUXIOkxJe0GwjCLFwAOBz13nWLuuYpIDWiiqKsRA
	Qlta+yorOAPUUp/f+OEfl7pN05ZWFxE4=
X-Received: by 2002:a17:907:1caa:b0:bd1:ba38:c724 with SMTP id
 a640c23a62f3a-c108ecf75dcmr38361366b.32.1782188758450; Mon, 22 Jun 2026
 21:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606231232.Q1v04anI-lkp@intel.com>
In-Reply-To: <202606231232.Q1v04anI-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 23 Jun 2026 13:25:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8oAmaFo=Df1vfUx--iA5JrdTmNQjJjuzmrV+25YMHK3w@mail.gmail.com>
X-Gm-Features: AVVi8CfJCG_UuYHKmw7vugRktWd5DKRHawdcUby9I8ObpawwAD9IBgHhe9pwj8E
Message-ID: <CAKYAXd8oAmaFo=Df1vfUx--iA5JrdTmNQjJjuzmrV+25YMHK3w@mail.gmail.com>
Subject: Re: [linux-next:master 14744/14955] ERROR: modpost:
 "__hexagon_moddi3" [fs/smb/server/ksmbd.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 1:19=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> commit: 64ab25180b27fff29912cbf1728bd1ce46119156 [14744/14955] ksmbd: ret=
urn requested create allocation size
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
60623/202606231232.Q1v04anI-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a=
9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260623/202606231232.Q1v04anI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606231232.Q1v04anI-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__hexagon_moddi3" [fs/smb/server/ksmbd.ko] undefined!
We have already fixed it and applied it to our tree.
Thanks for the report.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
