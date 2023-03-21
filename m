Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078748BE1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 09:58:59 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id w9so57375884edc.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679392738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKBF0p6guvCmwnToXhd4OYDdRDdzh6OgcvQvxbvE+pE=;
        b=EssSDkVxCEAiGv5UGOgq2FXRX5mORJvDvjbLhRZKixCrMrk+E4Ayn4rTBUKNzBpds6
         UP/+qjiov4zDNOqvq6FhN/UrcGLbG52TiL3y4Xv1ug3Lpa3snA+Dkylv+/3EW0VeLx/B
         TyE9uOV1JFkvUFw5ezhn9FGTTFbeHtQELvat1jocal2E1inCkZixH9AcqIahVYwWmy4e
         Uv86EIAAoBTP1/BXPmXJX4rr1NSJE6nXCsFPt8qKCxXVtHnn7s8y6c5Xia+OdMXn59zD
         3KTCZdjVF/EbbcjzwXQPYI+ZPOEJmAh1fBDU1ryOoWQxT/2p8FaRdeBlrHhGlKH7cSut
         YvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679392738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKBF0p6guvCmwnToXhd4OYDdRDdzh6OgcvQvxbvE+pE=;
        b=mJKexKzAjBoWDAmivAUomT8iZ4pQU5F3GdrgUc8R+d1NpIgvxJKism5en+XkemSFLl
         PJb47D9HPz5xG8qhLrLFrDU9Ys3G7JKFv7vPTjzracQIhrwb03WaCQ2BCxJm1moMh+q7
         N129pyQDiknkzUERxYH+Va3Cr6DyvEBB5eVekOD+eJLaYTSpDqXEqKlBml9VuuC3p/qO
         4dUatLQfoh8fsAN08y+KSFp1s/fiqdDYBRNOEIg1E6ODQCidO4xvzgnhmTG9oobbR506
         7pf9Ptkw4UR9K8sTxZJYmw2xcmt5Td4Nd9zCV1PhSDHcd2t2woM4aXS69fnszkPVvzsD
         bcRQ==
X-Gm-Message-State: AO0yUKXmB4F95iZ0xxOqlz5wIO7bHa2CsywgqZPwMr+OMZT9Mk34sstS
	OqD03Bnisxj7ra+bjjlK+MJUkLA3udel+JgRfJI=
X-Google-Smtp-Source: AK7set/ippFy/83YmzP2FZ+nw7dlI8lmyDdzjHCrK+ylNGhjJy9ZAoXOAtWE6qFbpMzYDH165NAhAsuL17AR0Xc5BlU=
X-Received: by 2002:a17:907:207b:b0:939:a51a:dc30 with SMTP id
 qp27-20020a170907207b00b00939a51adc30mr981955ejb.2.1679392738083; Tue, 21 Mar
 2023 02:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303211100.ExmaGnB0-lkp@intel.com>
In-Reply-To: <202303211100.ExmaGnB0-lkp@intel.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 21 Mar 2023 10:58:46 +0100
Message-ID: <CAOi1vP8GEOaSkcB5LhMo6i4k245T5=eyPweBgP3G=-Us_sjdGw@mail.gmail.com>
Subject: Re: [ceph-client:testing 19/80] fs/ceph/super.c:1122:15: error:
 implicit declaration of function 'fscrypt_add_test_dummy_key'
To: kernel test robot <lkp@intel.com>
Cc: Jeff Layton <jlayton@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 5:00=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://github.com/ceph/ceph-client.git testing
> head:   bc74c6176640bed8ff55211d4211658413f5c19c
> commit: 72326544b6f873e44659da920b51572bdf76b143 [19/80] ceph: implement =
-o test_dummy_encryption mount option
> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20230=
321/202303211100.ExmaGnB0-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/ceph/ceph-client/commit/72326544b6f873e44659=
da920b51572bdf76b143
>         git remote add ceph-client https://github.com/ceph/ceph-client.gi=
t
>         git fetch --no-tags ceph-client testing
>         git checkout 72326544b6f873e44659da920b51572bdf76b143
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dnios2 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dnios2 SHELL=3D/bin/bash fs/ceph/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303211100.ExmaGnB0-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/ceph/super.c: In function 'ceph_apply_test_dummy_encryption':
> >> fs/ceph/super.c:1122:15: error: implicit declaration of function 'fscr=
ypt_add_test_dummy_key' [-Werror=3Dimplicit-function-declaration]
>     1122 |         err =3D fscrypt_add_test_dummy_key(sb, &fsc->fsc_dummy=
_enc_policy);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>
>
> vim +/fscrypt_add_test_dummy_key +1122 fs/ceph/super.c
>
>   1088
>   1089  #ifdef CONFIG_FS_ENCRYPTION
>   1090  static int ceph_apply_test_dummy_encryption(struct super_block *s=
b,
>   1091                                              struct fs_context *fc=
,
>   1092                                              struct ceph_mount_opt=
ions *fsopt)
>   1093  {
>   1094          struct ceph_fs_client *fsc =3D sb->s_fs_info;
>   1095          int err;
>   1096
>   1097          if (!fscrypt_is_dummy_policy_set(&fsopt->dummy_enc_policy=
))
>   1098                  return 0;
>   1099
>   1100          /* No changing encryption context on remount. */
>   1101          if (fc->purpose =3D=3D FS_CONTEXT_FOR_RECONFIGURE &&
>   1102              !fscrypt_is_dummy_policy_set(&fsc->fsc_dummy_enc_poli=
cy)) {
>   1103                  if (fscrypt_dummy_policies_equal(&fsopt->dummy_en=
c_policy,
>   1104                                                   &fsc->fsc_dummy_=
enc_policy))
>   1105                          return 0;
>   1106                  errorfc(fc, "Can't set test_dummy_encryption on r=
emount");
>   1107                  return -EINVAL;
>   1108          }
>   1109
>   1110          /* Also make sure fsopt doesn't contain a conflicting val=
ue. */
>   1111          if (fscrypt_is_dummy_policy_set(&fsc->fsc_dummy_enc_polic=
y)) {
>   1112                  if (fscrypt_dummy_policies_equal(&fsopt->dummy_en=
c_policy,
>   1113                                                   &fsc->fsc_dummy_=
enc_policy))
>   1114                          return 0;
>   1115                  errorfc(fc, "Conflicting test_dummy_encryption op=
tions");
>   1116                  return -EINVAL;
>   1117          }
>   1118
>   1119          fsc->fsc_dummy_enc_policy =3D fsopt->dummy_enc_policy;
>   1120          memset(&fsopt->dummy_enc_policy, 0, sizeof(fsopt->dummy_e=
nc_policy));
>   1121
> > 1122          err =3D fscrypt_add_test_dummy_key(sb, &fsc->fsc_dummy_en=
c_policy);

Sorry, I missed that commit 097d7c1fcb8d ("fscrypt: clean up
fscrypt_add_test_dummy_key()") unexported this function when rebasing
because CONFIG_FS_ENCRYPTION wasn't on in that directory.

Thanks,

                Ilya
