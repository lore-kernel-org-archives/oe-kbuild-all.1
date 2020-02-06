Content-Type: multipart/mixed; boundary="===============7347246638590264899=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 11029/12352] drivers/watchdog/da9062_wdt.c:155:8: error: implicit declaration of function 'i2c_smbus_write_byte_data'; did you mean 'i2c_set_clientdata'?
Date: Thu, 06 Feb 2020 21:12:55 +0800
Message-ID: <1aa0e001-0f9e-81c2-0b28-b08e8728217a@intel.com>
In-Reply-To: <20200206090933.tono54lnq6piqhzs@pengutronix.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7347246638590264899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/6/2020 5:09 PM, Marco Felsch wrote:
> Hi,
>
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
> this is a false positive due to the COMPILE_TEST ability.
>
> Regards,
>    Marco

Hi Marco,

Thanks for the clarification, we'll take a look.

Best Regards,
Rong Chen

>
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
>
>

--===============7347246638590264899==--

