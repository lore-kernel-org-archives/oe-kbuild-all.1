Content-Type: multipart/mixed; boundary="===============7550114646435468085=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 02/13] scsi: ufshpb: Init part I - Read HPB config
Date: Sat, 16 May 2020 03:33:47 +0800
Message-ID: <202005160325.dtEbbPHC%lkp@intel.com>
In-Reply-To: <1589538614-24048-3-git-send-email-avri.altman@wdc.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7550114646435468085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Avri,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on scsi/for-next]
[also build test WARNING on next-20200515]
[cannot apply to mkp-scsi/for-next v5.7-rc5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Avri-Altman/scsi-ufs-Add-H=
PB-Support/20200515-183602
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/scsi/ufs/ufshpb.c:69:26: sparse: sparse: symbol 'ufshpb_luns_con=
f' was not declared. Should it be static?
>> drivers/scsi/ufs/ufshpb.c:70:19: sparse: sparse: symbol 'ufshpb_luns' wa=
s not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7550114646435468085==--

