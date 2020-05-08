Content-Type: multipart/mixed; boundary="===============1742135149129651975=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [chrome-os:chromeos-4.4 83/91] drivers/staging/gasket/apex_driver.c:907:6: warning: Local variable 'temp_poll_interval' shadows outer variable [shadowVariable]
Date: Fri, 08 May 2020 14:43:18 +0800
Message-ID: <202005081415.1knonFgQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1742135149129651975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.4
head:   1231e06d9791a1cb79112533c0405c40300fbd95
commit: 8a8a2dd0e349378a600d7a9c7c5e9ff5774c38df [83/91] CHROMIUM: staging:=
 gasket: Add performance scaling based on temperature

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/staging/gasket/apex_driver.c:907:6: warning: Local variable 'tem=
p_poll_interval' shadows outer variable [shadowVariable]
    int temp_poll_interval =3D atomic_read(&apex_dev->temp_poll_interval);
        ^
   drivers/staging/gasket/apex_driver.c:286:12: note: Shadowed declaration
   static int temp_poll_interval =3D DEFAULT_APEX_TEMP_POLL_INTERVAL;
              ^
   drivers/staging/gasket/apex_driver.c:907:6: note: Shadow variable
    int temp_poll_interval =3D atomic_read(&apex_dev->temp_poll_interval);
        ^
   drivers/staging/gasket/apex_driver.c:1027:6: warning: Local variable 'te=
mp_poll_interval' shadows outer variable [shadowVariable]
    int temp_poll_interval =3D atomic_read(&apex_dev->temp_poll_interval);
        ^
   drivers/staging/gasket/apex_driver.c:286:12: note: Shadowed declaration
   static int temp_poll_interval =3D DEFAULT_APEX_TEMP_POLL_INTERVAL;
              ^
   drivers/staging/gasket/apex_driver.c:1027:6: note: Shadow variable
    int temp_poll_interval =3D atomic_read(&apex_dev->temp_poll_interval);
        ^

vim +/temp_poll_interval +907 drivers/staging/gasket/apex_driver.c

   867	=

   868	static void check_temperature_work_handler(struct work_struct *work)=
 {
   869		int i;
   870		u32 adc_temp, clk_div, tmp;
   871		const u32 mask =3D ((1 << 2) - 1) << 28;
   872		struct apex_dev *apex_dev =3D
   873			container_of(work, struct apex_dev,
   874				     check_temperature_work.work);
   875		struct gasket_dev *gasket_dev =3D apex_dev->gasket_dev_ptr;
   876	=

   877		mutex_lock(&gasket_dev->mutex);
   878	=

   879		/* Read current temperature */
   880		adc_temp =3D gasket_dev_read_32(gasket_dev, APEX_BAR_INDEX,
   881					      APEX_BAR2_REG_OMC0_DC);
   882		adc_temp =3D (adc_temp >> 16) & ((1 << 10) - 1);
   883	=

   884		/* Find closest trip point
   885		   Note: that adc values are in descending order */
   886		for (i =3D ARRAY_SIZE(apex_dev->adc_trip_points) - 1; i >=3D 0; --i=
) {
   887			if (adc_temp <=3D apex_dev->adc_trip_points[i])
   888				break;
   889		}
   890		/* Compute divider value and shift into appropriate bit location */
   891		clk_div =3D (i + 1) << 28;
   892	=

   893		/* Modify gcb clk divider if it's different from current one */
   894		tmp =3D gasket_dev_read_32(gasket_dev, APEX_BAR_INDEX,
   895					 APEX_BAR2_REG_SCU_3);
   896		if (clk_div !=3D (tmp & mask)) {
   897			tmp =3D (tmp & ~mask) | clk_div;
   898			gasket_dev_write_32(gasket_dev, tmp, APEX_BAR_INDEX,
   899					    APEX_BAR2_REG_SCU_3);
   900			dev_warn(gasket_dev->dev,
   901				 "Apex performance %sthrottled due to temperature\n",
   902				 i =3D=3D -1 ? "not " : "");
   903		}
   904	=

   905		mutex_unlock(&gasket_dev->mutex);
   906	=

 > 907		int temp_poll_interval =3D atomic_read(&apex_dev->temp_poll_interva=
l);
   908		if (temp_poll_interval > 0)
   909			schedule_delayed_work(&apex_dev->check_temperature_work,
   910					      msecs_to_jiffies(temp_poll_interval));
   911	}
   912	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1742135149129651975==--

