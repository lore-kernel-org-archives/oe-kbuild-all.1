Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52740318129
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605247; cv=none; b=HovaTgOz+d0sbysiSXrJw+fgNELYwjnL9taaK9tZmLYMh8j7uPH1oRuwXBPbXBBnqa0zldne/VF1dXNi8cmo+mukBRPwg3Rjsx8Qx1Gnv2WLmp1gs6XNFiD67XQhJgEWgchsu6lsI3/2AC6fPyJPf21cQF+tUYWai4qfEYs1vqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605247; c=relaxed/simple;
	bh=3dMBCPb7sPWQd6cHGCjMDZXz5cg3T2fNCKdx67bHPRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bE0l8fDM6wKOLIn4GPMY5O9GURWhs/MvFtV1SzRqO9rgo/omdTtJnLFiPntpd/SMZFC/ws9hfcd3iUQpifHAoZk6jWHriaVPIegVVDPjXLL4fuHolrIcgrToIc2bLnuV/Xmcm+lpXqoOisaPXxBaXh9bQqZC8O7nJiY09lyvB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HsT33+jT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HsT33+jT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24602f6d8b6so1379695ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1757605244; x=1758210044; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jeb6YN+L6VLLQUGuF5Un7uL2f+MNRcfIv+5jkzR9Ndk=;
        b=HsT33+jTauYNbq2K+cE/h24nqapM0zEFThAm428hld+5cqFk6K/JWDkJIfFBc1UIL7
         s1HF0hKiqcPrYhwk++UZs4he7z7hP1XUNuQyLLCaqm4C27L1/t+GmLHPYXqNh/quGOw3
         P0BWpdZKbhqysJ8CU5kncFh1ncakFmIzQgLZTgp3+oQr8BK7JtSklFPPaKjSkUCquhgL
         VEfKYt3SaZh97TJ0SzEm1IK8tHRh5sh4xD1T4zZBS88jpK7vpAZ7bgM9BDNUEor7MJPV
         8yZM0ppnrzE8P4d4SfQp6L6RGboXEL9c40JiUbbS9bYEy9Vy/xvNNBUSMnrhfMZfUK82
         XU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605244; x=1758210044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jeb6YN+L6VLLQUGuF5Un7uL2f+MNRcfIv+5jkzR9Ndk=;
        b=SCzS65OjHi+DHWxXGN8UtACU6BlSsHUdcIdjbbduwZC1sp9yvurzDlcW0V00V2V9Iq
         Xrzcdh8OJk/Gu0VpyH9+iQOXlWsK7gBFFRbq1D0Uh1kZPzYEMnl8ryON5YXJsd/xdu9w
         47wArmGD0ZG+1gRAGE8xERk+zNWbchX7pxYXyWijh2GvkZu3YwqHM9JeV2uaYq10RCAQ
         FpcyEo01uitzeA0sIrxGH3NlHE+2Ub7zhuYwTThggLId9fNIbUVQd5Xl1MKqH+ubBBK2
         0JUhduHs0BDdn7j/90V5P3TSMJnDeFnrzo0Mtpv1SXikHfhHqtPAR7y14715q6bSwZ5j
         TIXw==
X-Forwarded-Encrypted: i=1; AJvYcCVWE+PF7WxwqQSCI4ENqaIF9BEyI/Z5Un/12T171E7Ti8L32oISmMEG4UbJU6sfwD+HPMij15oSE475BKVf@lists.linux.dev
X-Gm-Message-State: AOJu0YyNT8z+8SRWSQvnTj9pcpfGdg2ZmPCTEH/Ji7GgOfRNRzeUkLOu
	cuMXIjhb3RQq0JjmP7+rUPEfiA85u6tSXTeq/MUKjzYAom8YdHYLlxIEnmBpJTM94Yk2QnBYFA7
	oeSlmW6eqKxb01/PD5XMA7FJ/Bv6gomSjp+78ZC494w==
X-Gm-Gg: ASbGnctK8Prjg77W7aqd2yMSk015rLvdmU9ynl9urNDTaZCkkL9Rc6qV7P6UqfQFU2H
	gDQniBrFqyCaokiLzgOglt3bJ4YNyhzjU0qZa8/XLlY+mXJ+vurOydsJUiaPfntuvXqLQV57Wji
	rNxa8N7qfqMB1IicYm1f0qLgw49/vrdr5yBwtVXdP2pXetjdd6omPZbSKBb9yeISmqQ77b6aWLW
	Y8L2he0UHmo/qgE7I49VXr/+dmY77grkZnpfWevtt4h0SbjAPW9TXjSOCJL
X-Google-Smtp-Source: AGHT+IG2nInta2sqDVH/dRKvY3qWVC7G44UGNDTG57BwY8nZjvr+UhqdgI7fQHroaxYIWizvZz3PGSjP5Rd1Vz7yjQc=
X-Received: by 2002:a17:903:41c7:b0:24c:cbcc:b7ae with SMTP id
 d9443c01a7336-2517493a0cbmr150306945ad.6.1757605244486; Thu, 11 Sep 2025
 08:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509111833.pUskVuP3-lkp@intel.com>
