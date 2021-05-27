Content-Type: multipart/mixed; boundary="===============1045268842467211881=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/memory/fsl_ifc.c:298 fsl_ifc_ctrl_probe() warn: 'fsl_ifc_ctrl_dev->gregs' not released on lines: 298.
Date: Thu, 27 May 2021 10:36:42 -0400
Message-ID: <CAJKOXPdkDe1iNpZa9X0eRyWO85WBWuhRk-t=ENqkRk3p0=-LuA@mail.gmail.com>
In-Reply-To: <202105271713.TLhpzN7N-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1045268842467211881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 27 May 2021 at 05:31, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>
> Hi Krzysztof,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d7c5303fbc8ac874ae3e597a5a0d3707dc0230b4
> commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile t=
esting for most of the drivers
> config: s390-randconfig-m031-20210527 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/memory/fsl_ifc.c:298 fsl_ifc_ctrl_probe() warn: 'fsl_ifc_ctrl_dev=
->gregs' not released on lines: 298.

Thanks, I will fix it. I also see some more leaks there...


Best regards,
Krzysztof
--===============1045268842467211881==--

