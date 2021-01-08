Content-Type: multipart/mixed; boundary="===============4913543063564984808=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [net-next 19/19] can: flexcan: add CAN wakeup function for i.MX8QM
Date: Fri, 08 Jan 2021 15:07:42 +0800
Message-ID: <42ec4ab0-b544-e7d7-d5e9-7609cb2273d3@intel.com>
In-Reply-To: <13f12660-cb33-d610-a933-1e3459791159@pengutronix.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4913543063564984808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/8/21 5:22 AM, Marc Kleine-Budde wrote:
> On 1/7/21 9:07 PM, kernel test robot wrote:
>> Hi Marc,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on net-next/master]
>>
>> url:    https://github.com/0day-ci/linux/commits/Marc-Kleine-Budde/can-t=
can4x5x-replace-DEVICE_NAME-by-KBUILD_MODNAME/20210107-184956
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.g=
it 3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
>> config: m68k-allmodconfig (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/0day-ci/linux/commit/90434a61388963ddee49d=
0c805226dd4b56df274
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Marc-Kleine-Budde/can-tcan4x5x=
-replace-DEVICE_NAME-by-KBUILD_MODNAME/20210107-184956
>>          git checkout 90434a61388963ddee49d0c805226dd4b56df274
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Dm68k
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> ERROR: modpost: "imx_scu_get_handle" [drivers/net/can/flexcan.ko] unde=
fined!
> Another false positive, due to the old net-next/master base.
>
> Marc
>

Hi Marc,

Sorry for the inconvenience, we'll take a look at this problem.

Best Regards,
Rong Chen
--===============4913543063564984808==--

