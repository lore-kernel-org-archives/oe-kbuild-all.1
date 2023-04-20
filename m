Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101ED8492
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 13:28:39 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4ec817735a7so536726e87.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681997318; x=1684589318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsQHPIV1Ehf/4fM8YYUDLE/bFem2uzfIPTtkkuxRl1Y=;
        b=QLd/ptbEUn2g6q1+Pr/0hjD6DG2ZLeWQ0PBL/Mc/1rrb5aBoCY+qBUBV9CQ9mU7lvu
         DDkwkqNW+bjOlxDcCEX5Ux1fxBo3OPMUBLfIgjCxyhfLdff2jnj4Z9FwRx/VMvWPBGqy
         qsjtWJerMUXme5XVZGOspqIUMesPsx99gstNn4CizzyFQW072koLs4aQ8vyvfNRrp2vg
         af06mTB2yRRhKx+SqAlUmy9Fgq1RmL0FAtR3kCjno1xHB8O8mXooBRYyTfBuQQa1J8EP
         HOAy3PNvHXdU1NFRsrEOqIZX02T1KOPhdBMZT8deyGGy6UFyWZ4pVUAWuQvWr/4gQMab
         MIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681997318; x=1684589318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsQHPIV1Ehf/4fM8YYUDLE/bFem2uzfIPTtkkuxRl1Y=;
        b=ciBdkq8Xg2hnxYivBuwyfBXJxjFHTBUJskemcQqBGM1Mlo+/WmXFYDlALwQwDsoqYZ
         J4BXY8h/EYMD9Xza40E9+QEjpyaqZKGSk8/eVyd+T9VdrcbPIYBhRdTKj5j9Xb9TBm/Q
         nMxYHnnrSookFS/04z6HEMkaQo0IcbyrkBgvUd+eUAiTV6vSgx0f4YcCSdDw1v/gjDdR
         K8AG9Cy3Zv1Ant9ALnLKWaEBSUEHJFocXuwQJNLR3BR22a5hJzasfT0ukQpXeaStvsGi
         c+/wwxMJvF+rVFTWJ0zWj9ICC/jDlwI+C7ArLLcZkdR4O9kSXlh02Qii4pakFWlmvqtI
         IbNQ==
X-Gm-Message-State: AAQBX9diplTHspjBH/4S2HquDgto+mzIXhze5oRAniFAvEYA17i8Q1GD
	b8Fx0wYlOS56qa2xc3n47E7nmvm4NTkO5fP0Jlc=
X-Google-Smtp-Source: AKy350brY4KkO9okJRBJGqEqnyIef1vhgAcE3Ag3OhSiUboNIUStN19Y6Qr75p7jFDaL36KIwu+IeODNN1LJSmZv6y8=
X-Received: by 2002:a19:5202:0:b0:4ed:d4c8:66c3 with SMTP id
 m2-20020a195202000000b004edd4c866c3mr403576lfb.2.1681997317943; Thu, 20 Apr
 2023 06:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230419151321.6167-14-jorge.lopez2@hp.com> <202304201100.r6QLG0Fc-lkp@intel.com>
In-Reply-To: <202304201100.r6QLG0Fc-lkp@intel.com>
From: Jorge Lopez <jorgealtxwork@gmail.com>
Date: Thu, 20 Apr 2023 08:28:15 -0500
Message-ID: <CAOOmCE8hHozxCbUnRYwAr5SNbwn8JdT16tvNMohktrDJv0tjKA@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] HP BIOSCFG driver - Makefile
To: kernel test robot <lkp@intel.com>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas@t-8ch.de, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the heads up.  I will look  them over.

Regards,

Jorge

On Wed, Apr 19, 2023 at 10:57=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jorge,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.3-rc7 next-20230419]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Lopez/HP-BIO=
SCFG-driver-Documentation/20230419-231828
> patch link:    https://lore.kernel.org/r/20230419151321.6167-14-jorge.lop=
ez2%40hp.com
> patch subject: [PATCH v10 13/14] HP BIOSCFG driver  - Makefile
> config: i386-randconfig-s002-20230417 (https://download.01.org/0day-ci/ar=
chive/20230420/202304201100.r6QLG0Fc-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://github.com/intel-lab-lkp/linux/commit/cfbebfbd4ed15793f=
ab894715bfd74387adcf4f1
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Jorge-Lopez/HP-BIOSCFG-driver-Do=
cumentation/20230419-231828
>         git checkout cfbebfbd4ed15793fab894715bfd74387adcf4f1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Di386 olddefconfig
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/platform/x86/hp/hp-biosc=
fg/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304201100.r6QLG0Fc-lkp@i=
ntel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c:80:23: spars=
e: sparse: symbol 'sure_start_audit_log_entries' was not declared. Should i=
t be static?
> --
> >> drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:191:23: sparse:=
 sparse: symbol 'password_spm_status' was not declared. Should it be static=
?
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
