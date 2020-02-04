Content-Type: multipart/mixed; boundary="===============2523307486270920539=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 5/5] dax, iomap: Add helper dax_iomap_zero() to zero a range
Date: Tue, 04 Feb 2020 13:17:00 +0800
Message-ID: <202002041335.cKPlPSLq%lkp@intel.com>
In-Reply-To: <20200203200029.4592-6-vgoyal@redhat.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2523307486270920539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vivek,

I love your patch! Yet something to improve:

[auto build test ERROR on dm/for-next]
[also build test ERROR on s390/features xfs-linux/for-next linus/master lin=
ux-nvdimm/libnvdimm-for-next v5.5 next-20200203]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Vivek-Goyal/dax-pmem-Provi=
de-a-dax-operation-to-zero-range-of-memory/20200204-082750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux=
-dm.git for-next
config: s390-alldefconfig (attached as .config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Ds390 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/s390/block/dcssblk.c:65:21: error: 'dcssblk_dax_zero_page_range'=
 undeclared here (not in a function); did you mean 'generic_dax_zero_page_r=
ange'?
     .zero_page_range =3D dcssblk_dax_zero_page_range,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                        generic_dax_zero_page_range
   drivers/s390/block/dcssblk.c:945:12: warning: 'dcssblk_dax_zero_page_ran=
ge' defined but not used [-Wunused-function]
    static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,pgoff=
_t pgoff,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +65 drivers/s390/block/dcssblk.c

b3a9a0c36e1f7b Dan Williams   2018-05-02  59  =

7a2765f6e82063 Dan Williams   2017-01-26  60  static const struct dax_opera=
tions dcssblk_dax_ops =3D {
7a2765f6e82063 Dan Williams   2017-01-26  61  	.direct_access =3D dcssblk_d=
ax_direct_access,
7bf7eac8d64805 Dan Williams   2019-05-16  62  	.dax_supported =3D generic_f=
sdax_supported,
5d61e43b3975c0 Dan Williams   2017-06-27  63  	.copy_from_iter =3D dcssblk_=
dax_copy_from_iter,
b3a9a0c36e1f7b Dan Williams   2018-05-02  64  	.copy_to_iter =3D dcssblk_da=
x_copy_to_iter,
c5cb636194a0d8 Vivek Goyal    2020-02-03 @65  	.zero_page_range =3D dcssblk=
_dax_zero_page_range,
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  };
^1da177e4c3f41 Linus Torvalds 2005-04-16  67  =


:::::: The code at line 65 was first introduced by commit
:::::: c5cb636194a0d8d33d549903c92189385db48406 s390,dax: Add dax zero_page=
_range operation to dcssblk driver

:::::: TO: Vivek Goyal <vgoyal@redhat.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============2523307486270920539==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CcugaKz6Cu5F7/ZGn8P+AyGXX1pZdAAA
--===============2523307486270920539==--