In-Reply-To: <202509111833.pUskVuP3-lkp@intel.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 11 Sep 2025 08:40:33 -0700
X-Gm-Features: Ac12FXxjyHDuk-KpQ0v7IUAMQh0g9EH4khx92PjLpOkGwiGa4ebwEhWd4Af6HCs
Message-ID: <CADUfDZqdkBHVLST=1LwaVVmNiRj6ZM12sroeaDvRUidrq7tVWg@mail.gmail.com>
Subject: Re: [linux-next:master 5075/8263] include/linux/io_uring/cmd.h:112:8:
 error: unknown type name 'io_uring_tw_t'; did you mean 'io_uring_cmd_tw_t'?
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Already reported and fixed in the for-6.18/io_uring tree:
https://lore.kernel.org/io-uring/71c05242-a522-4294-bfc5-d867bb154284@kerne=
l.dk/


On Thu, Sep 11, 2025 at 3:19=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> commit: df3a7762ee24ba6a33d4215244e329ca300f4819 [5075/8263] io_uring/uri=
ng_cmd: add io_uring_cmd_tw_t type alias
> config: x86_64-buildonly-randconfig-005-20250911 (https://download.01.org=
/0day-ci/archive/20250911/202509111833.pUskVuP3-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250911/202509111833.pUskVuP3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509111833.pUskVuP3-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD 8f21d9da46702c4d6951ba60ca8a05f42870fe8f=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>    In file included from block/fops.c:20:
> >> include/linux/io_uring/cmd.h:112:8: error: unknown type name 'io_uring=
_tw_t'; did you mean 'io_uring_cmd_tw_t'?
>      112 |                             io_uring_tw_t task_work_cb,
>          |                             ^~~~~~~~~~~~~
>          |                             io_uring_cmd_tw_t
>    include/linux/io_uring/cmd.h:14:16: note: 'io_uring_cmd_tw_t' declared=
 here
>       14 | typedef void (*io_uring_cmd_tw_t)(struct io_uring_cmd *cmd,
>          |                ^
>    1 error generated.
>
>
> vim +112 include/linux/io_uring/cmd.h
>
>     75
>     76  /*
>     77   * Select a buffer from the provided buffer group for multishot u=
ring_cmd.
>     78   * Returns the selected buffer address and size.
>     79   */
>     80  struct io_br_sel io_uring_cmd_buffer_select(struct io_uring_cmd *=
ioucmd,
>     81                                              unsigned buf_group, s=
ize_t *len,
>     82                                              unsigned int issue_fl=
ags);
>     83
>     84  /*
>     85   * Complete a multishot uring_cmd event. This will post a CQE to =
the completion
>     86   * queue and update the provided buffer.
>     87   */
>     88  bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
>     89                                   struct io_br_sel *sel, unsigned =
int issue_flags);
>     90
>     91  #else
>     92  static inline int
>     93  io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
>     94                            struct iov_iter *iter, struct io_uring_=
cmd *ioucmd,
>     95                            unsigned int issue_flags)
>     96  {
>     97          return -EOPNOTSUPP;
>     98  }
>     99  static inline int io_uring_cmd_import_fixed_vec(struct io_uring_c=
md *ioucmd,
>    100                                                  const struct iove=
c __user *uvec,
>    101                                                  size_t uvec_segs,
>    102                                                  int ddir, struct =
iov_iter *iter,
>    103                                                  unsigned issue_fl=
ags)
>    104  {
>    105          return -EOPNOTSUPP;
>    106  }
>    107  static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ss=
ize_t ret,
>    108                  u64 ret2, unsigned issue_flags)
>    109  {
>    110  }
>    111  static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd =
*ioucmd,
>  > 112                              io_uring_tw_t task_work_cb,
>    113                              unsigned flags)
>    114  {
>    115  }
>    116  static inline void io_uring_cmd_mark_cancelable(struct io_uring_c=
md *cmd,
>    117                  unsigned int issue_flags)
>    118  {
>    119  }
>    120  static inline void io_uring_cmd_issue_blocking(struct io_uring_cm=
d *ioucmd)
>    121  {
>    122  }
>    123  static inline struct io_br_sel
>    124  io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd, unsigned =
buf_group,
>    125                             size_t *len, unsigned int issue_flags)
>    126  {
>    127          return (struct io_br_sel) { .val =3D -EOPNOTSUPP };
>    128  }
>    129  static inline bool io_uring_mshot_cmd_post_cqe(struct io_uring_cm=
d *ioucmd,
>    130                                  ssize_t ret, unsigned int issue_f=
lags)
>    131  {
>    132          return true;
>    133  }
>    134  #endif
>    135
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
