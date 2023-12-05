Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1073FE23
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TExdMfLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BE0C433C8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701777866;
	bh=IMjvrQKRI4vjHwnrTQstpJ3havGeviihyGOpW3zJC3g=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=TExdMfLYVhaF48cZN/USXZB7Fuv6opQYLKhAldlSNoWc8muhlnj89aI3P7MPTKfHB
	 zpXiUmRncpHRSJlKjRGWgBhmet87JVEZH+5gupgQMTQihAOoUKlWIdauHA89ZEgrgj
	 rYXicTOEn3Vxf713F1BBbt+owDg47ifKx1hJqAAEj9mnlwIGqX226LCzSKL2XzfFRb
	 /OL030BMW+GdqsBERxHfOHKgJK8S1bkgaVCnwjXO8rDPOtJwGP8fRsJKN00GFyGw1P
	 9Q1FdLC9G0UtpBV2woJqgILUr/2PdBBt4Np6hiSBH4fM1kt6pMTqdN2F41ZZ0hSeuW
	 uSbQhxgT6sHBg==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b88c29a995so3152955b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Dec 2023 04:04:25 -0800 (PST)
X-Gm-Message-State: AOJu0YyYwV9F3KomfMYfLKTg9wweOoKbp/5NlwF0iK/tqIS4T0p2UxX8
	chL+FvCjOrkhWDiHAKkzfRnqA7Eqhcw9STZHnbM=
X-Google-Smtp-Source: AGHT+IHK35AR7+6NvsC1Fo8Scmf9TyGECVNhTvBK+5kV08KiMMy/4Y9e9YIecJqC/8Hg/x8SIuUizoCeq5EjzS0PuRI=
X-Received: by 2002:a05:6871:e713:b0:1fb:75b:99a5 with SMTP id
 qa19-20020a056871e71300b001fb075b99a5mr9141242oac.84.1701777865237; Tue, 05
 Dec 2023 04:04:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:5a85:0:b0:507:5de0:116e with HTTP; Tue, 5 Dec 2023
 04:04:24 -0800 (PST)
In-Reply-To: <202312051955.0b8rw970-lkp@intel.com>
References: <20231204134509.11413-3-linkinjeon@kernel.org> <202312051955.0b8rw970-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 5 Dec 2023 21:04:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_rf-sZvWoTyJVdAXd=nkrmwg5QG4LzoG57xX18p3rRow@mail.gmail.com>
Message-ID: <CAKYAXd_rf-sZvWoTyJVdAXd=nkrmwg5QG4LzoG57xX18p3rRow@mail.gmail.com>
Subject: Re: [PATCH 3/7] ksmbd: downgrade RWH lease caching state to RH for directory
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

2023-12-05 20:15 GMT+09:00, kernel test robot <lkp@intel.com>:
> Hi Namjae,
Hi kernel test robot.

Thanks for your report. I have fixed it.

Thanks again!
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on cifs/for-next]
> [also build test WARNING on linus/master v6.7-rc4 next-20231205]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-set-v2-lease-capability/20231204-214847
> base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> patch link:
> https://lore.kernel.org/r/20231204134509.11413-3-linkinjeon%40kernel.org
> patch subject: [PATCH 3/7] ksmbd: downgrade RWH lease caching state to RH
> for directory
> config: alpha-allyesconfig
> (https://download.01.org/0day-ci/archive/20231205/202312051955.0b8rw970-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20231205/202312051955.0b8rw970-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202312051955.0b8rw970-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> fs/smb/server/oplock.c:1405: warning: Function parameter or member
>>> 'is_dir' not described in 'parse_lease_state'
>
>
> vim +1405 fs/smb/server/oplock.c
>
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1397
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1398  /**
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1399   *
> parse_lease_state() - parse lease context containted in file open request
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1400   *
> @open_req:	buffer containing smb2 file open(create) request
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1401   *
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1402   *
> Return:  oplock state, -ENOENT if create lease context not found
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1403   */
> 9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1404  struct
> lease_ctx_info *parse_lease_state(void *open_req, bool is_dir)
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16 @1405  {
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1406  	struct
> create_context *cc;
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1407  	struct
> smb2_create_req *req = (struct smb2_create_req *)open_req;
> fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1408  	struct
> lease_ctx_info *lreq;
> fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1409
> fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1410  	cc =
> smb2_find_context_vals(req, SMB2_CREATE_REQUEST_LEASE, 4);
> fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1411  	if
> (IS_ERR_OR_NULL(cc))
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1412
> 		return NULL;
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1413
> fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1414  	lreq =
> kzalloc(sizeof(struct lease_ctx_info), GFP_KERNEL);
> fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1415  	if
> (!lreq)
> fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1416
> 		return NULL;
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1417
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1418  	if
> (sizeof(struct lease_context_v2) == le32_to_cpu(cc->DataLength)) {
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1419
> 		struct create_lease_v2 *lc = (struct create_lease_v2 *)cc;
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1420
> 2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1421
> 		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
> 9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1422  		if
> (is_dir)
> 9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1423
> 			lreq->req_state = lc->lcontext.LeaseState &
> 9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1424
> 				~SMB2_LEASE_WRITE_CACHING_LE;
> 9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1425  		else
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1426
> 			lreq->req_state = lc->lcontext.LeaseState;
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1427
> 		lreq->flags = lc->lcontext.LeaseFlags;
> 3ed2c7b63d1312c fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1428
> 		lreq->epoch = lc->lcontext.Epoch;
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1429
> 		lreq->duration = lc->lcontext.LeaseDuration;
> 2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1430
> 		memcpy(lreq->parent_lease_key, lc->lcontext.ParentLeaseKey,
> 2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1431
> 				SMB2_LEASE_KEY_SIZE);
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1432
> 		lreq->version = 2;
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1433  	} else
> {
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1434
> 		struct create_lease *lc = (struct create_lease *)cc;
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1435
> 2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1436
> 		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1437
> 		lreq->req_state = lc->lcontext.LeaseState;
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1438
> 		lreq->flags = lc->lcontext.LeaseFlags;
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1439
> 		lreq->duration = lc->lcontext.LeaseDuration;
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1440
> 		lreq->version = 1;
> ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1441  	}
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1442  	return
> lreq;
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1443  }
> e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1444
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
