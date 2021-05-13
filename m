Content-Type: multipart/mixed; boundary="===============0356712459148423574=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [intel-tdx:guest 51/63] drivers/acpi/svkl.c:165 acpi_svkl_init() warn: '&acpi_svkl_dev' not released on lines: 158.
Date: Thu, 13 May 2021 12:26:52 +0300
Message-ID: <202105131542.ihHji326-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0356712459148423574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel/tdx.git guest
head:   8c20c364d1f52e432181d142054b1c2efa0ae6d3
commit: 62c2d9fae275d5bf50f869e8cfb71d2ca1f71363 [51/63] ACPI: Add SVKL tab=
le support
config: x86_64-randconfig-m001-20210513 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/svkl.c:165 acpi_svkl_init() warn: '&acpi_svkl_dev' not release=
d on lines: 158.

vim +165 drivers/acpi/svkl.c

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  141  static int __ini=
t acpi_svkl_init(void)
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  142  {
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  143  	acpi_status sta=
tus =3D AE_OK;
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  144  	int ret;
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  145  =

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  146  	ret =3D misc_re=
gister(&acpi_svkl_dev);
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  147  	if (ret) {
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  148  		pr_err("SVKL: =
can't misc_register on minor=3D%d\n",
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  149  			MISC_DYNAMIC_=
MINOR);
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  150  		return ret;
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  151  	}
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  152  =

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  153  	mutex_init(&svk=
l_lock);
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  154  =

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  155  	status =3D acpi=
_get_table(ACPI_SIG_SVKL, 0, &svkl_tbl_hdr);
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  156  	if (ACPI_FAILUR=
E(status) || !svkl_tbl_hdr) {
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  157  		pr_err("get ta=
ble failed\n");
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  158  		return -ENODEV;

Static checker expected misc_unregister() before the return.

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  159  	}
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  160  =

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  161  	dump_svkl_heade=
r();
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  162  =

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  163  	pr_info("ACPI: =
SVKL module loaded\n");
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  164  =

62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19 @165  	return 0;
62c2d9fae275d5 Kuppuswamy Sathyanarayanan 2020-06-19  166  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0356712459148423574==--

