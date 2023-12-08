Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0235B3984B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TUdisxC6"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dbc55ebb312so727591276.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Dec 2023 09:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702056472; x=1702661272; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdoICmQ9QAD31pYA/bTZ1QatV+Ku9NtGC8oHfmaScDc=;
        b=TUdisxC6Gnp5Y7mI8R3smDQra3JvAuZ1bS7bQPmqgD8hfLQLG75DrU/Tr3tkLz8rZI
         dHILCxnp8d+lMxTIgH8BZoGdCRMOuXF2pkq8sTdYMJ1DNawBJPu0nJ8Gb8xyfjsWzWnK
         fjPLqwXypacvPQHnVYdDSoJmzTLjypNhf49o8Im7bONulVpPdO5x9yRbyawQYFq3o+tg
         hsJJKdJN1B4z9u5jJwGHpdyeIn23c9Ff/VwQjF1W4GZHFNLeGTnN6kNK22ZszLx50klG
         rQ+VxERepQoNjAs7KwCbugThkRva3V07O81ETQGQ6o9Azy0G6XOizdCVJThSrlQiJuV2
         EbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702056472; x=1702661272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdoICmQ9QAD31pYA/bTZ1QatV+Ku9NtGC8oHfmaScDc=;
        b=m32RgOV2is/Ptlx+YW8fDemtv1I/QrCRZZfaKaeo+RkBQpEzIMv/V3xchveYPdpTXY
         THQUr8PjaMgoeyKg7eeuSDrl+59E3rBUeTpAz4pZeX4W6idi0bRiEoH1jX954dZhVrjR
         P41f9pIoo8UEUKneNOJECr3v1ER/P1u0SKgzoU+aHFTEjgqycPem/IXNHrhaHEIqiyXD
         84BTsnhjw8GZuwFsnCy2BSzZIi7Q48EDF63E4a8Wi/y429BwkX82FQxo2b7Z1PqA3mhb
         c25SN5v16Ciymsk3PbZZwkCraC22YQ+musPOSf0XTdL/wqxbjj3NsvqVe/vki0p4Q+JB
         ZMRg==
X-Gm-Message-State: AOJu0YwJC4DeBoGd6SUT/haaJaFkjaipjBRiRZlcjS/teRanSWuYG4yQ
	SepI2K+s9Gvg2SnYbLXvdOLtRzhixfsQNhbTCLp8ig==
X-Google-Smtp-Source: AGHT+IEpJVfB6BWNWMVYbpi6wiG8uWpUQJne3gDqdaUVxxk6IDRE83cunTnBQQlGS5z3szh+TNs9mq4C68T3GyzSuXM=
X-Received: by 2002:a05:6902:e0d:b0:db9:7c23:434f with SMTP id
 df13-20020a0569020e0d00b00db97c23434fmr363066ybb.12.1702056471647; Fri, 08
 Dec 2023 09:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312081716.LUUhSNS4-lkp@intel.com>
In-Reply-To: <202312081716.LUUhSNS4-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 8 Dec 2023 09:27:38 -0800
Message-ID: <CAJuCfpF_FN07Pvn5BJn1vJMAeEPKRBdfT3kWXVD=WAfizto+UQ@mail.gmail.com>
Subject: Re: [linux-next:master 5469/6165] uffd-common.c:636:28: warning:
 unused variable 'uffdio_move'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 2:00=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
> commit: d02321ca0329457d5828a83b82b156e6337c4236 [5469/6165] selftests/mm=
: add UFFDIO_MOVE ioctl test
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231208/202312081716.LUUhSNS4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312081716.LUUhSNS4-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):

Huh. This is strange. I checked linux-next.git and looks like the
patch adding the test [1] is there but the one actually adding new
ioctl [2] is missing (at least I do not see the new definitions in
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/in=
clude/uapi/linux/userfaultfd.h).
Patches belong to the same series. I'll check what's going on later
today.

[1] https://lore.kernel.org/all/20231206103702.3873743-6-surenb@google.com/
[2] https://lore.kernel.org/all/20231206103702.3873743-3-surenb@google.com/

>
>    uffd-common.c: In function 'move_page':
>    uffd-common.c:636:28: error: storage size of 'uffdio_move' isn't known
>      636 |         struct uffdio_move uffdio_move;
>          |                            ^~~~~~~~~~~
>    uffd-common.c:643:28: error: 'UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES' undecl=
ared (first use in this function)
>      643 |         uffdio_move.mode =3D UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES;
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    uffd-common.c:643:28: note: each undeclared identifier is reported onl=
y once for each function it appears in
>    uffd-common.c:645:24: error: 'UFFDIO_MOVE' undeclared (first use in th=
is function); did you mean 'UFFDIO_COPY'?
>      645 |         if (ioctl(ufd, UFFDIO_MOVE, &uffdio_move)) {
>          |                        ^~~~~~~~~~~
>          |                        UFFDIO_COPY
> >> uffd-common.c:636:28: warning: unused variable 'uffdio_move' [-Wunused=
-variable]
>      636 |         struct uffdio_move uffdio_move;
>          |                            ^~~~~~~~~~~
> --
>    uffd-unit-tests.c:1323:42: error: 'UFFD_FEATURE_MOVE' undeclared here =
(not in a function); did you mean 'UFFD_EVENT_REMOVE'?
>     1323 |                 .uffd_feature_required =3D UFFD_FEATURE_MOVE,
>          |                                          ^~~~~~~~~~~~~~~~~
>          |                                          UFFD_EVENT_REMOVE
>    uffd-common.c: In function 'move_page':
>    uffd-common.c:636:28: error: storage size of 'uffdio_move' isn't known
>      636 |         struct uffdio_move uffdio_move;
>          |                            ^~~~~~~~~~~
>    uffd-common.c:643:28: error: 'UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES' undecl=
ared (first use in this function)
>      643 |         uffdio_move.mode =3D UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES;
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    uffd-common.c:643:28: note: each undeclared identifier is reported onl=
y once for each function it appears in
>    uffd-common.c:645:24: error: 'UFFDIO_MOVE' undeclared (first use in th=
is function); did you mean 'UFFDIO_COPY'?
>      645 |         if (ioctl(ufd, UFFDIO_MOVE, &uffdio_move)) {
>          |                        ^~~~~~~~~~~
>          |                        UFFDIO_COPY
> >> uffd-common.c:636:28: warning: unused variable 'uffdio_move' [-Wunused=
-variable]
>      636 |         struct uffdio_move uffdio_move;
>          |                            ^~~~~~~~~~~
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
