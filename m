Content-Type: multipart/mixed; boundary="===============3312913805968074200=="
MIME-Version: 1.0
From: Guenter Roeck <linux@roeck-us.net>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 11029/12352] drivers/watchdog/da9062_wdt.c:155:8: error: implicit declaration of function 'i2c_smbus_write_byte_data'; did you mean 'i2c_set_clientdata'?
Date: Thu, 06 Feb 2020 06:39:59 -0800
Message-ID: <e09d882f-b755-62e8-f63f-58f61eb3b636@roeck-us.net>
In-Reply-To: <20200206090933.tono54lnq6piqhzs@pengutronix.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3312913805968074200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/6/20 1:09 AM, Marco Felsch wrote:
> Hi,
> =

> On 20-02-06 06:08, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
>> head:   14b549456391a8b8f812529896b2690c16349734
>> commit: 057b52b4b3d58f4ee5944171da50f77b00a1bb0d [11029/12352] watchdog:=
 da9062: make restart handler atomic safe
>> config: x86_64-randconfig-d002-20200206 (attached as .config)
>> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
>> reproduce:
>>          git checkout 057b52b4b3d58f4ee5944171da50f77b00a1bb0d
>>          # save the attached .config to linux build tree
>>          make ARCH=3Dx86_64
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/watchdog/da9062_wdt.c: In function 'da9062_wdt_restart':
>>>> drivers/watchdog/da9062_wdt.c:155:8: error: implicit declaration of fu=
nction 'i2c_smbus_write_byte_data'; did you mean 'i2c_set_clientdata'? [-We=
rror=3Dimplicit-function-declaration]
>>       ret =3D i2c_smbus_write_byte_data(client, DA9062AA_CONTROL_F,
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~
>>             i2c_set_clientdata
>>     cc1: some warnings being treated as errors
> =

> this is a false positive due to the COMPILE_TEST ability.
> =


It depends - COMPILE_TEST means that the file can be compiled even without
MFD_DA9062 enabled, so the hard dependency on I2C should be specified
explicitly (to avoid building the file on an architecture which does not
support I2C). But it does appear that this configuration explicitly enables
COMPILE_TEST and disables I2C, which isn't exactly what COMPILE_TEST is
supposed to be used for.

Guenter

> Regards,
>    Marco
> =

>> vim +155 drivers/watchdog/da9062_wdt.c
>>
>>     146	=

>>     147	static int da9062_wdt_restart(struct watchdog_device *wdd, unsig=
ned long action,
>>     148				      void *data)
>>     149	{
>>     150		struct da9062_watchdog *wdt =3D watchdog_get_drvdata(wdd);
>>     151		struct i2c_client *client =3D to_i2c_client(wdt->hw->dev);
>>     152		int ret;
>>     153	=

>>     154		/* Don't use regmap because it is not atomic safe */
>>   > 155		ret =3D i2c_smbus_write_byte_data(client, DA9062AA_CONTROL_F,
>>     156						DA9062AA_SHUTDOWN_MASK);
>>     157		if (ret < 0)
>>     158			dev_alert(wdt->hw->dev, "Failed to shutdown (err =3D %d)\n",
>>     159				  ret);
>>     160	=

>>     161		/* wait for reset to assert... */
>>     162		mdelay(500);
>>     163	=

>>     164		return ret;
>>     165	}
>>     166	=

>>
>> ---
>> 0-DAY kernel test infrastructure                 Open Source Technology =
Center
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Cor=
poration
> =

> =

>=20

--===============3312913805968074200==--

