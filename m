Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8FF163
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 00:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB88C433C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 00:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691713209;
	bh=5VVXUjhq45Ks2LqWHHQol0T87eO9Y2xNFWg40wTOJhg=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=MlmAHLxtpRCKFexcP4PfGjgEInRBt0UQM+96P0c0tSDe1kn54eT5DLw6LQyRo06V0
	 gXtQ1hCjDVOuvo/8gPaZqcI9euKRW+rTYx1NoAo/0JHkzYobbsVYb1GEDoUPT3pDC1
	 dRGqrM6oF6CTJJD2f/cc8jMX6kN2kyyPFtb6YsvVE3rTB0qz80WGrYn4o/yyy1YJIJ
	 KNq0yD55Dei8ZAndl1ztMD3bDLjmP4YfLphy4yEdgJBgEaShud/CW4vYcZNljrerRA
	 6K15muI05LoQSXI7YjKEJPQA5xHLktdPg0omxqY/rGTLS8biiV+FnqoQTVU/t/TwbM
	 cBK8D1O/IwCpw==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5607cdb0959so1051271eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 17:20:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMqFTklEGiDDeHMNJ7mZg8fhzN5N3uMqyMbdTq4OpIsdgRZCDR
	Vhpp8ymRTCxv+ruROZC9rC3TXZMBD/VYX1VMFIQ=
X-Google-Smtp-Source: AGHT+IHv5v/8oFvJC3LXPCdUQtMRxAYR3jRPUHVEsKrVsX55Auwj6xparRB6kL9jMbBP6zyf42nwhry5SwOJtG/hWII=
X-Received: by 2002:a4a:6c5b:0:b0:56d:2adf:80db with SMTP id
 u27-20020a4a6c5b000000b0056d2adf80dbmr306112oof.3.1691713208673; Thu, 10 Aug
 2023 17:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:14c:0:b0:4e8:f6ff:2aab with HTTP; Thu, 10 Aug 2023
 17:20:07 -0700 (PDT)
In-Reply-To: <202308091557.5vsUQnAX-lkp@intel.com>
References: <202308091557.5vsUQnAX-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 11 Aug 2023 09:20:07 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_v6bX6NWA0bbqQ7tJ3RdkO9PYLGRA7XzYriMGXPEt8Cw@mail.gmail.com>
Message-ID: <CAKYAXd_v6bX6NWA0bbqQ7tJ3RdkO9PYLGRA7XzYriMGXPEt8Cw@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 4/4] fs/smb/server/ksmbd_work.c:120:5:
 warning: no previous prototype for '__ksmbd_iov_pin_rsp'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your report!
I have fixed it now and applied it again.

Thanks!

2023-08-09 16:23 GMT+09:00, kernel test robot <lkp@intel.com>:
> tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> head:   d1cd046a0fbc6d4f7c27ae2dc6a31b1a28d322e8
> commit: d1cd046a0fbc6d4f7c27ae2dc6a31b1a28d322e8 [4/4] ksmbd: add support
> for read in compound
> config: alpha-allyesconfig
> (https://download.01.org/0day-ci/archive/20230809/202308091557.5vsUQnAX-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 12.3.0
> reproduce:
> (https://download.01.org/0day-ci/archive/20230809/202308091557.5vsUQnAX-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202308091557.5vsUQnAX-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> fs/smb/server/ksmbd_work.c:120:5: warning: no previous prototype for
>>> '__ksmbd_iov_pin_rsp' [-Wmissing-prototypes]
>      120 | int __ksmbd_iov_pin_rsp(struct ksmbd_work *work, void *ib, int
> len,
>          |     ^~~~~~~~~~~~~~~~~~~
>
>
> vim +/__ksmbd_iov_pin_rsp +120 fs/smb/server/ksmbd_work.c
>
>    119	
>  > 120	int __ksmbd_iov_pin_rsp(struct ksmbd_work *work, void *ib, int len,
>    121				void *aux_buf, unsigned int aux_size)
>    122	{
>    123		/* Plus rfc_length size on first iov */
>    124		if (!work->iov_idx) {
>    125			work->iov[work->iov_idx].iov_base = work->response_buf;
>    126			work->iov[work->iov_idx].iov_len = 4;
>    127			work->iov_cnt++;
>    128		}
>    129	
>    130		ksmbd_realloc_iov_pin(work, ib, len);
>    131		inc_rfc1001_len(work->iov[0].iov_base, len);
>    132	
>    133		if (aux_size) {
>    134			struct aux_read *ar;
>    135	
>    136			ksmbd_realloc_iov_pin(work, aux_buf, aux_size);
>    137			inc_rfc1001_len(work->iov[0].iov_base, aux_size);
>    138	
>    139			ar = kmalloc(sizeof(struct aux_read), GFP_KERNEL);
>    140			if (!ar)
>    141				return -ENOMEM;
>    142	
>    143			ar->buf = aux_buf;
>    144			list_add(&ar->entry, &work->aux_read_list);
>    145		}
>    146	
>    147		return 0;
>    148	}
>    149	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
