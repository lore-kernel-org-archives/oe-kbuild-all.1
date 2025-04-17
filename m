Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E49EAE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744859620; cv=none; b=aOIJKliMAi1Ht7jlaC5BEuAr36+yfnVb0g0btoM6HZzIpO6nP7TZC+12moamXELa8/8Wsi/9HAJbPo/4OAGdZ+7bq244FMAMvhfhUCxfOisbryPQbNhaCSdJbjgvY6707Ij2tqxx/2yvdKSI2ltnxLlVbSeA7ZGblZX/2IJrl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744859620; c=relaxed/simple;
	bh=8Lg76RDATX5nrSmqI25cRjIK96XzW42HFvsjBBBNz7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRzt6YQLF8+guISxJRnzKEQZHWMFMkO4EGDZNB4tGs3Df/5zXNJgRMNfFiOoPwV3CRyUbM/GUBoj2Sj9n2aGH93OlbTysTQ4jhk2/KP31Atql3UQlOelHEEmi26/2p3Ds7CmAVGg/nI17+w2/di2f/IJu6hLGcVEJ+/41GTZHfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yGgs4SWi; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yGgs4SWi"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f09f2b3959so5732a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 20:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744859615; x=1745464415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znyb38ry2bcKrLD3m+0rc/cT6gNSpjuqkU+5HpltG+o=;
        b=yGgs4SWicxHQr0s5E/WHWBueQrm6zrvbAecxyVwB7pWPbOqBPhQFx02evZMF41RkdI
         mSGJI1+4PX0+ovParw7UB2p5cnEn03atKC0FccbqI9OegDgVhCduT+vyG2fMZRaJu2lO
         AiWPDMXtufFbDh7+FbBzRvQWpXC733NZcBoPeo8FG+QBJCHK8hk0/FeRsc1/3Rkhi7SY
         VBeNBDZ+PErTIQ3Bfzj2cAuNi1vikI8yG6lSFAV+ZyaMTJlGwVrJ6gc/5hRtXzJp/sbV
         9Jx38Z5i6Tb9FYwO37E3qzJPkt/Dc+9hXQTs76H0J6P8IFuaNefZdKyLWHH9nCWVzutS
         hJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744859615; x=1745464415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znyb38ry2bcKrLD3m+0rc/cT6gNSpjuqkU+5HpltG+o=;
        b=DebxBRIbrITCXhDRcCvXH5qYjs7Lv0kaPGxPDQF3sqo28BfbAeirGUP8Gf4b8J85jD
         FZLyKRqDali0ApGUCf5LNVKRcS25EjS9HvLlje+insYUFn8oLKUCRjvjpLxk7mroEkXn
         NglQMC1kCGOfguxlfEOl2ajBGVr8DYqzNfolUwJ5LrFpZWyI/sPQGU7Lsm+/pZdxHCPv
         dyeC2h0NgycxChULpFg0ZUYaZNMpzGwELSaEcNvC6TsPUgbtut5X7htVmcAAn1IPHsOP
         hoFDeQduw250mc5TNIDbqEpXYkT6u4y82C9zCl4P06bwMepk4IHGnif+1YnpkM+SHXJW
         vszA==
X-Forwarded-Encrypted: i=1; AJvYcCU/EnygCtpT4DoL+zS6aLlRQh+ZgMmwiS4ooAHyXxIogO/CRSyTJlCOqDP+wgYl8GBI+H6ap7ome9k+vYDn@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj2vFHMTC0TocDEpymtTUTjc69+7o+k8XHtsZlobqc2Dc0jkFk
	rXSBr6bsgtn2Nn3ya/YS5X/F9n+ZoAnjhVdjxIHVV4F2zg6hyiB6/54cUKqZAsVegKVRj9b2eFN
	MIlqw94LAlJEe6Umw4JD71+n08X5qO9XJ8z1z
X-Gm-Gg: ASbGncut/pbCvG/ZmQKiGSC/9itiyUdxNjnY/iA+uCHLm6zs1JHpKN28FfDNCu2LtZR
	dpSJ9VHCl5eiJmxWbjaP7k2cpFG19sAE2Il6v/dbDN80+FYrNDXQFzx8ZHnmv1GiObnKRqr0QZN
	OsUZ94mNocf8ft8mO7arib
X-Google-Smtp-Source: AGHT+IFw7kF7r3vqgCR+cGVl4G2MtxTmmev5AUh8oAejDfyWDC9AK+zMJ11T151RgjPuKZOmNsKzWzgm73emQolRzkw=
X-Received: by 2002:a05:6402:175c:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f4d2927f8fmr28040a12.7.1744859615261; Wed, 16 Apr 2025
 20:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415174145.346121-2-robertpang@google.com> <202504171044.TFdtTfEh-lkp@intel.com>
In-Reply-To: <202504171044.TFdtTfEh-lkp@intel.com>
From: Robert Pang <robertpang@google.com>
Date: Wed, 16 Apr 2025 20:13:24 -0700
X-Gm-Features: ATxdqUFBgiAHFh1P-CiVkjQQGtPiTBX0iJ-hw-ydXq4hjwl8qjDqcXLZwoair-I
Message-ID: <CAJhEC05SjwDBis3rfDw4-gg+tEyQ-aCkTSFVFs+Zw9xSSZUekw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] bcache: process fewer btree nodes in incremental
 GC cycles
To: kernel test robot <lkp@intel.com>
Cc: Coly Li <colyli@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-bcache@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Mingzhe Zou <mingzhe.zou@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please accept my apologies for the build error. It appears that the current
patch is missing a macro for 64-bit integer division needed for the i386
architecture. I will address this issue and submit a revised version prompt=
ly.

On Wed, Apr 16, 2025 at 7:31=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Robert,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.15-rc2 next-20250416]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Pang/bcache=
-process-fewer-btree-nodes-in-incremental-GC-cycles/20250416-133615
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250415174145.346121-2-robertpa=
ng%40google.com
> patch subject: [PATCH v2 1/1] bcache: process fewer btree nodes in increm=
ental GC cycles
> config: i386-buildonly-randconfig-001-20250417 (https://download.01.org/0=
day-ci/archive/20250417/202504171044.TFdtTfEh-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250417/202504171044.TFdtTfEh-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504171044.TFdtTfEh-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__udivdi3" [drivers/md/bcache/bcache.ko] undefined!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
