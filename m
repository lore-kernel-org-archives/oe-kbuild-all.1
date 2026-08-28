Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5B3B71A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 04:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787891144; cv=none; b=T3MONvJ65fp2e0oYqbeUndZz/Iyq0bncNqFLQd2VrG/7OohoFjJv+hFSCSMOzDeH4sEvkkTuWCszw9ailFmCuveUru5JpvF5mnIWnQlQ38XXKfprmDsnDCarX9uZtyUqZbMflJMXagLJHYpRbmeYNUMIB+O+MnbN4/WXRbJ+rtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787891144; c=relaxed/simple;
	bh=ze8rmYP6hSG1Nvtu0boG+L2IB4C4dgPFzuvzuExCYzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDwe0i2pg8i+n/0sbRasn0s5Sp28OuGGdZH7hP0lb5seWAW/p2I9P+veAOFD08E3gb39hQAV7G4u+7epl7T0CIiMNuNCw7xba7dtVMiR6imgZPLDxn34JGJFNI/3JzgKyzFS3isprIO2yVdogfiw5V/aelBCgRkj2IEcNYKL74E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON8/Dwva; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON8/Dwva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EAA1F00A3A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 04:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787891142;
	bh=U2AAGCILEC5NTGNNllVUwEdsn605Z/MhRnipJu0eW8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ON8/DwvaSE9nBMmNXhKA6kGI4LkbyJ04osW17yyHjx7n+vZf50QStb8CRJ8gtYu0D
	 Gqqc83NcMB0hIfSoar7yrvmhVRqXTj7nOAUMxXnfF8ek2nMsb8S+15KuvHcZi0sigD
	 i1PAwHTUGMfrfjau+QTBs8yiiFkctQQMm6EF9AOO5hzMw8Vf82D/RyEvH9cYzj+RCh
	 gfQhSJkHl1QJEMdfVrK41zukgVstsSfQSU/pdlcVI89fPhzV7EWDWbt+KD0Y0OGEx9
	 fvGBtpXOacnPlV2Ujf1Pz2OAzJ7y4TMjHFD0/xcEuPWnhN1drugdKwte+wyWLJ7cxg
	 C3hukiyhe5MHw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso734147a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 21:25:42 -0700 (PDT)
X-Gm-Message-State: AFuF++k9hLH3YDumJd9VMcP4Qenfz21JU7by9PtcHa0AUVJbVobvxJR9
	9I74yobbD3RdtjxQTT5Ah7BG2hbNpMdYYGbCNeZuzFp6t1Im7R3H4bj53/GnnyntkbgXol12hVl
	TBXYiOzVqvJuidYbTV63g8fXS08/WZ8M=
X-Received: by 2002:a05:6402:5112:b0:6a4:e8e:9e26 with SMTP id
 4fb4d7f45d1cf-6a60d3bc00fmr2003469a12.10.1787891141098; Thu, 27 Aug 2026
 21:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202608280518.yScC1zDp-lkp@intel.com>
In-Reply-To: <202608280518.yScC1zDp-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 28 Aug 2026 13:25:29 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_gxwQLMKQESNFtKr9Eo29YKUTSYyyyOTjtryO_Za+h5w@mail.gmail.com>
X-Gm-Features: AcwNN1XFHpzUWTNdmF21rRCQM_IULD8se6iBuQGB3v8A23pKelSGcZejLbREOJg
Message-ID: <CAKYAXd_gxwQLMKQESNFtKr9Eo29YKUTSYyyyOTjtryO_Za+h5w@mail.gmail.com>
Subject: Re: [linkinjeon-exfat:dev 1/1] fs/exfat/iomap.c:175:31: warning:
 'exfat_swap_iomap_ops' defined but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 6:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.=
git dev
> head:   20cb0bad8c3ad9220aff3e61e8703e17f72bb7f9
> commit: 20cb0bad8c3ad9220aff3e61e8703e17f72bb7f9 [1/1] exfat: map allocat=
ed extents for swap activation
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260828=
/202608280518.yScC1zDp-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260828/202608280518.yScC1zDp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608280518.yScC1zDp-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/exfat/iomap.c:175:31: warning: 'exfat_swap_iomap_ops' defined but n=
ot used [-Wunused-const-variable=3D]
>      175 | static const struct iomap_ops exfat_swap_iomap_ops =3D {
>          |                               ^~~~~~~~~~~~~~~~~~~~
I will fix it.
Thanks for the report!
