Content-Type: multipart/mixed; boundary="===============3400349630021660854=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android-3.18 721/1128] drivers/platform/x86/alienware-wmi.c:468 alienware_hdmi_command() error: double free of 'output.pointer'
Date: Sat, 08 May 2021 11:06:32 +0300
Message-ID: <202105080345.gnWszPLw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3400349630021660854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-3.18
head:   9fdc1e6e49cc95c97f3285176b0417101f5ee38e
commit: 857260113eeb7c145dd939728eca0477394248f5 [721/1128] platform/x86: a=
lienware-wmi: Correct a memory leak
config: x86_64-randconfig-m001-20210507 (attached as .config)
compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/x86/alienware-wmi.c:468 alienware_hdmi_command() error: do=
uble free of 'output.pointer'

vim +468 drivers/platform/x86/alienware-wmi.c

bc2ef884320bdc Mario Limonciello 2014-05-07  443  static acpi_status alienw=
are_hdmi_command(struct hdmi_args *in_args,
bc2ef884320bdc Mario Limonciello 2014-05-07  444  					  u32 command, int *=
out_data)
a46ad0f13bc32a Mario Limonciello 2014-04-04  445  {
a46ad0f13bc32a Mario Limonciello 2014-04-04  446  	acpi_status status;
a46ad0f13bc32a Mario Limonciello 2014-04-04  447  	union acpi_object *obj;
bc2ef884320bdc Mario Limonciello 2014-05-07  448  	struct acpi_buffer input;
bc2ef884320bdc Mario Limonciello 2014-05-07  449  	struct acpi_buffer outpu=
t;
bc2ef884320bdc Mario Limonciello 2014-05-07  450  =

bc2ef884320bdc Mario Limonciello 2014-05-07  451  	input.length =3D (acpi_s=
ize) sizeof(*in_args);
bc2ef884320bdc Mario Limonciello 2014-05-07  452  	input.pointer =3D in_arg=
s;
b6f226670369d6 Colin Ian King    2019-03-30  453  	if (out_data) {
bc2ef884320bdc Mario Limonciello 2014-05-07  454  		output.length =3D ACPI_=
ALLOCATE_BUFFER;
bc2ef884320bdc Mario Limonciello 2014-05-07  455  		output.pointer =3D NULL;
bc2ef884320bdc Mario Limonciello 2014-05-07  456  		status =3D wmi_evaluate=
_method(WMAX_CONTROL_GUID, 1,
bc2ef884320bdc Mario Limonciello 2014-05-07  457  					     command, &input=
, &output);
b6f226670369d6 Colin Ian King    2019-03-30  458  		if (ACPI_SUCCESS(status=
)) {
bc2ef884320bdc Mario Limonciello 2014-05-07  459  			obj =3D (union acpi_ob=
ject *)output.pointer;
bc2ef884320bdc Mario Limonciello 2014-05-07  460  			if (obj && obj->type =
=3D=3D ACPI_TYPE_INTEGER)
bc2ef884320bdc Mario Limonciello 2014-05-07  461  				*out_data =3D (u32)ob=
j->integer.value;
bc2ef884320bdc Mario Limonciello 2014-05-07  462  		}
b6f226670369d6 Colin Ian King    2019-03-30  463  		kfree(output.pointer);
                                                                ^^^^^^^^^^^=
^^^^^^^^^^
Freed

b6f226670369d6 Colin Ian King    2019-03-30  464  	} else {
b6f226670369d6 Colin Ian King    2019-03-30  465  		status =3D wmi_evaluate=
_method(WMAX_CONTROL_GUID, 1,
b6f226670369d6 Colin Ian King    2019-03-30  466  					     command, &input=
, NULL);
b6f226670369d6 Colin Ian King    2019-03-30  467  	}
857260113eeb7c Mario Limonciello 2018-09-10 @468  	kfree(output.pointer);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^
Double freed.


bc2ef884320bdc Mario Limonciello 2014-05-07  469  	return status;
bc2ef884320bdc Mario Limonciello 2014-05-07  470  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3400349630021660854==--

