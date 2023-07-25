Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF08F4F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 12:23:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso8076298a12.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690287781; x=1690892581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9owLMS8sHQhUJrnD+5y3xCqUyOfT/62NmU/hXI5bVLw=;
        b=gtF4DI074f+EILO32+VTkL9LuhaL/R+L9G3IGjW1N91kSqXojFVt41h+LkW8byLHc6
         0lvtxHvD92anfKdXUdFimvhSWWUgZd4o0b3grZcaKlFu8GBU4igxrrxBmQ6NNCUx74Fv
         M5+E9y5qef2NURobKMlmWJmsvqYMr3co+ZVlSC8gsWgmNdHaBNLr5N+YWPWyftWZ7/nD
         K10rpZ9bmkkhawTgPs0K22Hd/TTEadHLDTwy8W/bE8T98RylLufSlFVck0nJFXwSCw99
         I5YMpNfmIbhgieIlGqSQLzyWDw+J+V4gB+2c6adyMgpoEv+n5Uc+WZf77fn2kWWyWR9y
         oqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690287781; x=1690892581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9owLMS8sHQhUJrnD+5y3xCqUyOfT/62NmU/hXI5bVLw=;
        b=c4klmXJIGUXrgywEAyrz6uYhz3QCVSAF8/BZDRyQ09zWBNgfdQJS0D4kLzYsfGeCCj
         avWbFBKZQ2QYAxz8QH9YdNC60M01o/EMOEP7ptNYP5128/lBjl3Te54tmYwe1DXJcJhz
         OFhP0m+hU3or5FRLILSs5HW4fACvdbKEwV9hDFAHSxu24ZmJ82JoDGCByvMHKk2YppJ7
         pYJ7RdKREV2au16XKawqHDKagvjGEJj+Dyxgeb9HRkCwXqiHjgjZWNXZ3XjMGRkztAq4
         i8XoYn8KAW9XUcOz4rG9+5TuPtVJDUZ3EMsO83WFxAnfp6USN04WszB72REAhAO1cTHy
         M39A==
X-Gm-Message-State: ABy/qLa3lVQPt9CgwVB85bzujxKhyvTSsCCTK5e5NZ8fuHzOF3u+sEG8
	rTEQMGJf2AoVurBzDIz8AypzOqODaU16OjwWYpU=
X-Google-Smtp-Source: APBJJlF3XsUzn/0PM0W45xzTm1bJHhZpCCIpCIob8qo4PzlsCi1+flAifQcLmPHkZs3/qYvsOwF8cyBZce2jheBQlDI=
X-Received: by 2002:aa7:d647:0:b0:522:1d80:7549 with SMTP id
 v7-20020aa7d647000000b005221d807549mr7762078edr.26.1690287780692; Tue, 25 Jul
 2023 05:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725043559.123889-3-idryomov@gmail.com> <202307252059.9Vomw3bd-lkp@intel.com>
In-Reply-To: <202307252059.9Vomw3bd-lkp@intel.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 25 Jul 2023 14:22:48 +0200
Message-ID: <CAOi1vP_Pgq7ZHH0KfDTXrkzge2-XtfvW5ZtPCgW03227vhju=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] rbd: harden get_lock_owner_info() a bit
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 2:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Ilya,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on ceph-client/testing]
> [also build test ERROR on ceph-client/for-linus linus/master v6.5-rc3 nex=
t-20230725]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Dryomov/rbd-m=
ake-get_lock_owner_info-return-a-single-locker-or-NULL/20230725-123707
> base:   https://github.com/ceph/ceph-client.git testing
> patch link:    https://lore.kernel.org/r/20230725043559.123889-3-idryomov=
%40gmail.com
> patch subject: [PATCH 2/3] rbd: harden get_lock_owner_info() a bit
> config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/2023072=
5/202307252059.9Vomw3bd-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230725/202307252059=
.9Vomw3bd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307252059.9Vomw3bd-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> [...]
>
> >> ERROR: modpost: "ceph_addr_is_blank" [drivers/block/rbd.ko] undefined!

Already fixed in a public branch, I will repost shortly.

Thanks,

                Ilya
