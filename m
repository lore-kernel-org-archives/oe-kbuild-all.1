Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7BF3C68F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jYfUuKa5"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b88c29a995so1572649b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Dec 2023 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702058982; x=1702663782; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MenIZOSvAAdbTeTWokYPl8mCmx3PiOT8ToJn6XjpGMg=;
        b=jYfUuKa5guu+NO3C+yafQLnSyLNJKzMMqM6aHoueiSE9Cwk8EImojtjIZjEjnwbi8t
         74E4UJTU5nOg/yP/3yTGdwh0mNH7DXqG1u3oMBPBKD8+vcPPwbf8QgIod1NQbynjDokG
         Jl0spEi/3J+8rlMqltytLbuKgKB14/xNFsTB5ixD5AamWrsQn/6s/1xDQHzh0kiJszWd
         g0v9kIrljOUb7wvI/e6LrmPJ9jHJ/nAiiYmjc0fXO2lsfrPErIxQNloupgV8eTVscuxE
         tjfuUP/U/7+lwVeVd8nn17jjC9f16aOkeTmDOFJng/3+NcsxxEHsK9oS/Cl9kQ2eZ3vi
         RKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702058982; x=1702663782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MenIZOSvAAdbTeTWokYPl8mCmx3PiOT8ToJn6XjpGMg=;
        b=AKj8+OYK/KipiX/Bd4Nr0iKZBBILnnMRL1drvyGbnNnQnJKzf3jKkIrD9n8JU2QR/j
         6jk3mx7F+OtIM2kwt+q1UxZxJ2egeirZBB2iQXP2w2QmwUQNL907xrORvmIn9ddAP8SR
         qFvOjc7WpEHn3nhv94IB004RoiPNZ5hqaUUtiWCot1GVEnuwmbft13Sj62tnffk86zGX
         u0cQKV6HchacYfx5WKmWdQMpHAZGBYRrolIUNnGDl4AwX9mTHSwwkCcL1WCTbfzHEt5J
         1GgZdqqxozUXf0ROeUWid7iKyf0nk72YF/s1QgVE1A/OkHRR/6WACJJU/mGXLPyVUTYo
         QBRg==
X-Gm-Message-State: AOJu0Yy5fZPji+0Si2zIbhkNNdhbOCelT/bL3SiEo+6eyRgthtwqxrPV
	bbprmtOi76YRDVAB39AnbWhBv8qa984aJ8o2rr7J3A==
X-Google-Smtp-Source: AGHT+IGsuVecqp9mZ3phWjPG+DMmAia7WheG8FxXhQJtflGnztlzWhRQNbFmRvI8fp5w9vofO/I3S2TtNHPKKM3HT3s=
X-Received: by 2002:a05:6808:170b:b0:3b9:e21d:c6a1 with SMTP id
 bc11-20020a056808170b00b003b9e21dc6a1mr511214oib.86.1702058982569; Fri, 08
 Dec 2023 10:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312081716.LUUhSNS4-lkp@intel.com> <CAJuCfpF_FN07Pvn5BJn1vJMAeEPKRBdfT3kWXVD=WAfizto+UQ@mail.gmail.com>
 <20231208100519.aa94b349b45e3b7ff25b3eba@linux-foundation.org> <CAJuCfpG_aCQpCSJPTg2SxuhfKbRWjPN4SM6BU-FJMr6cARM2eg@mail.gmail.com>
In-Reply-To: <CAJuCfpG_aCQpCSJPTg2SxuhfKbRWjPN4SM6BU-FJMr6cARM2eg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 8 Dec 2023 10:09:31 -0800
Message-ID: <CAJuCfpE0rvr1apUmrErS-9=QsfTMWt_P-a3xJLNLOfr75AXytg@mail.gmail.com>
Subject: Re: [linux-next:master 5469/6165] uffd-common.c:636:28: warning:
 unused variable 'uffdio_move'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 10:06=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
>
>
> On Fri, Dec 8, 2023 at 10:05=E2=80=AFAM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
>>
>> On Fri, 8 Dec 2023 09:27:38 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>>
>> > On Fri, Dec 8, 2023 at 2:00=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
>> > >
>> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git master
>> > > head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
>> > > commit: d02321ca0329457d5828a83b82b156e6337c4236 [5469/6165] selftes=
ts/mm: add UFFDIO_MOVE ioctl test
>> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/=
archive/20231208/202312081716.LUUhSNS4-lkp@intel.com/reproduce)
>> > >
>> > > If you fix the issue in a separate patch/commit (i.e. not just a new=
 version of
>> > > the same patch/commit), kindly add following tags
>> > > | Reported-by: kernel test robot <lkp@intel.com>
>> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202312081716.LUUhSNS=
4-lkp@intel.com/
>> > >
>> > > All warnings (new ones prefixed by >>):
>> >
>> > Huh. This is strange. I checked linux-next.git and looks like the
>> > patch adding the test [1] is there but the one actually adding new
>> > ioctl [2] is missing (at least I do not see the new definitions in
>> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/include/uapi/linux/userfaultfd.h).
>> > Patches belong to the same series. I'll check what's going on later
>> > today.
>> >
>> > [1] https://lore.kernel.org/all/20231206103702.3873743-6-surenb@google=
.com/
>> > [2] https://lore.kernel.org/all/20231206103702.3873743-3-surenb@google=
.com/
>>
>> Thanks.  Seems I messed up some reject resolution.. Fixed now.
>
>
> Great! Let me verify mm-unstable. Thanks!

Hmm. I still see incorrect version in both mm-unstable and in
linux-next after fetching and rebasing. Maybe I should check a bit
later?

>
>
