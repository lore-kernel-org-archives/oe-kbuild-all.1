Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1C63BC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 14:29:56 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58ca499456dso67379307b3.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1693405795; x=1694010595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NghURf49RK5ylycOOwon5RzRxws9/PW8JtsRCxfmiyY=;
        b=cL/oz/02trymgQ0p0z0kA9LUmKReWVCkDVrFzlTcQ9tkKkb5xWjVN80owJhV1xYcL3
         8WTe9FeoGrDcgWWPhNQVGXFTsrzimR/KyCv1v0LPPwZaFRjp7/SMgy7NtGTkm8Qo0kle
         qvMckiZwizhSCF/3xDs7krqVkFeuc91kGH9fB8A82jxeo28yDJlCUq6/GeM6XMd9ml6h
         1w6oB1gHEWO5xHjdv4hIihdVh2jvH3jTbfJEBr3WfLmEcm45qlHYb08prMitpGJ89co3
         PAbYznIaF7SPqlsnlO+8JwSKtqaRfP0GDaaTYN6T3hi6ed4v6sVMzbsTU/KcaoSxPO7i
         8nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693405795; x=1694010595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NghURf49RK5ylycOOwon5RzRxws9/PW8JtsRCxfmiyY=;
        b=CheWvzrCFq1uKktzP/Xl1tSraPQR3n1LWXTMA0pvCIcs20ebUrdvBI8irSu8Y1+Jq4
         S++2QVOvHLt1Ik4J35TxJsQwrmRY9n4NMFDwDHlcEWhW6WOEujBtx5Hrbf5JmDuTfcFG
         eF7B70pHFze21BM2pfwmffmVMAUW/Gxlg3rOGb+nmTopgY5P+m6h5J/EhH8KmtY8mncf
         KtyyoUb86qElEjeIJuIua/kjPOyIqtjt1P3qBCqbDhLIGVNPB5vP5zc/0RszJQid2Dfg
         BauK041ZV5t16gh676Nxtrr9G2IB6yiad/FYWtitqO6ZYC35OTQBncNTzxEYwqPJSjvl
         kJYA==
X-Gm-Message-State: AOJu0YwBKn5dWEuMIv5DnG8Wp53eyrgNMickF1EMJrAquGE6o5bM0Q5A
	LcqhJW2Otwyr/nWvZMOC0LQwcba8Ev7FoPq48Emup9hFZDGKxqA=
X-Google-Smtp-Source: AGHT+IENUcGV1zmTTBYYJ4iI6kb1uCtEbWSrgnMVUQ/8HiTd3flLhgpR3sz66wZeZ1ViiieOOnosB8xqzoOlplCZg5w=
X-Received: by 2002:a0d:f747:0:b0:595:80e4:907d with SMTP id
 h68-20020a0df747000000b0059580e4907dmr2056857ywf.32.1693405795614; Wed, 30
 Aug 2023 07:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308301248.hEwyeVEl-lkp@intel.com>
In-Reply-To: <202308301248.hEwyeVEl-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 30 Aug 2023 10:29:44 -0400
Message-ID: <CAHC9VhQZFZTaXb_S5YCy9KniVfPBmEQrY74_dMi5cBftZsrwNg@mail.gmail.com>
Subject: Re: [pcmoore-audit:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
To: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Cc: linux-audit@redhat.com, audit@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 12:17=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git=
 main
> head:   94e5ef9b157c6c3779352a8d4121542f71de52a1
> commit: 94e5ef9b157c6c3779352a8d4121542f71de52a1 [1/1] audit: add a Linux=
 Audit specific README.md and SECURITY.md
> config: parisc-randconfig-r012-20230830 (https://download.01.org/0day-ci/=
archive/20230830/202308301248.hEwyeVEl-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230830/202308301248.hEwyeVEl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308301248.hEwyeVEl-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> README.orig: warning: ignored by one of the .gitignore files
>    tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of=
 the .gitignore files
>    tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one=
 of the .gitignore files
>    tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one o=
f the .gitignore files
>    tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored =
by one of the .gitignore files
>    tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by on=
e of the .gitignore files
>    tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the=
 .gitignore files
>    tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .=
gitignore files
>    tools/testing/selftests/kvm/config: warning: ignored by one of the .gi=
tignore files
>    tools/testing/selftests/kvm/settings: warning: ignored by one of the .=
gitignore files

I have no idea if there is a person attached to any of the addresses
on the To line above, but please send audit kernel issues to
audit@vger.kernel.org and not linux-audit@redhat.com.

Thanks.

--=20
paul-moore.com
